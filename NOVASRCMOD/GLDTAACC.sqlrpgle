**FREE
//==============================================================================
// Modulo               : GLDTAACC
// Descripcion          : Acceso a datos de cuentas mayores. Encapsula la
//                         consulta a GLBLNVW (GLBLN + GLMST + CCDSC) aplicando
//                         los filtros de ejecucion (banco, sucursal, moneda y
//                         rango de cuenta contable) para RF-01/RF-02.
//
//                         Patron restart-key: cada llamada a GLACCNEXT abre,
//                         lee UNA fila y cierra su propio cursor. Esto evita
//                         compartir estado de cursor entre procedimientos, lo
//                         cual no esta soportado en modulos de service program
//                         con CLOSQLCSR(*ENDMOD) en IBM i.
// Service Program      : GLDATSRV
// Hecho por            : Isaac Rojas
// Fecha                : 2026-06-13
// Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
//==============================================================================
ctl-opt nomain;

exec sql SET OPTION COMMIT=*NONE, CLOSQLCSR=*ENDMOD;

// Variables de modulo: filtros de ejecucion y clave de reinicio para
// la paginacion de 1 fila por llamada de GLACCNEXT.
dcl-s wCCBanco    varchar(20);
dcl-s wCCSucursal varchar(20);
dcl-s wCCMoneda   varchar(20);
dcl-s wCCCtaIni   varchar(24);
dcl-s wCCCtaFin   varchar(24);
dcl-s wCCLastKey  varchar(24); // ultima CUENTA_CONTABLE devuelta; '' = inicio

//------------------------------------------------------------------
// GLACCINI: Guarda los filtros en variables de modulo y resetea la
//           clave de reinicio para empezar desde el primer registro.
//------------------------------------------------------------------
dcl-proc GLACCINI export;
  dcl-pi *n;
    pBanco    varchar(20) const;
    pSucursal varchar(20) const;
    pMoneda   varchar(20) const;
    pCtaIni   varchar(24) const;
    pCtaFin   varchar(24) const;
  end-pi;

  wCCBanco    = pBanco;
  wCCSucursal = pSucursal;
  wCCMoneda   = pMoneda;
  wCCCtaIni   = pCtaIni;
  wCCCtaFin   = pCtaFin;
  wCCLastKey  = '';
end-proc;

//------------------------------------------------------------------
// GLACCNEXT: Recupera la siguiente cuenta mayor usando restart-key.
//            Abre, lee UNA fila mayor que la ultima clave vista y
//            cierra el cursor en la misma llamada. Devuelve *off al
//            agotar el resultado.
//------------------------------------------------------------------
dcl-proc GLACCNEXT export;
  dcl-pi *n ind;
    pBanco       varchar(20);
    pSucursal    varchar(20);
    pMoneda      varchar(20);
    pCtaCont     varchar(24);
    pDescCta     varchar(120);
    pNatCta      varchar(20);
    pNivCta      varchar(50);
    pCentroCosto varchar(20);
    pDescCC      varchar(120);
    pSaldoAct    packed(18:2);
    pFchProc     timestamp;
    pEstReg      char(1);
  end-pi;

  dcl-s wNivCtaInd  int(5);
  dcl-s wCentCCInd  int(5);
  dcl-s wDescCCInd  int(5);
  dcl-s wFchProcInd int(5);
  dcl-s wFetchStt   char(5);

  // CCURSOR local a este procedimiento: OPEN+FETCH+CLOSE en cada llamada.
  // La condicion CUENTA_CONTABLE > :wCCLastKey pagina al siguiente registro
  // despues de la ultima clave devuelta. Con wCCLastKey='' (primera llamada),
  // '' < cualquier cuenta no vacia, por lo que retorna el primer registro.
  exec sql
    DECLARE CCURSOR CURSOR FOR
      SELECT CODIGO_BANCO, CODIGO_SUCURSAL, CODIGO_MONEDA, CUENTA_CONTABLE,
             DESCRIPCION_CUENTA, NATURALEZA_CUENTA, NIVEL_CUENTA,
             CENTRO_COSTO, DESCRIPCION_CENTRO_COSTO, SALDO_ACTUAL,
             FECHA_PROCESO_SISTEMA, ESTADO_REGISTRO
        FROM IROJAS941.GLBLNVW
        WHERE (CODIGO_BANCO    = :wCCBanco    OR :wCCBanco    = '')
          AND (CODIGO_SUCURSAL = :wCCSucursal OR :wCCSucursal = '')
          AND (CODIGO_MONEDA   = :wCCMoneda   OR :wCCMoneda   = '')
          AND CUENTA_CONTABLE  > :wCCLastKey
          AND (CUENTA_CONTABLE >= :wCCCtaIni  OR :wCCCtaIni   = '')
          AND (CUENTA_CONTABLE <= :wCCCtaFin  OR :wCCCtaFin   = '')
          AND ESTADO_REGISTRO = 'A'
        ORDER BY CODIGO_BANCO, CODIGO_SUCURSAL, CODIGO_MONEDA, CUENTA_CONTABLE
        FETCH FIRST 1 ROW ONLY;

  exec sql OPEN CCURSOR;

  exec sql
    FETCH NEXT FROM CCURSOR
      INTO :pBanco, :pSucursal, :pMoneda, :pCtaCont,
           :pDescCta, :pNatCta, :pNivCta :wNivCtaInd,
           :pCentroCosto :wCentCCInd, :pDescCC :wDescCCInd,
           :pSaldoAct, :pFchProc :wFchProcInd, :pEstReg;

  wFetchStt = SQLSTT;
  exec sql CLOSE CCURSOR;

  if wFetchStt <> '00000' and wFetchStt <> '01000';
    return *off;
  endif;

  // Avanza la clave de reinicio para la proxima llamada
  wCCLastKey = pCtaCont;

  if wNivCtaInd < 0;
    pNivCta = '';
  endif;
  if wCentCCInd < 0;
    pCentroCosto = '';
  endif;
  if wDescCCInd < 0;
    pDescCC = '';
  endif;
  if wFchProcInd < 0;
    pFchProc = *loval;
  endif;

  return *on;
end-proc;

//------------------------------------------------------------------
// GLACCFIN: Sin operacion — el cursor se cierra dentro de GLACCNEXT.
//------------------------------------------------------------------
dcl-proc GLACCFIN export;
  dcl-pi *n end-pi;
end-proc;

**FREE
//==============================================================================
// Modulo               : GLDTAACC
// Descripcion          : Acceso a datos de cuentas mayores. Encapsula la
//                         consulta a GLBLNVW (GLBLN + GLMST + CCDSC) aplicando
//                         los filtros de ejecucion (banco, sucursal, moneda y
//                         rango de cuenta contable) para RF-01/RF-02.
// Service Program      : GLDATSRV
// Hecho por            : Isaac Rojas
// Fecha                : 2026-06-13
// Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
//==============================================================================
ctl-opt nomain;

exec sql SET OPTION COMMIT=*NONE, CLOSQLCSR=*ENDMOD;

//------------------------------------------------------------------
// GLACCINI: Abre el cursor de cuentas mayores (GLBLNVW) aplicando los
//           filtros de ejecucion. Un parametro vacio ('') significa
//           "sin filtro" para banco/sucursal/moneda/rango de cuenta.
//------------------------------------------------------------------
dcl-proc GLACCINI export;
  dcl-pi *n;
    pBanco    varchar(20) const;
    pSucursal varchar(20) const;
    pMoneda   varchar(20) const;
    pCtaIni   varchar(24) const;
    pCtaFin   varchar(24) const;
  end-pi;

  exec sql
    DECLARE CCURSOR CURSOR FOR
      SELECT CODIGO_BANCO, CODIGO_SUCURSAL, CODIGO_MONEDA, CUENTA_CONTABLE,
             DESCRIPCION_CUENTA, NATURALEZA_CUENTA, NIVEL_CUENTA,
             CENTRO_COSTO, DESCRIPCION_CENTRO_COSTO, SALDO_ACTUAL,
             FECHA_PROCESO_SISTEMA, ESTADO_REGISTRO
        FROM IROJAS941.GLBLNVW
        WHERE (CODIGO_BANCO    = :pBanco    OR :pBanco    = '')
          AND (CODIGO_SUCURSAL = :pSucursal OR :pSucursal = '')
          AND (CODIGO_MONEDA   = :pMoneda   OR :pMoneda   = '')
          AND (CUENTA_CONTABLE >= :pCtaIni  OR :pCtaIni   = '')
          AND (CUENTA_CONTABLE <= :pCtaFin  OR :pCtaFin   = '')
          AND ESTADO_REGISTRO = 'A'
        ORDER BY CODIGO_BANCO, CODIGO_SUCURSAL, CODIGO_MONEDA, CUENTA_CONTABLE;

  exec sql OPEN CCURSOR;
end-proc;

//------------------------------------------------------------------
// GLACCNEXT: Recupera la siguiente cuenta mayor del cursor abierto por
//            GLACCINI. Devuelve *off cuando no hay mas filas.
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

  dcl-s wNivCtaInd int(5);
  dcl-s wCentCCInd int(5);
  dcl-s wDescCCInd int(5);
  dcl-s wFchProcInd int(5);

  exec sql
    FETCH NEXT FROM CCURSOR
      INTO :pBanco, :pSucursal, :pMoneda, :pCtaCont,
           :pDescCta, :pNatCta, :pNivCta :wNivCtaInd,
           :pCentroCosto :wCentCCInd, :pDescCC :wDescCCInd,
           :pSaldoAct, :pFchProc :wFchProcInd, :pEstReg;

  if SQLSTT = '02000';
    return *off;
  endif;

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
// GLACCFIN: Cierra el cursor de cuentas mayores abierto por GLACCINI.
//------------------------------------------------------------------
dcl-proc GLACCFIN export;
  dcl-pi *n end-pi;

  exec sql CLOSE CCURSOR;
end-proc;

**FREE
//==============================================================================
// Modulo               : GLMOVACC
// Descripcion          : Acceso a datos de movimientos. Encapsula las
//                         consultas a TRANS (historico), TTRAN (transacciones
//                         del dia) y TRDSC (descripciones) por cuenta y fecha
//                         de proceso, para soportar el calculo de balance
//                         (RF-02) y la deteccion de partidas conciliatorias
//                         (RF-03).
//
//                         Patron restart-key para PCURSOR: cada llamada a
//                         GLMOVPNXT abre, lee UNA fila y cierra su propio
//                         cursor. Mismo motivo que GLDTAACC: cursor state
//                         no se preserva entre procedimientos distintos en
//                         modules de service program con CLOSQLCSR(*ENDMOD).
// Service Program      : GLDATSRV
// Hecho por            : Isaac Rojas
// Fecha                : 2026-06-13
// Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
//==============================================================================
ctl-opt nomain;

exec sql SET OPTION COMMIT=*NONE, CLOSQLCSR=*ENDMOD;

// Variables de modulo para los filtros de PCURSOR y clave de reinicio.
dcl-s wPCBanco    varchar(20);
dcl-s wPCSucursal varchar(20);
dcl-s wPCMoneda   varchar(20);
dcl-s wPCCtaCont  varchar(24);
dcl-s wPCFecha    date;
dcl-s wPCLastNRR  varchar(30); // ultimo NUMERO_REGISTRO_RELATIVO devuelto; '' = inicio

//------------------------------------------------------------------
// GLMOVTOT: Totales de movimientos historicos (TRANS) de una cuenta
//           para la fecha de proceso: debitos, creditos, cantidad de
//           movimientos y marcas de primer/ultimo movimiento.
//------------------------------------------------------------------
dcl-proc GLMOVTOT export;
  dcl-pi *n;
    pBanco     varchar(20) const;
    pSucursal  varchar(20) const;
    pMoneda    varchar(20) const;
    pCtaCont   varchar(24) const;
    pFecha     date const;
    pDebitos   packed(18:2);
    pCreditos  packed(18:2);
    pCantidad  int(10);
    pPrimerMov timestamp;
    pUltimoMov timestamp;
  end-pi;

  dcl-s wPrimerInd int(5);
  dcl-s wUltimoInd int(5);

  exec sql
    SELECT
        COALESCE(SUM(CASE WHEN DEBITO_CREDITO = 'D' THEN MONTO ELSE 0 END), 0),
        COALESCE(SUM(CASE WHEN DEBITO_CREDITO = 'C' THEN MONTO ELSE 0 END), 0),
        COUNT(*),
        MIN(TIMESTAMP(FECHA_OPERACION, HORA_OPERACION)),
        MAX(TIMESTAMP(FECHA_OPERACION, HORA_OPERACION))
      INTO :pDebitos, :pCreditos, :pCantidad,
           :pPrimerMov :wPrimerInd, :pUltimoMov :wUltimoInd
      FROM IROJAS941.TRANS
      WHERE CODIGO_BANCO = :pBanco
        AND CODIGO_SUCURSAL = :pSucursal
        AND CODIGO_MONEDA = :pMoneda
        AND CUENTA_CONTABLE = :pCtaCont
        AND FECHA_OPERACION = :pFecha
        AND ESTADO_REGISTRO = 'A';

  if wPrimerInd < 0;
    pPrimerMov = *loval;
  endif;
  if wUltimoInd < 0;
    pUltimoMov = *loval;
  endif;
end-proc;

//------------------------------------------------------------------
// GLMOVDTOT: Totales de movimientos del dia (TTRAN) de una cuenta para
//            la fecha de proceso: debitos, creditos y cantidad.
//------------------------------------------------------------------
dcl-proc GLMOVDTOT export;
  dcl-pi *n;
    pBanco       varchar(20) const;
    pSucursal    varchar(20) const;
    pMoneda      varchar(20) const;
    pCtaCont     varchar(24) const;
    pFecha       date const;
    pDebitosDia  packed(18:2);
    pCreditosDia packed(18:2);
    pCantidadDia int(10);
  end-pi;

  exec sql
    SELECT
        COALESCE(SUM(CASE WHEN DEBITO_CREDITO = 'D' THEN MONTO ELSE 0 END), 0),
        COALESCE(SUM(CASE WHEN DEBITO_CREDITO = 'C' THEN MONTO ELSE 0 END), 0),
        COUNT(*)
      INTO :pDebitosDia, :pCreditosDia, :pCantidadDia
      FROM IROJAS941.TTRAN
      WHERE CODIGO_BANCO = :pBanco
        AND CODIGO_SUCURSAL = :pSucursal
        AND CODIGO_MONEDA = :pMoneda
        AND CUENTA_CONTABLE = :pCtaCont
        AND FECHA = :pFecha
        AND ESTADO_REGISTRO = 'A';
end-proc;

//------------------------------------------------------------------
// GLMOVTCNT: Cuenta de registros fuente (TRANS/TTRAN/TRDSC) de una
//            cuenta para la fecha de proceso, usados en
//            trazabilidad.registrosFuente (RF-07).
//------------------------------------------------------------------
dcl-proc GLMOVTCNT export;
  dcl-pi *n;
    pBanco    varchar(20) const;
    pSucursal varchar(20) const;
    pMoneda   varchar(20) const;
    pCtaCont  varchar(24) const;
    pFecha    date const;
    pCntTrans int(10);
    pCntTtran int(10);
    pCntTrdsc int(10);
  end-pi;

  exec sql
    SELECT COUNT(*)
      INTO :pCntTrans
      FROM IROJAS941.TRANS
      WHERE CODIGO_BANCO = :pBanco
        AND CODIGO_SUCURSAL = :pSucursal
        AND CODIGO_MONEDA = :pMoneda
        AND CUENTA_CONTABLE = :pCtaCont
        AND FECHA_OPERACION = :pFecha;

  exec sql
    SELECT COUNT(*)
      INTO :pCntTtran
      FROM IROJAS941.TTRAN
      WHERE CODIGO_BANCO = :pBanco
        AND CODIGO_SUCURSAL = :pSucursal
        AND CODIGO_MONEDA = :pMoneda
        AND CUENTA_CONTABLE = :pCtaCont
        AND FECHA = :pFecha;

  exec sql
    SELECT COUNT(*)
      INTO :pCntTrdsc
      FROM IROJAS941.TRDSC D
      WHERE D.NUMERO_REGISTRO_RELATIVO IN (
        SELECT T.NUMERO_REGISTRO_RELATIVO
          FROM IROJAS941.TRANS T
          WHERE T.CODIGO_BANCO = :pBanco
            AND T.CODIGO_SUCURSAL = :pSucursal
            AND T.CODIGO_MONEDA = :pMoneda
            AND T.CUENTA_CONTABLE = :pCtaCont
            AND T.FECHA_OPERACION = :pFecha
      );
end-proc;

//------------------------------------------------------------------
// GLMOVPINI: Guarda los filtros en variables de modulo y resetea la
//            clave de reinicio para la proxima iteracion con GLMOVPNXT.
//------------------------------------------------------------------
dcl-proc GLMOVPINI export;
  dcl-pi *n;
    pBanco    varchar(20) const;
    pSucursal varchar(20) const;
    pMoneda   varchar(20) const;
    pCtaCont  varchar(24) const;
    pFecha    date const;
  end-pi;

  wPCBanco    = pBanco;
  wPCSucursal = pSucursal;
  wPCMoneda   = pMoneda;
  wPCCtaCont  = pCtaCont;
  wPCFecha    = pFecha;
  wPCLastNRR  = '';
end-proc;

//------------------------------------------------------------------
// GLMOVPNXT: Recupera la siguiente partida conciliatoria usando
//            restart-key. Abre, lee UNA fila de TTRAN con NRR mayor
//            que el ultimo visto y cierra el cursor en la misma
//            llamada. Devuelve *off al agotar el resultado.
//------------------------------------------------------------------
dcl-proc GLMOVPNXT export;
  dcl-pi *n ind;
    pNumReg   varchar(30);
    pTipoMov  varchar(20);
    pDbCr     char(1);
    pMonto    packed(18:2);
    pFchVal   date;
    pRefExt   varchar(40);
    pEstado   varchar(20);
    pTipoDesc varchar(20);
    pTexto    varchar(200);
  end-pi;

  dcl-s wTipoDescInd int(5);
  dcl-s wTextoInd    int(5);
  dcl-s wFetchStt    char(5);

  // PCURSOR local a este procedimiento: OPEN+FETCH+CLOSE en cada llamada.
  // T.NUMERO_REGISTRO_RELATIVO > :wPCLastNRR pagina al siguiente registro.
  // Con wPCLastNRR='' (primera llamada) retorna el primer NRR no vacio.
  exec sql
    DECLARE PCURSOR CURSOR FOR
      SELECT T.NUMERO_REGISTRO_RELATIVO, T.TIPO_MOVIMIENTO, T.DEBITO_CREDITO,
             T.MONTO, T.FECHA_VALOR, T.REFERENCIA_EXTERNA, T.ESTADO_TRANSACCION,
             D.TIPO_DESCRIPCION, D.TEXTO_DESCRIPCION
        FROM IROJAS941.TTRAN T
        LEFT JOIN IROJAS941.TRDSC D
          ON D.NUMERO_REGISTRO_RELATIVO = T.NUMERO_REGISTRO_RELATIVO
         AND D.SECUENCIA = (
               SELECT MIN(D2.SECUENCIA)
                 FROM IROJAS941.TRDSC D2
                 WHERE D2.NUMERO_REGISTRO_RELATIVO = T.NUMERO_REGISTRO_RELATIVO
             )
        WHERE T.CODIGO_BANCO    = :wPCBanco
          AND T.CODIGO_SUCURSAL = :wPCSucursal
          AND T.CODIGO_MONEDA   = :wPCMoneda
          AND T.CUENTA_CONTABLE = :wPCCtaCont
          AND T.FECHA           = :wPCFecha
          AND T.ESTADO_REGISTRO = 'A'
          AND T.NUMERO_REGISTRO_RELATIVO > :wPCLastNRR
        ORDER BY T.NUMERO_REGISTRO_RELATIVO
        FETCH FIRST 1 ROW ONLY;

  exec sql OPEN PCURSOR;

  exec sql
    FETCH NEXT FROM PCURSOR
      INTO :pNumReg, :pTipoMov, :pDbCr, :pMonto, :pFchVal, :pRefExt, :pEstado,
           :pTipoDesc :wTipoDescInd, :pTexto :wTextoInd;

  wFetchStt = SQLSTT;
  exec sql CLOSE PCURSOR;

  if wFetchStt <> '00000' and wFetchStt <> '01000';
    return *off;
  endif;

  // Avanza la clave de reinicio para la proxima llamada
  wPCLastNRR = pNumReg;

  if wTipoDescInd < 0;
    pTipoDesc = '';
  endif;
  if wTextoInd < 0;
    pTexto = '';
  endif;

  return *on;
end-proc;

//------------------------------------------------------------------
// GLMOVPFIN: Sin operacion — el cursor se cierra dentro de GLMOVPNXT.
//------------------------------------------------------------------
dcl-proc GLMOVPFIN export;
  dcl-pi *n end-pi;
end-proc;

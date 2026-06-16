**FREE
//==============================================================================
// Modulo               : GLMOVACC
// Descripcion          : Acceso a datos de movimientos. Encapsula las
//                         consultas a TRANS (historico), TTRAN (transacciones
//                         del dia) y TRDSC (descripciones) por cuenta y fecha
//                         de proceso, para soportar el calculo de balance
//                         (RF-02) y la deteccion de partidas conciliatorias
//                         (RF-03).
// Service Program      : GLDATSRV
// Hecho por            : Isaac Rojas
// Fecha                : 2026-06-13
// Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
//==============================================================================
ctl-opt nomain;

exec sql SET OPTION COMMIT=*NONE, CLOSQLCSR=*ENDMOD;

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
// GLMOVPINI: Abre el cursor de partidas conciliatorias (TTRAN del dia
//            de una cuenta, con su descripcion en TRDSC si existe).
//------------------------------------------------------------------
dcl-proc GLMOVPINI export;
  dcl-pi *n;
    pBanco    varchar(20) const;
    pSucursal varchar(20) const;
    pMoneda   varchar(20) const;
    pCtaCont  varchar(24) const;
    pFecha    date const;
  end-pi;

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
        WHERE T.CODIGO_BANCO = :pBanco
          AND T.CODIGO_SUCURSAL = :pSucursal
          AND T.CODIGO_MONEDA = :pMoneda
          AND T.CUENTA_CONTABLE = :pCtaCont
          AND T.FECHA = :pFecha
          AND T.ESTADO_REGISTRO = 'A'
        ORDER BY T.NUMERO_REGISTRO_RELATIVO;

  exec sql OPEN PCURSOR;
end-proc;

//------------------------------------------------------------------
// GLMOVPNXT: Recupera la siguiente partida conciliatoria del cursor
//            abierto por GLMOVPINI. Devuelve *off cuando no hay mas
//            filas.
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

  exec sql
    FETCH NEXT FROM PCURSOR
      INTO :pNumReg, :pTipoMov, :pDbCr, :pMonto, :pFchVal, :pRefExt, :pEstado,
           :pTipoDesc :wTipoDescInd, :pTexto :wTextoInd;

  if SQLSTT = '02000';
    return *off;
  endif;

  if wTipoDescInd < 0;
    pTipoDesc = '';
  endif;
  if wTextoInd < 0;
    pTexto = '';
  endif;

  return *on;
end-proc;

//------------------------------------------------------------------
// GLMOVPFIN: Cierra el cursor de partidas conciliatorias abierto por
//            GLMOVPINI.
//------------------------------------------------------------------
dcl-proc GLMOVPFIN export;
  dcl-pi *n end-pi;

  exec sql CLOSE PCURSOR;
end-proc;

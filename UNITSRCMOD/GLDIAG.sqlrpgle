**FREE
//==============================================================================
// Programa             : GLDIAG
// Descripcion          : Programa temporal de diagnostico para investigar el
//                         hang de GLMOVPNXT (cursor PCURSOR en GLMOVACC).
//                         Solo realiza consultas de conteo simples sobre
//                         TTRAN/TRDSC para descartar volumen de datos como
//                         causa, sin reproducir el JOIN problematico.
// Hecho por            : Isaac Rojas
// Fecha                : 2026-06-15
// Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
//==============================================================================
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-s wRuta      varchar(512);
dcl-s wLinea     varchar(2000);
dcl-s wCntTTRAN  int(10);
dcl-s wCntTRDSC  int(10);
dcl-s wCntTTRAN1 int(10);
dcl-s wTestNum   varchar(30);
dcl-s wTestTipo  varchar(20);

wRuta = '/home/IROJAS94/conciliacion/gldiag_resultado.txt';

exec sql
  CALL QSYS2.IFS_WRITE_UTF8(
    PATH_NAME   => :wRuta,
    LINE        => '',
    OVERWRITE   => 'REPLACE',
    END_OF_LINE => 'NONE');

exec sql
  SELECT COUNT(*) INTO :wCntTTRAN FROM IROJAS941.TTRAN;
wLinea = 'CNT_TTRAN=' + %char(wCntTTRAN);
exec sql CALL QSYS2.IFS_WRITE_UTF8(PATH_NAME => :wRuta, LINE => :wLinea);

exec sql
  SELECT COUNT(*) INTO :wCntTRDSC FROM IROJAS941.TRDSC;
wLinea = 'CNT_TRDSC=' + %char(wCntTRDSC);
exec sql CALL QSYS2.IFS_WRITE_UTF8(PATH_NAME => :wRuta, LINE => :wLinea);

exec sql
  SELECT COUNT(*) INTO :wCntTTRAN1
    FROM IROJAS941.TTRAN
    WHERE CODIGO_BANCO='001' AND CODIGO_SUCURSAL='01' AND CODIGO_MONEDA='USD'
      AND CUENTA_CONTABLE='1000000001' AND FECHA='2026-06-30'
      AND ESTADO_REGISTRO='A';
wLinea = 'CNT_TTRAN_1000000001=' + %char(wCntTTRAN1);
exec sql CALL QSYS2.IFS_WRITE_UTF8(PATH_NAME => :wRuta, LINE => :wLinea);

// Prueba aislada del cursor PCURSOR (GLMOVACC.GLMOVPINI) para la cuenta
// 1000000001 (0 filas esperadas en TTRAN), para descartar el JOIN/subquery
// correlacionada como causa del hang antes de probar con filas reales.
wLinea = 'PCURSOR_TEST_START cuenta=1000000001';
exec sql CALL QSYS2.IFS_WRITE_UTF8(PATH_NAME => :wRuta, LINE => :wLinea);

exec sql
  DECLARE PTEST1 CURSOR FOR
    SELECT T.NUMERO_REGISTRO_RELATIVO, T.TIPO_MOVIMIENTO
      FROM IROJAS941.TTRAN T
      LEFT JOIN IROJAS941.TRDSC D
        ON D.NUMERO_REGISTRO_RELATIVO = T.NUMERO_REGISTRO_RELATIVO
       AND D.SECUENCIA = (
             SELECT MIN(D2.SECUENCIA)
               FROM IROJAS941.TRDSC D2
               WHERE D2.NUMERO_REGISTRO_RELATIVO = T.NUMERO_REGISTRO_RELATIVO
           )
      WHERE T.CODIGO_BANCO = '001'
        AND T.CODIGO_SUCURSAL = '01'
        AND T.CODIGO_MONEDA = 'USD'
        AND T.CUENTA_CONTABLE = '1000000004'
        AND T.FECHA = '2026-06-30'
        AND T.ESTADO_REGISTRO = 'A'
      ORDER BY T.NUMERO_REGISTRO_RELATIVO;

exec sql OPEN PTEST1;
wLinea = 'PCURSOR_TEST_OPEN sqlstt=' + SQLSTT;
exec sql CALL QSYS2.IFS_WRITE_UTF8(PATH_NAME => :wRuta, LINE => :wLinea);

exec sql FETCH NEXT FROM PTEST1 INTO :wTestNum, :wTestTipo;
wLinea = 'PCURSOR_TEST_FETCH sqlstt=' + SQLSTT;
exec sql CALL QSYS2.IFS_WRITE_UTF8(PATH_NAME => :wRuta, LINE => :wLinea);

exec sql CLOSE PTEST1;
wLinea = 'PCURSOR_TEST_END';
exec sql CALL QSYS2.IFS_WRITE_UTF8(PATH_NAME => :wRuta, LINE => :wLinea);

*inlr = *on;

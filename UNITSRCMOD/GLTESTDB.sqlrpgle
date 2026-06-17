**FREE
//==============================================================================
// GLTESTDB: Diagnostico SQL — muestra SQLSTT de cada operacion en 5250.
// Ejecutar: CALL PGM(IROJAS941/GLTESTDB) desde sesion 5250.
// Presionar Enter despues de cada DSPLY para ver el siguiente mensaje.
//==============================================================================
ctl-opt dftactgrp(*yes);

dcl-s wStt    char(5);
dcl-s wCnt    packed(15:0);
dcl-s wCuenta varchar(24);
dcl-s wMsg    char(52);

exec sql SET OPTION COMMIT=*NONE, CLOSQLCSR=*ENDMOD;

// 1. COUNT directo de GLBLN
exec sql SELECT COUNT(*) INTO :wCnt FROM IROJAS941.GLBLN;
wStt = SQLSTT;
wMsg = 'GLBLN cnt=' + %trim(%char(wCnt)) + ' stt=' + wStt;
dsply wMsg;

// 2. COUNT directo de GLBLNVW
exec sql SELECT COUNT(*) INTO :wCnt FROM IROJAS941.GLBLNVW;
wStt = SQLSTT;
wMsg = 'GLBLNVW cnt=' + %trim(%char(wCnt)) + ' stt=' + wStt;
dsply wMsg;

// 3. COUNT con filtro ESTADO_REGISTRO = 'A'
exec sql SELECT COUNT(*) INTO :wCnt
  FROM IROJAS941.GLBLNVW WHERE ESTADO_REGISTRO = 'A';
wStt = SQLSTT;
wMsg = 'VW_ESTA cnt=' + %trim(%char(wCnt)) + ' stt=' + wStt;
dsply wMsg;

// 4. OPEN cursor identico al de GLDTAACC
exec sql
  DECLARE DIAGCSR CURSOR FOR
    SELECT CUENTA_CONTABLE
      FROM IROJAS941.GLBLNVW
      WHERE ESTADO_REGISTRO = 'A'
      ORDER BY CUENTA_CONTABLE;

exec sql OPEN DIAGCSR;
wStt = SQLSTT;
wMsg = 'OPEN stt=' + wStt;
dsply wMsg;

// 5. FETCH primera fila
exec sql FETCH NEXT FROM DIAGCSR INTO :wCuenta;
wStt = SQLSTT;
wMsg = 'FETCH stt=' + wStt + ' val=' + %trim(wCuenta);
dsply wMsg;

exec sql CLOSE DIAGCSR;

*inlr = *on;

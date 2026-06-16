**FREE
//==============================================================================
// Programa             : TSTDRV
// Descripcion          : Driver de pruebas unitarias (RPGUnit) del proceso de
//                         conciliacion GLBLN. Invoca TSTBCRUN (GLBALCAL),
//                         TSTCCRUN (GLCONCIL) y TSTJBRUN (GLJSONBL), suma la
//                         cantidad de casos fallidos (wFallos) y escribe el
//                         detalle de cada caso en un archivo de resultados en
//                         IFS, conforme a NOVASRCTXT/PRUEBAS.txt seccion 2.
// Service Program      : TSTSRV (TSTBALCA, TSTCONCI, TSTJSONB)
// Hecho por            : Isaac Rojas
// Fecha                : 2026-06-15
// Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
//==============================================================================
ctl-opt dftactgrp(*no) actgrp(*new) bnddir('TSTBND');

dcl-pr TSTBCRUN int(10) extproc('TSTBCRUN');
  pDetalle varchar(2000);
end-pr;

dcl-pr TSTCCRUN int(10) extproc('TSTCCRUN');
  pDetalle varchar(2000);
end-pr;

dcl-pr TSTJBRUN int(10) extproc('TSTJBRUN');
  pDetalle varchar(2000);
end-pr;

dcl-s wDet1   varchar(2000);
dcl-s wDet2   varchar(2000);
dcl-s wDet3   varchar(2000);
dcl-s wFallos int(10);
dcl-s wRuta   varchar(512);
dcl-s wLinea  varchar(2020);

wFallos = TSTBCRUN(wDet1) + TSTCCRUN(wDet2) + TSTJBRUN(wDet3);

wRuta = '/home/IROJAS94/conciliacion/tstdrv_resultado.txt';

exec sql
  CALL QSYS2.IFS_WRITE_UTF8(
    PATH_NAME   => :wRuta,
    LINE        => '',
    OVERWRITE   => 'REPLACE',
    END_OF_LINE => 'NONE');

wLinea = 'wFallos=' + %char(wFallos);

exec sql
  CALL QSYS2.IFS_WRITE_UTF8(
    PATH_NAME   => :wRuta,
    LINE        => :wLinea,
    OVERWRITE   => 'APPEND',
    END_OF_LINE => 'LF');

exec sql
  CALL QSYS2.IFS_WRITE_UTF8(
    PATH_NAME   => :wRuta,
    LINE        => :wDet1,
    OVERWRITE   => 'APPEND',
    END_OF_LINE => 'NONE');

exec sql
  CALL QSYS2.IFS_WRITE_UTF8(
    PATH_NAME   => :wRuta,
    LINE        => :wDet2,
    OVERWRITE   => 'APPEND',
    END_OF_LINE => 'NONE');

exec sql
  CALL QSYS2.IFS_WRITE_UTF8(
    PATH_NAME   => :wRuta,
    LINE        => :wDet3,
    OVERWRITE   => 'APPEND',
    END_OF_LINE => 'NONE');

*inlr = *on;

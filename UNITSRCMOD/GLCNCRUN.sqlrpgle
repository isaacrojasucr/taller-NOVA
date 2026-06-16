**FREE
//==============================================================================
// Programa             : GLCNCRUN
// Descripcion          : Driver de prueba de extremo a extremo para GLCNC001.
//                         Invoca GLCNC001 (CALL PGM) con los parametros
//                         correspondientes a los datos de prueba de
//                         NOVASRCSQL/DATPRUEB.sql (banco='001', sucursal='01',
//                         moneda='USD', cuentas 1000000001..1000000008,
//                         fecha proceso 2026-06-30, tolerancia=50.00),
//                         publicando el JSON y la bitacora en IFS.
// Hecho por            : Isaac Rojas
// Fecha                : 2026-06-15
// Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
//==============================================================================
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-pr GLCNC001 extpgm('GLCNC001');
  pBanco      varchar(20) const;
  pSucursal   varchar(20) const;
  pMoneda     varchar(20) const;
  pCtaIni     varchar(24) const;
  pCtaFin     varchar(24) const;
  pFchProc    date const;
  pTolerancia packed(18:2) const;
  pUsuario    varchar(10) const;
  pAmbiente   varchar(10) const;
  pRutaJson   varchar(512) const;
  pRutaBitac  varchar(512) const;
end-pr;

GLCNC001(
  '001':
  '01':
  'USD':
  '1000000001':
  '1000000008':
  d'2026-06-30':
  50.00:
  'IROJAS94':
  'QA':
  '/home/IROJAS94/conciliacion/glcnc001_test.json':
  '/home/IROJAS94/conciliacion/glcnc001_test.txt');

*inlr = *on;

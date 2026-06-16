**FREE
//==============================================================================
// Modulo               : TSTJSONB
// Descripcion          : Pruebas unitarias de GLJSONBL (RF-05): estructura de
//                         los fragmentos JSON 'metadata', 'contexto',
//                         'incidentes' (escape de comillas) y 'cuentas'
//                         (booleanos excedeTolerancia/requiereRevision y
//                         acumulador de cuentas g_cta/GLJSNCCNT/GLJSNCGET).
// Service Program      : TSTSRV
// Hecho por            : Isaac Rojas
// Fecha                : 2026-06-13
// Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
//==============================================================================
ctl-opt nomain;

// GLOUTSRV - GLJSONBL
dcl-pr GLJSNINI extproc('GLJSNINI');
end-pr;

dcl-pr GLJSNMETA varchar(250) extproc('GLJSNMETA');
  pAmbiente varchar(10) const;
end-pr;

dcl-pr GLJSNCTX varchar(400) extproc('GLJSNCTX');
  pBanco    varchar(20) const;
  pSucursal varchar(20) const;
  pMoneda   varchar(20) const;
  pAnio     int(5) const;
  pMes      int(5) const;
  pFchCorte date const;
  pCtaDesde varchar(24) const;
  pCtaHasta varchar(24) const;
end-pr;

dcl-pr GLJSNPINI extproc('GLJSNPINI');
end-pr;

dcl-pr GLJSNCTA varchar(14000) extproc('GLJSNCTA');
  // cuentaMayor
  pBanco       varchar(20) const;
  pSucursal    varchar(20) const;
  pMoneda      varchar(20) const;
  pCtaCont     varchar(24) const;
  pDescCta     varchar(120) const;
  pNaturaleza  varchar(20) const;
  pNivelCta    varchar(50) const;
  pCentroCosto varchar(20) const;
  // saldos
  pSaldoIni    packed(18:2) const;
  pDebPeriodo  packed(18:2) const;
  pCredPeriodo packed(18:2) const;
  pSaldoCalc   packed(18:2) const;
  pSaldoFte    packed(18:2) const;
  pSaldoConc   packed(18:2) const;
  // resumenMovimientos
  pCantMov     int(10) const;
  pPrimerMov   timestamp const;
  pUltimoMov   timestamp const;
  // diferencias
  pDifNeta     packed(18:2) const;
  pDifAbs      packed(18:2) const;
  pTolerancia  packed(18:2) const;
  pExcedeTol   ind const;
  pMotivo      varchar(60) const;
  // estadoConciliacion
  pCodEstado   varchar(20) const;
  pDescEstado  varchar(60) const;
  pSeveridad   varchar(10) const;
  pRequiereRev ind const;
  // trazabilidad
  pHashCuenta  varchar(32) const;
  pCntTrans    int(10) const;
  pCntTrdsc    int(10) const;
  pCntTtran    int(10) const;
end-pr;

dcl-pr GLJSNCCNT int(10) extproc('GLJSNCCNT');
end-pr;

dcl-pr GLJSNCGET varchar(14000) extproc('GLJSNCGET');
  pIndice int(10) const;
end-pr;

dcl-pr GLJSNINC varchar(300) extproc('GLJSNINC');
  pCodigo    varchar(20) const;
  pTipo      varchar(20) const;
  pCuenta    varchar(24) const;
  pMensaje   varchar(120) const;
  pSeveridad varchar(10) const;
end-pr;

//------------------------------------------------------------------
// TSTJBRUN: Ejecuta los casos de prueba de GLJSONBL y devuelve la
//           cantidad de casos fallidos. El detalle de cada caso
//           (OK/FALLO) se devuelve en pDetalle, una linea por caso.
//------------------------------------------------------------------
dcl-proc TSTJBRUN export;
  dcl-pi *n int(10);
    pDetalle varchar(2000);
  end-pi;

  dcl-s wJson    varchar(14000);
  dcl-s wTs      timestamp;
  dcl-s wFallos  int(10) inz(0);

  pDetalle = '';
  wTs = %timestamp();

  // Caso 1: GLJSNMETA incluye ambiente y version de estructura
  wJson = GLJSNMETA('QA');
  if %scan('"ambiente":"QA"': wJson) > 0
     and %scan('"versionEstructura":"1.0.0"': wJson) > 0;
    pDetalle += 'TSTJB01 OK: metadata incluye ambiente y versionEstructura' + x'0A';
  else;
    wFallos += 1;
    pDetalle += 'TSTJB01 FALLO: metadata=' + %trim(wJson) + x'0A';
  endif;

  // Caso 2: GLJSNCTX incluye periodo (anio/mes) anidado en orden correcto
  wJson = GLJSNCTX('001': '01': 'USD': 2026: 6: %date('2026-06-30': *iso): '1000000000': '1999999999');
  if %scan('"periodo":{"anio":2026,"mes":6,': wJson) > 0;
    pDetalle += 'TSTJB02 OK: contexto incluye periodo anio/mes anidado' + x'0A';
  else;
    wFallos += 1;
    pDetalle += 'TSTJB02 FALLO: contexto=' + %trim(wJson) + x'0A';
  endif;

  // Caso 3: GLJSNINC escapa comillas dobles dentro del mensaje
  wJson = GLJSNINC('ERR-GL-001': 'DIFERENCIA_TOLERANCIA': '1010203':
                    'Cuenta "ahorros" con diferencia': 'ALTA');
  if %scan('\"': wJson) > 0;
    pDetalle += 'TSTJB03 OK: incidente escapa comillas dobles en mensaje' + x'0A';
  else;
    wFallos += 1;
    pDetalle += 'TSTJB03 FALLO: incidente=' + %trim(wJson) + x'0A';
  endif;

  // Caso 4: GLJSNCTA refleja excedeTolerancia=true y requiereRevision=false
  GLJSNINI();
  GLJSNPINI();
  wJson = GLJSNCTA('001': '01': 'USD': '1010203': 'Caja General': 'DEUDORA':
                    '1': 'CC-001': 1000: 0: 0: 1000: 1200: 1200: 0: wTs: wTs:
                    200: 200: 50: *on: 'Diferencia mayor a tolerancia':
                    'NO_CONCILIADA': 'Diferencia fuera de tolerancia': 'ALTA':
                    *off: 'ABCDEF0123456789ABCDEF01': 5: 2: 1);
  if %scan('"excedeTolerancia":true': wJson) > 0
     and %scan('"requiereRevision":false': wJson) > 0;
    pDetalle += 'TSTJB04 OK: cuenta refleja excedeTolerancia=true y requiereRevision=false' + x'0A';
  else;
    wFallos += 1;
    pDetalle += 'TSTJB04 FALLO: cuenta=' + %trim(wJson) + x'0A';
  endif;

  // Caso 5: GLJSNINI reinicia el acumulador de cuentas y GLJSNCCNT/GLJSNCGET
  //         reflejan los fragmentos acumulados por GLJSNCTA
  GLJSNINI();
  GLJSNPINI();
  GLJSNCTA('001': '01': 'USD': '1010203': 'Caja General': 'DEUDORA':
           '1': 'CC-001': 1000: 0: 0: 1000: 1000: 1000: 0: wTs: wTs:
           0: 0: 50: *off: '':
           'CONCILIADA': 'Saldo conciliado sin diferencias': 'BAJA':
           *off: 'ABCDEF0123456789ABCDEF01': 5: 2: 1);
  GLJSNPINI();
  GLJSNCTA('001': '02': 'USD': '1010204': 'Caja Sucursal': 'DEUDORA':
           '1': 'CC-002': 2000: 0: 0: 2000: 2000: 2000: 0: wTs: wTs:
           0: 0: 50: *off: '':
           'CONCILIADA': 'Saldo conciliado sin diferencias': 'BAJA':
           *off: 'FEDCBA9876543210FEDCBA98': 3: 1: 0);
  if GLJSNCCNT() = 2 and GLJSNCGET(3) = '';
    pDetalle += 'TSTJB05 OK: GLJSNCCNT=2 y GLJSNCGET(3) vacio fuera de rango' + x'0A';
  else;
    wFallos += 1;
    pDetalle += 'TSTJB05 FALLO: GLJSNCCNT=' + %char(GLJSNCCNT())
              + ', GLJSNCGET(3)=' + %trim(GLJSNCGET(3)) + x'0A';
  endif;

  return wFallos;
end-proc;

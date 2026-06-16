**FREE
//==============================================================================
// Modulo               : TSTBALCA
// Descripcion          : Pruebas unitarias de GLBALCAL.GLBALCUL (RF-02):
//                         saldo inicial del periodo y saldo final calculado,
//                         a partir del saldo fuente y los totales de
//                         debitos/creditos del periodo.
// Service Program      : TSTSRV
// Hecho por            : Isaac Rojas
// Fecha                : 2026-06-13
// Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
//==============================================================================
ctl-opt nomain;

// GLBUSSRV - GLBALCAL
dcl-pr GLBALCUL extproc('GLBALCUL');
  pSaldoFte    packed(18:2) const;
  pDebPeriodo  packed(18:2) const;
  pCredPeriodo packed(18:2) const;
  pSaldoIni    packed(18:2);
  pSaldoCalc   packed(18:2);
end-pr;

//------------------------------------------------------------------
// TSTBCRUN: Ejecuta los casos de prueba de GLBALCUL y devuelve la
//           cantidad de casos fallidos. El detalle de cada caso
//           (OK/FALLO) se devuelve en pDetalle, una linea por caso.
//------------------------------------------------------------------
dcl-proc TSTBCRUN export;
  dcl-pi *n int(10);
    pDetalle varchar(2000);
  end-pi;

  dcl-s wSaldoIni  packed(18:2);
  dcl-s wSaldoCalc packed(18:2);
  dcl-s wFallos    int(10) inz(0);

  pDetalle = '';

  // Caso 1: cuenta con movimientos (debitos > creditos en el periodo)
  GLBALCUL(1000: 300: 100: wSaldoIni: wSaldoCalc);
  if wSaldoIni = 800 and wSaldoCalc = 1000;
    pDetalle += 'TSTBC01 OK: saldoInicial=800, saldoFinalCalculado=1000' + x'0A';
  else;
    wFallos += 1;
    pDetalle += 'TSTBC01 FALLO: saldoInicial=' + %char(wSaldoIni)
              + ', saldoFinalCalculado=' + %char(wSaldoCalc) + x'0A';
  endif;

  // Caso 2: cuenta sin movimientos en el periodo (saldoIni = saldoCalc = saldoFte)
  GLBALCUL(500: 0: 0: wSaldoIni: wSaldoCalc);
  if wSaldoIni = 500 and wSaldoCalc = 500;
    pDetalle += 'TSTBC02 OK: sin movimientos, saldoInicial=saldoFinalCalculado=saldoFuente' + x'0A';
  else;
    wFallos += 1;
    pDetalle += 'TSTBC02 FALLO: saldoInicial=' + %char(wSaldoIni)
              + ', saldoFinalCalculado=' + %char(wSaldoCalc) + x'0A';
  endif;

  // Caso 3: cuenta con creditos > debitos en el periodo (saldo inicial mayor)
  GLBALCUL(1000: 50: 400: wSaldoIni: wSaldoCalc);
  if wSaldoIni = 1350 and wSaldoCalc = 1000;
    pDetalle += 'TSTBC03 OK: creditos>debitos, saldoInicial=1350, saldoFinalCalculado=1000' + x'0A';
  else;
    wFallos += 1;
    pDetalle += 'TSTBC03 FALLO: saldoInicial=' + %char(wSaldoIni)
              + ', saldoFinalCalculado=' + %char(wSaldoCalc) + x'0A';
  endif;

  return wFallos;
end-proc;

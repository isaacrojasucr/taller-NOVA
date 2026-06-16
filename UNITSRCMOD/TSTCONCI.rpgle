**FREE
//==============================================================================
// Modulo               : TSTCONCI
// Descripcion          : Pruebas unitarias de GLCONCIL (RF-03/RF-04): partidas
//                         conciliatorias, diferencias, tolerancia, estado de
//                         conciliacion (CONCILIADA/PARCIAL/NO_CONCILIADA) y
//                         control de totales de la ejecucion.
// Service Program      : TSTSRV
// Hecho por            : Isaac Rojas
// Fecha                : 2026-06-13
// Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
//==============================================================================
ctl-opt nomain;

// GLBUSSRV - GLCONCIL
dcl-pr GLCONTINI extproc('GLCONTINI');
end-pr;

dcl-pr GLCONINI extproc('GLCONINI');
end-pr;

dcl-pr GLCONPART extproc('GLCONPART');
  pDbCr      char(1) const;
  pMonto     packed(18:2) const;
  pIdPartida varchar(10);
  pTipo      varchar(20);
  pEstado    varchar(20);
  pSigno     varchar(10);
end-pr;

dcl-pr GLCONDIF extproc('GLCONDIF');
  pSaldoFte    packed(18:2) const;
  pSaldoCalc   packed(18:2) const;
  pTolerancia  packed(18:2) const;
  pSaldoConc   packed(18:2);
  pDifNeta     packed(18:2);
  pDifAbs      packed(18:2);
  pExcedeTol   ind;
  pMotivo      varchar(60);
  pCodigo      varchar(20);
  pDescripcion varchar(60);
  pSeveridad   varchar(10);
  pRequiereRev ind;
end-pr;

dcl-pr GLCONTOT extproc('GLCONTOT');
  pCodigo    varchar(20) const;
  pSaldoFte  packed(18:2) const;
  pSaldoConc packed(18:2) const;
  pDifNeta   packed(18:2) const;
end-pr;

dcl-pr GLCONTGET extproc('GLCONTGET');
  pTotCuentas int(10);
  pTotConcil  int(10);
  pTotConDif  int(10);
  pSumFte     packed(18:2);
  pSumConc    packed(18:2);
  pSumDif     packed(18:2);
end-pr;

//------------------------------------------------------------------
// TSTCCRUN: Ejecuta los casos de prueba de GLCONCIL y devuelve la
//           cantidad de casos fallidos. El detalle de cada caso
//           (OK/FALLO) se devuelve en pDetalle, una linea por caso.
//------------------------------------------------------------------
dcl-proc TSTCCRUN export;
  dcl-pi *n int(10);
    pDetalle varchar(2000);
  end-pi;

  dcl-s wSaldoConc   packed(18:2);
  dcl-s wDifNeta     packed(18:2);
  dcl-s wDifAbs      packed(18:2);
  dcl-s wExcedeTol   ind;
  dcl-s wMotivo      varchar(60);
  dcl-s wCodigo      varchar(20);
  dcl-s wDescripcion varchar(60);
  dcl-s wSeveridad   varchar(10);
  dcl-s wRequiereRev ind;
  dcl-s wIdPartida   varchar(10);
  dcl-s wTipo        varchar(20);
  dcl-s wEstado      varchar(20);
  dcl-s wSigno       varchar(10);
  dcl-s wTotCuentas  int(10);
  dcl-s wTotConcil   int(10);
  dcl-s wTotConDif   int(10);
  dcl-s wSumFte      packed(18:2);
  dcl-s wSumConc     packed(18:2);
  dcl-s wSumDif      packed(18:2);
  dcl-s wFallos      int(10) inz(0);

  pDetalle = '';

  // Caso 1: sin partidas pendientes y sin diferencia -> CONCILIADA
  GLCONINI();
  GLCONDIF(1000: 1000: 10: wSaldoConc: wDifNeta: wDifAbs: wExcedeTol: wMotivo:
           wCodigo: wDescripcion: wSeveridad: wRequiereRev);
  if wCodigo = 'CONCILIADA' and wDifNeta = 0 and not wExcedeTol and not wRequiereRev
     and wSeveridad = 'BAJA';
    pDetalle += 'TSTCC01 OK: sin partidas y sin diferencia -> CONCILIADA' + x'0A';
  else;
    wFallos += 1;
    pDetalle += 'TSTCC01 FALLO: codigo=' + %trim(wCodigo)
              + ', difNeta=' + %char(wDifNeta) + x'0A';
  endif;

  // Caso 2: una partida en transito (debito) que compensa la diferencia,
  //         dentro de tolerancia -> PARCIAL
  GLCONINI();
  GLCONPART('D': 50: wIdPartida: wTipo: wEstado: wSigno);
  GLCONDIF(1000: 950: 100: wSaldoConc: wDifNeta: wDifAbs: wExcedeTol: wMotivo:
           wCodigo: wDescripcion: wSeveridad: wRequiereRev);
  if wIdPartida = 'PC-0001' and wSigno = 'DEBITO' and wTipo = 'TRANSITO'
     and wEstado = 'PENDIENTE' and wCodigo = 'PARCIAL' and wSaldoConc = 1000
     and wDifNeta = 0 and not wExcedeTol and wRequiereRev and wSeveridad = 'MEDIA';
    pDetalle += 'TSTCC02 OK: partida debito en transito dentro de tolerancia -> PARCIAL' + x'0A';
  else;
    wFallos += 1;
    pDetalle += 'TSTCC02 FALLO: idPartida=' + %trim(wIdPartida)
              + ', signo=' + %trim(wSigno) + ', codigo=' + %trim(wCodigo)
              + ', saldoConc=' + %char(wSaldoConc) + x'0A';
  endif;

  // Caso 3: diferencia que excede la tolerancia -> NO_CONCILIADA
  GLCONINI();
  GLCONDIF(1000: 800: 50: wSaldoConc: wDifNeta: wDifAbs: wExcedeTol: wMotivo:
           wCodigo: wDescripcion: wSeveridad: wRequiereRev);
  if wCodigo = 'NO_CONCILIADA' and wDifNeta = 200 and wDifAbs = 200 and wExcedeTol
     and wRequiereRev and wSeveridad = 'ALTA';
    pDetalle += 'TSTCC03 OK: diferencia 200 > tolerancia 50 -> NO_CONCILIADA' + x'0A';
  else;
    wFallos += 1;
    pDetalle += 'TSTCC03 FALLO: codigo=' + %trim(wCodigo)
              + ', difNeta=' + %char(wDifNeta) + ', difAbs=' + %char(wDifAbs) + x'0A';
  endif;

  // Caso 4: control de totales acumula cuentas, conciliadas y con diferencia
  GLCONTINI();
  GLCONTOT('CONCILIADA': 1000: 1000: 0);
  GLCONTOT('NO_CONCILIADA': 2000: 1800: 200);
  GLCONTGET(wTotCuentas: wTotConcil: wTotConDif: wSumFte: wSumConc: wSumDif);
  if wTotCuentas = 2 and wTotConcil = 1 and wTotConDif = 1
     and wSumFte = 3000 and wSumConc = 2800 and wSumDif = 200;
    pDetalle += 'TSTCC04 OK: control de totales (2 cuentas, 1 conciliada, 1 con diferencia)' + x'0A';
  else;
    wFallos += 1;
    pDetalle += 'TSTCC04 FALLO: totCuentas=' + %char(wTotCuentas)
              + ', totConcil=' + %char(wTotConcil)
              + ', totConDif=' + %char(wTotConDif) + x'0A';
  endif;

  return wFallos;
end-proc;

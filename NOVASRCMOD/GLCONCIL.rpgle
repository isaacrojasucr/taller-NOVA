**FREE
//==============================================================================
// Modulo               : GLCONCIL
// Descripcion          : Reglas de negocio de conciliacion (RF-03): clasifica
//                         las partidas conciliatorias (TTRAN pendientes),
//                         calcula diferencias y estado de conciliacion de cada
//                         cuenta contra el saldo fuente (GLBLN), y acumula el
//                         control de totales de la ejecucion (RF-04).
// Service Program      : GLBUSSRV
// Hecho por            : Isaac Rojas
// Fecha                : 2026-06-13
// Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
//==============================================================================
ctl-opt nomain;

// Prototipos de procedimientos de UTLNUM (servicio GLUTLSRV), resueltos
// en tiempo de enlace mediante el directorio de enlace del programa
// principal GLCNC001.
dcl-pr UTLDIFABS packed(18:2) extproc('UTLDIFABS');
  pValorA packed(18:2) const;
  pValorB packed(18:2) const;
end-pr;

dcl-pr UTLEXCTOL ind extproc('UTLEXCTOL');
  pDifAbs packed(18:2) const;
  pTolera packed(18:2) const;
end-pr;

// Acumuladores por cuenta (reiniciados por GLCONINI).
dcl-s g_difNeta  packed(18:2) inz(0);
dcl-s g_partSeq  int(10)      inz(0);

// Acumuladores de control de totales de la ejecucion (reiniciados por
// GLCONTINI).
dcl-s g_ctlCuentas int(10)      inz(0);
dcl-s g_ctlConcil  int(10)      inz(0);
dcl-s g_ctlConDif  int(10)      inz(0);
dcl-s g_ctlSumFte  packed(18:2) inz(0);
dcl-s g_ctlSumConc packed(18:2) inz(0);
dcl-s g_ctlSumDif  packed(18:2) inz(0);

//------------------------------------------------------------------
// GLCONTINI: Reinicia el control de totales de la ejecucion (debe
//            invocarse una vez al inicio del proceso, antes de recorrer
//            las cuentas).
//------------------------------------------------------------------
dcl-proc GLCONTINI export;
  dcl-pi *n end-pi;

  g_ctlCuentas = 0;
  g_ctlConcil  = 0;
  g_ctlConDif  = 0;
  g_ctlSumFte  = 0;
  g_ctlSumConc = 0;
  g_ctlSumDif  = 0;
end-proc;

//------------------------------------------------------------------
// GLCONINI: Reinicia los acumuladores de partidas conciliatorias de una
//           cuenta (debe invocarse antes de recorrer las partidas de
//           cada cuenta).
//------------------------------------------------------------------
dcl-proc GLCONINI export;
  dcl-pi *n end-pi;

  g_difNeta = 0;
  g_partSeq = 0;
end-proc;

//------------------------------------------------------------------
// GLCONPART: Clasifica una partida conciliatoria (fila TTRAN pendiente
//            de una cuenta) y acumula su efecto en la diferencia neta de
//            la cuenta. Genera el identificador interno de la partida
//            (PC-nnnn), el tipo ('TRANSITO') y el estado ('PENDIENTE'),
//            ya que toda partida proviene de movimientos del dia (TTRAN)
//            aun no aplicados al saldo fuente (GLBLN). Traduce el signo
//            de la partida (D/C) a 'DEBITO'/'CREDITO'.
//------------------------------------------------------------------
dcl-proc GLCONPART export;
  dcl-pi *n;
    pDbCr      char(1) const;
    pMonto     packed(18:2) const;
    pIdPartida varchar(10);
    pTipo      varchar(20);
    pEstado    varchar(20);
    pSigno     varchar(10);
  end-pi;

  dcl-s wSeq zoned(4:0);

  if pDbCr = 'D';
    g_difNeta += pMonto;
    pSigno = 'DEBITO';
  else;
    g_difNeta -= pMonto;
    pSigno = 'CREDITO';
  endif;

  g_partSeq += 1;
  wSeq = g_partSeq;
  pIdPartida = 'PC-' + %editc(wSeq: 'X');
  pTipo   = 'TRANSITO';
  pEstado = 'PENDIENTE';
end-proc;

//------------------------------------------------------------------
// GLCONDIF: Calcula el saldo final conciliado, las diferencias y el
//           estado de conciliacion de una cuenta, a partir del saldo
//           fuente, el saldo final calculado (GLBALCUL), la tolerancia
//           configurada y la diferencia neta acumulada por las partidas
//           conciliatorias (GLCONPART). Codigos de estado posibles:
//           'CONCILIADA' (sin partidas y sin diferencia), 'PARCIAL'
//           (con partidas/diferencia dentro de tolerancia) o
//           'NO_CONCILIADA' (diferencia excede la tolerancia).
//------------------------------------------------------------------
dcl-proc GLCONDIF export;
  dcl-pi *n;
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
  end-pi;

  pSaldoConc = pSaldoCalc + g_difNeta;
  pDifNeta   = pSaldoFte - pSaldoConc;
  pDifAbs    = UTLDIFABS(pSaldoFte: pSaldoConc);
  pExcedeTol = UTLEXCTOL(pDifAbs: pTolerancia);

  if g_partSeq = 0 and pDifNeta = 0;
    pCodigo      = 'CONCILIADA';
    pDescripcion = 'Conciliada sin partidas pendientes';
    pSeveridad   = 'BAJA';
    pRequiereRev = *off;
    pMotivo      = 'Sin diferencias detectadas';
  elseif not pExcedeTol;
    pCodigo      = 'PARCIAL';
    pDescripcion = 'Conciliada con partidas pendientes';
    pSeveridad   = 'MEDIA';
    pRequiereRev = *on;
    pMotivo      = 'Partida en transito dentro de tolerancia';
  else;
    pCodigo      = 'NO_CONCILIADA';
    pDescripcion = 'Diferencia fuera de tolerancia, requiere revision';
    pSeveridad   = 'ALTA';
    pRequiereRev = *on;
    pMotivo      = 'Diferencia excede la tolerancia permitida';
  endif;
end-proc;

//------------------------------------------------------------------
// GLCONTOT: Acumula el resultado de una cuenta en el control de totales
//           de la ejecucion (debe invocarse una vez por cuenta, despues
//           de GLCONDIF).
//------------------------------------------------------------------
dcl-proc GLCONTOT export;
  dcl-pi *n;
    pCodigo    varchar(20) const;
    pSaldoFte  packed(18:2) const;
    pSaldoConc packed(18:2) const;
    pDifNeta   packed(18:2) const;
  end-pi;

  g_ctlCuentas += 1;
  g_ctlSumFte  += pSaldoFte;
  g_ctlSumConc += pSaldoConc;
  g_ctlSumDif  += pDifNeta;

  if %trim(pCodigo) = 'CONCILIADA';
    g_ctlConcil += 1;
  endif;

  if pDifNeta <> 0;
    g_ctlConDif += 1;
  endif;
end-proc;

//------------------------------------------------------------------
// GLCONTGET: Devuelve el control de totales acumulado de la ejecucion
//            (cantidad de cuentas procesadas/conciliadas/con diferencia
//            y las sumatorias de saldo fuente, saldo conciliado y
//            diferencia neta), para construir controlTotales en el JSON
//            de salida (RF-04).
//------------------------------------------------------------------
dcl-proc GLCONTGET export;
  dcl-pi *n;
    pTotCuentas int(10);
    pTotConcil  int(10);
    pTotConDif  int(10);
    pSumFte     packed(18:2);
    pSumConc    packed(18:2);
    pSumDif     packed(18:2);
  end-pi;

  pTotCuentas = g_ctlCuentas;
  pTotConcil  = g_ctlConcil;
  pTotConDif  = g_ctlConDif;
  pSumFte     = g_ctlSumFte;
  pSumConc    = g_ctlSumConc;
  pSumDif     = g_ctlSumDif;
end-proc;

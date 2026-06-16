**FREE
//==============================================================================
// Modulo               : GLBALCAL
// Descripcion          : Calculo del balance de una cuenta mayor (RF-02):
//                         saldo inicial del periodo y saldo final calculado,
//                         a partir del saldo fuente (GLBLN.SALDO_ACTUAL) y los
//                         totales de movimientos del periodo (TRANS, via
//                         GLMOVACC.GLMOVTOT).
// Service Program      : GLBUSSRV
// Hecho por            : Isaac Rojas
// Fecha                : 2026-06-13
// Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
//==============================================================================
ctl-opt nomain;

//------------------------------------------------------------------
// GLBALCUL: Calcula el saldo inicial del periodo (reverso de los
//           movimientos historicos sobre el saldo fuente) y el saldo
//           final calculado (saldoInicial + debitos - creditos), segun
//           la regla contable de RF-02.
//------------------------------------------------------------------
dcl-proc GLBALCUL export;
  dcl-pi *n;
    pSaldoFte    packed(18:2) const;
    pDebPeriodo  packed(18:2) const;
    pCredPeriodo packed(18:2) const;
    pSaldoIni    packed(18:2);
    pSaldoCalc   packed(18:2);
  end-pi;

  pSaldoIni  = pSaldoFte - pDebPeriodo + pCredPeriodo;
  pSaldoCalc = pSaldoIni + pDebPeriodo - pCredPeriodo;
end-proc;

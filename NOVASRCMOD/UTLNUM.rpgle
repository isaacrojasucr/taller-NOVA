**FREE
//==============================================================================
// Modulo               : UTLNUM
// Descripcion          : Utilidades numericas (redondeo a 2 decimales,
//                         diferencia absoluta y verificacion de tolerancia)
//                         para el proceso de conciliacion GLBLN.
// Service Program      : GLUTLSRV
// Hecho por            : Isaac Rojas
// Fecha                : 2026-06-13
// Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
//==============================================================================
ctl-opt nomain;

//------------------------------------------------------------------
// UTLRND2: Redondea un valor decimal a 2 posiciones decimales.
//------------------------------------------------------------------
dcl-proc UTLRND2 export;
  dcl-pi *n packed(18:2);
    pValor packed(18:6) const;
  end-pi;

  dcl-s wAjuste packed(18:6);

  if pValor >= 0;
    wAjuste = pValor + 0.005;
  else;
    wAjuste = pValor - 0.005;
  endif;

  return %dec(wAjuste: 18: 2);
end-proc;

//------------------------------------------------------------------
// UTLDIFABS: Devuelve la diferencia absoluta entre dos valores.
//------------------------------------------------------------------
dcl-proc UTLDIFABS export;
  dcl-pi *n packed(18:2);
    pValorA packed(18:2) const;
    pValorB packed(18:2) const;
  end-pi;

  dcl-s wDif packed(18:2);

  wDif = pValorA - pValorB;
  if wDif < 0;
    wDif = -wDif;
  endif;

  return wDif;
end-proc;

//------------------------------------------------------------------
// UTLEXCTOL: Indica si una diferencia absoluta excede la tolerancia
//            permitida.
//------------------------------------------------------------------
dcl-proc UTLEXCTOL export;
  dcl-pi *n ind;
    pDifAbs packed(18:2) const;
    pTolera packed(18:2) const;
  end-pi;

  return (pDifAbs > pTolera);
end-proc;

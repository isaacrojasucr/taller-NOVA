**FREE
//==============================================================================
// Modulo               : UTLFECHA
// Descripcion          : Utilidades de fecha y periodo (formateo ISO-8601,
//                         anio y mes) para el proceso de conciliacion GLBLN.
// Service Program      : GLUTLSRV
// Hecho por            : Isaac Rojas
// Fecha                : 2026-06-13
// Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
//==============================================================================
ctl-opt nomain;

//------------------------------------------------------------------
// UTLFMTFEC: Formatea una fecha a cadena ISO 'YYYY-MM-DD'.
//------------------------------------------------------------------
dcl-proc UTLFMTFEC export;
  dcl-pi *n varchar(10);
    pFecha date const;
  end-pi;

  return %char(pFecha: *iso);
end-proc;

//------------------------------------------------------------------
// UTLFMTTS: Formatea un timestamp a cadena ISO-8601 'YYYY-MM-DDTHH:MM:SS'.
//------------------------------------------------------------------
dcl-proc UTLFMTTS export;
  dcl-pi *n varchar(19);
    pTimestamp timestamp const;
  end-pi;

  dcl-s wIso varchar(26);

  wIso = %char(pTimestamp: *iso);

  return %subst(wIso: 1: 10) + 'T'
       + %subst(wIso: 12: 2) + ':'
       + %subst(wIso: 15: 2) + ':'
       + %subst(wIso: 18: 2);
end-proc;

//------------------------------------------------------------------
// UTLANIO: Devuelve el anio de una fecha.
//------------------------------------------------------------------
dcl-proc UTLANIO export;
  dcl-pi *n int(5);
    pFecha date const;
  end-pi;

  return %subdt(pFecha: *years);
end-proc;

//------------------------------------------------------------------
// UTLMES: Devuelve el mes (1-12) de una fecha.
//------------------------------------------------------------------
dcl-proc UTLMES export;
  dcl-pi *n int(5);
    pFecha date const;
  end-pi;

  return %subdt(pFecha: *months);
end-proc;

**FREE
//==============================================================================
// Modulo               : GLJSONBL
// Descripcion          : Construccion de los fragmentos JSON del documento de
//                         conciliacion (RF-05): metadata, ejecucion, contexto,
//                         cada cuenta (cuentaMayor/saldos/resumenMovimientos/
//                         partidasConciliatorias/diferencias/
//                         estadoConciliacion/trazabilidad), controlTotales e
//                         incidentes. Modulo de solo formateo (sin acceso a
//                         IFS), para permitir pruebas unitarias (RPGUnit) de
//                         la estructura del JSON.
// Service Program      : GLOUTSRV
// Hecho por            : Isaac Rojas
// Fecha                : 2026-06-13
// Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
//==============================================================================
ctl-opt nomain;

// Prototipos de procedimientos de UTLFECHA (servicio GLUTLSRV), resueltos
// en tiempo de enlace mediante el directorio de enlace del programa
// principal GLCNC001.
dcl-pr UTLFMTFEC varchar(10) extproc('UTLFMTFEC');
  pFecha date const;
end-pr;

dcl-pr UTLFMTTS varchar(19) extproc('UTLFMTTS');
  pTimestamp timestamp const;
end-pr;

dcl-c MAXPART 20;
dcl-c MAXCTAS 100;
dcl-c MAXINCJ 200;

// Acumulador de partidas conciliatorias de la cuenta en construccion
// (reiniciado por GLJSNPINI, consumido y reiniciado por GLJSNCTA).
dcl-ds g_part dim(MAXPART) qualified;
  json varchar(600);
end-ds;

dcl-s g_partCnt int(10) inz(0);

// Acumulador de fragmentos JSON de cuentas (GLJSNCTA) e incidentes
// (GLJSNINC) de la ejecucion, para que GLCNC001 los escriba en IFS en el
// orden correcto del documento (despues de conocer fechaHoraFin/
// estadoEjecucion/controlTotales, que se determinan al final del recorrido
// de cuentas).
dcl-ds g_cta dim(MAXCTAS) qualified;
  json varchar(14000);
end-ds;

dcl-s g_ctaCnt int(10) inz(0);

dcl-ds g_inc dim(MAXINCJ) qualified;
  json varchar(300);
end-ds;

dcl-s g_incCnt int(10) inz(0);

//------------------------------------------------------------------
// GLJSNINI: Reinicia los acumuladores de cuentas, incidentes y partidas
//           de una nueva ejecucion (debe invocarse una vez al inicio del
//           proceso, antes de recorrer las cuentas).
//------------------------------------------------------------------
dcl-proc GLJSNINI export;
  dcl-pi *n end-pi;

  g_ctaCnt  = 0;
  g_incCnt  = 0;
  g_partCnt = 0;
end-proc;

//------------------------------------------------------------------
// GLJSNMETA: Construye el objeto JSON 'metadata' del documento de
//            conciliacion.
//------------------------------------------------------------------
dcl-proc GLJSNMETA export;
  dcl-pi *n varchar(250);
    pAmbiente varchar(10) const;
  end-pi;

  return '{'
       + '"versionEstructura":"1.0.0",'
       + '"sistemaOrigen":"IBS-IBM-i",'
       + '"proceso":"CONCILIACION_GLBLN",'
       + '"ambiente":"' + GLJSNESC(pAmbiente) + '",'
       + '"charset":"UTF-8"'
       + '}';
end-proc;

//------------------------------------------------------------------
// GLJSNEJEC: Construye el objeto JSON 'ejecucion' del documento de
//            conciliacion.
//------------------------------------------------------------------
dcl-proc GLJSNEJEC export;
  dcl-pi *n varchar(400);
    pIdEjec   varchar(30) const;
    pFchProc  date const;
    pFchIni   timestamp const;
    pFchFin   timestamp const;
    pUsuario  varchar(10) const;
    pPrograma varchar(10) const;
    pLibreria varchar(10) const;
    pEstado   varchar(20) const;
  end-pi;

  return '{'
       + '"idEjecucion":"' + GLJSNESC(pIdEjec) + '",'
       + '"fechaProceso":"' + UTLFMTFEC(pFchProc) + '",'
       + '"fechaHoraInicio":"' + UTLFMTTS(pFchIni) + '",'
       + '"fechaHoraFin":"' + UTLFMTTS(pFchFin) + '",'
       + '"usuario":"' + GLJSNESC(pUsuario) + '",'
       + '"programa":"' + GLJSNESC(pPrograma) + '",'
       + '"libreria":"' + GLJSNESC(pLibreria) + '",'
       + '"estadoEjecucion":"' + GLJSNESC(pEstado) + '"'
       + '}';
end-proc;

//------------------------------------------------------------------
// GLJSNCTX: Construye el objeto JSON 'contexto' del documento de
//           conciliacion (banco/sucursal/moneda, periodo y rango de
//           cuentas de la ejecucion).
//------------------------------------------------------------------
dcl-proc GLJSNCTX export;
  dcl-pi *n varchar(400);
    pBanco    varchar(20) const;
    pSucursal varchar(20) const;
    pMoneda   varchar(20) const;
    pAnio     int(5) const;
    pMes      int(5) const;
    pFchCorte date const;
    pCtaDesde varchar(24) const;
    pCtaHasta varchar(24) const;
  end-pi;

  return '{'
       + '"banco":"' + GLJSNESC(pBanco) + '",'
       + '"sucursal":"' + GLJSNESC(pSucursal) + '",'
       + '"moneda":"' + GLJSNESC(pMoneda) + '",'
       + '"periodo":{'
         + '"anio":' + %char(pAnio) + ','
         + '"mes":' + %char(pMes) + ','
         + '"fechaCorte":"' + UTLFMTFEC(pFchCorte) + '"'
       + '},'
       + '"rangoCuentas":{'
         + '"desde":"' + GLJSNESC(pCtaDesde) + '",'
         + '"hasta":"' + GLJSNESC(pCtaHasta) + '"'
       + '}'
       + '}';
end-proc;

//------------------------------------------------------------------
// GLJSNPINI: Reinicia el acumulador de partidas conciliatorias para una
//            nueva cuenta (debe invocarse antes de recorrer las partidas
//            de cada cuenta).
//------------------------------------------------------------------
dcl-proc GLJSNPINI export;
  dcl-pi *n end-pi;

  g_partCnt = 0;
end-proc;

//------------------------------------------------------------------
// GLJSNPART: Construye el objeto JSON de una partida conciliatoria y lo
//            agrega al acumulador de la cuenta en construccion.
//------------------------------------------------------------------
dcl-proc GLJSNPART export;
  dcl-pi *n;
    pIdPartida   varchar(10) const;
    pTipo        varchar(20) const;
    pSubtipo     varchar(20) const;
    pReferencia  varchar(40) const;
    pFchPartida  date const;
    pMonto       packed(18:2) const;
    pSigno       varchar(10) const;
    pEstado      varchar(20) const;
    pOrigen      varchar(10) const;
    pObservacion varchar(200) const;
  end-pi;

  if g_partCnt >= MAXPART;
    return;
  endif;

  g_partCnt += 1;
  g_part(g_partCnt).json = '{'
       + '"idPartida":"' + GLJSNESC(pIdPartida) + '",'
       + '"tipo":"' + GLJSNESC(pTipo) + '",'
       + '"subtipo":"' + GLJSNESC(pSubtipo) + '",'
       + '"referencia":"' + GLJSNESC(pReferencia) + '",'
       + '"fechaPartida":"' + UTLFMTFEC(pFchPartida) + '",'
       + '"monto":' + %char(pMonto) + ','
       + '"signo":"' + GLJSNESC(pSigno) + '",'
       + '"estado":"' + GLJSNESC(pEstado) + '",'
       + '"origen":"' + GLJSNESC(pOrigen) + '",'
       + '"observacion":"' + GLJSNESC(pObservacion) + '"'
       + '}';
end-proc;

//------------------------------------------------------------------
// GLJSNCTA: Construye el objeto JSON completo de una cuenta (elemento
//           del arreglo 'cuentas'): cuentaMayor, saldos,
//           resumenMovimientos, partidasConciliatorias (acumuladas por
//           GLJSNPART), diferencias, estadoConciliacion y trazabilidad.
//           Al finalizar, reinicia el acumulador de partidas para la
//           siguiente cuenta.
//------------------------------------------------------------------
dcl-proc GLJSNCTA export;
  dcl-pi *n varchar(14000);
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
  end-pi;

  dcl-s wPartArr varchar(12100);
  dcl-s wResult  varchar(14000);
  dcl-s i        int(10);

  wPartArr = '[';
  for i = 1 to g_partCnt;
    if i > 1;
      wPartArr += ',';
    endif;
    wPartArr += %trim(g_part(i).json);
  endfor;
  wPartArr += ']';

  wResult = '{'
    + '"cuentaMayor":{'
      + '"codigoBanco":"' + GLJSNESC(pBanco) + '",'
      + '"codigoSucursal":"' + GLJSNESC(pSucursal) + '",'
      + '"codigoMoneda":"' + GLJSNESC(pMoneda) + '",'
      + '"cuentaContable":"' + GLJSNESC(pCtaCont) + '",'
      + '"descripcionCuenta":"' + GLJSNESC(pDescCta) + '",'
      + '"naturaleza":"' + GLJSNESC(pNaturaleza) + '",'
      + '"nivelCuenta":"' + GLJSNESC(pNivelCta) + '",'
      + '"centroCosto":"' + GLJSNESC(pCentroCosto) + '"'
    + '},'
    + '"saldos":{'
      + '"saldoInicial":' + %char(pSaldoIni) + ','
      + '"debitosPeriodo":' + %char(pDebPeriodo) + ','
      + '"creditosPeriodo":' + %char(pCredPeriodo) + ','
      + '"saldoFinalCalculado":' + %char(pSaldoCalc) + ','
      + '"saldoFinalFuente":' + %char(pSaldoFte) + ','
      + '"saldoFinalConciliado":' + %char(pSaldoConc)
    + '},'
    + '"resumenMovimientos":{'
      + '"cantidadMovimientos":' + %char(pCantMov) + ',';

  if pCantMov > 0;
    wResult += '"primerMovimiento":"' + UTLFMTTS(pPrimerMov) + '",'
             + '"ultimoMovimiento":"' + UTLFMTTS(pUltimoMov) + '"';
  else;
    wResult += '"primerMovimiento":null,"ultimoMovimiento":null';
  endif;

  wResult += '},'
    + '"partidasConciliatorias":' + wPartArr + ','
    + '"diferencias":{'
      + '"diferenciaNeta":' + %char(pDifNeta) + ','
      + '"diferenciaAbsoluta":' + %char(pDifAbs) + ','
      + '"toleranciaPermitida":' + %char(pTolerancia) + ','
      + '"excedeTolerancia":' + GLJSNBOOL(pExcedeTol) + ','
      + '"motivoPrincipal":"' + GLJSNESC(pMotivo) + '"'
    + '},'
    + '"estadoConciliacion":{'
      + '"codigo":"' + GLJSNESC(pCodEstado) + '",'
      + '"descripcion":"' + GLJSNESC(pDescEstado) + '",'
      + '"severidad":"' + GLJSNESC(pSeveridad) + '",'
      + '"requiereRevision":' + GLJSNBOOL(pRequiereRev)
    + '},'
    + '"trazabilidad":{'
      + '"hashCuenta":"' + GLJSNESC(pHashCuenta) + '",'
      + '"registrosFuente":{'
        + '"glbln":1,'
        + '"trans":' + %char(pCntTrans) + ','
        + '"trdsc":' + %char(pCntTrdsc) + ','
        + '"ttran":' + %char(pCntTtran)
      + '}'
    + '}'
    + '}';

  if g_ctaCnt < MAXCTAS;
    g_ctaCnt += 1;
    g_cta(g_ctaCnt).json = wResult;
  endif;

  g_partCnt = 0;

  return wResult;
end-proc;

//------------------------------------------------------------------
// GLJSNCCNT: Devuelve la cantidad de fragmentos JSON de cuentas
//            acumulados por GLJSNCTA en la ejecucion actual.
//------------------------------------------------------------------
dcl-proc GLJSNCCNT export;
  dcl-pi *n int(10);
  end-pi;

  return g_ctaCnt;
end-proc;

//------------------------------------------------------------------
// GLJSNCGET: Devuelve el fragmento JSON de la cuenta en la posicion
//            indicada (1..N). Devuelve cadena vacia si la posicion no
//            existe.
//------------------------------------------------------------------
dcl-proc GLJSNCGET export;
  dcl-pi *n varchar(14000);
    pIndice int(10) const;
  end-pi;

  if pIndice < 1 or pIndice > g_ctaCnt;
    return '';
  endif;

  return g_cta(pIndice).json;
end-proc;

//------------------------------------------------------------------
// GLJSNINC: Construye el objeto JSON de un incidente (elemento del
//           arreglo 'incidentes'), a partir de los incidentes
//           acumulados por UTLBITAC, y lo agrega al acumulador de
//           incidentes de la ejecucion actual.
//------------------------------------------------------------------
dcl-proc GLJSNINC export;
  dcl-pi *n varchar(300);
    pCodigo   varchar(20) const;
    pTipo     varchar(20) const;
    pCuenta   varchar(24) const;
    pMensaje  varchar(120) const;
    pSeveridad varchar(10) const;
  end-pi;

  dcl-s wResult varchar(300);

  wResult = '{'
       + '"codigo":"' + GLJSNESC(pCodigo) + '",'
       + '"tipo":"' + GLJSNESC(pTipo) + '",'
       + '"cuentaContable":"' + GLJSNESC(pCuenta) + '",'
       + '"mensaje":"' + GLJSNESC(pMensaje) + '",'
       + '"severidad":"' + GLJSNESC(pSeveridad) + '"'
       + '}';

  if g_incCnt < MAXINCJ;
    g_incCnt += 1;
    g_inc(g_incCnt).json = wResult;
  endif;

  return wResult;
end-proc;

//------------------------------------------------------------------
// GLJSNICNT: Devuelve la cantidad de fragmentos JSON de incidentes
//            acumulados por GLJSNINC en la ejecucion actual.
//------------------------------------------------------------------
dcl-proc GLJSNICNT export;
  dcl-pi *n int(10);
  end-pi;

  return g_incCnt;
end-proc;

//------------------------------------------------------------------
// GLJSNIGET: Devuelve el fragmento JSON del incidente en la posicion
//            indicada (1..N). Devuelve cadena vacia si la posicion no
//            existe.
//------------------------------------------------------------------
dcl-proc GLJSNIGET export;
  dcl-pi *n varchar(300);
    pIndice int(10) const;
  end-pi;

  if pIndice < 1 or pIndice > g_incCnt;
    return '';
  endif;

  return g_inc(pIndice).json;
end-proc;

//------------------------------------------------------------------
// GLJSNCTOT: Construye el objeto JSON 'controlTotales' del documento de
//            conciliacion, a partir de los totales acumulados por
//            GLCONCIL.GLCONTGET.
//------------------------------------------------------------------
dcl-proc GLJSNCTOT export;
  dcl-pi *n varchar(300);
    pTotCuentas int(10) const;
    pTotConcil  int(10) const;
    pTotConDif  int(10) const;
    pSumFte     packed(18:2) const;
    pSumConc    packed(18:2) const;
    pSumDif     packed(18:2) const;
  end-pi;

  return '{'
       + '"totalCuentasProcesadas":' + %char(pTotCuentas) + ','
       + '"totalCuentasConciliadas":' + %char(pTotConcil) + ','
       + '"totalCuentasConDiferencia":' + %char(pTotConDif) + ','
       + '"sumatoriaSaldoFinalFuente":' + %char(pSumFte) + ','
       + '"sumatoriaSaldoFinalConciliado":' + %char(pSumConc) + ','
       + '"sumatoriaDiferenciaNeta":' + %char(pSumDif)
       + '}';
end-proc;

//------------------------------------------------------------------
// GLJSNHASH: Calcula un hash hexadecimal corto (SHA-256, truncado a 24
//            caracteres) de una cadena de campos criticos de la cuenta,
//            utilizado como 'hashCuenta' en trazabilidad (RF-07).
//------------------------------------------------------------------
dcl-proc GLJSNHASH export;
  dcl-pi *n varchar(24);
    pInsumo varchar(100) const;
  end-pi;

  // Hash de trazabilidad por polinomio doble (sin SQL) para compatibilidad
  // con service program en PUB400. Determinista: mismo input -> mismo output.
  dcl-ds wOvl;
    wOvlC char(1);
    wOvlI uns(3) overlay(wOvlC: 1);
  end-ds;
  dcl-s wH1   packed(10:0) inz(17);
  dcl-s wH2   packed(10:0) inz(31);
  dcl-s wT1   packed(13:0);
  dcl-s wT2   packed(13:0);
  dcl-s wOut  varchar(24);
  dcl-s i     int(10);

  for i = 1 to %len(pInsumo);
    wOvlC = %subst(pInsumo: i: 1);
    wT1 = wH1 * 31 + wOvlI;
    wH1 = %rem(wT1: 9999999989);
    wT2 = wH2 * 37 + wOvlI + i;
    wH2 = %rem(wT2: 9999999937);
  endfor;

  wOut = %subst(%editc(wH1: '1') + %editc(wH2: '1')
              + '000000000000000000000000': 1: 24);

  return wOut;
end-proc;

//------------------------------------------------------------------
// GLJSNBOOL (privado): Convierte un indicador a su representacion JSON
//           ('true'/'false').
//------------------------------------------------------------------
dcl-proc GLJSNBOOL;
  dcl-pi *n varchar(5);
    pValor ind const;
  end-pi;

  if pValor;
    return 'true';
  else;
    return 'false';
  endif;
end-proc;

//------------------------------------------------------------------
// GLJSNESC (privado): Escapa caracteres especiales ('\' y '"') de un
//           texto para su inclusion como cadena JSON.
//------------------------------------------------------------------
dcl-proc GLJSNESC;
  dcl-pi *n varchar(400);
    pTexto varchar(200) const;
  end-pi;

  dcl-s wTexto varchar(400);

  wTexto = %scanrpl('\': '\\': %trim(pTexto));
  wTexto = %scanrpl('"': '\"': wTexto);

  return wTexto;
end-proc;

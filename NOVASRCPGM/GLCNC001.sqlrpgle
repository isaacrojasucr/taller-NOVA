**FREE
//==============================================================================
// Programa             : GLCNC001
// Descripcion          : Orquestador del proceso de conciliacion de cuentas
//                         mayores (GLBLN). Recorre las cuentas del rango
//                         indicado (RF-01), calcula el balance del periodo
//                         (RF-02), clasifica las partidas conciliatorias y el
//                         estado de conciliacion de cada cuenta (RF-03),
//                         acumula el control de totales (RF-04), construye el
//                         documento JSON de salida (RF-05) y lo publica en
//                         IFS junto con la bitacora de ejecucion (RF-06/RF-07).
//                         Los errores de una cuenta individual no detienen el
//                         proceso: se registran como incidente y se continua
//                         con la siguiente cuenta (RF-08).
// Binding Directory    : GLCNCBND (GLUTLSRV, GLDATSRV, GLBUSSRV, GLOUTSRV)
// Hecho por            : Isaac Rojas
// Fecha                : 2026-06-13
// Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
//==============================================================================
ctl-opt dftactgrp(*no) actgrp(*new) bnddir('GLCNCBND');

//------------------------------------------------------------------
// Prototipos de procedimientos externos (GLUTLSRV / GLDATSRV /
// GLBUSSRV / GLOUTSRV), resueltos en tiempo de enlace mediante el
// directorio de enlace GLCNCBND.
//------------------------------------------------------------------

// GLUTLSRV - UTLFECHA
dcl-pr UTLFMTFEC varchar(10) extproc('UTLFMTFEC');
  pFecha date const;
end-pr;

dcl-pr UTLFMTTS varchar(19) extproc('UTLFMTTS');
  pTimestamp timestamp const;
end-pr;

dcl-pr UTLANIO int(5) extproc('UTLANIO');
  pFecha date const;
end-pr;

dcl-pr UTLMES int(5) extproc('UTLMES');
  pFecha date const;
end-pr;

// GLUTLSRV - UTLBITAC
dcl-pr UTLBITINI extproc('UTLBITINI');
end-pr;

dcl-pr UTLBITADD extproc('UTLBITADD');
  pCodigo  varchar(20) const;
  pTipo    varchar(20) const;
  pCuenta  varchar(20) const;
  pMensaje varchar(120) const;
  pSeverid varchar(10) const;
end-pr;

dcl-pr UTLBITMAX varchar(10) extproc('UTLBITMAX');
end-pr;

dcl-pr UTLBITESC extproc('UTLBITESC');
  pRuta    varchar(512) const;
  pIdEjec  varchar(30) const;
  pFchProc varchar(10) const;
  pFchIni  varchar(19) const;
  pFchFin  varchar(19) const;
  pTotCtas int(10) const;
  pEstado  varchar(20) const;
end-pr;

// GLDATSRV - GLDTAACC
dcl-pr GLACCINI extproc('GLACCINI');
  pBanco    varchar(20) const;
  pSucursal varchar(20) const;
  pMoneda   varchar(20) const;
  pCtaIni   varchar(24) const;
  pCtaFin   varchar(24) const;
end-pr;

dcl-pr GLACCNEXT ind extproc('GLACCNEXT');
  pBanco       varchar(20);
  pSucursal    varchar(20);
  pMoneda      varchar(20);
  pCtaCont     varchar(24);
  pDescCta     varchar(120);
  pNatCta      varchar(20);
  pNivCta      varchar(50);
  pCentroCosto varchar(20);
  pDescCC      varchar(120);
  pSaldoAct    packed(18:2);
  pFchProc     timestamp;
  pEstReg      char(1);
end-pr;

dcl-pr GLACCFIN extproc('GLACCFIN');
end-pr;

// GLDATSRV - GLMOVACC
dcl-pr GLMOVTOT extproc('GLMOVTOT');
  pBanco     varchar(20) const;
  pSucursal  varchar(20) const;
  pMoneda    varchar(20) const;
  pCtaCont   varchar(24) const;
  pFecha     date const;
  pDebitos   packed(18:2);
  pCreditos  packed(18:2);
  pCantidad  int(10);
  pPrimerMov timestamp;
  pUltimoMov timestamp;
end-pr;

dcl-pr GLMOVTCNT extproc('GLMOVTCNT');
  pBanco    varchar(20) const;
  pSucursal varchar(20) const;
  pMoneda   varchar(20) const;
  pCtaCont  varchar(24) const;
  pFecha    date const;
  pCntTrans int(10);
  pCntTtran int(10);
  pCntTrdsc int(10);
end-pr;

dcl-pr GLMOVPINI extproc('GLMOVPINI');
  pBanco    varchar(20) const;
  pSucursal varchar(20) const;
  pMoneda   varchar(20) const;
  pCtaCont  varchar(24) const;
  pFecha    date const;
end-pr;

dcl-pr GLMOVPNXT ind extproc('GLMOVPNXT');
  pNumReg   varchar(30);
  pTipoMov  varchar(20);
  pDbCr     char(1);
  pMonto    packed(18:2);
  pFchVal   date;
  pRefExt   varchar(40);
  pEstado   varchar(20);
  pTipoDesc varchar(20);
  pTexto    varchar(200);
end-pr;

dcl-pr GLMOVPFIN extproc('GLMOVPFIN');
end-pr;

// GLBUSSRV - GLBALCAL
dcl-pr GLBALCUL extproc('GLBALCUL');
  pSaldoFte    packed(18:2) const;
  pDebPeriodo  packed(18:2) const;
  pCredPeriodo packed(18:2) const;
  pSaldoIni    packed(18:2);
  pSaldoCalc   packed(18:2);
end-pr;

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

// GLOUTSRV - GLJSONBL
dcl-pr GLJSNINI extproc('GLJSNINI');
end-pr;

dcl-pr GLJSNMETA varchar(250) extproc('GLJSNMETA');
  pAmbiente varchar(10) const;
end-pr;

dcl-pr GLJSNEJEC varchar(400) extproc('GLJSNEJEC');
  pIdEjec   varchar(30) const;
  pFchProc  date const;
  pFchIni   timestamp const;
  pFchFin   timestamp const;
  pUsuario  varchar(10) const;
  pPrograma varchar(10) const;
  pLibreria varchar(10) const;
  pEstado   varchar(20) const;
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

dcl-pr GLJSNPART extproc('GLJSNPART');
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
end-pr;

dcl-pr GLJSNCTA varchar(14000) extproc('GLJSNCTA');
  pBanco       varchar(20) const;
  pSucursal    varchar(20) const;
  pMoneda      varchar(20) const;
  pCtaCont     varchar(24) const;
  pDescCta     varchar(120) const;
  pNaturaleza  varchar(20) const;
  pNivelCta    varchar(50) const;
  pCentroCosto varchar(20) const;
  pSaldoIni    packed(18:2) const;
  pDebPeriodo  packed(18:2) const;
  pCredPeriodo packed(18:2) const;
  pSaldoCalc   packed(18:2) const;
  pSaldoFte    packed(18:2) const;
  pSaldoConc   packed(18:2) const;
  pCantMov     int(10) const;
  pPrimerMov   timestamp const;
  pUltimoMov   timestamp const;
  pDifNeta     packed(18:2) const;
  pDifAbs      packed(18:2) const;
  pTolerancia  packed(18:2) const;
  pExcedeTol   ind const;
  pMotivo      varchar(60) const;
  pCodEstado   varchar(20) const;
  pDescEstado  varchar(60) const;
  pSeveridad   varchar(10) const;
  pRequiereRev ind const;
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

dcl-pr GLJSNICNT int(10) extproc('GLJSNICNT');
end-pr;

dcl-pr GLJSNIGET varchar(300) extproc('GLJSNIGET');
  pIndice int(10) const;
end-pr;

dcl-pr GLJSNCTOT varchar(300) extproc('GLJSNCTOT');
  pTotCuentas int(10) const;
  pTotConcil  int(10) const;
  pTotConDif  int(10) const;
  pSumFte     packed(18:2) const;
  pSumConc    packed(18:2) const;
  pSumDif     packed(18:2) const;
end-pr;

dcl-pr GLJSNHASH varchar(24) extproc('GLJSNHASH');
  pInsumo varchar(100) const;
end-pr;

// GLOUTSRV - GLIFSOUT
dcl-pr GLIFSINI extproc('GLIFSINI');
  pRuta varchar(512) const;
end-pr;

dcl-pr GLIFSWRT extproc('GLIFSWRT');
  pRuta  varchar(512) const;
  pTexto varchar(14000) const;
end-pr;

//------------------------------------------------------------------
// Parametros de ejecucion (RF-01/RF-02/RF-05/RF-07).
//------------------------------------------------------------------
dcl-pi *n;
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
end-pi;

// Datos de la cuenta (GLACCNEXT)
dcl-s wBanco       varchar(20);
dcl-s wSucursal    varchar(20);
dcl-s wMoneda      varchar(20);
dcl-s wCtaCont     varchar(24);
dcl-s wDescCta     varchar(120);
dcl-s wNatCta      varchar(20);
dcl-s wNivCta      varchar(50);
dcl-s wCentroCosto varchar(20);
dcl-s wDescCC      varchar(120);
dcl-s wSaldoAct    packed(18:2);
dcl-s wFchProcGl   timestamp;
dcl-s wEstReg      char(1);

// Totales del periodo (GLMOVTOT) y balance (GLBALCUL)
dcl-s wDebitos   packed(18:2);
dcl-s wCreditos  packed(18:2);
dcl-s wCantMov   int(10);
dcl-s wPrimerMov timestamp;
dcl-s wUltimoMov timestamp;
dcl-s wSaldoIni  packed(18:2);
dcl-s wSaldoCalc packed(18:2);

// Diferencias y estado de conciliacion (GLCONDIF)
dcl-s wSaldoConc   packed(18:2);
dcl-s wDifNeta     packed(18:2);
dcl-s wDifAbs      packed(18:2);
dcl-s wExcedeTol   ind;
dcl-s wMotivo      varchar(60);
dcl-s wCodEstado   varchar(20);
dcl-s wDescEstado  varchar(60);
dcl-s wSeveridad   varchar(10);
dcl-s wRequiereRev ind;

// Trazabilidad (GLMOVTCNT / GLJSNHASH)
dcl-s wCntTrans int(10);
dcl-s wCntTtran int(10);
dcl-s wCntTrdsc int(10);
dcl-s wHashIn   varchar(100);
dcl-s wHash     varchar(24);

// Partidas conciliatorias (GLMOVPNXT / GLCONPART / GLJSNPART)
dcl-s wNumReg     varchar(30);
dcl-s wTipoMov    varchar(20);
dcl-s wDbCr       char(1);
dcl-s wMontoP     packed(18:2);
dcl-s wFchVal     date;
dcl-s wRefExt     varchar(40);
dcl-s wEstadoTx   varchar(20);
dcl-s wTipoDesc   varchar(20);
dcl-s wTexto      varchar(200);
dcl-s wIdPartida  varchar(10);
dcl-s wTipoPart   varchar(20);
dcl-s wEstadoPart varchar(20);
dcl-s wSigno      varchar(10);

// Control de totales (GLCONTGET)
dcl-s wTotCuentas int(10);
dcl-s wTotConcil  int(10);
dcl-s wTotConDif  int(10);
dcl-s wSumFte     packed(18:2);
dcl-s wSumConc    packed(18:2);
dcl-s wSumDif     packed(18:2);

// Ejecucion (RF-07)
dcl-s wTsIni    timestamp;
dcl-s wTsFin    timestamp;
dcl-s wIdEjec   varchar(30);
dcl-s wEstadoEj varchar(20);
dcl-s wAnio     int(5);
dcl-s wMes      int(5);
dcl-s wMensaje  varchar(120);
dcl-s i         int(10);

//------------------------------------------------------------------
// 1. Inicializacion de la ejecucion.
//------------------------------------------------------------------
wTsIni  = %timestamp();
wIdEjec = 'GLCNC' + %scanrpl('.': '': %scanrpl('-': '': %char(wTsIni: *iso)));

wAnio = UTLANIO(pFchProc);
wMes  = UTLMES(pFchProc);

UTLBITINI();
GLJSNINI();
GLCONTINI();

//------------------------------------------------------------------
// 2. Recorrido de cuentas mayores (RF-01) y procesamiento individual
//    (RF-02/RF-03/RF-04). Un error en una cuenta se registra como
//    incidente CRITICA y no detiene el proceso (RF-08).
//------------------------------------------------------------------
GLACCINI(pBanco: pSucursal: pMoneda: pCtaIni: pCtaFin);

dow GLACCNEXT(wBanco: wSucursal: wMoneda: wCtaCont: wDescCta: wNatCta:
              wNivCta: wCentroCosto: wDescCC: wSaldoAct: wFchProcGl: wEstReg);

  monitor;

    // Totales de movimientos del periodo (TRANS) y balance (RF-02)
    GLMOVTOT(wBanco: wSucursal: wMoneda: wCtaCont: pFchProc:
             wDebitos: wCreditos: wCantMov: wPrimerMov: wUltimoMov);

    GLBALCUL(wSaldoAct: wDebitos: wCreditos: wSaldoIni: wSaldoCalc);

    // Partidas conciliatorias pendientes (TTRAN/TRDSC del dia) (RF-03)
    GLCONINI();
    GLJSNPINI();
    GLMOVPINI(wBanco: wSucursal: wMoneda: wCtaCont: pFchProc);

    dow GLMOVPNXT(wNumReg: wTipoMov: wDbCr: wMontoP: wFchVal: wRefExt:
                  wEstadoTx: wTipoDesc: wTexto);
      GLCONPART(wDbCr: wMontoP: wIdPartida: wTipoPart: wEstadoPart: wSigno);
      GLJSNPART(wIdPartida: wTipoPart: wTipoDesc: wRefExt: wFchVal: wMontoP:
                wSigno: wEstadoPart: 'TTRAN': wTexto);
    enddo;

    GLMOVPFIN();

    // Diferencias y estado de conciliacion (RF-03)
    GLCONDIF(wSaldoAct: wSaldoCalc: pTolerancia: wSaldoConc: wDifNeta:
             wDifAbs: wExcedeTol: wMotivo: wCodEstado: wDescEstado:
             wSeveridad: wRequiereRev);

    GLCONTOT(wCodEstado: wSaldoAct: wSaldoConc: wDifNeta);

    // Trazabilidad de registros fuente y hash de la cuenta (RF-07)
    GLMOVTCNT(wBanco: wSucursal: wMoneda: wCtaCont: pFchProc:
              wCntTrans: wCntTtran: wCntTrdsc);

    wHashIn = %trim(wBanco) + '-' + %trim(wSucursal) + '-' + %trim(wMoneda)
            + '-' + %trim(wCtaCont) + '-' + %char(wSaldoAct);
    wHash = GLJSNHASH(wHashIn);

    // Fragmento JSON de la cuenta (RF-05)
    GLJSNCTA(wBanco: wSucursal: wMoneda: wCtaCont: wDescCta: wNatCta:
             wNivCta: wCentroCosto: wSaldoIni: wDebitos: wCreditos:
             wSaldoCalc: wSaldoAct: wSaldoConc: wCantMov: wPrimerMov:
             wUltimoMov: wDifNeta: wDifAbs: pTolerancia: wExcedeTol:
             wMotivo: wCodEstado: wDescEstado: wSeveridad: wRequiereRev:
             wHash: wCntTrans: wCntTrdsc: wCntTtran);

    // Incidentes derivados del estado de conciliacion (RF-08)
    if wCodEstado = 'NO_CONCILIADA';
      wMensaje = 'Cuenta ' + %trim(wCtaCont) + ': ' + %trim(wMotivo)
               + ' (diferencia neta ' + %char(wDifNeta) + ').';
      UTLBITADD('ERR-GL-001': 'DIFERENCIA_TOLERANCIA': wCtaCont: wMensaje: wSeveridad);
      GLJSNINC('ERR-GL-001': 'DIFERENCIA_TOLERANCIA': wCtaCont: wMensaje: wSeveridad);
    elseif wCodEstado = 'PARCIAL';
      wMensaje = 'Cuenta ' + %trim(wCtaCont) + ': ' + %trim(wMotivo) + '.';
      UTLBITADD('WARN-GL-001': 'PARTIDA_TRANSITO': wCtaCont: wMensaje: wSeveridad);
      GLJSNINC('WARN-GL-001': 'PARTIDA_TRANSITO': wCtaCont: wMensaje: wSeveridad);
    endif;

  on-error;
    wMensaje = 'Error procesando cuenta ' + %trim(wCtaCont)
             + ' (SQLSTT=' + SQLSTT + ').';
    UTLBITADD('ERR-GL-999': 'ERROR_PROCESO': wCtaCont: wMensaje: 'CRITICA');
    GLJSNINC('ERR-GL-999': 'ERROR_PROCESO': wCtaCont: wMensaje: 'CRITICA');
  endmon;

enddo;

GLACCFIN();

//------------------------------------------------------------------
// 3. Cierre de la ejecucion: estado final, control de totales (RF-04).
//------------------------------------------------------------------
wTsFin = %timestamp();

select;
  when UTLBITMAX() = 'CRITICA';
    wEstadoEj = 'ERROR';
  when UTLBITMAX() = 'ALTA';
    wEstadoEj = 'PARCIAL';
  other;
    wEstadoEj = 'FINALIZADO';
endsl;

GLCONTGET(wTotCuentas: wTotConcil: wTotConDif: wSumFte: wSumConc: wSumDif);

//------------------------------------------------------------------
// 4. Ensamblado y publicacion del documento JSON en IFS (RF-05/RF-06).
//    Los fragmentos de cuentas e incidentes ya fueron acumulados por
//    GLJSONBL durante el recorrido anterior; aqui se escriben en el
//    orden del documento (metadata, ejecucion, contexto, cuentas,
//    controlTotales, incidentes).
//------------------------------------------------------------------
GLIFSINI(pRutaJson);

GLIFSWRT(pRutaJson: '{"metadata":' + GLJSNMETA(pAmbiente) + ',');

GLIFSWRT(pRutaJson: '"ejecucion":'
  + GLJSNEJEC(wIdEjec: pFchProc: wTsIni: wTsFin: pUsuario: 'GLCNC001':
              'IROJAS941': wEstadoEj) + ',');

GLIFSWRT(pRutaJson: '"contexto":'
  + GLJSNCTX(pBanco: pSucursal: pMoneda: wAnio: wMes: pFchProc: pCtaIni: pCtaFin)
  + ',');

GLIFSWRT(pRutaJson: '"cuentas":[');
for i = 1 to GLJSNCCNT();
  if i > 1;
    GLIFSWRT(pRutaJson: ',');
  endif;
  GLIFSWRT(pRutaJson: GLJSNCGET(i));
endfor;
GLIFSWRT(pRutaJson: ']');

GLIFSWRT(pRutaJson: ',"controlTotales":'
  + GLJSNCTOT(wTotCuentas: wTotConcil: wTotConDif: wSumFte: wSumConc: wSumDif)
  + ',');

GLIFSWRT(pRutaJson: '"incidentes":[');
for i = 1 to GLJSNICNT();
  if i > 1;
    GLIFSWRT(pRutaJson: ',');
  endif;
  GLIFSWRT(pRutaJson: GLJSNIGET(i));
endfor;
GLIFSWRT(pRutaJson: ']}');

//------------------------------------------------------------------
// 5. Bitacora de ejecucion en IFS (RF-07).
//------------------------------------------------------------------
UTLBITESC(pRutaBitac: wIdEjec: UTLFMTFEC(pFchProc): UTLFMTTS(wTsIni):
          UTLFMTTS(wTsFin): wTotCuentas: wEstadoEj);

*inlr = *on;

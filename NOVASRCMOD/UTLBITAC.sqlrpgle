**FREE
//==============================================================================
// Modulo               : UTLBITAC
// Descripcion          : Acumula incidentes de ejecucion en memoria (RF-07/
//                         RF-08) y escribe la bitacora .txt de la corrida en
//                         IFS.
// Service Program      : GLUTLSRV
// Hecho por            : Isaac Rojas
// Fecha                : 2026-06-13
// Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
//==============================================================================
ctl-opt nomain;

exec sql SET OPTION COMMIT=*NONE;

dcl-c MAXINCID 500;

// Almacen en memoria de incidentes de la ejecucion actual (RF-07/RF-08).
dcl-ds g_bitac dim(MAXINCID) qualified;
  codigo  varchar(20);
  tipo    varchar(20);
  cuenta  varchar(20);
  mensaje varchar(120);
  severid varchar(10);
end-ds;

dcl-s g_bitCnt int(10) inz(0);

//------------------------------------------------------------------
// UTLBITINI: Reinicia el acumulador de incidentes para una nueva
//            ejecucion.
//------------------------------------------------------------------
dcl-proc UTLBITINI export;
  dcl-pi *n end-pi;

  g_bitCnt = 0;
end-proc;

//------------------------------------------------------------------
// UTLBITADD: Agrega un incidente al acumulador en memoria.
//------------------------------------------------------------------
dcl-proc UTLBITADD export;
  dcl-pi *n;
    pCodigo  varchar(20) const;
    pTipo    varchar(20) const;
    pCuenta  varchar(20) const;
    pMensaje varchar(120) const;
    pSeverid varchar(10) const;
  end-pi;

  if g_bitCnt < MAXINCID;
    g_bitCnt += 1;
    g_bitac(g_bitCnt).codigo  = pCodigo;
    g_bitac(g_bitCnt).tipo    = pTipo;
    g_bitac(g_bitCnt).cuenta  = pCuenta;
    g_bitac(g_bitCnt).mensaje = pMensaje;
    g_bitac(g_bitCnt).severid = pSeverid;
  endif;
end-proc;

//------------------------------------------------------------------
// UTLBITCNT: Devuelve la cantidad de incidentes acumulados.
//------------------------------------------------------------------
dcl-proc UTLBITCNT export;
  dcl-pi *n int(10);
  end-pi;

  return g_bitCnt;
end-proc;

//------------------------------------------------------------------
// UTLBITGET: Recupera el incidente de la posicion indicada (1..N).
//            Devuelve *off si la posicion no existe.
//------------------------------------------------------------------
dcl-proc UTLBITGET export;
  dcl-pi *n ind;
    pIndice  int(10) const;
    pCodigo  varchar(20);
    pTipo    varchar(20);
    pCuenta  varchar(20);
    pMensaje varchar(120);
    pSeverid varchar(10);
  end-pi;

  if pIndice < 1 or pIndice > g_bitCnt;
    return *off;
  endif;

  pCodigo  = g_bitac(pIndice).codigo;
  pTipo    = g_bitac(pIndice).tipo;
  pCuenta  = g_bitac(pIndice).cuenta;
  pMensaje = g_bitac(pIndice).mensaje;
  pSeverid = g_bitac(pIndice).severid;

  return *on;
end-proc;

//------------------------------------------------------------------
// UTLBITMAX: Devuelve la severidad mas alta entre los incidentes
//            acumulados ('CRITICA' > 'ALTA' > 'MEDIA' > 'BAJA').
//            Devuelve cadena vacia si no hay incidentes.
//------------------------------------------------------------------
dcl-proc UTLBITMAX export;
  dcl-pi *n varchar(10);
  end-pi;

  dcl-s wMax varchar(10) inz('');
  dcl-s i int(10);

  for i = 1 to g_bitCnt;
    select;
      when g_bitac(i).severid = 'CRITICA';
        return 'CRITICA';
      when g_bitac(i).severid = 'ALTA';
        wMax = 'ALTA';
      when g_bitac(i).severid = 'MEDIA' and wMax <> 'ALTA';
        wMax = 'MEDIA';
      when g_bitac(i).severid = 'BAJA' and wMax = '';
        wMax = 'BAJA';
    endsl;
  endfor;

  return wMax;
end-proc;

//------------------------------------------------------------------
// UTLBITESC: Escribe la bitacora .txt de la ejecucion en IFS (RF-07),
//            incluyendo encabezado de ejecucion y detalle de
//            incidentes acumulados.
//------------------------------------------------------------------
dcl-proc UTLBITESC export;
  dcl-pi *n;
    pRuta    varchar(512) const;
    pIdEjec  varchar(30) const;
    pFchProc varchar(10) const;
    pFchIni  varchar(19) const;
    pFchFin  varchar(19) const;
    pTotCtas int(10) const;
    pEstado  varchar(20) const;
  end-pi;

  dcl-s wLinea varchar(1000);
  dcl-s i int(10);

  exec sql
    CALL QSYS2.IFS_WRITE_UTF8(
      PATH_NAME   => :pRuta,
      LINE        => '',
      OVERWRITE   => 'REPLACE',
      END_OF_LINE => 'NONE');

  wLinea = '=== BITACORA DE EJECUCION GLCNC001 ===';
  exec sql CALL QSYS2.IFS_WRITE_UTF8(PATH_NAME => :pRuta, LINE => :wLinea);

  wLinea = 'idEjecucion     : ' + %trim(pIdEjec);
  exec sql CALL QSYS2.IFS_WRITE_UTF8(PATH_NAME => :pRuta, LINE => :wLinea);

  wLinea = 'fechaProceso    : ' + %trim(pFchProc);
  exec sql CALL QSYS2.IFS_WRITE_UTF8(PATH_NAME => :pRuta, LINE => :wLinea);

  wLinea = 'fechaHoraInicio : ' + %trim(pFchIni);
  exec sql CALL QSYS2.IFS_WRITE_UTF8(PATH_NAME => :pRuta, LINE => :wLinea);

  wLinea = 'fechaHoraFin    : ' + %trim(pFchFin);
  exec sql CALL QSYS2.IFS_WRITE_UTF8(PATH_NAME => :pRuta, LINE => :wLinea);

  wLinea = 'totalCuentas    : ' + %char(pTotCtas);
  exec sql CALL QSYS2.IFS_WRITE_UTF8(PATH_NAME => :pRuta, LINE => :wLinea);

  wLinea = 'estadoEjecucion : ' + %trim(pEstado);
  exec sql CALL QSYS2.IFS_WRITE_UTF8(PATH_NAME => :pRuta, LINE => :wLinea);

  wLinea = '--- INCIDENTES (' + %char(g_bitCnt) + ') ---';
  exec sql CALL QSYS2.IFS_WRITE_UTF8(PATH_NAME => :pRuta, LINE => :wLinea);

  for i = 1 to g_bitCnt;
    wLinea = '[' + %trim(g_bitac(i).severid) + '] '
           + %trim(g_bitac(i).codigo) + ' - '
           + %trim(g_bitac(i).tipo) + ' - cuenta '
           + %trim(g_bitac(i).cuenta) + ': '
           + %trim(g_bitac(i).mensaje);
    exec sql CALL QSYS2.IFS_WRITE_UTF8(PATH_NAME => :pRuta, LINE => :wLinea);
  endfor;
end-proc;

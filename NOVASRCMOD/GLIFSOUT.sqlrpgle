**FREE
//==============================================================================
// Modulo               : GLIFSOUT
// Descripcion          : Publicacion del documento JSON de conciliacion en
//                         IFS (RF-05/RF-06). Encapsula la escritura del
//                         archivo: inicializa/reemplaza el archivo de salida y
//                         agrega fragmentos de texto sin salto de linea, para
//                         que los fragmentos JSON construidos por GLJSONBL
//                         formen un unico documento JSON valido.
// Service Program      : GLOUTSRV
// Hecho por            : Isaac Rojas
// Fecha                : 2026-06-13
// Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
//==============================================================================
ctl-opt nomain;

exec sql SET OPTION COMMIT=*NONE;

//------------------------------------------------------------------
// GLIFSINI: Crea (o reemplaza) el archivo de salida en IFS, dejandolo
//           vacio para recibir los fragmentos del documento JSON.
//------------------------------------------------------------------
dcl-proc GLIFSINI export;
  dcl-pi *n;
    pRuta varchar(512) const;
  end-pi;

  exec sql
    CALL QSYS2.IFS_WRITE_UTF8(
      PATH_NAME   => :pRuta,
      LINE        => '',
      OVERWRITE   => 'REPLACE',
      END_OF_LINE => 'NONE');
end-proc;

//------------------------------------------------------------------
// GLIFSWRT: Agrega un fragmento de texto al archivo de salida en IFS,
//           sin salto de linea, de modo que la concatenacion de los
//           fragmentos escritos forme el documento JSON completo.
//------------------------------------------------------------------
dcl-proc GLIFSWRT export;
  dcl-pi *n;
    pRuta  varchar(512) const;
    pTexto varchar(14000) const;
  end-pi;

  exec sql
    CALL QSYS2.IFS_WRITE_UTF8(
      PATH_NAME   => :pRuta,
      LINE        => :pTexto,
      OVERWRITE   => 'APPEND',
      END_OF_LINE => 'NONE');
end-proc;

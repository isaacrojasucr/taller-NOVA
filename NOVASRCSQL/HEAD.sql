--==============================================================================
-- Nombre de la Tabla   : HEAD
-- DESCRIPCIÓN          : Archivo títulos de reportes
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 1 - Archivos Comunes) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Catalogo
-- Origen de los Datos  : Mantenimiento administrativo / parametrizacion del sistema core bancario (carga manual o por proceso de configuracion).
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.HEAD (
  NOMBRE_PRINTER_FILE    FOR COLUMN NOMPRIFIL  VARCHAR(50) NOT NULL,
  SECUENCIA              INTEGER NOT NULL,
  DESCRIPCION            FOR COLUMN DESCRIP    VARCHAR(120) NOT NULL,
  VALOR_TEXTO            FOR COLUMN VALORTXT   VARCHAR(50) NOT NULL,
  VALOR_NUMERICO         FOR COLUMN VALORNUM   DECIMAL(18 , 2) NOT NULL,
  VIGENCIA_DESDE         FOR COLUMN VIGDESDE   DATE NOT NULL,
  VIGENCIA_HASTA         FOR COLUMN VIGHASTA   DATE NOT NULL,
  ORDEN_VISUALIZACION    FOR COLUMN ORDVISUAL  INTEGER NOT NULL,
  USUARIO_CREACION       FOR COLUMN USRCREA    VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA   VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG    INTEGER       NOT NULL DEFAULT 1,
  OBSERVACIONES          FOR COLUMN OBSERVAC   VARCHAR(120),
  ESTADO_REGISTRO        FOR COLUMN ESTREG     CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT  TIMESTAMP,
  CONSTRAINT HEAD_PK PRIMARY KEY (NOMBRE_PRINTER_FILE, SECUENCIA)
) RCDFMT HEADR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.HEAD IS 'Titulos de Reportes';

COMMENT ON TABLE IROJAS941.HEAD IS 'Catalogo de titulos de reportes, identificados por el nombre del printer file y un numero de secuencia de linea de titulo.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.HEAD (NOMBRE_PRINTER_FILE IS 'Nombre Printer File');
LABEL ON COLUMN IROJAS941.HEAD (SECUENCIA IS 'Secuencia');
LABEL ON COLUMN IROJAS941.HEAD (DESCRIPCION IS 'Descripcion');
LABEL ON COLUMN IROJAS941.HEAD (VALOR_TEXTO IS 'Valor Texto');
LABEL ON COLUMN IROJAS941.HEAD (VALOR_NUMERICO IS 'Valor Numerico');
LABEL ON COLUMN IROJAS941.HEAD (VIGENCIA_DESDE IS 'Vigencia Desde');
LABEL ON COLUMN IROJAS941.HEAD (VIGENCIA_HASTA IS 'Vigencia Hasta');
LABEL ON COLUMN IROJAS941.HEAD (ORDEN_VISUALIZACION IS 'Orden Visualizacion');
LABEL ON COLUMN IROJAS941.HEAD (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.HEAD (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.HEAD (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.HEAD (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.HEAD (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.HEAD (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.HEAD (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.HEAD.NOMBRE_PRINTER_FILE IS 'PK (1/2). Nombre Printer File de HEAD.';
COMMENT ON COLUMN IROJAS941.HEAD.SECUENCIA IS 'PK (2/2). Secuencia de HEAD.';
COMMENT ON COLUMN IROJAS941.HEAD.DESCRIPCION IS 'Descripcion de HEAD.';
COMMENT ON COLUMN IROJAS941.HEAD.VALOR_TEXTO IS 'Valor Texto de HEAD.';
COMMENT ON COLUMN IROJAS941.HEAD.VALOR_NUMERICO IS 'Valor Numerico de HEAD.';
COMMENT ON COLUMN IROJAS941.HEAD.VIGENCIA_DESDE IS 'Vigencia Desde de HEAD.';
COMMENT ON COLUMN IROJAS941.HEAD.VIGENCIA_HASTA IS 'Vigencia Hasta de HEAD.';
COMMENT ON COLUMN IROJAS941.HEAD.ORDEN_VISUALIZACION IS 'Orden Visualizacion de HEAD.';
COMMENT ON COLUMN IROJAS941.HEAD.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.HEAD.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.HEAD.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.HEAD.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.HEAD.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.HEAD.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.HEAD.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

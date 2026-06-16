--==============================================================================
-- Nombre de la Tabla   : CNTRLTAX
-- DESCRIPCIÓN          : Definiciones para el manejo de cobro de impuestos.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 1 - Archivos Comunes) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Control / Parametros
-- Origen de los Datos  : Mantenimiento administrativo / parametrizacion del sistema core bancario (carga manual o por proceso de configuracion).
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.CNTRLTAX (
  CODIGO_BANCO           FOR COLUMN CODBANCO   VARCHAR(20) NOT NULL,
  CODIGO_IMPUESTO        FOR COLUMN CODIMP     VARCHAR(20) NOT NULL,
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
  CONSTRAINT CNTRLTAX_PK PRIMARY KEY (CODIGO_BANCO, CODIGO_IMPUESTO)
) RCDFMT CNTRLTAXR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.CNTRLTAX IS 'Definiciones Cobro Impuestos';

COMMENT ON TABLE IROJAS941.CNTRLTAX IS 'Definiciones para el manejo del cobro de impuestos, identificadas por codigo de banco y codigo de impuesto.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.CNTRLTAX (CODIGO_BANCO IS 'Codigo Banco');
LABEL ON COLUMN IROJAS941.CNTRLTAX (CODIGO_IMPUESTO IS 'Codigo Impuesto');
LABEL ON COLUMN IROJAS941.CNTRLTAX (DESCRIPCION IS 'Descripcion');
LABEL ON COLUMN IROJAS941.CNTRLTAX (VALOR_TEXTO IS 'Valor Texto');
LABEL ON COLUMN IROJAS941.CNTRLTAX (VALOR_NUMERICO IS 'Valor Numerico');
LABEL ON COLUMN IROJAS941.CNTRLTAX (VIGENCIA_DESDE IS 'Vigencia Desde');
LABEL ON COLUMN IROJAS941.CNTRLTAX (VIGENCIA_HASTA IS 'Vigencia Hasta');
LABEL ON COLUMN IROJAS941.CNTRLTAX (ORDEN_VISUALIZACION IS 'Orden Visualizacion');
LABEL ON COLUMN IROJAS941.CNTRLTAX (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.CNTRLTAX (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.CNTRLTAX (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.CNTRLTAX (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.CNTRLTAX (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.CNTRLTAX (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.CNTRLTAX (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.CNTRLTAX.CODIGO_BANCO IS 'PK (1/2). Codigo Banco de CNTRLTAX.';
COMMENT ON COLUMN IROJAS941.CNTRLTAX.CODIGO_IMPUESTO IS 'PK (2/2). Codigo Impuesto de CNTRLTAX.';
COMMENT ON COLUMN IROJAS941.CNTRLTAX.DESCRIPCION IS 'Descripcion de CNTRLTAX.';
COMMENT ON COLUMN IROJAS941.CNTRLTAX.VALOR_TEXTO IS 'Valor Texto de CNTRLTAX.';
COMMENT ON COLUMN IROJAS941.CNTRLTAX.VALOR_NUMERICO IS 'Valor Numerico de CNTRLTAX.';
COMMENT ON COLUMN IROJAS941.CNTRLTAX.VIGENCIA_DESDE IS 'Vigencia Desde de CNTRLTAX.';
COMMENT ON COLUMN IROJAS941.CNTRLTAX.VIGENCIA_HASTA IS 'Vigencia Hasta de CNTRLTAX.';
COMMENT ON COLUMN IROJAS941.CNTRLTAX.ORDEN_VISUALIZACION IS 'Orden Visualizacion de CNTRLTAX.';
COMMENT ON COLUMN IROJAS941.CNTRLTAX.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CNTRLTAX.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CNTRLTAX.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.CNTRLTAX.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.CNTRLTAX.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.CNTRLTAX.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.CNTRLTAX.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

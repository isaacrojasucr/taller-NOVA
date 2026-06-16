--==============================================================================
-- Nombre de la Tabla   : CNOFC
-- DESCRIPCIÓN          : Archivo de Referencias del Sistema o de Datos Comunes.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 1 - Archivos Comunes) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Catalogo / Referencias del sistema
-- Origen de los Datos  : Mantenimiento administrativo / parametrizacion del sistema core bancario (carga manual o por proceso de configuracion).
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.CNOFC (
  CODIGO_TABLA           FOR COLUMN CODTBL     VARCHAR(20) NOT NULL,
  CODIGO_REGISTRO        FOR COLUMN CODREG     VARCHAR(20) NOT NULL,
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
  CONSTRAINT CNOFC_PK PRIMARY KEY (CODIGO_TABLA, CODIGO_REGISTRO)
) RCDFMT CNOFCR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.CNOFC IS 'Referencias del Sistema';

COMMENT ON TABLE IROJAS941.CNOFC IS 'Referencias del sistema o de datos comunes, identificadas por codigo de tabla y codigo de registro. Tabla de dominio reutilizable por otros procesos.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.CNOFC (CODIGO_TABLA IS 'Codigo Tabla');
LABEL ON COLUMN IROJAS941.CNOFC (CODIGO_REGISTRO IS 'Codigo Registro');
LABEL ON COLUMN IROJAS941.CNOFC (DESCRIPCION IS 'Descripcion');
LABEL ON COLUMN IROJAS941.CNOFC (VALOR_TEXTO IS 'Valor Texto');
LABEL ON COLUMN IROJAS941.CNOFC (VALOR_NUMERICO IS 'Valor Numerico');
LABEL ON COLUMN IROJAS941.CNOFC (VIGENCIA_DESDE IS 'Vigencia Desde');
LABEL ON COLUMN IROJAS941.CNOFC (VIGENCIA_HASTA IS 'Vigencia Hasta');
LABEL ON COLUMN IROJAS941.CNOFC (ORDEN_VISUALIZACION IS 'Orden Visualizacion');
LABEL ON COLUMN IROJAS941.CNOFC (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.CNOFC (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.CNOFC (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.CNOFC (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.CNOFC (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.CNOFC (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.CNOFC (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.CNOFC.CODIGO_TABLA IS 'PK (1/2). Codigo Tabla de CNOFC.';
COMMENT ON COLUMN IROJAS941.CNOFC.CODIGO_REGISTRO IS 'PK (2/2). Codigo Registro de CNOFC.';
COMMENT ON COLUMN IROJAS941.CNOFC.DESCRIPCION IS 'Descripcion de CNOFC.';
COMMENT ON COLUMN IROJAS941.CNOFC.VALOR_TEXTO IS 'Valor Texto de CNOFC.';
COMMENT ON COLUMN IROJAS941.CNOFC.VALOR_NUMERICO IS 'Valor Numerico de CNOFC.';
COMMENT ON COLUMN IROJAS941.CNOFC.VIGENCIA_DESDE IS 'Vigencia Desde de CNOFC.';
COMMENT ON COLUMN IROJAS941.CNOFC.VIGENCIA_HASTA IS 'Vigencia Hasta de CNOFC.';
COMMENT ON COLUMN IROJAS941.CNOFC.ORDEN_VISUALIZACION IS 'Orden Visualizacion de CNOFC.';
COMMENT ON COLUMN IROJAS941.CNOFC.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CNOFC.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CNOFC.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.CNOFC.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.CNOFC.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.CNOFC.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.CNOFC.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

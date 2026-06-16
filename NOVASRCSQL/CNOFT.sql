--==============================================================================
-- Nombre de la Tabla   : CNOFT
-- DESCRIPCIÓN          : Archivo Maestro de Tablas de Datos Comunes.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 1 - Archivos Comunes) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Catalogo / Parametros generales
-- Origen de los Datos  : Mantenimiento administrativo / parametrizacion del sistema core bancario (carga manual o por proceso de configuracion).
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.CNOFT (
  CODIGO_TABLA           FOR COLUMN CODTBL     VARCHAR(20) NOT NULL,
  IDIOMA                 VARCHAR(20) NOT NULL,
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
  CONSTRAINT CNOFT_PK PRIMARY KEY (CODIGO_TABLA, IDIOMA)
) RCDFMT CNOFTR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.CNOFT IS 'Maestro Tablas Comunes';

COMMENT ON TABLE IROJAS941.CNOFT IS 'Catalogo general de valores parametrizables del sistema, identificados por codigo de tabla e idioma. Funciona como tabla de dominio reutilizable por otros procesos.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.CNOFT (CODIGO_TABLA IS 'Codigo Tabla');
LABEL ON COLUMN IROJAS941.CNOFT (IDIOMA IS 'Idioma');
LABEL ON COLUMN IROJAS941.CNOFT (DESCRIPCION IS 'Descripcion');
LABEL ON COLUMN IROJAS941.CNOFT (VALOR_TEXTO IS 'Valor Texto');
LABEL ON COLUMN IROJAS941.CNOFT (VALOR_NUMERICO IS 'Valor Numerico');
LABEL ON COLUMN IROJAS941.CNOFT (VIGENCIA_DESDE IS 'Vigencia Desde');
LABEL ON COLUMN IROJAS941.CNOFT (VIGENCIA_HASTA IS 'Vigencia Hasta');
LABEL ON COLUMN IROJAS941.CNOFT (ORDEN_VISUALIZACION IS 'Orden Visualizacion');
LABEL ON COLUMN IROJAS941.CNOFT (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.CNOFT (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.CNOFT (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.CNOFT (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.CNOFT (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.CNOFT (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.CNOFT (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.CNOFT.CODIGO_TABLA IS 'PK (1/2). Codigo Tabla de CNOFT.';
COMMENT ON COLUMN IROJAS941.CNOFT.IDIOMA IS 'PK (2/2). Idioma de CNOFT.';
COMMENT ON COLUMN IROJAS941.CNOFT.DESCRIPCION IS 'Descripcion de CNOFT.';
COMMENT ON COLUMN IROJAS941.CNOFT.VALOR_TEXTO IS 'Valor Texto de CNOFT.';
COMMENT ON COLUMN IROJAS941.CNOFT.VALOR_NUMERICO IS 'Valor Numerico de CNOFT.';
COMMENT ON COLUMN IROJAS941.CNOFT.VIGENCIA_DESDE IS 'Vigencia Desde de CNOFT.';
COMMENT ON COLUMN IROJAS941.CNOFT.VIGENCIA_HASTA IS 'Vigencia Hasta de CNOFT.';
COMMENT ON COLUMN IROJAS941.CNOFT.ORDEN_VISUALIZACION IS 'Orden Visualizacion de CNOFT.';
COMMENT ON COLUMN IROJAS941.CNOFT.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CNOFT.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CNOFT.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.CNOFT.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.CNOFT.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.CNOFT.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.CNOFT.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

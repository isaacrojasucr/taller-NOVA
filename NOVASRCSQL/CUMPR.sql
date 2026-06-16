--==============================================================================
-- Nombre de la Tabla   : CUMPR
-- DESCRIPCIÓN          : Archivo Maestro de Palabras Reservadas que se omiten en Búsqueda de Clientes por String de Caracteres.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 2 - Clientes) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Catalogo
-- Origen de los Datos  : Mantenimiento administrativo / parametrizacion del sistema core bancario (carga manual o por proceso de configuracion).
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.CUMPR (
  PALABRA                VARCHAR(50) NOT NULL,
  TIPO_PERSONA           FOR COLUMN TIPOPERS   VARCHAR(20) NOT NULL,
  TIPO_IDENTIFICACION    FOR COLUMN TIPOID     VARCHAR(20) NOT NULL,
  NUMERO_IDENTIFICACION  FOR COLUMN NUMID      VARCHAR(30) NOT NULL,
  NOMBRES                VARCHAR(80) NOT NULL,
  APELLIDOS              VARCHAR(80) NOT NULL,
  RAZON_SOCIAL           FOR COLUMN RAZOSOCI   VARCHAR(80) NOT NULL,
  FECHA_NACIMIENTO       FOR COLUMN FCHNACI    DATE NOT NULL,
  DIRECCION              VARCHAR(120) NOT NULL,
  EMAIL                  VARCHAR(80) NOT NULL,
  TELEFONO               VARCHAR(80) NOT NULL,
  PAIS_RESIDENCIA        FOR COLUMN PAISRESI   VARCHAR(50) NOT NULL,
  USUARIO_CREACION       FOR COLUMN USRCREA    VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA   VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG    INTEGER       NOT NULL DEFAULT 1,
  OBSERVACIONES          FOR COLUMN OBSERVAC   VARCHAR(120),
  ESTADO_REGISTRO        FOR COLUMN ESTREG     CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT  TIMESTAMP,
  CONSTRAINT CUMPR_PK PRIMARY KEY (PALABRA)
) RCDFMT CUMPRR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.CUMPR IS 'Palabras Reservadas Busqueda';

COMMENT ON TABLE IROJAS941.CUMPR IS 'Catalogo de palabras reservadas que se omiten en la busqueda de clientes por cadena de caracteres, identificadas por la palabra.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.CUMPR (PALABRA IS 'Palabra');
LABEL ON COLUMN IROJAS941.CUMPR (TIPO_PERSONA IS 'Tipo Persona');
LABEL ON COLUMN IROJAS941.CUMPR (TIPO_IDENTIFICACION IS 'Tipo Identificacion');
LABEL ON COLUMN IROJAS941.CUMPR (NUMERO_IDENTIFICACION IS 'Numero Identificacion');
LABEL ON COLUMN IROJAS941.CUMPR (NOMBRES IS 'Nombres');
LABEL ON COLUMN IROJAS941.CUMPR (APELLIDOS IS 'Apellidos');
LABEL ON COLUMN IROJAS941.CUMPR (RAZON_SOCIAL IS 'Razon Social');
LABEL ON COLUMN IROJAS941.CUMPR (FECHA_NACIMIENTO IS 'Fecha Nacimiento');
LABEL ON COLUMN IROJAS941.CUMPR (DIRECCION IS 'Direccion');
LABEL ON COLUMN IROJAS941.CUMPR (EMAIL IS 'Email');
LABEL ON COLUMN IROJAS941.CUMPR (TELEFONO IS 'Telefono');
LABEL ON COLUMN IROJAS941.CUMPR (PAIS_RESIDENCIA IS 'Pais Residencia');
LABEL ON COLUMN IROJAS941.CUMPR (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.CUMPR (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.CUMPR (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.CUMPR (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.CUMPR (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.CUMPR (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.CUMPR (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.CUMPR.PALABRA IS 'PK (1/1). Palabra de CUMPR.';
COMMENT ON COLUMN IROJAS941.CUMPR.TIPO_PERSONA IS 'Tipo Persona de CUMPR.';
COMMENT ON COLUMN IROJAS941.CUMPR.TIPO_IDENTIFICACION IS 'Tipo Identificacion de CUMPR.';
COMMENT ON COLUMN IROJAS941.CUMPR.NUMERO_IDENTIFICACION IS 'Numero Identificacion de CUMPR.';
COMMENT ON COLUMN IROJAS941.CUMPR.NOMBRES IS 'Nombres de CUMPR.';
COMMENT ON COLUMN IROJAS941.CUMPR.APELLIDOS IS 'Apellidos de CUMPR.';
COMMENT ON COLUMN IROJAS941.CUMPR.RAZON_SOCIAL IS 'Razon Social de CUMPR.';
COMMENT ON COLUMN IROJAS941.CUMPR.FECHA_NACIMIENTO IS 'Fecha Nacimiento de CUMPR.';
COMMENT ON COLUMN IROJAS941.CUMPR.DIRECCION IS 'Direccion de CUMPR.';
COMMENT ON COLUMN IROJAS941.CUMPR.EMAIL IS 'Email de CUMPR.';
COMMENT ON COLUMN IROJAS941.CUMPR.TELEFONO IS 'Telefono de CUMPR.';
COMMENT ON COLUMN IROJAS941.CUMPR.PAIS_RESIDENCIA IS 'Pais Residencia de CUMPR.';
COMMENT ON COLUMN IROJAS941.CUMPR.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CUMPR.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CUMPR.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.CUMPR.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.CUMPR.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.CUMPR.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.CUMPR.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

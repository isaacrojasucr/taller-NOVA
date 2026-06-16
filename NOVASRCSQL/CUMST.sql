--==============================================================================
-- Nombre de la Tabla   : CUMST
-- DESCRIPCIÓN          : Archivo de Maestro de Clientes
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 2 - Clientes) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Maestro
-- Origen de los Datos  : Sistema transaccional (core bancario); mantenimiento de datos de clientes mediante procesos de apertura, actualizacion y gestion de relaciones.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.CUMST (
  ID_CLIENTE             FOR COLUMN IDCLI      VARCHAR(30) NOT NULL,
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
  CONSTRAINT CUMST_PK PRIMARY KEY (ID_CLIENTE)
) RCDFMT CUMSTR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.CUMST IS 'Maestro de Clientes';

COMMENT ON TABLE IROJAS941.CUMST IS 'Maestro de clientes del banco, identificado por id_cliente. Contiene datos de identificacion, contacto y demograficos utilizados como referencia conceptual desde otros modulos del esquema (por ejemplo CUMAD, CUMSD, SPINS, ACMST, DEALS, LCMST, entre otros).';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.CUMST (ID_CLIENTE IS 'Id Cliente');
LABEL ON COLUMN IROJAS941.CUMST (TIPO_PERSONA IS 'Tipo Persona');
LABEL ON COLUMN IROJAS941.CUMST (TIPO_IDENTIFICACION IS 'Tipo Identificacion');
LABEL ON COLUMN IROJAS941.CUMST (NUMERO_IDENTIFICACION IS 'Numero Identificacion');
LABEL ON COLUMN IROJAS941.CUMST (NOMBRES IS 'Nombres');
LABEL ON COLUMN IROJAS941.CUMST (APELLIDOS IS 'Apellidos');
LABEL ON COLUMN IROJAS941.CUMST (RAZON_SOCIAL IS 'Razon Social');
LABEL ON COLUMN IROJAS941.CUMST (FECHA_NACIMIENTO IS 'Fecha Nacimiento');
LABEL ON COLUMN IROJAS941.CUMST (DIRECCION IS 'Direccion');
LABEL ON COLUMN IROJAS941.CUMST (EMAIL IS 'Email');
LABEL ON COLUMN IROJAS941.CUMST (TELEFONO IS 'Telefono');
LABEL ON COLUMN IROJAS941.CUMST (PAIS_RESIDENCIA IS 'Pais Residencia');
LABEL ON COLUMN IROJAS941.CUMST (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.CUMST (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.CUMST (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.CUMST (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.CUMST (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.CUMST (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.CUMST (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.CUMST.ID_CLIENTE IS 'PK (1/1). Id Cliente de CUMST.';
COMMENT ON COLUMN IROJAS941.CUMST.TIPO_PERSONA IS 'Tipo Persona de CUMST.';
COMMENT ON COLUMN IROJAS941.CUMST.TIPO_IDENTIFICACION IS 'Tipo Identificacion de CUMST.';
COMMENT ON COLUMN IROJAS941.CUMST.NUMERO_IDENTIFICACION IS 'Numero Identificacion de CUMST.';
COMMENT ON COLUMN IROJAS941.CUMST.NOMBRES IS 'Nombres de CUMST.';
COMMENT ON COLUMN IROJAS941.CUMST.APELLIDOS IS 'Apellidos de CUMST.';
COMMENT ON COLUMN IROJAS941.CUMST.RAZON_SOCIAL IS 'Razon Social de CUMST.';
COMMENT ON COLUMN IROJAS941.CUMST.FECHA_NACIMIENTO IS 'Fecha Nacimiento de CUMST.';
COMMENT ON COLUMN IROJAS941.CUMST.DIRECCION IS 'Direccion de CUMST.';
COMMENT ON COLUMN IROJAS941.CUMST.EMAIL IS 'Email de CUMST.';
COMMENT ON COLUMN IROJAS941.CUMST.TELEFONO IS 'Telefono de CUMST.';
COMMENT ON COLUMN IROJAS941.CUMST.PAIS_RESIDENCIA IS 'Pais Residencia de CUMST.';
COMMENT ON COLUMN IROJAS941.CUMST.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CUMST.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CUMST.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.CUMST.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.CUMST.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.CUMST.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.CUMST.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

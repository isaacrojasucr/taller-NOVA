--==============================================================================
-- Nombre de la Tabla   : CUMAD
-- DESCRIPCIÓN          : Archivo de Direcciones de Correo y Beneficiarios de Operaciones/Clientes.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 2 - Clientes) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Transaccional / Detalle
-- Origen de los Datos  : Sistema transaccional (core bancario); mantenimiento de datos de clientes mediante procesos de apertura, actualizacion y gestion de relaciones.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.CUMAD (
  ID_CLIENTE_OPERACION   FOR COLUMN IDCLIOPER  VARCHAR(30) NOT NULL,
  TIPO_REGISTRO          FOR COLUMN TIPOREG    VARCHAR(20) NOT NULL,
  SECUENCIA              INTEGER NOT NULL,
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
  CONSTRAINT CUMAD_PK PRIMARY KEY (ID_CLIENTE_OPERACION, TIPO_REGISTRO, SECUENCIA),
  CONSTRAINT CUMAD_FK_CUMST FOREIGN KEY (ID_CLIENTE_OPERACION)
    REFERENCES IROJAS941.CUMST (ID_CLIENTE)
) RCDFMT CUMADR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.CUMAD IS 'Direcciones y Beneficiarios';

COMMENT ON TABLE IROJAS941.CUMAD IS 'Direcciones de correo y beneficiarios de operaciones/clientes, identificados por id_cliente_operacion, tipo_registro y secuencia. FK hacia CUMST.id_cliente.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.CUMAD (ID_CLIENTE_OPERACION IS 'Id Cliente Operacion');
LABEL ON COLUMN IROJAS941.CUMAD (TIPO_REGISTRO IS 'Tipo Registro');
LABEL ON COLUMN IROJAS941.CUMAD (SECUENCIA IS 'Secuencia');
LABEL ON COLUMN IROJAS941.CUMAD (TIPO_PERSONA IS 'Tipo Persona');
LABEL ON COLUMN IROJAS941.CUMAD (TIPO_IDENTIFICACION IS 'Tipo Identificacion');
LABEL ON COLUMN IROJAS941.CUMAD (NUMERO_IDENTIFICACION IS 'Numero Identificacion');
LABEL ON COLUMN IROJAS941.CUMAD (NOMBRES IS 'Nombres');
LABEL ON COLUMN IROJAS941.CUMAD (APELLIDOS IS 'Apellidos');
LABEL ON COLUMN IROJAS941.CUMAD (RAZON_SOCIAL IS 'Razon Social');
LABEL ON COLUMN IROJAS941.CUMAD (FECHA_NACIMIENTO IS 'Fecha Nacimiento');
LABEL ON COLUMN IROJAS941.CUMAD (DIRECCION IS 'Direccion');
LABEL ON COLUMN IROJAS941.CUMAD (EMAIL IS 'Email');
LABEL ON COLUMN IROJAS941.CUMAD (TELEFONO IS 'Telefono');
LABEL ON COLUMN IROJAS941.CUMAD (PAIS_RESIDENCIA IS 'Pais Residencia');
LABEL ON COLUMN IROJAS941.CUMAD (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.CUMAD (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.CUMAD (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.CUMAD (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.CUMAD (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.CUMAD (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.CUMAD (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.CUMAD.ID_CLIENTE_OPERACION IS 'PK (1/3). Id Cliente Operacion de CUMAD. Referencia conceptual a CUMST.id_cliente (segun estructura_bd.md).';
COMMENT ON COLUMN IROJAS941.CUMAD.TIPO_REGISTRO IS 'PK (2/3). Tipo Registro de CUMAD.';
COMMENT ON COLUMN IROJAS941.CUMAD.SECUENCIA IS 'PK (3/3). Secuencia de CUMAD.';
COMMENT ON COLUMN IROJAS941.CUMAD.TIPO_PERSONA IS 'Tipo Persona de CUMAD.';
COMMENT ON COLUMN IROJAS941.CUMAD.TIPO_IDENTIFICACION IS 'Tipo Identificacion de CUMAD.';
COMMENT ON COLUMN IROJAS941.CUMAD.NUMERO_IDENTIFICACION IS 'Numero Identificacion de CUMAD.';
COMMENT ON COLUMN IROJAS941.CUMAD.NOMBRES IS 'Nombres de CUMAD.';
COMMENT ON COLUMN IROJAS941.CUMAD.APELLIDOS IS 'Apellidos de CUMAD.';
COMMENT ON COLUMN IROJAS941.CUMAD.RAZON_SOCIAL IS 'Razon Social de CUMAD.';
COMMENT ON COLUMN IROJAS941.CUMAD.FECHA_NACIMIENTO IS 'Fecha Nacimiento de CUMAD.';
COMMENT ON COLUMN IROJAS941.CUMAD.DIRECCION IS 'Direccion de CUMAD.';
COMMENT ON COLUMN IROJAS941.CUMAD.EMAIL IS 'Email de CUMAD.';
COMMENT ON COLUMN IROJAS941.CUMAD.TELEFONO IS 'Telefono de CUMAD.';
COMMENT ON COLUMN IROJAS941.CUMAD.PAIS_RESIDENCIA IS 'Pais Residencia de CUMAD.';
COMMENT ON COLUMN IROJAS941.CUMAD.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CUMAD.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CUMAD.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.CUMAD.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.CUMAD.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.CUMAD.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.CUMAD.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

--==============================================================================
-- Nombre de la Tabla   : SPINS
-- DESCRIPCIÓN          : Archivo de Instrucciones especiales (Usos)
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 2 - Clientes) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Catalogo / Parametros
-- Origen de los Datos  : Sistema transaccional (core bancario); mantenimiento de datos de clientes mediante procesos de apertura, actualizacion y gestion de relaciones.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.SPINS (
  TIPO_INFORMACION       FOR COLUMN TIPOINFO   VARCHAR(50) NOT NULL,
  CUENTA_O_CLIENTE       FOR COLUMN CTAOCLI    VARCHAR(50) NOT NULL,
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
  CONSTRAINT SPINS_PK PRIMARY KEY (TIPO_INFORMACION, CUENTA_O_CLIENTE, SECUENCIA)
) RCDFMT SPINSR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.SPINS IS 'Instrucciones Especiales';

COMMENT ON TABLE IROJAS941.SPINS IS 'Instrucciones especiales (usos) asociadas a un cliente o cuenta, identificadas por tipo_informacion, cuenta_o_cliente y secuencia. La columna cuenta_o_cliente es una referencia conceptual a CUMST.id_cliente o ACMST.numero_cuenta segun el tipo_informacion (sin FK declarada por tratarse de una referencia ambigua a dos tablas distintas).';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.SPINS (TIPO_INFORMACION IS 'Tipo Informacion');
LABEL ON COLUMN IROJAS941.SPINS (CUENTA_O_CLIENTE IS 'Cuenta o Cliente');
LABEL ON COLUMN IROJAS941.SPINS (SECUENCIA IS 'Secuencia');
LABEL ON COLUMN IROJAS941.SPINS (TIPO_PERSONA IS 'Tipo Persona');
LABEL ON COLUMN IROJAS941.SPINS (TIPO_IDENTIFICACION IS 'Tipo Identificacion');
LABEL ON COLUMN IROJAS941.SPINS (NUMERO_IDENTIFICACION IS 'Numero Identificacion');
LABEL ON COLUMN IROJAS941.SPINS (NOMBRES IS 'Nombres');
LABEL ON COLUMN IROJAS941.SPINS (APELLIDOS IS 'Apellidos');
LABEL ON COLUMN IROJAS941.SPINS (RAZON_SOCIAL IS 'Razon Social');
LABEL ON COLUMN IROJAS941.SPINS (FECHA_NACIMIENTO IS 'Fecha Nacimiento');
LABEL ON COLUMN IROJAS941.SPINS (DIRECCION IS 'Direccion');
LABEL ON COLUMN IROJAS941.SPINS (EMAIL IS 'Email');
LABEL ON COLUMN IROJAS941.SPINS (TELEFONO IS 'Telefono');
LABEL ON COLUMN IROJAS941.SPINS (PAIS_RESIDENCIA IS 'Pais Residencia');
LABEL ON COLUMN IROJAS941.SPINS (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.SPINS (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.SPINS (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.SPINS (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.SPINS (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.SPINS (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.SPINS (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.SPINS.TIPO_INFORMACION IS 'PK (1/3). Tipo Informacion de SPINS.';
COMMENT ON COLUMN IROJAS941.SPINS.CUENTA_O_CLIENTE IS 'PK (2/3). Cuenta o Cliente de SPINS. Referencia conceptual a CUMST/ACMST.id_cliente/numero_cuenta (segun estructura_bd.md).';
COMMENT ON COLUMN IROJAS941.SPINS.SECUENCIA IS 'PK (3/3). Secuencia de SPINS.';
COMMENT ON COLUMN IROJAS941.SPINS.TIPO_PERSONA IS 'Tipo Persona de SPINS.';
COMMENT ON COLUMN IROJAS941.SPINS.TIPO_IDENTIFICACION IS 'Tipo Identificacion de SPINS.';
COMMENT ON COLUMN IROJAS941.SPINS.NUMERO_IDENTIFICACION IS 'Numero Identificacion de SPINS.';
COMMENT ON COLUMN IROJAS941.SPINS.NOMBRES IS 'Nombres de SPINS.';
COMMENT ON COLUMN IROJAS941.SPINS.APELLIDOS IS 'Apellidos de SPINS.';
COMMENT ON COLUMN IROJAS941.SPINS.RAZON_SOCIAL IS 'Razon Social de SPINS.';
COMMENT ON COLUMN IROJAS941.SPINS.FECHA_NACIMIENTO IS 'Fecha Nacimiento de SPINS.';
COMMENT ON COLUMN IROJAS941.SPINS.DIRECCION IS 'Direccion de SPINS.';
COMMENT ON COLUMN IROJAS941.SPINS.EMAIL IS 'Email de SPINS.';
COMMENT ON COLUMN IROJAS941.SPINS.TELEFONO IS 'Telefono de SPINS.';
COMMENT ON COLUMN IROJAS941.SPINS.PAIS_RESIDENCIA IS 'Pais Residencia de SPINS.';
COMMENT ON COLUMN IROJAS941.SPINS.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.SPINS.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.SPINS.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.SPINS.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.SPINS.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.SPINS.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.SPINS.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

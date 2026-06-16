--==============================================================================
-- Nombre de la Tabla   : CUMSD
-- DESCRIPCIÓN          : Archivo Maestro de Clientes para búsqueda de Clientes a través de un String de Caracteres.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 2 - Clientes) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Indice / Busqueda
-- Origen de los Datos  : Sistema transaccional (core bancario); mantenimiento de datos de clientes mediante procesos de apertura, actualizacion y gestion de relaciones.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.CUMSD (
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
  CONSTRAINT CUMSD_PK PRIMARY KEY (ID_CLIENTE),
  CONSTRAINT CUMSD_FK_CUMST FOREIGN KEY (ID_CLIENTE)
    REFERENCES IROJAS941.CUMST (ID_CLIENTE)
) RCDFMT CUMSDR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.CUMSD IS 'Busqueda de Clientes';

COMMENT ON TABLE IROJAS941.CUMSD IS 'Indice de clientes para busqueda por cadena de caracteres, identificado por id_cliente. FK hacia CUMST.id_cliente.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.CUMSD (ID_CLIENTE IS 'Id Cliente');
LABEL ON COLUMN IROJAS941.CUMSD (TIPO_PERSONA IS 'Tipo Persona');
LABEL ON COLUMN IROJAS941.CUMSD (TIPO_IDENTIFICACION IS 'Tipo Identificacion');
LABEL ON COLUMN IROJAS941.CUMSD (NUMERO_IDENTIFICACION IS 'Numero Identificacion');
LABEL ON COLUMN IROJAS941.CUMSD (NOMBRES IS 'Nombres');
LABEL ON COLUMN IROJAS941.CUMSD (APELLIDOS IS 'Apellidos');
LABEL ON COLUMN IROJAS941.CUMSD (RAZON_SOCIAL IS 'Razon Social');
LABEL ON COLUMN IROJAS941.CUMSD (FECHA_NACIMIENTO IS 'Fecha Nacimiento');
LABEL ON COLUMN IROJAS941.CUMSD (DIRECCION IS 'Direccion');
LABEL ON COLUMN IROJAS941.CUMSD (EMAIL IS 'Email');
LABEL ON COLUMN IROJAS941.CUMSD (TELEFONO IS 'Telefono');
LABEL ON COLUMN IROJAS941.CUMSD (PAIS_RESIDENCIA IS 'Pais Residencia');
LABEL ON COLUMN IROJAS941.CUMSD (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.CUMSD (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.CUMSD (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.CUMSD (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.CUMSD (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.CUMSD (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.CUMSD (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.CUMSD.ID_CLIENTE IS 'PK (1/1). Id Cliente de CUMSD. Referencia conceptual a CUMST.id_cliente (segun estructura_bd.md).';
COMMENT ON COLUMN IROJAS941.CUMSD.TIPO_PERSONA IS 'Tipo Persona de CUMSD.';
COMMENT ON COLUMN IROJAS941.CUMSD.TIPO_IDENTIFICACION IS 'Tipo Identificacion de CUMSD.';
COMMENT ON COLUMN IROJAS941.CUMSD.NUMERO_IDENTIFICACION IS 'Numero Identificacion de CUMSD.';
COMMENT ON COLUMN IROJAS941.CUMSD.NOMBRES IS 'Nombres de CUMSD.';
COMMENT ON COLUMN IROJAS941.CUMSD.APELLIDOS IS 'Apellidos de CUMSD.';
COMMENT ON COLUMN IROJAS941.CUMSD.RAZON_SOCIAL IS 'Razon Social de CUMSD.';
COMMENT ON COLUMN IROJAS941.CUMSD.FECHA_NACIMIENTO IS 'Fecha Nacimiento de CUMSD.';
COMMENT ON COLUMN IROJAS941.CUMSD.DIRECCION IS 'Direccion de CUMSD.';
COMMENT ON COLUMN IROJAS941.CUMSD.EMAIL IS 'Email de CUMSD.';
COMMENT ON COLUMN IROJAS941.CUMSD.TELEFONO IS 'Telefono de CUMSD.';
COMMENT ON COLUMN IROJAS941.CUMSD.PAIS_RESIDENCIA IS 'Pais Residencia de CUMSD.';
COMMENT ON COLUMN IROJAS941.CUMSD.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CUMSD.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CUMSD.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.CUMSD.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.CUMSD.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.CUMSD.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.CUMSD.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

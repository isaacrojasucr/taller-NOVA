--==============================================================================
-- Nombre de la Tabla   : USERS
-- DESCRIPCIÓN          : Archivo de Autorizaciones por menús
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 15 - Seguridad) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Catalogo / Parametros
-- Origen de los Datos  : Mantenimiento administrativo, generado por el area de seguridad / administracion del sistema al definir perfiles y autorizaciones de usuarios por menu y opcion.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.USERS (
  CODIGO_USUARIO         FOR COLUMN CODUSR     VARCHAR(20) NOT NULL,
  MENU                   VARCHAR(20) NOT NULL,
  OPCION                 VARCHAR(20) NOT NULL,
  ROL                    VARCHAR(20) NOT NULL,
  NIVEL_AUTORIZACION     FOR COLUMN NIVELAUTO  INTEGER NOT NULL,
  PERMITE_CONSULTA       FOR COLUMN PERMCONS   BOOLEAN NOT NULL,
  PERMITE_CREACION       FOR COLUMN PERMCREA   BOOLEAN NOT NULL,
  PERMITE_ACTUALIZACION  FOR COLUMN PERMACTUA  BOOLEAN NOT NULL,
  PERMITE_APROBACION     FOR COLUMN PERMAPRO   BOOLEAN NOT NULL,
  USUARIO_CREACION       FOR COLUMN USRCREA    VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA   VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG    INTEGER       NOT NULL DEFAULT 1,
  OBSERVACIONES          FOR COLUMN OBSERVAC   VARCHAR(120),
  ESTADO_REGISTRO        FOR COLUMN ESTREG     CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT  TIMESTAMP,
  CONSTRAINT USERS_PK PRIMARY KEY (CODIGO_USUARIO, MENU, OPCION)
) RCDFMT USERSR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.USERS IS 'Autorizaciones por Menus';

COMMENT ON TABLE IROJAS941.USERS IS 'Autorizaciones de usuarios por menu y opcion, identificadas por codigo_usuario, menu y opcion.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.USERS (CODIGO_USUARIO IS 'Codigo Usuario');
LABEL ON COLUMN IROJAS941.USERS (MENU IS 'Menu');
LABEL ON COLUMN IROJAS941.USERS (OPCION IS 'Opcion');
LABEL ON COLUMN IROJAS941.USERS (ROL IS 'Rol');
LABEL ON COLUMN IROJAS941.USERS (NIVEL_AUTORIZACION IS 'Nivel Autorizacion');
LABEL ON COLUMN IROJAS941.USERS (PERMITE_CONSULTA IS 'Permite Consulta');
LABEL ON COLUMN IROJAS941.USERS (PERMITE_CREACION IS 'Permite Creacion');
LABEL ON COLUMN IROJAS941.USERS (PERMITE_ACTUALIZACION IS 'Permite Actualizacion');
LABEL ON COLUMN IROJAS941.USERS (PERMITE_APROBACION IS 'Permite Aprobacion');
LABEL ON COLUMN IROJAS941.USERS (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.USERS (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.USERS (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.USERS (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.USERS (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.USERS (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.USERS (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.USERS.CODIGO_USUARIO IS 'PK (1/3). Codigo Usuario de USERS.';
COMMENT ON COLUMN IROJAS941.USERS.MENU IS 'PK (2/3). Menu de USERS.';
COMMENT ON COLUMN IROJAS941.USERS.OPCION IS 'PK (3/3). Opcion de USERS.';
COMMENT ON COLUMN IROJAS941.USERS.ROL IS 'Rol de USERS.';
COMMENT ON COLUMN IROJAS941.USERS.NIVEL_AUTORIZACION IS 'Nivel Autorizacion de USERS.';
COMMENT ON COLUMN IROJAS941.USERS.PERMITE_CONSULTA IS 'Permite Consulta de USERS.';
COMMENT ON COLUMN IROJAS941.USERS.PERMITE_CREACION IS 'Permite Creacion de USERS.';
COMMENT ON COLUMN IROJAS941.USERS.PERMITE_ACTUALIZACION IS 'Permite Actualizacion de USERS.';
COMMENT ON COLUMN IROJAS941.USERS.PERMITE_APROBACION IS 'Permite Aprobacion de USERS.';
COMMENT ON COLUMN IROJAS941.USERS.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.USERS.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.USERS.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.USERS.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.USERS.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.USERS.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.USERS.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

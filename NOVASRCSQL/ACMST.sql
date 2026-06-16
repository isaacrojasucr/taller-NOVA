--==============================================================================
-- Nombre de la Tabla   : ACMST
-- DESCRIPCIÓN          : Archivo Maestro de Cuentas de Detalle
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 3 - Cuentas de Detalle/Chequeras) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Maestro
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de apertura y operacion diaria de cuentas de detalle.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.ACMST (
  ID                     BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL,
  FECHA_APERTURA         FOR COLUMN FCHAPERT   DATE NOT NULL,
  FECHA_ULTIMA_TRANSACCION FOR COLUMN FCHULTTRAN DATE NOT NULL,
  SALDO_ACTUAL           FOR COLUMN SALDOACT   DECIMAL(18 , 2) NOT NULL,
  SALDO_DISPONIBLE       FOR COLUMN SALDODISP  DECIMAL(18 , 2) NOT NULL,
  LIMITE_SOBREGIRO       FOR COLUMN LIMSOBR    DECIMAL(18 , 2) NOT NULL,
  ESTADO_CUENTA          FOR COLUMN ESTCTA     VARCHAR(20) NOT NULL,
  USUARIO_CREACION       FOR COLUMN USRCREA    VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA   VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG    INTEGER       NOT NULL DEFAULT 1,
  OBSERVACIONES          FOR COLUMN OBSERVAC   VARCHAR(120),
  ESTADO_REGISTRO        FOR COLUMN ESTREG     CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT  TIMESTAMP,
  CONSTRAINT ACMST_PK PRIMARY KEY (ID)
) RCDFMT ACMSTR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.ACMST IS 'Maestro de Cuentas Detalle';

COMMENT ON TABLE IROJAS941.ACMST IS 'Maestro de cuentas de detalle (cuentas de ahorro, corriente, entre otras) del banco. La tabla no define una clave natural en estructura_bd.md, por lo que utiliza la columna ID como llave primaria tecnica (surrogate key). Es referenciada conceptualmente desde otras tablas del modulo (STPMT, UNCOL, PBTRN, RCLNB, CHMST, CHSTS, CMRIN, OVDRF, SPINS) a traves de numero_cuenta, sin FK declarada por no existir dicha columna en ACMST.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.ACMST (ID IS 'Id');
LABEL ON COLUMN IROJAS941.ACMST (FECHA_APERTURA IS 'Fecha Apertura');
LABEL ON COLUMN IROJAS941.ACMST (FECHA_ULTIMA_TRANSACCION IS 'Fecha Ultima Transaccion');
LABEL ON COLUMN IROJAS941.ACMST (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.ACMST (SALDO_DISPONIBLE IS 'Saldo Disponible');
LABEL ON COLUMN IROJAS941.ACMST (LIMITE_SOBREGIRO IS 'Limite Sobregiro');
LABEL ON COLUMN IROJAS941.ACMST (ESTADO_CUENTA IS 'Estado Cuenta');
LABEL ON COLUMN IROJAS941.ACMST (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.ACMST (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.ACMST (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.ACMST (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.ACMST (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.ACMST (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.ACMST (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.ACMST.ID IS 'PK (1/1). Id de ACMST.';
COMMENT ON COLUMN IROJAS941.ACMST.FECHA_APERTURA IS 'Fecha Apertura de ACMST.';
COMMENT ON COLUMN IROJAS941.ACMST.FECHA_ULTIMA_TRANSACCION IS 'Fecha Ultima Transaccion de ACMST.';
COMMENT ON COLUMN IROJAS941.ACMST.SALDO_ACTUAL IS 'Saldo Actual de ACMST.';
COMMENT ON COLUMN IROJAS941.ACMST.SALDO_DISPONIBLE IS 'Saldo Disponible de ACMST.';
COMMENT ON COLUMN IROJAS941.ACMST.LIMITE_SOBREGIRO IS 'Limite Sobregiro de ACMST.';
COMMENT ON COLUMN IROJAS941.ACMST.ESTADO_CUENTA IS 'Estado Cuenta de ACMST.';
COMMENT ON COLUMN IROJAS941.ACMST.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.ACMST.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.ACMST.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.ACMST.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.ACMST.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.ACMST.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.ACMST.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

--==============================================================================
-- Nombre de la Tabla   : TDRCR
-- DESCRIPCIÓN          : Maestro de Transacciones de Cajero
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 3 - Cuentas de Detalle/Chequeras) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Maestro / Catalogo
-- Origen de los Datos  : Mantenimiento administrativo / parametrizacion del sistema core bancario (carga manual o por proceso de configuracion).
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.TDRCR (
  CODIGO_DE_TRANSACCION  FOR COLUMN CODDETRAN  VARCHAR(20) NOT NULL,
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
  CONSTRAINT TDRCR_PK PRIMARY KEY (CODIGO_DE_TRANSACCION)
) RCDFMT TDRCRR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.TDRCR IS 'Maestro Transacciones Cajero';

COMMENT ON TABLE IROJAS941.TDRCR IS 'Catalogo de transacciones de cajero (debito/credito, efectivo/cheque, entre otras), identificado por codigo_de_transaccion.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.TDRCR (CODIGO_DE_TRANSACCION IS 'Codigo De Transaccion');
LABEL ON COLUMN IROJAS941.TDRCR (FECHA_APERTURA IS 'Fecha Apertura');
LABEL ON COLUMN IROJAS941.TDRCR (FECHA_ULTIMA_TRANSACCION IS 'Fecha Ultima Transaccion');
LABEL ON COLUMN IROJAS941.TDRCR (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.TDRCR (SALDO_DISPONIBLE IS 'Saldo Disponible');
LABEL ON COLUMN IROJAS941.TDRCR (LIMITE_SOBREGIRO IS 'Limite Sobregiro');
LABEL ON COLUMN IROJAS941.TDRCR (ESTADO_CUENTA IS 'Estado Cuenta');
LABEL ON COLUMN IROJAS941.TDRCR (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.TDRCR (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.TDRCR (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.TDRCR (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.TDRCR (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.TDRCR (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.TDRCR (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.TDRCR.CODIGO_DE_TRANSACCION IS 'PK (1/1). Codigo De Transaccion de TDRCR.';
COMMENT ON COLUMN IROJAS941.TDRCR.FECHA_APERTURA IS 'Fecha Apertura de TDRCR.';
COMMENT ON COLUMN IROJAS941.TDRCR.FECHA_ULTIMA_TRANSACCION IS 'Fecha Ultima Transaccion de TDRCR.';
COMMENT ON COLUMN IROJAS941.TDRCR.SALDO_ACTUAL IS 'Saldo Actual de TDRCR.';
COMMENT ON COLUMN IROJAS941.TDRCR.SALDO_DISPONIBLE IS 'Saldo Disponible de TDRCR.';
COMMENT ON COLUMN IROJAS941.TDRCR.LIMITE_SOBREGIRO IS 'Limite Sobregiro de TDRCR.';
COMMENT ON COLUMN IROJAS941.TDRCR.ESTADO_CUENTA IS 'Estado Cuenta de TDRCR.';
COMMENT ON COLUMN IROJAS941.TDRCR.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.TDRCR.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.TDRCR.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.TDRCR.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.TDRCR.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.TDRCR.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.TDRCR.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

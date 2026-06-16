--==============================================================================
-- Nombre de la Tabla   : CNTRLDEV
-- DESCRIPCIÓN          : Definición de las Causales de Devolución de Cheques.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 3 - Cuentas de Detalle/Chequeras) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Catalogo
-- Origen de los Datos  : Mantenimiento administrativo / parametrizacion del sistema core bancario (carga manual o por proceso de configuracion).
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.CNTRLDEV (
  CODIGO_CAUSAL          FOR COLUMN CODCAUSAL  VARCHAR(20) NOT NULL,
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
  CONSTRAINT CNTRLDEV_PK PRIMARY KEY (CODIGO_CAUSAL)
) RCDFMT CNTRLDEVR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.CNTRLDEV IS 'Causales Devolucion Cheques';

COMMENT ON TABLE IROJAS941.CNTRLDEV IS 'Catalogo de causales de devolucion de cheques, identificado por codigo_causal.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.CNTRLDEV (CODIGO_CAUSAL IS 'Codigo Causal');
LABEL ON COLUMN IROJAS941.CNTRLDEV (FECHA_APERTURA IS 'Fecha Apertura');
LABEL ON COLUMN IROJAS941.CNTRLDEV (FECHA_ULTIMA_TRANSACCION IS 'Fecha Ultima Transaccion');
LABEL ON COLUMN IROJAS941.CNTRLDEV (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.CNTRLDEV (SALDO_DISPONIBLE IS 'Saldo Disponible');
LABEL ON COLUMN IROJAS941.CNTRLDEV (LIMITE_SOBREGIRO IS 'Limite Sobregiro');
LABEL ON COLUMN IROJAS941.CNTRLDEV (ESTADO_CUENTA IS 'Estado Cuenta');
LABEL ON COLUMN IROJAS941.CNTRLDEV (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.CNTRLDEV (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.CNTRLDEV (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.CNTRLDEV (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.CNTRLDEV (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.CNTRLDEV (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.CNTRLDEV (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.CNTRLDEV.CODIGO_CAUSAL IS 'PK (1/1). Codigo Causal de CNTRLDEV.';
COMMENT ON COLUMN IROJAS941.CNTRLDEV.FECHA_APERTURA IS 'Fecha Apertura de CNTRLDEV.';
COMMENT ON COLUMN IROJAS941.CNTRLDEV.FECHA_ULTIMA_TRANSACCION IS 'Fecha Ultima Transaccion de CNTRLDEV.';
COMMENT ON COLUMN IROJAS941.CNTRLDEV.SALDO_ACTUAL IS 'Saldo Actual de CNTRLDEV.';
COMMENT ON COLUMN IROJAS941.CNTRLDEV.SALDO_DISPONIBLE IS 'Saldo Disponible de CNTRLDEV.';
COMMENT ON COLUMN IROJAS941.CNTRLDEV.LIMITE_SOBREGIRO IS 'Limite Sobregiro de CNTRLDEV.';
COMMENT ON COLUMN IROJAS941.CNTRLDEV.ESTADO_CUENTA IS 'Estado Cuenta de CNTRLDEV.';
COMMENT ON COLUMN IROJAS941.CNTRLDEV.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CNTRLDEV.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CNTRLDEV.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.CNTRLDEV.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.CNTRLDEV.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.CNTRLDEV.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.CNTRLDEV.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

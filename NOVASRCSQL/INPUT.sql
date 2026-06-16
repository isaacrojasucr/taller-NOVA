--==============================================================================
-- Nombre de la Tabla   : INPUT
-- DESCRIPCIÓN          : Archivo de Asientos Contables Aprobados (Archivos Derivados).
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 7 - Contabilidad) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Transaccional / Detalle (derivado)
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por los procesos contables (batch de fin de dia, asientos automaticos y consolidacion de balances).
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.INPUT (
  NUMERO_DEL_LOTE        FOR COLUMN NUMDELLOTE VARCHAR(30) NOT NULL,
  SECUENCIA_DENTRO_DEL_LOTE FOR COLUMN SEQDENDELL VARCHAR(50) NOT NULL,
  DESCRIPCION_CUENTA     FOR COLUMN DESCCTA    VARCHAR(120) NOT NULL,
  NATURALEZA_CUENTA      FOR COLUMN NATCTA     VARCHAR(20) NOT NULL,
  NIVEL_CUENTA           FOR COLUMN NIVELCTA   VARCHAR(50) NOT NULL,
  SALDO_ACTUAL           FOR COLUMN SALDOACT   DECIMAL(18 , 2) NOT NULL,
  FECHA_PROCESO_SISTEMA  FOR COLUMN FCHPROCSIS TIMESTAMP NOT NULL,
  OBSERVACIONES          FOR COLUMN OBSERVAC   VARCHAR(120),
  USUARIO_CREACION       FOR COLUMN USRCREA    VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA   VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG    INTEGER       NOT NULL DEFAULT 1,
  ESTADO_REGISTRO        FOR COLUMN ESTREG     CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT  TIMESTAMP,
  CONSTRAINT INPUT_PK PRIMARY KEY (NUMERO_DEL_LOTE, SECUENCIA_DENTRO_DEL_LOTE)
) RCDFMT INPUTR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.INPUT IS 'Asientos Contables Aprobados';

COMMENT ON TABLE IROJAS941.INPUT IS 'Archivo de asientos contables aprobados (archivos derivados), identificado por numero_del_lote y secuencia_dentro_del_lote.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.INPUT (NUMERO_DEL_LOTE IS 'Numero Del Lote');
LABEL ON COLUMN IROJAS941.INPUT (SECUENCIA_DENTRO_DEL_LOTE IS 'Secuencia Dentro Del Lote');
LABEL ON COLUMN IROJAS941.INPUT (DESCRIPCION_CUENTA IS 'Descripcion Cuenta');
LABEL ON COLUMN IROJAS941.INPUT (NATURALEZA_CUENTA IS 'Naturaleza Cuenta');
LABEL ON COLUMN IROJAS941.INPUT (NIVEL_CUENTA IS 'Nivel Cuenta');
LABEL ON COLUMN IROJAS941.INPUT (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.INPUT (FECHA_PROCESO_SISTEMA IS 'Fecha Proceso Sistema');
LABEL ON COLUMN IROJAS941.INPUT (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.INPUT (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.INPUT (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.INPUT (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.INPUT (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.INPUT (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.INPUT (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.INPUT.NUMERO_DEL_LOTE IS 'PK (1/2). Numero Del Lote de INPUT.';
COMMENT ON COLUMN IROJAS941.INPUT.SECUENCIA_DENTRO_DEL_LOTE IS 'PK (2/2). Secuencia Dentro Del Lote de INPUT.';
COMMENT ON COLUMN IROJAS941.INPUT.DESCRIPCION_CUENTA IS 'Descripcion Cuenta de INPUT.';
COMMENT ON COLUMN IROJAS941.INPUT.NATURALEZA_CUENTA IS 'Naturaleza Cuenta de INPUT.';
COMMENT ON COLUMN IROJAS941.INPUT.NIVEL_CUENTA IS 'Nivel Cuenta de INPUT.';
COMMENT ON COLUMN IROJAS941.INPUT.SALDO_ACTUAL IS 'Saldo Actual de INPUT.';
COMMENT ON COLUMN IROJAS941.INPUT.FECHA_PROCESO_SISTEMA IS 'Fecha Proceso Sistema de INPUT.';
COMMENT ON COLUMN IROJAS941.INPUT.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.INPUT.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.INPUT.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.INPUT.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.INPUT.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.INPUT.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.INPUT.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

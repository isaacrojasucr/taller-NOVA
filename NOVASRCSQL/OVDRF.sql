--==============================================================================
-- Nombre de la Tabla   : OVDRF
-- DESCRIPCIÓN          : Archivo diario de Sobregiros.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 3 - Cuentas de Detalle/Chequeras) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Transaccional / Diario
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de apertura y operacion diaria de cuentas de detalle.
-- Permanencia de Datos : Permanente (historico)
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.OVDRF (
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
  CONSTRAINT OVDRF_PK PRIMARY KEY (ID)
) RCDFMT OVDRFR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.OVDRF IS 'Archivo Diario Sobregiros';

COMMENT ON TABLE IROJAS941.OVDRF IS 'Archivo diario de cuentas en sobregiro. La tabla no define una clave natural en estructura_bd.md, por lo que utiliza la columna ID como llave primaria tecnica (surrogate key). La referencia a la cuenta es conceptual a ACMST (sin FK declarada por no existir una columna numero_cuenta en ACMST).';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.OVDRF (ID IS 'Id');
LABEL ON COLUMN IROJAS941.OVDRF (FECHA_APERTURA IS 'Fecha Apertura');
LABEL ON COLUMN IROJAS941.OVDRF (FECHA_ULTIMA_TRANSACCION IS 'Fecha Ultima Transaccion');
LABEL ON COLUMN IROJAS941.OVDRF (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.OVDRF (SALDO_DISPONIBLE IS 'Saldo Disponible');
LABEL ON COLUMN IROJAS941.OVDRF (LIMITE_SOBREGIRO IS 'Limite Sobregiro');
LABEL ON COLUMN IROJAS941.OVDRF (ESTADO_CUENTA IS 'Estado Cuenta');
LABEL ON COLUMN IROJAS941.OVDRF (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.OVDRF (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.OVDRF (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.OVDRF (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.OVDRF (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.OVDRF (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.OVDRF (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.OVDRF.ID IS 'PK (1/1). Id de OVDRF.';
COMMENT ON COLUMN IROJAS941.OVDRF.FECHA_APERTURA IS 'Fecha Apertura de OVDRF.';
COMMENT ON COLUMN IROJAS941.OVDRF.FECHA_ULTIMA_TRANSACCION IS 'Fecha Ultima Transaccion de OVDRF.';
COMMENT ON COLUMN IROJAS941.OVDRF.SALDO_ACTUAL IS 'Saldo Actual de OVDRF.';
COMMENT ON COLUMN IROJAS941.OVDRF.SALDO_DISPONIBLE IS 'Saldo Disponible de OVDRF.';
COMMENT ON COLUMN IROJAS941.OVDRF.LIMITE_SOBREGIRO IS 'Limite Sobregiro de OVDRF.';
COMMENT ON COLUMN IROJAS941.OVDRF.ESTADO_CUENTA IS 'Estado Cuenta de OVDRF.';
COMMENT ON COLUMN IROJAS941.OVDRF.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.OVDRF.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.OVDRF.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.OVDRF.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.OVDRF.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.OVDRF.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.OVDRF.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

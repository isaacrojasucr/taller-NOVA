--==============================================================================
-- Nombre de la Tabla   : CHMST
-- DESCRIPCIÓN          : Maestro de Chequeras.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 3 - Cuentas de Detalle/Chequeras) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Maestro
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de apertura y operacion diaria de cuentas de detalle.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.CHMST (
  CODIGO_BANCO           FOR COLUMN CODBANCO   VARCHAR(20) NOT NULL,
  CODIGO_SUCURSAL        FOR COLUMN CODSUC     VARCHAR(20) NOT NULL,
  CODIGO_MONEDA          FOR COLUMN CODMON     VARCHAR(20) NOT NULL,
  NUMERO_CUENTA          FOR COLUMN NUMCTA     VARCHAR(24) NOT NULL,
  CHEQUE_INICIAL         FOR COLUMN CHEQUEINIC VARCHAR(50) NOT NULL,
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
  CONSTRAINT CHMST_PK PRIMARY KEY (CODIGO_BANCO, CODIGO_SUCURSAL, CODIGO_MONEDA, NUMERO_CUENTA, CHEQUE_INICIAL)
) RCDFMT CHMSTR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.CHMST IS 'Maestro de Chequeras';

COMMENT ON TABLE IROJAS941.CHMST IS 'Maestro de chequeras emitidas, identificado por codigo_banco, codigo_sucursal, codigo_moneda, numero_cuenta y cheque_inicial. La columna numero_cuenta es una referencia conceptual a ACMST (sin FK declarada por no existir dicha columna en ACMST).';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.CHMST (CODIGO_BANCO IS 'Codigo Banco');
LABEL ON COLUMN IROJAS941.CHMST (CODIGO_SUCURSAL IS 'Codigo Sucursal');
LABEL ON COLUMN IROJAS941.CHMST (CODIGO_MONEDA IS 'Codigo Moneda');
LABEL ON COLUMN IROJAS941.CHMST (NUMERO_CUENTA IS 'Numero Cuenta');
LABEL ON COLUMN IROJAS941.CHMST (CHEQUE_INICIAL IS 'Cheque Inicial');
LABEL ON COLUMN IROJAS941.CHMST (FECHA_APERTURA IS 'Fecha Apertura');
LABEL ON COLUMN IROJAS941.CHMST (FECHA_ULTIMA_TRANSACCION IS 'Fecha Ultima Transaccion');
LABEL ON COLUMN IROJAS941.CHMST (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.CHMST (SALDO_DISPONIBLE IS 'Saldo Disponible');
LABEL ON COLUMN IROJAS941.CHMST (LIMITE_SOBREGIRO IS 'Limite Sobregiro');
LABEL ON COLUMN IROJAS941.CHMST (ESTADO_CUENTA IS 'Estado Cuenta');
LABEL ON COLUMN IROJAS941.CHMST (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.CHMST (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.CHMST (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.CHMST (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.CHMST (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.CHMST (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.CHMST (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.CHMST.CODIGO_BANCO IS 'PK (1/5). Codigo Banco de CHMST.';
COMMENT ON COLUMN IROJAS941.CHMST.CODIGO_SUCURSAL IS 'PK (2/5). Codigo Sucursal de CHMST.';
COMMENT ON COLUMN IROJAS941.CHMST.CODIGO_MONEDA IS 'PK (3/5). Codigo Moneda de CHMST.';
COMMENT ON COLUMN IROJAS941.CHMST.NUMERO_CUENTA IS 'PK (4/5). Numero Cuenta de CHMST. Referencia conceptual a ACMST.numero_cuenta (segun estructura_bd.md).';
COMMENT ON COLUMN IROJAS941.CHMST.CHEQUE_INICIAL IS 'PK (5/5). Cheque Inicial de CHMST.';
COMMENT ON COLUMN IROJAS941.CHMST.FECHA_APERTURA IS 'Fecha Apertura de CHMST.';
COMMENT ON COLUMN IROJAS941.CHMST.FECHA_ULTIMA_TRANSACCION IS 'Fecha Ultima Transaccion de CHMST.';
COMMENT ON COLUMN IROJAS941.CHMST.SALDO_ACTUAL IS 'Saldo Actual de CHMST.';
COMMENT ON COLUMN IROJAS941.CHMST.SALDO_DISPONIBLE IS 'Saldo Disponible de CHMST.';
COMMENT ON COLUMN IROJAS941.CHMST.LIMITE_SOBREGIRO IS 'Limite Sobregiro de CHMST.';
COMMENT ON COLUMN IROJAS941.CHMST.ESTADO_CUENTA IS 'Estado Cuenta de CHMST.';
COMMENT ON COLUMN IROJAS941.CHMST.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CHMST.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CHMST.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.CHMST.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.CHMST.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.CHMST.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.CHMST.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

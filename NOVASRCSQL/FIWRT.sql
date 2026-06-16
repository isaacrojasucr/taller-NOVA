--==============================================================================
-- Nombre de la Tabla   : FIWRT
-- DESCRIPCIÓN          : Transacciones Históricas de Pagos y Recibos.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 12 - Pagos y Transferencias) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Transaccional / Historico
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de pagos y transferencias a clientes y terceros (ordenes de pago, Swift, Telex).
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.FIWRT (
  CODIGO_BANCO           FOR COLUMN CODBANCO   VARCHAR(20) NOT NULL,
  NUMERO_TRANSFERENCIA   FOR COLUMN NUMTRAN    VARCHAR(30) NOT NULL,
  FECHA_OPERACION        FOR COLUMN FCHOPER    DATE NOT NULL,
  MONTO                  DECIMAL(18 , 2) NOT NULL,
  BENEFICIARIO           FOR COLUMN BENEF      VARCHAR(80) NOT NULL,
  BANCO_DESTINO          FOR COLUMN BANCODEST  VARCHAR(80) NOT NULL,
  CANAL_PAGO             FOR COLUMN CANAPAGO   VARCHAR(20) NOT NULL,
  ESTADO_PAGO            FOR COLUMN ESTPAGO    VARCHAR(20) NOT NULL,
  USUARIO_CREACION       FOR COLUMN USRCREA    VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA   VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG    INTEGER       NOT NULL DEFAULT 1,
  OBSERVACIONES          FOR COLUMN OBSERVAC   VARCHAR(120),
  ESTADO_REGISTRO        FOR COLUMN ESTREG     CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT  TIMESTAMP,
  CONSTRAINT FIWRT_PK PRIMARY KEY (CODIGO_BANCO, NUMERO_TRANSFERENCIA)
) RCDFMT FIWRTR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.FIWRT IS 'Historico Pagos y Recibos';

COMMENT ON TABLE IROJAS941.FIWRT IS 'Transacciones historicas de pagos y recibos, identificadas por codigo_banco y numero_transferencia.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.FIWRT (CODIGO_BANCO IS 'Codigo Banco');
LABEL ON COLUMN IROJAS941.FIWRT (NUMERO_TRANSFERENCIA IS 'Numero Transferencia');
LABEL ON COLUMN IROJAS941.FIWRT (FECHA_OPERACION IS 'Fecha Operacion');
LABEL ON COLUMN IROJAS941.FIWRT (MONTO IS 'Monto');
LABEL ON COLUMN IROJAS941.FIWRT (BENEFICIARIO IS 'Beneficiario');
LABEL ON COLUMN IROJAS941.FIWRT (BANCO_DESTINO IS 'Banco Destino');
LABEL ON COLUMN IROJAS941.FIWRT (CANAL_PAGO IS 'Canal Pago');
LABEL ON COLUMN IROJAS941.FIWRT (ESTADO_PAGO IS 'Estado Pago');
LABEL ON COLUMN IROJAS941.FIWRT (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.FIWRT (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.FIWRT (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.FIWRT (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.FIWRT (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.FIWRT (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.FIWRT (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.FIWRT.CODIGO_BANCO IS 'PK (1/2). Codigo Banco de FIWRT.';
COMMENT ON COLUMN IROJAS941.FIWRT.NUMERO_TRANSFERENCIA IS 'PK (2/2). Numero Transferencia de FIWRT.';
COMMENT ON COLUMN IROJAS941.FIWRT.FECHA_OPERACION IS 'Fecha Operacion de FIWRT.';
COMMENT ON COLUMN IROJAS941.FIWRT.MONTO IS 'Monto de FIWRT.';
COMMENT ON COLUMN IROJAS941.FIWRT.BENEFICIARIO IS 'Beneficiario de FIWRT.';
COMMENT ON COLUMN IROJAS941.FIWRT.BANCO_DESTINO IS 'Banco Destino de FIWRT.';
COMMENT ON COLUMN IROJAS941.FIWRT.CANAL_PAGO IS 'Canal Pago de FIWRT.';
COMMENT ON COLUMN IROJAS941.FIWRT.ESTADO_PAGO IS 'Estado Pago de FIWRT.';
COMMENT ON COLUMN IROJAS941.FIWRT.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.FIWRT.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.FIWRT.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.FIWRT.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.FIWRT.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.FIWRT.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.FIWRT.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

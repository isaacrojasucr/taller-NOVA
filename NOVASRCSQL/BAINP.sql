--==============================================================================
-- Nombre de la Tabla   : BAINP
-- DESCRIPCIÓN          : Transacciones Contables Diarias de Cuentas por Pagar
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 11 - Proveedores y Cuentas por Pagar) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Transaccional / Detalle
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de cuentas por pagar a proveedores: registro de facturas, amortizaciones y pagos.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.BAINP (
  NUMERO_BATCH           FOR COLUMN NUMBATCH   VARCHAR(30) NOT NULL,
  SECUENCIA              INTEGER NOT NULL,
  NUMERO_IDENTIFICACION  FOR COLUMN NUMID      VARCHAR(30) NOT NULL,
  RAZON_SOCIAL           FOR COLUMN RAZOSOCI   VARCHAR(80) NOT NULL,
  EMAIL                  VARCHAR(80) NOT NULL,
  TELEFONO               VARCHAR(80) NOT NULL,
  MONTO_ORIGINAL         FOR COLUMN MONTOORIG  DECIMAL(18 , 2) NOT NULL,
  SALDO_PENDIENTE        FOR COLUMN SALDOPEND  DECIMAL(18 , 2) NOT NULL,
  FECHA_EMISION          FOR COLUMN FCHEMIS    DATE NOT NULL,
  FECHA_VENCIMIENTO      FOR COLUMN FCHVENC    DATE NOT NULL,
  ESTADO_CXP             FOR COLUMN ESTCXP     VARCHAR(20) NOT NULL,
  USUARIO_CREACION       FOR COLUMN USRCREA    VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA   VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG    INTEGER       NOT NULL DEFAULT 1,
  OBSERVACIONES          FOR COLUMN OBSERVAC   VARCHAR(120),
  ESTADO_REGISTRO        FOR COLUMN ESTREG     CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT  TIMESTAMP,
  CONSTRAINT BAINP_PK PRIMARY KEY (NUMERO_BATCH, SECUENCIA)
) RCDFMT BAINPR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.BAINP IS 'Transacciones Contables Diarias CxP';

COMMENT ON TABLE IROJAS941.BAINP IS 'Transacciones contables diarias de cuentas por pagar, identificadas por numero_batch y secuencia.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.BAINP (NUMERO_BATCH IS 'Numero Lote');
LABEL ON COLUMN IROJAS941.BAINP (SECUENCIA IS 'Secuencia');
LABEL ON COLUMN IROJAS941.BAINP (NUMERO_IDENTIFICACION IS 'Numero Identificacion');
LABEL ON COLUMN IROJAS941.BAINP (RAZON_SOCIAL IS 'Razon Social');
LABEL ON COLUMN IROJAS941.BAINP (EMAIL IS 'Email');
LABEL ON COLUMN IROJAS941.BAINP (TELEFONO IS 'Telefono');
LABEL ON COLUMN IROJAS941.BAINP (MONTO_ORIGINAL IS 'Monto Original');
LABEL ON COLUMN IROJAS941.BAINP (SALDO_PENDIENTE IS 'Saldo Pendiente');
LABEL ON COLUMN IROJAS941.BAINP (FECHA_EMISION IS 'Fecha Emision');
LABEL ON COLUMN IROJAS941.BAINP (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.BAINP (ESTADO_CXP IS 'Estado Cxp');
LABEL ON COLUMN IROJAS941.BAINP (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.BAINP (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.BAINP (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.BAINP (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.BAINP (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.BAINP (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.BAINP (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.BAINP.NUMERO_BATCH IS 'PK (1/2). Numero Lote de BAINP.';
COMMENT ON COLUMN IROJAS941.BAINP.SECUENCIA IS 'PK (2/2). Secuencia de BAINP.';
COMMENT ON COLUMN IROJAS941.BAINP.NUMERO_IDENTIFICACION IS 'Numero Identificacion de BAINP.';
COMMENT ON COLUMN IROJAS941.BAINP.RAZON_SOCIAL IS 'Razon Social de BAINP.';
COMMENT ON COLUMN IROJAS941.BAINP.EMAIL IS 'Email de BAINP.';
COMMENT ON COLUMN IROJAS941.BAINP.TELEFONO IS 'Telefono de BAINP.';
COMMENT ON COLUMN IROJAS941.BAINP.MONTO_ORIGINAL IS 'Monto Original de BAINP.';
COMMENT ON COLUMN IROJAS941.BAINP.SALDO_PENDIENTE IS 'Saldo Pendiente de BAINP.';
COMMENT ON COLUMN IROJAS941.BAINP.FECHA_EMISION IS 'Fecha Emision de BAINP.';
COMMENT ON COLUMN IROJAS941.BAINP.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de BAINP.';
COMMENT ON COLUMN IROJAS941.BAINP.ESTADO_CXP IS 'Estado Cxp de BAINP.';
COMMENT ON COLUMN IROJAS941.BAINP.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.BAINP.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.BAINP.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.BAINP.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.BAINP.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.BAINP.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.BAINP.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

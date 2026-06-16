--==============================================================================
-- Nombre de la Tabla   : BAVEN
-- DESCRIPCIÓN          : Maestro de Proveedores.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 11 - Proveedores y Cuentas por Pagar) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Maestro
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de cuentas por pagar a proveedores: registro de facturas, amortizaciones y pagos.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.BAVEN (
  NUMERO_PROVEEDOR       FOR COLUMN NUMPROV    VARCHAR(30) NOT NULL,
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
  CONSTRAINT BAVEN_PK PRIMARY KEY (NUMERO_PROVEEDOR)
) RCDFMT BAVENR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.BAVEN IS 'Maestro de Proveedores';

COMMENT ON TABLE IROJAS941.BAVEN IS 'Maestro de proveedores, identificado por numero_proveedor.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.BAVEN (NUMERO_PROVEEDOR IS 'Numero Proveedor');
LABEL ON COLUMN IROJAS941.BAVEN (NUMERO_IDENTIFICACION IS 'Numero Identificacion');
LABEL ON COLUMN IROJAS941.BAVEN (RAZON_SOCIAL IS 'Razon Social');
LABEL ON COLUMN IROJAS941.BAVEN (EMAIL IS 'Email');
LABEL ON COLUMN IROJAS941.BAVEN (TELEFONO IS 'Telefono');
LABEL ON COLUMN IROJAS941.BAVEN (MONTO_ORIGINAL IS 'Monto Original');
LABEL ON COLUMN IROJAS941.BAVEN (SALDO_PENDIENTE IS 'Saldo Pendiente');
LABEL ON COLUMN IROJAS941.BAVEN (FECHA_EMISION IS 'Fecha Emision');
LABEL ON COLUMN IROJAS941.BAVEN (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.BAVEN (ESTADO_CXP IS 'Estado Cxp');
LABEL ON COLUMN IROJAS941.BAVEN (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.BAVEN (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.BAVEN (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.BAVEN (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.BAVEN (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.BAVEN (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.BAVEN (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.BAVEN.NUMERO_PROVEEDOR IS 'PK (1/1). Numero Proveedor de BAVEN.';
COMMENT ON COLUMN IROJAS941.BAVEN.NUMERO_IDENTIFICACION IS 'Numero Identificacion de BAVEN.';
COMMENT ON COLUMN IROJAS941.BAVEN.RAZON_SOCIAL IS 'Razon Social de BAVEN.';
COMMENT ON COLUMN IROJAS941.BAVEN.EMAIL IS 'Email de BAVEN.';
COMMENT ON COLUMN IROJAS941.BAVEN.TELEFONO IS 'Telefono de BAVEN.';
COMMENT ON COLUMN IROJAS941.BAVEN.MONTO_ORIGINAL IS 'Monto Original de BAVEN.';
COMMENT ON COLUMN IROJAS941.BAVEN.SALDO_PENDIENTE IS 'Saldo Pendiente de BAVEN.';
COMMENT ON COLUMN IROJAS941.BAVEN.FECHA_EMISION IS 'Fecha Emision de BAVEN.';
COMMENT ON COLUMN IROJAS941.BAVEN.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de BAVEN.';
COMMENT ON COLUMN IROJAS941.BAVEN.ESTADO_CXP IS 'Estado Cxp de BAVEN.';
COMMENT ON COLUMN IROJAS941.BAVEN.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.BAVEN.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.BAVEN.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.BAVEN.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.BAVEN.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.BAVEN.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.BAVEN.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

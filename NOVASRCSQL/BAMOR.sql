--==============================================================================
-- Nombre de la Tabla   : BAMOR
-- DESCRIPCIÓN          : Amortizaciones de Cuentas por Pagar
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 11 - Proveedores y Cuentas por Pagar) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Transaccional / Detalle
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de cuentas por pagar a proveedores: registro de facturas, amortizaciones y pagos.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.BAMOR (
  CODIGO_BANCO           FOR COLUMN CODBANCO   VARCHAR(20) NOT NULL,
  CODIGO_SUCURSAL        FOR COLUMN CODSUC     VARCHAR(20) NOT NULL,
  ORIGEN_CUENTA          FOR COLUMN ORIGCTA    VARCHAR(20) NOT NULL,
  TIPO_CUENTA            FOR COLUMN TIPOCTA    VARCHAR(20) NOT NULL,
  ID_CLIENTE             FOR COLUMN IDCLI      VARCHAR(30) NOT NULL,
  NUMERO_REFERENCIA      FOR COLUMN NUMREF     VARCHAR(30) NOT NULL,
  TIPO_REGISTRO          FOR COLUMN TIPOREG    VARCHAR(20) NOT NULL,
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
  CONSTRAINT BAMOR_PK PRIMARY KEY (CODIGO_BANCO, CODIGO_SUCURSAL, ORIGEN_CUENTA, TIPO_CUENTA, ID_CLIENTE, NUMERO_REFERENCIA, TIPO_REGISTRO)
) RCDFMT BAMORR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.BAMOR IS 'Amortizaciones Cuentas por Pagar';

COMMENT ON TABLE IROJAS941.BAMOR IS 'Amortizaciones de cuentas por pagar, identificadas por codigo_banco, codigo_sucursal, origen_cuenta, tipo_cuenta, id_cliente, numero_referencia y tipo_registro.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.BAMOR (CODIGO_BANCO IS 'Codigo Banco');
LABEL ON COLUMN IROJAS941.BAMOR (CODIGO_SUCURSAL IS 'Codigo Sucursal');
LABEL ON COLUMN IROJAS941.BAMOR (ORIGEN_CUENTA IS 'Origen Cuenta');
LABEL ON COLUMN IROJAS941.BAMOR (TIPO_CUENTA IS 'Tipo Cuenta');
LABEL ON COLUMN IROJAS941.BAMOR (ID_CLIENTE IS 'Id Cliente');
LABEL ON COLUMN IROJAS941.BAMOR (NUMERO_REFERENCIA IS 'Numero Referencia');
LABEL ON COLUMN IROJAS941.BAMOR (TIPO_REGISTRO IS 'Tipo Registro');
LABEL ON COLUMN IROJAS941.BAMOR (NUMERO_IDENTIFICACION IS 'Numero Identificacion');
LABEL ON COLUMN IROJAS941.BAMOR (RAZON_SOCIAL IS 'Razon Social');
LABEL ON COLUMN IROJAS941.BAMOR (EMAIL IS 'Email');
LABEL ON COLUMN IROJAS941.BAMOR (TELEFONO IS 'Telefono');
LABEL ON COLUMN IROJAS941.BAMOR (MONTO_ORIGINAL IS 'Monto Original');
LABEL ON COLUMN IROJAS941.BAMOR (SALDO_PENDIENTE IS 'Saldo Pendiente');
LABEL ON COLUMN IROJAS941.BAMOR (FECHA_EMISION IS 'Fecha Emision');
LABEL ON COLUMN IROJAS941.BAMOR (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.BAMOR (ESTADO_CXP IS 'Estado Cxp');
LABEL ON COLUMN IROJAS941.BAMOR (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.BAMOR (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.BAMOR (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.BAMOR (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.BAMOR (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.BAMOR (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.BAMOR (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.BAMOR.CODIGO_BANCO IS 'PK (1/7). Codigo Banco de BAMOR.';
COMMENT ON COLUMN IROJAS941.BAMOR.CODIGO_SUCURSAL IS 'PK (2/7). Codigo Sucursal de BAMOR.';
COMMENT ON COLUMN IROJAS941.BAMOR.ORIGEN_CUENTA IS 'PK (3/7). Origen Cuenta de BAMOR.';
COMMENT ON COLUMN IROJAS941.BAMOR.TIPO_CUENTA IS 'PK (4/7). Tipo Cuenta de BAMOR.';
COMMENT ON COLUMN IROJAS941.BAMOR.ID_CLIENTE IS 'PK (5/7). Id Cliente de BAMOR. Referencia conceptual a BAPRC.id_cliente (segun estructura_bd.md).';
COMMENT ON COLUMN IROJAS941.BAMOR.NUMERO_REFERENCIA IS 'PK (6/7). Numero Referencia de BAMOR.';
COMMENT ON COLUMN IROJAS941.BAMOR.TIPO_REGISTRO IS 'PK (7/7). Tipo Registro de BAMOR.';
COMMENT ON COLUMN IROJAS941.BAMOR.NUMERO_IDENTIFICACION IS 'Numero Identificacion de BAMOR.';
COMMENT ON COLUMN IROJAS941.BAMOR.RAZON_SOCIAL IS 'Razon Social de BAMOR.';
COMMENT ON COLUMN IROJAS941.BAMOR.EMAIL IS 'Email de BAMOR.';
COMMENT ON COLUMN IROJAS941.BAMOR.TELEFONO IS 'Telefono de BAMOR.';
COMMENT ON COLUMN IROJAS941.BAMOR.MONTO_ORIGINAL IS 'Monto Original de BAMOR.';
COMMENT ON COLUMN IROJAS941.BAMOR.SALDO_PENDIENTE IS 'Saldo Pendiente de BAMOR.';
COMMENT ON COLUMN IROJAS941.BAMOR.FECHA_EMISION IS 'Fecha Emision de BAMOR.';
COMMENT ON COLUMN IROJAS941.BAMOR.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de BAMOR.';
COMMENT ON COLUMN IROJAS941.BAMOR.ESTADO_CXP IS 'Estado Cxp de BAMOR.';
COMMENT ON COLUMN IROJAS941.BAMOR.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.BAMOR.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.BAMOR.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.BAMOR.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.BAMOR.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.BAMOR.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.BAMOR.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

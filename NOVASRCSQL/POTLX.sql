--==============================================================================
-- Nombre de la Tabla   : POTLX
-- DESCRIPCIÓN          : Ordenes de Pago vía Télex.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 12 - Pagos y Transferencias) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Transaccional / Detalle
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de pagos y transferencias a clientes y terceros (ordenes de pago, Swift, Telex).
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.POTLX (
  CODIGO_BANCO           FOR COLUMN CODBANCO   VARCHAR(20) NOT NULL,
  CODIGO_MONEDA          FOR COLUMN CODMON     VARCHAR(20) NOT NULL,
  ID_CLIENTE             FOR COLUMN IDCLI      VARCHAR(30) NOT NULL,
  TIPO_REGISTRO          FOR COLUMN TIPOREG    VARCHAR(20) NOT NULL,
  NUMERO_CUENTA          FOR COLUMN NUMCTA     VARCHAR(24) NOT NULL,
  NUMERO_REFERENCIA      FOR COLUMN NUMREF     VARCHAR(30) NOT NULL,
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
  CONSTRAINT POTLX_PK PRIMARY KEY (CODIGO_BANCO, CODIGO_MONEDA, ID_CLIENTE, TIPO_REGISTRO, NUMERO_CUENTA, NUMERO_REFERENCIA)
) RCDFMT POTLXR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.POTLX IS 'Ordenes de Pago via Telex';

COMMENT ON TABLE IROJAS941.POTLX IS 'Ordenes de pago via Telex, identificadas por codigo_banco, codigo_moneda, id_cliente, tipo_registro, numero_cuenta y numero_referencia.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.POTLX (CODIGO_BANCO IS 'Codigo Banco');
LABEL ON COLUMN IROJAS941.POTLX (CODIGO_MONEDA IS 'Codigo Moneda');
LABEL ON COLUMN IROJAS941.POTLX (ID_CLIENTE IS 'Id Cliente');
LABEL ON COLUMN IROJAS941.POTLX (TIPO_REGISTRO IS 'Tipo Registro');
LABEL ON COLUMN IROJAS941.POTLX (NUMERO_CUENTA IS 'Numero Cuenta');
LABEL ON COLUMN IROJAS941.POTLX (NUMERO_REFERENCIA IS 'Numero Referencia');
LABEL ON COLUMN IROJAS941.POTLX (FECHA_OPERACION IS 'Fecha Operacion');
LABEL ON COLUMN IROJAS941.POTLX (MONTO IS 'Monto');
LABEL ON COLUMN IROJAS941.POTLX (BENEFICIARIO IS 'Beneficiario');
LABEL ON COLUMN IROJAS941.POTLX (BANCO_DESTINO IS 'Banco Destino');
LABEL ON COLUMN IROJAS941.POTLX (CANAL_PAGO IS 'Canal Pago');
LABEL ON COLUMN IROJAS941.POTLX (ESTADO_PAGO IS 'Estado Pago');
LABEL ON COLUMN IROJAS941.POTLX (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.POTLX (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.POTLX (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.POTLX (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.POTLX (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.POTLX (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.POTLX (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.POTLX.CODIGO_BANCO IS 'PK (1/6). Codigo Banco de POTLX.';
COMMENT ON COLUMN IROJAS941.POTLX.CODIGO_MONEDA IS 'PK (2/6). Codigo Moneda de POTLX.';
COMMENT ON COLUMN IROJAS941.POTLX.ID_CLIENTE IS 'PK (3/6). Id Cliente de POTLX.';
COMMENT ON COLUMN IROJAS941.POTLX.TIPO_REGISTRO IS 'PK (4/6). Tipo Registro de POTLX.';
COMMENT ON COLUMN IROJAS941.POTLX.NUMERO_CUENTA IS 'PK (5/6). Numero Cuenta de POTLX.';
COMMENT ON COLUMN IROJAS941.POTLX.NUMERO_REFERENCIA IS 'PK (6/6). Numero Referencia de POTLX.';
COMMENT ON COLUMN IROJAS941.POTLX.FECHA_OPERACION IS 'Fecha Operacion de POTLX.';
COMMENT ON COLUMN IROJAS941.POTLX.MONTO IS 'Monto de POTLX.';
COMMENT ON COLUMN IROJAS941.POTLX.BENEFICIARIO IS 'Beneficiario de POTLX.';
COMMENT ON COLUMN IROJAS941.POTLX.BANCO_DESTINO IS 'Banco Destino de POTLX.';
COMMENT ON COLUMN IROJAS941.POTLX.CANAL_PAGO IS 'Canal Pago de POTLX.';
COMMENT ON COLUMN IROJAS941.POTLX.ESTADO_PAGO IS 'Estado Pago de POTLX.';
COMMENT ON COLUMN IROJAS941.POTLX.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.POTLX.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.POTLX.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.POTLX.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.POTLX.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.POTLX.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.POTLX.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

--==============================================================================
-- Nombre de la Tabla   : LCDOC
-- DESCRIPCIÓN          : Documentos de Cartas de Crédito
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 5 - Cartas de Credito) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Transaccional / Detalle
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de comercio exterior: emision, negociacion y liquidacion de cartas de credito y cobranzas documentarias.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.LCDOC (
  NUMERO_CARTA_CREDITO   FOR COLUMN NUMCARCRE  VARCHAR(30) NOT NULL,
  TIPO_REGISTRO          FOR COLUMN TIPOREG    VARCHAR(20) NOT NULL,
  CODIGO_BANCO           FOR COLUMN CODBANCO   VARCHAR(20) NOT NULL,
  CODIGO_DOCUMENTO       FOR COLUMN CODDOC     VARCHAR(20) NOT NULL,
  NUMERO_LINEA           FOR COLUMN NUMLIN     VARCHAR(30) NOT NULL,
  FECHA_EMISION          FOR COLUMN FCHEMIS    DATE NOT NULL,
  FECHA_VENCIMIENTO      FOR COLUMN FCHVENC    DATE NOT NULL,
  MONTO_ORIGINAL         FOR COLUMN MONTOORIG  DECIMAL(18 , 2) NOT NULL,
  SALDO_ACTUAL           FOR COLUMN SALDOACT   DECIMAL(18 , 2) NOT NULL,
  BANCO_CORRESPONSAL     FOR COLUMN BANCOCORR  VARCHAR(80) NOT NULL,
  PAIS_DESTINO           FOR COLUMN PAISDEST   VARCHAR(80) NOT NULL,
  ESTADO_CARTA           FOR COLUMN ESTCARTA   VARCHAR(20) NOT NULL,
  USUARIO_CREACION       FOR COLUMN USRCREA    VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA   VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG    INTEGER       NOT NULL DEFAULT 1,
  OBSERVACIONES          FOR COLUMN OBSERVAC   VARCHAR(120),
  ESTADO_REGISTRO        FOR COLUMN ESTREG     CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT  TIMESTAMP,
  CONSTRAINT LCDOC_PK PRIMARY KEY (NUMERO_CARTA_CREDITO, TIPO_REGISTRO, CODIGO_BANCO, CODIGO_DOCUMENTO, NUMERO_LINEA)
) RCDFMT LCDOCR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.LCDOC IS 'Documentos Cartas Credito';

COMMENT ON TABLE IROJAS941.LCDOC IS 'Documentos asociados a cartas de credito, identificados por numero_carta_credito, tipo_registro, codigo_banco, codigo_documento y numero_linea. La columna numero_carta_credito es una referencia conceptual a LCMST (sin FK declarada por no existir dicha columna en LCMST).';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.LCDOC (NUMERO_CARTA_CREDITO IS 'Numero Carta Credito');
LABEL ON COLUMN IROJAS941.LCDOC (TIPO_REGISTRO IS 'Tipo Registro');
LABEL ON COLUMN IROJAS941.LCDOC (CODIGO_BANCO IS 'Codigo Banco');
LABEL ON COLUMN IROJAS941.LCDOC (CODIGO_DOCUMENTO IS 'Codigo Documento');
LABEL ON COLUMN IROJAS941.LCDOC (NUMERO_LINEA IS 'Numero Linea');
LABEL ON COLUMN IROJAS941.LCDOC (FECHA_EMISION IS 'Fecha Emision');
LABEL ON COLUMN IROJAS941.LCDOC (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.LCDOC (MONTO_ORIGINAL IS 'Monto Original');
LABEL ON COLUMN IROJAS941.LCDOC (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.LCDOC (BANCO_CORRESPONSAL IS 'Banco Corresponsal');
LABEL ON COLUMN IROJAS941.LCDOC (PAIS_DESTINO IS 'Pais Destino');
LABEL ON COLUMN IROJAS941.LCDOC (ESTADO_CARTA IS 'Estado Carta');
LABEL ON COLUMN IROJAS941.LCDOC (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.LCDOC (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.LCDOC (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.LCDOC (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.LCDOC (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.LCDOC (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.LCDOC (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.LCDOC.NUMERO_CARTA_CREDITO IS 'PK (1/5). Numero Carta Credito de LCDOC. Referencia conceptual a LCMST.numero_carta_credito (segun estructura_bd.md).';
COMMENT ON COLUMN IROJAS941.LCDOC.TIPO_REGISTRO IS 'PK (2/5). Tipo Registro de LCDOC.';
COMMENT ON COLUMN IROJAS941.LCDOC.CODIGO_BANCO IS 'PK (3/5). Codigo Banco de LCDOC.';
COMMENT ON COLUMN IROJAS941.LCDOC.CODIGO_DOCUMENTO IS 'PK (4/5). Codigo Documento de LCDOC.';
COMMENT ON COLUMN IROJAS941.LCDOC.NUMERO_LINEA IS 'PK (5/5). Numero Linea de LCDOC.';
COMMENT ON COLUMN IROJAS941.LCDOC.FECHA_EMISION IS 'Fecha Emision de LCDOC.';
COMMENT ON COLUMN IROJAS941.LCDOC.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de LCDOC.';
COMMENT ON COLUMN IROJAS941.LCDOC.MONTO_ORIGINAL IS 'Monto Original de LCDOC.';
COMMENT ON COLUMN IROJAS941.LCDOC.SALDO_ACTUAL IS 'Saldo Actual de LCDOC.';
COMMENT ON COLUMN IROJAS941.LCDOC.BANCO_CORRESPONSAL IS 'Banco Corresponsal de LCDOC.';
COMMENT ON COLUMN IROJAS941.LCDOC.PAIS_DESTINO IS 'Pais Destino de LCDOC.';
COMMENT ON COLUMN IROJAS941.LCDOC.ESTADO_CARTA IS 'Estado Carta de LCDOC.';
COMMENT ON COLUMN IROJAS941.LCDOC.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.LCDOC.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.LCDOC.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.LCDOC.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.LCDOC.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.LCDOC.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.LCDOC.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

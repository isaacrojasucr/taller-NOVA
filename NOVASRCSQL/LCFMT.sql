--==============================================================================
-- Nombre de la Tabla   : LCFMT
-- DESCRIPCIÓN          : Formatos de Cartas de Crédito
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 5 - Cartas de Credito) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Catalogo / Configuracion
-- Origen de los Datos  : Mantenimiento administrativo / parametrizacion del sistema core bancario (carga manual o por proceso de configuracion).
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.LCFMT (
  CODIGO_DOCUMENTO       FOR COLUMN CODDOC     VARCHAR(20) NOT NULL,
  SECUENCIA_DE_TEXTO     FOR COLUMN SEQDETXT   VARCHAR(50) NOT NULL,
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
  CONSTRAINT LCFMT_PK PRIMARY KEY (CODIGO_DOCUMENTO, SECUENCIA_DE_TEXTO, NUMERO_LINEA)
) RCDFMT LCFMTR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.LCFMT IS 'Formatos Cartas de Credito';

COMMENT ON TABLE IROJAS941.LCFMT IS 'Formatos de cartas de credito, identificados por codigo_documento, secuencia_de_texto y numero_linea.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.LCFMT (CODIGO_DOCUMENTO IS 'Codigo Documento');
LABEL ON COLUMN IROJAS941.LCFMT (SECUENCIA_DE_TEXTO IS 'Secuencia De Texto');
LABEL ON COLUMN IROJAS941.LCFMT (NUMERO_LINEA IS 'Numero Linea');
LABEL ON COLUMN IROJAS941.LCFMT (FECHA_EMISION IS 'Fecha Emision');
LABEL ON COLUMN IROJAS941.LCFMT (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.LCFMT (MONTO_ORIGINAL IS 'Monto Original');
LABEL ON COLUMN IROJAS941.LCFMT (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.LCFMT (BANCO_CORRESPONSAL IS 'Banco Corresponsal');
LABEL ON COLUMN IROJAS941.LCFMT (PAIS_DESTINO IS 'Pais Destino');
LABEL ON COLUMN IROJAS941.LCFMT (ESTADO_CARTA IS 'Estado Carta');
LABEL ON COLUMN IROJAS941.LCFMT (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.LCFMT (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.LCFMT (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.LCFMT (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.LCFMT (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.LCFMT (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.LCFMT (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.LCFMT.CODIGO_DOCUMENTO IS 'PK (1/3). Codigo Documento de LCFMT.';
COMMENT ON COLUMN IROJAS941.LCFMT.SECUENCIA_DE_TEXTO IS 'PK (2/3). Secuencia De Texto de LCFMT.';
COMMENT ON COLUMN IROJAS941.LCFMT.NUMERO_LINEA IS 'PK (3/3). Numero Linea de LCFMT.';
COMMENT ON COLUMN IROJAS941.LCFMT.FECHA_EMISION IS 'Fecha Emision de LCFMT.';
COMMENT ON COLUMN IROJAS941.LCFMT.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de LCFMT.';
COMMENT ON COLUMN IROJAS941.LCFMT.MONTO_ORIGINAL IS 'Monto Original de LCFMT.';
COMMENT ON COLUMN IROJAS941.LCFMT.SALDO_ACTUAL IS 'Saldo Actual de LCFMT.';
COMMENT ON COLUMN IROJAS941.LCFMT.BANCO_CORRESPONSAL IS 'Banco Corresponsal de LCFMT.';
COMMENT ON COLUMN IROJAS941.LCFMT.PAIS_DESTINO IS 'Pais Destino de LCFMT.';
COMMENT ON COLUMN IROJAS941.LCFMT.ESTADO_CARTA IS 'Estado Carta de LCFMT.';
COMMENT ON COLUMN IROJAS941.LCFMT.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.LCFMT.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.LCFMT.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.LCFMT.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.LCFMT.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.LCFMT.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.LCFMT.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

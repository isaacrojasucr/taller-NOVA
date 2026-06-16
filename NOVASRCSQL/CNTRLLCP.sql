--==============================================================================
-- Nombre de la Tabla   : CNTRLLCP
-- DESCRIPCIÓN          : Archivo de Control de Cartas de Crédito
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 5 - Cartas de Credito) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Catalogo / Parametros
-- Origen de los Datos  : Mantenimiento administrativo / parametrizacion del sistema core bancario (carga manual o por proceso de configuracion).
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.CNTRLLCP (
  CODIGO_BANCO           FOR COLUMN CODBANCO   VARCHAR(20) NOT NULL,
  LCRPARM                VARCHAR(20) NOT NULL,
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
  CONSTRAINT CNTRLLCP_PK PRIMARY KEY (CODIGO_BANCO, LCRPARM)
) RCDFMT CNTRLLCPR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.CNTRLLCP IS 'Control Cartas de Credito';

COMMENT ON TABLE IROJAS941.CNTRLLCP IS 'Archivo de control de cartas de credito, identificado por codigo_banco y lcrparm.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.CNTRLLCP (CODIGO_BANCO IS 'Codigo Banco');
LABEL ON COLUMN IROJAS941.CNTRLLCP (LCRPARM IS 'Lcrparm');
LABEL ON COLUMN IROJAS941.CNTRLLCP (FECHA_EMISION IS 'Fecha Emision');
LABEL ON COLUMN IROJAS941.CNTRLLCP (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.CNTRLLCP (MONTO_ORIGINAL IS 'Monto Original');
LABEL ON COLUMN IROJAS941.CNTRLLCP (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.CNTRLLCP (BANCO_CORRESPONSAL IS 'Banco Corresponsal');
LABEL ON COLUMN IROJAS941.CNTRLLCP (PAIS_DESTINO IS 'Pais Destino');
LABEL ON COLUMN IROJAS941.CNTRLLCP (ESTADO_CARTA IS 'Estado Carta');
LABEL ON COLUMN IROJAS941.CNTRLLCP (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.CNTRLLCP (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.CNTRLLCP (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.CNTRLLCP (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.CNTRLLCP (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.CNTRLLCP (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.CNTRLLCP (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.CNTRLLCP.CODIGO_BANCO IS 'PK (1/2). Codigo Banco de CNTRLLCP.';
COMMENT ON COLUMN IROJAS941.CNTRLLCP.LCRPARM IS 'PK (2/2). Lcrparm de CNTRLLCP.';
COMMENT ON COLUMN IROJAS941.CNTRLLCP.FECHA_EMISION IS 'Fecha Emision de CNTRLLCP.';
COMMENT ON COLUMN IROJAS941.CNTRLLCP.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de CNTRLLCP.';
COMMENT ON COLUMN IROJAS941.CNTRLLCP.MONTO_ORIGINAL IS 'Monto Original de CNTRLLCP.';
COMMENT ON COLUMN IROJAS941.CNTRLLCP.SALDO_ACTUAL IS 'Saldo Actual de CNTRLLCP.';
COMMENT ON COLUMN IROJAS941.CNTRLLCP.BANCO_CORRESPONSAL IS 'Banco Corresponsal de CNTRLLCP.';
COMMENT ON COLUMN IROJAS941.CNTRLLCP.PAIS_DESTINO IS 'Pais Destino de CNTRLLCP.';
COMMENT ON COLUMN IROJAS941.CNTRLLCP.ESTADO_CARTA IS 'Estado Carta de CNTRLLCP.';
COMMENT ON COLUMN IROJAS941.CNTRLLCP.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CNTRLLCP.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CNTRLLCP.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.CNTRLLCP.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.CNTRLLCP.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.CNTRLLCP.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.CNTRLLCP.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

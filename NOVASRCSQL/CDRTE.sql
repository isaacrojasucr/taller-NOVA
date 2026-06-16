--==============================================================================
-- Nombre de la Tabla   : CDRTE
-- DESCRIPCIÓN          : Tabla de Tasas de Depósitos
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 4 - Contratos/Certificados/Giros/Valores al Cobro) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Catalogo / Parametros
-- Origen de los Datos  : Mantenimiento administrativo / parametrizacion del sistema core bancario (carga manual o por proceso de configuracion).
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.CDRTE (
  NUMERO_TABLA           FOR COLUMN NUMTBL     VARCHAR(30) NOT NULL,
  FECHA                  DATE NOT NULL,
  CODIGO_MONEDA          FOR COLUMN CODMON     VARCHAR(20) NOT NULL,
  FECHA_DESEMBOLSO       FOR COLUMN FCHDESE    DATE NOT NULL,
  FECHA_VENCIMIENTO      FOR COLUMN FCHVENC    DATE NOT NULL,
  MONTO_ORIGINAL         FOR COLUMN MONTOORIG  DECIMAL(18 , 2) NOT NULL,
  SALDO_ACTUAL           FOR COLUMN SALDOACT   DECIMAL(18 , 2) NOT NULL,
  TASA_INTERES           FOR COLUMN TASAINT    DECIMAL(18 , 2) NOT NULL,
  PLAZO_MESES            FOR COLUMN PLAZOMESE  INTEGER NOT NULL,
  DIAS_MORA              FOR COLUMN DIASMORA   INTEGER NOT NULL,
  ESTADO_OPERACION       FOR COLUMN ESTOPER    VARCHAR(20) NOT NULL,
  USUARIO_CREACION       FOR COLUMN USRCREA    VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA   VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG    INTEGER       NOT NULL DEFAULT 1,
  OBSERVACIONES          FOR COLUMN OBSERVAC   VARCHAR(120),
  ESTADO_REGISTRO        FOR COLUMN ESTREG     CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT  TIMESTAMP,
  CONSTRAINT CDRTE_PK PRIMARY KEY (NUMERO_TABLA, FECHA, CODIGO_MONEDA)
) RCDFMT CDRTER;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.CDRTE IS 'Tasas de Depositos';

COMMENT ON TABLE IROJAS941.CDRTE IS 'Tabla de tasas de depositos, identificada por numero_tabla, fecha y codigo_moneda.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.CDRTE (NUMERO_TABLA IS 'Numero Tabla');
LABEL ON COLUMN IROJAS941.CDRTE (FECHA IS 'Fecha');
LABEL ON COLUMN IROJAS941.CDRTE (CODIGO_MONEDA IS 'Codigo Moneda');
LABEL ON COLUMN IROJAS941.CDRTE (FECHA_DESEMBOLSO IS 'Fecha Desembolso');
LABEL ON COLUMN IROJAS941.CDRTE (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.CDRTE (MONTO_ORIGINAL IS 'Monto Original');
LABEL ON COLUMN IROJAS941.CDRTE (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.CDRTE (TASA_INTERES IS 'Tasa Interes');
LABEL ON COLUMN IROJAS941.CDRTE (PLAZO_MESES IS 'Plazo Meses');
LABEL ON COLUMN IROJAS941.CDRTE (DIAS_MORA IS 'Dias Mora');
LABEL ON COLUMN IROJAS941.CDRTE (ESTADO_OPERACION IS 'Estado Operacion');
LABEL ON COLUMN IROJAS941.CDRTE (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.CDRTE (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.CDRTE (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.CDRTE (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.CDRTE (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.CDRTE (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.CDRTE (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.CDRTE.NUMERO_TABLA IS 'PK (1/3). Numero Tabla de CDRTE.';
COMMENT ON COLUMN IROJAS941.CDRTE.FECHA IS 'PK (2/3). Fecha de CDRTE.';
COMMENT ON COLUMN IROJAS941.CDRTE.CODIGO_MONEDA IS 'PK (3/3). Codigo Moneda de CDRTE.';
COMMENT ON COLUMN IROJAS941.CDRTE.FECHA_DESEMBOLSO IS 'Fecha Desembolso de CDRTE.';
COMMENT ON COLUMN IROJAS941.CDRTE.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de CDRTE.';
COMMENT ON COLUMN IROJAS941.CDRTE.MONTO_ORIGINAL IS 'Monto Original de CDRTE.';
COMMENT ON COLUMN IROJAS941.CDRTE.SALDO_ACTUAL IS 'Saldo Actual de CDRTE.';
COMMENT ON COLUMN IROJAS941.CDRTE.TASA_INTERES IS 'Tasa Interes de CDRTE.';
COMMENT ON COLUMN IROJAS941.CDRTE.PLAZO_MESES IS 'Plazo Meses de CDRTE.';
COMMENT ON COLUMN IROJAS941.CDRTE.DIAS_MORA IS 'Dias Mora de CDRTE.';
COMMENT ON COLUMN IROJAS941.CDRTE.ESTADO_OPERACION IS 'Estado Operacion de CDRTE.';
COMMENT ON COLUMN IROJAS941.CDRTE.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CDRTE.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CDRTE.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.CDRTE.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.CDRTE.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.CDRTE.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.CDRTE.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

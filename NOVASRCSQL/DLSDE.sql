--==============================================================================
-- Nombre de la Tabla   : DLSDE
-- DESCRIPCIÓN          : Detalle de Deducciones del Plan de Pagos
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 4 - Contratos/Certificados/Giros/Valores al Cobro) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Transaccional / Detalle
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de otorgamiento y administracion de prestamos, certificados, giros y valores al cobro.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.DLSDE (
  NUMERO_PRESTAMO        FOR COLUMN NUMPMO     VARCHAR(30) NOT NULL,
  FECHA                  DATE NOT NULL,
  TIPO_REGISTRO          FOR COLUMN TIPOREG    VARCHAR(20) NOT NULL,
  SECUENCIA              INTEGER NOT NULL,
  CODIGO_DEDUCCION       FOR COLUMN CODDEDUC   VARCHAR(20) NOT NULL,
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
  CONSTRAINT DLSDE_PK PRIMARY KEY (NUMERO_PRESTAMO, FECHA, TIPO_REGISTRO, SECUENCIA, CODIGO_DEDUCCION)
) RCDFMT DLSDER;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.DLSDE IS 'Deducciones Plan de Pagos';

COMMENT ON TABLE IROJAS941.DLSDE IS 'Detalle de deducciones del plan de pagos, identificado por numero_prestamo, fecha, tipo_registro, secuencia y codigo_deduccion. La columna numero_prestamo es una referencia conceptual a DEALS (sin FK declarada por no existir dicha columna en DEALS).';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.DLSDE (NUMERO_PRESTAMO IS 'Numero Prestamo');
LABEL ON COLUMN IROJAS941.DLSDE (FECHA IS 'Fecha');
LABEL ON COLUMN IROJAS941.DLSDE (TIPO_REGISTRO IS 'Tipo Registro');
LABEL ON COLUMN IROJAS941.DLSDE (SECUENCIA IS 'Secuencia');
LABEL ON COLUMN IROJAS941.DLSDE (CODIGO_DEDUCCION IS 'Codigo Deduccion');
LABEL ON COLUMN IROJAS941.DLSDE (FECHA_DESEMBOLSO IS 'Fecha Desembolso');
LABEL ON COLUMN IROJAS941.DLSDE (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.DLSDE (MONTO_ORIGINAL IS 'Monto Original');
LABEL ON COLUMN IROJAS941.DLSDE (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.DLSDE (TASA_INTERES IS 'Tasa Interes');
LABEL ON COLUMN IROJAS941.DLSDE (PLAZO_MESES IS 'Plazo Meses');
LABEL ON COLUMN IROJAS941.DLSDE (DIAS_MORA IS 'Dias Mora');
LABEL ON COLUMN IROJAS941.DLSDE (ESTADO_OPERACION IS 'Estado Operacion');
LABEL ON COLUMN IROJAS941.DLSDE (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.DLSDE (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.DLSDE (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.DLSDE (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.DLSDE (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.DLSDE (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.DLSDE (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.DLSDE.NUMERO_PRESTAMO IS 'PK (1/5). Numero Prestamo de DLSDE. Referencia conceptual a DEALS.numero_prestamo (segun estructura_bd.md).';
COMMENT ON COLUMN IROJAS941.DLSDE.FECHA IS 'PK (2/5). Fecha de DLSDE.';
COMMENT ON COLUMN IROJAS941.DLSDE.TIPO_REGISTRO IS 'PK (3/5). Tipo Registro de DLSDE.';
COMMENT ON COLUMN IROJAS941.DLSDE.SECUENCIA IS 'PK (4/5). Secuencia de DLSDE.';
COMMENT ON COLUMN IROJAS941.DLSDE.CODIGO_DEDUCCION IS 'PK (5/5). Codigo Deduccion de DLSDE.';
COMMENT ON COLUMN IROJAS941.DLSDE.FECHA_DESEMBOLSO IS 'Fecha Desembolso de DLSDE.';
COMMENT ON COLUMN IROJAS941.DLSDE.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de DLSDE.';
COMMENT ON COLUMN IROJAS941.DLSDE.MONTO_ORIGINAL IS 'Monto Original de DLSDE.';
COMMENT ON COLUMN IROJAS941.DLSDE.SALDO_ACTUAL IS 'Saldo Actual de DLSDE.';
COMMENT ON COLUMN IROJAS941.DLSDE.TASA_INTERES IS 'Tasa Interes de DLSDE.';
COMMENT ON COLUMN IROJAS941.DLSDE.PLAZO_MESES IS 'Plazo Meses de DLSDE.';
COMMENT ON COLUMN IROJAS941.DLSDE.DIAS_MORA IS 'Dias Mora de DLSDE.';
COMMENT ON COLUMN IROJAS941.DLSDE.ESTADO_OPERACION IS 'Estado Operacion de DLSDE.';
COMMENT ON COLUMN IROJAS941.DLSDE.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.DLSDE.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.DLSDE.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.DLSDE.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.DLSDE.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.DLSDE.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.DLSDE.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

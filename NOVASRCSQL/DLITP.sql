--==============================================================================
-- Nombre de la Tabla   : DLITP
-- DESCRIPCIÓN          : Maestro de Deducciones de Préstamos.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 4 - Contratos/Certificados/Giros/Valores al Cobro) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Maestro / Detalle
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de otorgamiento y administracion de prestamos, certificados, giros y valores al cobro.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.DLITP (
  NUMERO_PRESTAMO        FOR COLUMN NUMPMO     VARCHAR(30) NOT NULL,
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
  CONSTRAINT DLITP_PK PRIMARY KEY (NUMERO_PRESTAMO, CODIGO_DEDUCCION)
) RCDFMT DLITPR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.DLITP IS 'Maestro Deducciones Prestamos';

COMMENT ON TABLE IROJAS941.DLITP IS 'Maestro de deducciones de prestamos, identificado por numero_prestamo y codigo_deduccion. La columna numero_prestamo es una referencia conceptual a DEALS (sin FK declarada por no existir dicha columna en DEALS).';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.DLITP (NUMERO_PRESTAMO IS 'Numero Prestamo');
LABEL ON COLUMN IROJAS941.DLITP (CODIGO_DEDUCCION IS 'Codigo Deduccion');
LABEL ON COLUMN IROJAS941.DLITP (FECHA_DESEMBOLSO IS 'Fecha Desembolso');
LABEL ON COLUMN IROJAS941.DLITP (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.DLITP (MONTO_ORIGINAL IS 'Monto Original');
LABEL ON COLUMN IROJAS941.DLITP (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.DLITP (TASA_INTERES IS 'Tasa Interes');
LABEL ON COLUMN IROJAS941.DLITP (PLAZO_MESES IS 'Plazo Meses');
LABEL ON COLUMN IROJAS941.DLITP (DIAS_MORA IS 'Dias Mora');
LABEL ON COLUMN IROJAS941.DLITP (ESTADO_OPERACION IS 'Estado Operacion');
LABEL ON COLUMN IROJAS941.DLITP (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.DLITP (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.DLITP (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.DLITP (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.DLITP (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.DLITP (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.DLITP (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.DLITP.NUMERO_PRESTAMO IS 'PK (1/2). Numero Prestamo de DLITP. Referencia conceptual a DEALS.numero_prestamo (segun estructura_bd.md).';
COMMENT ON COLUMN IROJAS941.DLITP.CODIGO_DEDUCCION IS 'PK (2/2). Codigo Deduccion de DLITP.';
COMMENT ON COLUMN IROJAS941.DLITP.FECHA_DESEMBOLSO IS 'Fecha Desembolso de DLITP.';
COMMENT ON COLUMN IROJAS941.DLITP.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de DLITP.';
COMMENT ON COLUMN IROJAS941.DLITP.MONTO_ORIGINAL IS 'Monto Original de DLITP.';
COMMENT ON COLUMN IROJAS941.DLITP.SALDO_ACTUAL IS 'Saldo Actual de DLITP.';
COMMENT ON COLUMN IROJAS941.DLITP.TASA_INTERES IS 'Tasa Interes de DLITP.';
COMMENT ON COLUMN IROJAS941.DLITP.PLAZO_MESES IS 'Plazo Meses de DLITP.';
COMMENT ON COLUMN IROJAS941.DLITP.DIAS_MORA IS 'Dias Mora de DLITP.';
COMMENT ON COLUMN IROJAS941.DLITP.ESTADO_OPERACION IS 'Estado Operacion de DLITP.';
COMMENT ON COLUMN IROJAS941.DLITP.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.DLITP.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.DLITP.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.DLITP.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.DLITP.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.DLITP.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.DLITP.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

--==============================================================================
-- Nombre de la Tabla   : DLPMT
-- DESCRIPCIÓN          : Plan de Pagos
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 4 - Contratos/Certificados/Giros/Valores al Cobro) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Transaccional / Operativo
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de otorgamiento y administracion de prestamos, certificados, giros y valores al cobro.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.DLPMT (
  CODIGO_BANCO           FOR COLUMN CODBANCO   VARCHAR(20) NOT NULL,
  CODIGO_SUCURSAL        FOR COLUMN CODSUC     VARCHAR(20) NOT NULL,
  CODIGO_MONEDA          FOR COLUMN CODMON     VARCHAR(20) NOT NULL,
  NUMERO_PRESTAMO        FOR COLUMN NUMPMO     VARCHAR(30) NOT NULL,
  FECHA                  DATE NOT NULL,
  TIPO_REGISTRO          FOR COLUMN TIPOREG    VARCHAR(20) NOT NULL,
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
  CONSTRAINT DLPMT_PK PRIMARY KEY (CODIGO_BANCO, CODIGO_SUCURSAL, CODIGO_MONEDA, NUMERO_PRESTAMO, FECHA, TIPO_REGISTRO)
) RCDFMT DLPMTR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.DLPMT IS 'Plan de Pagos';

COMMENT ON TABLE IROJAS941.DLPMT IS 'Plan de pagos de prestamos, identificado por codigo_banco, codigo_sucursal, codigo_moneda, numero_prestamo, fecha y tipo_registro. La columna numero_prestamo es una referencia conceptual a DEALS (sin FK declarada por no existir dicha columna en DEALS).';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.DLPMT (CODIGO_BANCO IS 'Codigo Banco');
LABEL ON COLUMN IROJAS941.DLPMT (CODIGO_SUCURSAL IS 'Codigo Sucursal');
LABEL ON COLUMN IROJAS941.DLPMT (CODIGO_MONEDA IS 'Codigo Moneda');
LABEL ON COLUMN IROJAS941.DLPMT (NUMERO_PRESTAMO IS 'Numero Prestamo');
LABEL ON COLUMN IROJAS941.DLPMT (FECHA IS 'Fecha');
LABEL ON COLUMN IROJAS941.DLPMT (TIPO_REGISTRO IS 'Tipo Registro');
LABEL ON COLUMN IROJAS941.DLPMT (FECHA_DESEMBOLSO IS 'Fecha Desembolso');
LABEL ON COLUMN IROJAS941.DLPMT (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.DLPMT (MONTO_ORIGINAL IS 'Monto Original');
LABEL ON COLUMN IROJAS941.DLPMT (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.DLPMT (TASA_INTERES IS 'Tasa Interes');
LABEL ON COLUMN IROJAS941.DLPMT (PLAZO_MESES IS 'Plazo Meses');
LABEL ON COLUMN IROJAS941.DLPMT (DIAS_MORA IS 'Dias Mora');
LABEL ON COLUMN IROJAS941.DLPMT (ESTADO_OPERACION IS 'Estado Operacion');
LABEL ON COLUMN IROJAS941.DLPMT (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.DLPMT (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.DLPMT (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.DLPMT (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.DLPMT (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.DLPMT (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.DLPMT (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.DLPMT.CODIGO_BANCO IS 'PK (1/6). Codigo Banco de DLPMT.';
COMMENT ON COLUMN IROJAS941.DLPMT.CODIGO_SUCURSAL IS 'PK (2/6). Codigo Sucursal de DLPMT.';
COMMENT ON COLUMN IROJAS941.DLPMT.CODIGO_MONEDA IS 'PK (3/6). Codigo Moneda de DLPMT.';
COMMENT ON COLUMN IROJAS941.DLPMT.NUMERO_PRESTAMO IS 'PK (4/6). Numero Prestamo de DLPMT. Referencia conceptual a DEALS.numero_prestamo (segun estructura_bd.md).';
COMMENT ON COLUMN IROJAS941.DLPMT.FECHA IS 'PK (5/6). Fecha de DLPMT.';
COMMENT ON COLUMN IROJAS941.DLPMT.TIPO_REGISTRO IS 'PK (6/6). Tipo Registro de DLPMT.';
COMMENT ON COLUMN IROJAS941.DLPMT.FECHA_DESEMBOLSO IS 'Fecha Desembolso de DLPMT.';
COMMENT ON COLUMN IROJAS941.DLPMT.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de DLPMT.';
COMMENT ON COLUMN IROJAS941.DLPMT.MONTO_ORIGINAL IS 'Monto Original de DLPMT.';
COMMENT ON COLUMN IROJAS941.DLPMT.SALDO_ACTUAL IS 'Saldo Actual de DLPMT.';
COMMENT ON COLUMN IROJAS941.DLPMT.TASA_INTERES IS 'Tasa Interes de DLPMT.';
COMMENT ON COLUMN IROJAS941.DLPMT.PLAZO_MESES IS 'Plazo Meses de DLPMT.';
COMMENT ON COLUMN IROJAS941.DLPMT.DIAS_MORA IS 'Dias Mora de DLPMT.';
COMMENT ON COLUMN IROJAS941.DLPMT.ESTADO_OPERACION IS 'Estado Operacion de DLPMT.';
COMMENT ON COLUMN IROJAS941.DLPMT.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.DLPMT.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.DLPMT.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.DLPMT.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.DLPMT.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.DLPMT.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.DLPMT.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

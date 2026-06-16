--==============================================================================
-- Nombre de la Tabla   : DDCPN
-- DESCRIPCIÓN          : Transacciones pendientes de Cobro.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 4 - Contratos/Certificados/Giros/Valores al Cobro) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Transaccional / Operativo
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de otorgamiento y administracion de prestamos, certificados, giros y valores al cobro.
-- Permanencia de Datos : Permanente (historico)
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.DDCPN (
  NUMERO_PRESTAMO        FOR COLUMN NUMPMO     VARCHAR(30) NOT NULL,
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
  CONSTRAINT DDCPN_PK PRIMARY KEY (NUMERO_PRESTAMO)
) RCDFMT DDCPNR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.DDCPN IS 'Transacciones Pendientes Cobro';

COMMENT ON TABLE IROJAS941.DDCPN IS 'Transacciones pendientes de cobro, identificadas por numero_prestamo. La columna numero_prestamo es una referencia conceptual a DEALS (sin FK declarada por no existir dicha columna en DEALS).';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.DDCPN (NUMERO_PRESTAMO IS 'Numero Prestamo');
LABEL ON COLUMN IROJAS941.DDCPN (FECHA_DESEMBOLSO IS 'Fecha Desembolso');
LABEL ON COLUMN IROJAS941.DDCPN (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.DDCPN (MONTO_ORIGINAL IS 'Monto Original');
LABEL ON COLUMN IROJAS941.DDCPN (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.DDCPN (TASA_INTERES IS 'Tasa Interes');
LABEL ON COLUMN IROJAS941.DDCPN (PLAZO_MESES IS 'Plazo Meses');
LABEL ON COLUMN IROJAS941.DDCPN (DIAS_MORA IS 'Dias Mora');
LABEL ON COLUMN IROJAS941.DDCPN (ESTADO_OPERACION IS 'Estado Operacion');
LABEL ON COLUMN IROJAS941.DDCPN (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.DDCPN (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.DDCPN (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.DDCPN (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.DDCPN (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.DDCPN (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.DDCPN (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.DDCPN.NUMERO_PRESTAMO IS 'PK (1/1). Numero Prestamo de DDCPN. Referencia conceptual a DEALS.numero_prestamo (segun estructura_bd.md).';
COMMENT ON COLUMN IROJAS941.DDCPN.FECHA_DESEMBOLSO IS 'Fecha Desembolso de DDCPN.';
COMMENT ON COLUMN IROJAS941.DDCPN.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de DDCPN.';
COMMENT ON COLUMN IROJAS941.DDCPN.MONTO_ORIGINAL IS 'Monto Original de DDCPN.';
COMMENT ON COLUMN IROJAS941.DDCPN.SALDO_ACTUAL IS 'Saldo Actual de DDCPN.';
COMMENT ON COLUMN IROJAS941.DDCPN.TASA_INTERES IS 'Tasa Interes de DDCPN.';
COMMENT ON COLUMN IROJAS941.DDCPN.PLAZO_MESES IS 'Plazo Meses de DDCPN.';
COMMENT ON COLUMN IROJAS941.DDCPN.DIAS_MORA IS 'Dias Mora de DDCPN.';
COMMENT ON COLUMN IROJAS941.DDCPN.ESTADO_OPERACION IS 'Estado Operacion de DDCPN.';
COMMENT ON COLUMN IROJAS941.DDCPN.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.DDCPN.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.DDCPN.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.DDCPN.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.DDCPN.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.DDCPN.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.DDCPN.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

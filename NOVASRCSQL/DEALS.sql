--==============================================================================
-- Nombre de la Tabla   : DEALS
-- DESCRIPCIÓN          : Maestro de Préstamos, Certificados, Giros, Valores al Cobro, Inversiones.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 4 - Contratos/Certificados/Giros/Valores al Cobro) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Maestro
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de otorgamiento y administracion de prestamos, certificados, giros y valores al cobro.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.DEALS (
  ID                     BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL,
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
  CONSTRAINT DEALS_PK PRIMARY KEY (ID)
) RCDFMT DEALSR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.DEALS IS 'Maestro de Prestamos y Valores';

COMMENT ON TABLE IROJAS941.DEALS IS 'Maestro de prestamos, certificados, giros, valores al cobro e inversiones del banco. La tabla no define una clave natural en estructura_bd.md, por lo que utiliza la columna ID como llave primaria tecnica (surrogate key). Es referenciada conceptualmente desde otras tablas del modulo (DLPMT, DLDRF, DLSDE, DDCPN, DLITP) a traves de numero_prestamo, sin FK declarada por no existir dicha columna en DEALS.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.DEALS (ID IS 'Id');
LABEL ON COLUMN IROJAS941.DEALS (FECHA_DESEMBOLSO IS 'Fecha Desembolso');
LABEL ON COLUMN IROJAS941.DEALS (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.DEALS (MONTO_ORIGINAL IS 'Monto Original');
LABEL ON COLUMN IROJAS941.DEALS (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.DEALS (TASA_INTERES IS 'Tasa Interes');
LABEL ON COLUMN IROJAS941.DEALS (PLAZO_MESES IS 'Plazo Meses');
LABEL ON COLUMN IROJAS941.DEALS (DIAS_MORA IS 'Dias Mora');
LABEL ON COLUMN IROJAS941.DEALS (ESTADO_OPERACION IS 'Estado Operacion');
LABEL ON COLUMN IROJAS941.DEALS (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.DEALS (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.DEALS (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.DEALS (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.DEALS (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.DEALS (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.DEALS (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.DEALS.ID IS 'PK (1/1). Id de DEALS.';
COMMENT ON COLUMN IROJAS941.DEALS.FECHA_DESEMBOLSO IS 'Fecha Desembolso de DEALS.';
COMMENT ON COLUMN IROJAS941.DEALS.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de DEALS.';
COMMENT ON COLUMN IROJAS941.DEALS.MONTO_ORIGINAL IS 'Monto Original de DEALS.';
COMMENT ON COLUMN IROJAS941.DEALS.SALDO_ACTUAL IS 'Saldo Actual de DEALS.';
COMMENT ON COLUMN IROJAS941.DEALS.TASA_INTERES IS 'Tasa Interes de DEALS.';
COMMENT ON COLUMN IROJAS941.DEALS.PLAZO_MESES IS 'Plazo Meses de DEALS.';
COMMENT ON COLUMN IROJAS941.DEALS.DIAS_MORA IS 'Dias Mora de DEALS.';
COMMENT ON COLUMN IROJAS941.DEALS.ESTADO_OPERACION IS 'Estado Operacion de DEALS.';
COMMENT ON COLUMN IROJAS941.DEALS.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.DEALS.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.DEALS.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.DEALS.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.DEALS.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.DEALS.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.DEALS.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

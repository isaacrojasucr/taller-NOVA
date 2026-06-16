--==============================================================================
-- Nombre de la Tabla   : BUMST
-- DESCRIPCIÓN          : Maestro de Presupuestos
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 7 - Contabilidad) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Maestro / Parametros
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por los procesos contables (batch de fin de dia, asientos automaticos y consolidacion de balances).
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.BUMST (
  CODIGO_BANCO           FOR COLUMN CODBANCO   VARCHAR(20) NOT NULL,
  CODIGO_SUCURSAL        FOR COLUMN CODSUC     VARCHAR(20) NOT NULL,
  CODIGO_MONEDA          FOR COLUMN CODMON     VARCHAR(20) NOT NULL,
  NUMERO_PRESUPUESTO     FOR COLUMN NUMPPTO    VARCHAR(30) NOT NULL,
  CENTRO_COSTO           FOR COLUMN CENTCOSTO  VARCHAR(50) NOT NULL,
  DESCRIPCION_CUENTA     FOR COLUMN DESCCTA    VARCHAR(120) NOT NULL,
  NATURALEZA_CUENTA      FOR COLUMN NATCTA     VARCHAR(20) NOT NULL,
  NIVEL_CUENTA           FOR COLUMN NIVELCTA   VARCHAR(50) NOT NULL,
  SALDO_ACTUAL           FOR COLUMN SALDOACT   DECIMAL(18 , 2) NOT NULL,
  FECHA_PROCESO_SISTEMA  FOR COLUMN FCHPROCSIS TIMESTAMP NOT NULL,
  OBSERVACIONES          FOR COLUMN OBSERVAC   VARCHAR(120),
  USUARIO_CREACION       FOR COLUMN USRCREA    VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA   VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG    INTEGER       NOT NULL DEFAULT 1,
  ESTADO_REGISTRO        FOR COLUMN ESTREG     CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT  TIMESTAMP,
  CONSTRAINT BUMST_PK PRIMARY KEY (CODIGO_BANCO, CODIGO_SUCURSAL, CODIGO_MONEDA, NUMERO_PRESUPUESTO, CENTRO_COSTO)
) RCDFMT BUMSTR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.BUMST IS 'Maestro de Presupuestos';

COMMENT ON TABLE IROJAS941.BUMST IS 'Maestro de presupuestos, identificado por codigo_banco, codigo_sucursal, codigo_moneda, numero_presupuesto y centro_costo.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.BUMST (CODIGO_BANCO IS 'Codigo Banco');
LABEL ON COLUMN IROJAS941.BUMST (CODIGO_SUCURSAL IS 'Codigo Sucursal');
LABEL ON COLUMN IROJAS941.BUMST (CODIGO_MONEDA IS 'Codigo Moneda');
LABEL ON COLUMN IROJAS941.BUMST (NUMERO_PRESUPUESTO IS 'Numero Presupuesto');
LABEL ON COLUMN IROJAS941.BUMST (CENTRO_COSTO IS 'Centro Costo');
LABEL ON COLUMN IROJAS941.BUMST (DESCRIPCION_CUENTA IS 'Descripcion Cuenta');
LABEL ON COLUMN IROJAS941.BUMST (NATURALEZA_CUENTA IS 'Naturaleza Cuenta');
LABEL ON COLUMN IROJAS941.BUMST (NIVEL_CUENTA IS 'Nivel Cuenta');
LABEL ON COLUMN IROJAS941.BUMST (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.BUMST (FECHA_PROCESO_SISTEMA IS 'Fecha Proceso Sistema');
LABEL ON COLUMN IROJAS941.BUMST (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.BUMST (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.BUMST (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.BUMST (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.BUMST (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.BUMST (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.BUMST (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.BUMST.CODIGO_BANCO IS 'PK (1/5). Codigo Banco de BUMST.';
COMMENT ON COLUMN IROJAS941.BUMST.CODIGO_SUCURSAL IS 'PK (2/5). Codigo Sucursal de BUMST.';
COMMENT ON COLUMN IROJAS941.BUMST.CODIGO_MONEDA IS 'PK (3/5). Codigo Moneda de BUMST.';
COMMENT ON COLUMN IROJAS941.BUMST.NUMERO_PRESUPUESTO IS 'PK (4/5). Numero Presupuesto de BUMST.';
COMMENT ON COLUMN IROJAS941.BUMST.CENTRO_COSTO IS 'PK (5/5). Centro Costo de BUMST.';
COMMENT ON COLUMN IROJAS941.BUMST.DESCRIPCION_CUENTA IS 'Descripcion Cuenta de BUMST.';
COMMENT ON COLUMN IROJAS941.BUMST.NATURALEZA_CUENTA IS 'Naturaleza Cuenta de BUMST.';
COMMENT ON COLUMN IROJAS941.BUMST.NIVEL_CUENTA IS 'Nivel Cuenta de BUMST.';
COMMENT ON COLUMN IROJAS941.BUMST.SALDO_ACTUAL IS 'Saldo Actual de BUMST.';
COMMENT ON COLUMN IROJAS941.BUMST.FECHA_PROCESO_SISTEMA IS 'Fecha Proceso Sistema de BUMST.';
COMMENT ON COLUMN IROJAS941.BUMST.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.BUMST.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.BUMST.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.BUMST.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.BUMST.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.BUMST.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.BUMST.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

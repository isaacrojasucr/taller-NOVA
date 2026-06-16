--==============================================================================
-- Nombre de la Tabla   : RATES
-- DESCRIPCIÓN          : Archivos de Tasas de Cambio (Posición / Contra Valor)
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 1 - Archivos Comunes) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Maestro / Parametros
-- Origen de los Datos  : Mantenimiento administrativo / parametrizacion del sistema core bancario (carga manual o por proceso de configuracion).
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.RATES (
  CODIGO_BANCO           FOR COLUMN CODBANCO   VARCHAR(20) NOT NULL,
  CODIGO_MONEDA          FOR COLUMN CODMON     VARCHAR(20) NOT NULL,
  DESCRIPCION            FOR COLUMN DESCRIP    VARCHAR(120) NOT NULL,
  VALOR_TEXTO            FOR COLUMN VALORTXT   VARCHAR(50) NOT NULL,
  VALOR_NUMERICO         FOR COLUMN VALORNUM   DECIMAL(18 , 2) NOT NULL,
  VIGENCIA_DESDE         FOR COLUMN VIGDESDE   DATE NOT NULL,
  VIGENCIA_HASTA         FOR COLUMN VIGHASTA   DATE NOT NULL,
  ORDEN_VISUALIZACION    FOR COLUMN ORDVISUAL  INTEGER NOT NULL,
  USUARIO_CREACION       FOR COLUMN USRCREA    VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA   VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG    INTEGER       NOT NULL DEFAULT 1,
  OBSERVACIONES          FOR COLUMN OBSERVAC   VARCHAR(120),
  ESTADO_REGISTRO        FOR COLUMN ESTREG     CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT  TIMESTAMP,
  CONSTRAINT RATES_PK PRIMARY KEY (CODIGO_BANCO, CODIGO_MONEDA)
) RCDFMT RATESR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.RATES IS 'Tasas de Cambio';

COMMENT ON TABLE IROJAS941.RATES IS 'Tasas de cambio (posicion / contravalor) vigentes por banco y moneda.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.RATES (CODIGO_BANCO IS 'Codigo Banco');
LABEL ON COLUMN IROJAS941.RATES (CODIGO_MONEDA IS 'Codigo Moneda');
LABEL ON COLUMN IROJAS941.RATES (DESCRIPCION IS 'Descripcion');
LABEL ON COLUMN IROJAS941.RATES (VALOR_TEXTO IS 'Valor Texto');
LABEL ON COLUMN IROJAS941.RATES (VALOR_NUMERICO IS 'Valor Numerico');
LABEL ON COLUMN IROJAS941.RATES (VIGENCIA_DESDE IS 'Vigencia Desde');
LABEL ON COLUMN IROJAS941.RATES (VIGENCIA_HASTA IS 'Vigencia Hasta');
LABEL ON COLUMN IROJAS941.RATES (ORDEN_VISUALIZACION IS 'Orden Visualizacion');
LABEL ON COLUMN IROJAS941.RATES (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.RATES (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.RATES (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.RATES (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.RATES (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.RATES (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.RATES (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.RATES.CODIGO_BANCO IS 'PK (1/2). Codigo Banco de RATES.';
COMMENT ON COLUMN IROJAS941.RATES.CODIGO_MONEDA IS 'PK (2/2). Codigo Moneda de RATES.';
COMMENT ON COLUMN IROJAS941.RATES.DESCRIPCION IS 'Descripcion de RATES.';
COMMENT ON COLUMN IROJAS941.RATES.VALOR_TEXTO IS 'Valor Texto de RATES.';
COMMENT ON COLUMN IROJAS941.RATES.VALOR_NUMERICO IS 'Valor Numerico de RATES.';
COMMENT ON COLUMN IROJAS941.RATES.VIGENCIA_DESDE IS 'Vigencia Desde de RATES.';
COMMENT ON COLUMN IROJAS941.RATES.VIGENCIA_HASTA IS 'Vigencia Hasta de RATES.';
COMMENT ON COLUMN IROJAS941.RATES.ORDEN_VISUALIZACION IS 'Orden Visualizacion de RATES.';
COMMENT ON COLUMN IROJAS941.RATES.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.RATES.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.RATES.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.RATES.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.RATES.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.RATES.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.RATES.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

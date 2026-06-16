--==============================================================================
-- Nombre de la Tabla   : HSNOT
-- DESCRIPCIÓN          : Histórico de Datos impresos en las Notificaciones
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 1 - Archivos Comunes) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Historico
-- Origen de los Datos  : Sistema transaccional (core bancario); registros consolidados desde el proceso operativo correspondiente.
-- Permanencia de Datos : Permanente (historico)
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.HSNOT (
  CODIGO_BANCO           FOR COLUMN CODBANCO   VARCHAR(20) NOT NULL,
  FECHA_PROCESO          FOR COLUMN FCHPROC    DATE NOT NULL,
  NUMERO_CUENTA          FOR COLUMN NUMCTA     VARCHAR(24) NOT NULL,
  CODIGO_DE_NOTIFICACION FOR COLUMN CODDENOTIF VARCHAR(20) NOT NULL,
  NIVEL                  INTEGER NOT NULL,
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
  CONSTRAINT HSNOT_PK PRIMARY KEY (CODIGO_BANCO, FECHA_PROCESO, NUMERO_CUENTA, CODIGO_DE_NOTIFICACION, NIVEL)
) RCDFMT HSNOTR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.HSNOT IS 'Historico Notificaciones';

COMMENT ON TABLE IROJAS941.HSNOT IS 'Historico de datos impresos en notificaciones, identificado por banco, fecha de proceso, numero de cuenta, codigo de notificacion y nivel.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.HSNOT (CODIGO_BANCO IS 'Codigo Banco');
LABEL ON COLUMN IROJAS941.HSNOT (FECHA_PROCESO IS 'Fecha Proceso');
LABEL ON COLUMN IROJAS941.HSNOT (NUMERO_CUENTA IS 'Numero Cuenta');
LABEL ON COLUMN IROJAS941.HSNOT (CODIGO_DE_NOTIFICACION IS 'Codigo De Notificacion');
LABEL ON COLUMN IROJAS941.HSNOT (NIVEL IS 'Nivel');
LABEL ON COLUMN IROJAS941.HSNOT (DESCRIPCION IS 'Descripcion');
LABEL ON COLUMN IROJAS941.HSNOT (VALOR_TEXTO IS 'Valor Texto');
LABEL ON COLUMN IROJAS941.HSNOT (VALOR_NUMERICO IS 'Valor Numerico');
LABEL ON COLUMN IROJAS941.HSNOT (VIGENCIA_DESDE IS 'Vigencia Desde');
LABEL ON COLUMN IROJAS941.HSNOT (VIGENCIA_HASTA IS 'Vigencia Hasta');
LABEL ON COLUMN IROJAS941.HSNOT (ORDEN_VISUALIZACION IS 'Orden Visualizacion');
LABEL ON COLUMN IROJAS941.HSNOT (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.HSNOT (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.HSNOT (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.HSNOT (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.HSNOT (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.HSNOT (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.HSNOT (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.HSNOT.CODIGO_BANCO IS 'PK (1/5). Codigo Banco de HSNOT.';
COMMENT ON COLUMN IROJAS941.HSNOT.FECHA_PROCESO IS 'PK (2/5). Fecha Proceso de HSNOT.';
COMMENT ON COLUMN IROJAS941.HSNOT.NUMERO_CUENTA IS 'PK (3/5). Numero Cuenta de HSNOT.';
COMMENT ON COLUMN IROJAS941.HSNOT.CODIGO_DE_NOTIFICACION IS 'PK (4/5). Codigo De Notificacion de HSNOT.';
COMMENT ON COLUMN IROJAS941.HSNOT.NIVEL IS 'PK (5/5). Nivel de HSNOT.';
COMMENT ON COLUMN IROJAS941.HSNOT.DESCRIPCION IS 'Descripcion de HSNOT.';
COMMENT ON COLUMN IROJAS941.HSNOT.VALOR_TEXTO IS 'Valor Texto de HSNOT.';
COMMENT ON COLUMN IROJAS941.HSNOT.VALOR_NUMERICO IS 'Valor Numerico de HSNOT.';
COMMENT ON COLUMN IROJAS941.HSNOT.VIGENCIA_DESDE IS 'Vigencia Desde de HSNOT.';
COMMENT ON COLUMN IROJAS941.HSNOT.VIGENCIA_HASTA IS 'Vigencia Hasta de HSNOT.';
COMMENT ON COLUMN IROJAS941.HSNOT.ORDEN_VISUALIZACION IS 'Orden Visualizacion de HSNOT.';
COMMENT ON COLUMN IROJAS941.HSNOT.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.HSNOT.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.HSNOT.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.HSNOT.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.HSNOT.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.HSNOT.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.HSNOT.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

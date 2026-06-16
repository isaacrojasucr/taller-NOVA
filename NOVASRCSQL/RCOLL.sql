--==============================================================================
-- Nombre de la Tabla   : RCOLL
-- DESCRIPCIÓN          : Relaciones entre Garantías
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 8 - Garantias) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Transaccional / Detalle
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de constitucion, avaluo y administracion de garantias asociadas a operaciones de credito.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.RCOLL (
  CODIGO_BANCO           FOR COLUMN CODBANCO   VARCHAR(20) NOT NULL,
  CUENTA_A_GARANTIZAR    FOR COLUMN CTAAGARA   VARCHAR(50) NOT NULL,
  CUENTA_QUE_GARANTIZA   FOR COLUMN CTAQUEGARA VARCHAR(50) NOT NULL,
  TIPO_GARANTIA          FOR COLUMN TIPOGAR    VARCHAR(20) NOT NULL,
  VALOR_GARANTIA         FOR COLUMN VALORGAR   DECIMAL(18 , 2) NOT NULL,
  FECHA_AVALUO           FOR COLUMN FCHAVAL    DATE NOT NULL,
  FECHA_VENCIMIENTO      FOR COLUMN FCHVENC    DATE NOT NULL,
  ESTADO_GARANTIA        FOR COLUMN ESTGAR     VARCHAR(20) NOT NULL,
  OBSERVACIONES          FOR COLUMN OBSERVAC   VARCHAR(120),
  USUARIO_CREACION       FOR COLUMN USRCREA    VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA   VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG    INTEGER       NOT NULL DEFAULT 1,
  ESTADO_REGISTRO        FOR COLUMN ESTREG     CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT  TIMESTAMP,
  CONSTRAINT RCOLL_PK PRIMARY KEY (CODIGO_BANCO, CUENTA_A_GARANTIZAR, CUENTA_QUE_GARANTIZA)
) RCDFMT RCOLLR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.RCOLL IS 'Relaciones Entre Garantias';

COMMENT ON TABLE IROJAS941.RCOLL IS 'Relaciones entre garantias, identificadas por codigo_banco, cuenta_a_garantizar y cuenta_que_garantiza.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.RCOLL (CODIGO_BANCO IS 'Codigo Banco');
LABEL ON COLUMN IROJAS941.RCOLL (CUENTA_A_GARANTIZAR IS 'Cuenta A Garantizar');
LABEL ON COLUMN IROJAS941.RCOLL (CUENTA_QUE_GARANTIZA IS 'Cuenta Que Garantiza');
LABEL ON COLUMN IROJAS941.RCOLL (TIPO_GARANTIA IS 'Tipo Garantia');
LABEL ON COLUMN IROJAS941.RCOLL (VALOR_GARANTIA IS 'Valor Garantia');
LABEL ON COLUMN IROJAS941.RCOLL (FECHA_AVALUO IS 'Fecha Avaluo');
LABEL ON COLUMN IROJAS941.RCOLL (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.RCOLL (ESTADO_GARANTIA IS 'Estado Garantia');
LABEL ON COLUMN IROJAS941.RCOLL (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.RCOLL (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.RCOLL (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.RCOLL (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.RCOLL (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.RCOLL (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.RCOLL (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.RCOLL.CODIGO_BANCO IS 'PK (1/3). Codigo Banco de RCOLL.';
COMMENT ON COLUMN IROJAS941.RCOLL.CUENTA_A_GARANTIZAR IS 'PK (2/3). Cuenta A Garantizar de RCOLL.';
COMMENT ON COLUMN IROJAS941.RCOLL.CUENTA_QUE_GARANTIZA IS 'PK (3/3). Cuenta Que Garantiza de RCOLL.';
COMMENT ON COLUMN IROJAS941.RCOLL.TIPO_GARANTIA IS 'Tipo Garantia de RCOLL.';
COMMENT ON COLUMN IROJAS941.RCOLL.VALOR_GARANTIA IS 'Valor Garantia de RCOLL.';
COMMENT ON COLUMN IROJAS941.RCOLL.FECHA_AVALUO IS 'Fecha Avaluo de RCOLL.';
COMMENT ON COLUMN IROJAS941.RCOLL.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de RCOLL.';
COMMENT ON COLUMN IROJAS941.RCOLL.ESTADO_GARANTIA IS 'Estado Garantia de RCOLL.';
COMMENT ON COLUMN IROJAS941.RCOLL.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.RCOLL.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.RCOLL.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.RCOLL.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.RCOLL.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.RCOLL.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.RCOLL.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

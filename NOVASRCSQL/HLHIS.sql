--==============================================================================
-- Nombre de la Tabla   : HLHIS
-- DESCRIPCIÓN          : Archivo histórico de Cambios en Retenciones.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 1 - Archivos Comunes) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Historico
-- Origen de los Datos  : Sistema transaccional (core bancario); registros consolidados desde el proceso operativo correspondiente.
-- Permanencia de Datos : Permanente (historico)
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.HLHIS (
  ID                     BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL,
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
  CONSTRAINT HLHIS_PK PRIMARY KEY (ID)
) RCDFMT HLHISR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.HLHIS IS 'Historico Cambios Retencion';

COMMENT ON TABLE IROJAS941.HLHIS IS 'Historico de cambios aplicados sobre retenciones. La tabla no define una clave natural en estructura_bd.md, por lo que utiliza la columna ID como llave primaria tecnica (surrogate key).';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.HLHIS (ID IS 'Id');
LABEL ON COLUMN IROJAS941.HLHIS (DESCRIPCION IS 'Descripcion');
LABEL ON COLUMN IROJAS941.HLHIS (VALOR_TEXTO IS 'Valor Texto');
LABEL ON COLUMN IROJAS941.HLHIS (VALOR_NUMERICO IS 'Valor Numerico');
LABEL ON COLUMN IROJAS941.HLHIS (VIGENCIA_DESDE IS 'Vigencia Desde');
LABEL ON COLUMN IROJAS941.HLHIS (VIGENCIA_HASTA IS 'Vigencia Hasta');
LABEL ON COLUMN IROJAS941.HLHIS (ORDEN_VISUALIZACION IS 'Orden Visualizacion');
LABEL ON COLUMN IROJAS941.HLHIS (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.HLHIS (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.HLHIS (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.HLHIS (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.HLHIS (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.HLHIS (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.HLHIS (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.HLHIS.ID IS 'PK (1/1). Id de HLHIS.';
COMMENT ON COLUMN IROJAS941.HLHIS.DESCRIPCION IS 'Descripcion de HLHIS.';
COMMENT ON COLUMN IROJAS941.HLHIS.VALOR_TEXTO IS 'Valor Texto de HLHIS.';
COMMENT ON COLUMN IROJAS941.HLHIS.VALOR_NUMERICO IS 'Valor Numerico de HLHIS.';
COMMENT ON COLUMN IROJAS941.HLHIS.VIGENCIA_DESDE IS 'Vigencia Desde de HLHIS.';
COMMENT ON COLUMN IROJAS941.HLHIS.VIGENCIA_HASTA IS 'Vigencia Hasta de HLHIS.';
COMMENT ON COLUMN IROJAS941.HLHIS.ORDEN_VISUALIZACION IS 'Orden Visualizacion de HLHIS.';
COMMENT ON COLUMN IROJAS941.HLHIS.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.HLHIS.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.HLHIS.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.HLHIS.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.HLHIS.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.HLHIS.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.HLHIS.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

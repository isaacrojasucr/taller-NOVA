--==============================================================================
-- Nombre de la Tabla   : FIXMS
-- DESCRIPCIÓN          : Maestro de Activos Fijos
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 10 - Activos Fijos) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Maestro
-- Origen de los Datos  : Mantenimiento administrativo del area de Activos Fijos / Contabilidad, generado por procesos de adquisicion, depreciacion y control de activos fijos del banco.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.FIXMS (
  NUMERO_ACTIVO          FOR COLUMN NUMACT     VARCHAR(30) NOT NULL,
  DESCRIPCION            FOR COLUMN DESCRIP    VARCHAR(120) NOT NULL,
  FECHA_ADQUISICION      FOR COLUMN FCHADQU    DATE NOT NULL,
  VALOR_ADQUISICION      FOR COLUMN VALORADQU  DECIMAL(18 , 2) NOT NULL,
  VIDA_UTIL_MESES        FOR COLUMN VIDUTIMES  INTEGER NOT NULL,
  DEPRECIACION_ACUMULADA FOR COLUMN DEPRACUM   DECIMAL(18 , 2) NOT NULL,
  ESTADO_ACTIVO          FOR COLUMN ESTACT     VARCHAR(20) NOT NULL,
  USUARIO_CREACION       FOR COLUMN USRCREA    VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA   VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG    INTEGER       NOT NULL DEFAULT 1,
  OBSERVACIONES          FOR COLUMN OBSERVAC   VARCHAR(120),
  ESTADO_REGISTRO        FOR COLUMN ESTREG     CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT  TIMESTAMP,
  CONSTRAINT FIXMS_PK PRIMARY KEY (NUMERO_ACTIVO)
) RCDFMT FIXMSR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.FIXMS IS 'Maestro de Activos Fijos';

COMMENT ON TABLE IROJAS941.FIXMS IS 'Maestro de activos fijos del banco, identificado por numero_activo.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.FIXMS (NUMERO_ACTIVO IS 'Numero Activo');
LABEL ON COLUMN IROJAS941.FIXMS (DESCRIPCION IS 'Descripcion');
LABEL ON COLUMN IROJAS941.FIXMS (FECHA_ADQUISICION IS 'Fecha Adquisicion');
LABEL ON COLUMN IROJAS941.FIXMS (VALOR_ADQUISICION IS 'Valor Adquisicion');
LABEL ON COLUMN IROJAS941.FIXMS (VIDA_UTIL_MESES IS 'Vida Util Meses');
LABEL ON COLUMN IROJAS941.FIXMS (DEPRECIACION_ACUMULADA IS 'Depreciacion Acumulada');
LABEL ON COLUMN IROJAS941.FIXMS (ESTADO_ACTIVO IS 'Estado Activo');
LABEL ON COLUMN IROJAS941.FIXMS (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.FIXMS (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.FIXMS (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.FIXMS (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.FIXMS (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.FIXMS (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.FIXMS (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.FIXMS.NUMERO_ACTIVO IS 'PK (1/1). Numero Activo de FIXMS.';
COMMENT ON COLUMN IROJAS941.FIXMS.DESCRIPCION IS 'Descripcion de FIXMS.';
COMMENT ON COLUMN IROJAS941.FIXMS.FECHA_ADQUISICION IS 'Fecha Adquisicion de FIXMS.';
COMMENT ON COLUMN IROJAS941.FIXMS.VALOR_ADQUISICION IS 'Valor Adquisicion de FIXMS.';
COMMENT ON COLUMN IROJAS941.FIXMS.VIDA_UTIL_MESES IS 'Vida Util Meses de FIXMS.';
COMMENT ON COLUMN IROJAS941.FIXMS.DEPRECIACION_ACUMULADA IS 'Depreciacion Acumulada de FIXMS.';
COMMENT ON COLUMN IROJAS941.FIXMS.ESTADO_ACTIVO IS 'Estado Activo de FIXMS.';
COMMENT ON COLUMN IROJAS941.FIXMS.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.FIXMS.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.FIXMS.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.FIXMS.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.FIXMS.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.FIXMS.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.FIXMS.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

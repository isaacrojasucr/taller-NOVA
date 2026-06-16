--==============================================================================
-- Nombre de la Tabla   : DPDTL
-- DESCRIPCIÓN          : Detalle de la Declaración Patrimonial de Personas Naturales.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 13 - Propuesta de Credito) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Transaccional / Detalle
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por el area de analisis y riesgo de credito durante el proceso de evaluacion y aprobacion de propuestas de credito.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.DPDTL (
  ID_CLIENTE             FOR COLUMN IDCLI      VARCHAR(30) NOT NULL,
  SECUENCIA              INTEGER NOT NULL,
  TIPO_REGISTRO          FOR COLUMN TIPOREG    VARCHAR(20) NOT NULL,
  FECHA_PROPUESTA        FOR COLUMN FCHPROP    DATE NOT NULL,
  MONTO_SOLICITADO       FOR COLUMN MONTOSOLI  DECIMAL(18 , 2) NOT NULL,
  PLAZO_MESES            FOR COLUMN PLAZOMESE  INTEGER NOT NULL,
  TASA_PROPUESTA         FOR COLUMN TASAPROP   DECIMAL(18 , 2) NOT NULL,
  DICTAMEN_CREDITO       FOR COLUMN DICTCRED   VARCHAR(120) NOT NULL,
  ESTADO_PROPUESTA       FOR COLUMN ESTPROP    VARCHAR(20) NOT NULL,
  USUARIO_CREACION       FOR COLUMN USRCREA    VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA   VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG    INTEGER       NOT NULL DEFAULT 1,
  OBSERVACIONES          FOR COLUMN OBSERVAC   VARCHAR(120),
  ESTADO_REGISTRO        FOR COLUMN ESTREG     CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT  TIMESTAMP,
  CONSTRAINT DPDTL_PK PRIMARY KEY (ID_CLIENTE, SECUENCIA, TIPO_REGISTRO)
) RCDFMT DPDTLR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.DPDTL IS 'Detalle Declaracion Patrimonial PN';

COMMENT ON TABLE IROJAS941.DPDTL IS 'Detalle de declaracion patrimonial de personas naturales, identificado por id_cliente, secuencia y tipo_registro.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.DPDTL (ID_CLIENTE IS 'Id Cliente');
LABEL ON COLUMN IROJAS941.DPDTL (SECUENCIA IS 'Secuencia');
LABEL ON COLUMN IROJAS941.DPDTL (TIPO_REGISTRO IS 'Tipo Registro');
LABEL ON COLUMN IROJAS941.DPDTL (FECHA_PROPUESTA IS 'Fecha Propuesta');
LABEL ON COLUMN IROJAS941.DPDTL (MONTO_SOLICITADO IS 'Monto Solicitado');
LABEL ON COLUMN IROJAS941.DPDTL (PLAZO_MESES IS 'Plazo Meses');
LABEL ON COLUMN IROJAS941.DPDTL (TASA_PROPUESTA IS 'Tasa Propuesta');
LABEL ON COLUMN IROJAS941.DPDTL (DICTAMEN_CREDITO IS 'Dictamen Credito');
LABEL ON COLUMN IROJAS941.DPDTL (ESTADO_PROPUESTA IS 'Estado Propuesta');
LABEL ON COLUMN IROJAS941.DPDTL (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.DPDTL (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.DPDTL (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.DPDTL (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.DPDTL (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.DPDTL (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.DPDTL (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.DPDTL.ID_CLIENTE IS 'PK (1/3). Id Cliente de DPDTL. Referencia conceptual a DPMST.id_cliente (segun estructura_bd.md).';
COMMENT ON COLUMN IROJAS941.DPDTL.SECUENCIA IS 'PK (2/3). Secuencia de DPDTL.';
COMMENT ON COLUMN IROJAS941.DPDTL.TIPO_REGISTRO IS 'PK (3/3). Tipo Registro de DPDTL.';
COMMENT ON COLUMN IROJAS941.DPDTL.FECHA_PROPUESTA IS 'Fecha Propuesta de DPDTL.';
COMMENT ON COLUMN IROJAS941.DPDTL.MONTO_SOLICITADO IS 'Monto Solicitado de DPDTL.';
COMMENT ON COLUMN IROJAS941.DPDTL.PLAZO_MESES IS 'Plazo Meses de DPDTL.';
COMMENT ON COLUMN IROJAS941.DPDTL.TASA_PROPUESTA IS 'Tasa Propuesta de DPDTL.';
COMMENT ON COLUMN IROJAS941.DPDTL.DICTAMEN_CREDITO IS 'Dictamen Credito de DPDTL.';
COMMENT ON COLUMN IROJAS941.DPDTL.ESTADO_PROPUESTA IS 'Estado Propuesta de DPDTL.';
COMMENT ON COLUMN IROJAS941.DPDTL.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.DPDTL.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.DPDTL.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.DPDTL.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.DPDTL.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.DPDTL.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.DPDTL.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

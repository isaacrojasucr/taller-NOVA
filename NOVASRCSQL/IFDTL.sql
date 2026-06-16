--==============================================================================
-- Nombre de la Tabla   : IFDTL
-- DESCRIPCIÓN          : Detalle de Declaración Patrimonial de Personas Jurídicas.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 13 - Propuesta de Credito) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Transaccional / Detalle
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por el area de analisis y riesgo de credito durante el proceso de evaluacion y aprobacion de propuestas de credito.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.IFDTL (
  ID_CLIENTE             FOR COLUMN IDCLI      VARCHAR(30) NOT NULL,
  ANIO                   INTEGER NOT NULL,
  MES                    INTEGER NOT NULL,
  FORMATO_BALANCE        FOR COLUMN FMTBAL     VARCHAR(50) NOT NULL,
  CODIGO_LINEA           FOR COLUMN CODLIN     VARCHAR(20) NOT NULL,
  CODIGO_CUENTA          FOR COLUMN CODCTA     VARCHAR(20) NOT NULL,
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
  CONSTRAINT IFDTL_PK PRIMARY KEY (ID_CLIENTE, ANIO, MES, FORMATO_BALANCE, CODIGO_LINEA, CODIGO_CUENTA)
) RCDFMT IFDTLR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.IFDTL IS 'Detalle Declaracion Patrimonial PJ';

COMMENT ON TABLE IROJAS941.IFDTL IS 'Detalle de declaracion patrimonial de personas juridicas, identificado por id_cliente, anio, mes, formato_balance, codigo_linea y codigo_cuenta.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.IFDTL (ID_CLIENTE IS 'Id Cliente');
LABEL ON COLUMN IROJAS941.IFDTL (ANIO IS 'Anio');
LABEL ON COLUMN IROJAS941.IFDTL (MES IS 'Mes');
LABEL ON COLUMN IROJAS941.IFDTL (FORMATO_BALANCE IS 'Formato Balance');
LABEL ON COLUMN IROJAS941.IFDTL (CODIGO_LINEA IS 'Codigo Linea');
LABEL ON COLUMN IROJAS941.IFDTL (CODIGO_CUENTA IS 'Codigo Cuenta');
LABEL ON COLUMN IROJAS941.IFDTL (FECHA_PROPUESTA IS 'Fecha Propuesta');
LABEL ON COLUMN IROJAS941.IFDTL (MONTO_SOLICITADO IS 'Monto Solicitado');
LABEL ON COLUMN IROJAS941.IFDTL (PLAZO_MESES IS 'Plazo Meses');
LABEL ON COLUMN IROJAS941.IFDTL (TASA_PROPUESTA IS 'Tasa Propuesta');
LABEL ON COLUMN IROJAS941.IFDTL (DICTAMEN_CREDITO IS 'Dictamen Credito');
LABEL ON COLUMN IROJAS941.IFDTL (ESTADO_PROPUESTA IS 'Estado Propuesta');
LABEL ON COLUMN IROJAS941.IFDTL (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.IFDTL (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.IFDTL (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.IFDTL (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.IFDTL (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.IFDTL (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.IFDTL (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.IFDTL.ID_CLIENTE IS 'PK (1/6). Id Cliente de IFDTL. Referencia conceptual a IFMST.id_cliente (segun estructura_bd.md).';
COMMENT ON COLUMN IROJAS941.IFDTL.ANIO IS 'PK (2/6). Anio de IFDTL.';
COMMENT ON COLUMN IROJAS941.IFDTL.MES IS 'PK (3/6). Mes de IFDTL.';
COMMENT ON COLUMN IROJAS941.IFDTL.FORMATO_BALANCE IS 'PK (4/6). Formato Balance de IFDTL.';
COMMENT ON COLUMN IROJAS941.IFDTL.CODIGO_LINEA IS 'PK (5/6). Codigo Linea de IFDTL.';
COMMENT ON COLUMN IROJAS941.IFDTL.CODIGO_CUENTA IS 'PK (6/6). Codigo Cuenta de IFDTL.';
COMMENT ON COLUMN IROJAS941.IFDTL.FECHA_PROPUESTA IS 'Fecha Propuesta de IFDTL.';
COMMENT ON COLUMN IROJAS941.IFDTL.MONTO_SOLICITADO IS 'Monto Solicitado de IFDTL.';
COMMENT ON COLUMN IROJAS941.IFDTL.PLAZO_MESES IS 'Plazo Meses de IFDTL.';
COMMENT ON COLUMN IROJAS941.IFDTL.TASA_PROPUESTA IS 'Tasa Propuesta de IFDTL.';
COMMENT ON COLUMN IROJAS941.IFDTL.DICTAMEN_CREDITO IS 'Dictamen Credito de IFDTL.';
COMMENT ON COLUMN IROJAS941.IFDTL.ESTADO_PROPUESTA IS 'Estado Propuesta de IFDTL.';
COMMENT ON COLUMN IROJAS941.IFDTL.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.IFDTL.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.IFDTL.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.IFDTL.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.IFDTL.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.IFDTL.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.IFDTL.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

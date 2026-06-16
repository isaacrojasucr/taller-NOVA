--==============================================================================
-- Nombre de la Tabla   : DIMST
-- DESCRIPCIÓN          : Maestro de Inventario de Documentos
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 14 - Manejo de Documentos) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Maestro
-- Origen de los Datos  : Mantenimiento administrativo / operativo, generado por los procesos de gestion documental asociados a cuentas y expedientes de clientes (catalogacion y control de recepcion de documentos).
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.DIMST (
  TIPO_CUENTA            FOR COLUMN TIPOCTA    VARCHAR(20) NOT NULL,
  NUMERO_TABLA           FOR COLUMN NUMTBL     VARCHAR(30) NOT NULL,
  SECUENCIA              INTEGER NOT NULL,
  TIPO_DOCUMENTO         FOR COLUMN TIPODOC    VARCHAR(20) NOT NULL,
  DESCRIPCION_DOCUMENTO  FOR COLUMN DESCDOC    VARCHAR(120) NOT NULL,
  OBLIGATORIO            FOR COLUMN OBLIGAT    BOOLEAN NOT NULL,
  FECHA_RECEPCION        FOR COLUMN FCHRECE    DATE NOT NULL,
  FECHA_VENCIMIENTO      FOR COLUMN FCHVENC    DATE NOT NULL,
  OBSERVACIONES          FOR COLUMN OBSERVAC   VARCHAR(120),
  USUARIO_CREACION       FOR COLUMN USRCREA    VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA   VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG    INTEGER       NOT NULL DEFAULT 1,
  ESTADO_REGISTRO        FOR COLUMN ESTREG     CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT  TIMESTAMP,
  CONSTRAINT DIMST_PK PRIMARY KEY (TIPO_CUENTA, NUMERO_TABLA, SECUENCIA)
) RCDFMT DIMSTR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.DIMST IS 'Maestro de Inventario de Documentos';

COMMENT ON TABLE IROJAS941.DIMST IS 'Inventario de documentos por cuenta, identificado por tipo_cuenta, numero_tabla y secuencia.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.DIMST (TIPO_CUENTA IS 'Tipo Cuenta');
LABEL ON COLUMN IROJAS941.DIMST (NUMERO_TABLA IS 'Numero Tabla');
LABEL ON COLUMN IROJAS941.DIMST (SECUENCIA IS 'Secuencia');
LABEL ON COLUMN IROJAS941.DIMST (TIPO_DOCUMENTO IS 'Tipo Documento');
LABEL ON COLUMN IROJAS941.DIMST (DESCRIPCION_DOCUMENTO IS 'Descripcion Documento');
LABEL ON COLUMN IROJAS941.DIMST (OBLIGATORIO IS 'Obligatorio');
LABEL ON COLUMN IROJAS941.DIMST (FECHA_RECEPCION IS 'Fecha Recepcion');
LABEL ON COLUMN IROJAS941.DIMST (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.DIMST (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.DIMST (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.DIMST (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.DIMST (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.DIMST (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.DIMST (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.DIMST (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.DIMST.TIPO_CUENTA IS 'PK (1/3). Tipo Cuenta de DIMST.';
COMMENT ON COLUMN IROJAS941.DIMST.NUMERO_TABLA IS 'PK (2/3). Numero Tabla de DIMST. Referencia conceptual a DITBL.numero_tabla (segun estructura_bd.md).';
COMMENT ON COLUMN IROJAS941.DIMST.SECUENCIA IS 'PK (3/3). Secuencia de DIMST.';
COMMENT ON COLUMN IROJAS941.DIMST.TIPO_DOCUMENTO IS 'Tipo Documento de DIMST.';
COMMENT ON COLUMN IROJAS941.DIMST.DESCRIPCION_DOCUMENTO IS 'Descripcion Documento de DIMST.';
COMMENT ON COLUMN IROJAS941.DIMST.OBLIGATORIO IS 'Obligatorio de DIMST.';
COMMENT ON COLUMN IROJAS941.DIMST.FECHA_RECEPCION IS 'Fecha Recepcion de DIMST.';
COMMENT ON COLUMN IROJAS941.DIMST.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de DIMST.';
COMMENT ON COLUMN IROJAS941.DIMST.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.DIMST.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.DIMST.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.DIMST.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.DIMST.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.DIMST.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.DIMST.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

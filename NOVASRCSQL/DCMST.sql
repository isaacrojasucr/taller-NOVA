--==============================================================================
-- Nombre de la Tabla   : DCMST
-- DESCRIPCIÓN          : Maestro de Cobranzas Documentarias.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 6 - Cobranzas) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Maestro
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de comercio exterior: emision, negociacion y liquidacion de cartas de credito y cobranzas documentarias.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.DCMST (
  ID                     BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL,
  FECHA_RECEPCION        FOR COLUMN FCHRECE    DATE NOT NULL,
  FECHA_VENCIMIENTO      FOR COLUMN FCHVENC    DATE NOT NULL,
  MONTO_ORIGINAL         FOR COLUMN MONTOORIG  DECIMAL(18 , 2) NOT NULL,
  SALDO_PENDIENTE        FOR COLUMN SALDOPEND  DECIMAL(18 , 2) NOT NULL,
  TIPO_DOCUMENTO         FOR COLUMN TIPODOC    VARCHAR(20) NOT NULL,
  ESTADO_OPERACION       FOR COLUMN ESTOPER    VARCHAR(20) NOT NULL,
  USUARIO_CREACION       FOR COLUMN USRCREA    VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA   VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG    INTEGER       NOT NULL DEFAULT 1,
  OBSERVACIONES          FOR COLUMN OBSERVAC   VARCHAR(120),
  ESTADO_REGISTRO        FOR COLUMN ESTREG     CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT  TIMESTAMP,
  CONSTRAINT DCMST_PK PRIMARY KEY (ID)
) RCDFMT DCMSTR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.DCMST IS 'Maestro Cobranzas Documentarias';

COMMENT ON TABLE IROJAS941.DCMST IS 'Maestro de cobranzas documentarias. La tabla no define una clave natural en estructura_bd.md, por lo que utiliza la columna ID como llave primaria tecnica (surrogate key).';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.DCMST (ID IS 'Id');
LABEL ON COLUMN IROJAS941.DCMST (FECHA_RECEPCION IS 'Fecha Recepcion');
LABEL ON COLUMN IROJAS941.DCMST (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.DCMST (MONTO_ORIGINAL IS 'Monto Original');
LABEL ON COLUMN IROJAS941.DCMST (SALDO_PENDIENTE IS 'Saldo Pendiente');
LABEL ON COLUMN IROJAS941.DCMST (TIPO_DOCUMENTO IS 'Tipo Documento');
LABEL ON COLUMN IROJAS941.DCMST (ESTADO_OPERACION IS 'Estado Operacion');
LABEL ON COLUMN IROJAS941.DCMST (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.DCMST (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.DCMST (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.DCMST (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.DCMST (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.DCMST (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.DCMST (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.DCMST.ID IS 'PK (1/1). Id de DCMST.';
COMMENT ON COLUMN IROJAS941.DCMST.FECHA_RECEPCION IS 'Fecha Recepcion de DCMST.';
COMMENT ON COLUMN IROJAS941.DCMST.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de DCMST.';
COMMENT ON COLUMN IROJAS941.DCMST.MONTO_ORIGINAL IS 'Monto Original de DCMST.';
COMMENT ON COLUMN IROJAS941.DCMST.SALDO_PENDIENTE IS 'Saldo Pendiente de DCMST.';
COMMENT ON COLUMN IROJAS941.DCMST.TIPO_DOCUMENTO IS 'Tipo Documento de DCMST.';
COMMENT ON COLUMN IROJAS941.DCMST.ESTADO_OPERACION IS 'Estado Operacion de DCMST.';
COMMENT ON COLUMN IROJAS941.DCMST.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.DCMST.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.DCMST.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.DCMST.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.DCMST.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.DCMST.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.DCMST.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

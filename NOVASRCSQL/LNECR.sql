--==============================================================================
-- Nombre de la Tabla   : LNECR
-- DESCRIPCIÓN          : Maestro de Lineas de Crédito
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 9 - Lineas de Credito) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Maestro
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de otorgamiento y administracion de lineas de credito a clientes.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.LNECR (
  ID_CLIENTE             FOR COLUMN IDCLI      VARCHAR(30) NOT NULL,
  NUMERO_LINEA           FOR COLUMN NUMLIN     VARCHAR(30) NOT NULL,
  FECHA_APROBACION       FOR COLUMN FCHAPRO    DATE NOT NULL,
  FECHA_VENCIMIENTO      FOR COLUMN FCHVENC    DATE NOT NULL,
  MONTO_APROBADO         FOR COLUMN MONTOAPRO  DECIMAL(18 , 2) NOT NULL,
  MONTO_UTILIZADO        FOR COLUMN MONTOUTIL  DECIMAL(18 , 2) NOT NULL,
  MONTO_DISPONIBLE       FOR COLUMN MONTODISP  DECIMAL(18 , 2) NOT NULL,
  ESTADO_LINEA           FOR COLUMN ESTLIN     VARCHAR(20) NOT NULL,
  USUARIO_CREACION       FOR COLUMN USRCREA    VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA   VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG    INTEGER       NOT NULL DEFAULT 1,
  OBSERVACIONES          FOR COLUMN OBSERVAC   VARCHAR(120),
  ESTADO_REGISTRO        FOR COLUMN ESTREG     CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT  TIMESTAMP,
  CONSTRAINT LNECR_PK PRIMARY KEY (ID_CLIENTE, NUMERO_LINEA),
  CONSTRAINT LNECR_FK_CUMST FOREIGN KEY (ID_CLIENTE)
    REFERENCES IROJAS941.CUMST (ID_CLIENTE)
) RCDFMT LNECRR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.LNECR IS 'Maestro Lineas de Credito';

COMMENT ON TABLE IROJAS941.LNECR IS 'Maestro de lineas de credito, identificado por id_cliente y numero_linea. FK hacia CUMST.id_cliente.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.LNECR (ID_CLIENTE IS 'Id Cliente');
LABEL ON COLUMN IROJAS941.LNECR (NUMERO_LINEA IS 'Numero Linea');
LABEL ON COLUMN IROJAS941.LNECR (FECHA_APROBACION IS 'Fecha Aprobacion');
LABEL ON COLUMN IROJAS941.LNECR (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.LNECR (MONTO_APROBADO IS 'Monto Aprobado');
LABEL ON COLUMN IROJAS941.LNECR (MONTO_UTILIZADO IS 'Monto Utilizado');
LABEL ON COLUMN IROJAS941.LNECR (MONTO_DISPONIBLE IS 'Monto Disponible');
LABEL ON COLUMN IROJAS941.LNECR (ESTADO_LINEA IS 'Estado Linea');
LABEL ON COLUMN IROJAS941.LNECR (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.LNECR (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.LNECR (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.LNECR (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.LNECR (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.LNECR (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.LNECR (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.LNECR.ID_CLIENTE IS 'PK (1/2). Id Cliente de LNECR. Referencia conceptual a CUMST.id_cliente (segun estructura_bd.md).';
COMMENT ON COLUMN IROJAS941.LNECR.NUMERO_LINEA IS 'PK (2/2). Numero Linea de LNECR.';
COMMENT ON COLUMN IROJAS941.LNECR.FECHA_APROBACION IS 'Fecha Aprobacion de LNECR.';
COMMENT ON COLUMN IROJAS941.LNECR.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de LNECR.';
COMMENT ON COLUMN IROJAS941.LNECR.MONTO_APROBADO IS 'Monto Aprobado de LNECR.';
COMMENT ON COLUMN IROJAS941.LNECR.MONTO_UTILIZADO IS 'Monto Utilizado de LNECR.';
COMMENT ON COLUMN IROJAS941.LNECR.MONTO_DISPONIBLE IS 'Monto Disponible de LNECR.';
COMMENT ON COLUMN IROJAS941.LNECR.ESTADO_LINEA IS 'Estado Linea de LNECR.';
COMMENT ON COLUMN IROJAS941.LNECR.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.LNECR.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.LNECR.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.LNECR.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.LNECR.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.LNECR.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.LNECR.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

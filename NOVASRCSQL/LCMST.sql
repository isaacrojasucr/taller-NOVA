--==============================================================================
-- Nombre de la Tabla   : LCMST
-- DESCRIPCIÓN          : Maestro de Cartas de Crédito.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 5 - Cartas de Credito) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Maestro
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de comercio exterior: emision, negociacion y liquidacion de cartas de credito y cobranzas documentarias.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.LCMST (
  ID                     BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL,
  FECHA_EMISION          FOR COLUMN FCHEMIS    DATE NOT NULL,
  FECHA_VENCIMIENTO      FOR COLUMN FCHVENC    DATE NOT NULL,
  MONTO_ORIGINAL         FOR COLUMN MONTOORIG  DECIMAL(18 , 2) NOT NULL,
  SALDO_ACTUAL           FOR COLUMN SALDOACT   DECIMAL(18 , 2) NOT NULL,
  BANCO_CORRESPONSAL     FOR COLUMN BANCOCORR  VARCHAR(80) NOT NULL,
  PAIS_DESTINO           FOR COLUMN PAISDEST   VARCHAR(80) NOT NULL,
  ESTADO_CARTA           FOR COLUMN ESTCARTA   VARCHAR(20) NOT NULL,
  USUARIO_CREACION       FOR COLUMN USRCREA    VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA   VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG    INTEGER       NOT NULL DEFAULT 1,
  OBSERVACIONES          FOR COLUMN OBSERVAC   VARCHAR(120),
  ESTADO_REGISTRO        FOR COLUMN ESTREG     CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT  TIMESTAMP,
  CONSTRAINT LCMST_PK PRIMARY KEY (ID)
) RCDFMT LCMSTR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.LCMST IS 'Maestro Cartas de Credito';

COMMENT ON TABLE IROJAS941.LCMST IS 'Maestro de cartas de credito del banco. La tabla no define una clave natural en estructura_bd.md, por lo que utiliza la columna ID como llave primaria tecnica (surrogate key). Es referenciada conceptualmente desde otras tablas del modulo (LCDOC, LCADM, LCCOV, LCDIN) y del modulo de cobranzas (APPRV, LCFEE) a traves de numero_carta_credito, sin FK declarada por no existir dicha columna en LCMST.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.LCMST (ID IS 'Id');
LABEL ON COLUMN IROJAS941.LCMST (FECHA_EMISION IS 'Fecha Emision');
LABEL ON COLUMN IROJAS941.LCMST (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.LCMST (MONTO_ORIGINAL IS 'Monto Original');
LABEL ON COLUMN IROJAS941.LCMST (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.LCMST (BANCO_CORRESPONSAL IS 'Banco Corresponsal');
LABEL ON COLUMN IROJAS941.LCMST (PAIS_DESTINO IS 'Pais Destino');
LABEL ON COLUMN IROJAS941.LCMST (ESTADO_CARTA IS 'Estado Carta');
LABEL ON COLUMN IROJAS941.LCMST (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.LCMST (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.LCMST (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.LCMST (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.LCMST (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.LCMST (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.LCMST (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.LCMST.ID IS 'PK (1/1). Id de LCMST.';
COMMENT ON COLUMN IROJAS941.LCMST.FECHA_EMISION IS 'Fecha Emision de LCMST.';
COMMENT ON COLUMN IROJAS941.LCMST.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de LCMST.';
COMMENT ON COLUMN IROJAS941.LCMST.MONTO_ORIGINAL IS 'Monto Original de LCMST.';
COMMENT ON COLUMN IROJAS941.LCMST.SALDO_ACTUAL IS 'Saldo Actual de LCMST.';
COMMENT ON COLUMN IROJAS941.LCMST.BANCO_CORRESPONSAL IS 'Banco Corresponsal de LCMST.';
COMMENT ON COLUMN IROJAS941.LCMST.PAIS_DESTINO IS 'Pais Destino de LCMST.';
COMMENT ON COLUMN IROJAS941.LCMST.ESTADO_CARTA IS 'Estado Carta de LCMST.';
COMMENT ON COLUMN IROJAS941.LCMST.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.LCMST.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.LCMST.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.LCMST.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.LCMST.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.LCMST.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.LCMST.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

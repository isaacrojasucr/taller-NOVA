--==============================================================================
-- Nombre de la Tabla   : LCSTA
-- DESCRIPCIÓN          : Estadística de Aperturas, Enmiendas, Pagos en Cartas de Crédito
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 5 - Cartas de Credito) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Transaccional / Estadistica
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de comercio exterior: emision, negociacion y liquidacion de cartas de credito y cobranzas documentarias.
-- Permanencia de Datos : Permanente (historico)
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.LCSTA (
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
  CONSTRAINT LCSTA_PK PRIMARY KEY (ID)
) RCDFMT LCSTAR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.LCSTA IS 'Estadistica Cartas de Credito';

COMMENT ON TABLE IROJAS941.LCSTA IS 'Estadistica de aperturas, enmiendas y pagos de cartas de credito. La tabla no define una clave natural en estructura_bd.md, por lo que utiliza la columna ID como llave primaria tecnica (surrogate key).';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.LCSTA (ID IS 'Id');
LABEL ON COLUMN IROJAS941.LCSTA (FECHA_EMISION IS 'Fecha Emision');
LABEL ON COLUMN IROJAS941.LCSTA (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.LCSTA (MONTO_ORIGINAL IS 'Monto Original');
LABEL ON COLUMN IROJAS941.LCSTA (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.LCSTA (BANCO_CORRESPONSAL IS 'Banco Corresponsal');
LABEL ON COLUMN IROJAS941.LCSTA (PAIS_DESTINO IS 'Pais Destino');
LABEL ON COLUMN IROJAS941.LCSTA (ESTADO_CARTA IS 'Estado Carta');
LABEL ON COLUMN IROJAS941.LCSTA (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.LCSTA (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.LCSTA (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.LCSTA (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.LCSTA (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.LCSTA (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.LCSTA (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.LCSTA.ID IS 'PK (1/1). Id de LCSTA.';
COMMENT ON COLUMN IROJAS941.LCSTA.FECHA_EMISION IS 'Fecha Emision de LCSTA.';
COMMENT ON COLUMN IROJAS941.LCSTA.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de LCSTA.';
COMMENT ON COLUMN IROJAS941.LCSTA.MONTO_ORIGINAL IS 'Monto Original de LCSTA.';
COMMENT ON COLUMN IROJAS941.LCSTA.SALDO_ACTUAL IS 'Saldo Actual de LCSTA.';
COMMENT ON COLUMN IROJAS941.LCSTA.BANCO_CORRESPONSAL IS 'Banco Corresponsal de LCSTA.';
COMMENT ON COLUMN IROJAS941.LCSTA.PAIS_DESTINO IS 'Pais Destino de LCSTA.';
COMMENT ON COLUMN IROJAS941.LCSTA.ESTADO_CARTA IS 'Estado Carta de LCSTA.';
COMMENT ON COLUMN IROJAS941.LCSTA.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.LCSTA.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.LCSTA.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.LCSTA.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.LCSTA.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.LCSTA.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.LCSTA.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

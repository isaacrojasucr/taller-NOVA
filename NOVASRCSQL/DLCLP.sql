--==============================================================================
-- Nombre de la Tabla   : DLCLP
-- DESCRIPCIÓN          : Calificación y Previsión de Cartera.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 4 - Contratos/Certificados/Giros/Valores al Cobro) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Transaccional / Detalle
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de otorgamiento y administracion de prestamos, certificados, giros y valores al cobro.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.DLCLP (
  ID_CLIENTE             FOR COLUMN IDCLI      VARCHAR(30) NOT NULL,
  NUMERO_CUENTA          FOR COLUMN NUMCTA     VARCHAR(24) NOT NULL,
  REFERENCIA             VARCHAR(50) NOT NULL,
  FECHA_DESEMBOLSO       FOR COLUMN FCHDESE    DATE NOT NULL,
  FECHA_VENCIMIENTO      FOR COLUMN FCHVENC    DATE NOT NULL,
  MONTO_ORIGINAL         FOR COLUMN MONTOORIG  DECIMAL(18 , 2) NOT NULL,
  SALDO_ACTUAL           FOR COLUMN SALDOACT   DECIMAL(18 , 2) NOT NULL,
  TASA_INTERES           FOR COLUMN TASAINT    DECIMAL(18 , 2) NOT NULL,
  PLAZO_MESES            FOR COLUMN PLAZOMESE  INTEGER NOT NULL,
  DIAS_MORA              FOR COLUMN DIASMORA   INTEGER NOT NULL,
  ESTADO_OPERACION       FOR COLUMN ESTOPER    VARCHAR(20) NOT NULL,
  USUARIO_CREACION       FOR COLUMN USRCREA    VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA   VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG    INTEGER       NOT NULL DEFAULT 1,
  OBSERVACIONES          FOR COLUMN OBSERVAC   VARCHAR(120),
  ESTADO_REGISTRO        FOR COLUMN ESTREG     CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT  TIMESTAMP,
  CONSTRAINT DLCLP_PK PRIMARY KEY (ID_CLIENTE, NUMERO_CUENTA, REFERENCIA),
  CONSTRAINT DLCLP_FK_CUMST FOREIGN KEY (ID_CLIENTE)
    REFERENCES IROJAS941.CUMST (ID_CLIENTE)
) RCDFMT DLCLPR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.DLCLP IS 'Calificacion y Prevision Cartera';

COMMENT ON TABLE IROJAS941.DLCLP IS 'Calificacion y prevision de cartera por cliente, identificada por id_cliente, numero_cuenta y referencia. FK hacia CUMST.id_cliente.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.DLCLP (ID_CLIENTE IS 'Id Cliente');
LABEL ON COLUMN IROJAS941.DLCLP (NUMERO_CUENTA IS 'Numero Cuenta');
LABEL ON COLUMN IROJAS941.DLCLP (REFERENCIA IS 'Referencia');
LABEL ON COLUMN IROJAS941.DLCLP (FECHA_DESEMBOLSO IS 'Fecha Desembolso');
LABEL ON COLUMN IROJAS941.DLCLP (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.DLCLP (MONTO_ORIGINAL IS 'Monto Original');
LABEL ON COLUMN IROJAS941.DLCLP (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.DLCLP (TASA_INTERES IS 'Tasa Interes');
LABEL ON COLUMN IROJAS941.DLCLP (PLAZO_MESES IS 'Plazo Meses');
LABEL ON COLUMN IROJAS941.DLCLP (DIAS_MORA IS 'Dias Mora');
LABEL ON COLUMN IROJAS941.DLCLP (ESTADO_OPERACION IS 'Estado Operacion');
LABEL ON COLUMN IROJAS941.DLCLP (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.DLCLP (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.DLCLP (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.DLCLP (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.DLCLP (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.DLCLP (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.DLCLP (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.DLCLP.ID_CLIENTE IS 'PK (1/3). Id Cliente de DLCLP. Referencia conceptual a CUMST.id_cliente (segun estructura_bd.md).';
COMMENT ON COLUMN IROJAS941.DLCLP.NUMERO_CUENTA IS 'PK (2/3). Numero Cuenta de DLCLP.';
COMMENT ON COLUMN IROJAS941.DLCLP.REFERENCIA IS 'PK (3/3). Referencia de DLCLP.';
COMMENT ON COLUMN IROJAS941.DLCLP.FECHA_DESEMBOLSO IS 'Fecha Desembolso de DLCLP.';
COMMENT ON COLUMN IROJAS941.DLCLP.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de DLCLP.';
COMMENT ON COLUMN IROJAS941.DLCLP.MONTO_ORIGINAL IS 'Monto Original de DLCLP.';
COMMENT ON COLUMN IROJAS941.DLCLP.SALDO_ACTUAL IS 'Saldo Actual de DLCLP.';
COMMENT ON COLUMN IROJAS941.DLCLP.TASA_INTERES IS 'Tasa Interes de DLCLP.';
COMMENT ON COLUMN IROJAS941.DLCLP.PLAZO_MESES IS 'Plazo Meses de DLCLP.';
COMMENT ON COLUMN IROJAS941.DLCLP.DIAS_MORA IS 'Dias Mora de DLCLP.';
COMMENT ON COLUMN IROJAS941.DLCLP.ESTADO_OPERACION IS 'Estado Operacion de DLCLP.';
COMMENT ON COLUMN IROJAS941.DLCLP.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.DLCLP.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.DLCLP.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.DLCLP.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.DLCLP.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.DLCLP.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.DLCLP.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

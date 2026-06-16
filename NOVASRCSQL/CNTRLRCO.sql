--==============================================================================
-- Nombre de la Tabla   : CNTRLRCO
-- DESCRIPCIÓN          : Tabla de Cargos por Servicios o Tarifas de Cobranzas.
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 6 - Cobranzas) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Catalogo / Parametros
-- Origen de los Datos  : Mantenimiento administrativo / parametrizacion del sistema core bancario (carga manual o por proceso de configuracion).
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.CNTRLRCO (
  CODIGO_BANCO           FOR COLUMN CODBANCO   VARCHAR(20) NOT NULL,
  TIPO_PRODUCTO          FOR COLUMN TIPOPROD   VARCHAR(20) NOT NULL,
  NUMERO_TABLA           FOR COLUMN NUMTBL     VARCHAR(30) NOT NULL,
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
  CONSTRAINT CNTRLRCO_PK PRIMARY KEY (CODIGO_BANCO, TIPO_PRODUCTO, NUMERO_TABLA)
) RCDFMT CNTRLRCOR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.CNTRLRCO IS 'Tarifas Cobranzas';

COMMENT ON TABLE IROJAS941.CNTRLRCO IS 'Tabla de cargos por servicios o tarifas de cobranzas, identificada por codigo_banco, tipo_producto y numero_tabla.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.CNTRLRCO (CODIGO_BANCO IS 'Codigo Banco');
LABEL ON COLUMN IROJAS941.CNTRLRCO (TIPO_PRODUCTO IS 'Tipo Producto');
LABEL ON COLUMN IROJAS941.CNTRLRCO (NUMERO_TABLA IS 'Numero Tabla');
LABEL ON COLUMN IROJAS941.CNTRLRCO (FECHA_RECEPCION IS 'Fecha Recepcion');
LABEL ON COLUMN IROJAS941.CNTRLRCO (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.CNTRLRCO (MONTO_ORIGINAL IS 'Monto Original');
LABEL ON COLUMN IROJAS941.CNTRLRCO (SALDO_PENDIENTE IS 'Saldo Pendiente');
LABEL ON COLUMN IROJAS941.CNTRLRCO (TIPO_DOCUMENTO IS 'Tipo Documento');
LABEL ON COLUMN IROJAS941.CNTRLRCO (ESTADO_OPERACION IS 'Estado Operacion');
LABEL ON COLUMN IROJAS941.CNTRLRCO (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.CNTRLRCO (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.CNTRLRCO (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.CNTRLRCO (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.CNTRLRCO (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.CNTRLRCO (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.CNTRLRCO (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.CNTRLRCO.CODIGO_BANCO IS 'PK (1/3). Codigo Banco de CNTRLRCO.';
COMMENT ON COLUMN IROJAS941.CNTRLRCO.TIPO_PRODUCTO IS 'PK (2/3). Tipo Producto de CNTRLRCO.';
COMMENT ON COLUMN IROJAS941.CNTRLRCO.NUMERO_TABLA IS 'PK (3/3). Numero Tabla de CNTRLRCO.';
COMMENT ON COLUMN IROJAS941.CNTRLRCO.FECHA_RECEPCION IS 'Fecha Recepcion de CNTRLRCO.';
COMMENT ON COLUMN IROJAS941.CNTRLRCO.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de CNTRLRCO.';
COMMENT ON COLUMN IROJAS941.CNTRLRCO.MONTO_ORIGINAL IS 'Monto Original de CNTRLRCO.';
COMMENT ON COLUMN IROJAS941.CNTRLRCO.SALDO_PENDIENTE IS 'Saldo Pendiente de CNTRLRCO.';
COMMENT ON COLUMN IROJAS941.CNTRLRCO.TIPO_DOCUMENTO IS 'Tipo Documento de CNTRLRCO.';
COMMENT ON COLUMN IROJAS941.CNTRLRCO.ESTADO_OPERACION IS 'Estado Operacion de CNTRLRCO.';
COMMENT ON COLUMN IROJAS941.CNTRLRCO.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CNTRLRCO.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CNTRLRCO.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.CNTRLRCO.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.CNTRLRCO.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.CNTRLRCO.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.CNTRLRCO.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

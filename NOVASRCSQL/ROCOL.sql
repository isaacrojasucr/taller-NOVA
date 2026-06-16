--==============================================================================
-- Nombre de la Tabla   : ROCOL
-- DESCRIPCIÓN          : Maestro de Garantías
-- Objetivo             : Completar el esquema documentado en estructura_bd.md (Modulo 8 - Garantias) bajo el alcance de completitud de base de datos del taller. No es consultada directamente por los modulos RPGLE de GLCNC001.
-- Tipo de Tabla        : Maestro
-- Origen de los Datos  : Sistema transaccional (core bancario), generado por procesos de constitucion, avaluo y administracion de garantias asociadas a operaciones de credito.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Tabla de completitud del esquema (alcance DBA), disponible para futuras consultas del taller. No es leida actualmente por los modulos RPGLE de GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.ROCOL (
  CODIGO_BANCO           FOR COLUMN CODBANCO   VARCHAR(20) NOT NULL,
  ID_CLIENTE             FOR COLUMN IDCLI      VARCHAR(30) NOT NULL,
  NUMERO_GARANTIA        FOR COLUMN NUMGAR     VARCHAR(30) NOT NULL,
  TIPO_GARANTIA          FOR COLUMN TIPOGAR    VARCHAR(20) NOT NULL,
  VALOR_GARANTIA         FOR COLUMN VALORGAR   DECIMAL(18 , 2) NOT NULL,
  FECHA_AVALUO           FOR COLUMN FCHAVAL    DATE NOT NULL,
  FECHA_VENCIMIENTO      FOR COLUMN FCHVENC    DATE NOT NULL,
  ESTADO_GARANTIA        FOR COLUMN ESTGAR     VARCHAR(20) NOT NULL,
  OBSERVACIONES          FOR COLUMN OBSERVAC   VARCHAR(120),
  USUARIO_CREACION       FOR COLUMN USRCREA    VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA   VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG    INTEGER       NOT NULL DEFAULT 1,
  ESTADO_REGISTRO        FOR COLUMN ESTREG     CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT  TIMESTAMP,
  CONSTRAINT ROCOL_PK PRIMARY KEY (CODIGO_BANCO, ID_CLIENTE, NUMERO_GARANTIA),
  CONSTRAINT ROCOL_FK_CUMST FOREIGN KEY (ID_CLIENTE)
    REFERENCES IROJAS941.CUMST (ID_CLIENTE)
) RCDFMT ROCOLR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.ROCOL IS 'Maestro de Garantias';

COMMENT ON TABLE IROJAS941.ROCOL IS 'Maestro de garantias del banco, identificado por codigo_banco, id_cliente y numero_garantia. FK hacia CUMST.id_cliente.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.ROCOL (CODIGO_BANCO IS 'Codigo Banco');
LABEL ON COLUMN IROJAS941.ROCOL (ID_CLIENTE IS 'Id Cliente');
LABEL ON COLUMN IROJAS941.ROCOL (NUMERO_GARANTIA IS 'Numero Garantia');
LABEL ON COLUMN IROJAS941.ROCOL (TIPO_GARANTIA IS 'Tipo Garantia');
LABEL ON COLUMN IROJAS941.ROCOL (VALOR_GARANTIA IS 'Valor Garantia');
LABEL ON COLUMN IROJAS941.ROCOL (FECHA_AVALUO IS 'Fecha Avaluo');
LABEL ON COLUMN IROJAS941.ROCOL (FECHA_VENCIMIENTO IS 'Fecha Vencimiento');
LABEL ON COLUMN IROJAS941.ROCOL (ESTADO_GARANTIA IS 'Estado Garantia');
LABEL ON COLUMN IROJAS941.ROCOL (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.ROCOL (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.ROCOL (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.ROCOL (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.ROCOL (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.ROCOL (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.ROCOL (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios tecnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.ROCOL.CODIGO_BANCO IS 'PK (1/3). Codigo Banco de ROCOL.';
COMMENT ON COLUMN IROJAS941.ROCOL.ID_CLIENTE IS 'PK (2/3). Id Cliente de ROCOL. Referencia conceptual a CUMST.id_cliente (segun estructura_bd.md).';
COMMENT ON COLUMN IROJAS941.ROCOL.NUMERO_GARANTIA IS 'PK (3/3). Numero Garantia de ROCOL.';
COMMENT ON COLUMN IROJAS941.ROCOL.TIPO_GARANTIA IS 'Tipo Garantia de ROCOL.';
COMMENT ON COLUMN IROJAS941.ROCOL.VALOR_GARANTIA IS 'Valor Garantia de ROCOL.';
COMMENT ON COLUMN IROJAS941.ROCOL.FECHA_AVALUO IS 'Fecha Avaluo de ROCOL.';
COMMENT ON COLUMN IROJAS941.ROCOL.FECHA_VENCIMIENTO IS 'Fecha Vencimiento de ROCOL.';
COMMENT ON COLUMN IROJAS941.ROCOL.ESTADO_GARANTIA IS 'Estado Garantia de ROCOL.';
COMMENT ON COLUMN IROJAS941.ROCOL.OBSERVACIONES IS 'Observaciones generales asociadas al registro';
COMMENT ON COLUMN IROJAS941.ROCOL.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.ROCOL.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.ROCOL.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.ROCOL.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.ROCOL.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.ROCOL.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

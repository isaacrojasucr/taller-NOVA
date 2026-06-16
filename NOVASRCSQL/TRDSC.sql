--==============================================================================
-- Nombre de la Tabla   : TRDSC
-- DESCRIPCIÓN          : Descripciones adicionales asociadas a las
--                        transacciones registradas en TRANS (texto libre,
--                        multi-idioma, multi-secuencia por transacción).
-- Objetivo             : Complementar el detalle de cada transacción de TRANS
--                        con descripciones de texto extendidas, utilizadas
--                        para enriquecer la trazabilidad de las partidas
--                        conciliatorias detectadas por GLCONCIL (RF-03).
-- Tipo de Tabla        : Transaccional / Detalle
-- Origen de los Datos  : Sistema transaccional (core bancario), generado junto
--                        con cada transacción registrada en TRANS.
-- Permanencia de Datos : Permanente (histórico)
-- Uso de los datos     : Lectura por GLMOVACC como detalle complementario de
--                        TRANS al construir el detalle de partidas
--                        conciliatorias (RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliación GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.TRDSC (
  NUMERO_REGISTRO_RELATIVO FOR COLUMN NUMREGREL VARCHAR(30) NOT NULL,
  SECUENCIA              INTEGER       NOT NULL,
  TIPO_DESCRIPCION       FOR COLUMN TIPODESC  VARCHAR(20)   NOT NULL,
  TEXTO_DESCRIPCION      FOR COLUMN TEXTODESC VARCHAR(200)  NOT NULL,
  CODIGO_IDIOMA          FOR COLUMN CODIDIOMA VARCHAR(5)    NOT NULL,
  FORMATO_SALIDA         FOR COLUMN FMTSALIDA VARCHAR(20)   NOT NULL,
  OBLIGATORIO            FOR COLUMN OBLIGATOR BOOLEAN       NOT NULL DEFAULT FALSE,
  USUARIO_CREACION       FOR COLUMN USRCREA   VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA  VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG   INTEGER       NOT NULL DEFAULT 1,
  OBSERVACIONES          FOR COLUMN OBSERVAC  VARCHAR(120),
  ESTADO_REGISTRO        FOR COLUMN ESTREG    CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT TIMESTAMP,
  CONSTRAINT TRDSC_PK PRIMARY KEY (NUMERO_REGISTRO_RELATIVO, SECUENCIA),
  CONSTRAINT TRDSC_FK_TRANS FOREIGN KEY (NUMERO_REGISTRO_RELATIVO)
    REFERENCES IROJAS941.TRANS (NUMERO_REGISTRO_RELATIVO)
) RCDFMT TRDSCR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.TRDSC IS 'Descripciones de Transacciones';

COMMENT ON TABLE IROJAS941.TRDSC IS 'Descripciones de texto adicionales asociadas a una transacción de TRANS, identificadas por número de registro relativo y secuencia. Permite registrar múltiples textos por transacción (por ejemplo en distintos idiomas o formatos de salida) para enriquecer la trazabilidad de partidas conciliatorias.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.TRDSC (NUMERO_REGISTRO_RELATIVO IS 'Num Reg Relativo');
LABEL ON COLUMN IROJAS941.TRDSC (SECUENCIA IS 'Secuencia');
LABEL ON COLUMN IROJAS941.TRDSC (TIPO_DESCRIPCION IS 'Tipo Descripcion');
LABEL ON COLUMN IROJAS941.TRDSC (TEXTO_DESCRIPCION IS 'Texto Descripcion');
LABEL ON COLUMN IROJAS941.TRDSC (CODIGO_IDIOMA IS 'Codigo Idioma');
LABEL ON COLUMN IROJAS941.TRDSC (FORMATO_SALIDA IS 'Formato Salida');
LABEL ON COLUMN IROJAS941.TRDSC (OBLIGATORIO IS 'Obligatorio');
LABEL ON COLUMN IROJAS941.TRDSC (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.TRDSC (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.TRDSC (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.TRDSC (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.TRDSC (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.TRDSC (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.TRDSC (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios técnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.TRDSC.NUMERO_REGISTRO_RELATIVO IS 'PK (1/2) y FK hacia TRANS.NUMERO_REGISTRO_RELATIVO';
COMMENT ON COLUMN IROJAS941.TRDSC.SECUENCIA IS 'PK (2/2). Secuencia de la descripción dentro de la transacción';
COMMENT ON COLUMN IROJAS941.TRDSC.TIPO_DESCRIPCION IS 'Tipo de descripción asociada a la transacción';
COMMENT ON COLUMN IROJAS941.TRDSC.TEXTO_DESCRIPCION IS 'Contenido textual de la descripción';
COMMENT ON COLUMN IROJAS941.TRDSC.CODIGO_IDIOMA IS 'Idioma del texto descriptivo';
COMMENT ON COLUMN IROJAS941.TRDSC.FORMATO_SALIDA IS 'Formato de presentación del texto descriptivo';
COMMENT ON COLUMN IROJAS941.TRDSC.OBLIGATORIO IS 'Indicador booleano de obligatoriedad de la descripción';
COMMENT ON COLUMN IROJAS941.TRDSC.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.TRDSC.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.TRDSC.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.TRDSC.OBSERVACIONES IS 'Observaciones generales asociadas a la descripción';
COMMENT ON COLUMN IROJAS941.TRDSC.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.TRDSC.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.TRDSC.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

--==============================================================================
-- Nombre de la Tabla   : CCDSC
-- DESCRIPCIÓN          : Maestro de Centros de Costo del banco. Cataloga los
--                        centros de costo utilizados para clasificar cuentas
--                        contables (GLMST) y presupuestos (BUMST).
-- Objetivo             : Servir como tabla de referencia para asociar cada
--                        cuenta contable a un centro de costo, permitiendo
--                        enriquecer la vista GLBLNVW utilizada en la
--                        conciliación de cuentas mayores (RF-01).
-- Tipo de Tabla        : Maestra
-- Origen de los Datos  : Mantenimiento manual por el área de Contabilidad /
--                        Control de Gestión del banco.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Consulta (lookup) desde GLMST y GLBLNVW; mantenimiento
--                        periódico por usuarios autorizados.
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliación GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.CCDSC (
  CODIGO_CENTRO_COSTO      FOR COLUMN CODCC     VARCHAR(20)  NOT NULL,
  DESCRIPCION_CENTRO_COSTO FOR COLUMN DESCCC    VARCHAR(120) NOT NULL,
  CODIGO_BANCO             FOR COLUMN CODBANCO  VARCHAR(20)  NOT NULL,
  TIPO_CENTRO_COSTO        FOR COLUMN TIPOCC    VARCHAR(20)  NOT NULL,
  RESPONSABLE_CC           FOR COLUMN RESPCC    VARCHAR(60),
  OBSERVACIONES            FOR COLUMN OBSERVAC  VARCHAR(120),
  USUARIO_CREACION         FOR COLUMN USRCREA   VARCHAR(30)  NOT NULL,
  USUARIO_ACTUALIZACION    FOR COLUMN USRACTUA  VARCHAR(30),
  VERSION_REGISTRO         FOR COLUMN VERSREG   INTEGER      NOT NULL DEFAULT 1,
  ESTADO_REGISTRO          FOR COLUMN ESTREG    CHAR(1)      NOT NULL DEFAULT 'A',
  CREATED_AT               FOR COLUMN CREATEDAT TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT               FOR COLUMN UPDATEDAT TIMESTAMP,
  CONSTRAINT CCDSC_PK PRIMARY KEY (CODIGO_CENTRO_COSTO)
) RCDFMT CCDSCR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.CCDSC IS 'Maestro de Centros de Costo';

COMMENT ON TABLE IROJAS941.CCDSC IS 'Tabla maestra que cataloga los centros de costo del banco, utilizados para clasificar cuentas contables (GLMST) y presupuestos (BUMST), y para enriquecer la vista GLBLNVW con la descripción del centro de costo de cada cuenta mayor.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.CCDSC (CODIGO_CENTRO_COSTO IS 'Cod Centro Costo');
LABEL ON COLUMN IROJAS941.CCDSC (DESCRIPCION_CENTRO_COSTO IS 'Desc Centro Costo');
LABEL ON COLUMN IROJAS941.CCDSC (CODIGO_BANCO IS 'Codigo Banco');
LABEL ON COLUMN IROJAS941.CCDSC (TIPO_CENTRO_COSTO IS 'Tipo Centro Costo');
LABEL ON COLUMN IROJAS941.CCDSC (RESPONSABLE_CC IS 'Responsable');
LABEL ON COLUMN IROJAS941.CCDSC (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.CCDSC (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.CCDSC (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.CCDSC (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.CCDSC (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.CCDSC (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.CCDSC (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios técnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.CCDSC.CODIGO_CENTRO_COSTO IS 'PK. Código alfanumérico del centro de costo, asignado por el área de Contabilidad. Referenciado por GLMST.CENTRO_COSTO (FK) y BUMST.CENTRO_COSTO';
COMMENT ON COLUMN IROJAS941.CCDSC.DESCRIPCION_CENTRO_COSTO IS 'Descripción legible del centro de costo, mostrada en reportes y en GLBLNVW';
COMMENT ON COLUMN IROJAS941.CCDSC.CODIGO_BANCO IS 'Código del banco al que pertenece el centro de costo';
COMMENT ON COLUMN IROJAS941.CCDSC.TIPO_CENTRO_COSTO IS 'Tipo o categoría del centro de costo, usado para agrupaciones administrativas';
COMMENT ON COLUMN IROJAS941.CCDSC.RESPONSABLE_CC IS 'Responsable administrativo del centro de costo';
COMMENT ON COLUMN IROJAS941.CCDSC.OBSERVACIONES IS 'Observaciones generales de mantenimiento del registro';
COMMENT ON COLUMN IROJAS941.CCDSC.USUARIO_CREACION IS 'Usuario que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CCDSC.USUARIO_ACTUALIZACION IS 'Usuario que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.CCDSC.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.CCDSC.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.CCDSC.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.CCDSC.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

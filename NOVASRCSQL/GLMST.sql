--==============================================================================
-- Nombre de la Tabla   : GLMST
-- DESCRIPCIÓN          : Maestro de Cuentas Contables (plan de cuentas) del
--                        banco. Define cada cuenta contable, su naturaleza,
--                        nivel jerárquico y centro de costo asociado.
-- Objetivo             : Servir como catálogo de referencia para validar y
--                        enriquecer las cuentas mayores de GLBLN, soportando
--                        la consulta de cuenta mayor (RF-01) y el cálculo de
--                        balance (RF-02) del proceso de conciliación.
-- Tipo de Tabla        : Maestra
-- Origen de los Datos  : Mantenimiento manual por el área de Contabilidad
--                        General del banco (plan de cuentas institucional).
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Consulta (lookup) desde GLBLN, GLBLNVW, TRANS, TTRAN,
--                        INPUT, INPT2 y NXINP; mantenimiento periódico por
--                        usuarios autorizados de Contabilidad.
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliación GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.GLMST (
  CODIGO_BANCO          FOR COLUMN CODBANCO  VARCHAR(20)   NOT NULL,
  CODIGO_MONEDA         FOR COLUMN CODMONEDA VARCHAR(20)   NOT NULL,
  CUENTA_CONTABLE       FOR COLUMN CTACONT   VARCHAR(24)   NOT NULL,
  DESCRIPCION_CUENTA    FOR COLUMN DESCCTA   VARCHAR(120)  NOT NULL,
  NATURALEZA_CUENTA     FOR COLUMN NATCTA    VARCHAR(20)   NOT NULL,
  NIVEL_CUENTA          FOR COLUMN NIVCTA    VARCHAR(50),
  CENTRO_COSTO          FOR COLUMN CENTCOSTO VARCHAR(20),
  SALDO_ACTUAL          FOR COLUMN SALDOACT  DECIMAL(18 , 2) NOT NULL DEFAULT 0,
  FECHA_PROCESO_SISTEMA FOR COLUMN FCHPROC   TIMESTAMP,
  OBSERVACIONES         FOR COLUMN OBSERVAC  VARCHAR(120),
  USUARIO_CREACION      FOR COLUMN USRCREA   VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION FOR COLUMN USRACTUA  VARCHAR(30),
  VERSION_REGISTRO      FOR COLUMN VERSREG   INTEGER       NOT NULL DEFAULT 1,
  ESTADO_REGISTRO       FOR COLUMN ESTREG    CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT            FOR COLUMN CREATEDAT TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT            FOR COLUMN UPDATEDAT TIMESTAMP,
  CONSTRAINT GLMST_PK PRIMARY KEY (CODIGO_BANCO, CODIGO_MONEDA, CUENTA_CONTABLE),
  CONSTRAINT GLMST_FK_CCDSC FOREIGN KEY (CENTRO_COSTO)
    REFERENCES IROJAS941.CCDSC (CODIGO_CENTRO_COSTO)
) RCDFMT GLMSTR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.GLMST IS 'Maestro de Cuentas Contables';

COMMENT ON TABLE IROJAS941.GLMST IS 'Tabla maestra del plan de cuentas contables del banco. Define cada cuenta (banco, moneda, cuenta contable), su descripción, naturaleza, nivel jerárquico y centro de costo asociado (FK a CCDSC). Es consultada por GLBLN/GLBLNVW para enriquecer las cuentas mayores en el proceso de conciliación.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.GLMST (CODIGO_BANCO IS 'Codigo Banco');
LABEL ON COLUMN IROJAS941.GLMST (CODIGO_MONEDA IS 'Codigo Moneda');
LABEL ON COLUMN IROJAS941.GLMST (CUENTA_CONTABLE IS 'Cuenta Contable');
LABEL ON COLUMN IROJAS941.GLMST (DESCRIPCION_CUENTA IS 'Desc Cuenta');
LABEL ON COLUMN IROJAS941.GLMST (NATURALEZA_CUENTA IS 'Naturaleza Cuenta');
LABEL ON COLUMN IROJAS941.GLMST (NIVEL_CUENTA IS 'Nivel Cuenta');
LABEL ON COLUMN IROJAS941.GLMST (CENTRO_COSTO IS 'Centro Costo');
LABEL ON COLUMN IROJAS941.GLMST (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.GLMST (FECHA_PROCESO_SISTEMA IS 'Fecha Proceso');
LABEL ON COLUMN IROJAS941.GLMST (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.GLMST (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.GLMST (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.GLMST (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.GLMST (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.GLMST (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.GLMST (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios técnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.GLMST.CODIGO_BANCO IS 'PK (1/3). Código del banco al que pertenece la cuenta contable';
COMMENT ON COLUMN IROJAS941.GLMST.CODIGO_MONEDA IS 'PK (2/3). Código de la moneda de la cuenta contable';
COMMENT ON COLUMN IROJAS941.GLMST.CUENTA_CONTABLE IS 'PK (3/3). Número de cuenta contable del plan de cuentas. Referenciado por GLBLN.CUENTA_CONTABLE (FK)';
COMMENT ON COLUMN IROJAS941.GLMST.DESCRIPCION_CUENTA IS 'Nombre/descripción de la cuenta contable';
COMMENT ON COLUMN IROJAS941.GLMST.NATURALEZA_CUENTA IS 'Naturaleza contable de la cuenta (DEUDORA/ACREEDORA), usada para interpretar débitos y créditos en la conciliación';
COMMENT ON COLUMN IROJAS941.GLMST.NIVEL_CUENTA IS 'Nivel jerárquico de la cuenta dentro del plan de cuentas';
COMMENT ON COLUMN IROJAS941.GLMST.CENTRO_COSTO IS 'FK a CCDSC.CODIGO_CENTRO_COSTO. Centro de costo al que está asociada la cuenta contable';
COMMENT ON COLUMN IROJAS941.GLMST.SALDO_ACTUAL IS 'Saldo actual de la cuenta según el sistema fuente (saldo fuente para conciliación)';
COMMENT ON COLUMN IROJAS941.GLMST.FECHA_PROCESO_SISTEMA IS 'Fecha y hora del último proceso batch que actualizó el saldo de la cuenta';
COMMENT ON COLUMN IROJAS941.GLMST.OBSERVACIONES IS 'Observaciones generales de mantenimiento del registro';
COMMENT ON COLUMN IROJAS941.GLMST.USUARIO_CREACION IS 'Usuario que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.GLMST.USUARIO_ACTUALIZACION IS 'Usuario que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.GLMST.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.GLMST.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.GLMST.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.GLMST.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

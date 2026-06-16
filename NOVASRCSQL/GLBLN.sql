--==============================================================================
-- Nombre de la Tabla   : GLBLN
-- DESCRIPCIÓN          : Balances Generales (cuentas mayores) por banco,
--                        sucursal, moneda y cuenta contable. Es la tabla
--                        principal consultada por el proceso de conciliación.
-- Objetivo             : Almacenar el saldo actual reportado por el sistema
--                        fuente para cada cuenta mayor, que será comparado
--                        contra el saldo calculado a partir de TRANS/TTRAN
--                        durante el proceso de conciliación (RF-01/RF-02).
-- Tipo de Tabla        : Transaccional / Saldos
-- Origen de los Datos  : Proceso batch de cierre contable diario del banco,
--                        que actualiza el saldo de cada cuenta mayor.
-- Permanencia de Datos : Permanente
-- Uso de los datos     : Lectura principal por GLDTAACC (vía GLBLNVW) para el
--                        proceso de conciliación GLCNC001 (RF-01/RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliación GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.GLBLN (
  CODIGO_BANCO          FOR COLUMN CODBANCO  VARCHAR(20)   NOT NULL,
  CODIGO_SUCURSAL       FOR COLUMN CODSUC    VARCHAR(20)   NOT NULL,
  CODIGO_MONEDA         FOR COLUMN CODMONEDA VARCHAR(20)   NOT NULL,
  CUENTA_CONTABLE       FOR COLUMN CTACONT   VARCHAR(24)   NOT NULL,
  DESCRIPCION_CUENTA    FOR COLUMN DESCCTA   VARCHAR(120)  NOT NULL,
  NATURALEZA_CUENTA     FOR COLUMN NATCTA    VARCHAR(20)   NOT NULL,
  NIVEL_CUENTA          FOR COLUMN NIVCTA    VARCHAR(50),
  SALDO_ACTUAL          FOR COLUMN SALDOACT  DECIMAL(18 , 2) NOT NULL DEFAULT 0,
  FECHA_PROCESO_SISTEMA FOR COLUMN FCHPROC   TIMESTAMP,
  OBSERVACIONES         FOR COLUMN OBSERVAC  VARCHAR(120),
  USUARIO_CREACION      FOR COLUMN USRCREA   VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION FOR COLUMN USRACTUA  VARCHAR(30),
  VERSION_REGISTRO      FOR COLUMN VERSREG   INTEGER       NOT NULL DEFAULT 1,
  ESTADO_REGISTRO       FOR COLUMN ESTREG    CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT            FOR COLUMN CREATEDAT TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT            FOR COLUMN UPDATEDAT TIMESTAMP,
  CONSTRAINT GLBLN_PK PRIMARY KEY (CODIGO_BANCO, CODIGO_SUCURSAL, CODIGO_MONEDA, CUENTA_CONTABLE),
  CONSTRAINT GLBLN_FK_GLMST FOREIGN KEY (CODIGO_BANCO, CODIGO_MONEDA, CUENTA_CONTABLE)
    REFERENCES IROJAS941.GLMST (CODIGO_BANCO, CODIGO_MONEDA, CUENTA_CONTABLE)
) RCDFMT GLBLNR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.GLBLN IS 'Balances Generales (Cuentas Mayores)';

COMMENT ON TABLE IROJAS941.GLBLN IS 'Tabla principal de balances generales (cuentas mayores) por banco, sucursal, moneda y cuenta contable. Almacena el saldo actual reportado por el sistema fuente, utilizado como saldo de referencia en el proceso de conciliación GLCNC001. Referencia a GLMST mediante FK (CODIGO_BANCO, CODIGO_MONEDA, CUENTA_CONTABLE).';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.GLBLN (CODIGO_BANCO IS 'Codigo Banco');
LABEL ON COLUMN IROJAS941.GLBLN (CODIGO_SUCURSAL IS 'Codigo Sucursal');
LABEL ON COLUMN IROJAS941.GLBLN (CODIGO_MONEDA IS 'Codigo Moneda');
LABEL ON COLUMN IROJAS941.GLBLN (CUENTA_CONTABLE IS 'Cuenta Contable');
LABEL ON COLUMN IROJAS941.GLBLN (DESCRIPCION_CUENTA IS 'Desc Cuenta');
LABEL ON COLUMN IROJAS941.GLBLN (NATURALEZA_CUENTA IS 'Naturaleza Cuenta');
LABEL ON COLUMN IROJAS941.GLBLN (NIVEL_CUENTA IS 'Nivel Cuenta');
LABEL ON COLUMN IROJAS941.GLBLN (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.GLBLN (FECHA_PROCESO_SISTEMA IS 'Fecha Proceso');
LABEL ON COLUMN IROJAS941.GLBLN (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.GLBLN (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.GLBLN (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.GLBLN (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.GLBLN (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.GLBLN (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.GLBLN (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios técnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.GLBLN.CODIGO_BANCO IS 'PK (1/4) y FK (1/3 hacia GLMST). Código del banco propietario del balance';
COMMENT ON COLUMN IROJAS941.GLBLN.CODIGO_SUCURSAL IS 'PK (2/4). Código de sucursal del balance de la cuenta mayor';
COMMENT ON COLUMN IROJAS941.GLBLN.CODIGO_MONEDA IS 'PK (3/4) y FK (2/3 hacia GLMST). Código de moneda del saldo';
COMMENT ON COLUMN IROJAS941.GLBLN.CUENTA_CONTABLE IS 'PK (4/4) y FK (3/3 hacia GLMST). Cuenta contable del plan de cuentas (GLMST.CUENTA_CONTABLE)';
COMMENT ON COLUMN IROJAS941.GLBLN.DESCRIPCION_CUENTA IS 'Descripción de la cuenta mayor para presentación directa';
COMMENT ON COLUMN IROJAS941.GLBLN.NATURALEZA_CUENTA IS 'Naturaleza contable (DEUDORA/ACREEDORA) usada en el cálculo de balance (GLBALCAL)';
COMMENT ON COLUMN IROJAS941.GLBLN.NIVEL_CUENTA IS 'Nivel jerárquico de la cuenta mayor dentro del plan de cuentas';
COMMENT ON COLUMN IROJAS941.GLBLN.SALDO_ACTUAL IS 'Saldo fuente de la cuenta mayor, comparado contra el saldo final calculado durante la conciliación (RF-02/RF-03)';
COMMENT ON COLUMN IROJAS941.GLBLN.FECHA_PROCESO_SISTEMA IS 'Fecha y hora del último proceso batch que actualizó el saldo';
COMMENT ON COLUMN IROJAS941.GLBLN.OBSERVACIONES IS 'Observaciones generales de mantenimiento del registro';
COMMENT ON COLUMN IROJAS941.GLBLN.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.GLBLN.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.GLBLN.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.GLBLN.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.GLBLN.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.GLBLN.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

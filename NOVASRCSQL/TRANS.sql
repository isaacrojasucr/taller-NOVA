--==============================================================================
-- Nombre de la Tabla   : TRANS
-- DESCRIPCIÓN          : Archivo histórico de transacciones contables y
--                        bancarias, con el detalle de cada movimiento
--                        (débito/crédito), su cuenta contable, cuenta de
--                        detalle y cliente asociados.
-- Objetivo             : Servir como fuente de movimientos históricos para el
--                        cálculo del saldo final por cuenta mayor (GLBALCAL) y
--                        para la detección de partidas conciliatorias
--                        (GLCONCIL) dentro del proceso de conciliación
--                        GLBLN (RF-02/RF-03).
-- Tipo de Tabla        : Transaccional / Histórico
-- Origen de los Datos  : Sistema transaccional (core bancario) que registra
--                        cada operación procesada sobre cuentas de clientes.
-- Permanencia de Datos : Permanente (histórico)
-- Uso de los datos     : Lectura por GLMOVACC para el cálculo de movimientos
--                        (débitos/créditos) y detección de partidas
--                        conciliatorias por cuenta y período (RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliación GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.TRANS (
  ID_TRANSACCION         FOR COLUMN IDTRANS   BIGINT        NOT NULL,
  NUMERO_REGISTRO_RELATIVO FOR COLUMN NUMREGREL VARCHAR(30) NOT NULL,
  CODIGO_BANCO           FOR COLUMN CODBANCO  VARCHAR(20)   NOT NULL,
  CODIGO_SUCURSAL        FOR COLUMN CODSUC    VARCHAR(20)   NOT NULL,
  CODIGO_MONEDA          FOR COLUMN CODMONEDA VARCHAR(20)   NOT NULL,
  CUENTA_CONTABLE        FOR COLUMN CTACONT   VARCHAR(24)   NOT NULL,
  NUMERO_CUENTA          FOR COLUMN NUMCTA    VARCHAR(24)   NOT NULL,
  ID_CLIENTE             FOR COLUMN IDCLIENTE VARCHAR(30)   NOT NULL,
  FECHA_OPERACION        FOR COLUMN FCHOPER   DATE          NOT NULL,
  FECHA_VALOR            FOR COLUMN FCHVALOR  DATE          NOT NULL,
  HORA_OPERACION         FOR COLUMN HORAOPER  TIME          NOT NULL,
  TIPO_MOVIMIENTO        FOR COLUMN TIPOMOV   VARCHAR(20)   NOT NULL,
  DEBITO_CREDITO         FOR COLUMN DBCR      CHAR(1)       NOT NULL,
  MONTO                  DECIMAL(18 , 2) NOT NULL,
  SALDO_ANTERIOR         FOR COLUMN SALDOANT  DECIMAL(18 , 2) NOT NULL,
  SALDO_POSTERIOR        FOR COLUMN SALDOPOS  DECIMAL(18 , 2) NOT NULL,
  CANAL_ORIGEN           FOR COLUMN CANALORIG VARCHAR(20)   NOT NULL,
  TERMINAL_ORIGEN        FOR COLUMN TERMORIG  VARCHAR(30)   NOT NULL,
  REFERENCIA_EXTERNA     FOR COLUMN REFEXTERN VARCHAR(40)   NOT NULL,
  ESTADO_TRANSACCION     FOR COLUMN ESTTRANS  VARCHAR(20)   NOT NULL,
  USUARIO_CREACION       FOR COLUMN USRCREA   VARCHAR(30)   NOT NULL,
  USUARIO_ACTUALIZACION  FOR COLUMN USRACTUA  VARCHAR(30),
  VERSION_REGISTRO       FOR COLUMN VERSREG   INTEGER       NOT NULL DEFAULT 1,
  OBSERVACIONES          FOR COLUMN OBSERVAC  VARCHAR(120),
  ESTADO_REGISTRO        FOR COLUMN ESTREG    CHAR(1)       NOT NULL DEFAULT 'A',
  CREATED_AT             FOR COLUMN CREATEDAT TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT             FOR COLUMN UPDATEDAT TIMESTAMP,
  CONSTRAINT TRANS_PK PRIMARY KEY (ID_TRANSACCION),
  CONSTRAINT TRANS_UK_NUMREGREL UNIQUE (NUMERO_REGISTRO_RELATIVO),
  CONSTRAINT TRANS_FK_GLMST FOREIGN KEY (CODIGO_BANCO, CODIGO_MONEDA, CUENTA_CONTABLE)
    REFERENCES IROJAS941.GLMST (CODIGO_BANCO, CODIGO_MONEDA, CUENTA_CONTABLE)
) RCDFMT TRANSR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.TRANS IS 'Historico de Transacciones';

COMMENT ON TABLE IROJAS941.TRANS IS 'Archivo histórico de transacciones bancarias. Cada fila representa un movimiento (débito/crédito) procesado sobre una cuenta de detalle y su cuenta contable asociada. NUMERO_CUENTA e ID_CLIENTE son referencias conceptuales a ACMST.numero_cuenta y CUMST.id_cliente (tablas fuera del alcance funcional del taller, sin FK declarada). CUENTA_CONTABLE referencia GLMST mediante FK compuesta. Es fuente de datos para el cálculo de movimientos y detección de partidas conciliatorias (GLMOVACC/GLCONCIL).';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.TRANS (ID_TRANSACCION IS 'Id Transaccion');
LABEL ON COLUMN IROJAS941.TRANS (NUMERO_REGISTRO_RELATIVO IS 'Num Reg Relativo');
LABEL ON COLUMN IROJAS941.TRANS (CODIGO_BANCO IS 'Codigo Banco');
LABEL ON COLUMN IROJAS941.TRANS (CODIGO_SUCURSAL IS 'Codigo Sucursal');
LABEL ON COLUMN IROJAS941.TRANS (CODIGO_MONEDA IS 'Codigo Moneda');
LABEL ON COLUMN IROJAS941.TRANS (CUENTA_CONTABLE IS 'Cuenta Contable');
LABEL ON COLUMN IROJAS941.TRANS (NUMERO_CUENTA IS 'Numero Cuenta');
LABEL ON COLUMN IROJAS941.TRANS (ID_CLIENTE IS 'Id Cliente');
LABEL ON COLUMN IROJAS941.TRANS (FECHA_OPERACION IS 'Fecha Operacion');
LABEL ON COLUMN IROJAS941.TRANS (FECHA_VALOR IS 'Fecha Valor');
LABEL ON COLUMN IROJAS941.TRANS (HORA_OPERACION IS 'Hora Operacion');
LABEL ON COLUMN IROJAS941.TRANS (TIPO_MOVIMIENTO IS 'Tipo Movimiento');
LABEL ON COLUMN IROJAS941.TRANS (DEBITO_CREDITO IS 'Debito Credito');
LABEL ON COLUMN IROJAS941.TRANS (MONTO IS 'Monto');
LABEL ON COLUMN IROJAS941.TRANS (SALDO_ANTERIOR IS 'Saldo Anterior');
LABEL ON COLUMN IROJAS941.TRANS (SALDO_POSTERIOR IS 'Saldo Posterior');
LABEL ON COLUMN IROJAS941.TRANS (CANAL_ORIGEN IS 'Canal Origen');
LABEL ON COLUMN IROJAS941.TRANS (TERMINAL_ORIGEN IS 'Terminal Origen');
LABEL ON COLUMN IROJAS941.TRANS (REFERENCIA_EXTERNA IS 'Referencia Externa');
LABEL ON COLUMN IROJAS941.TRANS (ESTADO_TRANSACCION IS 'Estado Transaccion');
LABEL ON COLUMN IROJAS941.TRANS (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.TRANS (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.TRANS (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.TRANS (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.TRANS (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.TRANS (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.TRANS (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios técnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.TRANS.ID_TRANSACCION IS 'PK. Identificador único de la transacción';
COMMENT ON COLUMN IROJAS941.TRANS.NUMERO_REGISTRO_RELATIVO IS 'UK. Número de registro relativo único, referenciado por TRDSC.NUMERO_REGISTRO_RELATIVO y TTRAN.NUMERO_REGISTRO_RELATIVO (FK)';
COMMENT ON COLUMN IROJAS941.TRANS.CODIGO_BANCO IS 'FK (1/3 hacia GLMST). Código del banco que procesó la transacción';
COMMENT ON COLUMN IROJAS941.TRANS.CODIGO_SUCURSAL IS 'Código de sucursal de origen de la transacción';
COMMENT ON COLUMN IROJAS941.TRANS.CODIGO_MONEDA IS 'FK (2/3 hacia GLMST). Código de moneda de la transacción';
COMMENT ON COLUMN IROJAS941.TRANS.CUENTA_CONTABLE IS 'FK (3/3 hacia GLMST). Cuenta contable afectada por la transacción';
COMMENT ON COLUMN IROJAS941.TRANS.NUMERO_CUENTA IS 'Referencia conceptual (no declarada) a ACMST.numero_cuenta. Identifica la cuenta de detalle afectada';
COMMENT ON COLUMN IROJAS941.TRANS.ID_CLIENTE IS 'Referencia conceptual (no declarada) a CUMST.id_cliente. Identifica el cliente titular';
COMMENT ON COLUMN IROJAS941.TRANS.FECHA_OPERACION IS 'Fecha de la operación';
COMMENT ON COLUMN IROJAS941.TRANS.FECHA_VALOR IS 'Fecha contable (valor) de la transacción, usada para filtrar por período en la conciliación';
COMMENT ON COLUMN IROJAS941.TRANS.HORA_OPERACION IS 'Hora de la operación';
COMMENT ON COLUMN IROJAS941.TRANS.TIPO_MOVIMIENTO IS 'Tipo de movimiento de la transacción';
COMMENT ON COLUMN IROJAS941.TRANS.DEBITO_CREDITO IS 'Indicador D/C de la transacción, usado para clasificar débitos y créditos en GLBALCAL';
COMMENT ON COLUMN IROJAS941.TRANS.MONTO IS 'Monto de la transacción';
COMMENT ON COLUMN IROJAS941.TRANS.SALDO_ANTERIOR IS 'Saldo de la cuenta de detalle antes de la transacción';
COMMENT ON COLUMN IROJAS941.TRANS.SALDO_POSTERIOR IS 'Saldo de la cuenta de detalle después de la transacción';
COMMENT ON COLUMN IROJAS941.TRANS.CANAL_ORIGEN IS 'Canal de origen de la transacción';
COMMENT ON COLUMN IROJAS941.TRANS.TERMINAL_ORIGEN IS 'Terminal o dispositivo de origen de la transacción';
COMMENT ON COLUMN IROJAS941.TRANS.REFERENCIA_EXTERNA IS 'Referencia externa asociada a la transacción';
COMMENT ON COLUMN IROJAS941.TRANS.ESTADO_TRANSACCION IS 'Estado funcional de la transacción, usado en la detección de partidas conciliatorias';
COMMENT ON COLUMN IROJAS941.TRANS.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.TRANS.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.TRANS.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.TRANS.OBSERVACIONES IS 'Observaciones generales asociadas a la transacción';
COMMENT ON COLUMN IROJAS941.TRANS.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.TRANS.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.TRANS.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

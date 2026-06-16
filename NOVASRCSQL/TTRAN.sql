--==============================================================================
-- Nombre de la Tabla   : TTRAN
-- DESCRIPCIÓN          : Archivo maestro de transacciones del día (movimientos
--                        del día corriente, previos a su consolidación en
--                        TRANS al cierre del proceso batch).
-- Objetivo             : Proveer los movimientos del día (débitos/créditos)
--                        por cuenta contable y cuenta de detalle, utilizados
--                        junto con TRANS para el cálculo del saldo final y la
--                        detección de partidas conciliatorias del día en
--                        curso (RF-02/RF-03).
-- Tipo de Tabla        : Transaccional / Diario
-- Origen de los Datos  : Sistema transaccional (core bancario), generado en
--                        tiempo real durante la jornada operativa del banco.
-- Permanencia de Datos : Temporal (vigente durante el día operativo, hasta su
--                        consolidación en TRANS al cierre batch).
-- Uso de los datos     : Lectura por GLMOVACC para incluir los movimientos del
--                        día corriente en el cálculo de balance y detección de
--                        partidas conciliatorias (RF-02/RF-03).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliación GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE TABLE IROJAS941.TTRAN (
  ID_TRANSACCION_DIA     FOR COLUMN IDTRANDIA BIGINT        NOT NULL,
  NUMERO_REGISTRO_RELATIVO FOR COLUMN NUMREGREL VARCHAR(30) NOT NULL,
  CODIGO_BANCO           FOR COLUMN CODBANCO  VARCHAR(20)   NOT NULL,
  CODIGO_SUCURSAL        FOR COLUMN CODSUC    VARCHAR(20)   NOT NULL,
  CODIGO_MONEDA          FOR COLUMN CODMONEDA VARCHAR(20)   NOT NULL,
  CUENTA_CONTABLE        FOR COLUMN CTACONT   VARCHAR(24)   NOT NULL,
  NUMERO_CUENTA          FOR COLUMN NUMCTA    VARCHAR(24)   NOT NULL,
  ID_CLIENTE             FOR COLUMN IDCLIENTE VARCHAR(30)   NOT NULL,
  FECHA                  DATE          NOT NULL,
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
  CONSTRAINT TTRAN_PK PRIMARY KEY (ID_TRANSACCION_DIA, CODIGO_BANCO, CODIGO_SUCURSAL, CODIGO_MONEDA, CUENTA_CONTABLE, NUMERO_CUENTA, FECHA),
  CONSTRAINT TTRAN_FK_TRANS FOREIGN KEY (NUMERO_REGISTRO_RELATIVO)
    REFERENCES IROJAS941.TRANS (NUMERO_REGISTRO_RELATIVO),
  CONSTRAINT TTRAN_FK_GLMST FOREIGN KEY (CODIGO_BANCO, CODIGO_MONEDA, CUENTA_CONTABLE)
    REFERENCES IROJAS941.GLMST (CODIGO_BANCO, CODIGO_MONEDA, CUENTA_CONTABLE)
) RCDFMT TTRANR;

--------------------------------------------------------------------------------
-- Metadata de la tabla
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.TTRAN IS 'Transacciones del Dia';

COMMENT ON TABLE IROJAS941.TTRAN IS 'Archivo maestro de transacciones del día corriente. Llave primaria compuesta por ID_TRANSACCION_DIA, CODIGO_BANCO, CODIGO_SUCURSAL, CODIGO_MONEDA, CUENTA_CONTABLE, NUMERO_CUENTA y FECHA, conforme a la definición de estructura_bd.md. NUMERO_CUENTA e ID_CLIENTE son referencias conceptuales a ACMST.numero_cuenta y CUMST.id_cliente (tablas fuera del alcance funcional del taller, sin FK declarada). CUENTA_CONTABLE referencia GLMST y NUMERO_REGISTRO_RELATIVO referencia TRANS mediante FK declaradas. Es fuente de movimientos del día para el cálculo de balance y detección de partidas conciliatorias (GLMOVACC/GLCONCIL).';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.TTRAN (ID_TRANSACCION_DIA IS 'Id Transac Dia');
LABEL ON COLUMN IROJAS941.TTRAN (NUMERO_REGISTRO_RELATIVO IS 'Num Reg Relativo');
LABEL ON COLUMN IROJAS941.TTRAN (CODIGO_BANCO IS 'Codigo Banco');
LABEL ON COLUMN IROJAS941.TTRAN (CODIGO_SUCURSAL IS 'Codigo Sucursal');
LABEL ON COLUMN IROJAS941.TTRAN (CODIGO_MONEDA IS 'Codigo Moneda');
LABEL ON COLUMN IROJAS941.TTRAN (CUENTA_CONTABLE IS 'Cuenta Contable');
LABEL ON COLUMN IROJAS941.TTRAN (NUMERO_CUENTA IS 'Numero Cuenta');
LABEL ON COLUMN IROJAS941.TTRAN (ID_CLIENTE IS 'Id Cliente');
LABEL ON COLUMN IROJAS941.TTRAN (FECHA IS 'Fecha');
LABEL ON COLUMN IROJAS941.TTRAN (FECHA_VALOR IS 'Fecha Valor');
LABEL ON COLUMN IROJAS941.TTRAN (HORA_OPERACION IS 'Hora Operacion');
LABEL ON COLUMN IROJAS941.TTRAN (TIPO_MOVIMIENTO IS 'Tipo Movimiento');
LABEL ON COLUMN IROJAS941.TTRAN (DEBITO_CREDITO IS 'Debito Credito');
LABEL ON COLUMN IROJAS941.TTRAN (MONTO IS 'Monto');
LABEL ON COLUMN IROJAS941.TTRAN (SALDO_ANTERIOR IS 'Saldo Anterior');
LABEL ON COLUMN IROJAS941.TTRAN (SALDO_POSTERIOR IS 'Saldo Posterior');
LABEL ON COLUMN IROJAS941.TTRAN (CANAL_ORIGEN IS 'Canal Origen');
LABEL ON COLUMN IROJAS941.TTRAN (TERMINAL_ORIGEN IS 'Terminal Origen');
LABEL ON COLUMN IROJAS941.TTRAN (REFERENCIA_EXTERNA IS 'Referencia Externa');
LABEL ON COLUMN IROJAS941.TTRAN (ESTADO_TRANSACCION IS 'Estado Transaccion');
LABEL ON COLUMN IROJAS941.TTRAN (USUARIO_CREACION IS 'Usuario Creacion');
LABEL ON COLUMN IROJAS941.TTRAN (USUARIO_ACTUALIZACION IS 'Usuario Actualiza');
LABEL ON COLUMN IROJAS941.TTRAN (VERSION_REGISTRO IS 'Version Registro');
LABEL ON COLUMN IROJAS941.TTRAN (OBSERVACIONES IS 'Observaciones');
LABEL ON COLUMN IROJAS941.TTRAN (ESTADO_REGISTRO IS 'Estado Registro');
LABEL ON COLUMN IROJAS941.TTRAN (CREATED_AT IS 'Fecha Creacion');
LABEL ON COLUMN IROJAS941.TTRAN (UPDATED_AT IS 'Fecha Actualiza');

--------------------------------------------------------------------------------
-- Comentarios técnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.TTRAN.ID_TRANSACCION_DIA IS 'PK (1/7). Identificador de la transacción del día';
COMMENT ON COLUMN IROJAS941.TTRAN.NUMERO_REGISTRO_RELATIVO IS 'FK hacia TRANS.NUMERO_REGISTRO_RELATIVO. Vincula la transacción del día con su registro consolidado en TRANS';
COMMENT ON COLUMN IROJAS941.TTRAN.CODIGO_BANCO IS 'PK (2/7) y FK (1/3 hacia GLMST). Código del banco que procesó la transacción del día';
COMMENT ON COLUMN IROJAS941.TTRAN.CODIGO_SUCURSAL IS 'PK (3/7). Código de sucursal de origen de la transacción del día';
COMMENT ON COLUMN IROJAS941.TTRAN.CODIGO_MONEDA IS 'PK (4/7) y FK (2/3 hacia GLMST). Código de moneda de la transacción del día';
COMMENT ON COLUMN IROJAS941.TTRAN.CUENTA_CONTABLE IS 'PK (5/7) y FK (3/3 hacia GLMST). Cuenta contable afectada por la transacción del día';
COMMENT ON COLUMN IROJAS941.TTRAN.NUMERO_CUENTA IS 'PK (6/7). Referencia conceptual (no declarada) a ACMST.numero_cuenta. Identifica la cuenta de detalle afectada';
COMMENT ON COLUMN IROJAS941.TTRAN.ID_CLIENTE IS 'Referencia conceptual (no declarada) a CUMST.id_cliente. Identifica el cliente titular';
COMMENT ON COLUMN IROJAS941.TTRAN.FECHA IS 'PK (7/7). Fecha de la transacción del día';
COMMENT ON COLUMN IROJAS941.TTRAN.FECHA_VALOR IS 'Fecha contable (valor) de la transacción del día, usada para filtrar por período en la conciliación';
COMMENT ON COLUMN IROJAS941.TTRAN.HORA_OPERACION IS 'Hora de la operación del día';
COMMENT ON COLUMN IROJAS941.TTRAN.TIPO_MOVIMIENTO IS 'Tipo de movimiento de la transacción del día';
COMMENT ON COLUMN IROJAS941.TTRAN.DEBITO_CREDITO IS 'Indicador D/C de la transacción del día, usado para clasificar débitos y créditos en GLBALCAL';
COMMENT ON COLUMN IROJAS941.TTRAN.MONTO IS 'Monto de la transacción del día';
COMMENT ON COLUMN IROJAS941.TTRAN.SALDO_ANTERIOR IS 'Saldo de la cuenta de detalle antes de la transacción del día';
COMMENT ON COLUMN IROJAS941.TTRAN.SALDO_POSTERIOR IS 'Saldo de la cuenta de detalle después de la transacción del día';
COMMENT ON COLUMN IROJAS941.TTRAN.CANAL_ORIGEN IS 'Canal de origen de la transacción del día';
COMMENT ON COLUMN IROJAS941.TTRAN.TERMINAL_ORIGEN IS 'Terminal o dispositivo de origen de la transacción del día';
COMMENT ON COLUMN IROJAS941.TTRAN.REFERENCIA_EXTERNA IS 'Referencia externa asociada a la transacción del día';
COMMENT ON COLUMN IROJAS941.TTRAN.ESTADO_TRANSACCION IS 'Estado funcional de la transacción del día, usado en la detección de partidas conciliatorias';
COMMENT ON COLUMN IROJAS941.TTRAN.USUARIO_CREACION IS 'Usuario o proceso que creó el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.TTRAN.USUARIO_ACTUALIZACION IS 'Usuario o proceso que modificó por última vez el registro (auditoría)';
COMMENT ON COLUMN IROJAS941.TTRAN.VERSION_REGISTRO IS 'Contador de versión del registro, incrementado en cada UPDATE';
COMMENT ON COLUMN IROJAS941.TTRAN.OBSERVACIONES IS 'Observaciones generales asociadas a la transacción del día';
COMMENT ON COLUMN IROJAS941.TTRAN.ESTADO_REGISTRO IS 'Estado lógico del registro: A = Activo, I = Inactivo';
COMMENT ON COLUMN IROJAS941.TTRAN.CREATED_AT IS 'Marca de tiempo de creación del registro';
COMMENT ON COLUMN IROJAS941.TTRAN.UPDATED_AT IS 'Marca de tiempo de la última actualización del registro';

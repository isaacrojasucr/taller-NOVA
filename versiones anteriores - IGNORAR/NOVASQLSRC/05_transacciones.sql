--==============================================================
-- TABLA: TRANS
--==============================================================
-- Nombre de la Tabla: TRANS
-- DESCRIPCIÓN: Archivo histórico de transacciones.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE TRANS (
  ID_TRANSACCION BIGINT FOR COLUMN ID_TRANSAC GENERATED ALWAYS AS IDENTITY,
  NUMERO_REGISTRO_RELATIVO VARCHAR(30) FOR COLUMN NUMERO_REG,
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_SUCURSAL VARCHAR(20) FOR COLUMN CODIGO_SUC,
  CODIGO_MONEDA VARCHAR(20) FOR COLUMN CODIGO_MON,
  CUENTA_CONTABLE VARCHAR(24) FOR COLUMN CUENTA_CON,
  NUMERO_CUENTA VARCHAR(24) FOR COLUMN NUMERO_CUE,
  ID_CLIENTE VARCHAR(30) FOR COLUMN ID_CLIENTE,
  FECHA_OPERACION DATE FOR COLUMN FECHA_OPER,
  FECHA_VALOR DATE FOR COLUMN FECHA_VALO,
  HORA_OPERACION VARCHAR(10) FOR COLUMN HORA_OPERA,
  TIPO_MOVIMIENTO VARCHAR(20) FOR COLUMN TIPO_MOVIM,
  DEBITO_CREDITO CHAR(1) FOR COLUMN DEBITO_CRE,
  MONTO DECIMAL(18,2) FOR COLUMN MONTO,
  SALDO_ANTERIOR DECIMAL(18,2) FOR COLUMN SALDO_ANTE,
  SALDO_POSTERIOR DECIMAL(18,2) FOR COLUMN SALDO_POST,
  CANAL_ORIGEN VARCHAR(20) FOR COLUMN CANAL_ORIG,
  TERMINAL_ORIGEN VARCHAR(30) FOR COLUMN TERMINAL_O,
  REFERENCIA_EXTERNA VARCHAR(40) FOR COLUMN REFERENCIA,
  ESTADO_TRANSACCION VARCHAR(20) FOR COLUMN ESTADO_TRA,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (id_transaccion)
) RCDFMT RTRANS;

LABEL ON TABLE TRANS IS 'Archivo histórico de transacciones.';
LABEL ON COLUMN TRANS (id_transaccion IS 'Identificador de transacción',
  numero_registro_relativo IS 'Número de registro relativo',
  codigo_banco IS 'Código de banco',
  codigo_sucursal IS 'Código de sucursal',
  codigo_moneda IS 'Código de moneda',
  cuenta_contable IS 'Cuenta contable',
  numero_cuenta IS 'Número de cuenta',
  id_cliente IS 'Identificador del cliente',
  fecha_operacion IS 'Fecha de operación',
  fecha_valor IS 'Fecha valor',
  hora_operacion IS 'Hora de operación',
  tipo_movimiento IS 'Tipo de movimiento',
  debito_credito IS 'Débito/Crédito',
  monto IS 'Monto de la transacción',
  saldo_anterior IS 'Saldo anterior',
  saldo_posterior IS 'Saldo posterior',
  canal_origen IS 'Canal de origen',
  terminal_origen IS 'Terminal de origen',
  referencia_externa IS 'Referencia externa',
  estado_transaccion IS 'Estado de la transacción',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización');

CREATE INDEX idx_trans_pk ON TRANS(id_transaccion);
CREATE INDEX idx_trans_reg_rel ON TRANS(numero_registro_relativo);
CREATE INDEX idx_trans_cuenta_fecha ON TRANS(numero_cuenta, fecha_operacion);
CREATE INDEX idx_trans_contable_fecha ON TRANS(cuenta_contable, fecha_operacion);
CREATE INDEX idx_trans_cliente_fecha ON TRANS(id_cliente, fecha_operacion);
CREATE INDEX idx_trans_created_at ON TRANS(created_at);


COMMENT ON TABLE TRANS IS 'Archivo histórico de transacciones.';
LABEL ON TABLE TRANS IS 'Archivo histórico de transacciones.';

COMMENT ON COLUMN TRANS(
  ID_TRANSACCION IS 'Identificador de transacción',
  NUMERO_REGISTRO_RELATIVO IS 'Número de registro relativo',
  CODIGO_BANCO IS 'Código de banco',
  CODIGO_SUCURSAL IS 'Código de sucursal',
  CODIGO_MONEDA IS 'Código de moneda',
  CUENTA_CONTABLE IS 'Cuenta contable',
  NUMERO_CUENTA IS 'Número de cuenta',
  ID_CLIENTE IS 'Identificador del cliente',
  FECHA_OPERACION IS 'Fecha de operación',
  FECHA_VALOR IS 'Fecha valor',
  HORA_OPERACION IS 'Hora de operación',
  TIPO_MOVIMIENTO IS 'Tipo de movimiento',
  DEBITO_CREDITO IS 'Débito/Crédito',
  MONTO IS 'Monto de la transacción',
  SALDO_ANTERIOR IS 'Saldo anterior',
  SALDO_POSTERIOR IS 'Saldo posterior',
  CANAL_ORIGEN IS 'Canal de origen',
  TERMINAL_ORIGEN IS 'Terminal de origen',
  REFERENCIA_EXTERNA IS 'Referencia externa',
  ESTADO_TRANSACCION IS 'Estado de la transacción',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN TRANS(
  ID_TRANSACCION IS 'Identificador de transacción'  LABEL ... TEXT IS 'Identificador de transacción',
  NUMERO_REGISTRO_RELATIVO IS 'Número de registro relativo'  LABEL ... TEXT IS 'Número de registro relativo',
  CODIGO_BANCO IS 'Código de banco'  LABEL ... TEXT IS 'Código de banco',
  CODIGO_SUCURSAL IS 'Código de sucursal'  LABEL ... TEXT IS 'Código de sucursal',
  CODIGO_MONEDA IS 'Código de moneda'  LABEL ... TEXT IS 'Código de moneda',
  CUENTA_CONTABLE IS 'Cuenta contable'  LABEL ... TEXT IS 'Cuenta contable',
  NUMERO_CUENTA IS 'Número de cuenta'  LABEL ... TEXT IS 'Número de cuenta',
  ID_CLIENTE IS 'Identificador del cliente'  LABEL ... TEXT IS 'Identificador del cliente',
  FECHA_OPERACION IS 'Fecha de operación'  LABEL ... TEXT IS 'Fecha de operación',
  FECHA_VALOR IS 'Fecha valor'  LABEL ... TEXT IS 'Fecha valor',
  HORA_OPERACION IS 'Hora de operación'  LABEL ... TEXT IS 'Hora de operación',
  TIPO_MOVIMIENTO IS 'Tipo de movimiento'  LABEL ... TEXT IS 'Tipo de movimiento',
  DEBITO_CREDITO IS 'Débito/Crédito'  LABEL ... TEXT IS 'Débito/Crédito',
  MONTO IS 'Monto de la transacción'  LABEL ... TEXT IS 'Monto de la transacción',
  SALDO_ANTERIOR IS 'Saldo anterior'  LABEL ... TEXT IS 'Saldo anterior',
  SALDO_POSTERIOR IS 'Saldo posterior'  LABEL ... TEXT IS 'Saldo posterior',
  CANAL_ORIGEN IS 'Canal de origen'  LABEL ... TEXT IS 'Canal de origen',
  TERMINAL_ORIGEN IS 'Terminal de origen'  LABEL ... TEXT IS 'Terminal de origen',
  REFERENCIA_EXTERNA IS 'Referencia externa'  LABEL ... TEXT IS 'Referencia externa',
  ESTADO_TRANSACCION IS 'Estado de la transacción'  LABEL ... TEXT IS 'Estado de la transacción',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_trans_pk ON TRANS(id_transaccion);
CREATE INDEX idx_trans_reg_rel ON TRANS(numero_registro_relativo);
CREATE INDEX idx_trans_cuenta_fecha ON TRANS(numero_cuenta, fecha_operacion);
CREATE INDEX idx_trans_contable_fecha ON TRANS(cuenta_contable, fecha_operacion);
CREATE INDEX idx_trans_cliente_fecha ON TRANS(id_cliente, fecha_operacion);
CREATE INDEX idx_trans_created_at ON TRANS(created_at);

--==============================================================
-- TABLA: TRDSC
--==============================================================
-- Nombre de la Tabla: TRDSC
-- DESCRIPCIÓN: Descripciones adicionales de transacciones.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE TRDSC (
  NUMERO_REGISTRO_RELATIVO VARCHAR(30) FOR COLUMN NUMERO_REG,
  SECUENCIA INT FOR COLUMN SECUENCIA,
  TIPO_DESCRIPCION VARCHAR(20) FOR COLUMN TIPO_DESCR,
  TEXTO_DESCRIPCION VARCHAR(200) FOR COLUMN TEXTO_DESC,
  CODIGO_IDIOMA VARCHAR(5) FOR COLUMN CODIGO_IDI,
  FORMATO_SALIDA VARCHAR(20) FOR COLUMN FORMATO_SA,
  OBLIGATORIO CHAR(1) FOR COLUMN OBLIGATORI,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (numero_registro_relativo, secuencia)
) RCDFMT RTRDSC;

LABEL ON TABLE TRDSC IS 'Descripciones adicionales de transacciones.';
LABEL ON COLUMN TRDSC (numero_registro_relativo IS 'Número de registro relativo',
  secuencia IS 'Secuencia',
  tipo_descripcion IS 'Tipo de descripción',
  texto_descripcion IS 'Texto de la descripción',
  codigo_idioma IS 'Código de idioma',
  formato_salida IS 'Formato de salida',
  obligatorio IS 'Indicador obligatorio',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización');

CREATE INDEX idx_trdsc_pk ON TRDSC(numero_registro_relativo, secuencia);
CREATE INDEX idx_trdsc_tipo ON TRDSC(tipo_descripcion);
CREATE INDEX idx_trdsc_created_at ON TRDSC(created_at);


COMMENT ON TABLE TRDSC IS 'Descripciones adicionales de transacciones.';
LABEL ON TABLE TRDSC IS 'Descripciones adicionales de transacciones.';

COMMENT ON COLUMN TRDSC(
  NUMERO_REGISTRO_RELATIVO IS 'Número de registro relativo',
  SECUENCIA IS 'Secuencia',
  TIPO_DESCRIPCION IS 'Tipo de descripción',
  TEXTO_DESCRIPCION IS 'Texto de la descripción',
  CODIGO_IDIOMA IS 'Código de idioma',
  FORMATO_SALIDA IS 'Formato de salida',
  OBLIGATORIO IS 'Indicador obligatorio',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN TRDSC(
  NUMERO_REGISTRO_RELATIVO IS 'Número de registro relativo'  LABEL ... TEXT IS 'Número de registro relativo',
  SECUENCIA IS 'Secuencia'  LABEL ... TEXT IS 'Secuencia',
  TIPO_DESCRIPCION IS 'Tipo de descripción'  LABEL ... TEXT IS 'Tipo de descripción',
  TEXTO_DESCRIPCION IS 'Texto de la descripción'  LABEL ... TEXT IS 'Texto de la descripción',
  CODIGO_IDIOMA IS 'Código de idioma'  LABEL ... TEXT IS 'Código de idioma',
  FORMATO_SALIDA IS 'Formato de salida'  LABEL ... TEXT IS 'Formato de salida',
  OBLIGATORIO IS 'Indicador obligatorio'  LABEL ... TEXT IS 'Indicador obligatorio',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_trdsc_pk ON TRDSC(numero_registro_relativo, secuencia);
CREATE INDEX idx_trdsc_tipo ON TRDSC(tipo_descripcion);
CREATE INDEX idx_trdsc_created_at ON TRDSC(created_at);

--==============================================================
-- TABLA: TTRAN
--==============================================================
-- Nombre de la Tabla: TTRAN
-- DESCRIPCIÓN: Archivo Maestro de Transacciones del día.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE TTRAN (
  ID_TRANSACCION_DIA BIGINT FOR COLUMN ID_TRANSAC GENERATED ALWAYS AS IDENTITY,
  NUMERO_REGISTRO_RELATIVO VARCHAR(30) FOR COLUMN NUMERO_REG,
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_SUCURSAL VARCHAR(20) FOR COLUMN CODIGO_SUC,
  CODIGO_MONEDA VARCHAR(20) FOR COLUMN CODIGO_MON,
  CUENTA_CONTABLE VARCHAR(24) FOR COLUMN CUENTA_CON,
  NUMERO_CUENTA VARCHAR(24) FOR COLUMN NUMERO_CUE,
  ID_CLIENTE VARCHAR(30) FOR COLUMN ID_CLIENTE,
  FECHA DATE FOR COLUMN FECHA,
  FECHA_VALOR DATE FOR COLUMN FECHA_VALO,
  HORA_OPERACION VARCHAR(10) FOR COLUMN HORA_OPERA,
  TIPO_MOVIMIENTO VARCHAR(20) FOR COLUMN TIPO_MOVIM,
  DEBITO_CREDITO CHAR(1) FOR COLUMN DEBITO_CRE,
  MONTO DECIMAL(18,2) FOR COLUMN MONTO,
  SALDO_ANTERIOR DECIMAL(18,2) FOR COLUMN SALDO_ANTE,
  SALDO_POSTERIOR DECIMAL(18,2) FOR COLUMN SALDO_POST,
  CANAL_ORIGEN VARCHAR(20) FOR COLUMN CANAL_ORIG,
  TERMINAL_ORIGEN VARCHAR(30) FOR COLUMN TERMINAL_O,
  REFERENCIA_EXTERNA VARCHAR(40) FOR COLUMN REFERENCIA,
  ESTADO_TRANSACCION VARCHAR(20) FOR COLUMN ESTADO_TRA,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (id_transaccion_dia)
) RCDFMT RTTRAN;

LABEL ON TABLE TTRAN IS 'Archivo Maestro de Transacciones del día.';
LABEL ON COLUMN TTRAN (id_transaccion_dia IS 'Identificador de transacción del día',
  numero_registro_relativo IS 'Número de registro relativo',
  codigo_banco IS 'Código de banco',
  codigo_sucursal IS 'Código de sucursal',
  codigo_moneda IS 'Código de moneda',
  cuenta_contable IS 'Cuenta contable',
  numero_cuenta IS 'Número de cuenta',
  id_cliente IS 'Identificador del cliente',
  fecha IS 'Fecha',
  fecha_valor IS 'Fecha valor',
  hora_operacion IS 'Hora de operación',
  tipo_movimiento IS 'Tipo de movimiento',
  debito_credito IS 'Débito/Crédito',
  monto IS 'Monto de la transacción',
  saldo_anterior IS 'Saldo anterior',
  saldo_posterior IS 'Saldo posterior',
  canal_origen IS 'Canal de origen',
  terminal_origen IS 'Terminal de origen',
  referencia_externa IS 'Referencia externa',
  estado_transaccion IS 'Estado de la transacción',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización');

CREATE INDEX idx_ttran_pk ON TTRAN(id_transaccion_dia);
CREATE INDEX idx_ttran_reg_rel ON TTRAN(numero_registro_relativo);
CREATE INDEX idx_ttran_cuenta_fecha ON TTRAN(numero_cuenta, fecha);
CREATE INDEX idx_ttran_contable_fecha ON TTRAN(cuenta_contable, fecha);
CREATE INDEX idx_ttran_cliente_fecha ON TTRAN(id_cliente, fecha);
CREATE INDEX idx_ttran_fecha ON TTRAN(fecha);


COMMENT ON TABLE TTRAN IS 'Archivo Maestro de Transacciones del día.';
LABEL ON TABLE TTRAN IS 'Archivo Maestro de Transacciones del día.';

COMMENT ON COLUMN TTRAN(
  ID_TRANSACCION_DIA IS 'Identificador de transacción del día',
  NUMERO_REGISTRO_RELATIVO IS 'Número de registro relativo',
  CODIGO_BANCO IS 'Código de banco',
  CODIGO_SUCURSAL IS 'Código de sucursal',
  CODIGO_MONEDA IS 'Código de moneda',
  CUENTA_CONTABLE IS 'Cuenta contable',
  NUMERO_CUENTA IS 'Número de cuenta',
  ID_CLIENTE IS 'Identificador del cliente',
  FECHA IS 'Fecha',
  FECHA_VALOR IS 'Fecha valor',
  HORA_OPERACION IS 'Hora de operación',
  TIPO_MOVIMIENTO IS 'Tipo de movimiento',
  DEBITO_CREDITO IS 'Débito/Crédito',
  MONTO IS 'Monto de la transacción',
  SALDO_ANTERIOR IS 'Saldo anterior',
  SALDO_POSTERIOR IS 'Saldo posterior',
  CANAL_ORIGEN IS 'Canal de origen',
  TERMINAL_ORIGEN IS 'Terminal de origen',
  REFERENCIA_EXTERNA IS 'Referencia externa',
  ESTADO_TRANSACCION IS 'Estado de la transacción',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN TTRAN(
  ID_TRANSACCION_DIA IS 'Identificador de transacción del día'  LABEL ... TEXT IS 'Identificador de transacción del día',
  NUMERO_REGISTRO_RELATIVO IS 'Número de registro relativo'  LABEL ... TEXT IS 'Número de registro relativo',
  CODIGO_BANCO IS 'Código de banco'  LABEL ... TEXT IS 'Código de banco',
  CODIGO_SUCURSAL IS 'Código de sucursal'  LABEL ... TEXT IS 'Código de sucursal',
  CODIGO_MONEDA IS 'Código de moneda'  LABEL ... TEXT IS 'Código de moneda',
  CUENTA_CONTABLE IS 'Cuenta contable'  LABEL ... TEXT IS 'Cuenta contable',
  NUMERO_CUENTA IS 'Número de cuenta'  LABEL ... TEXT IS 'Número de cuenta',
  ID_CLIENTE IS 'Identificador del cliente'  LABEL ... TEXT IS 'Identificador del cliente',
  FECHA IS 'Fecha'  LABEL ... TEXT IS 'Fecha',
  FECHA_VALOR IS 'Fecha valor'  LABEL ... TEXT IS 'Fecha valor',
  HORA_OPERACION IS 'Hora de operación'  LABEL ... TEXT IS 'Hora de operación',
  TIPO_MOVIMIENTO IS 'Tipo de movimiento'  LABEL ... TEXT IS 'Tipo de movimiento',
  DEBITO_CREDITO IS 'Débito/Crédito'  LABEL ... TEXT IS 'Débito/Crédito',
  MONTO IS 'Monto de la transacción'  LABEL ... TEXT IS 'Monto de la transacción',
  SALDO_ANTERIOR IS 'Saldo anterior'  LABEL ... TEXT IS 'Saldo anterior',
  SALDO_POSTERIOR IS 'Saldo posterior'  LABEL ... TEXT IS 'Saldo posterior',
  CANAL_ORIGEN IS 'Canal de origen'  LABEL ... TEXT IS 'Canal de origen',
  TERMINAL_ORIGEN IS 'Terminal de origen'  LABEL ... TEXT IS 'Terminal de origen',
  REFERENCIA_EXTERNA IS 'Referencia externa'  LABEL ... TEXT IS 'Referencia externa',
  ESTADO_TRANSACCION IS 'Estado de la transacción'  LABEL ... TEXT IS 'Estado de la transacción',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_ttran_pk ON TTRAN(id_transaccion_dia);
CREATE INDEX idx_ttran_reg_rel ON TTRAN(numero_registro_relativo);
CREATE INDEX idx_ttran_cuenta_fecha ON TTRAN(numero_cuenta, fecha);
CREATE INDEX idx_ttran_contable_fecha ON TTRAN(cuenta_contable, fecha);
CREATE INDEX idx_ttran_cliente_fecha ON TTRAN(id_cliente, fecha);
CREATE INDEX idx_ttran_fecha ON TTRAN(fecha);

--==============================================================
-- TABLA: STPMT
--==============================================================
-- Nombre de la Tabla: STPMT
-- DESCRIPCIÓN: Órdenes de No Pago de Cheques.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE STPMT (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_SUCURSAL VARCHAR(20) FOR COLUMN CODIGO_SUC,
  CODIGO_MONEDA VARCHAR(20) FOR COLUMN CODIGO_MON,
  CUENTA_CONTABLE VARCHAR(24) FOR COLUMN CUENTA_CON,
  NUMERO_CUENTA VARCHAR(24) FOR COLUMN NUMERO_CUE,
  SECUENCIA INT FOR COLUMN SECUENCIA,
  FECHA_APERTURA DATE FOR COLUMN FECHA_APER,
  FECHA_ULTIMA_TRANSACCION DATE FOR COLUMN FECHA_ULTI,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  SALDO_DISPONIBLE DECIMAL(18,2) FOR COLUMN SALDO_DISP,
  LIMITE_SOBREGIRO DECIMAL(18,2) FOR COLUMN LIMITE_SOB,
  ESTADO_CUENTA VARCHAR(20) FOR COLUMN ESTADO_CUE,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable, numero_cuenta, secuencia)
) RCDFMT RSTPMT;

LABEL ON TABLE STPMT IS 'Órdenes de No Pago de Cheques.';
LABEL ON COLUMN STPMT (codigo_banco IS 'Banco',
  codigo_sucursal IS 'Sucursal',
  codigo_moneda IS 'Moneda',
  cuenta_contable IS 'Cuenta contable',
  numero_cuenta IS 'Número de cuenta',
  secuencia IS 'Secuencia',
  fecha_apertura IS 'Fecha de apertura',
  fecha_ultima_transaccion IS 'Fecha de última transacción',
  saldo_actual IS 'Saldo actual',
  saldo_disponible IS 'Saldo disponible',
  limite_sobregiro IS 'Límite de sobregiro',
  estado_cuenta IS 'Estado de la cuenta',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización');

CREATE INDEX idx_stpmt_pk ON STPMT(codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable, numero_cuenta, secuencia);
CREATE INDEX idx_stpmt_created_at ON STPMT(created_at);


COMMENT ON TABLE STPMT IS 'Órdenes de No Pago de Cheques.';
LABEL ON TABLE STPMT IS 'Órdenes de No Pago de Cheques.';

COMMENT ON COLUMN STPMT(
  CODIGO_BANCO IS 'Banco',
  CODIGO_SUCURSAL IS 'Sucursal',
  CODIGO_MONEDA IS 'Moneda',
  CUENTA_CONTABLE IS 'Cuenta contable',
  NUMERO_CUENTA IS 'Número de cuenta',
  SECUENCIA IS 'Secuencia',
  FECHA_APERTURA IS 'Fecha de apertura',
  FECHA_ULTIMA_TRANSACCION IS 'Fecha de última transacción',
  SALDO_ACTUAL IS 'Saldo actual',
  SALDO_DISPONIBLE IS 'Saldo disponible',
  LIMITE_SOBREGIRO IS 'Límite de sobregiro',
  ESTADO_CUENTA IS 'Estado de la cuenta',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN STPMT(
  CODIGO_BANCO IS 'Banco'  LABEL ... TEXT IS 'Banco',
  CODIGO_SUCURSAL IS 'Sucursal'  LABEL ... TEXT IS 'Sucursal',
  CODIGO_MONEDA IS 'Moneda'  LABEL ... TEXT IS 'Moneda',
  CUENTA_CONTABLE IS 'Cuenta contable'  LABEL ... TEXT IS 'Cuenta contable',
  NUMERO_CUENTA IS 'Número de cuenta'  LABEL ... TEXT IS 'Número de cuenta',
  SECUENCIA IS 'Secuencia'  LABEL ... TEXT IS 'Secuencia',
  FECHA_APERTURA IS 'Fecha de apertura'  LABEL ... TEXT IS 'Fecha de apertura',
  FECHA_ULTIMA_TRANSACCION IS 'Fecha de última transacción'  LABEL ... TEXT IS 'Fecha de última transacción',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  SALDO_DISPONIBLE IS 'Saldo disponible'  LABEL ... TEXT IS 'Saldo disponible',
  LIMITE_SOBREGIRO IS 'Límite de sobregiro'  LABEL ... TEXT IS 'Límite de sobregiro',
  ESTADO_CUENTA IS 'Estado de la cuenta'  LABEL ... TEXT IS 'Estado de la cuenta',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_stpmt_pk ON STPMT(codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable, numero_cuenta, secuencia);
CREATE INDEX idx_stpmt_created_at ON STPMT(created_at);

--==============================================================
-- TABLA: PBTRN
--==============================================================
-- Nombre de la Tabla: PBTRN
-- DESCRIPCIÓN: Transacciones de Libretas de Ahorro.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE PBTRN (
  NUMERO_CUENTA VARCHAR(24) FOR COLUMN NUMERO_CUE,
  FECHA DATE FOR COLUMN FECHA,
  HORA VARCHAR(10) FOR COLUMN HORA,
  FECHA_APERTURA DATE FOR COLUMN FECHA_APER,
  FECHA_ULTIMA_TRANSACCION DATE FOR COLUMN FECHA_ULTI,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  SALDO_DISPONIBLE DECIMAL(18,2) FOR COLUMN SALDO_DISP,
  LIMITE_SOBREGIRO DECIMAL(18,2) FOR COLUMN LIMITE_SOB,
  ESTADO_CUENTA VARCHAR(20) FOR COLUMN ESTADO_CUE,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (numero_cuenta, fecha, hora)
) RCDFMT RPBTRN;

LABEL ON TABLE PBTRN IS 'Transacciones de Libretas de Ahorro.';
LABEL ON COLUMN PBTRN (numero_cuenta IS 'Número de cuenta',
  fecha IS 'Fecha',
  hora IS 'Hora',
  fecha_apertura IS 'Fecha de apertura',
  fecha_ultima_transaccion IS 'Fecha de última transacción',
  saldo_actual IS 'Saldo actual',
  saldo_disponible IS 'Saldo disponible',
  limite_sobregiro IS 'Límite de sobregiro',
  estado_cuenta IS 'Estado de la cuenta',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización');

CREATE INDEX idx_pbtrn_pk ON PBTRN(numero_cuenta, fecha, hora);
CREATE INDEX idx_pbtrn_fecha ON PBTRN(fecha);


COMMENT ON TABLE PBTRN IS 'Transacciones de Libretas de Ahorro.';
LABEL ON TABLE PBTRN IS 'Transacciones de Libretas de Ahorro.';

COMMENT ON COLUMN PBTRN(
  NUMERO_CUENTA IS 'Número de cuenta',
  FECHA IS 'Fecha',
  HORA IS 'Hora',
  FECHA_APERTURA IS 'Fecha de apertura',
  FECHA_ULTIMA_TRANSACCION IS 'Fecha de última transacción',
  SALDO_ACTUAL IS 'Saldo actual',
  SALDO_DISPONIBLE IS 'Saldo disponible',
  LIMITE_SOBREGIRO IS 'Límite de sobregiro',
  ESTADO_CUENTA IS 'Estado de la cuenta',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN PBTRN(
  NUMERO_CUENTA IS 'Número de cuenta'  LABEL ... TEXT IS 'Número de cuenta',
  FECHA IS 'Fecha'  LABEL ... TEXT IS 'Fecha',
  HORA IS 'Hora'  LABEL ... TEXT IS 'Hora',
  FECHA_APERTURA IS 'Fecha de apertura'  LABEL ... TEXT IS 'Fecha de apertura',
  FECHA_ULTIMA_TRANSACCION IS 'Fecha de última transacción'  LABEL ... TEXT IS 'Fecha de última transacción',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  SALDO_DISPONIBLE IS 'Saldo disponible'  LABEL ... TEXT IS 'Saldo disponible',
  LIMITE_SOBREGIRO IS 'Límite de sobregiro'  LABEL ... TEXT IS 'Límite de sobregiro',
  ESTADO_CUENTA IS 'Estado de la cuenta'  LABEL ... TEXT IS 'Estado de la cuenta',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_pbtrn_pk ON PBTRN(numero_cuenta, fecha, hora);
CREATE INDEX idx_pbtrn_fecha ON PBTRN(fecha);

--==============================================================
-- TABLA: RCLNB
--==============================================================
-- Nombre de la Tabla: RCLNB
-- DESCRIPCIÓN: Transacciones de Cuentas Reconciliables.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE RCLNB (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_SUCURSAL VARCHAR(20) FOR COLUMN CODIGO_SUC,
  CODIGO_MONEDA VARCHAR(20) FOR COLUMN CODIGO_MON,
  CUENTA_CONTABLE VARCHAR(24) FOR COLUMN CUENTA_CON,
  NUMERO_CUENTA VARCHAR(24) FOR COLUMN NUMERO_CUE,
  FECHA DATE FOR COLUMN FECHA,
  FECHA_APERTURA DATE FOR COLUMN FECHA_APER,
  FECHA_ULTIMA_TRANSACCION DATE FOR COLUMN FECHA_ULTI,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  SALDO_DISPONIBLE DECIMAL(18,2) FOR COLUMN SALDO_DISP,
  LIMITE_SOBREGIRO DECIMAL(18,2) FOR COLUMN LIMITE_SOB,
  ESTADO_CUENTA VARCHAR(20) FOR COLUMN ESTADO_CUE,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable, numero_cuenta, fecha)
) RCDFMT RRCLNB;

LABEL ON TABLE RCLNB IS 'Transacciones de Cuentas Reconciliables.';
LABEL ON COLUMN RCLNB (codigo_banco IS 'Banco',
  codigo_sucursal IS 'Sucursal',
  codigo_moneda IS 'Moneda',
  cuenta_contable IS 'Cuenta contable',
  numero_cuenta IS 'Número de cuenta',
  fecha IS 'Fecha',
  fecha_apertura IS 'Fecha de apertura',
  fecha_ultima_transaccion IS 'Fecha de última transacción',
  saldo_actual IS 'Saldo actual',
  saldo_disponible IS 'Saldo disponible',
  limite_sobregiro IS 'Límite de sobregiro',
  estado_cuenta IS 'Estado de la cuenta',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización');

CREATE INDEX idx_rclnb_pk ON RCLNB(codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable, numero_cuenta, fecha);
CREATE INDEX idx_rclnb_fecha ON RCLNB(fecha);


COMMENT ON TABLE RCLNB IS 'Transacciones de Cuentas Reconciliables.';
LABEL ON TABLE RCLNB IS 'Transacciones de Cuentas Reconciliables.';

COMMENT ON COLUMN RCLNB(
  CODIGO_BANCO IS 'Banco',
  CODIGO_SUCURSAL IS 'Sucursal',
  CODIGO_MONEDA IS 'Moneda',
  CUENTA_CONTABLE IS 'Cuenta contable',
  NUMERO_CUENTA IS 'Número de cuenta',
  FECHA IS 'Fecha',
  FECHA_APERTURA IS 'Fecha de apertura',
  FECHA_ULTIMA_TRANSACCION IS 'Fecha de última transacción',
  SALDO_ACTUAL IS 'Saldo actual',
  SALDO_DISPONIBLE IS 'Saldo disponible',
  LIMITE_SOBREGIRO IS 'Límite de sobregiro',
  ESTADO_CUENTA IS 'Estado de la cuenta',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN RCLNB(
  CODIGO_BANCO IS 'Banco'  LABEL ... TEXT IS 'Banco',
  CODIGO_SUCURSAL IS 'Sucursal'  LABEL ... TEXT IS 'Sucursal',
  CODIGO_MONEDA IS 'Moneda'  LABEL ... TEXT IS 'Moneda',
  CUENTA_CONTABLE IS 'Cuenta contable'  LABEL ... TEXT IS 'Cuenta contable',
  NUMERO_CUENTA IS 'Número de cuenta'  LABEL ... TEXT IS 'Número de cuenta',
  FECHA IS 'Fecha'  LABEL ... TEXT IS 'Fecha',
  FECHA_APERTURA IS 'Fecha de apertura'  LABEL ... TEXT IS 'Fecha de apertura',
  FECHA_ULTIMA_TRANSACCION IS 'Fecha de última transacción'  LABEL ... TEXT IS 'Fecha de última transacción',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  SALDO_DISPONIBLE IS 'Saldo disponible'  LABEL ... TEXT IS 'Saldo disponible',
  LIMITE_SOBREGIRO IS 'Límite de sobregiro'  LABEL ... TEXT IS 'Límite de sobregiro',
  ESTADO_CUENTA IS 'Estado de la cuenta'  LABEL ... TEXT IS 'Estado de la cuenta',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_rclnb_pk ON RCLNB(codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable, numero_cuenta, fecha);
CREATE INDEX idx_rclnb_fecha ON RCLNB(fecha);

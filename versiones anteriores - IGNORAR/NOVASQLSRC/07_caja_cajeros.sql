--==============================================================
-- TABLA: TLMST
--==============================================================
-- Nombre de la Tabla: TLMST
-- DESCRIPCIÓN: Maestro de Cajeros.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE TLMST (
  CODIGO_DE_CAJERO VARCHAR(20) FOR COLUMN CODIGO_DE_,
  CODIGO_MONEDA VARCHAR(20) FOR COLUMN CODIGO_MON,
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
  PRIMARY KEY (codigo_de_cajero, codigo_moneda)
) RCDFMT RTLMST;

LABEL ON TABLE TLMST IS 'Maestro de Cajeros.';
LABEL ON COLUMN TLMST (codigo_de_cajero IS 'Código de Cajero',
  codigo_moneda IS 'Moneda',
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

CREATE INDEX idx_tlmst_pk ON TLMST(codigo_de_cajero, codigo_moneda);
CREATE INDEX idx_tlmst_created_at ON TLMST(created_at);


COMMENT ON TABLE TLMST IS 'Maestro de Cajeros.';
LABEL ON TABLE TLMST IS 'Maestro de Cajeros.';

COMMENT ON COLUMN TLMST(
  CODIGO_DE_CAJERO IS 'Código de Cajero',
  CODIGO_MONEDA IS 'Moneda',
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

LABEL ON COLUMN TLMST(
  CODIGO_DE_CAJERO IS 'Código de Cajero'  LABEL ... TEXT IS 'Código de Cajero',
  CODIGO_MONEDA IS 'Moneda'  LABEL ... TEXT IS 'Moneda',
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

CREATE INDEX idx_tlmst_pk ON TLMST(codigo_de_cajero, codigo_moneda);
CREATE INDEX idx_tlmst_created_at ON TLMST(created_at);

--==============================================================
-- TABLA: TDRCR
--==============================================================
-- Nombre de la Tabla: TDRCR
-- DESCRIPCIÓN: Maestro de Transacciones de Cajero.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE TDRCR (
  CODIGO_DE_TRANSACCION VARCHAR(20) FOR COLUMN CODIGO_DE_,
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
  PRIMARY KEY (codigo_de_transaccion)
) RCDFMT RTDRCR;

LABEL ON TABLE TDRCR IS 'Maestro de Transacciones de Cajero.';
LABEL ON COLUMN TDRCR (codigo_de_transaccion IS 'Código de Transacción',
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

CREATE INDEX idx_tdrcr_pk ON TDRCR(codigo_de_transaccion);
CREATE INDEX idx_tdrcr_created_at ON TDRCR(created_at);


COMMENT ON TABLE TDRCR IS 'Maestro de Transacciones de Cajero.';
LABEL ON TABLE TDRCR IS 'Maestro de Transacciones de Cajero.';

COMMENT ON COLUMN TDRCR(
  CODIGO_DE_TRANSACCION IS 'Código de Transacción',
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

LABEL ON COLUMN TDRCR(
  CODIGO_DE_TRANSACCION IS 'Código de Transacción'  LABEL ... TEXT IS 'Código de Transacción',
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

CREATE INDEX idx_tdrcr_pk ON TDRCR(codigo_de_transaccion);
CREATE INDEX idx_tdrcr_created_at ON TDRCR(created_at);

--==============================================================
-- TABLA: AUDIT
--==============================================================
-- Nombre de la Tabla: AUDIT
-- DESCRIPCIÓN: Detalle diario de transacciones de caja.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE AUDIT (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_SUCURSAL VARCHAR(20) FOR COLUMN CODIGO_SUC,
  CODIGO_CAJERO VARCHAR(20) FOR COLUMN CODIGO_CAJ,
  CODIGO_MONEDA VARCHAR(20) FOR COLUMN CODIGO_MON,
  REFERENCIA VARCHAR(50) FOR COLUMN REFERENCIA,
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
  PRIMARY KEY (codigo_banco, codigo_sucursal, codigo_cajero, codigo_moneda, referencia)
) RCDFMT RAUDIT;

LABEL ON TABLE AUDIT IS 'Detalle diario de transacciones de caja.';
LABEL ON COLUMN AUDIT (codigo_banco IS 'Banco',
  codigo_sucursal IS 'Sucursal',
  codigo_cajero IS 'Cajero',
  codigo_moneda IS 'Moneda',
  referencia IS 'Referencia',
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

CREATE INDEX idx_audit_pk ON AUDIT(codigo_banco, codigo_sucursal, codigo_cajero, codigo_moneda, referencia);
CREATE INDEX idx_audit_created_at ON AUDIT(created_at);


COMMENT ON TABLE AUDIT IS 'Detalle diario de transacciones de caja.';
LABEL ON TABLE AUDIT IS 'Detalle diario de transacciones de caja.';

COMMENT ON COLUMN AUDIT(
  CODIGO_BANCO IS 'Banco',
  CODIGO_SUCURSAL IS 'Sucursal',
  CODIGO_CAJERO IS 'Cajero',
  CODIGO_MONEDA IS 'Moneda',
  REFERENCIA IS 'Referencia',
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

LABEL ON COLUMN AUDIT(
  CODIGO_BANCO IS 'Banco'  LABEL ... TEXT IS 'Banco',
  CODIGO_SUCURSAL IS 'Sucursal'  LABEL ... TEXT IS 'Sucursal',
  CODIGO_CAJERO IS 'Cajero'  LABEL ... TEXT IS 'Cajero',
  CODIGO_MONEDA IS 'Moneda'  LABEL ... TEXT IS 'Moneda',
  REFERENCIA IS 'Referencia'  LABEL ... TEXT IS 'Referencia',
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

CREATE INDEX idx_audit_pk ON AUDIT(codigo_banco, codigo_sucursal, codigo_cajero, codigo_moneda, referencia);
CREATE INDEX idx_audit_created_at ON AUDIT(created_at);

--==============================================================
-- TABLA: POFED
--==============================================================
-- Nombre de la Tabla: POFED
-- DESCRIPCIÓN: Ordenes de Pago.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE POFED (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_MONEDA VARCHAR(20) FOR COLUMN CODIGO_MON,
  ID_CLIENTE VARCHAR(30) FOR COLUMN ID_CLIENTE,
  TIPO_REGISTRO VARCHAR(20) FOR COLUMN TIPO_REGIS,
  NUMERO_CUENTA VARCHAR(24) FOR COLUMN NUMERO_CUE,
  NUMERO_REFERENCIA VARCHAR(30) FOR COLUMN NUMERO_REF,
  FECHA_OPERACION DATE FOR COLUMN FECHA_OPER,
  MONTO DECIMAL(18,2) FOR COLUMN MONTO,
  BENEFICIARIO VARCHAR(80) FOR COLUMN BENEFICIAR,
  BANCO_DESTINO VARCHAR(80) FOR COLUMN BANCO_DEST,
  CANAL_PAGO VARCHAR(20) FOR COLUMN CANAL_PAGO,
  ESTADO_PAGO VARCHAR(20) FOR COLUMN ESTADO_PAG,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (codigo_banco, codigo_moneda)
) RCDFMT RPOFED;

LABEL ON TABLE POFED IS 'Ordenes de Pago.';
LABEL ON COLUMN POFED (
  codigo_banco IS 'Código de Banco',
  codigo_moneda IS 'Código de Moneda',
  id_cliente IS 'ID Cliente',
  tipo_registro IS 'Tipo de Registro',
  numero_cuenta IS 'Número de Cuenta',
  numero_referencia IS 'Número de Referencia',
  fecha_operacion IS 'Fecha de operación',
  monto IS 'Monto',
  beneficiario IS 'Beneficiario',
  banco_destino IS 'Banco de destino',
  canal_pago IS 'Canal de pago',
  estado_pago IS 'Estado de pago',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_pofed_pk ON POFED(codigo_banco, codigo_moneda);
CREATE INDEX idx_pofed_created_at ON POFED(created_at);


COMMENT ON TABLE POFED IS 'Ordenes de Pago.';
LABEL ON TABLE POFED IS 'Ordenes de Pago.';

COMMENT ON COLUMN POFED(
  CODIGO_BANCO IS 'Código de Banco',
  CODIGO_MONEDA IS 'Código de Moneda',
  ID_CLIENTE IS 'ID Cliente',
  TIPO_REGISTRO IS 'Tipo de Registro',
  NUMERO_CUENTA IS 'Número de Cuenta',
  NUMERO_REFERENCIA IS 'Número de Referencia',
  FECHA_OPERACION IS 'Fecha de operación',
  MONTO IS 'Monto',
  BENEFICIARIO IS 'Beneficiario',
  BANCO_DESTINO IS 'Banco de destino',
  CANAL_PAGO IS 'Canal de pago',
  ESTADO_PAGO IS 'Estado de pago',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN POFED(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  CODIGO_MONEDA IS 'Código de Moneda'  LABEL ... TEXT IS 'Código de Moneda',
  ID_CLIENTE IS 'ID Cliente'  LABEL ... TEXT IS 'ID Cliente',
  TIPO_REGISTRO IS 'Tipo de Registro'  LABEL ... TEXT IS 'Tipo de Registro',
  NUMERO_CUENTA IS 'Número de Cuenta'  LABEL ... TEXT IS 'Número de Cuenta',
  NUMERO_REFERENCIA IS 'Número de Referencia'  LABEL ... TEXT IS 'Número de Referencia',
  FECHA_OPERACION IS 'Fecha de operación'  LABEL ... TEXT IS 'Fecha de operación',
  MONTO IS 'Monto'  LABEL ... TEXT IS 'Monto',
  BENEFICIARIO IS 'Beneficiario'  LABEL ... TEXT IS 'Beneficiario',
  BANCO_DESTINO IS 'Banco de destino'  LABEL ... TEXT IS 'Banco de destino',
  CANAL_PAGO IS 'Canal de pago'  LABEL ... TEXT IS 'Canal de pago',
  ESTADO_PAGO IS 'Estado de pago'  LABEL ... TEXT IS 'Estado de pago',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_pofed_pk ON POFED(codigo_banco, codigo_moneda);
CREATE INDEX idx_pofed_created_at ON POFED(created_at);

--==============================================================
-- TABLA: POSWF
--==============================================================
-- Nombre de la Tabla: POSWF
-- DESCRIPCIÓN: Ordenes de Pago vía Swift.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE POSWF (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_MONEDA VARCHAR(20) FOR COLUMN CODIGO_MON,
  ID_CLIENTE VARCHAR(30) FOR COLUMN ID_CLIENTE,
  TIPO_REGISTRO VARCHAR(20) FOR COLUMN TIPO_REGIS,
  NUMERO_CUENTA VARCHAR(24) FOR COLUMN NUMERO_CUE,
  NUMERO_REFERENCIA VARCHAR(30) FOR COLUMN NUMERO_REF,
  MONTO DECIMAL(18,2) FOR COLUMN MONTO,
  FECHA_OPERACION DATE FOR COLUMN FECHA_OPER,
  BENEFICIARIO VARCHAR(80) FOR COLUMN BENEFICIAR,
  BANCO_DESTINO VARCHAR(80) FOR COLUMN BANCO_DEST,
  CANAL_PAGO VARCHAR(20) FOR COLUMN CANAL_PAGO,
  ESTADO_PAGO VARCHAR(20) FOR COLUMN ESTADO_PAG,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (codigo_banco, codigo_moneda)
) RCDFMT RPOSWF;

LABEL ON TABLE POSWF IS 'Ordenes de Pago vía Swift.';
LABEL ON COLUMN POSWF (
  codigo_banco IS 'Código de Banco',
  codigo_moneda IS 'Código de Moneda',
  id_cliente IS 'ID Cliente',
  tipo_registro IS 'Tipo de Registro',
  numero_cuenta IS 'Número de Cuenta',
  numero_referencia IS 'Número de Referencia',
  monto IS 'Monto',
  fecha_operacion IS 'Fecha de operación',
  beneficiario IS 'Beneficiario',
  banco_destino IS 'Banco de destino',
  canal_pago IS 'Canal de pago',
  estado_pago IS 'Estado de pago',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_poswf_pk ON POSWF(codigo_banco, codigo_moneda);
CREATE INDEX idx_poswf_created_at ON POSWF(created_at);


COMMENT ON TABLE POSWF IS 'Ordenes de Pago vía Swift.';
LABEL ON TABLE POSWF IS 'Ordenes de Pago vía Swift.';

COMMENT ON COLUMN POSWF(
  CODIGO_BANCO IS 'Código de Banco',
  CODIGO_MONEDA IS 'Código de Moneda',
  ID_CLIENTE IS 'ID Cliente',
  TIPO_REGISTRO IS 'Tipo de Registro',
  NUMERO_CUENTA IS 'Número de Cuenta',
  NUMERO_REFERENCIA IS 'Número de Referencia',
  MONTO IS 'Monto',
  FECHA_OPERACION IS 'Fecha de operación',
  BENEFICIARIO IS 'Beneficiario',
  BANCO_DESTINO IS 'Banco de destino',
  CANAL_PAGO IS 'Canal de pago',
  ESTADO_PAGO IS 'Estado de pago',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN POSWF(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  CODIGO_MONEDA IS 'Código de Moneda'  LABEL ... TEXT IS 'Código de Moneda',
  ID_CLIENTE IS 'ID Cliente'  LABEL ... TEXT IS 'ID Cliente',
  TIPO_REGISTRO IS 'Tipo de Registro'  LABEL ... TEXT IS 'Tipo de Registro',
  NUMERO_CUENTA IS 'Número de Cuenta'  LABEL ... TEXT IS 'Número de Cuenta',
  NUMERO_REFERENCIA IS 'Número de Referencia'  LABEL ... TEXT IS 'Número de Referencia',
  MONTO IS 'Monto'  LABEL ... TEXT IS 'Monto',
  FECHA_OPERACION IS 'Fecha de operación'  LABEL ... TEXT IS 'Fecha de operación',
  BENEFICIARIO IS 'Beneficiario'  LABEL ... TEXT IS 'Beneficiario',
  BANCO_DESTINO IS 'Banco de destino'  LABEL ... TEXT IS 'Banco de destino',
  CANAL_PAGO IS 'Canal de pago'  LABEL ... TEXT IS 'Canal de pago',
  ESTADO_PAGO IS 'Estado de pago'  LABEL ... TEXT IS 'Estado de pago',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_poswf_pk ON POSWF(codigo_banco, codigo_moneda);
CREATE INDEX idx_poswf_created_at ON POSWF(created_at);

--==============================================================
-- TABLA: POTLX
--==============================================================
-- Nombre de la Tabla: POTLX
-- DESCRIPCIÓN: Ordenes de Pago vía Télex.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE POTLX (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_MONEDA VARCHAR(20) FOR COLUMN CODIGO_MON,
  ID_CLIENTE VARCHAR(30) FOR COLUMN ID_CLIENTE,
  TIPO_REGISTRO VARCHAR(20) FOR COLUMN TIPO_REGIS,
  NUMERO_CUENTA VARCHAR(24) FOR COLUMN NUMERO_CUE,
  NUMERO_REFERENCIA VARCHAR(30) FOR COLUMN NUMERO_REF,
  FECHA_OPERACION DATE FOR COLUMN FECHA_OPER,
  MONTO DECIMAL(18,2) FOR COLUMN MONTO,
  BENEFICIARIO VARCHAR(80) FOR COLUMN BENEFICIAR,
  BANCO_DESTINO VARCHAR(80) FOR COLUMN BANCO_DEST,
  CANAL_PAGO VARCHAR(20) FOR COLUMN CANAL_PAGO,
  ESTADO_PAGO VARCHAR(20) FOR COLUMN ESTADO_PAG,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (codigo_banco, codigo_moneda)
) RCDFMT RPOTLX;

LABEL ON TABLE POTLX IS 'Ordenes de Pago vía Télex.';
LABEL ON COLUMN POTLX (
  codigo_banco IS 'Código de Banco',
  codigo_moneda IS 'Código de Moneda',
  id_cliente IS 'ID Cliente',
  tipo_registro IS 'Tipo de Registro',
  numero_cuenta IS 'Número de Cuenta',
  numero_referencia IS 'Número de Referencia',
  fecha_operacion IS 'Fecha de operación',
  monto IS 'Monto',
  beneficiario IS 'Beneficiario',
  banco_destino IS 'Banco de destino',
  canal_pago IS 'Canal de pago',
  estado_pago IS 'Estado de pago',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_potlx_pk ON POTLX(codigo_banco, codigo_moneda);
CREATE INDEX idx_potlx_created_at ON POTLX(created_at);


COMMENT ON TABLE POTLX IS 'Ordenes de Pago vía Télex.';
LABEL ON TABLE POTLX IS 'Ordenes de Pago vía Télex.';

COMMENT ON COLUMN POTLX(
  CODIGO_BANCO IS 'Código de Banco',
  CODIGO_MONEDA IS 'Código de Moneda',
  ID_CLIENTE IS 'ID Cliente',
  TIPO_REGISTRO IS 'Tipo de Registro',
  NUMERO_CUENTA IS 'Número de Cuenta',
  NUMERO_REFERENCIA IS 'Número de Referencia',
  FECHA_OPERACION IS 'Fecha de operación',
  MONTO IS 'Monto',
  BENEFICIARIO IS 'Beneficiario',
  BANCO_DESTINO IS 'Banco de destino',
  CANAL_PAGO IS 'Canal de pago',
  ESTADO_PAGO IS 'Estado de pago',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN POTLX(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  CODIGO_MONEDA IS 'Código de Moneda'  LABEL ... TEXT IS 'Código de Moneda',
  ID_CLIENTE IS 'ID Cliente'  LABEL ... TEXT IS 'ID Cliente',
  TIPO_REGISTRO IS 'Tipo de Registro'  LABEL ... TEXT IS 'Tipo de Registro',
  NUMERO_CUENTA IS 'Número de Cuenta'  LABEL ... TEXT IS 'Número de Cuenta',
  NUMERO_REFERENCIA IS 'Número de Referencia'  LABEL ... TEXT IS 'Número de Referencia',
  FECHA_OPERACION IS 'Fecha de operación'  LABEL ... TEXT IS 'Fecha de operación',
  MONTO IS 'Monto'  LABEL ... TEXT IS 'Monto',
  BENEFICIARIO IS 'Beneficiario'  LABEL ... TEXT IS 'Beneficiario',
  BANCO_DESTINO IS 'Banco de destino'  LABEL ... TEXT IS 'Banco de destino',
  CANAL_PAGO IS 'Canal de pago'  LABEL ... TEXT IS 'Canal de pago',
  ESTADO_PAGO IS 'Estado de pago'  LABEL ... TEXT IS 'Estado de pago',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_potlx_pk ON POTLX(codigo_banco, codigo_moneda);
CREATE INDEX idx_potlx_created_at ON POTLX(created_at);

--==============================================================
-- TABLA: SWITF
--==============================================================
-- Nombre de la Tabla: SWITF
-- DESCRIPCIÓN: Histórico de Pagos y Recibidos vía Swift.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE SWITF (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  NUMERO_REFERENCIA VARCHAR(30) FOR COLUMN NUMERO_REF,
  FORMATO_SWIFT VARCHAR(50) FOR COLUMN FORMATO_SW,
  FECHA_OPERACION DATE FOR COLUMN FECHA_OPER,
  MONTO DECIMAL(18,2) FOR COLUMN MONTO,
  BENEFICIARIO VARCHAR(80) FOR COLUMN BENEFICIAR,
  BANCO_DESTINO VARCHAR(80) FOR COLUMN BANCO_DEST,
  CANAL_PAGO VARCHAR(20) FOR COLUMN CANAL_PAGO,
  ESTADO_PAGO VARCHAR(20) FOR COLUMN ESTADO_PAG,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (codigo_banco, numero_referencia)
) RCDFMT RSWITF;

LABEL ON TABLE SWITF IS 'Histórico de Pagos y Recibidos vía Swift.';
LABEL ON COLUMN SWITF (
  codigo_banco IS 'Código de Banco',
  numero_referencia IS 'Número de Referencia',
  formato_swift IS 'Formato Swift',
  fecha_operacion IS 'Fecha de operación',
  monto IS 'Monto',
  beneficiario IS 'Beneficiario',
  banco_destino IS 'Banco de destino',
  canal_pago IS 'Canal de pago',
  estado_pago IS 'Estado de pago',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_switf_pk ON SWITF(codigo_banco, numero_referencia);
CREATE INDEX idx_switf_created_at ON SWITF(created_at);


COMMENT ON TABLE SWITF IS 'Histórico de Pagos y Recibidos vía Swift.';
LABEL ON TABLE SWITF IS 'Histórico de Pagos y Recibidos vía Swift.';

COMMENT ON COLUMN SWITF(
  CODIGO_BANCO IS 'Código de Banco',
  NUMERO_REFERENCIA IS 'Número de Referencia',
  FORMATO_SWIFT IS 'Formato Swift',
  FECHA_OPERACION IS 'Fecha de operación',
  MONTO IS 'Monto',
  BENEFICIARIO IS 'Beneficiario',
  BANCO_DESTINO IS 'Banco de destino',
  CANAL_PAGO IS 'Canal de pago',
  ESTADO_PAGO IS 'Estado de pago',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN SWITF(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  NUMERO_REFERENCIA IS 'Número de Referencia'  LABEL ... TEXT IS 'Número de Referencia',
  FORMATO_SWIFT IS 'Formato Swift'  LABEL ... TEXT IS 'Formato Swift',
  FECHA_OPERACION IS 'Fecha de operación'  LABEL ... TEXT IS 'Fecha de operación',
  MONTO IS 'Monto'  LABEL ... TEXT IS 'Monto',
  BENEFICIARIO IS 'Beneficiario'  LABEL ... TEXT IS 'Beneficiario',
  BANCO_DESTINO IS 'Banco de destino'  LABEL ... TEXT IS 'Banco de destino',
  CANAL_PAGO IS 'Canal de pago'  LABEL ... TEXT IS 'Canal de pago',
  ESTADO_PAGO IS 'Estado de pago'  LABEL ... TEXT IS 'Estado de pago',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_switf_pk ON SWITF(codigo_banco, numero_referencia);
CREATE INDEX idx_switf_created_at ON SWITF(created_at);

--==============================================================
-- TABLA: DPMST
--==============================================================
-- Nombre de la Tabla: DPMST
-- DESCRIPCIÓN: Maestro de Documentos de Pago.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE DPMST (
  NUMERO_DOCUMENTO VARCHAR(30) FOR COLUMN NUMERO_DOC,
  CODIGO_DOCUMENTO VARCHAR(30) FOR COLUMN CODIGO_DOC,
  FECHA_EMISION DATE FOR COLUMN FECHA_EMIS,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  MONTO DECIMAL(18,2) FOR COLUMN MONTO,
  ESTADO_DOCUMENTO VARCHAR(20) FOR COLUMN ESTADO_DOC,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (numero_documento)
) RCDFMT RDPMST;

LABEL ON TABLE DPMST IS 'Maestro de Documentos de Pago.';
LABEL ON COLUMN DPMST (
  numero_documento IS 'Número de Documento',
  codigo_documento IS 'Código de Documento',
  fecha_emision IS 'Fecha de emisión',
  fecha_vencimiento IS 'Fecha de vencimiento',
  monto IS 'Monto',
  estado_documento IS 'Estado del documento',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_dpmst_pk ON DPMST(numero_documento);
CREATE INDEX idx_dpmst_created_at ON DPMST(created_at);


COMMENT ON TABLE DPMST IS 'Maestro de Documentos de Pago.';
LABEL ON TABLE DPMST IS 'Maestro de Documentos de Pago.';

COMMENT ON COLUMN DPMST(
  NUMERO_DOCUMENTO IS 'Número de Documento',
  CODIGO_DOCUMENTO IS 'Código de Documento',
  FECHA_EMISION IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  MONTO IS 'Monto',
  ESTADO_DOCUMENTO IS 'Estado del documento',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN DPMST(
  NUMERO_DOCUMENTO IS 'Número de Documento'  LABEL ... TEXT IS 'Número de Documento',
  CODIGO_DOCUMENTO IS 'Código de Documento'  LABEL ... TEXT IS 'Código de Documento',
  FECHA_EMISION IS 'Fecha de emisión'  LABEL ... TEXT IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  MONTO IS 'Monto'  LABEL ... TEXT IS 'Monto',
  ESTADO_DOCUMENTO IS 'Estado del documento'  LABEL ... TEXT IS 'Estado del documento',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_dpmst_pk ON DPMST(numero_documento);
CREATE INDEX idx_dpmst_created_at ON DPMST(created_at);

--==============================================================
-- TABLA: DPDTL
--==============================================================
-- Nombre de la Tabla: DPDTL
-- DESCRIPCIÓN: Detalle de Documentos de Pago.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE DPDTL (
  NUMERO_DOCUMENTO VARCHAR(30) FOR COLUMN NUMERO_DOC,
  LINEA INT FOR COLUMN LINEA,
  CUENTA_CONTABLE VARCHAR(30) FOR COLUMN CUENTA_CON,
  MONTO DECIMAL(18,2) FOR COLUMN MONTO,
  DESCRIPCION VARCHAR(120) FOR COLUMN DESCRIPCIO,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (numero_documento, linea)
) RCDFMT RDPDTL;

LABEL ON TABLE DPDTL IS 'Detalle de Documentos de Pago.';
LABEL ON COLUMN DPDTL (
  numero_documento IS 'Número de Documento',
  linea IS 'Línea',
  cuenta_contable IS 'Cuenta Contable',
  monto IS 'Monto',
  descripcion IS 'Descripción',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_dpdtl_pk ON DPDTL(numero_documento, linea);
CREATE INDEX idx_dpdtl_created_at ON DPDTL(created_at);


COMMENT ON TABLE DPDTL IS 'Detalle de Documentos de Pago.';
LABEL ON TABLE DPDTL IS 'Detalle de Documentos de Pago.';

COMMENT ON COLUMN DPDTL(
  NUMERO_DOCUMENTO IS 'Número de Documento',
  LINEA IS 'Línea',
  CUENTA_CONTABLE IS 'Cuenta Contable',
  MONTO IS 'Monto',
  DESCRIPCION IS 'Descripción',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN DPDTL(
  NUMERO_DOCUMENTO IS 'Número de Documento'  LABEL ... TEXT IS 'Número de Documento',
  LINEA IS 'Línea'  LABEL ... TEXT IS 'Línea',
  CUENTA_CONTABLE IS 'Cuenta Contable'  LABEL ... TEXT IS 'Cuenta Contable',
  MONTO IS 'Monto'  LABEL ... TEXT IS 'Monto',
  DESCRIPCION IS 'Descripción'  LABEL ... TEXT IS 'Descripción',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_dpdtl_pk ON DPDTL(numero_documento, linea);
CREATE INDEX idx_dpdtl_created_at ON DPDTL(created_at);

--==============================================================
-- TABLA: IFMST
--==============================================================
-- Nombre de la Tabla: IFMST
-- DESCRIPCIÓN: Maestro de Instrumentos Financieros.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE IFMST (
  CODIGO_INSTRUMENTO VARCHAR(30) FOR COLUMN CODIGO_INS,
  TIPO_INSTRUMENTO VARCHAR(20) FOR COLUMN TIPO_INSTR,
  FECHA_EMISION DATE FOR COLUMN FECHA_EMIS,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  MONTO DECIMAL(18,2) FOR COLUMN MONTO,
  ESTADO_INSTRUMENTO VARCHAR(20) FOR COLUMN ESTADO_INS,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (codigo_instrumento)
) RCDFMT RIFMST;

LABEL ON TABLE IFMST IS 'Maestro de Instrumentos Financieros.';
LABEL ON COLUMN IFMST (
  codigo_instrumento IS 'Código de Instrumento',
  tipo_instrumento IS 'Tipo de Instrumento',
  fecha_emision IS 'Fecha de emisión',
  fecha_vencimiento IS 'Fecha de vencimiento',
  monto IS 'Monto',
  estado_instrumento IS 'Estado del instrumento',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_ifmst_pk ON IFMST(codigo_instrumento);
CREATE INDEX idx_ifmst_created_at ON IFMST(created_at);


COMMENT ON TABLE IFMST IS 'Maestro de Instrumentos Financieros.';
LABEL ON TABLE IFMST IS 'Maestro de Instrumentos Financieros.';

COMMENT ON COLUMN IFMST(
  CODIGO_INSTRUMENTO IS 'Código de Instrumento',
  TIPO_INSTRUMENTO IS 'Tipo de Instrumento',
  FECHA_EMISION IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  MONTO IS 'Monto',
  ESTADO_INSTRUMENTO IS 'Estado del instrumento',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN IFMST(
  CODIGO_INSTRUMENTO IS 'Código de Instrumento'  LABEL ... TEXT IS 'Código de Instrumento',
  TIPO_INSTRUMENTO IS 'Tipo de Instrumento'  LABEL ... TEXT IS 'Tipo de Instrumento',
  FECHA_EMISION IS 'Fecha de emisión'  LABEL ... TEXT IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  MONTO IS 'Monto'  LABEL ... TEXT IS 'Monto',
  ESTADO_INSTRUMENTO IS 'Estado del instrumento'  LABEL ... TEXT IS 'Estado del instrumento',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_ifmst_pk ON IFMST(codigo_instrumento);
CREATE INDEX idx_ifmst_created_at ON IFMST(created_at);

--==============================================================
-- TABLA: IFDTL
--==============================================================
-- Nombre de la Tabla: IFDTL
-- DESCRIPCIÓN: Detalle de Instrumentos Financieros.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE IFDTL (
  CODIGO_INSTRUMENTO VARCHAR(30) FOR COLUMN CODIGO_INS,
  NUMERO_LINEA INT FOR COLUMN NUMERO_LIN,
  FECHA_OPERACION DATE FOR COLUMN FECHA_OPER,
  MONTO DECIMAL(18,2) FOR COLUMN MONTO,
  DESCRIPCION VARCHAR(120) FOR COLUMN DESCRIPCIO,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (codigo_instrumento, numero_linea)
) RCDFMT RIFDTL;

LABEL ON TABLE IFDTL IS 'Detalle de Instrumentos Financieros.';
LABEL ON COLUMN IFDTL (
  codigo_instrumento IS 'Código de Instrumento',
  numero_linea IS 'Número de Línea',
  fecha_operacion IS 'Fecha de operación',
  monto IS 'Monto',
  descripcion IS 'Descripción',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_ifdtl_pk ON IFDTL(codigo_instrumento, numero_linea);
CREATE INDEX idx_ifdtl_created_at ON IFDTL(created_at);


COMMENT ON TABLE IFDTL IS 'Detalle de Instrumentos Financieros.';
LABEL ON TABLE IFDTL IS 'Detalle de Instrumentos Financieros.';

COMMENT ON COLUMN IFDTL(
  CODIGO_INSTRUMENTO IS 'Código de Instrumento',
  NUMERO_LINEA IS 'Número de Línea',
  FECHA_OPERACION IS 'Fecha de operación',
  MONTO IS 'Monto',
  DESCRIPCION IS 'Descripción',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN IFDTL(
  CODIGO_INSTRUMENTO IS 'Código de Instrumento'  LABEL ... TEXT IS 'Código de Instrumento',
  NUMERO_LINEA IS 'Número de Línea'  LABEL ... TEXT IS 'Número de Línea',
  FECHA_OPERACION IS 'Fecha de operación'  LABEL ... TEXT IS 'Fecha de operación',
  MONTO IS 'Monto'  LABEL ... TEXT IS 'Monto',
  DESCRIPCION IS 'Descripción'  LABEL ... TEXT IS 'Descripción',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_ifdtl_pk ON IFDTL(codigo_instrumento, numero_linea);
CREATE INDEX idx_ifdtl_created_at ON IFDTL(created_at);

--==============================================================
-- TABLA: DPGLN
--==============================================================
-- Nombre de la Tabla: DPGLN
-- DESCRIPCIÓN: Detalle de Documentos Contables.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE DPGLN (
  CODIGO_DOCUMENTO VARCHAR(30) FOR COLUMN CODIGO_DOC,
  LINEA INT FOR COLUMN LINEA,
  MONTO DECIMAL(18,2) FOR COLUMN MONTO,
  CUENTA_CONTABLE VARCHAR(30) FOR COLUMN CUENTA_CON,
  DESCRIPCION VARCHAR(120) FOR COLUMN DESCRIPCIO,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (codigo_documento, linea)
) RCDFMT RDPGLN;

LABEL ON TABLE DPGLN IS 'Detalle de Documentos Contables.';
LABEL ON COLUMN DPGLN (
  codigo_documento IS 'Código de Documento',
  linea IS 'Línea',
  monto IS 'Monto',
  cuenta_contable IS 'Cuenta Contable',
  descripcion IS 'Descripción',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_dpgln_pk ON DPGLN(codigo_documento, linea);
CREATE INDEX idx_dpgln_created_at ON DPGLN(created_at);


COMMENT ON TABLE DPGLN IS 'Detalle de Documentos Contables.';
LABEL ON TABLE DPGLN IS 'Detalle de Documentos Contables.';

COMMENT ON COLUMN DPGLN(
  CODIGO_DOCUMENTO IS 'Código de Documento',
  LINEA IS 'Línea',
  MONTO IS 'Monto',
  CUENTA_CONTABLE IS 'Cuenta Contable',
  DESCRIPCION IS 'Descripción',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN DPGLN(
  CODIGO_DOCUMENTO IS 'Código de Documento'  LABEL ... TEXT IS 'Código de Documento',
  LINEA IS 'Línea'  LABEL ... TEXT IS 'Línea',
  MONTO IS 'Monto'  LABEL ... TEXT IS 'Monto',
  CUENTA_CONTABLE IS 'Cuenta Contable'  LABEL ... TEXT IS 'Cuenta Contable',
  DESCRIPCION IS 'Descripción'  LABEL ... TEXT IS 'Descripción',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_dpgln_pk ON DPGLN(codigo_documento, linea);
CREATE INDEX idx_dpgln_created_at ON DPGLN(created_at);

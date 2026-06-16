--==============================================================
-- TABLA: CHMST
--==============================================================
-- Nombre de la Tabla: CHMST
-- DESCRIPCIÓN: Maestro de Chequeras.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CHMST (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_SUCURSAL VARCHAR(20) FOR COLUMN CODIGO_SUC,
  CODIGO_MONEDA VARCHAR(20) FOR COLUMN CODIGO_MON,
  NUMERO_CUENTA VARCHAR(24) FOR COLUMN NUMERO_CUE,
  CHEQUE_INICIAL VARCHAR(50) FOR COLUMN CHEQUE_INI,
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
  PRIMARY KEY (codigo_banco, codigo_sucursal, codigo_moneda, numero_cuenta, cheque_inicial)
) RCDFMT RCHMST;

LABEL ON TABLE CHMST IS 'Maestro de Chequeras.';
LABEL ON COLUMN CHMST (codigo_banco IS 'Banco',
  codigo_sucursal IS 'Sucursal',
  codigo_moneda IS 'Moneda',
  numero_cuenta IS 'Número de cuenta',
  cheque_inicial IS 'Cheque inicial',
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

CREATE INDEX idx_chmst_pk ON CHMST(codigo_banco, codigo_sucursal, codigo_moneda, numero_cuenta, cheque_inicial);
CREATE INDEX idx_chmst_created_at ON CHMST(created_at);


COMMENT ON TABLE CHMST IS 'Maestro de Chequeras.';
LABEL ON TABLE CHMST IS 'Maestro de Chequeras.';

COMMENT ON COLUMN CHMST(
  CODIGO_BANCO IS 'Banco',
  CODIGO_SUCURSAL IS 'Sucursal',
  CODIGO_MONEDA IS 'Moneda',
  NUMERO_CUENTA IS 'Número de cuenta',
  CHEQUE_INICIAL IS 'Cheque inicial',
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

LABEL ON COLUMN CHMST(
  CODIGO_BANCO IS 'Banco'  LABEL ... TEXT IS 'Banco',
  CODIGO_SUCURSAL IS 'Sucursal'  LABEL ... TEXT IS 'Sucursal',
  CODIGO_MONEDA IS 'Moneda'  LABEL ... TEXT IS 'Moneda',
  NUMERO_CUENTA IS 'Número de cuenta'  LABEL ... TEXT IS 'Número de cuenta',
  CHEQUE_INICIAL IS 'Cheque inicial'  LABEL ... TEXT IS 'Cheque inicial',
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

CREATE INDEX idx_chmst_pk ON CHMST(codigo_banco, codigo_sucursal, codigo_moneda, numero_cuenta, cheque_inicial);
CREATE INDEX idx_chmst_created_at ON CHMST(created_at);

--==============================================================
-- TABLA: CHPER
--==============================================================
-- Nombre de la Tabla: CHPER
-- DESCRIPCIÓN: Personalización de Chequeras.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CHPER (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_SUCURSAL VARCHAR(20) FOR COLUMN CODIGO_SUC,
  NUMERO_CUENTA VARCHAR(24) FOR COLUMN NUMERO_CUE,
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
  PRIMARY KEY (codigo_banco, codigo_sucursal, numero_cuenta)
) RCDFMT RCHPER;

LABEL ON TABLE CHPER IS 'Personalización de Chequeras.';
LABEL ON COLUMN CHPER (codigo_banco IS 'Banco',
  codigo_sucursal IS 'Sucursal',
  numero_cuenta IS 'Número de cuenta',
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

CREATE INDEX idx_chper_pk ON CHPER(codigo_banco, codigo_sucursal, numero_cuenta);
CREATE INDEX idx_chper_created_at ON CHPER(created_at);


COMMENT ON TABLE CHPER IS 'Personalización de Chequeras.';
LABEL ON TABLE CHPER IS 'Personalización de Chequeras.';

COMMENT ON COLUMN CHPER(
  CODIGO_BANCO IS 'Banco',
  CODIGO_SUCURSAL IS 'Sucursal',
  NUMERO_CUENTA IS 'Número de cuenta',
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

LABEL ON COLUMN CHPER(
  CODIGO_BANCO IS 'Banco'  LABEL ... TEXT IS 'Banco',
  CODIGO_SUCURSAL IS 'Sucursal'  LABEL ... TEXT IS 'Sucursal',
  NUMERO_CUENTA IS 'Número de cuenta'  LABEL ... TEXT IS 'Número de cuenta',
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

CREATE INDEX idx_chper_pk ON CHPER(codigo_banco, codigo_sucursal, numero_cuenta);
CREATE INDEX idx_chper_created_at ON CHPER(created_at);

--==============================================================
-- TABLA: CHSTS
--==============================================================
-- Nombre de la Tabla: CHSTS
-- DESCRIPCIÓN: Maestro de cambio de estatus a cuentas de detalle.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CHSTS (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_SUCURSAL VARCHAR(20) FOR COLUMN CODIGO_SUC,
  CODIGO_MONEDA VARCHAR(20) FOR COLUMN CODIGO_MON,
  CUENTA_CONTABLE VARCHAR(24) FOR COLUMN CUENTA_CON,
  NUMERO_CUENTA VARCHAR(24) FOR COLUMN NUMERO_CUE,
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
  PRIMARY KEY (codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable, numero_cuenta)
) RCDFMT RCHSTS;

LABEL ON TABLE CHSTS IS 'Maestro de cambio de estatus a cuentas de detalle.';
LABEL ON COLUMN CHSTS (codigo_banco IS 'Banco',
  codigo_sucursal IS 'Sucursal',
  codigo_moneda IS 'Moneda',
  cuenta_contable IS 'Cuenta contable',
  numero_cuenta IS 'Número de cuenta',
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

CREATE INDEX idx_chsts_pk ON CHSTS(codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable, numero_cuenta);
CREATE INDEX idx_chsts_created_at ON CHSTS(created_at);


COMMENT ON TABLE CHSTS IS 'Maestro de cambio de estatus a cuentas de detalle.';
LABEL ON TABLE CHSTS IS 'Maestro de cambio de estatus a cuentas de detalle.';

COMMENT ON COLUMN CHSTS(
  CODIGO_BANCO IS 'Banco',
  CODIGO_SUCURSAL IS 'Sucursal',
  CODIGO_MONEDA IS 'Moneda',
  CUENTA_CONTABLE IS 'Cuenta contable',
  NUMERO_CUENTA IS 'Número de cuenta',
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

LABEL ON COLUMN CHSTS(
  CODIGO_BANCO IS 'Banco'  LABEL ... TEXT IS 'Banco',
  CODIGO_SUCURSAL IS 'Sucursal'  LABEL ... TEXT IS 'Sucursal',
  CODIGO_MONEDA IS 'Moneda'  LABEL ... TEXT IS 'Moneda',
  CUENTA_CONTABLE IS 'Cuenta contable'  LABEL ... TEXT IS 'Cuenta contable',
  NUMERO_CUENTA IS 'Número de cuenta'  LABEL ... TEXT IS 'Número de cuenta',
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

CREATE INDEX idx_chsts_pk ON CHSTS(codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable, numero_cuenta);
CREATE INDEX idx_chsts_created_at ON CHSTS(created_at);

--==============================================================
-- TABLA: DEVOL
--==============================================================
-- Nombre de la Tabla: DEVOL
-- DESCRIPCIÓN: Detalle de Cheques devueltos.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE DEVOL (
  NUMERO_CUENTA VARCHAR(24) FOR COLUMN NUMERO_CUE,
  NUMERO_CHEQUE VARCHAR(30) FOR COLUMN NUMERO_CHE,
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
  PRIMARY KEY (numero_cuenta, numero_cheque)
) RCDFMT RDEVOL;

LABEL ON TABLE DEVOL IS 'Detalle de Cheques devueltos.';
LABEL ON COLUMN DEVOL (numero_cuenta IS 'Número de cuenta',
  numero_cheque IS 'Número de cheque',
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

CREATE INDEX idx_devol_pk ON DEVOL(numero_cuenta, numero_cheque);
CREATE INDEX idx_devol_created_at ON DEVOL(created_at);


COMMENT ON TABLE DEVOL IS 'Detalle de Cheques devueltos.';
LABEL ON TABLE DEVOL IS 'Detalle de Cheques devueltos.';

COMMENT ON COLUMN DEVOL(
  NUMERO_CUENTA IS 'Número de cuenta',
  NUMERO_CHEQUE IS 'Número de cheque',
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

LABEL ON COLUMN DEVOL(
  NUMERO_CUENTA IS 'Número de cuenta'  LABEL ... TEXT IS 'Número de cuenta',
  NUMERO_CHEQUE IS 'Número de cheque'  LABEL ... TEXT IS 'Número de cheque',
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

CREATE INDEX idx_devol_pk ON DEVOL(numero_cuenta, numero_cheque);
CREATE INDEX idx_devol_created_at ON DEVOL(created_at);

--==============================================================
-- TABLA: CMRIN
--==============================================================
-- Nombre de la Tabla: CMRIN
-- DESCRIPCIÓN: Detalle de Cámara Entrante.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CMRIN (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  SUCURSAL_MONEDA VARCHAR(50) FOR COLUMN SUCURSAL_M,
  NUMERO_CUENTA VARCHAR(24) FOR COLUMN NUMERO_CUE,
  MONTO DECIMAL(18,2) FOR COLUMN MONTO,
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
  PRIMARY KEY (codigo_banco, sucursal_moneda)
) RCDFMT RCMRIN;

LABEL ON TABLE CMRIN IS 'Detalle de Cámara Entrante.';
LABEL ON COLUMN CMRIN (codigo_banco IS 'Banco',
  sucursal_moneda IS 'Sucursal y moneda',
  numero_cuenta IS 'Número de cuenta',
  monto IS 'Monto',
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

CREATE INDEX idx_cmrin_pk ON CMRIN(codigo_banco, sucursal_moneda);
CREATE INDEX idx_cmrin_created_at ON CMRIN(created_at);


COMMENT ON TABLE CMRIN IS 'Detalle de Cámara Entrante.';
LABEL ON TABLE CMRIN IS 'Detalle de Cámara Entrante.';

COMMENT ON COLUMN CMRIN(
  CODIGO_BANCO IS 'Banco',
  SUCURSAL_MONEDA IS 'Sucursal y moneda',
  NUMERO_CUENTA IS 'Número de cuenta',
  MONTO IS 'Monto',
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

LABEL ON COLUMN CMRIN(
  CODIGO_BANCO IS 'Banco'  LABEL ... TEXT IS 'Banco',
  SUCURSAL_MONEDA IS 'Sucursal y moneda'  LABEL ... TEXT IS 'Sucursal y moneda',
  NUMERO_CUENTA IS 'Número de cuenta'  LABEL ... TEXT IS 'Número de cuenta',
  MONTO IS 'Monto'  LABEL ... TEXT IS 'Monto',
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

CREATE INDEX idx_cmrin_pk ON CMRIN(codigo_banco, sucursal_moneda);
CREATE INDEX idx_cmrin_created_at ON CMRIN(created_at);

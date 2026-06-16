--==============================================================
-- TABLA: CNTRLCNT
--==============================================================
-- Nombre de la Tabla: CNTRLCNT
-- DESCRIPCIÓN: Parámetros Generales del Sistema.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CNTRLCNT (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  DESCRIPCION VARCHAR(120) FOR COLUMN DESCRIPCIO,
  VALOR_TEXTO VARCHAR(50) FOR COLUMN VALOR_TEXT,
  VALOR_NUMERICO DECIMAL(18,2) FOR COLUMN VALOR_NUME,
  VIGENCIA_DESDE DATE FOR COLUMN VIGENCIA_D,
  VIGENCIA_HASTA DATE FOR COLUMN VIGENCIA_H,
  ORDEN_VISUALIZACION INT FOR COLUMN ORDEN_VISU,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (codigo_banco)
) RCDFMT RCNTRLCNT;

LABEL ON TABLE CNTRLCNT IS 'Parámetros Generales del Sistema.';
LABEL ON COLUMN CNTRLCNT (codigo_banco IS 'Código de Banco',
  descripcion IS 'Descripción del parámetro',
  valor_texto IS 'Valor en texto',
  valor_numerico IS 'Valor numérico',
  vigencia_desde IS 'Vigencia desde',
  vigencia_hasta IS 'Vigencia hasta',
  orden_visualizacion IS 'Orden de visualización',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización');

CREATE INDEX idx_cntrlcnt_pk ON CNTRLCNT(codigo_banco);
CREATE INDEX idx_cntrlcnt_created_at ON CNTRLCNT(created_at);


COMMENT ON TABLE CNTRLCNT IS 'Parámetros Generales del Sistema.';
LABEL ON TABLE CNTRLCNT IS 'Parámetros Generales del Sistema.';

COMMENT ON COLUMN CNTRLCNT(
  CODIGO_BANCO IS 'Código de Banco',
  DESCRIPCION IS 'Descripción del parámetro',
  VALOR_TEXTO IS 'Valor en texto',
  VALOR_NUMERICO IS 'Valor numérico',
  VIGENCIA_DESDE IS 'Vigencia desde',
  VIGENCIA_HASTA IS 'Vigencia hasta',
  ORDEN_VISUALIZACION IS 'Orden de visualización',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN CNTRLCNT(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  DESCRIPCION IS 'Descripción del parámetro'  LABEL ... TEXT IS 'Descripción del parámetro',
  VALOR_TEXTO IS 'Valor en texto'  LABEL ... TEXT IS 'Valor en texto',
  VALOR_NUMERICO IS 'Valor numérico'  LABEL ... TEXT IS 'Valor numérico',
  VIGENCIA_DESDE IS 'Vigencia desde'  LABEL ... TEXT IS 'Vigencia desde',
  VIGENCIA_HASTA IS 'Vigencia hasta'  LABEL ... TEXT IS 'Vigencia hasta',
  ORDEN_VISUALIZACION IS 'Orden de visualización'  LABEL ... TEXT IS 'Orden de visualización',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_cntrlcnt_pk ON CNTRLCNT(codigo_banco);
CREATE INDEX idx_cntrlcnt_created_at ON CNTRLCNT(created_at);

--==============================================================
-- TABLA: CNTRLBRN
--==============================================================
-- Nombre de la Tabla: CNTRLBRN
-- DESCRIPCIÓN: Archivo de Sucursales.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CNTRLBRN (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_SUCURSAL VARCHAR(20) FOR COLUMN CODIGO_SUC,
  DESCRIPCION VARCHAR(120) FOR COLUMN DESCRIPCIO,
  VALOR_TEXTO VARCHAR(50) FOR COLUMN VALOR_TEXT,
  VALOR_NUMERICO DECIMAL(18,2) FOR COLUMN VALOR_NUME,
  VIGENCIA_DESDE DATE FOR COLUMN VIGENCIA_D,
  VIGENCIA_HASTA DATE FOR COLUMN VIGENCIA_H,
  ORDEN_VISUALIZACION INT FOR COLUMN ORDEN_VISU,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (codigo_banco, codigo_sucursal)
) RCDFMT RCNTRLBRN;

LABEL ON TABLE CNTRLBRN IS 'Archivo de Sucursales.';
LABEL ON COLUMN CNTRLBRN (codigo_banco IS 'Código de Banco',
  codigo_sucursal IS 'Código de Sucursal',
  descripcion IS 'Descripción de la sucursal',
  valor_texto IS 'Valor en texto',
  valor_numerico IS 'Valor numérico',
  vigencia_desde IS 'Vigencia desde',
  vigencia_hasta IS 'Vigencia hasta',
  orden_visualizacion IS 'Orden de visualización',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización');

CREATE INDEX idx_cntrlbrn_pk ON CNTRLBRN(codigo_banco, codigo_sucursal);
CREATE INDEX idx_cntrlbrn_created_at ON CNTRLBRN(created_at);


COMMENT ON TABLE CNTRLBRN IS 'Archivo de Sucursales.';
LABEL ON TABLE CNTRLBRN IS 'Archivo de Sucursales.';

COMMENT ON COLUMN CNTRLBRN(
  CODIGO_BANCO IS 'Código de Banco',
  CODIGO_SUCURSAL IS 'Código de Sucursal',
  DESCRIPCION IS 'Descripción de la sucursal',
  VALOR_TEXTO IS 'Valor en texto',
  VALOR_NUMERICO IS 'Valor numérico',
  VIGENCIA_DESDE IS 'Vigencia desde',
  VIGENCIA_HASTA IS 'Vigencia hasta',
  ORDEN_VISUALIZACION IS 'Orden de visualización',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN CNTRLBRN(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  CODIGO_SUCURSAL IS 'Código de Sucursal'  LABEL ... TEXT IS 'Código de Sucursal',
  DESCRIPCION IS 'Descripción de la sucursal'  LABEL ... TEXT IS 'Descripción de la sucursal',
  VALOR_TEXTO IS 'Valor en texto'  LABEL ... TEXT IS 'Valor en texto',
  VALOR_NUMERICO IS 'Valor numérico'  LABEL ... TEXT IS 'Valor numérico',
  VIGENCIA_DESDE IS 'Vigencia desde'  LABEL ... TEXT IS 'Vigencia desde',
  VIGENCIA_HASTA IS 'Vigencia hasta'  LABEL ... TEXT IS 'Vigencia hasta',
  ORDEN_VISUALIZACION IS 'Orden de visualización'  LABEL ... TEXT IS 'Orden de visualización',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_cntrlbrn_pk ON CNTRLBRN(codigo_banco, codigo_sucursal);
CREATE INDEX idx_cntrlbrn_created_at ON CNTRLBRN(created_at);

--==============================================================
-- TABLA: CNTRLNUM
--==============================================================
-- Nombre de la Tabla: CNTRLNUM
-- DESCRIPCIÓN: Control de Numeración Automática de Operaciones.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CNTRLNUM (
  CODIGO_APLICACION VARCHAR(20) FOR COLUMN CODIGO_APL,
  TIPO_CUENTA VARCHAR(20) FOR COLUMN TIPO_CUENT,
  DESCRIPCION VARCHAR(120) FOR COLUMN DESCRIPCIO,
  VALOR_TEXTO VARCHAR(50) FOR COLUMN VALOR_TEXT,
  VALOR_NUMERICO DECIMAL(18,2) FOR COLUMN VALOR_NUME,
  VIGENCIA_DESDE DATE FOR COLUMN VIGENCIA_D,
  VIGENCIA_HASTA DATE FOR COLUMN VIGENCIA_H,
  ORDEN_VISUALIZACION INT FOR COLUMN ORDEN_VISU,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (codigo_aplicacion, tipo_cuenta)
) RCDFMT RCNTRLNUM;

LABEL ON TABLE CNTRLNUM IS 'Control de Numeración Automática de Operaciones.';
LABEL ON COLUMN CNTRLNUM (codigo_aplicacion IS 'Código de Aplicación',
  tipo_cuenta IS 'Tipo de Cuenta',
  descripcion IS 'Descripción del control',
  valor_texto IS 'Valor en texto',
  valor_numerico IS 'Valor numérico',
  vigencia_desde IS 'Vigencia desde',
  vigencia_hasta IS 'Vigencia hasta',
  orden_visualizacion IS 'Orden de visualización',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización');

CREATE INDEX idx_cntrlnum_pk ON CNTRLNUM(codigo_aplicacion, tipo_cuenta);
CREATE INDEX idx_cntrlnum_created_at ON CNTRLNUM(created_at);


COMMENT ON TABLE CNTRLNUM IS 'Control de Numeración Automática de Operaciones.';
LABEL ON TABLE CNTRLNUM IS 'Control de Numeración Automática de Operaciones.';

COMMENT ON COLUMN CNTRLNUM(
  CODIGO_APLICACION IS 'Código de Aplicación',
  TIPO_CUENTA IS 'Tipo de Cuenta',
  DESCRIPCION IS 'Descripción del control',
  VALOR_TEXTO IS 'Valor en texto',
  VALOR_NUMERICO IS 'Valor numérico',
  VIGENCIA_DESDE IS 'Vigencia desde',
  VIGENCIA_HASTA IS 'Vigencia hasta',
  ORDEN_VISUALIZACION IS 'Orden de visualización',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN CNTRLNUM(
  CODIGO_APLICACION IS 'Código de Aplicación'  LABEL ... TEXT IS 'Código de Aplicación',
  TIPO_CUENTA IS 'Tipo de Cuenta'  LABEL ... TEXT IS 'Tipo de Cuenta',
  DESCRIPCION IS 'Descripción del control'  LABEL ... TEXT IS 'Descripción del control',
  VALOR_TEXTO IS 'Valor en texto'  LABEL ... TEXT IS 'Valor en texto',
  VALOR_NUMERICO IS 'Valor numérico'  LABEL ... TEXT IS 'Valor numérico',
  VIGENCIA_DESDE IS 'Vigencia desde'  LABEL ... TEXT IS 'Vigencia desde',
  VIGENCIA_HASTA IS 'Vigencia hasta'  LABEL ... TEXT IS 'Vigencia hasta',
  ORDEN_VISUALIZACION IS 'Orden de visualización'  LABEL ... TEXT IS 'Orden de visualización',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_cntrlnum_pk ON CNTRLNUM(codigo_aplicacion, tipo_cuenta);
CREATE INDEX idx_cntrlnum_created_at ON CNTRLNUM(created_at);

--==============================================================
-- TABLA: CNTRLTAX
--==============================================================
-- Nombre de la Tabla: CNTRLTAX
-- DESCRIPCIÓN: Definiciones para el manejo de cobro de impuestos.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CNTRLTAX (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_IMPUESTO VARCHAR(20) FOR COLUMN CODIGO_IMP,
  DESCRIPCION VARCHAR(120) FOR COLUMN DESCRIPCIO,
  VALOR_TEXTO VARCHAR(50) FOR COLUMN VALOR_TEXT,
  VALOR_NUMERICO DECIMAL(18,2) FOR COLUMN VALOR_NUME,
  VIGENCIA_DESDE DATE FOR COLUMN VIGENCIA_D,
  VIGENCIA_HASTA DATE FOR COLUMN VIGENCIA_H,
  ORDEN_VISUALIZACION INT FOR COLUMN ORDEN_VISU,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (codigo_banco, codigo_impuesto)
) RCDFMT RCNTRLTAX;

LABEL ON TABLE CNTRLTAX IS 'Definiciones para el manejo de cobro de impuestos.';
LABEL ON COLUMN CNTRLTAX (codigo_banco IS 'Código de Banco',
  codigo_impuesto IS 'Código de Impuesto',
  descripcion IS 'Descripción del impuesto',
  valor_texto IS 'Valor en texto',
  valor_numerico IS 'Valor numérico',
  vigencia_desde IS 'Vigencia desde',
  vigencia_hasta IS 'Vigencia hasta',
  orden_visualizacion IS 'Orden de visualización',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización');

CREATE INDEX idx_cntrltax_pk ON CNTRLTAX(codigo_banco, codigo_impuesto);
CREATE INDEX idx_cntrltax_created_at ON CNTRLTAX(created_at);


COMMENT ON TABLE CNTRLTAX IS 'Definiciones para el manejo de cobro de impuestos.';
LABEL ON TABLE CNTRLTAX IS 'Definiciones para el manejo de cobro de impuestos.';

COMMENT ON COLUMN CNTRLTAX(
  CODIGO_BANCO IS 'Código de Banco',
  CODIGO_IMPUESTO IS 'Código de Impuesto',
  DESCRIPCION IS 'Descripción del impuesto',
  VALOR_TEXTO IS 'Valor en texto',
  VALOR_NUMERICO IS 'Valor numérico',
  VIGENCIA_DESDE IS 'Vigencia desde',
  VIGENCIA_HASTA IS 'Vigencia hasta',
  ORDEN_VISUALIZACION IS 'Orden de visualización',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN CNTRLTAX(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  CODIGO_IMPUESTO IS 'Código de Impuesto'  LABEL ... TEXT IS 'Código de Impuesto',
  DESCRIPCION IS 'Descripción del impuesto'  LABEL ... TEXT IS 'Descripción del impuesto',
  VALOR_TEXTO IS 'Valor en texto'  LABEL ... TEXT IS 'Valor en texto',
  VALOR_NUMERICO IS 'Valor numérico'  LABEL ... TEXT IS 'Valor numérico',
  VIGENCIA_DESDE IS 'Vigencia desde'  LABEL ... TEXT IS 'Vigencia desde',
  VIGENCIA_HASTA IS 'Vigencia hasta'  LABEL ... TEXT IS 'Vigencia hasta',
  ORDEN_VISUALIZACION IS 'Orden de visualización'  LABEL ... TEXT IS 'Orden de visualización',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_cntrltax_pk ON CNTRLTAX(codigo_banco, codigo_impuesto);
CREATE INDEX idx_cntrltax_created_at ON CNTRLTAX(created_at);

--==============================================================
-- TABLA: CNTRLMSG
--==============================================================
-- Nombre de la Tabla: CNTRLMSG
-- DESCRIPCIÓN: Mensajes a ser impresos en estados de cuenta.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CNTRLMSG (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
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
  PRIMARY KEY (codigo_banco)
) RCDFMT RCNTRLMSG;

LABEL ON TABLE CNTRLMSG IS 'Mensajes a ser impresos en estados de cuenta.';
LABEL ON COLUMN CNTRLMSG (codigo_banco IS 'Banco',
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

CREATE INDEX idx_cntrlmsg_pk ON CNTRLMSG(codigo_banco);
CREATE INDEX idx_cntrlmsg_created_at ON CNTRLMSG(created_at);


COMMENT ON TABLE CNTRLMSG IS 'Mensajes a ser impresos en estados de cuenta.';
LABEL ON TABLE CNTRLMSG IS 'Mensajes a ser impresos en estados de cuenta.';

COMMENT ON COLUMN CNTRLMSG(
  CODIGO_BANCO IS 'Banco',
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

LABEL ON COLUMN CNTRLMSG(
  CODIGO_BANCO IS 'Banco'  LABEL ... TEXT IS 'Banco',
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

CREATE INDEX idx_cntrlmsg_pk ON CNTRLMSG(codigo_banco);
CREATE INDEX idx_cntrlmsg_created_at ON CNTRLMSG(created_at);

--==============================================================
-- TABLA: CNTRLRTE
--==============================================================
-- Nombre de la Tabla: CNTRLRTE
-- DESCRIPCIÓN: Tasas y cargos por servicio en cuentas.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CNTRLRTE (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  TIPO_PRODUCTO VARCHAR(20) FOR COLUMN TIPO_PRODU,
  CODIGO_TABLA VARCHAR(20) FOR COLUMN CODIGO_TAB,
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
  PRIMARY KEY (codigo_banco, tipo_producto)
) RCDFMT RCNTRLRTE;

LABEL ON TABLE CNTRLRTE IS 'Tasas y cargos por servicio en cuentas.';
LABEL ON COLUMN CNTRLRTE (
  codigo_banco IS 'Código de Banco',
  tipo_producto IS 'Tipo de Producto',
  codigo_tabla IS 'Código de Tabla',
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
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_cntrlrte_pk ON CNTRLRTE(codigo_banco, tipo_producto);
CREATE INDEX idx_cntrlrte_created_at ON CNTRLRTE(created_at);


COMMENT ON TABLE CNTRLRTE IS 'Tasas y cargos por servicio en cuentas.';
LABEL ON TABLE CNTRLRTE IS 'Tasas y cargos por servicio en cuentas.';

COMMENT ON COLUMN CNTRLRTE(
  CODIGO_BANCO IS 'Código de Banco',
  TIPO_PRODUCTO IS 'Tipo de Producto',
  CODIGO_TABLA IS 'Código de Tabla',
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

LABEL ON COLUMN CNTRLRTE(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  TIPO_PRODUCTO IS 'Tipo de Producto'  LABEL ... TEXT IS 'Tipo de Producto',
  CODIGO_TABLA IS 'Código de Tabla'  LABEL ... TEXT IS 'Código de Tabla',
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

CREATE INDEX idx_cntrlrte_pk ON CNTRLRTE(codigo_banco, tipo_producto);
CREATE INDEX idx_cntrlrte_created_at ON CNTRLRTE(created_at);

--==============================================================
-- TABLA: CNTRLDEV
--==============================================================
-- Nombre de la Tabla: CNTRLDEV
-- DESCRIPCIÓN: Causales de devolución de cheques.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CNTRLDEV (
  CODIGO_CAUSAL VARCHAR(20) FOR COLUMN CODIGO_CAU,
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
  PRIMARY KEY (codigo_causal)
) RCDFMT RCNTRLDEV;

LABEL ON TABLE CNTRLDEV IS 'Causales de devolución de cheques.';
LABEL ON COLUMN CNTRLDEV (
  codigo_causal IS 'Código de Causal',
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
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_cntrldev_pk ON CNTRLDEV(codigo_causal);
CREATE INDEX idx_cntrldev_created_at ON CNTRLDEV(created_at);


COMMENT ON TABLE CNTRLDEV IS 'Causales de devolución de cheques.';
LABEL ON TABLE CNTRLDEV IS 'Causales de devolución de cheques.';

COMMENT ON COLUMN CNTRLDEV(
  CODIGO_CAUSAL IS 'Código de Causal',
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

LABEL ON COLUMN CNTRLDEV(
  CODIGO_CAUSAL IS 'Código de Causal'  LABEL ... TEXT IS 'Código de Causal',
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

CREATE INDEX idx_cntrldev_pk ON CNTRLDEV(codigo_causal);
CREATE INDEX idx_cntrldev_created_at ON CNTRLDEV(created_at);

--==============================================================
-- TABLA: CNTRLDLS
--==============================================================
-- Nombre de la Tabla: CNTRLDLS
-- DESCRIPCIÓN: Tabla de Tasas para control de Préstamos.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CNTRLDLS (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  NUMERO_TABLA VARCHAR(30) FOR COLUMN NUMERO_TAB,
  TIPO_PRODUCTO VARCHAR(20) FOR COLUMN TIPO_PRODU,
  FECHA_DESEMBOLSO DATE FOR COLUMN FECHA_DESE,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  MONTO_ORIGINAL DECIMAL(18,2) FOR COLUMN MONTO_ORIG,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  TASA_INTERES DECIMAL(18,2) FOR COLUMN TASA_INTER,
  PLAZO_MESES INT FOR COLUMN PLAZO_MESE,
  DIAS_MORA INT FOR COLUMN DIAS_MORA,
  ESTADO_OPERACION VARCHAR(20) FOR COLUMN ESTADO_OPE,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (codigo_banco, numero_tabla)
) RCDFMT RCNTRLDLS;

LABEL ON TABLE CNTRLDLS IS 'Tabla de Tasas para control de Préstamos.';
LABEL ON COLUMN CNTRLDLS (
  codigo_banco IS 'Código de Banco',
  numero_tabla IS 'Número de Tabla',
  tipo_producto IS 'Tipo de Producto',
  fecha_desembolso IS 'Fecha de desembolso',
  fecha_vencimiento IS 'Fecha de vencimiento',
  monto_original IS 'Monto original',
  saldo_actual IS 'Saldo actual',
  tasa_interes IS 'Tasa de interés',
  plazo_meses IS 'Plazo en meses',
  dias_mora IS 'Días de mora',
  estado_operacion IS 'Estado de la operación',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_cntrldls_pk ON CNTRLDLS(codigo_banco, numero_tabla);
CREATE INDEX idx_cntrldls_created_at ON CNTRLDLS(created_at);


COMMENT ON TABLE CNTRLDLS IS 'Tabla de Tasas para control de Préstamos.';
LABEL ON TABLE CNTRLDLS IS 'Tabla de Tasas para control de Préstamos.';

COMMENT ON COLUMN CNTRLDLS(
  CODIGO_BANCO IS 'Código de Banco',
  NUMERO_TABLA IS 'Número de Tabla',
  TIPO_PRODUCTO IS 'Tipo de Producto',
  FECHA_DESEMBOLSO IS 'Fecha de desembolso',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual',
  TASA_INTERES IS 'Tasa de interés',
  PLAZO_MESES IS 'Plazo en meses',
  DIAS_MORA IS 'Días de mora',
  ESTADO_OPERACION IS 'Estado de la operación',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN CNTRLDLS(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  NUMERO_TABLA IS 'Número de Tabla'  LABEL ... TEXT IS 'Número de Tabla',
  TIPO_PRODUCTO IS 'Tipo de Producto'  LABEL ... TEXT IS 'Tipo de Producto',
  FECHA_DESEMBOLSO IS 'Fecha de desembolso'  LABEL ... TEXT IS 'Fecha de desembolso',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original'  LABEL ... TEXT IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  TASA_INTERES IS 'Tasa de interés'  LABEL ... TEXT IS 'Tasa de interés',
  PLAZO_MESES IS 'Plazo en meses'  LABEL ... TEXT IS 'Plazo en meses',
  DIAS_MORA IS 'Días de mora'  LABEL ... TEXT IS 'Días de mora',
  ESTADO_OPERACION IS 'Estado de la operación'  LABEL ... TEXT IS 'Estado de la operación',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_cntrldls_pk ON CNTRLDLS(codigo_banco, numero_tabla);
CREATE INDEX idx_cntrldls_created_at ON CNTRLDLS(created_at);

--==============================================================
-- TABLA: CNTRLFIX
--==============================================================
-- Nombre de la Tabla: CNTRLFIX
-- DESCRIPCIÓN: Archivo de Control de Activos Fijos.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CNTRLFIX (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  DESCRIPCION VARCHAR(120) FOR COLUMN DESCRIPCIO,
  FECHA_ADQUISICION DATE FOR COLUMN FECHA_ADQU,
  VALOR_ADQUISICION DECIMAL(18,2) FOR COLUMN VALOR_ADQU,
  VIDA_UTIL_MESES INT FOR COLUMN VIDA_UTIL_,
  DEPRECIACION_ACUMULADA DECIMAL(18,2) FOR COLUMN DEPRECIACI,
  ESTADO_ACTIVO VARCHAR(20) FOR COLUMN ESTADO_ACT,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (codigo_banco)
) RCDFMT RCNTRLFIX;

LABEL ON TABLE CNTRLFIX IS 'Archivo de Control de Activos Fijos.';
LABEL ON COLUMN CNTRLFIX (
  codigo_banco IS 'Código de Banco',
  descripcion IS 'Descripción',
  fecha_adquisicion IS 'Fecha de adquisición',
  valor_adquisicion IS 'Valor de adquisición',
  vida_util_meses IS 'Vida útil en meses',
  depreciacion_acumulada IS 'Depreciación acumulada',
  estado_activo IS 'Estado del activo',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_cntrfix_pk ON CNTRLFIX(codigo_banco);
CREATE INDEX idx_cntrfix_created_at ON CNTRLFIX(created_at);


COMMENT ON TABLE CNTRLFIX IS 'Archivo de Control de Activos Fijos.';
LABEL ON TABLE CNTRLFIX IS 'Archivo de Control de Activos Fijos.';

COMMENT ON COLUMN CNTRLFIX(
  CODIGO_BANCO IS 'Código de Banco',
  DESCRIPCION IS 'Descripción',
  FECHA_ADQUISICION IS 'Fecha de adquisición',
  VALOR_ADQUISICION IS 'Valor de adquisición',
  VIDA_UTIL_MESES IS 'Vida útil en meses',
  DEPRECIACION_ACUMULADA IS 'Depreciación acumulada',
  ESTADO_ACTIVO IS 'Estado del activo',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN CNTRLFIX(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  DESCRIPCION IS 'Descripción'  LABEL ... TEXT IS 'Descripción',
  FECHA_ADQUISICION IS 'Fecha de adquisición'  LABEL ... TEXT IS 'Fecha de adquisición',
  VALOR_ADQUISICION IS 'Valor de adquisición'  LABEL ... TEXT IS 'Valor de adquisición',
  VIDA_UTIL_MESES IS 'Vida útil en meses'  LABEL ... TEXT IS 'Vida útil en meses',
  DEPRECIACION_ACUMULADA IS 'Depreciación acumulada'  LABEL ... TEXT IS 'Depreciación acumulada',
  ESTADO_ACTIVO IS 'Estado del activo'  LABEL ... TEXT IS 'Estado del activo',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_cntrfix_pk ON CNTRLFIX(codigo_banco);
CREATE INDEX idx_cntrfix_created_at ON CNTRLFIX(created_at);

--==============================================================
-- TABLA: CNTRLBAF
--==============================================================
-- Nombre de la Tabla: CNTRLBAF
-- DESCRIPCIÓN: Control de cuentas por pagar (comisiones).
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CNTRLBAF (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_MONEDA VARCHAR(20) FOR COLUMN CODIGO_MON,
  NUMERO_IDENTIFICACION VARCHAR(30) FOR COLUMN NUMERO_IDE,
  RAZON_SOCIAL VARCHAR(80) FOR COLUMN RAZON_SOCI,
  EMAIL VARCHAR(80) FOR COLUMN EMAIL,
  TELEFONO VARCHAR(80) FOR COLUMN TELEFONO,
  MONTO_ORIGINAL DECIMAL(18,2) FOR COLUMN MONTO_ORIG,
  SALDO_PENDIENTE DECIMAL(18,2) FOR COLUMN SALDO_PEND,
  FECHA_EMISION DATE FOR COLUMN FECHA_EMIS,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  ESTADO_CXP VARCHAR(20) FOR COLUMN ESTADO_CXP,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (codigo_banco, codigo_moneda)
) RCDFMT RCNTRLBAF;

LABEL ON TABLE CNTRLBAF IS 'Control de cuentas por pagar (comisiones).';
LABEL ON COLUMN CNTRLBAF (
  codigo_banco IS 'Código de Banco',
  codigo_moneda IS 'Código de Moneda',
  numero_identificacion IS 'Número de Identificación',
  razon_social IS 'Razón Social',
  email IS 'Email',
  telefono IS 'Teléfono',
  monto_original IS 'Monto original',
  saldo_pendiente IS 'Saldo pendiente',
  fecha_emision IS 'Fecha de emisión',
  fecha_vencimiento IS 'Fecha de vencimiento',
  estado_cxp IS 'Estado CXP',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_cntrlbaf_pk ON CNTRLBAF(codigo_banco, codigo_moneda);
CREATE INDEX idx_cntrlbaf_created_at ON CNTRLBAF(created_at);


COMMENT ON TABLE CNTRLBAF IS 'Control de cuentas por pagar (comisiones).';
LABEL ON TABLE CNTRLBAF IS 'Control de cuentas por pagar (comisiones).';

COMMENT ON COLUMN CNTRLBAF(
  CODIGO_BANCO IS 'Código de Banco',
  CODIGO_MONEDA IS 'Código de Moneda',
  NUMERO_IDENTIFICACION IS 'Número de Identificación',
  RAZON_SOCIAL IS 'Razón Social',
  EMAIL IS 'Email',
  TELEFONO IS 'Teléfono',
  MONTO_ORIGINAL IS 'Monto original',
  SALDO_PENDIENTE IS 'Saldo pendiente',
  FECHA_EMISION IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  ESTADO_CXP IS 'Estado CXP',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN CNTRLBAF(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  CODIGO_MONEDA IS 'Código de Moneda'  LABEL ... TEXT IS 'Código de Moneda',
  NUMERO_IDENTIFICACION IS 'Número de Identificación'  LABEL ... TEXT IS 'Número de Identificación',
  RAZON_SOCIAL IS 'Razón Social'  LABEL ... TEXT IS 'Razón Social',
  EMAIL IS 'Email'  LABEL ... TEXT IS 'Email',
  TELEFONO IS 'Teléfono'  LABEL ... TEXT IS 'Teléfono',
  MONTO_ORIGINAL IS 'Monto original'  LABEL ... TEXT IS 'Monto original',
  SALDO_PENDIENTE IS 'Saldo pendiente'  LABEL ... TEXT IS 'Saldo pendiente',
  FECHA_EMISION IS 'Fecha de emisión'  LABEL ... TEXT IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  ESTADO_CXP IS 'Estado CXP'  LABEL ... TEXT IS 'Estado CXP',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_cntrlbaf_pk ON CNTRLBAF(codigo_banco, codigo_moneda);
CREATE INDEX idx_cntrlbaf_created_at ON CNTRLBAF(created_at);

--==============================================================
-- TABLA: CNTRLBAP
--==============================================================
-- Nombre de la Tabla: CNTRLBAP
-- DESCRIPCIÓN: Control de cuentas por pagar (otros parámetros).
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CNTRLBAP (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_MONEDA VARCHAR(20) FOR COLUMN CODIGO_MON,
  NUMERO_IDENTIFICACION VARCHAR(30) FOR COLUMN NUMERO_IDE,
  RAZON_SOCIAL VARCHAR(80) FOR COLUMN RAZON_SOCI,
  EMAIL VARCHAR(80) FOR COLUMN EMAIL,
  TELEFONO VARCHAR(80) FOR COLUMN TELEFONO,
  MONTO_ORIGINAL DECIMAL(18,2) FOR COLUMN MONTO_ORIG,
  SALDO_PENDIENTE DECIMAL(18,2) FOR COLUMN SALDO_PEND,
  FECHA_EMISION DATE FOR COLUMN FECHA_EMIS,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  ESTADO_CXP VARCHAR(20) FOR COLUMN ESTADO_CXP,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (codigo_banco, codigo_moneda)
) RCDFMT RCNTRLBAP;

LABEL ON TABLE CNTRLBAP IS 'Control de cuentas por pagar (otros parámetros).';
LABEL ON COLUMN CNTRLBAP (
  codigo_banco IS 'Código de Banco',
  codigo_moneda IS 'Código de Moneda',
  numero_identificacion IS 'Número de Identificación',
  razon_social IS 'Razón Social',
  email IS 'Email',
  telefono IS 'Teléfono',
  monto_original IS 'Monto original',
  saldo_pendiente IS 'Saldo pendiente',
  fecha_emision IS 'Fecha de emisión',
  fecha_vencimiento IS 'Fecha de vencimiento',
  estado_cxp IS 'Estado CXP',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_cntrlbap_pk ON CNTRLBAP(codigo_banco, codigo_moneda);
CREATE INDEX idx_cntrlbap_created_at ON CNTRLBAP(created_at);


COMMENT ON TABLE CNTRLBAP IS 'Control de cuentas por pagar (otros parámetros).';
LABEL ON TABLE CNTRLBAP IS 'Control de cuentas por pagar (otros parámetros).';

COMMENT ON COLUMN CNTRLBAP(
  CODIGO_BANCO IS 'Código de Banco',
  CODIGO_MONEDA IS 'Código de Moneda',
  NUMERO_IDENTIFICACION IS 'Número de Identificación',
  RAZON_SOCIAL IS 'Razón Social',
  EMAIL IS 'Email',
  TELEFONO IS 'Teléfono',
  MONTO_ORIGINAL IS 'Monto original',
  SALDO_PENDIENTE IS 'Saldo pendiente',
  FECHA_EMISION IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  ESTADO_CXP IS 'Estado CXP',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN CNTRLBAP(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  CODIGO_MONEDA IS 'Código de Moneda'  LABEL ... TEXT IS 'Código de Moneda',
  NUMERO_IDENTIFICACION IS 'Número de Identificación'  LABEL ... TEXT IS 'Número de Identificación',
  RAZON_SOCIAL IS 'Razón Social'  LABEL ... TEXT IS 'Razón Social',
  EMAIL IS 'Email'  LABEL ... TEXT IS 'Email',
  TELEFONO IS 'Teléfono'  LABEL ... TEXT IS 'Teléfono',
  MONTO_ORIGINAL IS 'Monto original'  LABEL ... TEXT IS 'Monto original',
  SALDO_PENDIENTE IS 'Saldo pendiente'  LABEL ... TEXT IS 'Saldo pendiente',
  FECHA_EMISION IS 'Fecha de emisión'  LABEL ... TEXT IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  ESTADO_CXP IS 'Estado CXP'  LABEL ... TEXT IS 'Estado CXP',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_cntrlbap_pk ON CNTRLBAP(codigo_banco, codigo_moneda);
CREATE INDEX idx_cntrlbap_created_at ON CNTRLBAP(created_at);

--==============================================================
-- TABLA: CNTRLPRF
--==============================================================
-- Nombre de la Tabla: CNTRLPRF
-- DESCRIPCIÓN: Archivo de Control de Pagos y Recibos.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CNTRLPRF (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  PARAMETRO VARCHAR(20) FOR COLUMN PARAMETRO,
  CODIGO_TABLA VARCHAR(20) FOR COLUMN CODIGO_TAB,
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
  PRIMARY KEY (codigo_banco, parametro)
) RCDFMT RCNTRLPRF;

LABEL ON TABLE CNTRLPRF IS 'Archivo de Control de Pagos y Recibos.';
LABEL ON COLUMN CNTRLPRF (
  codigo_banco IS 'Código de Banco',
  parametro IS 'Parámetro',
  codigo_tabla IS 'Código de Tabla',
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

CREATE INDEX idx_cntrlprf_pk ON CNTRLPRF(codigo_banco, parametro);
CREATE INDEX idx_cntrlprf_created_at ON CNTRLPRF(created_at);


COMMENT ON TABLE CNTRLPRF IS 'Archivo de Control de Pagos y Recibos.';
LABEL ON TABLE CNTRLPRF IS 'Archivo de Control de Pagos y Recibos.';

COMMENT ON COLUMN CNTRLPRF(
  CODIGO_BANCO IS 'Código de Banco',
  PARAMETRO IS 'Parámetro',
  CODIGO_TABLA IS 'Código de Tabla',
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

LABEL ON COLUMN CNTRLPRF(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  PARAMETRO IS 'Parámetro'  LABEL ... TEXT IS 'Parámetro',
  CODIGO_TABLA IS 'Código de Tabla'  LABEL ... TEXT IS 'Código de Tabla',
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

CREATE INDEX idx_cntrlprf_pk ON CNTRLPRF(codigo_banco, parametro);
CREATE INDEX idx_cntrlprf_created_at ON CNTRLPRF(created_at);

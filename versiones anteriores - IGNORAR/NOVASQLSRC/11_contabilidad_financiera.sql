--==============================================================
-- TABLA: GLMST
--==============================================================
-- Nombre de la Tabla: GLMST
-- DESCRIPCIÓN: Maestro de Cuentas Contables.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE GLMST (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_MONEDA VARCHAR(20) FOR COLUMN CODIGO_MON,
  CUENTA_CONTABLE VARCHAR(24) FOR COLUMN CUENTA_CON,
  DESCRIPCION_CUENTA VARCHAR(120) FOR COLUMN DESCRIPCIO,
  NATURALEZA_CUENTA VARCHAR(20) FOR COLUMN NATURALEZA,
  NIVEL_CUENTA VARCHAR(50) FOR COLUMN NIVEL_CUEN,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  FECHA_PROCESO_SISTEMA TIMESTAMP FOR COLUMN FECHA_PROC,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (codigo_banco, codigo_moneda, cuenta_contable)
) RCDFMT RGLMST;

LABEL ON TABLE GLMST IS 'Maestro de Cuentas Contables.';
LABEL ON COLUMN GLMST (
  codigo_banco IS 'Código de Banco',
  codigo_moneda IS 'Código de Moneda',
  cuenta_contable IS 'Cuenta Contable',
  descripcion_cuenta IS 'Descripción de la cuenta',
  naturaleza_cuenta IS 'Naturaleza de la cuenta',
  nivel_cuenta IS 'Nivel de la cuenta',
  saldo_actual IS 'Saldo actual',
  fecha_proceso_sistema IS 'Fecha de proceso del sistema',
  observaciones IS 'Observaciones',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_glmst_pk ON GLMST(codigo_banco, codigo_moneda, cuenta_contable);
CREATE INDEX idx_glmst_created_at ON GLMST(created_at);


COMMENT ON TABLE GLMST IS 'Maestro de Cuentas Contables.';
LABEL ON TABLE GLMST IS 'Maestro de Cuentas Contables.';

COMMENT ON COLUMN GLMST(
  CODIGO_BANCO IS 'Código de Banco',
  CODIGO_MONEDA IS 'Código de Moneda',
  CUENTA_CONTABLE IS 'Cuenta Contable',
  DESCRIPCION_CUENTA IS 'Descripción de la cuenta',
  NATURALEZA_CUENTA IS 'Naturaleza de la cuenta',
  NIVEL_CUENTA IS 'Nivel de la cuenta',
  SALDO_ACTUAL IS 'Saldo actual',
  FECHA_PROCESO_SISTEMA IS 'Fecha de proceso del sistema',
  OBSERVACIONES IS 'Observaciones',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN GLMST(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  CODIGO_MONEDA IS 'Código de Moneda'  LABEL ... TEXT IS 'Código de Moneda',
  CUENTA_CONTABLE IS 'Cuenta Contable'  LABEL ... TEXT IS 'Cuenta Contable',
  DESCRIPCION_CUENTA IS 'Descripción de la cuenta'  LABEL ... TEXT IS 'Descripción de la cuenta',
  NATURALEZA_CUENTA IS 'Naturaleza de la cuenta'  LABEL ... TEXT IS 'Naturaleza de la cuenta',
  NIVEL_CUENTA IS 'Nivel de la cuenta'  LABEL ... TEXT IS 'Nivel de la cuenta',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  FECHA_PROCESO_SISTEMA IS 'Fecha de proceso del sistema'  LABEL ... TEXT IS 'Fecha de proceso del sistema',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_glmst_pk ON GLMST(codigo_banco, codigo_moneda, cuenta_contable);
CREATE INDEX idx_glmst_created_at ON GLMST(created_at);

--==============================================================
-- TABLA: INPUT
--==============================================================
-- Nombre de la Tabla: INPUT
-- DESCRIPCIÓN: Asientos contables aprobados.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE INPUT (
  NUMERO_DEL_LOTE VARCHAR(30) FOR COLUMN NUMERO_DEL,
  SECUENCIA_DENTRO_DEL_LOTE VARCHAR(50) FOR COLUMN SECUENCIA_,
  DESCRIPCION_CUENTA VARCHAR(120) FOR COLUMN DESCRIPCIO,
  NATURALEZA_CUENTA VARCHAR(20) FOR COLUMN NATURALEZA,
  NIVEL_CUENTA VARCHAR(50) FOR COLUMN NIVEL_CUEN,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  FECHA_PROCESO_SISTEMA TIMESTAMP FOR COLUMN FECHA_PROC,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (numero_del_lote, secuencia_dentro_del_lote)
) RCDFMT RINPUT;

LABEL ON TABLE INPUT IS 'Asientos contables aprobados.';
LABEL ON COLUMN INPUT (
  numero_del_lote IS 'Número del Lote',
  secuencia_dentro_del_lote IS 'Secuencia dentro del Lote',
  descripcion_cuenta IS 'Descripción de la cuenta',
  naturaleza_cuenta IS 'Naturaleza de la cuenta',
  nivel_cuenta IS 'Nivel de la cuenta',
  saldo_actual IS 'Saldo actual',
  fecha_proceso_sistema IS 'Fecha de proceso del sistema',
  observaciones IS 'Observaciones',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_input_pk ON INPUT(numero_del_lote, secuencia_dentro_del_lote);
CREATE INDEX idx_input_created_at ON INPUT(created_at);


COMMENT ON TABLE INPUT IS 'Asientos contables aprobados.';
LABEL ON TABLE INPUT IS 'Asientos contables aprobados.';

COMMENT ON COLUMN INPUT(
  NUMERO_DEL_LOTE IS 'Número del Lote',
  SECUENCIA_DENTRO_DEL_LOTE IS 'Secuencia dentro del Lote',
  DESCRIPCION_CUENTA IS 'Descripción de la cuenta',
  NATURALEZA_CUENTA IS 'Naturaleza de la cuenta',
  NIVEL_CUENTA IS 'Nivel de la cuenta',
  SALDO_ACTUAL IS 'Saldo actual',
  FECHA_PROCESO_SISTEMA IS 'Fecha de proceso del sistema',
  OBSERVACIONES IS 'Observaciones',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN INPUT(
  NUMERO_DEL_LOTE IS 'Número del Lote'  LABEL ... TEXT IS 'Número del Lote',
  SECUENCIA_DENTRO_DEL_LOTE IS 'Secuencia dentro del Lote'  LABEL ... TEXT IS 'Secuencia dentro del Lote',
  DESCRIPCION_CUENTA IS 'Descripción de la cuenta'  LABEL ... TEXT IS 'Descripción de la cuenta',
  NATURALEZA_CUENTA IS 'Naturaleza de la cuenta'  LABEL ... TEXT IS 'Naturaleza de la cuenta',
  NIVEL_CUENTA IS 'Nivel de la cuenta'  LABEL ... TEXT IS 'Nivel de la cuenta',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  FECHA_PROCESO_SISTEMA IS 'Fecha de proceso del sistema'  LABEL ... TEXT IS 'Fecha de proceso del sistema',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_input_pk ON INPUT(numero_del_lote, secuencia_dentro_del_lote);
CREATE INDEX idx_input_created_at ON INPUT(created_at);

--==============================================================
-- TABLA: GLBLN
--==============================================================
-- Nombre de la Tabla: GLBLN
-- DESCRIPCIÓN: Balances Generales
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE GLBLN (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_SUCURSAL VARCHAR(20) FOR COLUMN CODIGO_SUC,
  CODIGO_MONEDA VARCHAR(20) FOR COLUMN CODIGO_MON,
  CUENTA_CONTABLE VARCHAR(24) FOR COLUMN CUENTA_CON,
  DESCRIPCION_CUENTA VARCHAR(120) FOR COLUMN DESCRIPCIO,
  NATURALEZA_CUENTA VARCHAR(20) FOR COLUMN NATURALEZA,
  NIVEL_CUENTA VARCHAR(50) FOR COLUMN NIVEL_CUEN,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  FECHA_PROCESO_SISTEMA TIMESTAMP FOR COLUMN FECHA_PROC,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable)
) RCDFMT RGLBLN;

LABEL ON TABLE GLBLN IS 'Balances Generales';
LABEL ON COLUMN GLBLN (
  codigo_banco IS 'Código de Banco',
  codigo_sucursal IS 'Código de Sucursal',
  codigo_moneda IS 'Código de Moneda',
  cuenta_contable IS 'Cuenta Contable',
  descripcion_cuenta IS 'Descripción de la cuenta',
  naturaleza_cuenta IS 'Naturaleza de la cuenta',
  nivel_cuenta IS 'Nivel de la cuenta',
  saldo_actual IS 'Saldo actual',
  fecha_proceso_sistema IS 'Fecha de proceso del sistema',
  observaciones IS 'Observaciones',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_glbln_pk ON GLBLN(codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable);
CREATE INDEX idx_glbln_created_at ON GLBLN(created_at);


COMMENT ON TABLE GLBLN IS 'Balances Generales';
LABEL ON TABLE GLBLN IS 'Balances Generales';

COMMENT ON COLUMN GLBLN(
  CODIGO_BANCO IS 'Código de Banco',
  CODIGO_SUCURSAL IS 'Código de Sucursal',
  CODIGO_MONEDA IS 'Código de Moneda',
  CUENTA_CONTABLE IS 'Cuenta Contable',
  DESCRIPCION_CUENTA IS 'Descripción de la cuenta',
  NATURALEZA_CUENTA IS 'Naturaleza de la cuenta',
  NIVEL_CUENTA IS 'Nivel de la cuenta',
  SALDO_ACTUAL IS 'Saldo actual',
  FECHA_PROCESO_SISTEMA IS 'Fecha de proceso del sistema',
  OBSERVACIONES IS 'Observaciones',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN GLBLN(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  CODIGO_SUCURSAL IS 'Código de Sucursal'  LABEL ... TEXT IS 'Código de Sucursal',
  CODIGO_MONEDA IS 'Código de Moneda'  LABEL ... TEXT IS 'Código de Moneda',
  CUENTA_CONTABLE IS 'Cuenta Contable'  LABEL ... TEXT IS 'Cuenta Contable',
  DESCRIPCION_CUENTA IS 'Descripción de la cuenta'  LABEL ... TEXT IS 'Descripción de la cuenta',
  NATURALEZA_CUENTA IS 'Naturaleza de la cuenta'  LABEL ... TEXT IS 'Naturaleza de la cuenta',
  NIVEL_CUENTA IS 'Nivel de la cuenta'  LABEL ... TEXT IS 'Nivel de la cuenta',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  FECHA_PROCESO_SISTEMA IS 'Fecha de proceso del sistema'  LABEL ... TEXT IS 'Fecha de proceso del sistema',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_glbln_pk ON GLBLN(codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable);
CREATE INDEX idx_glbln_created_at ON GLBLN(created_at);

--==============================================================
-- TABLA: GLBSE
--==============================================================
-- Nombre de la Tabla: GLBSE
-- DESCRIPCIÓN: Balances Generales Consolidado.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE GLBSE (
  ID BIGINT FOR COLUMN ID GENERATED ALWAYS AS IDENTITY,
  DESCRIPCION_CUENTA VARCHAR(120) FOR COLUMN DESCRIPCIO,
  NATURALEZA_CUENTA VARCHAR(20) FOR COLUMN NATURALEZA,
  NIVEL_CUENTA VARCHAR(50) FOR COLUMN NIVEL_CUEN,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  FECHA_PROCESO_SISTEMA TIMESTAMP FOR COLUMN FECHA_PROC,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (id)
) RCDFMT RGLBSE;

LABEL ON TABLE GLBSE IS 'Balances Generales Consolidado.';
LABEL ON COLUMN GLBSE (
  id IS 'Identificador técnico',
  descripcion_cuenta IS 'Descripción de la cuenta',
  naturaleza_cuenta IS 'Naturaleza de la cuenta',
  nivel_cuenta IS 'Nivel de la cuenta',
  saldo_actual IS 'Saldo actual',
  fecha_proceso_sistema IS 'Fecha de proceso del sistema',
  observaciones IS 'Observaciones',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_glbse_pk ON GLBSE(id);
CREATE INDEX idx_glbse_created_at ON GLBSE(created_at);


COMMENT ON TABLE GLBSE IS 'Balances Generales Consolidado.';
LABEL ON TABLE GLBSE IS 'Balances Generales Consolidado.';

COMMENT ON COLUMN GLBSE(
  ID IS 'Identificador técnico',
  DESCRIPCION_CUENTA IS 'Descripción de la cuenta',
  NATURALEZA_CUENTA IS 'Naturaleza de la cuenta',
  NIVEL_CUENTA IS 'Nivel de la cuenta',
  SALDO_ACTUAL IS 'Saldo actual',
  FECHA_PROCESO_SISTEMA IS 'Fecha de proceso del sistema',
  OBSERVACIONES IS 'Observaciones',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN GLBSE(
  ID IS 'Identificador técnico'  LABEL ... TEXT IS 'Identificador técnico',
  DESCRIPCION_CUENTA IS 'Descripción de la cuenta'  LABEL ... TEXT IS 'Descripción de la cuenta',
  NATURALEZA_CUENTA IS 'Naturaleza de la cuenta'  LABEL ... TEXT IS 'Naturaleza de la cuenta',
  NIVEL_CUENTA IS 'Nivel de la cuenta'  LABEL ... TEXT IS 'Nivel de la cuenta',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  FECHA_PROCESO_SISTEMA IS 'Fecha de proceso del sistema'  LABEL ... TEXT IS 'Fecha de proceso del sistema',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_glbse_pk ON GLBSE(id);
CREATE INDEX idx_glbse_created_at ON GLBSE(created_at);

--==============================================================
-- TABLA: GLFIN
--==============================================================
-- Nombre de la Tabla: GLFIN
-- DESCRIPCIÓN: Estados Financieros por niveles.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE GLFIN (
  ID BIGINT FOR COLUMN ID GENERATED ALWAYS AS IDENTITY,
  DESCRIPCION_CUENTA VARCHAR(120) FOR COLUMN DESCRIPCIO,
  NATURALEZA_CUENTA VARCHAR(20) FOR COLUMN NATURALEZA,
  NIVEL_CUENTA VARCHAR(50) FOR COLUMN NIVEL_CUEN,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  FECHA_PROCESO_SISTEMA TIMESTAMP FOR COLUMN FECHA_PROC,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (id)
) RCDFMT RGLFIN;

LABEL ON TABLE GLFIN IS 'Estados Financieros por niveles.';
LABEL ON COLUMN GLFIN (
  id IS 'Identificador técnico',
  descripcion_cuenta IS 'Descripción de la cuenta',
  naturaleza_cuenta IS 'Naturaleza de la cuenta',
  nivel_cuenta IS 'Nivel de la cuenta',
  saldo_actual IS 'Saldo actual',
  fecha_proceso_sistema IS 'Fecha de proceso del sistema',
  observaciones IS 'Observaciones',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_glfin_pk ON GLFIN(id);
CREATE INDEX idx_glfin_created_at ON GLFIN(created_at);


COMMENT ON TABLE GLFIN IS 'Estados Financieros por niveles.';
LABEL ON TABLE GLFIN IS 'Estados Financieros por niveles.';

COMMENT ON COLUMN GLFIN(
  ID IS 'Identificador técnico',
  DESCRIPCION_CUENTA IS 'Descripción de la cuenta',
  NATURALEZA_CUENTA IS 'Naturaleza de la cuenta',
  NIVEL_CUENTA IS 'Nivel de la cuenta',
  SALDO_ACTUAL IS 'Saldo actual',
  FECHA_PROCESO_SISTEMA IS 'Fecha de proceso del sistema',
  OBSERVACIONES IS 'Observaciones',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN GLFIN(
  ID IS 'Identificador técnico'  LABEL ... TEXT IS 'Identificador técnico',
  DESCRIPCION_CUENTA IS 'Descripción de la cuenta'  LABEL ... TEXT IS 'Descripción de la cuenta',
  NATURALEZA_CUENTA IS 'Naturaleza de la cuenta'  LABEL ... TEXT IS 'Naturaleza de la cuenta',
  NIVEL_CUENTA IS 'Nivel de la cuenta'  LABEL ... TEXT IS 'Nivel de la cuenta',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  FECHA_PROCESO_SISTEMA IS 'Fecha de proceso del sistema'  LABEL ... TEXT IS 'Fecha de proceso del sistema',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_glfin_pk ON GLFIN(id);
CREATE INDEX idx_glfin_created_at ON GLFIN(created_at);

--==============================================================
-- TABLA: CCDSC
--==============================================================
-- Nombre de la Tabla: CCDSC
-- DESCRIPCIÓN: Maestros de Centros de Costos
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CCDSC (
  ID BIGINT FOR COLUMN ID GENERATED ALWAYS AS IDENTITY,
  DESCRIPCION_CUENTA VARCHAR(120) FOR COLUMN DESCRIPCIO,
  NATURALEZA_CUENTA VARCHAR(20) FOR COLUMN NATURALEZA,
  NIVEL_CUENTA VARCHAR(50) FOR COLUMN NIVEL_CUEN,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  FECHA_PROCESO_SISTEMA TIMESTAMP FOR COLUMN FECHA_PROC,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (id)
) RCDFMT RCCDSC;

LABEL ON TABLE CCDSC IS 'Maestros de Centros de Costos';
LABEL ON COLUMN CCDSC (
  id IS 'Identificador técnico',
  descripcion_cuenta IS 'Descripción de la cuenta',
  naturaleza_cuenta IS 'Naturaleza de la cuenta',
  nivel_cuenta IS 'Nivel de la cuenta',
  saldo_actual IS 'Saldo actual',
  fecha_proceso_sistema IS 'Fecha de proceso del sistema',
  observaciones IS 'Observaciones',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_ccdsc_pk ON CCDSC(id);
CREATE INDEX idx_ccdsc_created_at ON CCDSC(created_at);


COMMENT ON TABLE CCDSC IS 'Maestros de Centros de Costos';
LABEL ON TABLE CCDSC IS 'Maestros de Centros de Costos';

COMMENT ON COLUMN CCDSC(
  ID IS 'Identificador técnico',
  DESCRIPCION_CUENTA IS 'Descripción de la cuenta',
  NATURALEZA_CUENTA IS 'Naturaleza de la cuenta',
  NIVEL_CUENTA IS 'Nivel de la cuenta',
  SALDO_ACTUAL IS 'Saldo actual',
  FECHA_PROCESO_SISTEMA IS 'Fecha de proceso del sistema',
  OBSERVACIONES IS 'Observaciones',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN CCDSC(
  ID IS 'Identificador técnico'  LABEL ... TEXT IS 'Identificador técnico',
  DESCRIPCION_CUENTA IS 'Descripción de la cuenta'  LABEL ... TEXT IS 'Descripción de la cuenta',
  NATURALEZA_CUENTA IS 'Naturaleza de la cuenta'  LABEL ... TEXT IS 'Naturaleza de la cuenta',
  NIVEL_CUENTA IS 'Nivel de la cuenta'  LABEL ... TEXT IS 'Nivel de la cuenta',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  FECHA_PROCESO_SISTEMA IS 'Fecha de proceso del sistema'  LABEL ... TEXT IS 'Fecha de proceso del sistema',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_ccdsc_pk ON CCDSC(id);
CREATE INDEX idx_ccdsc_created_at ON CCDSC(created_at);

--==============================================================
-- TABLA: INPT2
--==============================================================
-- Nombre de la Tabla: INPT2
-- DESCRIPCIÓN: Entradas contables automáticas del fin de día.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE INPT2 (
  ID BIGINT FOR COLUMN ID GENERATED ALWAYS AS IDENTITY,
  DESCRIPCION_CUENTA VARCHAR(120) FOR COLUMN DESCRIPCIO,
  NATURALEZA_CUENTA VARCHAR(20) FOR COLUMN NATURALEZA,
  NIVEL_CUENTA VARCHAR(50) FOR COLUMN NIVEL_CUEN,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  FECHA_PROCESO_SISTEMA TIMESTAMP FOR COLUMN FECHA_PROC,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (id)
) RCDFMT RINPT2;

LABEL ON TABLE INPT2 IS 'Entradas contables automáticas del fin de día.';
LABEL ON COLUMN INPT2 (
  id IS 'Identificador técnico',
  descripcion_cuenta IS 'Descripción de la cuenta',
  naturaleza_cuenta IS 'Naturaleza de la cuenta',
  nivel_cuenta IS 'Nivel de la cuenta',
  saldo_actual IS 'Saldo actual',
  fecha_proceso_sistema IS 'Fecha de proceso del sistema',
  observaciones IS 'Observaciones',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_inpt2_pk ON INPT2(id);
CREATE INDEX idx_inpt2_created_at ON INPT2(created_at);


COMMENT ON TABLE INPT2 IS 'Entradas contables automáticas del fin de día.';
LABEL ON TABLE INPT2 IS 'Entradas contables automáticas del fin de día.';

COMMENT ON COLUMN INPT2(
  ID IS 'Identificador técnico',
  DESCRIPCION_CUENTA IS 'Descripción de la cuenta',
  NATURALEZA_CUENTA IS 'Naturaleza de la cuenta',
  NIVEL_CUENTA IS 'Nivel de la cuenta',
  SALDO_ACTUAL IS 'Saldo actual',
  FECHA_PROCESO_SISTEMA IS 'Fecha de proceso del sistema',
  OBSERVACIONES IS 'Observaciones',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN INPT2(
  ID IS 'Identificador técnico'  LABEL ... TEXT IS 'Identificador técnico',
  DESCRIPCION_CUENTA IS 'Descripción de la cuenta'  LABEL ... TEXT IS 'Descripción de la cuenta',
  NATURALEZA_CUENTA IS 'Naturaleza de la cuenta'  LABEL ... TEXT IS 'Naturaleza de la cuenta',
  NIVEL_CUENTA IS 'Nivel de la cuenta'  LABEL ... TEXT IS 'Nivel de la cuenta',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  FECHA_PROCESO_SISTEMA IS 'Fecha de proceso del sistema'  LABEL ... TEXT IS 'Fecha de proceso del sistema',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_inpt2_pk ON INPT2(id);
CREATE INDEX idx_inpt2_created_at ON INPT2(created_at);

--==============================================================
-- TABLA: NXINP
--==============================================================
-- Nombre de la Tabla: NXINP
-- DESCRIPCIÓN: Transacciones Contables del próximo día.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE NXINP (
  NUMERO_BATCH VARCHAR(30) FOR COLUMN NUMERO_BAT,
  SECUENCIA INT FOR COLUMN SECUENCIA,
  DESCRIPCION_CUENTA VARCHAR(120) FOR COLUMN DESCRIPCIO,
  NATURALEZA_CUENTA VARCHAR(20) FOR COLUMN NATURALEZA,
  NIVEL_CUENTA VARCHAR(50) FOR COLUMN NIVEL_CUEN,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  FECHA_PROCESO_SISTEMA TIMESTAMP FOR COLUMN FECHA_PROC,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (numero_batch, secuencia)
) RCDFMT RNXINP;

LABEL ON TABLE NXINP IS 'Transacciones Contables del próximo día.';
LABEL ON COLUMN NXINP (
  numero_batch IS 'Número de batch',
  secuencia IS 'Secuencia',
  descripcion_cuenta IS 'Descripción de la cuenta',
  naturaleza_cuenta IS 'Naturaleza de la cuenta',
  nivel_cuenta IS 'Nivel de la cuenta',
  saldo_actual IS 'Saldo actual',
  fecha_proceso_sistema IS 'Fecha de proceso del sistema',
  observaciones IS 'Observaciones',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_nxinp_pk ON NXINP(numero_batch, secuencia);
CREATE INDEX idx_nxinp_created_at ON NXINP(created_at);


COMMENT ON TABLE NXINP IS 'Transacciones Contables del próximo día.';
LABEL ON TABLE NXINP IS 'Transacciones Contables del próximo día.';

COMMENT ON COLUMN NXINP(
  NUMERO_BATCH IS 'Número de batch',
  SECUENCIA IS 'Secuencia',
  DESCRIPCION_CUENTA IS 'Descripción de la cuenta',
  NATURALEZA_CUENTA IS 'Naturaleza de la cuenta',
  NIVEL_CUENTA IS 'Nivel de la cuenta',
  SALDO_ACTUAL IS 'Saldo actual',
  FECHA_PROCESO_SISTEMA IS 'Fecha de proceso del sistema',
  OBSERVACIONES IS 'Observaciones',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN NXINP(
  NUMERO_BATCH IS 'Número de batch'  LABEL ... TEXT IS 'Número de batch',
  SECUENCIA IS 'Secuencia'  LABEL ... TEXT IS 'Secuencia',
  DESCRIPCION_CUENTA IS 'Descripción de la cuenta'  LABEL ... TEXT IS 'Descripción de la cuenta',
  NATURALEZA_CUENTA IS 'Naturaleza de la cuenta'  LABEL ... TEXT IS 'Naturaleza de la cuenta',
  NIVEL_CUENTA IS 'Nivel de la cuenta'  LABEL ... TEXT IS 'Nivel de la cuenta',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  FECHA_PROCESO_SISTEMA IS 'Fecha de proceso del sistema'  LABEL ... TEXT IS 'Fecha de proceso del sistema',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_nxinp_pk ON NXINP(numero_batch, secuencia);
CREATE INDEX idx_nxinp_created_at ON NXINP(created_at);

--==============================================================
-- TABLA: FIWRT
--==============================================================
-- Nombre de la Tabla: FIWRT
-- DESCRIPCIÓN: Transacciones Históricas de Pagos y Recibos.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE FIWRT (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  NUMERO_TRANSFERENCIA VARCHAR(30) FOR COLUMN NUMERO_TRA,
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
  PRIMARY KEY (codigo_banco, numero_transferencia)
) RCDFMT RFIWRT;

LABEL ON TABLE FIWRT IS 'Transacciones Históricas de Pagos y Recibos.';
LABEL ON COLUMN FIWRT (
  codigo_banco IS 'Código de Banco',
  numero_transferencia IS 'Número de Transferencia',
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

CREATE INDEX idx_fiwrt_pk ON FIWRT(codigo_banco, numero_transferencia);
CREATE INDEX idx_fiwrt_created_at ON FIWRT(created_at);


COMMENT ON TABLE FIWRT IS 'Transacciones Históricas de Pagos y Recibos.';
LABEL ON TABLE FIWRT IS 'Transacciones Históricas de Pagos y Recibos.';

COMMENT ON COLUMN FIWRT(
  CODIGO_BANCO IS 'Código de Banco',
  NUMERO_TRANSFERENCIA IS 'Número de Transferencia',
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

LABEL ON COLUMN FIWRT(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  NUMERO_TRANSFERENCIA IS 'Número de Transferencia'  LABEL ... TEXT IS 'Número de Transferencia',
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

CREATE INDEX idx_fiwrt_pk ON FIWRT(codigo_banco, numero_transferencia);
CREATE INDEX idx_fiwrt_created_at ON FIWRT(created_at);

--==============================================================
-- TABLA: PLPCR
--==============================================================
-- Nombre de la Tabla: PLPCR
-- DESCRIPCIÓN: Propuestas de Crédito
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE PLPCR (
  NUMERO_PROPUESTA VARCHAR(30) FOR COLUMN NUMERO_PRO,
  FECHA_PROPUESTA DATE FOR COLUMN FECHA_PROP,
  MONTO_SOLICITADO DECIMAL(18,2) FOR COLUMN MONTO_SOLI,
  PLAZO_MESES INT FOR COLUMN PLAZO_MESE,
  TASA_PROPUESTA DECIMAL(18,2) FOR COLUMN TASA_PROPU,
  DICTAMEN_CREDITO VARCHAR(120) FOR COLUMN DICTAMEN_C,
  ESTADO_PROPUESTA VARCHAR(20) FOR COLUMN ESTADO_PRO,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (numero_propuesta)
) RCDFMT RPLPCR;

LABEL ON TABLE PLPCR IS 'Propuestas de Crédito';
LABEL ON COLUMN PLPCR (
  numero_propuesta IS 'Número de Propuesta',
  fecha_propuesta IS 'Fecha de Propuesta',
  monto_solicitado IS 'Monto Solicitado',
  plazo_meses IS 'Plazo en Meses',
  tasa_propuesta IS 'Tasa Propuesta',
  dictamen_credito IS 'Dictamen de Crédito',
  estado_propuesta IS 'Estado de la Propuesta',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_plpcr_pk ON PLPCR(numero_propuesta);
CREATE INDEX idx_plpcr_created_at ON PLPCR(created_at);


COMMENT ON TABLE PLPCR IS 'Propuestas de Crédito';
LABEL ON TABLE PLPCR IS 'Propuestas de Crédito';

COMMENT ON COLUMN PLPCR(
  NUMERO_PROPUESTA IS 'Número de Propuesta',
  FECHA_PROPUESTA IS 'Fecha de Propuesta',
  MONTO_SOLICITADO IS 'Monto Solicitado',
  PLAZO_MESES IS 'Plazo en Meses',
  TASA_PROPUESTA IS 'Tasa Propuesta',
  DICTAMEN_CREDITO IS 'Dictamen de Crédito',
  ESTADO_PROPUESTA IS 'Estado de la Propuesta',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN PLPCR(
  NUMERO_PROPUESTA IS 'Número de Propuesta'  LABEL ... TEXT IS 'Número de Propuesta',
  FECHA_PROPUESTA IS 'Fecha de Propuesta'  LABEL ... TEXT IS 'Fecha de Propuesta',
  MONTO_SOLICITADO IS 'Monto Solicitado'  LABEL ... TEXT IS 'Monto Solicitado',
  PLAZO_MESES IS 'Plazo en Meses'  LABEL ... TEXT IS 'Plazo en Meses',
  TASA_PROPUESTA IS 'Tasa Propuesta'  LABEL ... TEXT IS 'Tasa Propuesta',
  DICTAMEN_CREDITO IS 'Dictamen de Crédito'  LABEL ... TEXT IS 'Dictamen de Crédito',
  ESTADO_PROPUESTA IS 'Estado de la Propuesta'  LABEL ... TEXT IS 'Estado de la Propuesta',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_plpcr_pk ON PLPCR(numero_propuesta);
CREATE INDEX idx_plpcr_created_at ON PLPCR(created_at);

--==============================================================
-- TABLA: PLPRD
--==============================================================
-- Nombre de la Tabla: PLPRD
-- DESCRIPCIÓN: Propuestas Aprobadas
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE PLPRD (
  NUMERO_PROPUESTA VARCHAR(30) FOR COLUMN NUMERO_PRO,
  NUMERO_PRESTAMO VARCHAR(30) FOR COLUMN NUMERO_PRE,
  FECHA_APROBACION DATE FOR COLUMN FECHA_APRO,
  MONTO_APROBADO DECIMAL(18,2) FOR COLUMN MONTO_APRO,
  PLAZO_MESES INT FOR COLUMN PLAZO_MESE,
  TASA_APROBADA DECIMAL(18,2) FOR COLUMN TASA_APROB,
  ESTADO_CREDITO VARCHAR(20) FOR COLUMN ESTADO_CRE,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (numero_propuesta, numero_prestamo)
) RCDFMT RPLPRD;

LABEL ON TABLE PLPRD IS 'Propuestas Aprobadas';
LABEL ON COLUMN PLPRD (
  numero_propuesta IS 'Número de Propuesta',
  numero_prestamo IS 'Número de Préstamo',
  fecha_aprobacion IS 'Fecha de aprobación',
  monto_aprobado IS 'Monto aprobado',
  plazo_meses IS 'Plazo en meses',
  tasa_aprobada IS 'Tasa aprobada',
  estado_credito IS 'Estado del crédito',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_plprd_pk ON PLPRD(numero_propuesta, numero_prestamo);
CREATE INDEX idx_plprd_created_at ON PLPRD(created_at);


COMMENT ON TABLE PLPRD IS 'Propuestas Aprobadas';
LABEL ON TABLE PLPRD IS 'Propuestas Aprobadas';

COMMENT ON COLUMN PLPRD(
  NUMERO_PROPUESTA IS 'Número de Propuesta',
  NUMERO_PRESTAMO IS 'Número de Préstamo',
  FECHA_APROBACION IS 'Fecha de aprobación',
  MONTO_APROBADO IS 'Monto aprobado',
  PLAZO_MESES IS 'Plazo en meses',
  TASA_APROBADA IS 'Tasa aprobada',
  ESTADO_CREDITO IS 'Estado del crédito',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN PLPRD(
  NUMERO_PROPUESTA IS 'Número de Propuesta'  LABEL ... TEXT IS 'Número de Propuesta',
  NUMERO_PRESTAMO IS 'Número de Préstamo'  LABEL ... TEXT IS 'Número de Préstamo',
  FECHA_APROBACION IS 'Fecha de aprobación'  LABEL ... TEXT IS 'Fecha de aprobación',
  MONTO_APROBADO IS 'Monto aprobado'  LABEL ... TEXT IS 'Monto aprobado',
  PLAZO_MESES IS 'Plazo en meses'  LABEL ... TEXT IS 'Plazo en meses',
  TASA_APROBADA IS 'Tasa aprobada'  LABEL ... TEXT IS 'Tasa aprobada',
  ESTADO_CREDITO IS 'Estado del crédito'  LABEL ... TEXT IS 'Estado del crédito',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_plprd_pk ON PLPRD(numero_propuesta, numero_prestamo);
CREATE INDEX idx_plprd_created_at ON PLPRD(created_at);

--==============================================================
-- TABLA: PLGRT
--==============================================================
-- Nombre de la Tabla: PLGRT
-- DESCRIPCIÓN: Garantías por Crédito
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE PLGRT (
  NUMERO_GARANTIA VARCHAR(30) FOR COLUMN NUMERO_GAR,
  NUMERO_PRESTAMO VARCHAR(30) FOR COLUMN NUMERO_PRE,
  TIPO_GARANTIA VARCHAR(30) FOR COLUMN TIPO_GARAN,
  VALOR_GARANTIA DECIMAL(18,2) FOR COLUMN VALOR_GARA,
  FECHA_EMISION DATE FOR COLUMN FECHA_EMIS,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  ESTADO_GARANTIA VARCHAR(20) FOR COLUMN ESTADO_GAR,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (numero_garantia)
) RCDFMT RPLGRT;

LABEL ON TABLE PLGRT IS 'Garantías por Crédito';
LABEL ON COLUMN PLGRT (
  numero_garantia IS 'Número de Garantía',
  numero_prestamo IS 'Número de Préstamo',
  tipo_garantia IS 'Tipo de Garantía',
  valor_garantia IS 'Valor de la Garantía',
  fecha_emision IS 'Fecha de emisión',
  fecha_vencimiento IS 'Fecha de vencimiento',
  estado_garantia IS 'Estado de la Garantía',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_plgrt_pk ON PLGRT(numero_garantia);
CREATE INDEX idx_plgrt_created_at ON PLGRT(created_at);


COMMENT ON TABLE PLGRT IS 'Garantías por Crédito';
LABEL ON TABLE PLGRT IS 'Garantías por Crédito';

COMMENT ON COLUMN PLGRT(
  NUMERO_GARANTIA IS 'Número de Garantía',
  NUMERO_PRESTAMO IS 'Número de Préstamo',
  TIPO_GARANTIA IS 'Tipo de Garantía',
  VALOR_GARANTIA IS 'Valor de la Garantía',
  FECHA_EMISION IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  ESTADO_GARANTIA IS 'Estado de la Garantía',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN PLGRT(
  NUMERO_GARANTIA IS 'Número de Garantía'  LABEL ... TEXT IS 'Número de Garantía',
  NUMERO_PRESTAMO IS 'Número de Préstamo'  LABEL ... TEXT IS 'Número de Préstamo',
  TIPO_GARANTIA IS 'Tipo de Garantía'  LABEL ... TEXT IS 'Tipo de Garantía',
  VALOR_GARANTIA IS 'Valor de la Garantía'  LABEL ... TEXT IS 'Valor de la Garantía',
  FECHA_EMISION IS 'Fecha de emisión'  LABEL ... TEXT IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  ESTADO_GARANTIA IS 'Estado de la Garantía'  LABEL ... TEXT IS 'Estado de la Garantía',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_plgrt_pk ON PLGRT(numero_garantia);
CREATE INDEX idx_plgrt_created_at ON PLGRT(created_at);

--==============================================================
-- TABLA: LIMST
--==============================================================
-- Nombre de la Tabla: LIMST
-- DESCRIPCIÓN: Maestro de Líneas de Crédito.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE LIMST (
  CODIGO_LINEA VARCHAR(30) FOR COLUMN CODIGO_LIN,
  DESCRIPCION VARCHAR(120) FOR COLUMN DESCRIPCIO,
  TIPO_LINEA VARCHAR(20) FOR COLUMN TIPO_LINEA,
  MONTO_APROBADO DECIMAL(18,2) FOR COLUMN MONTO_APRO,
  MONTO_DISPONIBLE DECIMAL(18,2) FOR COLUMN MONTO_DISP,
  TASA_APROBADA DECIMAL(18,2) FOR COLUMN TASA_APROB,
  PLAZO_MESES INT FOR COLUMN PLAZO_MESE,
  ESTADO_LINEA VARCHAR(20) FOR COLUMN ESTADO_LIN,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
  PRIMARY KEY (codigo_linea)
) RCDFMT RLIMST;

LABEL ON TABLE LIMST IS 'Maestro de Líneas de Crédito.';
LABEL ON COLUMN LIMST (
  codigo_linea IS 'Código de Línea',
  descripcion IS 'Descripción',
  tipo_linea IS 'Tipo de Línea',
  monto_aprobado IS 'Monto aprobado',
  monto_disponible IS 'Monto disponible',
  tasa_aprobada IS 'Tasa aprobada',
  plazo_meses IS 'Plazo en meses',
  estado_linea IS 'Estado de la línea',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_limst_pk ON LIMST(codigo_linea);
CREATE INDEX idx_limst_created_at ON LIMST(created_at);


COMMENT ON TABLE LIMST IS 'Maestro de Líneas de Crédito.';
LABEL ON TABLE LIMST IS 'Maestro de Líneas de Crédito.';

COMMENT ON COLUMN LIMST(
  CODIGO_LINEA IS 'Código de Línea',
  DESCRIPCION IS 'Descripción',
  TIPO_LINEA IS 'Tipo de Línea',
  MONTO_APROBADO IS 'Monto aprobado',
  MONTO_DISPONIBLE IS 'Monto disponible',
  TASA_APROBADA IS 'Tasa aprobada',
  PLAZO_MESES IS 'Plazo en meses',
  ESTADO_LINEA IS 'Estado de la línea',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN LIMST(
  CODIGO_LINEA IS 'Código de Línea'  LABEL ... TEXT IS 'Código de Línea',
  DESCRIPCION IS 'Descripción'  LABEL ... TEXT IS 'Descripción',
  TIPO_LINEA IS 'Tipo de Línea'  LABEL ... TEXT IS 'Tipo de Línea',
  MONTO_APROBADO IS 'Monto aprobado'  LABEL ... TEXT IS 'Monto aprobado',
  MONTO_DISPONIBLE IS 'Monto disponible'  LABEL ... TEXT IS 'Monto disponible',
  TASA_APROBADA IS 'Tasa aprobada'  LABEL ... TEXT IS 'Tasa aprobada',
  PLAZO_MESES IS 'Plazo en meses'  LABEL ... TEXT IS 'Plazo en meses',
  ESTADO_LINEA IS 'Estado de la línea'  LABEL ... TEXT IS 'Estado de la línea',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_limst_pk ON LIMST(codigo_linea);
CREATE INDEX idx_limst_created_at ON LIMST(created_at);

--==============================================================
-- TABLA: DIMST
--==============================================================
-- Nombre de la Tabla: DIMST
-- DESCRIPCIÓN: Maestro de Documentos Internos.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE DIMST (
  CODIGO_DOCUMENTO VARCHAR(30) FOR COLUMN CODIGO_DOC,
  DESCRIPCION VARCHAR(120) FOR COLUMN DESCRIPCIO,
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
  PRIMARY KEY (codigo_documento)
) RCDFMT RDIMST;

LABEL ON TABLE DIMST IS 'Maestro de Documentos Internos.';
LABEL ON COLUMN DIMST (
  codigo_documento IS 'Código de Documento',
  descripcion IS 'Descripción',
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

CREATE INDEX idx_dimst_pk ON DIMST(codigo_documento);
CREATE INDEX idx_dimst_created_at ON DIMST(created_at);


COMMENT ON TABLE DIMST IS 'Maestro de Documentos Internos.';
LABEL ON TABLE DIMST IS 'Maestro de Documentos Internos.';

COMMENT ON COLUMN DIMST(
  CODIGO_DOCUMENTO IS 'Código de Documento',
  DESCRIPCION IS 'Descripción',
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

LABEL ON COLUMN DIMST(
  CODIGO_DOCUMENTO IS 'Código de Documento'  LABEL ... TEXT IS 'Código de Documento',
  DESCRIPCION IS 'Descripción'  LABEL ... TEXT IS 'Descripción',
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

CREATE INDEX idx_dimst_pk ON DIMST(codigo_documento);
CREATE INDEX idx_dimst_created_at ON DIMST(created_at);

--==============================================================
-- TABLA: DITBL
--==============================================================
-- Nombre de la Tabla: DITBL
-- DESCRIPCIÓN: Detalle de Documentos Internos.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE DITBL (
  CODIGO_DOCUMENTO VARCHAR(30) FOR COLUMN CODIGO_DOC,
  NUMERO_LINEA INT FOR COLUMN NUMERO_LIN,
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
  PRIMARY KEY (codigo_documento, numero_linea)
) RCDFMT RDITBL;

LABEL ON TABLE DITBL IS 'Detalle de Documentos Internos.';
LABEL ON COLUMN DITBL (
  codigo_documento IS 'Código de Documento',
  numero_linea IS 'Número de Línea',
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

CREATE INDEX idx_ditbl_pk ON DITBL(codigo_documento, numero_linea);
CREATE INDEX idx_ditbl_created_at ON DITBL(created_at);


COMMENT ON TABLE DITBL IS 'Detalle de Documentos Internos.';
LABEL ON TABLE DITBL IS 'Detalle de Documentos Internos.';

COMMENT ON COLUMN DITBL(
  CODIGO_DOCUMENTO IS 'Código de Documento',
  NUMERO_LINEA IS 'Número de Línea',
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

LABEL ON COLUMN DITBL(
  CODIGO_DOCUMENTO IS 'Código de Documento'  LABEL ... TEXT IS 'Código de Documento',
  NUMERO_LINEA IS 'Número de Línea'  LABEL ... TEXT IS 'Número de Línea',
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

CREATE INDEX idx_ditbl_pk ON DITBL(codigo_documento, numero_linea);
CREATE INDEX idx_ditbl_created_at ON DITBL(created_at);

--==============================================================
-- TABLA: MLNCT
--==============================================================
-- Nombre de la Tabla: MLNCT
-- DESCRIPCIÓN: Plantillas de notificaciones a clientes.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE MLNCT (
  CODIGO_BANCO VARCHAR(20),
  CODIGO_DE_NOTIFICACION VARCHAR(20),
  NIVEL INT,
  IDIOMA VARCHAR(20),
  SECUENCIA INT,
  DESCRIPCION VARCHAR(120),
  VALOR_TEXTO VARCHAR(50),
  VALOR_NUMERICO DECIMAL(18,2),
  VIGENCIA_DESDE DATE,
  VIGENCIA_HASTA DATE,
  ORDEN_VISUALIZACION INT,
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  OBSERVACIONES VARCHAR(120),
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (codigo_banco, codigo_de_notificacion, nivel, idioma, secuencia)
) RCDFMT RMLNCT;

LABEL ON TABLE MLNCT IS 'Plantillas de notificaciones a clientes.';
LABEL ON COLUMN MLNCT (codigo_banco IS 'Banco',
  codigo_de_notificacion IS 'Código de Notificación',
  nivel IS 'Nivel de la notificación',
  idioma IS 'Idioma',
  secuencia IS 'Secuencia',
  descripcion IS 'Descripción de la notificación',
  valor_texto IS 'Valor en texto',
  valor_numerico IS 'Valor numérico',
  vigencia_desde IS 'Fecha de vigencia desde',
  vigencia_hasta IS 'Fecha de vigencia hasta',
  orden_visualizacion IS 'Orden de visualización',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización');

CREATE INDEX idx_mlnct_pk ON MLNCT(codigo_banco, codigo_de_notificacion, nivel, idioma, secuencia);
CREATE INDEX idx_mlnct_created_at ON MLNCT(created_at);


COMMENT ON TABLE MLNCT IS 'Plantillas de notificaciones a clientes.';
LABEL ON TABLE MLNCT IS 'Plantillas de notificaciones a clientes.';

COMMENT ON COLUMN MLNCT(
  CODIGO_BANCO IS 'Banco',
  CODIGO_DE_NOTIFICACION IS 'Código de Notificación',
  NIVEL IS 'Nivel de la notificación',
  IDIOMA IS 'Idioma',
  SECUENCIA IS 'Secuencia',
  DESCRIPCION IS 'Descripción de la notificación',
  VALOR_TEXTO IS 'Valor en texto',
  VALOR_NUMERICO IS 'Valor numérico',
  VIGENCIA_DESDE IS 'Fecha de vigencia desde',
  VIGENCIA_HASTA IS 'Fecha de vigencia hasta',
  ORDEN_VISUALIZACION IS 'Orden de visualización',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN MLNCT(
  CODIGO_BANCO IS 'Banco'  LABEL ... TEXT IS 'Banco',
  CODIGO_DE_NOTIFICACION IS 'Código de Notificación'  LABEL ... TEXT IS 'Código de Notificación',
  NIVEL IS 'Nivel de la notificación'  LABEL ... TEXT IS 'Nivel de la notificación',
  IDIOMA IS 'Idioma'  LABEL ... TEXT IS 'Idioma',
  SECUENCIA IS 'Secuencia'  LABEL ... TEXT IS 'Secuencia',
  DESCRIPCION IS 'Descripción de la notificación'  LABEL ... TEXT IS 'Descripción de la notificación',
  VALOR_TEXTO IS 'Valor en texto'  LABEL ... TEXT IS 'Valor en texto',
  VALOR_NUMERICO IS 'Valor numérico'  LABEL ... TEXT IS 'Valor numérico',
  VIGENCIA_DESDE IS 'Fecha de vigencia desde'  LABEL ... TEXT IS 'Fecha de vigencia desde',
  VIGENCIA_HASTA IS 'Fecha de vigencia hasta'  LABEL ... TEXT IS 'Fecha de vigencia hasta',
  ORDEN_VISUALIZACION IS 'Orden de visualización'  LABEL ... TEXT IS 'Orden de visualización',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_mlnct_pk ON MLNCT(codigo_banco, codigo_de_notificacion, nivel, idioma, secuencia);
CREATE INDEX idx_mlnct_created_at ON MLNCT(created_at);

--==============================================================
-- TABLA: MLNOT
--==============================================================
-- Nombre de la Tabla: MLNOT
-- DESCRIPCIÓN: Datos para impresión de notificaciones.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE MLNOT (
  CODIGO_BANCO VARCHAR(20),
  FECHA_PROCESO DATE,
  NUMERO_CUENTA VARCHAR(24),
  CODIGO_DE_NOTIFICACION VARCHAR(20),
  NIVEL INT,
  DESCRIPCION VARCHAR(120),
  VALOR_TEXTO VARCHAR(50),
  VALOR_NUMERICO DECIMAL(18,2),
  VIGENCIA_DESDE DATE,
  VIGENCIA_HASTA DATE,
  ORDEN_VISUALIZACION INT,
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  OBSERVACIONES VARCHAR(120),
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (codigo_banco, fecha_proceso, numero_cuenta, codigo_de_notificacion, nivel)
) RCDFMT RMLNOT;

LABEL ON TABLE MLNOT IS 'Datos para impresión de notificaciones.';
LABEL ON COLUMN MLNOT (codigo_banco IS 'Banco',
  fecha_proceso IS 'Fecha de proceso',
  numero_cuenta IS 'Número de cuenta',
  codigo_de_notificacion IS 'Código de Notificación',
  nivel IS 'Nivel de notificación',
  descripcion IS 'Descripción de la notificación',
  valor_texto IS 'Valor en texto',
  valor_numerico IS 'Valor numérico',
  vigencia_desde IS 'Fecha de vigencia desde',
  vigencia_hasta IS 'Fecha de vigencia hasta',
  orden_visualizacion IS 'Orden de visualización',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización');

CREATE INDEX idx_mlnot_pk ON MLNOT(codigo_banco, fecha_proceso, numero_cuenta, codigo_de_notificacion, nivel);
CREATE INDEX idx_mlnot_fecha ON MLNOT(fecha_proceso);


COMMENT ON TABLE MLNOT IS 'Datos para impresión de notificaciones.';
LABEL ON TABLE MLNOT IS 'Datos para impresión de notificaciones.';

COMMENT ON COLUMN MLNOT(
  CODIGO_BANCO IS 'Banco',
  FECHA_PROCESO IS 'Fecha de proceso',
  NUMERO_CUENTA IS 'Número de cuenta',
  CODIGO_DE_NOTIFICACION IS 'Código de Notificación',
  NIVEL IS 'Nivel de notificación',
  DESCRIPCION IS 'Descripción de la notificación',
  VALOR_TEXTO IS 'Valor en texto',
  VALOR_NUMERICO IS 'Valor numérico',
  VIGENCIA_DESDE IS 'Fecha de vigencia desde',
  VIGENCIA_HASTA IS 'Fecha de vigencia hasta',
  ORDEN_VISUALIZACION IS 'Orden de visualización',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN MLNOT(
  CODIGO_BANCO IS 'Banco'  LABEL ... TEXT IS 'Banco',
  FECHA_PROCESO IS 'Fecha de proceso'  LABEL ... TEXT IS 'Fecha de proceso',
  NUMERO_CUENTA IS 'Número de cuenta'  LABEL ... TEXT IS 'Número de cuenta',
  CODIGO_DE_NOTIFICACION IS 'Código de Notificación'  LABEL ... TEXT IS 'Código de Notificación',
  NIVEL IS 'Nivel de notificación'  LABEL ... TEXT IS 'Nivel de notificación',
  DESCRIPCION IS 'Descripción de la notificación'  LABEL ... TEXT IS 'Descripción de la notificación',
  VALOR_TEXTO IS 'Valor en texto'  LABEL ... TEXT IS 'Valor en texto',
  VALOR_NUMERICO IS 'Valor numérico'  LABEL ... TEXT IS 'Valor numérico',
  VIGENCIA_DESDE IS 'Fecha de vigencia desde'  LABEL ... TEXT IS 'Fecha de vigencia desde',
  VIGENCIA_HASTA IS 'Fecha de vigencia hasta'  LABEL ... TEXT IS 'Fecha de vigencia hasta',
  ORDEN_VISUALIZACION IS 'Orden de visualización'  LABEL ... TEXT IS 'Orden de visualización',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_mlnot_pk ON MLNOT(codigo_banco, fecha_proceso, numero_cuenta, codigo_de_notificacion, nivel);
CREATE INDEX idx_mlnot_fecha ON MLNOT(fecha_proceso);

--==============================================================
-- TABLA: HSNOT
--==============================================================
-- Nombre de la Tabla: HSNOT
-- DESCRIPCIÓN: Histórico de Datos impresos en las Notificaciones.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE HSNOT (
  CODIGO_BANCO VARCHAR(20),
  FECHA_PROCESO DATE,
  NUMERO_CUENTA VARCHAR(24),
  CODIGO_DE_NOTIFICACION VARCHAR(20),
  NIVEL INT,
  DESCRIPCION VARCHAR(120),
  VALOR_TEXTO VARCHAR(50),
  VALOR_NUMERICO DECIMAL(18,2),
  VIGENCIA_DESDE DATE,
  VIGENCIA_HASTA DATE,
  ORDEN_VISUALIZACION INT,
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  OBSERVACIONES VARCHAR(120),
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (codigo_banco, fecha_proceso, numero_cuenta, codigo_de_notificacion, nivel)
) RCDFMT RHSNOT;

LABEL ON TABLE HSNOT IS 'Histórico de Datos impresos en las Notificaciones.';
LABEL ON COLUMN HSNOT (codigo_banco IS 'Banco',
  fecha_proceso IS 'Fecha de proceso',
  numero_cuenta IS 'Número de cuenta',
  codigo_de_notificacion IS 'Código de Notificación',
  nivel IS 'Nivel de notificación',
  descripcion IS 'Descripción de la notificación',
  valor_texto IS 'Valor en texto',
  valor_numerico IS 'Valor numérico',
  vigencia_desde IS 'Fecha de vigencia desde',
  vigencia_hasta IS 'Fecha de vigencia hasta',
  orden_visualizacion IS 'Orden de visualización',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización');

CREATE INDEX idx_hsnot_pk ON HSNOT(codigo_banco, fecha_proceso, numero_cuenta, codigo_de_notificacion, nivel);
CREATE INDEX idx_hsnot_fecha ON HSNOT(fecha_proceso);


COMMENT ON TABLE HSNOT IS 'Histórico de Datos impresos en las Notificaciones.';
LABEL ON TABLE HSNOT IS 'Histórico de Datos impresos en las Notificaciones.';

COMMENT ON COLUMN HSNOT(
  CODIGO_BANCO IS 'Banco',
  FECHA_PROCESO IS 'Fecha de proceso',
  NUMERO_CUENTA IS 'Número de cuenta',
  CODIGO_DE_NOTIFICACION IS 'Código de Notificación',
  NIVEL IS 'Nivel de notificación',
  DESCRIPCION IS 'Descripción de la notificación',
  VALOR_TEXTO IS 'Valor en texto',
  VALOR_NUMERICO IS 'Valor numérico',
  VIGENCIA_DESDE IS 'Fecha de vigencia desde',
  VIGENCIA_HASTA IS 'Fecha de vigencia hasta',
  ORDEN_VISUALIZACION IS 'Orden de visualización',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN HSNOT(
  CODIGO_BANCO IS 'Banco'  LABEL ... TEXT IS 'Banco',
  FECHA_PROCESO IS 'Fecha de proceso'  LABEL ... TEXT IS 'Fecha de proceso',
  NUMERO_CUENTA IS 'Número de cuenta'  LABEL ... TEXT IS 'Número de cuenta',
  CODIGO_DE_NOTIFICACION IS 'Código de Notificación'  LABEL ... TEXT IS 'Código de Notificación',
  NIVEL IS 'Nivel de notificación'  LABEL ... TEXT IS 'Nivel de notificación',
  DESCRIPCION IS 'Descripción de la notificación'  LABEL ... TEXT IS 'Descripción de la notificación',
  VALOR_TEXTO IS 'Valor en texto'  LABEL ... TEXT IS 'Valor en texto',
  VALOR_NUMERICO IS 'Valor numérico'  LABEL ... TEXT IS 'Valor numérico',
  VIGENCIA_DESDE IS 'Fecha de vigencia desde'  LABEL ... TEXT IS 'Fecha de vigencia desde',
  VIGENCIA_HASTA IS 'Fecha de vigencia hasta'  LABEL ... TEXT IS 'Fecha de vigencia hasta',
  ORDEN_VISUALIZACION IS 'Orden de visualización'  LABEL ... TEXT IS 'Orden de visualización',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_hsnot_pk ON HSNOT(codigo_banco, fecha_proceso, numero_cuenta, codigo_de_notificacion, nivel);
CREATE INDEX idx_hsnot_fecha ON HSNOT(fecha_proceso);

--==============================================================
-- TABLA: APCLS
--==============================================================
-- Nombre de la Tabla: APCLS
-- DESCRIPCIÓN: Archivo Maestro de Productos.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE APCLS (
  CODIGO_BANCO VARCHAR(20),
  CODIGO_DE_PRODUCTO VARCHAR(20),
  DESCRIPCION VARCHAR(120),
  VALOR_TEXTO VARCHAR(50),
  VALOR_NUMERICO DECIMAL(18,2),
  VIGENCIA_DESDE DATE,
  VIGENCIA_HASTA DATE,
  ORDEN_VISUALIZACION INT,
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  OBSERVACIONES VARCHAR(120),
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (codigo_banco, codigo_de_producto)
) RCDFMT RAPCLS;

LABEL ON TABLE APCLS IS 'Archivo Maestro de Productos.';
LABEL ON COLUMN APCLS (codigo_banco IS 'Código de Banco',
  codigo_de_producto IS 'Código de Producto',
  descripcion IS 'Descripción del producto',
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

CREATE INDEX idx_apcls_pk ON APCLS(codigo_banco, codigo_de_producto);
CREATE INDEX idx_apcls_created_at ON APCLS(created_at);


COMMENT ON TABLE APCLS IS 'Archivo Maestro de Productos.';
LABEL ON TABLE APCLS IS 'Archivo Maestro de Productos.';

COMMENT ON COLUMN APCLS(
  CODIGO_BANCO IS 'Código de Banco',
  CODIGO_DE_PRODUCTO IS 'Código de Producto',
  DESCRIPCION IS 'Descripción del producto',
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

LABEL ON COLUMN APCLS(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  CODIGO_DE_PRODUCTO IS 'Código de Producto'  LABEL ... TEXT IS 'Código de Producto',
  DESCRIPCION IS 'Descripción del producto'  LABEL ... TEXT IS 'Descripción del producto',
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

CREATE INDEX idx_apcls_pk ON APCLS(codigo_banco, codigo_de_producto);
CREATE INDEX idx_apcls_created_at ON APCLS(created_at);

--==============================================================
-- TABLA: CIFXF
--==============================================================
-- Nombre de la Tabla: CIFXF
-- DESCRIPCIÓN: Relación de operaciones con clientes.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CIFXF (
  ID BIGINT GENERATED ALWAYS AS IDENTITY,
  DESCRIPCION VARCHAR(120),
  VALOR_TEXTO VARCHAR(50),
  VALOR_NUMERICO DECIMAL(18,2),
  VIGENCIA_DESDE DATE,
  VIGENCIA_HASTA DATE,
  ORDEN_VISUALIZACION INT,
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  OBSERVACIONES VARCHAR(120),
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (id)
) RCDFMT RCIFXF;

LABEL ON TABLE CIFXF IS 'Relación de operaciones con clientes.';
LABEL ON COLUMN CIFXF (id IS 'Identificador técnico',
  descripcion IS 'Descripción de la relación',
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

CREATE INDEX idx_cifxf_pk ON CIFXF(id);
CREATE INDEX idx_cifxf_created_at ON CIFXF(created_at);


COMMENT ON TABLE CIFXF IS 'Relación de operaciones con clientes.';
LABEL ON TABLE CIFXF IS 'Relación de operaciones con clientes.';

COMMENT ON COLUMN CIFXF(
  ID IS 'Identificador técnico',
  DESCRIPCION IS 'Descripción de la relación',
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

LABEL ON COLUMN CIFXF(
  ID IS 'Identificador técnico'  LABEL ... TEXT IS 'Identificador técnico',
  DESCRIPCION IS 'Descripción de la relación'  LABEL ... TEXT IS 'Descripción de la relación',
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

CREATE INDEX idx_cifxf_pk ON CIFXF(id);
CREATE INDEX idx_cifxf_created_at ON CIFXF(created_at);

--==============================================================
-- TABLA: CUMST
--==============================================================
-- Nombre de la Tabla: CUMST
-- DESCRIPCIÓN: Archivo de Maestro de Clientes.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CUMST (
  ID_CLIENTE VARCHAR(30),
  TIPO_PERSONA VARCHAR(20),
  TIPO_IDENTIFICACION VARCHAR(20),
  NUMERO_IDENTIFICACION VARCHAR(30),
  NOMBRES VARCHAR(80),
  APELLIDOS VARCHAR(80),
  RAZON_SOCIAL VARCHAR(80),
  FECHA_NACIMIENTO DATE,
  DIRECCION VARCHAR(120),
  EMAIL VARCHAR(80),
  TELEFONO VARCHAR(80),
  PAIS_RESIDENCIA VARCHAR(50),
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  OBSERVACIONES VARCHAR(120),
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (id_cliente)
) RCDFMT RCUMST;

LABEL ON TABLE CUMST IS 'Archivo de Maestro de Clientes.';
LABEL ON COLUMN CUMST (id_cliente IS 'Número o identificación del cliente',
  tipo_persona IS 'Tipo de persona',
  tipo_identificacion IS 'Tipo de identificación',
  numero_identificacion IS 'Número de identificación',
  nombres IS 'Nombres',
  apellidos IS 'Apellidos',
  razon_social IS 'Razón social',
  fecha_nacimiento IS 'Fecha de nacimiento',
  direccion IS 'Dirección',
  email IS 'Correo electrónico',
  telefono IS 'Teléfono',
  pais_residencia IS 'País de residencia',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización');

CREATE INDEX idx_cumst_pk ON CUMST(id_cliente);
CREATE INDEX idx_cumst_created_at ON CUMST(created_at);


COMMENT ON TABLE CUMST IS 'Archivo de Maestro de Clientes.';
LABEL ON TABLE CUMST IS 'Archivo de Maestro de Clientes.';

COMMENT ON COLUMN CUMST(
  ID_CLIENTE IS 'Número o identificación del cliente',
  TIPO_PERSONA IS 'Tipo de persona',
  TIPO_IDENTIFICACION IS 'Tipo de identificación',
  NUMERO_IDENTIFICACION IS 'Número de identificación',
  NOMBRES IS 'Nombres',
  APELLIDOS IS 'Apellidos',
  RAZON_SOCIAL IS 'Razón social',
  FECHA_NACIMIENTO IS 'Fecha de nacimiento',
  DIRECCION IS 'Dirección',
  EMAIL IS 'Correo electrónico',
  TELEFONO IS 'Teléfono',
  PAIS_RESIDENCIA IS 'País de residencia',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN CUMST(
  ID_CLIENTE IS 'Número o identificación del cliente'  LABEL ... TEXT IS 'Número o identificación del cliente',
  TIPO_PERSONA IS 'Tipo de persona'  LABEL ... TEXT IS 'Tipo de persona',
  TIPO_IDENTIFICACION IS 'Tipo de identificación'  LABEL ... TEXT IS 'Tipo de identificación',
  NUMERO_IDENTIFICACION IS 'Número de identificación'  LABEL ... TEXT IS 'Número de identificación',
  NOMBRES IS 'Nombres'  LABEL ... TEXT IS 'Nombres',
  APELLIDOS IS 'Apellidos'  LABEL ... TEXT IS 'Apellidos',
  RAZON_SOCIAL IS 'Razón social'  LABEL ... TEXT IS 'Razón social',
  FECHA_NACIMIENTO IS 'Fecha de nacimiento'  LABEL ... TEXT IS 'Fecha de nacimiento',
  DIRECCION IS 'Dirección'  LABEL ... TEXT IS 'Dirección',
  EMAIL IS 'Correo electrónico'  LABEL ... TEXT IS 'Correo electrónico',
  TELEFONO IS 'Teléfono'  LABEL ... TEXT IS 'Teléfono',
  PAIS_RESIDENCIA IS 'País de residencia'  LABEL ... TEXT IS 'País de residencia',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_cumst_pk ON CUMST(id_cliente);
CREATE INDEX idx_cumst_created_at ON CUMST(created_at);

--==============================================================
-- TABLA: ACMST
--==============================================================
-- Nombre de la Tabla: ACMST
-- DESCRIPCIÓN: Archivo Maestro de Cuentas de Detalle.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE ACMST (
  ID BIGINT GENERATED ALWAYS AS IDENTITY,
  FECHA_APERTURA DATE,
  FECHA_ULTIMA_TRANSACCION DATE,
  SALDO_ACTUAL DECIMAL(18,2),
  SALDO_DISPONIBLE DECIMAL(18,2),
  LIMITE_SOBREGIRO DECIMAL(18,2),
  ESTADO_CUENTA VARCHAR(20),
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  OBSERVACIONES VARCHAR(120),
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (id)
) RCDFMT RACMST;

LABEL ON TABLE ACMST IS 'Archivo Maestro de Cuentas de Detalle.';
LABEL ON COLUMN ACMST (id IS 'Identificador técnico',
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

CREATE INDEX idx_acmst_pk ON ACMST(id);
CREATE INDEX idx_acmst_created_at ON ACMST(created_at);


COMMENT ON TABLE ACMST IS 'Archivo Maestro de Cuentas de Detalle.';
LABEL ON TABLE ACMST IS 'Archivo Maestro de Cuentas de Detalle.';

COMMENT ON COLUMN ACMST(
  ID IS 'Identificador técnico',
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

LABEL ON COLUMN ACMST(
  ID IS 'Identificador técnico'  LABEL ... TEXT IS 'Identificador técnico',
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

CREATE INDEX idx_acmst_pk ON ACMST(id);
CREATE INDEX idx_acmst_created_at ON ACMST(created_at);

--==============================================================
-- TABLA: UNCOL
--==============================================================
-- Nombre de la Tabla: UNCOL
-- DESCRIPCIÓN: Maestro de Retenciones.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE UNCOL (
  CODIGO_BANCO VARCHAR(20),
  CODIGO_SUCURSAL VARCHAR(20),
  NUMERO_CUENTA VARCHAR(24),
  FECHA_APERTURA DATE,
  FECHA_ULTIMA_TRANSACCION DATE,
  SALDO_ACTUAL DECIMAL(18,2),
  SALDO_DISPONIBLE DECIMAL(18,2),
  LIMITE_SOBREGIRO DECIMAL(18,2),
  ESTADO_CUENTA VARCHAR(20),
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  OBSERVACIONES VARCHAR(120),
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (codigo_banco, codigo_sucursal, numero_cuenta)
) RCDFMT RUNCOL;

LABEL ON TABLE UNCOL IS 'Maestro de Retenciones.';
LABEL ON COLUMN UNCOL (codigo_banco IS 'Banco',
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

CREATE INDEX idx_uncol_pk ON UNCOL(codigo_banco, codigo_sucursal, numero_cuenta);
CREATE INDEX idx_uncol_created_at ON UNCOL(created_at);


COMMENT ON TABLE UNCOL IS 'Maestro de Retenciones.';
LABEL ON TABLE UNCOL IS 'Maestro de Retenciones.';

COMMENT ON COLUMN UNCOL(
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

LABEL ON COLUMN UNCOL(
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

CREATE INDEX idx_uncol_pk ON UNCOL(codigo_banco, codigo_sucursal, numero_cuenta);
CREATE INDEX idx_uncol_created_at ON UNCOL(created_at);

--==============================================================
-- TABLA: OFMST
--==============================================================
-- Nombre de la Tabla: OFMST
-- DESCRIPCIÓN: Cheques certificados y gerencia.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE OFMST (
  CODIGO_BANCO VARCHAR(20),
  CODIGO_SUCURSAL VARCHAR(20),
  NUMERO_CHEQUE VARCHAR(30),
  FECHA_APERTURA DATE,
  FECHA_ULTIMA_TRANSACCION DATE,
  SALDO_ACTUAL DECIMAL(18,2),
  SALDO_DISPONIBLE DECIMAL(18,2),
  LIMITE_SOBREGIRO DECIMAL(18,2),
  ESTADO_CUENTA VARCHAR(20),
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  OBSERVACIONES VARCHAR(120),
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (codigo_banco, codigo_sucursal, numero_cheque)
) RCDFMT ROFMST;

LABEL ON TABLE OFMST IS 'Cheques certificados y gerencia.';
LABEL ON COLUMN OFMST (codigo_banco IS 'Banco',
  codigo_sucursal IS 'Sucursal',
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

CREATE INDEX idx_ofmst_pk ON OFMST(codigo_banco, codigo_sucursal, numero_cheque);
CREATE INDEX idx_ofmst_created_at ON OFMST(created_at);


COMMENT ON TABLE OFMST IS 'Cheques certificados y gerencia.';
LABEL ON TABLE OFMST IS 'Cheques certificados y gerencia.';

COMMENT ON COLUMN OFMST(
  CODIGO_BANCO IS 'Banco',
  CODIGO_SUCURSAL IS 'Sucursal',
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

LABEL ON COLUMN OFMST(
  CODIGO_BANCO IS 'Banco'  LABEL ... TEXT IS 'Banco',
  CODIGO_SUCURSAL IS 'Sucursal'  LABEL ... TEXT IS 'Sucursal',
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

CREATE INDEX idx_ofmst_pk ON OFMST(codigo_banco, codigo_sucursal, numero_cheque);
CREATE INDEX idx_ofmst_created_at ON OFMST(created_at);

--==============================================================
-- TABLA: OVDRF
--==============================================================
-- Nombre de la Tabla: OVDRF
-- DESCRIPCIÓN: Archivo diario de Sobregiros.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE OVDRF (
  ID BIGINT GENERATED ALWAYS AS IDENTITY,
  FECHA_APERTURA DATE,
  FECHA_ULTIMA_TRANSACCION DATE,
  SALDO_ACTUAL DECIMAL(18,2),
  SALDO_DISPONIBLE DECIMAL(18,2),
  LIMITE_SOBREGIRO DECIMAL(18,2),
  ESTADO_CUENTA VARCHAR(20),
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  OBSERVACIONES VARCHAR(120),
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (id)
) RCDFMT ROVDRF;

LABEL ON TABLE OVDRF IS 'Archivo diario de Sobregiros.';
LABEL ON COLUMN OVDRF (id IS 'Identificador técnico',
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

CREATE INDEX idx_ovdrf_pk ON OVDRF(id);
CREATE INDEX idx_ovdrf_created_at ON OVDRF(created_at);


COMMENT ON TABLE OVDRF IS 'Archivo diario de Sobregiros.';
LABEL ON TABLE OVDRF IS 'Archivo diario de Sobregiros.';

COMMENT ON COLUMN OVDRF(
  ID IS 'Identificador técnico',
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

LABEL ON COLUMN OVDRF(
  ID IS 'Identificador técnico'  LABEL ... TEXT IS 'Identificador técnico',
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

CREATE INDEX idx_ovdrf_pk ON OVDRF(id);
CREATE INDEX idx_ovdrf_created_at ON OVDRF(created_at);

--==============================================================
-- TABLA: CDRTE
--==============================================================
-- Nombre de la Tabla: CDRTE
-- DESCRIPCIÓN: Tabla de Tasas de Depósitos
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CDRTE (
  NUMERO_TABLA VARCHAR(30),
  FECHA DATE,
  CODIGO_MONEDA VARCHAR(20),
  FECHA_DESEMBOLSO DATE,
  FECHA_VENCIMIENTO DATE,
  MONTO_ORIGINAL DECIMAL(18,2),
  SALDO_ACTUAL DECIMAL(18,2),
  TASA_INTERES DECIMAL(18,2),
  PLAZO_MESES INT,
  DIAS_MORA INT,
  ESTADO_OPERACION VARCHAR(20),
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  OBSERVACIONES VARCHAR(120),
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (numero_tabla, fecha)
) RCDFMT RCDRTE;

LABEL ON TABLE CDRTE IS 'Tabla de Tasas de Depósitos';
LABEL ON COLUMN CDRTE (
  numero_tabla IS 'Número de Tabla',
  fecha IS 'Fecha',
  codigo_moneda IS 'Código de Moneda',
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

CREATE INDEX idx_cdrte_pk ON CDRTE(numero_tabla, fecha);
CREATE INDEX idx_cdrte_fecha ON CDRTE(fecha);


COMMENT ON TABLE CDRTE IS 'Tabla de Tasas de Depósitos';
LABEL ON TABLE CDRTE IS 'Tabla de Tasas de Depósitos';

COMMENT ON COLUMN CDRTE(
  NUMERO_TABLA IS 'Número de Tabla',
  FECHA IS 'Fecha',
  CODIGO_MONEDA IS 'Código de Moneda',
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

LABEL ON COLUMN CDRTE(
  NUMERO_TABLA IS 'Número de Tabla'  LABEL ... TEXT IS 'Número de Tabla',
  FECHA IS 'Fecha'  LABEL ... TEXT IS 'Fecha',
  CODIGO_MONEDA IS 'Código de Moneda'  LABEL ... TEXT IS 'Código de Moneda',
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

CREATE INDEX idx_cdrte_pk ON CDRTE(numero_tabla, fecha);
CREATE INDEX idx_cdrte_fecha ON CDRTE(fecha);

--==============================================================
-- TABLA: BUMST
--==============================================================
-- Nombre de la Tabla: BUMST
-- DESCRIPCIÓN: Maestro de Presupuestos
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE BUMST (
  CODIGO_BANCO VARCHAR(20),
  CODIGO_SUCURSAL VARCHAR(20),
  CODIGO_MONEDA VARCHAR(20),
  NUMERO_PRESUPUESTO VARCHAR(30),
  CENTRO_COSTO VARCHAR(50),
  DESCRIPCION_CUENTA VARCHAR(120),
  NATURALEZA_CUENTA VARCHAR(20),
  NIVEL_CUENTA VARCHAR(50),
  SALDO_ACTUAL DECIMAL(18,2),
  FECHA_PROCESO_SISTEMA TIMESTAMP,
  OBSERVACIONES VARCHAR(120),
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (codigo_banco, codigo_sucursal)
) RCDFMT RBUMST;

LABEL ON TABLE BUMST IS 'Maestro de Presupuestos';
LABEL ON COLUMN BUMST (
  codigo_banco IS 'Código de Banco',
  codigo_sucursal IS 'Código de Sucursal',
  codigo_moneda IS 'Código de Moneda',
  numero_presupuesto IS 'Número de Presupuesto',
  centro_costo IS 'Centro de Costo',
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

CREATE INDEX idx_bumst_pk ON BUMST(codigo_banco, codigo_sucursal);
CREATE INDEX idx_bumst_created_at ON BUMST(created_at);


COMMENT ON TABLE BUMST IS 'Maestro de Presupuestos';
LABEL ON TABLE BUMST IS 'Maestro de Presupuestos';

COMMENT ON COLUMN BUMST(
  CODIGO_BANCO IS 'Código de Banco',
  CODIGO_SUCURSAL IS 'Código de Sucursal',
  CODIGO_MONEDA IS 'Código de Moneda',
  NUMERO_PRESUPUESTO IS 'Número de Presupuesto',
  CENTRO_COSTO IS 'Centro de Costo',
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

LABEL ON COLUMN BUMST(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  CODIGO_SUCURSAL IS 'Código de Sucursal'  LABEL ... TEXT IS 'Código de Sucursal',
  CODIGO_MONEDA IS 'Código de Moneda'  LABEL ... TEXT IS 'Código de Moneda',
  NUMERO_PRESUPUESTO IS 'Número de Presupuesto'  LABEL ... TEXT IS 'Número de Presupuesto',
  CENTRO_COSTO IS 'Centro de Costo'  LABEL ... TEXT IS 'Centro de Costo',
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

CREATE INDEX idx_bumst_pk ON BUMST(codigo_banco, codigo_sucursal);
CREATE INDEX idx_bumst_created_at ON BUMST(created_at);

--==============================================================
-- TABLA: ROCOL
--==============================================================
-- Nombre de la Tabla: ROCOL
-- DESCRIPCIÓN: Maestro de Garantías
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE ROCOL (
  CODIGO_BANCO VARCHAR(20),
  ID_CLIENTE VARCHAR(30),
  NUMERO_GARANTIA VARCHAR(30),
  TIPO_GARANTIA VARCHAR(20),
  VALOR_GARANTIA DECIMAL(18,2),
  FECHA_AVALUO DATE,
  FECHA_VENCIMIENTO DATE,
  ESTADO_GARANTIA VARCHAR(20),
  OBSERVACIONES VARCHAR(120),
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (codigo_banco, id_cliente)
) RCDFMT RROCOL;

LABEL ON TABLE ROCOL IS 'Maestro de Garantías';
LABEL ON COLUMN ROCOL (
  codigo_banco IS 'Código de Banco',
  id_cliente IS 'ID Cliente',
  numero_garantia IS 'Número de Garantía',
  tipo_garantia IS 'Tipo de Garantía',
  valor_garantia IS 'Valor de la Garantía',
  fecha_avaluo IS 'Fecha de avalúo',
  fecha_vencimiento IS 'Fecha de vencimiento',
  estado_garantia IS 'Estado de la Garantía',
  observaciones IS 'Observaciones',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_rocol_pk ON ROCOL(codigo_banco, id_cliente);
CREATE INDEX idx_rocol_created_at ON ROCOL(created_at);


COMMENT ON TABLE ROCOL IS 'Maestro de Garantías';
LABEL ON TABLE ROCOL IS 'Maestro de Garantías';

COMMENT ON COLUMN ROCOL(
  CODIGO_BANCO IS 'Código de Banco',
  ID_CLIENTE IS 'ID Cliente',
  NUMERO_GARANTIA IS 'Número de Garantía',
  TIPO_GARANTIA IS 'Tipo de Garantía',
  VALOR_GARANTIA IS 'Valor de la Garantía',
  FECHA_AVALUO IS 'Fecha de avalúo',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  ESTADO_GARANTIA IS 'Estado de la Garantía',
  OBSERVACIONES IS 'Observaciones',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN ROCOL(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  ID_CLIENTE IS 'ID Cliente'  LABEL ... TEXT IS 'ID Cliente',
  NUMERO_GARANTIA IS 'Número de Garantía'  LABEL ... TEXT IS 'Número de Garantía',
  TIPO_GARANTIA IS 'Tipo de Garantía'  LABEL ... TEXT IS 'Tipo de Garantía',
  VALOR_GARANTIA IS 'Valor de la Garantía'  LABEL ... TEXT IS 'Valor de la Garantía',
  FECHA_AVALUO IS 'Fecha de avalúo'  LABEL ... TEXT IS 'Fecha de avalúo',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  ESTADO_GARANTIA IS 'Estado de la Garantía'  LABEL ... TEXT IS 'Estado de la Garantía',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_rocol_pk ON ROCOL(codigo_banco, id_cliente);
CREATE INDEX idx_rocol_created_at ON ROCOL(created_at);

--==============================================================
-- TABLA: RCOLL
--==============================================================
-- Nombre de la Tabla: RCOLL
-- DESCRIPCIÓN: Relaciones entre Garantías
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE RCOLL (
  CODIGO_BANCO VARCHAR(20),
  CUENTA_A_GARANTIZAR VARCHAR(50),
  CUENTA_QUE_GARANTIZA VARCHAR(50),
  TIPO_GARANTIA VARCHAR(20),
  VALOR_GARANTIA DECIMAL(18,2),
  FECHA_AVALUO DATE,
  FECHA_VENCIMIENTO DATE,
  ESTADO_GARANTIA VARCHAR(20),
  OBSERVACIONES VARCHAR(120),
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (codigo_banco, cuenta_a_garantizar)
) RCDFMT RRCOLL;

LABEL ON TABLE RCOLL IS 'Relaciones entre Garantías';
LABEL ON COLUMN RCOLL (
  codigo_banco IS 'Código de Banco',
  cuenta_a_garantizar IS 'Cuenta a Garantizar',
  cuenta_que_garantiza IS 'Cuenta que Garantiza',
  tipo_garantia IS 'Tipo de Garantía',
  valor_garantia IS 'Valor de la Garantía',
  fecha_avaluo IS 'Fecha de avalúo',
  fecha_vencimiento IS 'Fecha de vencimiento',
  estado_garantia IS 'Estado de la Garantía',
  observaciones IS 'Observaciones',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_rcoll_pk ON RCOLL(codigo_banco, cuenta_a_garantizar);
CREATE INDEX idx_rcoll_created_at ON RCOLL(created_at);


COMMENT ON TABLE RCOLL IS 'Relaciones entre Garantías';
LABEL ON TABLE RCOLL IS 'Relaciones entre Garantías';

COMMENT ON COLUMN RCOLL(
  CODIGO_BANCO IS 'Código de Banco',
  CUENTA_A_GARANTIZAR IS 'Cuenta a Garantizar',
  CUENTA_QUE_GARANTIZA IS 'Cuenta que Garantiza',
  TIPO_GARANTIA IS 'Tipo de Garantía',
  VALOR_GARANTIA IS 'Valor de la Garantía',
  FECHA_AVALUO IS 'Fecha de avalúo',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  ESTADO_GARANTIA IS 'Estado de la Garantía',
  OBSERVACIONES IS 'Observaciones',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN RCOLL(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  CUENTA_A_GARANTIZAR IS 'Cuenta a Garantizar'  LABEL ... TEXT IS 'Cuenta a Garantizar',
  CUENTA_QUE_GARANTIZA IS 'Cuenta que Garantiza'  LABEL ... TEXT IS 'Cuenta que Garantiza',
  TIPO_GARANTIA IS 'Tipo de Garantía'  LABEL ... TEXT IS 'Tipo de Garantía',
  VALOR_GARANTIA IS 'Valor de la Garantía'  LABEL ... TEXT IS 'Valor de la Garantía',
  FECHA_AVALUO IS 'Fecha de avalúo'  LABEL ... TEXT IS 'Fecha de avalúo',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  ESTADO_GARANTIA IS 'Estado de la Garantía'  LABEL ... TEXT IS 'Estado de la Garantía',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_rcoll_pk ON RCOLL(codigo_banco, cuenta_a_garantizar);
CREATE INDEX idx_rcoll_created_at ON RCOLL(created_at);

--==============================================================
-- TABLA: FIXMS
--==============================================================
-- Nombre de la Tabla: FIXMS
-- DESCRIPCIÓN: Maestro de Activos Fijos
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE FIXMS (
  NUMERO_ACTIVO VARCHAR(30),
  DESCRIPCION VARCHAR(120),
  FECHA_ADQUISICION DATE,
  VALOR_ADQUISICION DECIMAL(18,2),
  VIDA_UTIL_MESES INT,
  DEPRECIACION_ACUMULADA DECIMAL(18,2),
  ESTADO_ACTIVO VARCHAR(20),
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  OBSERVACIONES VARCHAR(120),
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (numero_activo)
) RCDFMT RFIXMS;

LABEL ON TABLE FIXMS IS 'Maestro de Activos Fijos';
LABEL ON COLUMN FIXMS (
  numero_activo IS 'Número de Activo',
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

CREATE INDEX idx_fixms_pk ON FIXMS(numero_activo);
CREATE INDEX idx_fixms_created_at ON FIXMS(created_at);


COMMENT ON TABLE FIXMS IS 'Maestro de Activos Fijos';
LABEL ON TABLE FIXMS IS 'Maestro de Activos Fijos';

COMMENT ON COLUMN FIXMS(
  NUMERO_ACTIVO IS 'Número de Activo',
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

LABEL ON COLUMN FIXMS(
  NUMERO_ACTIVO IS 'Número de Activo'  LABEL ... TEXT IS 'Número de Activo',
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

CREATE INDEX idx_fixms_pk ON FIXMS(numero_activo);
CREATE INDEX idx_fixms_created_at ON FIXMS(created_at);

--==============================================================
-- TABLA: CLSMS
--==============================================================
-- Nombre de la Tabla: CLSMS
-- DESCRIPCIÓN: Clases de amortización de activos fijos
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CLSMS (
  CODIGO_CLASE VARCHAR(20),
  DESCRIPCION VARCHAR(120),
  FECHA_ADQUISICION DATE,
  VALOR_ADQUISICION DECIMAL(18,2),
  VIDA_UTIL_MESES INT,
  DEPRECIACION_ACUMULADA DECIMAL(18,2),
  ESTADO_ACTIVO VARCHAR(20),
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  OBSERVACIONES VARCHAR(120),
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (codigo_clase)
) RCDFMT RCLSMS;

LABEL ON TABLE CLSMS IS 'Clases de amortización de activos fijos';
LABEL ON COLUMN CLSMS (
  codigo_clase IS 'Código de Clase',
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

CREATE INDEX idx_clsms_pk ON CLSMS(codigo_clase);
CREATE INDEX idx_clsms_created_at ON CLSMS(created_at);


COMMENT ON TABLE CLSMS IS 'Clases de amortización de activos fijos';
LABEL ON TABLE CLSMS IS 'Clases de amortización de activos fijos';

COMMENT ON COLUMN CLSMS(
  CODIGO_CLASE IS 'Código de Clase',
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

LABEL ON COLUMN CLSMS(
  CODIGO_CLASE IS 'Código de Clase'  LABEL ... TEXT IS 'Código de Clase',
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

CREATE INDEX idx_clsms_pk ON CLSMS(codigo_clase);
CREATE INDEX idx_clsms_created_at ON CLSMS(created_at);

--==============================================================
-- TABLA: LOCMS
--==============================================================
-- Nombre de la Tabla: LOCMS
-- DESCRIPCIÓN: Maestro de Localizaciones de Activos Fijos
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE LOCMS (
  NUMERO_LOCALIZACION VARCHAR(30),
  DESCRIPCION VARCHAR(120),
  FECHA_ADQUISICION DATE,
  VALOR_ADQUISICION DECIMAL(18,2),
  VIDA_UTIL_MESES INT,
  DEPRECIACION_ACUMULADA DECIMAL(18,2),
  ESTADO_ACTIVO VARCHAR(20),
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  OBSERVACIONES VARCHAR(120),
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (numero_localizacion)
) RCDFMT RLOCMS;

LABEL ON TABLE LOCMS IS 'Maestro de Localizaciones de Activos Fijos';
LABEL ON COLUMN LOCMS (
  numero_localizacion IS 'Número de Localización',
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

CREATE INDEX idx_locms_pk ON LOCMS(numero_localizacion);
CREATE INDEX idx_locms_created_at ON LOCMS(created_at);


COMMENT ON TABLE LOCMS IS 'Maestro de Localizaciones de Activos Fijos';
LABEL ON TABLE LOCMS IS 'Maestro de Localizaciones de Activos Fijos';

COMMENT ON COLUMN LOCMS(
  NUMERO_LOCALIZACION IS 'Número de Localización',
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

LABEL ON COLUMN LOCMS(
  NUMERO_LOCALIZACION IS 'Número de Localización'  LABEL ... TEXT IS 'Número de Localización',
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

CREATE INDEX idx_locms_pk ON LOCMS(numero_localizacion);
CREATE INDEX idx_locms_created_at ON LOCMS(created_at);

--==============================================================
-- TABLA: BAVEN
--==============================================================
-- Nombre de la Tabla: BAVEN
-- DESCRIPCIÓN: Maestro de Proveedores.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE BAVEN (
  NUMERO_PROVEEDOR VARCHAR(30),
  NUMERO_IDENTIFICACION VARCHAR(30),
  RAZON_SOCIAL VARCHAR(80),
  EMAIL VARCHAR(80),
  TELEFONO VARCHAR(80),
  MONTO_ORIGINAL DECIMAL(18,2),
  SALDO_PENDIENTE DECIMAL(18,2),
  FECHA_EMISION DATE,
  FECHA_VENCIMIENTO DATE,
  ESTADO_CXP VARCHAR(20),
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  OBSERVACIONES VARCHAR(120),
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (numero_proveedor)
) RCDFMT RBAVEN;

LABEL ON TABLE BAVEN IS 'Maestro de Proveedores.';
LABEL ON COLUMN BAVEN (
  numero_proveedor IS 'Número de Proveedor',
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

CREATE INDEX idx_baven_pk ON BAVEN(numero_proveedor);
CREATE INDEX idx_baven_created_at ON BAVEN(created_at);


COMMENT ON TABLE BAVEN IS 'Maestro de Proveedores.';
LABEL ON TABLE BAVEN IS 'Maestro de Proveedores.';

COMMENT ON COLUMN BAVEN(
  NUMERO_PROVEEDOR IS 'Número de Proveedor',
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

LABEL ON COLUMN BAVEN(
  NUMERO_PROVEEDOR IS 'Número de Proveedor'  LABEL ... TEXT IS 'Número de Proveedor',
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

CREATE INDEX idx_baven_pk ON BAVEN(numero_proveedor);
CREATE INDEX idx_baven_created_at ON BAVEN(created_at);

--==============================================================
-- TABLA: BAPRC
--==============================================================
-- Nombre de la Tabla: BAPRC
-- DESCRIPCIÓN: Maestro de Cuentas por Pagar
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE BAPRC (
  CODIGO_BANCO VARCHAR(20),
  CODIGO_SUCURSAL VARCHAR(20),
  ORIGEN_CUENTA VARCHAR(20),
  TIPO_CUENTA VARCHAR(20),
  ID_CLIENTE VARCHAR(30),
  NUMERO_REFERENCIA VARCHAR(30),
  TIPO_REGISTRO VARCHAR(20),
  NUMERO_IDENTIFICACION VARCHAR(30),
  RAZON_SOCIAL VARCHAR(80),
  EMAIL VARCHAR(80),
  TELEFONO VARCHAR(80),
  MONTO_ORIGINAL DECIMAL(18,2),
  SALDO_PENDIENTE DECIMAL(18,2),
  FECHA_EMISION DATE,
  FECHA_VENCIMIENTO DATE,
  ESTADO_CXP VARCHAR(20),
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  OBSERVACIONES VARCHAR(120),
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (codigo_banco, codigo_sucursal)
) RCDFMT RBAPRC;

LABEL ON TABLE BAPRC IS 'Maestro de Cuentas por Pagar';
LABEL ON COLUMN BAPRC (
  codigo_banco IS 'Código de Banco',
  codigo_sucursal IS 'Código de Sucursal',
  origen_cuenta IS 'Origen de Cuenta',
  tipo_cuenta IS 'Tipo de Cuenta',
  id_cliente IS 'ID Cliente',
  numero_referencia IS 'Número de Referencia',
  tipo_registro IS 'Tipo de Registro',
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

CREATE INDEX idx_baprc_pk ON BAPRC(codigo_banco, codigo_sucursal);
CREATE INDEX idx_baprc_created_at ON BAPRC(created_at);


COMMENT ON TABLE BAPRC IS 'Maestro de Cuentas por Pagar';
LABEL ON TABLE BAPRC IS 'Maestro de Cuentas por Pagar';

COMMENT ON COLUMN BAPRC(
  CODIGO_BANCO IS 'Código de Banco',
  CODIGO_SUCURSAL IS 'Código de Sucursal',
  ORIGEN_CUENTA IS 'Origen de Cuenta',
  TIPO_CUENTA IS 'Tipo de Cuenta',
  ID_CLIENTE IS 'ID Cliente',
  NUMERO_REFERENCIA IS 'Número de Referencia',
  TIPO_REGISTRO IS 'Tipo de Registro',
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

LABEL ON COLUMN BAPRC(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  CODIGO_SUCURSAL IS 'Código de Sucursal'  LABEL ... TEXT IS 'Código de Sucursal',
  ORIGEN_CUENTA IS 'Origen de Cuenta'  LABEL ... TEXT IS 'Origen de Cuenta',
  TIPO_CUENTA IS 'Tipo de Cuenta'  LABEL ... TEXT IS 'Tipo de Cuenta',
  ID_CLIENTE IS 'ID Cliente'  LABEL ... TEXT IS 'ID Cliente',
  NUMERO_REFERENCIA IS 'Número de Referencia'  LABEL ... TEXT IS 'Número de Referencia',
  TIPO_REGISTRO IS 'Tipo de Registro'  LABEL ... TEXT IS 'Tipo de Registro',
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

CREATE INDEX idx_baprc_pk ON BAPRC(codigo_banco, codigo_sucursal);
CREATE INDEX idx_baprc_created_at ON BAPRC(created_at);

--==============================================================
-- TABLA: BAMOR
--==============================================================
-- Nombre de la Tabla: BAMOR
-- DESCRIPCIÓN: Amortizaciones de Cuentas por Pagar
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE BAMOR (
  CODIGO_BANCO VARCHAR(20),
  CODIGO_SUCURSAL VARCHAR(20),
  ORIGEN_CUENTA VARCHAR(20),
  TIPO_CUENTA VARCHAR(20),
  ID_CLIENTE VARCHAR(30),
  NUMERO_REFERENCIA VARCHAR(30),
  TIPO_REGISTRO VARCHAR(20),
  NUMERO_IDENTIFICACION VARCHAR(30),
  RAZON_SOCIAL VARCHAR(80),
  EMAIL VARCHAR(80),
  TELEFONO VARCHAR(80),
  MONTO_ORIGINAL DECIMAL(18,2),
  SALDO_PENDIENTE DECIMAL(18,2),
  FECHA_EMISION DATE,
  FECHA_VENCIMIENTO DATE,
  ESTADO_CXP VARCHAR(20),
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  OBSERVACIONES VARCHAR(120),
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (codigo_banco, codigo_sucursal)
) RCDFMT RBAMOR;

LABEL ON TABLE BAMOR IS 'Amortizaciones de Cuentas por Pagar';
LABEL ON COLUMN BAMOR (
  codigo_banco IS 'Código de Banco',
  codigo_sucursal IS 'Código de Sucursal',
  origen_cuenta IS 'Origen de Cuenta',
  tipo_cuenta IS 'Tipo de Cuenta',
  id_cliente IS 'ID Cliente',
  numero_referencia IS 'Número de Referencia',
  tipo_registro IS 'Tipo de Registro',
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

CREATE INDEX idx_bamor_pk ON BAMOR(codigo_banco, codigo_sucursal);
CREATE INDEX idx_bamor_created_at ON BAMOR(created_at);


COMMENT ON TABLE BAMOR IS 'Amortizaciones de Cuentas por Pagar';
LABEL ON TABLE BAMOR IS 'Amortizaciones de Cuentas por Pagar';

COMMENT ON COLUMN BAMOR(
  CODIGO_BANCO IS 'Código de Banco',
  CODIGO_SUCURSAL IS 'Código de Sucursal',
  ORIGEN_CUENTA IS 'Origen de Cuenta',
  TIPO_CUENTA IS 'Tipo de Cuenta',
  ID_CLIENTE IS 'ID Cliente',
  NUMERO_REFERENCIA IS 'Número de Referencia',
  TIPO_REGISTRO IS 'Tipo de Registro',
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

LABEL ON COLUMN BAMOR(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  CODIGO_SUCURSAL IS 'Código de Sucursal'  LABEL ... TEXT IS 'Código de Sucursal',
  ORIGEN_CUENTA IS 'Origen de Cuenta'  LABEL ... TEXT IS 'Origen de Cuenta',
  TIPO_CUENTA IS 'Tipo de Cuenta'  LABEL ... TEXT IS 'Tipo de Cuenta',
  ID_CLIENTE IS 'ID Cliente'  LABEL ... TEXT IS 'ID Cliente',
  NUMERO_REFERENCIA IS 'Número de Referencia'  LABEL ... TEXT IS 'Número de Referencia',
  TIPO_REGISTRO IS 'Tipo de Registro'  LABEL ... TEXT IS 'Tipo de Registro',
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

CREATE INDEX idx_bamor_pk ON BAMOR(codigo_banco, codigo_sucursal);
CREATE INDEX idx_bamor_created_at ON BAMOR(created_at);

--==============================================================
-- TABLA: BAINP
--==============================================================
-- Nombre de la Tabla: BAINP
-- DESCRIPCIÓN: Transacciones contables de cuentas por pagar
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE BAINP (
  NUMERO_BATCH VARCHAR(30),
  SECUENCIA INT,
  NUMERO_IDENTIFICACION VARCHAR(30),
  RAZON_SOCIAL VARCHAR(80),
  EMAIL VARCHAR(80),
  TELEFONO VARCHAR(80),
  MONTO_ORIGINAL DECIMAL(18,2),
  SALDO_PENDIENTE DECIMAL(18,2),
  FECHA_EMISION DATE,
  FECHA_VENCIMIENTO DATE,
  ESTADO_CXP VARCHAR(20),
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  OBSERVACIONES VARCHAR(120),
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (numero_batch, secuencia)
) RCDFMT RBAINP;

LABEL ON TABLE BAINP IS 'Transacciones contables de cuentas por pagar';
LABEL ON COLUMN BAINP (
  numero_batch IS 'Número Batch',
  secuencia IS 'Secuencia',
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

CREATE INDEX idx_bainp_pk ON BAINP(numero_batch, secuencia);
CREATE INDEX idx_bainp_created_at ON BAINP(created_at);


COMMENT ON TABLE BAINP IS 'Transacciones contables de cuentas por pagar';
LABEL ON TABLE BAINP IS 'Transacciones contables de cuentas por pagar';

COMMENT ON COLUMN BAINP(
  NUMERO_BATCH IS 'Número Batch',
  SECUENCIA IS 'Secuencia',
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

LABEL ON COLUMN BAINP(
  NUMERO_BATCH IS 'Número Batch'  LABEL ... TEXT IS 'Número Batch',
  SECUENCIA IS 'Secuencia'  LABEL ... TEXT IS 'Secuencia',
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

CREATE INDEX idx_bainp_pk ON BAINP(numero_batch, secuencia);
CREATE INDEX idx_bainp_created_at ON BAINP(created_at);

--==============================================================
-- TABLA: BAHIS
--==============================================================
-- Nombre de la Tabla: BAHIS
-- DESCRIPCIÓN: Histórico de Cuentas por Pagar
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE BAHIS (
  CODIGO_BANCO VARCHAR(20),
  ORIGEN_CUENTA VARCHAR(20),
  TIPO_CUENTA VARCHAR(20),
  ID_CLIENTE VARCHAR(30),
  NUMERO_REFERENCIA VARCHAR(30),
  FECHA DATE,
  NUMERO_IDENTIFICACION VARCHAR(30),
  RAZON_SOCIAL VARCHAR(80),
  EMAIL VARCHAR(80),
  TELEFONO VARCHAR(80),
  MONTO_ORIGINAL DECIMAL(18,2),
  SALDO_PENDIENTE DECIMAL(18,2),
  FECHA_EMISION DATE,
  FECHA_VENCIMIENTO DATE,
  ESTADO_CXP VARCHAR(20),
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  OBSERVACIONES VARCHAR(120),
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (codigo_banco, origen_cuenta)
) RCDFMT RBAHIS;

LABEL ON TABLE BAHIS IS 'Histórico de Cuentas por Pagar';
LABEL ON COLUMN BAHIS (
  codigo_banco IS 'Código de Banco',
  origen_cuenta IS 'Origen de Cuenta',
  tipo_cuenta IS 'Tipo de Cuenta',
  id_cliente IS 'ID Cliente',
  numero_referencia IS 'Número de Referencia',
  fecha IS 'Fecha',
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

CREATE INDEX idx_bahis_pk ON BAHIS(codigo_banco, origen_cuenta);
CREATE INDEX idx_bahis_fecha ON BAHIS(fecha);


COMMENT ON TABLE BAHIS IS 'Histórico de Cuentas por Pagar';
LABEL ON TABLE BAHIS IS 'Histórico de Cuentas por Pagar';

COMMENT ON COLUMN BAHIS(
  CODIGO_BANCO IS 'Código de Banco',
  ORIGEN_CUENTA IS 'Origen de Cuenta',
  TIPO_CUENTA IS 'Tipo de Cuenta',
  ID_CLIENTE IS 'ID Cliente',
  NUMERO_REFERENCIA IS 'Número de Referencia',
  FECHA IS 'Fecha',
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

LABEL ON COLUMN BAHIS(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  ORIGEN_CUENTA IS 'Origen de Cuenta'  LABEL ... TEXT IS 'Origen de Cuenta',
  TIPO_CUENTA IS 'Tipo de Cuenta'  LABEL ... TEXT IS 'Tipo de Cuenta',
  ID_CLIENTE IS 'ID Cliente'  LABEL ... TEXT IS 'ID Cliente',
  NUMERO_REFERENCIA IS 'Número de Referencia'  LABEL ... TEXT IS 'Número de Referencia',
  FECHA IS 'Fecha'  LABEL ... TEXT IS 'Fecha',
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

CREATE INDEX idx_bahis_pk ON BAHIS(codigo_banco, origen_cuenta);
CREATE INDEX idx_bahis_fecha ON BAHIS(fecha);

--==============================================================
-- TABLA: USERS
--==============================================================
-- Nombre de la Tabla: USERS
-- DESCRIPCIÓN: Usuarios del Sistema.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE USERS (
  ID_USUARIO VARCHAR(30),
  NOMBRE_USUARIO VARCHAR(80),
  EMAIL VARCHAR(80),
  ROL_USUARIO VARCHAR(50),
  ESTADO_USUARIO VARCHAR(20),
  FECHA_CREACION DATE,
  FECHA_ULTIMO_ACCESO DATE,
  TELEFONO VARCHAR(30),
  DEPARTAMENTO VARCHAR(60),
  UBICACION VARCHAR(60),
  USUARIO_CREACION VARCHAR(30),
  USUARIO_ACTUALIZACION VARCHAR(30),
  VERSION_REGISTRO INT,
  OBSERVACIONES VARCHAR(120),
  ESTADO_REGISTRO CHAR(1),
  CREATED_AT TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP,
  PRIMARY KEY (id_usuario)
) RCDFMT RUSERS;

LABEL ON TABLE USERS IS 'Usuarios del Sistema.';
LABEL ON COLUMN USERS (
  id_usuario IS 'ID de Usuario',
  nombre_usuario IS 'Nombre de Usuario',
  email IS 'Correo Electrónico',
  rol_usuario IS 'Rol de Usuario',
  estado_usuario IS 'Estado del Usuario',
  fecha_creacion IS 'Fecha de creación',
  fecha_ultimo_acceso IS 'Fecha de último acceso',
  telefono IS 'Teléfono',
  departamento IS 'Departamento',
  ubicacion IS 'Ubicación',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_users_pk ON USERS(id_usuario);
CREATE INDEX idx_users_email ON USERS(email);
CREATE INDEX idx_users_created_at ON USERS(created_at);


COMMENT ON TABLE USERS IS 'Usuarios del Sistema.';
LABEL ON TABLE USERS IS 'Usuarios del Sistema.';

COMMENT ON COLUMN USERS(
  ID_USUARIO IS 'ID de Usuario',
  NOMBRE_USUARIO IS 'Nombre de Usuario',
  EMAIL IS 'Correo Electrónico',
  ROL_USUARIO IS 'Rol de Usuario',
  ESTADO_USUARIO IS 'Estado del Usuario',
  FECHA_CREACION IS 'Fecha de creación',
  FECHA_ULTIMO_ACCESO IS 'Fecha de último acceso',
  TELEFONO IS 'Teléfono',
  DEPARTAMENTO IS 'Departamento',
  UBICACION IS 'Ubicación',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN USERS(
  ID_USUARIO IS 'ID de Usuario'  LABEL ... TEXT IS 'ID de Usuario',
  NOMBRE_USUARIO IS 'Nombre de Usuario'  LABEL ... TEXT IS 'Nombre de Usuario',
  EMAIL IS 'Correo Electrónico'  LABEL ... TEXT IS 'Correo Electrónico',
  ROL_USUARIO IS 'Rol de Usuario'  LABEL ... TEXT IS 'Rol de Usuario',
  ESTADO_USUARIO IS 'Estado del Usuario'  LABEL ... TEXT IS 'Estado del Usuario',
  FECHA_CREACION IS 'Fecha de creación'  LABEL ... TEXT IS 'Fecha de creación',
  FECHA_ULTIMO_ACCESO IS 'Fecha de último acceso'  LABEL ... TEXT IS 'Fecha de último acceso',
  TELEFONO IS 'Teléfono'  LABEL ... TEXT IS 'Teléfono',
  DEPARTAMENTO IS 'Departamento'  LABEL ... TEXT IS 'Departamento',
  UBICACION IS 'Ubicación'  LABEL ... TEXT IS 'Ubicación',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_users_pk ON USERS(id_usuario);
CREATE INDEX idx_users_email ON USERS(email);
CREATE INDEX idx_users_created_at ON USERS(created_at);



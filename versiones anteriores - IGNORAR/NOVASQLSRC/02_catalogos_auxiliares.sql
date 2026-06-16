--==============================================================
-- TABLA: CNOFT
--==============================================================
-- Nombre de la Tabla: CNOFT
-- DESCRIPCIÓN: Archivo Maestro de Tablas de Datos Comunes.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CNOFT (
  CODIGO_TABLA VARCHAR(20) FOR COLUMN CODIGO_TAB,
  IDIOMA VARCHAR(20) FOR COLUMN IDIOMA,
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
  PRIMARY KEY (codigo_tabla, idioma)
) RCDFMT RCNOFT;

LABEL ON TABLE CNOFT IS 'Archivo Maestro de Tablas de Datos Comunes.';
LABEL ON COLUMN CNOFT (codigo_tabla IS 'Código de la Tabla',
  idioma IS 'Idioma',
  descripcion IS 'Descripción de la entrada',
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

CREATE INDEX idx_cnoft_pk ON CNOFT(codigo_tabla, idioma);
CREATE INDEX idx_cnoft_created_at ON CNOFT(created_at);


COMMENT ON TABLE CNOFT IS 'Archivo Maestro de Tablas de Datos Comunes.';
LABEL ON TABLE CNOFT IS 'Archivo Maestro de Tablas de Datos Comunes.';

COMMENT ON COLUMN CNOFT(
  CODIGO_TABLA IS 'Código de la Tabla',
  IDIOMA IS 'Idioma',
  DESCRIPCION IS 'Descripción de la entrada',
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

LABEL ON COLUMN CNOFT(
  CODIGO_TABLA IS 'Código de la Tabla'  LABEL ... TEXT IS 'Código de la Tabla',
  IDIOMA IS 'Idioma'  LABEL ... TEXT IS 'Idioma',
  DESCRIPCION IS 'Descripción de la entrada'  LABEL ... TEXT IS 'Descripción de la entrada',
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

CREATE INDEX idx_cnoft_pk ON CNOFT(codigo_tabla, idioma);
CREATE INDEX idx_cnoft_created_at ON CNOFT(created_at);

--==============================================================
-- TABLA: CNOFC
--==============================================================
-- Nombre de la Tabla: CNOFC
-- DESCRIPCIÓN: Archivo referencias del sistema y datos comunes.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CNOFC (
  CODIGO_TABLA VARCHAR(20) FOR COLUMN CODIGO_TAB,
  CODIGO_REGISTRO VARCHAR(20) FOR COLUMN CODIGO_REG,
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
  PRIMARY KEY (codigo_tabla, codigo_registro)
) RCDFMT RCNOFC;

LABEL ON TABLE CNOFC IS 'Archivo referencias del sistema y datos comunes.';
LABEL ON COLUMN CNOFC (codigo_tabla IS 'Código de la Tabla',
  codigo_registro IS 'Código del Registro',
  descripcion IS 'Descripción de la referencia',
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

CREATE INDEX idx_cnofc_pk ON CNOFC(codigo_tabla, codigo_registro);
CREATE INDEX idx_cnofc_created_at ON CNOFC(created_at);


COMMENT ON TABLE CNOFC IS 'Archivo referencias del sistema y datos comunes.';
LABEL ON TABLE CNOFC IS 'Archivo referencias del sistema y datos comunes.';

COMMENT ON COLUMN CNOFC(
  CODIGO_TABLA IS 'Código de la Tabla',
  CODIGO_REGISTRO IS 'Código del Registro',
  DESCRIPCION IS 'Descripción de la referencia',
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

LABEL ON COLUMN CNOFC(
  CODIGO_TABLA IS 'Código de la Tabla'  LABEL ... TEXT IS 'Código de la Tabla',
  CODIGO_REGISTRO IS 'Código del Registro'  LABEL ... TEXT IS 'Código del Registro',
  DESCRIPCION IS 'Descripción de la referencia'  LABEL ... TEXT IS 'Descripción de la referencia',
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

CREATE INDEX idx_cnofc_pk ON CNOFC(codigo_tabla, codigo_registro);
CREATE INDEX idx_cnofc_created_at ON CNOFC(created_at);

--==============================================================
-- TABLA: HEAD
--==============================================================
-- Nombre de la Tabla: HEAD
-- DESCRIPCIÓN: Archivo títulos de reportes.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE HEAD (
  NOMBRE_PRINTER_FILE VARCHAR(50) FOR COLUMN NOMBRE_PRI,
  SECUENCIA INT FOR COLUMN SECUENCIA,
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
  PRIMARY KEY (nombre_printer_file, secuencia)
) RCDFMT RHEAD;

LABEL ON TABLE HEAD IS 'Archivo títulos de reportes.';
LABEL ON COLUMN HEAD (nombre_printer_file IS 'Nombre del Printer File',
  secuencia IS 'Secuencia',
  descripcion IS 'Descripción',
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

CREATE INDEX idx_head_pk ON HEAD(nombre_printer_file, secuencia);
CREATE INDEX idx_head_created_at ON HEAD(created_at);


COMMENT ON TABLE HEAD IS 'Archivo títulos de reportes.';
LABEL ON TABLE HEAD IS 'Archivo títulos de reportes.';

COMMENT ON COLUMN HEAD(
  NOMBRE_PRINTER_FILE IS 'Nombre del Printer File',
  SECUENCIA IS 'Secuencia',
  DESCRIPCION IS 'Descripción',
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

LABEL ON COLUMN HEAD(
  NOMBRE_PRINTER_FILE IS 'Nombre del Printer File'  LABEL ... TEXT IS 'Nombre del Printer File',
  SECUENCIA IS 'Secuencia'  LABEL ... TEXT IS 'Secuencia',
  DESCRIPCION IS 'Descripción'  LABEL ... TEXT IS 'Descripción',
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

CREATE INDEX idx_head_pk ON HEAD(nombre_printer_file, secuencia);
CREATE INDEX idx_head_created_at ON HEAD(created_at);

--==============================================================
-- TABLA: MSSGS
--==============================================================
-- Nombre de la Tabla: MSSGS
-- DESCRIPCIÓN: Archivo mensajes de Errores.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE MSSGS (
  ID BIGINT FOR COLUMN ID GENERATED ALWAYS AS IDENTITY,
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
  PRIMARY KEY (id)
) RCDFMT RMSSGS;

LABEL ON TABLE MSSGS IS 'Archivo mensajes de Errores.';
LABEL ON COLUMN MSSGS (id IS 'Identificador técnico',
  descripcion IS 'Descripción del mensaje de error',
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

CREATE INDEX idx_mssgs_pk ON MSSGS(id);
CREATE INDEX idx_mssgs_created_at ON MSSGS(created_at);


COMMENT ON TABLE MSSGS IS 'Archivo mensajes de Errores.';
LABEL ON TABLE MSSGS IS 'Archivo mensajes de Errores.';

COMMENT ON COLUMN MSSGS(
  ID IS 'Identificador técnico',
  DESCRIPCION IS 'Descripción del mensaje de error',
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

LABEL ON COLUMN MSSGS(
  ID IS 'Identificador técnico'  LABEL ... TEXT IS 'Identificador técnico',
  DESCRIPCION IS 'Descripción del mensaje de error'  LABEL ... TEXT IS 'Descripción del mensaje de error',
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

CREATE INDEX idx_mssgs_pk ON MSSGS(id);
CREATE INDEX idx_mssgs_created_at ON MSSGS(created_at);

--==============================================================
-- TABLA: HOLYD
--==============================================================
-- Nombre de la Tabla: HOLYD
-- DESCRIPCIÓN: Archivo de Feriados.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE HOLYD (
  CODIGO_MONEDA VARCHAR(20) FOR COLUMN CODIGO_MON,
  FECHA DATE FOR COLUMN FECHA,
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
  PRIMARY KEY (codigo_moneda, fecha)
) RCDFMT RHOLYD;

LABEL ON TABLE HOLYD IS 'Archivo de Feriados.';
LABEL ON COLUMN HOLYD (codigo_moneda IS 'Moneda',
  fecha IS 'Fecha del feriado',
  descripcion IS 'Descripción del feriado',
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

CREATE INDEX idx_holyd_pk ON HOLYD(codigo_moneda, fecha);
CREATE INDEX idx_holyd_fecha ON HOLYD(fecha);


COMMENT ON TABLE HOLYD IS 'Archivo de Feriados.';
LABEL ON TABLE HOLYD IS 'Archivo de Feriados.';

COMMENT ON COLUMN HOLYD(
  CODIGO_MONEDA IS 'Moneda',
  FECHA IS 'Fecha del feriado',
  DESCRIPCION IS 'Descripción del feriado',
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

LABEL ON COLUMN HOLYD(
  CODIGO_MONEDA IS 'Moneda'  LABEL ... TEXT IS 'Moneda',
  FECHA IS 'Fecha del feriado'  LABEL ... TEXT IS 'Fecha del feriado',
  DESCRIPCION IS 'Descripción del feriado'  LABEL ... TEXT IS 'Descripción del feriado',
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

CREATE INDEX idx_holyd_pk ON HOLYD(codigo_moneda, fecha);
CREATE INDEX idx_holyd_fecha ON HOLYD(fecha);

--==============================================================
-- TABLA: RATES
--==============================================================
-- Nombre de la Tabla: RATES
-- DESCRIPCIÓN: Tasas de cambio por posición y contra valor.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE RATES (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_MONEDA VARCHAR(20) FOR COLUMN CODIGO_MON,
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
  PRIMARY KEY (codigo_banco, codigo_moneda)
) RCDFMT RRATES;

LABEL ON TABLE RATES IS 'Tasas de cambio por posición y contra valor.';
LABEL ON COLUMN RATES (codigo_banco IS 'Código de Banco',
  codigo_moneda IS 'Código de Moneda',
  descripcion IS 'Descripción de la tasa',
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

CREATE INDEX idx_rates_pk ON RATES(codigo_banco, codigo_moneda);
CREATE INDEX idx_rates_created_at ON RATES(created_at);


COMMENT ON TABLE RATES IS 'Tasas de cambio por posición y contra valor.';
LABEL ON TABLE RATES IS 'Tasas de cambio por posición y contra valor.';

COMMENT ON COLUMN RATES(
  CODIGO_BANCO IS 'Código de Banco',
  CODIGO_MONEDA IS 'Código de Moneda',
  DESCRIPCION IS 'Descripción de la tasa',
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

LABEL ON COLUMN RATES(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  CODIGO_MONEDA IS 'Código de Moneda'  LABEL ... TEXT IS 'Código de Moneda',
  DESCRIPCION IS 'Descripción de la tasa'  LABEL ... TEXT IS 'Descripción de la tasa',
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

CREATE INDEX idx_rates_pk ON RATES(codigo_banco, codigo_moneda);
CREATE INDEX idx_rates_created_at ON RATES(created_at);

--==============================================================
-- TABLA: RTRNS
--==============================================================
-- Nombre de la Tabla: RTRNS
-- DESCRIPCIÓN: Historia de Tasas de Cambio.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE RTRNS (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_MONEDA VARCHAR(20) FOR COLUMN CODIGO_MON,
  FECHA DATE FOR COLUMN FECHA,
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
  PRIMARY KEY (codigo_banco, codigo_moneda, fecha)
) RCDFMT RRTRNS;

LABEL ON TABLE RTRNS IS 'Historia de Tasas de Cambio.';
LABEL ON COLUMN RTRNS (codigo_banco IS 'Código de Banco',
  codigo_moneda IS 'Código de Moneda',
  fecha IS 'Fecha de la tasa',
  descripcion IS 'Descripción de la tasa',
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

CREATE INDEX idx_rtrns_pk ON RTRNS(codigo_banco, codigo_moneda, fecha);
CREATE INDEX idx_rtrns_fecha ON RTRNS(fecha);


COMMENT ON TABLE RTRNS IS 'Historia de Tasas de Cambio.';
LABEL ON TABLE RTRNS IS 'Historia de Tasas de Cambio.';

COMMENT ON COLUMN RTRNS(
  CODIGO_BANCO IS 'Código de Banco',
  CODIGO_MONEDA IS 'Código de Moneda',
  FECHA IS 'Fecha de la tasa',
  DESCRIPCION IS 'Descripción de la tasa',
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

LABEL ON COLUMN RTRNS(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  CODIGO_MONEDA IS 'Código de Moneda'  LABEL ... TEXT IS 'Código de Moneda',
  FECHA IS 'Fecha de la tasa'  LABEL ... TEXT IS 'Fecha de la tasa',
  DESCRIPCION IS 'Descripción de la tasa'  LABEL ... TEXT IS 'Descripción de la tasa',
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

CREATE INDEX idx_rtrns_pk ON RTRNS(codigo_banco, codigo_moneda, fecha);
CREATE INDEX idx_rtrns_fecha ON RTRNS(fecha);

--==============================================================
-- TABLA: HLHIS
--==============================================================
-- Nombre de la Tabla: HLHIS
-- DESCRIPCIÓN: Archivo histórico de Cambios en Retenciones.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE HLHIS (
  ID BIGINT FOR COLUMN ID GENERATED ALWAYS AS IDENTITY,
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
  PRIMARY KEY (id)
) RCDFMT RHLHIS;

LABEL ON TABLE HLHIS IS 'Archivo histórico de Cambios en Retenciones.';
LABEL ON COLUMN HLHIS (id IS 'Identificador técnico',
  descripcion IS 'Descripción del cambio',
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

CREATE INDEX idx_hlhis_pk ON HLHIS(id);
CREATE INDEX idx_hlhis_created_at ON HLHIS(created_at);


COMMENT ON TABLE HLHIS IS 'Archivo histórico de Cambios en Retenciones.';
LABEL ON TABLE HLHIS IS 'Archivo histórico de Cambios en Retenciones.';

COMMENT ON COLUMN HLHIS(
  ID IS 'Identificador técnico',
  DESCRIPCION IS 'Descripción del cambio',
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

LABEL ON COLUMN HLHIS(
  ID IS 'Identificador técnico'  LABEL ... TEXT IS 'Identificador técnico',
  DESCRIPCION IS 'Descripción del cambio'  LABEL ... TEXT IS 'Descripción del cambio',
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

CREATE INDEX idx_hlhis_pk ON HLHIS(id);
CREATE INDEX idx_hlhis_created_at ON HLHIS(created_at);

--==============================================================
-- TABLA: PRENA
--==============================================================
-- Nombre de la Tabla: PRENA
-- DESCRIPCIÓN: Archivo de Descripciones de Programas en Inglés.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE PRENA (
  NOMBRE_PROGRAMA VARCHAR(50) FOR COLUMN NOMBRE_PRO,
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
  PRIMARY KEY (nombre_programa)
) RCDFMT RPRENA;

LABEL ON TABLE PRENA IS 'Archivo de Descripciones de Programas en Inglés.';
LABEL ON COLUMN PRENA (nombre_programa IS 'Nombre del Programa',
  descripcion IS 'Descripción del Programa',
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

CREATE INDEX idx_prena_pk ON PRENA(nombre_programa);
CREATE INDEX idx_prena_created_at ON PRENA(created_at);


COMMENT ON TABLE PRENA IS 'Archivo de Descripciones de Programas en Inglés.';
LABEL ON TABLE PRENA IS 'Archivo de Descripciones de Programas en Inglés.';

COMMENT ON COLUMN PRENA(
  NOMBRE_PROGRAMA IS 'Nombre del Programa',
  DESCRIPCION IS 'Descripción del Programa',
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

LABEL ON COLUMN PRENA(
  NOMBRE_PROGRAMA IS 'Nombre del Programa'  LABEL ... TEXT IS 'Nombre del Programa',
  DESCRIPCION IS 'Descripción del Programa'  LABEL ... TEXT IS 'Descripción del Programa',
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

CREATE INDEX idx_prena_pk ON PRENA(nombre_programa);
CREATE INDEX idx_prena_created_at ON PRENA(created_at);

--==============================================================
-- TABLA: PRENS
--==============================================================
-- Nombre de la Tabla: PRENS
-- DESCRIPCIÓN: Archivo de Descripciones de Programas en Español.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE PRENS (
  NOMBRE_PROGRAMA VARCHAR(50) FOR COLUMN NOMBRE_PRO,
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
  PRIMARY KEY (nombre_programa)
) RCDFMT RPRENS;

LABEL ON TABLE PRENS IS 'Archivo de Descripciones de Programas en Español.';
LABEL ON COLUMN PRENS (nombre_programa IS 'Nombre del Programa',
  descripcion IS 'Descripción del Programa',
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

CREATE INDEX idx_prens_pk ON PRENS(nombre_programa);
CREATE INDEX idx_prens_created_at ON PRENS(created_at);


COMMENT ON TABLE PRENS IS 'Archivo de Descripciones de Programas en Español.';
LABEL ON TABLE PRENS IS 'Archivo de Descripciones de Programas en Español.';

COMMENT ON COLUMN PRENS(
  NOMBRE_PROGRAMA IS 'Nombre del Programa',
  DESCRIPCION IS 'Descripción del Programa',
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

LABEL ON COLUMN PRENS(
  NOMBRE_PROGRAMA IS 'Nombre del Programa'  LABEL ... TEXT IS 'Nombre del Programa',
  DESCRIPCION IS 'Descripción del Programa'  LABEL ... TEXT IS 'Descripción del Programa',
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

CREATE INDEX idx_prens_pk ON PRENS(nombre_programa);
CREATE INDEX idx_prens_created_at ON PRENS(created_at);

--==============================================================
-- TABLA: UT500
--==============================================================
-- Nombre de la Tabla: UT500
-- DESCRIPCIÓN: Agenda Personalizada.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE UT500 (
  CODIGO_USUARIO VARCHAR(20) FOR COLUMN CODIGO_USU,
  FECHA DATE FOR COLUMN FECHA,
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
  PRIMARY KEY (codigo_usuario, fecha)
) RCDFMT RUT500;

LABEL ON TABLE UT500 IS 'Agenda Personalizada.';
LABEL ON COLUMN UT500 (codigo_usuario IS 'Código de Usuario',
  fecha IS 'Fecha',
  descripcion IS 'Descripción',
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

CREATE INDEX idx_ut500_pk ON UT500(codigo_usuario, fecha);
CREATE INDEX idx_ut500_fecha ON UT500(fecha);


COMMENT ON TABLE UT500 IS 'Agenda Personalizada.';
LABEL ON TABLE UT500 IS 'Agenda Personalizada.';

COMMENT ON COLUMN UT500(
  CODIGO_USUARIO IS 'Código de Usuario',
  FECHA IS 'Fecha',
  DESCRIPCION IS 'Descripción',
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

LABEL ON COLUMN UT500(
  CODIGO_USUARIO IS 'Código de Usuario'  LABEL ... TEXT IS 'Código de Usuario',
  FECHA IS 'Fecha'  LABEL ... TEXT IS 'Fecha',
  DESCRIPCION IS 'Descripción'  LABEL ... TEXT IS 'Descripción',
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

CREATE INDEX idx_ut500_pk ON UT500(codigo_usuario, fecha);
CREATE INDEX idx_ut500_fecha ON UT500(fecha);

--==============================================================
-- TABLA: UT510
--==============================================================
-- Nombre de la Tabla: UT510
-- DESCRIPCIÓN: Mensajes de Usuarios.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE UT510 (
  CODIGO_USUARIO VARCHAR(20) FOR COLUMN CODIGO_USU,
  FECHA DATE FOR COLUMN FECHA,
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
  PRIMARY KEY (codigo_usuario, fecha)
) RCDFMT RUT510;

LABEL ON TABLE UT510 IS 'Mensajes de Usuarios.';
LABEL ON COLUMN UT510 (codigo_usuario IS 'Código de Usuario',
  fecha IS 'Fecha',
  descripcion IS 'Descripción',
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

CREATE INDEX idx_ut510_pk ON UT510(codigo_usuario, fecha);
CREATE INDEX idx_ut510_fecha ON UT510(fecha);


COMMENT ON TABLE UT510 IS 'Mensajes de Usuarios.';
LABEL ON TABLE UT510 IS 'Mensajes de Usuarios.';

COMMENT ON COLUMN UT510(
  CODIGO_USUARIO IS 'Código de Usuario',
  FECHA IS 'Fecha',
  DESCRIPCION IS 'Descripción',
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

LABEL ON COLUMN UT510(
  CODIGO_USUARIO IS 'Código de Usuario'  LABEL ... TEXT IS 'Código de Usuario',
  FECHA IS 'Fecha'  LABEL ... TEXT IS 'Fecha',
  DESCRIPCION IS 'Descripción'  LABEL ... TEXT IS 'Descripción',
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

CREATE INDEX idx_ut510_pk ON UT510(codigo_usuario, fecha);
CREATE INDEX idx_ut510_fecha ON UT510(fecha);

--==============================================================
-- TABLA: MICRF
--==============================================================
-- Nombre de la Tabla: MICRF
-- DESCRIPCIÓN: Reportes salvados en Microficha.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE MICRF (
  TIPO_FORMULARIO VARCHAR(50) FOR COLUMN TIPO_FORMU,
  NOMBRE_REPORTE VARCHAR(50) FOR COLUMN NOMBRE_REP,
  SECUENCIA INT FOR COLUMN SECUENCIA,
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
  PRIMARY KEY (tipo_formulario, nombre_reporte, secuencia)
) RCDFMT RMICRF;

LABEL ON TABLE MICRF IS 'Reportes salvados en Microficha.';
LABEL ON COLUMN MICRF (tipo_formulario IS 'Tipo de Formulario',
  nombre_reporte IS 'Nombre del Reporte',
  secuencia IS 'Secuencia',
  descripcion IS 'Descripción',
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

CREATE INDEX idx_micrf_pk ON MICRF(tipo_formulario, nombre_reporte, secuencia);
CREATE INDEX idx_micrf_created_at ON MICRF(created_at);


COMMENT ON TABLE MICRF IS 'Reportes salvados en Microficha.';
LABEL ON TABLE MICRF IS 'Reportes salvados en Microficha.';

COMMENT ON COLUMN MICRF(
  TIPO_FORMULARIO IS 'Tipo de Formulario',
  NOMBRE_REPORTE IS 'Nombre del Reporte',
  SECUENCIA IS 'Secuencia',
  DESCRIPCION IS 'Descripción',
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

LABEL ON COLUMN MICRF(
  TIPO_FORMULARIO IS 'Tipo de Formulario'  LABEL ... TEXT IS 'Tipo de Formulario',
  NOMBRE_REPORTE IS 'Nombre del Reporte'  LABEL ... TEXT IS 'Nombre del Reporte',
  SECUENCIA IS 'Secuencia'  LABEL ... TEXT IS 'Secuencia',
  DESCRIPCION IS 'Descripción'  LABEL ... TEXT IS 'Descripción',
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

CREATE INDEX idx_micrf_pk ON MICRF(tipo_formulario, nombre_reporte, secuencia);
CREATE INDEX idx_micrf_created_at ON MICRF(created_at);

--==============================================================
-- TABLA: IBSDD
--==============================================================
-- Nombre de la Tabla: IBSDD
-- DESCRIPCIÓN: Diccionario de Datos del IBS.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE IBSDD (
  ID BIGINT FOR COLUMN ID GENERATED ALWAYS AS IDENTITY,
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
  PRIMARY KEY (id)
) RCDFMT RIBSDD;

LABEL ON TABLE IBSDD IS 'Diccionario de Datos del IBS.';
LABEL ON COLUMN IBSDD (id IS 'Identificador técnico',
  descripcion IS 'Descripción del dato',
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

CREATE INDEX idx_ibsdd_pk ON IBSDD(id);
CREATE INDEX idx_ibsdd_created_at ON IBSDD(created_at);


COMMENT ON TABLE IBSDD IS 'Diccionario de Datos del IBS.';
LABEL ON TABLE IBSDD IS 'Diccionario de Datos del IBS.';

COMMENT ON COLUMN IBSDD(
  ID IS 'Identificador técnico',
  DESCRIPCION IS 'Descripción del dato',
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

LABEL ON COLUMN IBSDD(
  ID IS 'Identificador técnico'  LABEL ... TEXT IS 'Identificador técnico',
  DESCRIPCION IS 'Descripción del dato'  LABEL ... TEXT IS 'Descripción del dato',
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

CREATE INDEX idx_ibsdd_pk ON IBSDD(id);
CREATE INDEX idx_ibsdd_created_at ON IBSDD(created_at);

--==============================================================
-- TABLA: IBTBL
--==============================================================
-- Nombre de la Tabla: IBTBL
-- DESCRIPCIÓN: Referencias cruzadas para intersucursales.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE IBTBL (
  ID BIGINT FOR COLUMN ID GENERATED ALWAYS AS IDENTITY,
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
  PRIMARY KEY (id)
) RCDFMT RIBTBL;

LABEL ON TABLE IBTBL IS 'Referencias cruzadas para intersucursales.';
LABEL ON COLUMN IBTBL (id IS 'Identificador técnico',
  descripcion IS 'Descripción de la referencia cruzada',
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

CREATE INDEX idx_ibtbl_pk ON IBTBL(id);
CREATE INDEX idx_ibtbl_created_at ON IBTBL(created_at);


COMMENT ON TABLE IBTBL IS 'Referencias cruzadas para intersucursales.';
LABEL ON TABLE IBTBL IS 'Referencias cruzadas para intersucursales.';

COMMENT ON COLUMN IBTBL(
  ID IS 'Identificador técnico',
  DESCRIPCION IS 'Descripción de la referencia cruzada',
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

LABEL ON COLUMN IBTBL(
  ID IS 'Identificador técnico'  LABEL ... TEXT IS 'Identificador técnico',
  DESCRIPCION IS 'Descripción de la referencia cruzada'  LABEL ... TEXT IS 'Descripción de la referencia cruzada',
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

CREATE INDEX idx_ibtbl_pk ON IBTBL(id);
CREATE INDEX idx_ibtbl_created_at ON IBTBL(created_at);

CREATE OR REPLACE TABLE CNOFT (
  codigo_tabla VARCHAR(20),
  idioma VARCHAR(20),
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CNOFC (
  codigo_tabla VARCHAR(20),
  codigo_registro VARCHAR(20),
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE MLNCT (
  codigo_banco VARCHAR(20),
  codigo_de_notificacion VARCHAR(20),
  nivel INT,
  idioma VARCHAR(20),
  secuencia INT,
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE MLNOT (
  codigo_banco VARCHAR(20),
  fecha_proceso DATE,
  numero_cuenta VARCHAR(24),
  codigo_de_notificacion VARCHAR(20),
  nivel INT,
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE HSNOT (
  codigo_banco VARCHAR(20),
  fecha_proceso DATE,
  numero_cuenta VARCHAR(24),
  codigo_de_notificacion VARCHAR(20),
  nivel INT,
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE HEAD (
  nombre_printer_file VARCHAR(50),
  secuencia INT,
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE MSSGS (
  id BIGINT GENERATED ALWAYS AS IDENTITY,
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE HOLYD (
  codigo_moneda VARCHAR(20),
  fecha DATE,
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE APCLS (
  codigo_banco VARCHAR(20),
  codigo_de_producto VARCHAR(20),
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE RATES (
  codigo_banco VARCHAR(20),
  codigo_moneda VARCHAR(20),
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE RTRNS (
  codigo_banco VARCHAR(20),
  codigo_moneda VARCHAR(20),
  fecha DATE,
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE HLHIS (
  id BIGINT GENERATED ALWAYS AS IDENTITY,
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE PRENA (
  nombre_programa VARCHAR(50),
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE PRENS (
  nombre_programa VARCHAR(50),
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE UT500 (
  codigo_usuario VARCHAR(20),
  fecha DATE,
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE UT510 (
  codigo_usuario VARCHAR(20),
  fecha DATE,
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE MICRF (
  tipo_formulario VARCHAR(50),
  nombre_reporte VARCHAR(50),
  secuencia INT,
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE IBSDD (
  id BIGINT GENERATED ALWAYS AS IDENTITY,
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE IBTBL (
  id BIGINT GENERATED ALWAYS AS IDENTITY,
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE TRANS (
  id_transaccion BIGINT GENERATED ALWAYS AS IDENTITY,
  numero_registro_relativo VARCHAR(30),
  codigo_banco VARCHAR(20),
  codigo_sucursal VARCHAR(20),
  codigo_moneda VARCHAR(20),
  cuenta_contable VARCHAR(24),
  numero_cuenta VARCHAR(24),
  id_cliente VARCHAR(30),
  fecha_operacion DATE,
  fecha_valor DATE,
  hora_operacion VARCHAR(10),
  tipo_movimiento VARCHAR(20),
  debito_credito CHAR(1),
  monto DECIMAL(18,2),
  saldo_anterior DECIMAL(18,2),
  saldo_posterior DECIMAL(18,2),
  canal_origen VARCHAR(20),
  terminal_origen VARCHAR(30),
  referencia_externa VARCHAR(40),
  estado_transaccion VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE TRDSC (
  numero_registro_relativo VARCHAR(30),
  secuencia INT,
  tipo_descripcion VARCHAR(20),
  texto_descripcion VARCHAR(200),
  codigo_idioma VARCHAR(5),
  formato_salida VARCHAR(20),
  obligatorio CHAR(1),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE TTRAN (
  id_transaccion_dia BIGINT GENERATED ALWAYS AS IDENTITY,
  numero_registro_relativo VARCHAR(30),
  codigo_banco VARCHAR(20),
  codigo_sucursal VARCHAR(20),
  codigo_moneda VARCHAR(20),
  cuenta_contable VARCHAR(24),
  numero_cuenta VARCHAR(24),
  id_cliente VARCHAR(30),
  fecha DATE,
  fecha_valor DATE,
  hora_operacion VARCHAR(10),
  tipo_movimiento VARCHAR(20),
  debito_credito CHAR(1),
  monto DECIMAL(18,2),
  saldo_anterior DECIMAL(18,2),
  saldo_posterior DECIMAL(18,2),
  canal_origen VARCHAR(20),
  terminal_origen VARCHAR(30),
  referencia_externa VARCHAR(40),
  estado_transaccion VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CIFXF (
  id BIGINT GENERATED ALWAYS AS IDENTITY,
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CNTRLCNT (
  codigo_banco VARCHAR(20),
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CNTRLBRN (
  codigo_banco VARCHAR(20),
  codigo_sucursal VARCHAR(20),
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CNTRLNUM (
  codigo_aplicacion VARCHAR(20),
  tipo_cuenta VARCHAR(20),
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CNTRLTAX (
  codigo_banco VARCHAR(20),
  codigo_impuesto VARCHAR(20),
  descripcion VARCHAR(120),
  valor_texto VARCHAR(50),
  valor_numerico DECIMAL(18,2),
  vigencia_desde DATE,
  vigencia_hasta DATE,
  orden_visualizacion INT,
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CUMST (
  id_cliente VARCHAR(30),
  tipo_persona VARCHAR(20),
  tipo_identificacion VARCHAR(20),
  numero_identificacion VARCHAR(30),
  nombres VARCHAR(80),
  apellidos VARCHAR(80),
  razon_social VARCHAR(80),
  fecha_nacimiento DATE,
  direccion VARCHAR(120),
  email VARCHAR(80),
  telefono VARCHAR(80),
  pais_residencia VARCHAR(50),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CUMAD (
  id_cliente_operacion VARCHAR(30),
  tipo_registro VARCHAR(20),
  secuencia INT,
  tipo_persona VARCHAR(20),
  tipo_identificacion VARCHAR(20),
  numero_identificacion VARCHAR(30),
  nombres VARCHAR(80),
  apellidos VARCHAR(80),
  razon_social VARCHAR(80),
  fecha_nacimiento DATE,
  direccion VARCHAR(120),
  email VARCHAR(80),
  telefono VARCHAR(80),
  pais_residencia VARCHAR(50),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id_cliente_operacion, tipo_registro, secuencia)
) RCDFMT RCUMAD;

LABEL ON TABLE CUMAD IS 'Direcciones de correo y beneficiarios.';
LABEL ON COLUMN CUMAD (id_cliente_operacion IS 'Número de cliente u operación',
  tipo_registro IS 'Tipo de registro',
  secuencia IS 'Secuencia',
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

CREATE INDEX idx_cumad_pk ON CUMAD(id_cliente_operacion, tipo_registro, secuencia);
CREATE INDEX idx_cumad_created_at ON CUMAD(created_at);

CREATE OR REPLACE TABLE CUMPR (
  palabra VARCHAR(50),
  tipo_persona VARCHAR(20),
  tipo_identificacion VARCHAR(20),
  numero_identificacion VARCHAR(30),
  nombres VARCHAR(80),
  apellidos VARCHAR(80),
  razon_social VARCHAR(80),
  fecha_nacimiento DATE,
  direccion VARCHAR(120),
  email VARCHAR(80),
  telefono VARCHAR(80),
  pais_residencia VARCHAR(50),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (palabra)
) RCDFMT RCUMPR;

LABEL ON TABLE CUMPR IS 'Palabras clave omitidas en búsquedas de clientes.';
LABEL ON COLUMN CUMPR (palabra IS 'Palabra reservada',
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

CREATE INDEX idx_cumpr_pk ON CUMPR(palabra);
CREATE INDEX idx_cumpr_created_at ON CUMPR(created_at);

CREATE OR REPLACE TABLE CUMSD (
  id_cliente VARCHAR(30),
  tipo_persona VARCHAR(20),
  tipo_identificacion VARCHAR(20),
  numero_identificacion VARCHAR(30),
  nombres VARCHAR(80),
  apellidos VARCHAR(80),
  razon_social VARCHAR(80),
  fecha_nacimiento DATE,
  direccion VARCHAR(120),
  email VARCHAR(80),
  telefono VARCHAR(80),
  pais_residencia VARCHAR(50),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id_cliente)
) RCDFMT RCUMSD;

LABEL ON TABLE CUMSD IS 'Clientes para búsqueda por cadena de caracteres.';
LABEL ON COLUMN CUMSD (id_cliente IS 'Identificador del cliente',
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

CREATE INDEX idx_cumsd_pk ON CUMSD(id_cliente);
CREATE INDEX idx_cumsd_created_at ON CUMSD(created_at);

CREATE OR REPLACE TABLE SPINS (
  tipo_informacion VARCHAR(50),
  cuenta_o_cliente VARCHAR(50),
  secuencia INT,
  tipo_persona VARCHAR(20),
  tipo_identificacion VARCHAR(20),
  numero_identificacion VARCHAR(30),
  nombres VARCHAR(80),
  apellidos VARCHAR(80),
  razon_social VARCHAR(80),
  fecha_nacimiento DATE,
  direccion VARCHAR(120),
  email VARCHAR(80),
  telefono VARCHAR(80),
  pais_residencia VARCHAR(50),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (tipo_informacion, cuenta_o_cliente, secuencia)
) RCDFMT RSPINS;

LABEL ON TABLE SPINS IS 'Archivo de Instrucciones especiales (Usos).';
LABEL ON COLUMN SPINS (tipo_informacion IS 'Tipo de información',
  cuenta_o_cliente IS 'Cuenta o cliente',
  secuencia IS 'Secuencia',
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

CREATE INDEX idx_spins_pk ON SPINS(tipo_informacion, cuenta_o_cliente, secuencia);
CREATE INDEX idx_spins_created_at ON SPINS(created_at);

CREATE OR REPLACE TABLE ACMST (
  id BIGINT GENERATED ALWAYS AS IDENTITY,
  fecha_apertura DATE,
  fecha_ultima_transaccion DATE,
  saldo_actual DECIMAL(18,2),
  saldo_disponible DECIMAL(18,2),
  limite_sobregiro DECIMAL(18,2),
  estado_cuenta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE STPMT (
  codigo_banco VARCHAR(20),
  codigo_sucursal VARCHAR(20),
  codigo_moneda VARCHAR(20),
  cuenta_contable VARCHAR(24),
  numero_cuenta VARCHAR(24),
  secuencia INT,
  fecha_apertura DATE,
  fecha_ultima_transaccion DATE,
  saldo_actual DECIMAL(18,2),
  saldo_disponible DECIMAL(18,2),
  limite_sobregiro DECIMAL(18,2),
  estado_cuenta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE UNCOL (
  codigo_banco VARCHAR(20),
  codigo_sucursal VARCHAR(20),
  numero_cuenta VARCHAR(24),
  fecha_apertura DATE,
  fecha_ultima_transaccion DATE,
  saldo_actual DECIMAL(18,2),
  saldo_disponible DECIMAL(18,2),
  limite_sobregiro DECIMAL(18,2),
  estado_cuenta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE PBTRN (
  numero_cuenta VARCHAR(24),
  fecha DATE,
  hora VARCHAR(10),
  fecha_apertura DATE,
  fecha_ultima_transaccion DATE,
  saldo_actual DECIMAL(18,2),
  saldo_disponible DECIMAL(18,2),
  limite_sobregiro DECIMAL(18,2),
  estado_cuenta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE OFMST (
  codigo_banco VARCHAR(20),
  codigo_sucursal VARCHAR(20),
  numero_cheque VARCHAR(30),
  fecha_apertura DATE,
  fecha_ultima_transaccion DATE,
  saldo_actual DECIMAL(18,2),
  saldo_disponible DECIMAL(18,2),
  limite_sobregiro DECIMAL(18,2),
  estado_cuenta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE RCLNB (
  codigo_banco VARCHAR(20),
  codigo_sucursal VARCHAR(20),
  codigo_moneda VARCHAR(20),
  cuenta_contable VARCHAR(24),
  numero_cuenta VARCHAR(24),
  fecha DATE,
  fecha_apertura DATE,
  fecha_ultima_transaccion DATE,
  saldo_actual DECIMAL(18,2),
  saldo_disponible DECIMAL(18,2),
  limite_sobregiro DECIMAL(18,2),
  estado_cuenta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE TLMST (
  codigo_de_cajero VARCHAR(20),
  codigo_moneda VARCHAR(20),
  fecha_apertura DATE,
  fecha_ultima_transaccion DATE,
  saldo_actual DECIMAL(18,2),
  saldo_disponible DECIMAL(18,2),
  limite_sobregiro DECIMAL(18,2),
  estado_cuenta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE TDRCR (
  codigo_de_transaccion VARCHAR(20),
  fecha_apertura DATE,
  fecha_ultima_transaccion DATE,
  saldo_actual DECIMAL(18,2),
  saldo_disponible DECIMAL(18,2),
  limite_sobregiro DECIMAL(18,2),
  estado_cuenta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE AUDIT (
  codigo_banco VARCHAR(20),
  codigo_sucursal VARCHAR(20),
  codigo_cajero VARCHAR(20),
  codigo_moneda VARCHAR(20),
  referencia VARCHAR(50),
  fecha_apertura DATE,
  fecha_ultima_transaccion DATE,
  saldo_actual DECIMAL(18,2),
  saldo_disponible DECIMAL(18,2),
  limite_sobregiro DECIMAL(18,2),
  estado_cuenta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CHMST (
  codigo_banco VARCHAR(20),
  codigo_sucursal VARCHAR(20),
  codigo_moneda VARCHAR(20),
  numero_cuenta VARCHAR(24),
  cheque_inicial VARCHAR(50),
  fecha_apertura DATE,
  fecha_ultima_transaccion DATE,
  saldo_actual DECIMAL(18,2),
  saldo_disponible DECIMAL(18,2),
  limite_sobregiro DECIMAL(18,2),
  estado_cuenta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CHPER (
  codigo_banco VARCHAR(20),
  codigo_sucursal VARCHAR(20),
  numero_cuenta VARCHAR(24),
  fecha_apertura DATE,
  fecha_ultima_transaccion DATE,
  saldo_actual DECIMAL(18,2),
  saldo_disponible DECIMAL(18,2),
  limite_sobregiro DECIMAL(18,2),
  estado_cuenta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CHSTS (
  codigo_banco VARCHAR(20),
  codigo_sucursal VARCHAR(20),
  codigo_moneda VARCHAR(20),
  cuenta_contable VARCHAR(24),
  numero_cuenta VARCHAR(24),
  fecha_apertura DATE,
  fecha_ultima_transaccion DATE,
  saldo_actual DECIMAL(18,2),
  saldo_disponible DECIMAL(18,2),
  limite_sobregiro DECIMAL(18,2),
  estado_cuenta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE DEVOL (
  numero_cuenta VARCHAR(24),
  numero_cheque VARCHAR(30),
  fecha_apertura DATE,
  fecha_ultima_transaccion DATE,
  saldo_actual DECIMAL(18,2),
  saldo_disponible DECIMAL(18,2),
  limite_sobregiro DECIMAL(18,2),
  estado_cuenta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CMRIN (
  codigo_banco VARCHAR(20),
  sucursal_moneda VARCHAR(50),
  numero_cuenta VARCHAR(24),
  monto DECIMAL(18,2),
  fecha_apertura DATE,
  fecha_ultima_transaccion DATE,
  saldo_actual DECIMAL(18,2),
  saldo_disponible DECIMAL(18,2),
  limite_sobregiro DECIMAL(18,2),
  estado_cuenta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE OVDRF (
  id BIGINT GENERATED ALWAYS AS IDENTITY,
  fecha_apertura DATE,
  fecha_ultima_transaccion DATE,
  saldo_actual DECIMAL(18,2),
  saldo_disponible DECIMAL(18,2),
  limite_sobregiro DECIMAL(18,2),
  estado_cuenta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CNTRLMSG (
  codigo_banco VARCHAR(20),
  fecha_apertura DATE,
  fecha_ultima_transaccion DATE,
  saldo_actual DECIMAL(18,2),
  saldo_disponible DECIMAL(18,2),
  limite_sobregiro DECIMAL(18,2),
  estado_cuenta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CNTRLRTE (
  codigo_banco VARCHAR(20),
  tipo_producto VARCHAR(20),
  codigo_tabla VARCHAR(20),
  fecha_apertura DATE,
  fecha_ultima_transaccion DATE,
  saldo_actual DECIMAL(18,2),
  saldo_disponible DECIMAL(18,2),
  limite_sobregiro DECIMAL(18,2),
  estado_cuenta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CNTRLDEV (
  codigo_causal VARCHAR(20),
  fecha_apertura DATE,
  fecha_ultima_transaccion DATE,
  saldo_actual DECIMAL(18,2),
  saldo_disponible DECIMAL(18,2),
  limite_sobregiro DECIMAL(18,2),
  estado_cuenta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE DEALS (
  id BIGINT GENERATED ALWAYS AS IDENTITY,
  fecha_desembolso DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_actual DECIMAL(18,2),
  tasa_interes DECIMAL(18,2),
  plazo_meses INT,
  dias_mora INT,
  estado_operacion VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id)
) RCDFMT RDEALS;

LABEL ON TABLE DEALS IS 'Préstamos, certificados, giros y valores.';
LABEL ON COLUMN DEALS (
  id IS 'Identificador técnico',
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

CREATE INDEX idx_deals_pk ON DEALS(id);
CREATE INDEX idx_deals_created_at ON DEALS(created_at);

CREATE OR REPLACE TABLE DLPMT (
  codigo_banco VARCHAR(20),
  codigo_sucursal VARCHAR(20),
  codigo_moneda VARCHAR(20),
  numero_prestamo VARCHAR(30),
  fecha DATE,
  tipo_registro VARCHAR(20),
  fecha_desembolso DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_actual DECIMAL(18,2),
  tasa_interes DECIMAL(18,2),
  plazo_meses INT,
  dias_mora INT,
  estado_operacion VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (codigo_banco, codigo_sucursal)
) RCDFMT RDLPMT;

LABEL ON TABLE DLPMT IS 'Plan de Pagos';
LABEL ON COLUMN DLPMT (
  codigo_banco IS 'Código de Banco',
  codigo_sucursal IS 'Código de Sucursal',
  codigo_moneda IS 'Código de Moneda',
  numero_prestamo IS 'Número de Préstamo',
  fecha IS 'Fecha',
  tipo_registro IS 'Tipo de Registro',
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

CREATE INDEX idx_dlpmt_pk ON DLPMT(codigo_banco, codigo_sucursal);
CREATE INDEX idx_dlpmt_fecha ON DLPMT(fecha);

CREATE OR REPLACE TABLE DLDRF (
  codigo_banco VARCHAR(20),
  codigo_sucursal VARCHAR(20),
  codigo_moneda VARCHAR(20),
  numero_prestamo VARCHAR(30),
  identificacion VARCHAR(50),
  numero_documento VARCHAR(30),
  fecha_desembolso DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_actual DECIMAL(18,2),
  tasa_interes DECIMAL(18,2),
  plazo_meses INT,
  dias_mora INT,
  estado_operacion VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (codigo_banco, codigo_sucursal)
) RCDFMT RDLDRF;

LABEL ON TABLE DLDRF IS 'Detalle de Giros y Valores al Cobro.';
LABEL ON COLUMN DLDRF (
  codigo_banco IS 'Código de Banco',
  codigo_sucursal IS 'Código de Sucursal',
  codigo_moneda IS 'Código de Moneda',
  numero_prestamo IS 'Número de Préstamo',
  identificacion IS 'Identificación',
  numero_documento IS 'Número de Documento',
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

CREATE INDEX idx_dldrf_pk ON DLDRF(codigo_banco, codigo_sucursal);
CREATE INDEX idx_dldrf_created_at ON DLDRF(created_at);

CREATE OR REPLACE TABLE DLSDE (
  numero_prestamo VARCHAR(30),
  fecha DATE,
  tipo_registro VARCHAR(20),
  secuencia INT,
  codigo_deduccion VARCHAR(20),
  fecha_desembolso DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_actual DECIMAL(18,2),
  tasa_interes DECIMAL(18,2),
  plazo_meses INT,
  dias_mora INT,
  estado_operacion VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (numero_prestamo, fecha)
) RCDFMT RDLSDE;

LABEL ON TABLE DLSDE IS 'Detalle de Deducciones del Plan de Pagos';
LABEL ON COLUMN DLSDE (
  numero_prestamo IS 'Número de Préstamo',
  fecha IS 'Fecha',
  tipo_registro IS 'Tipo de Registro',
  secuencia IS 'Secuencia',
  codigo_deduccion IS 'Código de Deducción',
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

CREATE INDEX idx_dlsde_pk ON DLSDE(numero_prestamo, fecha);
CREATE INDEX idx_dlsde_fecha ON DLSDE(fecha);

CREATE OR REPLACE TABLE DLCLP (
  id_cliente VARCHAR(30),
  numero_cuenta VARCHAR(24),
  referencia VARCHAR(50),
  fecha_desembolso DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_actual DECIMAL(18,2),
  tasa_interes DECIMAL(18,2),
  plazo_meses INT,
  dias_mora INT,
  estado_operacion VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id_cliente, numero_cuenta)
) RCDFMT RDLCLP;

LABEL ON TABLE DLCLP IS 'Calificación y Previsión de Cartera.';
LABEL ON COLUMN DLCLP (
  id_cliente IS 'ID Cliente',
  numero_cuenta IS 'Número de Cuenta',
  referencia IS 'Referencia',
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

CREATE INDEX idx_dlclp_pk ON DLCLP(id_cliente, numero_cuenta);
CREATE INDEX idx_dlclp_created_at ON DLCLP(created_at);

CREATE OR REPLACE TABLE DDCPN (
  numero_prestamo VARCHAR(30),
  fecha_desembolso DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_actual DECIMAL(18,2),
  tasa_interes DECIMAL(18,2),
  plazo_meses INT,
  dias_mora INT,
  estado_operacion VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (numero_prestamo)
) RCDFMT RDDCPN;

LABEL ON TABLE DDCPN IS 'Transacciones pendientes de Cobro.';
LABEL ON COLUMN DDCPN (
  numero_prestamo IS 'Número de Préstamo',
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

CREATE INDEX idx_ddcpn_pk ON DDCPN(numero_prestamo);
CREATE INDEX idx_ddcpn_created_at ON DDCPN(created_at);

CREATE OR REPLACE TABLE DLITP (
  numero_prestamo VARCHAR(30),
  codigo_deduccion VARCHAR(20),
  fecha_desembolso DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_actual DECIMAL(18,2),
  tasa_interes DECIMAL(18,2),
  plazo_meses INT,
  dias_mora INT,
  estado_operacion VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (numero_prestamo, codigo_deduccion)
) RCDFMT RDLITP;

LABEL ON TABLE DLITP IS 'Maestro de Deducciones de Préstamos.';
LABEL ON COLUMN DLITP (
  numero_prestamo IS 'Número de Préstamo',
  codigo_deduccion IS 'Código de Deducción',
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

CREATE INDEX idx_dlitp_pk ON DLITP(numero_prestamo, codigo_deduccion);
CREATE INDEX idx_dlitp_created_at ON DLITP(created_at);

CREATE OR REPLACE TABLE CDRTE (
  numero_tabla VARCHAR(30),
  fecha DATE,
  codigo_moneda VARCHAR(20),
  fecha_desembolso DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_actual DECIMAL(18,2),
  tasa_interes DECIMAL(18,2),
  plazo_meses INT,
  dias_mora INT,
  estado_operacion VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CNTRLDLS (
  codigo_banco VARCHAR(20),
  numero_tabla VARCHAR(30),
  tipo_producto VARCHAR(20),
  fecha_desembolso DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_actual DECIMAL(18,2),
  tasa_interes DECIMAL(18,2),
  plazo_meses INT,
  dias_mora INT,
  estado_operacion VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE LCMST (
  id BIGINT GENERATED ALWAYS AS IDENTITY,
  fecha_emision DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_actual DECIMAL(18,2),
  banco_corresponsal VARCHAR(80),
  pais_destino VARCHAR(80),
  estado_carta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id)
) RCDFMT RLCMST;

LABEL ON TABLE LCMST IS 'Maestro de Cartas de Crédito.';
LABEL ON COLUMN LCMST (
  id IS 'Identificador técnico',
  fecha_emision IS 'Fecha de emisión',
  fecha_vencimiento IS 'Fecha de vencimiento',
  monto_original IS 'Monto original',
  saldo_actual IS 'Saldo actual',
  banco_corresponsal IS 'Banco corresponsal',
  pais_destino IS 'País destino',
  estado_carta IS 'Estado de Carta',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_lcmst_pk ON LCMST(id);
CREATE INDEX idx_lcmst_created_at ON LCMST(created_at);

CREATE OR REPLACE TABLE LCDOC (
  numero_carta_credito VARCHAR(30),
  tipo_registro VARCHAR(20),
  codigo_banco VARCHAR(20),
  codigo_documento VARCHAR(20),
  numero_linea VARCHAR(30),
  fecha_emision DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_actual DECIMAL(18,2),
  banco_corresponsal VARCHAR(80),
  pais_destino VARCHAR(80),
  estado_carta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (numero_carta_credito, tipo_registro)
) RCDFMT RLCDOC;

LABEL ON TABLE LCDOC IS 'Documentos de Cartas de Crédito';
LABEL ON COLUMN LCDOC (
  numero_carta_credito IS 'Número de Carta de Crédito',
  tipo_registro IS 'Tipo de Registro',
  codigo_banco IS 'Código de Banco',
  codigo_documento IS 'Código de Documento',
  numero_linea IS 'Número de Línea',
  fecha_emision IS 'Fecha de emisión',
  fecha_vencimiento IS 'Fecha de vencimiento',
  monto_original IS 'Monto original',
  saldo_actual IS 'Saldo actual',
  banco_corresponsal IS 'Banco corresponsal',
  pais_destino IS 'País destino',
  estado_carta IS 'Estado de Carta',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_lcdoc_pk ON LCDOC(numero_carta_credito, tipo_registro);
CREATE INDEX idx_lcdoc_created_at ON LCDOC(created_at);

CREATE OR REPLACE TABLE LCFIN (
  nivel INT,
  codigo_documento VARCHAR(20),
  secuencia_de_texto VARCHAR(50),
  fecha_emision DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_actual DECIMAL(18,2),
  banco_corresponsal VARCHAR(80),
  pais_destino VARCHAR(80),
  estado_carta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (nivel, codigo_documento)
) RCDFMT RLCFIN;

LABEL ON TABLE LCFIN IS 'Indice de Formatos de Cartas de Crédito';
LABEL ON COLUMN LCFIN (
  nivel IS 'Nivel',
  codigo_documento IS 'Código de Documento',
  secuencia_de_texto IS 'Secuencia de Texto',
  fecha_emision IS 'Fecha de emisión',
  fecha_vencimiento IS 'Fecha de vencimiento',
  monto_original IS 'Monto original',
  saldo_actual IS 'Saldo actual',
  banco_corresponsal IS 'Banco corresponsal',
  pais_destino IS 'País destino',
  estado_carta IS 'Estado de Carta',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_lcfin_pk ON LCFIN(nivel, codigo_documento);
CREATE INDEX idx_lcfin_created_at ON LCFIN(created_at);

CREATE OR REPLACE TABLE LCFMT (
  codigo_documento VARCHAR(20),
  secuencia_de_texto VARCHAR(50),
  numero_linea VARCHAR(30),
  fecha_emision DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_actual DECIMAL(18,2),
  banco_corresponsal VARCHAR(80),
  pais_destino VARCHAR(80),
  estado_carta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (codigo_documento, secuencia_de_texto)
) RCDFMT RLCFMT;

LABEL ON TABLE LCFMT IS 'Formatos de Cartas de Crédito';
LABEL ON COLUMN LCFMT (
  codigo_documento IS 'Código de Documento',
  secuencia_de_texto IS 'Secuencia de Texto',
  numero_linea IS 'Número de Línea',
  fecha_emision IS 'Fecha de emisión',
  fecha_vencimiento IS 'Fecha de vencimiento',
  monto_original IS 'Monto original',
  saldo_actual IS 'Saldo actual',
  banco_corresponsal IS 'Banco corresponsal',
  pais_destino IS 'País destino',
  estado_carta IS 'Estado de Carta',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_lcfmt_pk ON LCFMT(codigo_documento, secuencia_de_texto);
CREATE INDEX idx_lcfmt_created_at ON LCFMT(created_at);

CREATE OR REPLACE TABLE LCADM (
  numero_carta_credito VARCHAR(30),
  numero_enmienda VARCHAR(30),
  fecha_emision DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_actual DECIMAL(18,2),
  banco_corresponsal VARCHAR(80),
  pais_destino VARCHAR(80),
  estado_carta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (numero_carta_credito, numero_enmienda)
) RCDFMT RLCADM;

LABEL ON TABLE LCADM IS 'Enmiendas a Cartas de Crédito';
LABEL ON COLUMN LCADM (
  numero_carta_credito IS 'Número de Carta de Crédito',
  numero_enmienda IS 'Número de Enmienda',
  fecha_emision IS 'Fecha de emisión',
  fecha_vencimiento IS 'Fecha de vencimiento',
  monto_original IS 'Monto original',
  saldo_actual IS 'Saldo actual',
  banco_corresponsal IS 'Banco corresponsal',
  pais_destino IS 'País destino',
  estado_carta IS 'Estado de Carta',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_lcadm_pk ON LCADM(numero_carta_credito, numero_enmienda);
CREATE INDEX idx_lcadm_created_at ON LCADM(created_at);

CREATE OR REPLACE TABLE LCCOV (
  numero_carta_credito VARCHAR(30),
  secuencia INT,
  fecha_emision DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_actual DECIMAL(18,2),
  banco_corresponsal VARCHAR(80),
  pais_destino VARCHAR(80),
  estado_carta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (numero_carta_credito, secuencia)
) RCDFMT RLCCOV;

LABEL ON TABLE LCCOV IS 'Negociaciones de Cartas de Crédito';
LABEL ON COLUMN LCCOV (
  numero_carta_credito IS 'Número de Carta de Crédito',
  secuencia IS 'Secuencia',
  fecha_emision IS 'Fecha de emisión',
  fecha_vencimiento IS 'Fecha de vencimiento',
  monto_original IS 'Monto original',
  saldo_actual IS 'Saldo actual',
  banco_corresponsal IS 'Banco corresponsal',
  pais_destino IS 'País destino',
  estado_carta IS 'Estado de Carta',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_lccov_pk ON LCCOV(numero_carta_credito, secuencia);
CREATE INDEX idx_lccov_created_at ON LCCOV(created_at);

CREATE OR REPLACE TABLE LCDIN (
  numero_carta_credito VARCHAR(30),
  secuencia INT,
  fecha_emision DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_actual DECIMAL(18,2),
  banco_corresponsal VARCHAR(80),
  pais_destino VARCHAR(80),
  estado_carta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (numero_carta_credito, secuencia)
) RCDFMT RLCDIN;

LABEL ON TABLE LCDIN IS 'Documentos Recibidos en Cartas de Crédito';
LABEL ON COLUMN LCDIN (
  numero_carta_credito IS 'Número de Carta de Crédito',
  secuencia IS 'Secuencia',
  fecha_emision IS 'Fecha de emisión',
  fecha_vencimiento IS 'Fecha de vencimiento',
  monto_original IS 'Monto original',
  saldo_actual IS 'Saldo actual',
  banco_corresponsal IS 'Banco corresponsal',
  pais_destino IS 'País destino',
  estado_carta IS 'Estado de Carta',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_lcdin_pk ON LCDIN(numero_carta_credito, secuencia);
CREATE INDEX idx_lcdin_created_at ON LCDIN(created_at);

CREATE OR REPLACE TABLE LCSTA (
  id BIGINT GENERATED ALWAYS AS IDENTITY,
  fecha_emision DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_actual DECIMAL(18,2),
  banco_corresponsal VARCHAR(80),
  pais_destino VARCHAR(80),
  estado_carta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id)
) RCDFMT RLCSTA;

LABEL ON TABLE LCSTA IS 'Aperturas y pagos de cartas de crédito';
LABEL ON COLUMN LCSTA (
  id IS 'Identificador técnico',
  fecha_emision IS 'Fecha de emisión',
  fecha_vencimiento IS 'Fecha de vencimiento',
  monto_original IS 'Monto original',
  saldo_actual IS 'Saldo actual',
  banco_corresponsal IS 'Banco corresponsal',
  pais_destino IS 'País destino',
  estado_carta IS 'Estado de Carta',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_lcsta_pk ON LCSTA(id);
CREATE INDEX idx_lcsta_created_at ON LCSTA(created_at);

CREATE OR REPLACE TABLE CNTRLLCP (
  codigo_banco VARCHAR(20),
  lcrparm VARCHAR(20),
  fecha_emision DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_actual DECIMAL(18,2),
  banco_corresponsal VARCHAR(80),
  pais_destino VARCHAR(80),
  estado_carta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (codigo_banco, lcrparm)
) RCDFMT RCNTRLLCP;

LABEL ON TABLE CNTRLLCP IS 'Archivo de Control de Cartas de Crédito';
LABEL ON COLUMN CNTRLLCP (
  codigo_banco IS 'Código de Banco',
  lcrparm IS 'Parámetro LCRPARM',
  fecha_emision IS 'Fecha de emisión',
  fecha_vencimiento IS 'Fecha de vencimiento',
  monto_original IS 'Monto original',
  saldo_actual IS 'Saldo actual',
  banco_corresponsal IS 'Banco corresponsal',
  pais_destino IS 'País destino',
  estado_carta IS 'Estado de Carta',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_cntrllcp_pk ON CNTRLLCP(codigo_banco, lcrparm);
CREATE INDEX idx_cntrllcp_created_at ON CNTRLLCP(created_at);

CREATE OR REPLACE TABLE CNTRLRLC (
  codigo_banco VARCHAR(20),
  tipo_producto VARCHAR(20),
  numero_tabla VARCHAR(30),
  fecha_emision DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_actual DECIMAL(18,2),
  banco_corresponsal VARCHAR(80),
  pais_destino VARCHAR(80),
  estado_carta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (codigo_banco, tipo_producto)
) RCDFMT RCNTRLRLC;

LABEL ON TABLE CNTRLRLC IS 'Cargos y tarifas de cartas de crédito.';
LABEL ON COLUMN CNTRLRLC (
  codigo_banco IS 'Código de Banco',
  tipo_producto IS 'Tipo de Producto',
  numero_tabla IS 'Número de Tabla',
  fecha_emision IS 'Fecha de emisión',
  fecha_vencimiento IS 'Fecha de vencimiento',
  monto_original IS 'Monto original',
  saldo_actual IS 'Saldo actual',
  banco_corresponsal IS 'Banco corresponsal',
  pais_destino IS 'País destino',
  estado_carta IS 'Estado de Carta',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_cntrlrlc_pk ON CNTRLRLC(codigo_banco, tipo_producto);
CREATE INDEX idx_cntrlrlc_created_at ON CNTRLRLC(created_at);

CREATE OR REPLACE TABLE DCMST (
  id BIGINT GENERATED ALWAYS AS IDENTITY,
  fecha_recepcion DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_pendiente DECIMAL(18,2),
  tipo_documento VARCHAR(20),
  estado_operacion VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id)
) RCDFMT RDCMST;

LABEL ON TABLE DCMST IS 'Maestro de Cobranzas Documentarias.';
LABEL ON COLUMN DCMST (
  id IS 'Identificador técnico',
  fecha_recepcion IS 'Fecha de recepción',
  fecha_vencimiento IS 'Fecha de vencimiento',
  monto_original IS 'Monto original',
  saldo_pendiente IS 'Saldo pendiente',
  tipo_documento IS 'Tipo de Documento',
  estado_operacion IS 'Estado de la operación',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_dcmst_pk ON DCMST(id);
CREATE INDEX idx_dcmst_created_at ON DCMST(created_at);

CREATE OR REPLACE TABLE APPRV (
  numero_carta_credito VARCHAR(30),
  tipo_registro VARCHAR(20),
  fecha_recepcion DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_pendiente DECIMAL(18,2),
  tipo_documento VARCHAR(20),
  estado_operacion VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (numero_carta_credito, tipo_registro)
) RCDFMT RAPPRV;

LABEL ON TABLE APPRV IS 'Cobranzas pendientes de Aprobación.';
LABEL ON COLUMN APPRV (
  numero_carta_credito IS 'Número de Carta de Crédito',
  tipo_registro IS 'Tipo de Registro',
  fecha_recepcion IS 'Fecha de recepción',
  fecha_vencimiento IS 'Fecha de vencimiento',
  monto_original IS 'Monto original',
  saldo_pendiente IS 'Saldo pendiente',
  tipo_documento IS 'Tipo de Documento',
  estado_operacion IS 'Estado de la operación',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_apprv_pk ON APPRV(numero_carta_credito, tipo_registro);
CREATE INDEX idx_apprv_created_at ON APPRV(created_at);

CREATE OR REPLACE TABLE LCFEE (
  numero_carta_credito VARCHAR(30),
  codigo_de_comision VARCHAR(20),
  fecha_recepcion DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_pendiente DECIMAL(18,2),
  tipo_documento VARCHAR(20),
  estado_operacion VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (numero_carta_credito, codigo_de_comision)
) RCDFMT RLCFEE;

LABEL ON TABLE LCFEE IS 'Control de Cobro de Comisiones';
LABEL ON COLUMN LCFEE (
  numero_carta_credito IS 'Número de Carta de Crédito',
  codigo_de_comision IS 'Código de Comisión',
  fecha_recepcion IS 'Fecha de recepción',
  fecha_vencimiento IS 'Fecha de vencimiento',
  monto_original IS 'Monto original',
  saldo_pendiente IS 'Saldo pendiente',
  tipo_documento IS 'Tipo de Documento',
  estado_operacion IS 'Estado de la operación',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_lcfee_pk ON LCFEE(numero_carta_credito, codigo_de_comision);
CREATE INDEX idx_lcfee_created_at ON LCFEE(created_at);

CREATE OR REPLACE TABLE CNTRLRCO (
  codigo_banco VARCHAR(20),
  tipo_producto VARCHAR(20),
  numero_tabla VARCHAR(30),
  fecha_recepcion DATE,
  fecha_vencimiento DATE,
  monto_original DECIMAL(18,2),
  saldo_pendiente DECIMAL(18,2),
  tipo_documento VARCHAR(20),
  estado_operacion VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (codigo_banco, tipo_producto)
) RCDFMT RCNTRLRCO;

LABEL ON TABLE CNTRLRCO IS 'Cargos y tarifas de cobranzas.';
LABEL ON COLUMN CNTRLRCO (
  codigo_banco IS 'Código de Banco',
  tipo_producto IS 'Tipo de Producto',
  numero_tabla IS 'Número de Tabla',
  fecha_recepcion IS 'Fecha de recepción',
  fecha_vencimiento IS 'Fecha de vencimiento',
  monto_original IS 'Monto original',
  saldo_pendiente IS 'Saldo pendiente',
  tipo_documento IS 'Tipo de Documento',
  estado_operacion IS 'Estado de la operación',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_cntrlrco_pk ON CNTRLRCO(codigo_banco, tipo_producto);
CREATE INDEX idx_cntrlrco_created_at ON CNTRLRCO(created_at);

CREATE OR REPLACE TABLE GLMST (
  codigo_banco VARCHAR(20),
  codigo_moneda VARCHAR(20),
  cuenta_contable VARCHAR(24),
  descripcion_cuenta VARCHAR(120),
  naturaleza_cuenta VARCHAR(20),
  nivel_cuenta VARCHAR(50),
  saldo_actual DECIMAL(18,2),
  fecha_proceso_sistema TIMESTAMP,
  observaciones VARCHAR(120),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (codigo_banco, codigo_moneda)
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

CREATE INDEX idx_glmst_pk ON GLMST(codigo_banco, codigo_moneda);
CREATE INDEX idx_glmst_created_at ON GLMST(created_at);

CREATE OR REPLACE TABLE INPUT (
  numero_del_lote VARCHAR(30),
  secuencia_dentro_del_lote VARCHAR(50),
  descripcion_cuenta VARCHAR(120),
  naturaleza_cuenta VARCHAR(20),
  nivel_cuenta VARCHAR(50),
  saldo_actual DECIMAL(18,2),
  fecha_proceso_sistema TIMESTAMP,
  observaciones VARCHAR(120),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE GLBLN (
  codigo_banco VARCHAR(20),
  codigo_sucursal VARCHAR(20),
  codigo_moneda VARCHAR(20),
  cuenta_contable VARCHAR(24),
  descripcion_cuenta VARCHAR(120),
  naturaleza_cuenta VARCHAR(20),
  nivel_cuenta VARCHAR(50),
  saldo_actual DECIMAL(18,2),
  fecha_proceso_sistema TIMESTAMP,
  observaciones VARCHAR(120),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (codigo_banco, codigo_sucursal)
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

CREATE INDEX idx_glbln_pk ON GLBLN(codigo_banco, codigo_sucursal);
CREATE INDEX idx_glbln_created_at ON GLBLN(created_at);

CREATE OR REPLACE TABLE GLBSE (
  id BIGINT GENERATED ALWAYS AS IDENTITY,
  descripcion_cuenta VARCHAR(120),
  naturaleza_cuenta VARCHAR(20),
  nivel_cuenta VARCHAR(50),
  saldo_actual DECIMAL(18,2),
  fecha_proceso_sistema TIMESTAMP,
  observaciones VARCHAR(120),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE GLFIN (
  id BIGINT GENERATED ALWAYS AS IDENTITY,
  descripcion_cuenta VARCHAR(120),
  naturaleza_cuenta VARCHAR(20),
  nivel_cuenta VARCHAR(50),
  saldo_actual DECIMAL(18,2),
  fecha_proceso_sistema TIMESTAMP,
  observaciones VARCHAR(120),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CCDSC (
  id BIGINT GENERATED ALWAYS AS IDENTITY,
  descripcion_cuenta VARCHAR(120),
  naturaleza_cuenta VARCHAR(20),
  nivel_cuenta VARCHAR(50),
  saldo_actual DECIMAL(18,2),
  fecha_proceso_sistema TIMESTAMP,
  observaciones VARCHAR(120),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE INPT2 (
  id BIGINT GENERATED ALWAYS AS IDENTITY,
  descripcion_cuenta VARCHAR(120),
  naturaleza_cuenta VARCHAR(20),
  nivel_cuenta VARCHAR(50),
  saldo_actual DECIMAL(18,2),
  fecha_proceso_sistema TIMESTAMP,
  observaciones VARCHAR(120),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE NXINP (
  numero_batch VARCHAR(30),
  secuencia INT,
  descripcion_cuenta VARCHAR(120),
  naturaleza_cuenta VARCHAR(20),
  nivel_cuenta VARCHAR(50),
  saldo_actual DECIMAL(18,2),
  fecha_proceso_sistema TIMESTAMP,
  observaciones VARCHAR(120),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE BUMST (
  codigo_banco VARCHAR(20),
  codigo_sucursal VARCHAR(20),
  codigo_moneda VARCHAR(20),
  numero_presupuesto VARCHAR(30),
  centro_costo VARCHAR(50),
  descripcion_cuenta VARCHAR(120),
  naturaleza_cuenta VARCHAR(20),
  nivel_cuenta VARCHAR(50),
  saldo_actual DECIMAL(18,2),
  fecha_proceso_sistema TIMESTAMP,
  observaciones VARCHAR(120),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE ROCOL (
  codigo_banco VARCHAR(20),
  id_cliente VARCHAR(30),
  numero_garantia VARCHAR(30),
  tipo_garantia VARCHAR(20),
  valor_garantia DECIMAL(18,2),
  fecha_avaluo DATE,
  fecha_vencimiento DATE,
  estado_garantia VARCHAR(20),
  observaciones VARCHAR(120),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE RCOLL (
  codigo_banco VARCHAR(20),
  cuenta_a_garantizar VARCHAR(50),
  cuenta_que_garantiza VARCHAR(50),
  tipo_garantia VARCHAR(20),
  valor_garantia DECIMAL(18,2),
  fecha_avaluo DATE,
  fecha_vencimiento DATE,
  estado_garantia VARCHAR(20),
  observaciones VARCHAR(120),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE LNECR (
  id_cliente VARCHAR(30),
  numero_linea VARCHAR(30),
  fecha_aprobacion DATE,
  fecha_vencimiento DATE,
  monto_aprobado DECIMAL(18,2),
  monto_utilizado DECIMAL(18,2),
  monto_disponible DECIMAL(18,2),
  estado_linea VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id_cliente, numero_linea)
) RCDFMT RLNECR;

LABEL ON TABLE LNECR IS 'Maestro de Lineas de Crédito';
LABEL ON COLUMN LNECR (
  id_cliente IS 'ID Cliente',
  numero_linea IS 'Número de Línea',
  fecha_aprobacion IS 'Fecha de aprobación',
  fecha_vencimiento IS 'Fecha de vencimiento',
  monto_aprobado IS 'Monto aprobado',
  monto_utilizado IS 'Monto utilizado',
  monto_disponible IS 'Monto disponible',
  estado_linea IS 'Estado de la línea',
  usuario_creacion IS 'Usuario que creó el registro',
  usuario_actualizacion IS 'Usuario que actualizó el registro',
  version_registro IS 'Versión del registro',
  observaciones IS 'Observaciones',
  estado_registro IS 'Estado del registro',
  created_at IS 'Fecha de creación del registro',
  updated_at IS 'Fecha de última actualización'
);

CREATE INDEX idx_lnecr_pk ON LNECR(id_cliente, numero_linea);
CREATE INDEX idx_lnecr_created_at ON LNECR(created_at);

CREATE OR REPLACE TABLE FIXMS (
  numero_activo VARCHAR(30),
  descripcion VARCHAR(120),
  fecha_adquisicion DATE,
  valor_adquisicion DECIMAL(18,2),
  vida_util_meses INT,
  depreciacion_acumulada DECIMAL(18,2),
  estado_activo VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CLSMS (
  codigo_clase VARCHAR(20),
  descripcion VARCHAR(120),
  fecha_adquisicion DATE,
  valor_adquisicion DECIMAL(18,2),
  vida_util_meses INT,
  depreciacion_acumulada DECIMAL(18,2),
  estado_activo VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE LOCMS (
  numero_localizacion VARCHAR(30),
  descripcion VARCHAR(120),
  fecha_adquisicion DATE,
  valor_adquisicion DECIMAL(18,2),
  vida_util_meses INT,
  depreciacion_acumulada DECIMAL(18,2),
  estado_activo VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CNTRLFIX (
  codigo_banco VARCHAR(20),
  descripcion VARCHAR(120),
  fecha_adquisicion DATE,
  valor_adquisicion DECIMAL(18,2),
  vida_util_meses INT,
  depreciacion_acumulada DECIMAL(18,2),
  estado_activo VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE BAVEN (
  numero_proveedor VARCHAR(30),
  numero_identificacion VARCHAR(30),
  razon_social VARCHAR(80),
  email VARCHAR(80),
  telefono VARCHAR(80),
  monto_original DECIMAL(18,2),
  saldo_pendiente DECIMAL(18,2),
  fecha_emision DATE,
  fecha_vencimiento DATE,
  estado_cxp VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE BAPRC (
  codigo_banco VARCHAR(20),
  codigo_sucursal VARCHAR(20),
  origen_cuenta VARCHAR(20),
  tipo_cuenta VARCHAR(20),
  id_cliente VARCHAR(30),
  numero_referencia VARCHAR(30),
  tipo_registro VARCHAR(20),
  numero_identificacion VARCHAR(30),
  razon_social VARCHAR(80),
  email VARCHAR(80),
  telefono VARCHAR(80),
  monto_original DECIMAL(18,2),
  saldo_pendiente DECIMAL(18,2),
  fecha_emision DATE,
  fecha_vencimiento DATE,
  estado_cxp VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE BAMOR (
  codigo_banco VARCHAR(20),
  codigo_sucursal VARCHAR(20),
  origen_cuenta VARCHAR(20),
  tipo_cuenta VARCHAR(20),
  id_cliente VARCHAR(30),
  numero_referencia VARCHAR(30),
  tipo_registro VARCHAR(20),
  numero_identificacion VARCHAR(30),
  razon_social VARCHAR(80),
  email VARCHAR(80),
  telefono VARCHAR(80),
  monto_original DECIMAL(18,2),
  saldo_pendiente DECIMAL(18,2),
  fecha_emision DATE,
  fecha_vencimiento DATE,
  estado_cxp VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE BAINP (
  numero_batch VARCHAR(30),
  secuencia INT,
  numero_identificacion VARCHAR(30),
  razon_social VARCHAR(80),
  email VARCHAR(80),
  telefono VARCHAR(80),
  monto_original DECIMAL(18,2),
  saldo_pendiente DECIMAL(18,2),
  fecha_emision DATE,
  fecha_vencimiento DATE,
  estado_cxp VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE BAHIS (
  codigo_banco VARCHAR(20),
  origen_cuenta VARCHAR(20),
  tipo_cuenta VARCHAR(20),
  id_cliente VARCHAR(30),
  numero_referencia VARCHAR(30),
  fecha DATE,
  numero_identificacion VARCHAR(30),
  razon_social VARCHAR(80),
  email VARCHAR(80),
  telefono VARCHAR(80),
  monto_original DECIMAL(18,2),
  saldo_pendiente DECIMAL(18,2),
  fecha_emision DATE,
  fecha_vencimiento DATE,
  estado_cxp VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CNTRLBAF (
  codigo_banco VARCHAR(20),
  codigo_moneda VARCHAR(20),
  numero_identificacion VARCHAR(30),
  razon_social VARCHAR(80),
  email VARCHAR(80),
  telefono VARCHAR(80),
  monto_original DECIMAL(18,2),
  saldo_pendiente DECIMAL(18,2),
  fecha_emision DATE,
  fecha_vencimiento DATE,
  estado_cxp VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CNTRLBAP (
  codigo_banco VARCHAR(20),
  codigo_moneda VARCHAR(20),
  numero_identificacion VARCHAR(30),
  razon_social VARCHAR(80),
  email VARCHAR(80),
  telefono VARCHAR(80),
  monto_original DECIMAL(18,2),
  saldo_pendiente DECIMAL(18,2),
  fecha_emision DATE,
  fecha_vencimiento DATE,
  estado_cxp VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE FIWRT (
  codigo_banco VARCHAR(20),
  numero_transferencia VARCHAR(30),
  fecha_operacion DATE,
  monto DECIMAL(18,2),
  beneficiario VARCHAR(80),
  banco_destino VARCHAR(80),
  canal_pago VARCHAR(20),
  estado_pago VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE POFED (
  codigo_banco VARCHAR(20),
  codigo_moneda VARCHAR(20),
  id_cliente VARCHAR(30),
  tipo_registro VARCHAR(20),
  numero_cuenta VARCHAR(24),
  numero_referencia VARCHAR(30),
  fecha_operacion DATE,
  monto DECIMAL(18,2),
  beneficiario VARCHAR(80),
  banco_destino VARCHAR(80),
  canal_pago VARCHAR(20),
  estado_pago VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE POSWF (
  codigo_banco VARCHAR(20),
  codigo_moneda VARCHAR(20),
  id_cliente VARCHAR(30),
  tipo_registro VARCHAR(20),
  numero_cuenta VARCHAR(24),
  numero_referencia VARCHAR(30),
  monto DECIMAL(18,2),
  fecha_operacion DATE,
  beneficiario VARCHAR(80),
  banco_destino VARCHAR(80),
  canal_pago VARCHAR(20),
  estado_pago VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE POTLX (
  codigo_banco VARCHAR(20),
  codigo_moneda VARCHAR(20),
  id_cliente VARCHAR(30),
  tipo_registro VARCHAR(20),
  numero_cuenta VARCHAR(24),
  numero_referencia VARCHAR(30),
  fecha_operacion DATE,
  monto DECIMAL(18,2),
  beneficiario VARCHAR(80),
  banco_destino VARCHAR(80),
  canal_pago VARCHAR(20),
  estado_pago VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE SWITF (
  codigo_banco VARCHAR(20),
  numero_referencia VARCHAR(30),
  formato_swift VARCHAR(50),
  fecha_operacion DATE,
  monto DECIMAL(18,2),
  beneficiario VARCHAR(80),
  banco_destino VARCHAR(80),
  canal_pago VARCHAR(20),
  estado_pago VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE CNTRLPRF (
  codigo_banco VARCHAR(20),
  parametro VARCHAR(20),
  codigo_tabla VARCHAR(20),
  fecha_operacion DATE,
  monto DECIMAL(18,2),
  beneficiario VARCHAR(80),
  banco_destino VARCHAR(80),
  canal_pago VARCHAR(20),
  estado_pago VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE PLPCR (
  numero_propuesta VARCHAR(30),
  fecha_propuesta DATE,
  monto_solicitado DECIMAL(18,2),
  plazo_meses INT,
  tasa_propuesta DECIMAL(18,2),
  dictamen_credito VARCHAR(120),
  estado_propuesta VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE PLPRD (
  numero_propuesta VARCHAR(30),
  numero_prestamo VARCHAR(30),
  fecha_aprobacion DATE,
  monto_aprobado DECIMAL(18,2),
  plazo_meses INT,
  tasa_aprobada DECIMAL(18,2),
  estado_credito VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE PLGRT (
  numero_garantia VARCHAR(30),
  numero_prestamo VARCHAR(30),
  tipo_garantia VARCHAR(30),
  valor_garantia DECIMAL(18,2),
  fecha_emision DATE,
  fecha_vencimiento DATE,
  estado_garantia VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE DPMST (
  numero_documento VARCHAR(30),
  codigo_documento VARCHAR(30),
  fecha_emision DATE,
  fecha_vencimiento DATE,
  monto DECIMAL(18,2),
  estado_documento VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE DPDTL (
  numero_documento VARCHAR(30),
  linea INT,
  cuenta_contable VARCHAR(30),
  monto DECIMAL(18,2),
  descripcion VARCHAR(120),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE IFMST (
  codigo_instrumento VARCHAR(30),
  tipo_instrumento VARCHAR(20),
  fecha_emision DATE,
  fecha_vencimiento DATE,
  monto DECIMAL(18,2),
  estado_instrumento VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE IFDTL (
  codigo_instrumento VARCHAR(30),
  numero_linea INT,
  fecha_operacion DATE,
  monto DECIMAL(18,2),
  descripcion VARCHAR(120),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE DPGLN (
  codigo_documento VARCHAR(30),
  linea INT,
  monto DECIMAL(18,2),
  cuenta_contable VARCHAR(30),
  descripcion VARCHAR(120),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE LIMST (
  codigo_linea VARCHAR(30),
  descripcion VARCHAR(120),
  tipo_linea VARCHAR(20),
  monto_aprobado DECIMAL(18,2),
  monto_disponible DECIMAL(18,2),
  tasa_aprobada DECIMAL(18,2),
  plazo_meses INT,
  estado_linea VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE DIMST (
  codigo_documento VARCHAR(30),
  descripcion VARCHAR(120),
  fecha_emision DATE,
  fecha_vencimiento DATE,
  monto DECIMAL(18,2),
  estado_documento VARCHAR(20),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE DITBL (
  codigo_documento VARCHAR(30),
  numero_linea INT,
  cuenta_contable VARCHAR(30),
  monto DECIMAL(18,2),
  descripcion VARCHAR(120),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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

CREATE OR REPLACE TABLE USERS (
  id_usuario VARCHAR(30),
  nombre_usuario VARCHAR(80),
  email VARCHAR(80),
  rol_usuario VARCHAR(50),
  estado_usuario VARCHAR(20),
  fecha_creacion DATE,
  fecha_ultimo_acceso DATE,
  telefono VARCHAR(30),
  departamento VARCHAR(60),
  ubicacion VARCHAR(60),
  usuario_creacion VARCHAR(30),
  usuario_actualizacion VARCHAR(30),
  version_registro INT,
  observaciones VARCHAR(120),
  estado_registro CHAR(1),
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  updated_at TIMESTAMP,
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


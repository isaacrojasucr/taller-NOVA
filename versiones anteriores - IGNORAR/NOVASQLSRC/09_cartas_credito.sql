--==============================================================
-- TABLA: LCMST
--==============================================================
-- Nombre de la Tabla: LCMST
-- DESCRIPCIÓN: Maestro de Cartas de Crédito.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE LCMST (
  ID BIGINT FOR COLUMN ID GENERATED ALWAYS AS IDENTITY,
  FECHA_EMISION DATE FOR COLUMN FECHA_EMIS,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  MONTO_ORIGINAL DECIMAL(18,2) FOR COLUMN MONTO_ORIG,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  BANCO_CORRESPONSAL VARCHAR(80) FOR COLUMN BANCO_CORR,
  PAIS_DESTINO VARCHAR(80) FOR COLUMN PAIS_DESTI,
  ESTADO_CARTA VARCHAR(20) FOR COLUMN ESTADO_CAR,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
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


COMMENT ON TABLE LCMST IS 'Maestro de Cartas de Crédito.';
LABEL ON TABLE LCMST IS 'Maestro de Cartas de Crédito.';

COMMENT ON COLUMN LCMST(
  ID IS 'Identificador técnico',
  FECHA_EMISION IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual',
  BANCO_CORRESPONSAL IS 'Banco corresponsal',
  PAIS_DESTINO IS 'País destino',
  ESTADO_CARTA IS 'Estado de Carta',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN LCMST(
  ID IS 'Identificador técnico'  LABEL ... TEXT IS 'Identificador técnico',
  FECHA_EMISION IS 'Fecha de emisión'  LABEL ... TEXT IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original'  LABEL ... TEXT IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  BANCO_CORRESPONSAL IS 'Banco corresponsal'  LABEL ... TEXT IS 'Banco corresponsal',
  PAIS_DESTINO IS 'País destino'  LABEL ... TEXT IS 'País destino',
  ESTADO_CARTA IS 'Estado de Carta'  LABEL ... TEXT IS 'Estado de Carta',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_lcmst_pk ON LCMST(id);
CREATE INDEX idx_lcmst_created_at ON LCMST(created_at);

--==============================================================
-- TABLA: LCDOC
--==============================================================
-- Nombre de la Tabla: LCDOC
-- DESCRIPCIÓN: Documentos de Cartas de Crédito
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE LCDOC (
  NUMERO_CARTA_CREDITO VARCHAR(30) FOR COLUMN NUMERO_CAR,
  TIPO_REGISTRO VARCHAR(20) FOR COLUMN TIPO_REGIS,
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_DOCUMENTO VARCHAR(20) FOR COLUMN CODIGO_DOC,
  NUMERO_LINEA VARCHAR(30) FOR COLUMN NUMERO_LIN,
  FECHA_EMISION DATE FOR COLUMN FECHA_EMIS,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  MONTO_ORIGINAL DECIMAL(18,2) FOR COLUMN MONTO_ORIG,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  BANCO_CORRESPONSAL VARCHAR(80) FOR COLUMN BANCO_CORR,
  PAIS_DESTINO VARCHAR(80) FOR COLUMN PAIS_DESTI,
  ESTADO_CARTA VARCHAR(20) FOR COLUMN ESTADO_CAR,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
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


COMMENT ON TABLE LCDOC IS 'Documentos de Cartas de Crédito';
LABEL ON TABLE LCDOC IS 'Documentos de Cartas de Crédito';

COMMENT ON COLUMN LCDOC(
  NUMERO_CARTA_CREDITO IS 'Número de Carta de Crédito',
  TIPO_REGISTRO IS 'Tipo de Registro',
  CODIGO_BANCO IS 'Código de Banco',
  CODIGO_DOCUMENTO IS 'Código de Documento',
  NUMERO_LINEA IS 'Número de Línea',
  FECHA_EMISION IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual',
  BANCO_CORRESPONSAL IS 'Banco corresponsal',
  PAIS_DESTINO IS 'País destino',
  ESTADO_CARTA IS 'Estado de Carta',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN LCDOC(
  NUMERO_CARTA_CREDITO IS 'Número de Carta de Crédito'  LABEL ... TEXT IS 'Número de Carta de Crédito',
  TIPO_REGISTRO IS 'Tipo de Registro'  LABEL ... TEXT IS 'Tipo de Registro',
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  CODIGO_DOCUMENTO IS 'Código de Documento'  LABEL ... TEXT IS 'Código de Documento',
  NUMERO_LINEA IS 'Número de Línea'  LABEL ... TEXT IS 'Número de Línea',
  FECHA_EMISION IS 'Fecha de emisión'  LABEL ... TEXT IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original'  LABEL ... TEXT IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  BANCO_CORRESPONSAL IS 'Banco corresponsal'  LABEL ... TEXT IS 'Banco corresponsal',
  PAIS_DESTINO IS 'País destino'  LABEL ... TEXT IS 'País destino',
  ESTADO_CARTA IS 'Estado de Carta'  LABEL ... TEXT IS 'Estado de Carta',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_lcdoc_pk ON LCDOC(numero_carta_credito, tipo_registro);
CREATE INDEX idx_lcdoc_created_at ON LCDOC(created_at);

--==============================================================
-- TABLA: LCFIN
--==============================================================
-- Nombre de la Tabla: LCFIN
-- DESCRIPCIÓN: Indice de Formatos de Cartas de Crédito
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE LCFIN (
  NIVEL INT FOR COLUMN NIVEL,
  CODIGO_DOCUMENTO VARCHAR(20) FOR COLUMN CODIGO_DOC,
  SECUENCIA_DE_TEXTO VARCHAR(50) FOR COLUMN SECUENCIA_,
  FECHA_EMISION DATE FOR COLUMN FECHA_EMIS,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  MONTO_ORIGINAL DECIMAL(18,2) FOR COLUMN MONTO_ORIG,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  BANCO_CORRESPONSAL VARCHAR(80) FOR COLUMN BANCO_CORR,
  PAIS_DESTINO VARCHAR(80) FOR COLUMN PAIS_DESTI,
  ESTADO_CARTA VARCHAR(20) FOR COLUMN ESTADO_CAR,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
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


COMMENT ON TABLE LCFIN IS 'Indice de Formatos de Cartas de Crédito';
LABEL ON TABLE LCFIN IS 'Indice de Formatos de Cartas de Crédito';

COMMENT ON COLUMN LCFIN(
  NIVEL IS 'Nivel',
  CODIGO_DOCUMENTO IS 'Código de Documento',
  SECUENCIA_DE_TEXTO IS 'Secuencia de Texto',
  FECHA_EMISION IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual',
  BANCO_CORRESPONSAL IS 'Banco corresponsal',
  PAIS_DESTINO IS 'País destino',
  ESTADO_CARTA IS 'Estado de Carta',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN LCFIN(
  NIVEL IS 'Nivel'  LABEL ... TEXT IS 'Nivel',
  CODIGO_DOCUMENTO IS 'Código de Documento'  LABEL ... TEXT IS 'Código de Documento',
  SECUENCIA_DE_TEXTO IS 'Secuencia de Texto'  LABEL ... TEXT IS 'Secuencia de Texto',
  FECHA_EMISION IS 'Fecha de emisión'  LABEL ... TEXT IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original'  LABEL ... TEXT IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  BANCO_CORRESPONSAL IS 'Banco corresponsal'  LABEL ... TEXT IS 'Banco corresponsal',
  PAIS_DESTINO IS 'País destino'  LABEL ... TEXT IS 'País destino',
  ESTADO_CARTA IS 'Estado de Carta'  LABEL ... TEXT IS 'Estado de Carta',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_lcfin_pk ON LCFIN(nivel, codigo_documento);
CREATE INDEX idx_lcfin_created_at ON LCFIN(created_at);

--==============================================================
-- TABLA: LCFMT
--==============================================================
-- Nombre de la Tabla: LCFMT
-- DESCRIPCIÓN: Formatos de Cartas de Crédito
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE LCFMT (
  CODIGO_DOCUMENTO VARCHAR(20) FOR COLUMN CODIGO_DOC,
  SECUENCIA_DE_TEXTO VARCHAR(50) FOR COLUMN SECUENCIA_,
  NUMERO_LINEA VARCHAR(30) FOR COLUMN NUMERO_LIN,
  FECHA_EMISION DATE FOR COLUMN FECHA_EMIS,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  MONTO_ORIGINAL DECIMAL(18,2) FOR COLUMN MONTO_ORIG,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  BANCO_CORRESPONSAL VARCHAR(80) FOR COLUMN BANCO_CORR,
  PAIS_DESTINO VARCHAR(80) FOR COLUMN PAIS_DESTI,
  ESTADO_CARTA VARCHAR(20) FOR COLUMN ESTADO_CAR,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
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


COMMENT ON TABLE LCFMT IS 'Formatos de Cartas de Crédito';
LABEL ON TABLE LCFMT IS 'Formatos de Cartas de Crédito';

COMMENT ON COLUMN LCFMT(
  CODIGO_DOCUMENTO IS 'Código de Documento',
  SECUENCIA_DE_TEXTO IS 'Secuencia de Texto',
  NUMERO_LINEA IS 'Número de Línea',
  FECHA_EMISION IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual',
  BANCO_CORRESPONSAL IS 'Banco corresponsal',
  PAIS_DESTINO IS 'País destino',
  ESTADO_CARTA IS 'Estado de Carta',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN LCFMT(
  CODIGO_DOCUMENTO IS 'Código de Documento'  LABEL ... TEXT IS 'Código de Documento',
  SECUENCIA_DE_TEXTO IS 'Secuencia de Texto'  LABEL ... TEXT IS 'Secuencia de Texto',
  NUMERO_LINEA IS 'Número de Línea'  LABEL ... TEXT IS 'Número de Línea',
  FECHA_EMISION IS 'Fecha de emisión'  LABEL ... TEXT IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original'  LABEL ... TEXT IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  BANCO_CORRESPONSAL IS 'Banco corresponsal'  LABEL ... TEXT IS 'Banco corresponsal',
  PAIS_DESTINO IS 'País destino'  LABEL ... TEXT IS 'País destino',
  ESTADO_CARTA IS 'Estado de Carta'  LABEL ... TEXT IS 'Estado de Carta',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_lcfmt_pk ON LCFMT(codigo_documento, secuencia_de_texto);
CREATE INDEX idx_lcfmt_created_at ON LCFMT(created_at);

--==============================================================
-- TABLA: LCADM
--==============================================================
-- Nombre de la Tabla: LCADM
-- DESCRIPCIÓN: Enmiendas a Cartas de Crédito
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE LCADM (
  NUMERO_CARTA_CREDITO VARCHAR(30) FOR COLUMN NUMERO_CAR,
  NUMERO_ENMIENDA VARCHAR(30) FOR COLUMN NUMERO_ENM,
  FECHA_EMISION DATE FOR COLUMN FECHA_EMIS,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  MONTO_ORIGINAL DECIMAL(18,2) FOR COLUMN MONTO_ORIG,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  BANCO_CORRESPONSAL VARCHAR(80) FOR COLUMN BANCO_CORR,
  PAIS_DESTINO VARCHAR(80) FOR COLUMN PAIS_DESTI,
  ESTADO_CARTA VARCHAR(20) FOR COLUMN ESTADO_CAR,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
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


COMMENT ON TABLE LCADM IS 'Enmiendas a Cartas de Crédito';
LABEL ON TABLE LCADM IS 'Enmiendas a Cartas de Crédito';

COMMENT ON COLUMN LCADM(
  NUMERO_CARTA_CREDITO IS 'Número de Carta de Crédito',
  NUMERO_ENMIENDA IS 'Número de Enmienda',
  FECHA_EMISION IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual',
  BANCO_CORRESPONSAL IS 'Banco corresponsal',
  PAIS_DESTINO IS 'País destino',
  ESTADO_CARTA IS 'Estado de Carta',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN LCADM(
  NUMERO_CARTA_CREDITO IS 'Número de Carta de Crédito'  LABEL ... TEXT IS 'Número de Carta de Crédito',
  NUMERO_ENMIENDA IS 'Número de Enmienda'  LABEL ... TEXT IS 'Número de Enmienda',
  FECHA_EMISION IS 'Fecha de emisión'  LABEL ... TEXT IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original'  LABEL ... TEXT IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  BANCO_CORRESPONSAL IS 'Banco corresponsal'  LABEL ... TEXT IS 'Banco corresponsal',
  PAIS_DESTINO IS 'País destino'  LABEL ... TEXT IS 'País destino',
  ESTADO_CARTA IS 'Estado de Carta'  LABEL ... TEXT IS 'Estado de Carta',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_lcadm_pk ON LCADM(numero_carta_credito, numero_enmienda);
CREATE INDEX idx_lcadm_created_at ON LCADM(created_at);

--==============================================================
-- TABLA: LCCOV
--==============================================================
-- Nombre de la Tabla: LCCOV
-- DESCRIPCIÓN: Negociaciones de Cartas de Crédito
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE LCCOV (
  NUMERO_CARTA_CREDITO VARCHAR(30) FOR COLUMN NUMERO_CAR,
  SECUENCIA INT FOR COLUMN SECUENCIA,
  FECHA_EMISION DATE FOR COLUMN FECHA_EMIS,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  MONTO_ORIGINAL DECIMAL(18,2) FOR COLUMN MONTO_ORIG,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  BANCO_CORRESPONSAL VARCHAR(80) FOR COLUMN BANCO_CORR,
  PAIS_DESTINO VARCHAR(80) FOR COLUMN PAIS_DESTI,
  ESTADO_CARTA VARCHAR(20) FOR COLUMN ESTADO_CAR,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
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


COMMENT ON TABLE LCCOV IS 'Negociaciones de Cartas de Crédito';
LABEL ON TABLE LCCOV IS 'Negociaciones de Cartas de Crédito';

COMMENT ON COLUMN LCCOV(
  NUMERO_CARTA_CREDITO IS 'Número de Carta de Crédito',
  SECUENCIA IS 'Secuencia',
  FECHA_EMISION IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual',
  BANCO_CORRESPONSAL IS 'Banco corresponsal',
  PAIS_DESTINO IS 'País destino',
  ESTADO_CARTA IS 'Estado de Carta',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN LCCOV(
  NUMERO_CARTA_CREDITO IS 'Número de Carta de Crédito'  LABEL ... TEXT IS 'Número de Carta de Crédito',
  SECUENCIA IS 'Secuencia'  LABEL ... TEXT IS 'Secuencia',
  FECHA_EMISION IS 'Fecha de emisión'  LABEL ... TEXT IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original'  LABEL ... TEXT IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  BANCO_CORRESPONSAL IS 'Banco corresponsal'  LABEL ... TEXT IS 'Banco corresponsal',
  PAIS_DESTINO IS 'País destino'  LABEL ... TEXT IS 'País destino',
  ESTADO_CARTA IS 'Estado de Carta'  LABEL ... TEXT IS 'Estado de Carta',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_lccov_pk ON LCCOV(numero_carta_credito, secuencia);
CREATE INDEX idx_lccov_created_at ON LCCOV(created_at);

--==============================================================
-- TABLA: LCDIN
--==============================================================
-- Nombre de la Tabla: LCDIN
-- DESCRIPCIÓN: Documentos Recibidos en Cartas de Crédito
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE LCDIN (
  NUMERO_CARTA_CREDITO VARCHAR(30) FOR COLUMN NUMERO_CAR,
  SECUENCIA INT FOR COLUMN SECUENCIA,
  FECHA_EMISION DATE FOR COLUMN FECHA_EMIS,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  MONTO_ORIGINAL DECIMAL(18,2) FOR COLUMN MONTO_ORIG,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  BANCO_CORRESPONSAL VARCHAR(80) FOR COLUMN BANCO_CORR,
  PAIS_DESTINO VARCHAR(80) FOR COLUMN PAIS_DESTI,
  ESTADO_CARTA VARCHAR(20) FOR COLUMN ESTADO_CAR,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
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


COMMENT ON TABLE LCDIN IS 'Documentos Recibidos en Cartas de Crédito';
LABEL ON TABLE LCDIN IS 'Documentos Recibidos en Cartas de Crédito';

COMMENT ON COLUMN LCDIN(
  NUMERO_CARTA_CREDITO IS 'Número de Carta de Crédito',
  SECUENCIA IS 'Secuencia',
  FECHA_EMISION IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual',
  BANCO_CORRESPONSAL IS 'Banco corresponsal',
  PAIS_DESTINO IS 'País destino',
  ESTADO_CARTA IS 'Estado de Carta',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN LCDIN(
  NUMERO_CARTA_CREDITO IS 'Número de Carta de Crédito'  LABEL ... TEXT IS 'Número de Carta de Crédito',
  SECUENCIA IS 'Secuencia'  LABEL ... TEXT IS 'Secuencia',
  FECHA_EMISION IS 'Fecha de emisión'  LABEL ... TEXT IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original'  LABEL ... TEXT IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  BANCO_CORRESPONSAL IS 'Banco corresponsal'  LABEL ... TEXT IS 'Banco corresponsal',
  PAIS_DESTINO IS 'País destino'  LABEL ... TEXT IS 'País destino',
  ESTADO_CARTA IS 'Estado de Carta'  LABEL ... TEXT IS 'Estado de Carta',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_lcdin_pk ON LCDIN(numero_carta_credito, secuencia);
CREATE INDEX idx_lcdin_created_at ON LCDIN(created_at);

--==============================================================
-- TABLA: LCSTA
--==============================================================
-- Nombre de la Tabla: LCSTA
-- DESCRIPCIÓN: Aperturas y pagos de cartas de crédito
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE LCSTA (
  ID BIGINT FOR COLUMN ID GENERATED ALWAYS AS IDENTITY,
  FECHA_EMISION DATE FOR COLUMN FECHA_EMIS,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  MONTO_ORIGINAL DECIMAL(18,2) FOR COLUMN MONTO_ORIG,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  BANCO_CORRESPONSAL VARCHAR(80) FOR COLUMN BANCO_CORR,
  PAIS_DESTINO VARCHAR(80) FOR COLUMN PAIS_DESTI,
  ESTADO_CARTA VARCHAR(20) FOR COLUMN ESTADO_CAR,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
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


COMMENT ON TABLE LCSTA IS 'Aperturas y pagos de cartas de crédito';
LABEL ON TABLE LCSTA IS 'Aperturas y pagos de cartas de crédito';

COMMENT ON COLUMN LCSTA(
  ID IS 'Identificador técnico',
  FECHA_EMISION IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual',
  BANCO_CORRESPONSAL IS 'Banco corresponsal',
  PAIS_DESTINO IS 'País destino',
  ESTADO_CARTA IS 'Estado de Carta',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN LCSTA(
  ID IS 'Identificador técnico'  LABEL ... TEXT IS 'Identificador técnico',
  FECHA_EMISION IS 'Fecha de emisión'  LABEL ... TEXT IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original'  LABEL ... TEXT IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  BANCO_CORRESPONSAL IS 'Banco corresponsal'  LABEL ... TEXT IS 'Banco corresponsal',
  PAIS_DESTINO IS 'País destino'  LABEL ... TEXT IS 'País destino',
  ESTADO_CARTA IS 'Estado de Carta'  LABEL ... TEXT IS 'Estado de Carta',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_lcsta_pk ON LCSTA(id);
CREATE INDEX idx_lcsta_created_at ON LCSTA(created_at);

--==============================================================
-- TABLA: CNTRLLCP
--==============================================================
-- Nombre de la Tabla: CNTRLLCP
-- DESCRIPCIÓN: Archivo de Control de Cartas de Crédito
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CNTRLLCP (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  LCRPARM VARCHAR(20) FOR COLUMN LCRPARM,
  FECHA_EMISION DATE FOR COLUMN FECHA_EMIS,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  MONTO_ORIGINAL DECIMAL(18,2) FOR COLUMN MONTO_ORIG,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  BANCO_CORRESPONSAL VARCHAR(80) FOR COLUMN BANCO_CORR,
  PAIS_DESTINO VARCHAR(80) FOR COLUMN PAIS_DESTI,
  ESTADO_CARTA VARCHAR(20) FOR COLUMN ESTADO_CAR,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
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


COMMENT ON TABLE CNTRLLCP IS 'Archivo de Control de Cartas de Crédito';
LABEL ON TABLE CNTRLLCP IS 'Archivo de Control de Cartas de Crédito';

COMMENT ON COLUMN CNTRLLCP(
  CODIGO_BANCO IS 'Código de Banco',
  LCRPARM IS 'Parámetro LCRPARM',
  FECHA_EMISION IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual',
  BANCO_CORRESPONSAL IS 'Banco corresponsal',
  PAIS_DESTINO IS 'País destino',
  ESTADO_CARTA IS 'Estado de Carta',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN CNTRLLCP(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  LCRPARM IS 'Parámetro LCRPARM'  LABEL ... TEXT IS 'Parámetro LCRPARM',
  FECHA_EMISION IS 'Fecha de emisión'  LABEL ... TEXT IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original'  LABEL ... TEXT IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  BANCO_CORRESPONSAL IS 'Banco corresponsal'  LABEL ... TEXT IS 'Banco corresponsal',
  PAIS_DESTINO IS 'País destino'  LABEL ... TEXT IS 'País destino',
  ESTADO_CARTA IS 'Estado de Carta'  LABEL ... TEXT IS 'Estado de Carta',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_cntrllcp_pk ON CNTRLLCP(codigo_banco, lcrparm);
CREATE INDEX idx_cntrllcp_created_at ON CNTRLLCP(created_at);

--==============================================================
-- TABLA: CNTRLRLC
--==============================================================
-- Nombre de la Tabla: CNTRLRLC
-- DESCRIPCIÓN: Cargos y tarifas de cartas de crédito.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CNTRLRLC (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  TIPO_PRODUCTO VARCHAR(20) FOR COLUMN TIPO_PRODU,
  NUMERO_TABLA VARCHAR(30) FOR COLUMN NUMERO_TAB,
  FECHA_EMISION DATE FOR COLUMN FECHA_EMIS,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  MONTO_ORIGINAL DECIMAL(18,2) FOR COLUMN MONTO_ORIG,
  SALDO_ACTUAL DECIMAL(18,2) FOR COLUMN SALDO_ACTU,
  BANCO_CORRESPONSAL VARCHAR(80) FOR COLUMN BANCO_CORR,
  PAIS_DESTINO VARCHAR(80) FOR COLUMN PAIS_DESTI,
  ESTADO_CARTA VARCHAR(20) FOR COLUMN ESTADO_CAR,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
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


COMMENT ON TABLE CNTRLRLC IS 'Cargos y tarifas de cartas de crédito.';
LABEL ON TABLE CNTRLRLC IS 'Cargos y tarifas de cartas de crédito.';

COMMENT ON COLUMN CNTRLRLC(
  CODIGO_BANCO IS 'Código de Banco',
  TIPO_PRODUCTO IS 'Tipo de Producto',
  NUMERO_TABLA IS 'Número de Tabla',
  FECHA_EMISION IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual',
  BANCO_CORRESPONSAL IS 'Banco corresponsal',
  PAIS_DESTINO IS 'País destino',
  ESTADO_CARTA IS 'Estado de Carta',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN CNTRLRLC(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  TIPO_PRODUCTO IS 'Tipo de Producto'  LABEL ... TEXT IS 'Tipo de Producto',
  NUMERO_TABLA IS 'Número de Tabla'  LABEL ... TEXT IS 'Número de Tabla',
  FECHA_EMISION IS 'Fecha de emisión'  LABEL ... TEXT IS 'Fecha de emisión',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original'  LABEL ... TEXT IS 'Monto original',
  SALDO_ACTUAL IS 'Saldo actual'  LABEL ... TEXT IS 'Saldo actual',
  BANCO_CORRESPONSAL IS 'Banco corresponsal'  LABEL ... TEXT IS 'Banco corresponsal',
  PAIS_DESTINO IS 'País destino'  LABEL ... TEXT IS 'País destino',
  ESTADO_CARTA IS 'Estado de Carta'  LABEL ... TEXT IS 'Estado de Carta',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_cntrlrlc_pk ON CNTRLRLC(codigo_banco, tipo_producto);
CREATE INDEX idx_cntrlrlc_created_at ON CNTRLRLC(created_at);

--==============================================================
-- TABLA: DCMST
--==============================================================
-- Nombre de la Tabla: DCMST
-- DESCRIPCIÓN: Maestro de Cobranzas Documentarias.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE DCMST (
  ID BIGINT FOR COLUMN ID GENERATED ALWAYS AS IDENTITY,
  FECHA_RECEPCION DATE FOR COLUMN FECHA_RECE,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  MONTO_ORIGINAL DECIMAL(18,2) FOR COLUMN MONTO_ORIG,
  SALDO_PENDIENTE DECIMAL(18,2) FOR COLUMN SALDO_PEND,
  TIPO_DOCUMENTO VARCHAR(20) FOR COLUMN TIPO_DOCUM,
  ESTADO_OPERACION VARCHAR(20) FOR COLUMN ESTADO_OPE,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
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


COMMENT ON TABLE DCMST IS 'Maestro de Cobranzas Documentarias.';
LABEL ON TABLE DCMST IS 'Maestro de Cobranzas Documentarias.';

COMMENT ON COLUMN DCMST(
  ID IS 'Identificador técnico',
  FECHA_RECEPCION IS 'Fecha de recepción',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original',
  SALDO_PENDIENTE IS 'Saldo pendiente',
  TIPO_DOCUMENTO IS 'Tipo de Documento',
  ESTADO_OPERACION IS 'Estado de la operación',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN DCMST(
  ID IS 'Identificador técnico'  LABEL ... TEXT IS 'Identificador técnico',
  FECHA_RECEPCION IS 'Fecha de recepción'  LABEL ... TEXT IS 'Fecha de recepción',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original'  LABEL ... TEXT IS 'Monto original',
  SALDO_PENDIENTE IS 'Saldo pendiente'  LABEL ... TEXT IS 'Saldo pendiente',
  TIPO_DOCUMENTO IS 'Tipo de Documento'  LABEL ... TEXT IS 'Tipo de Documento',
  ESTADO_OPERACION IS 'Estado de la operación'  LABEL ... TEXT IS 'Estado de la operación',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_dcmst_pk ON DCMST(id);
CREATE INDEX idx_dcmst_created_at ON DCMST(created_at);

--==============================================================
-- TABLA: APPRV
--==============================================================
-- Nombre de la Tabla: APPRV
-- DESCRIPCIÓN: Cobranzas pendientes de Aprobación.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE APPRV (
  NUMERO_CARTA_CREDITO VARCHAR(30) FOR COLUMN NUMERO_CAR,
  TIPO_REGISTRO VARCHAR(20) FOR COLUMN TIPO_REGIS,
  FECHA_RECEPCION DATE FOR COLUMN FECHA_RECE,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  MONTO_ORIGINAL DECIMAL(18,2) FOR COLUMN MONTO_ORIG,
  SALDO_PENDIENTE DECIMAL(18,2) FOR COLUMN SALDO_PEND,
  TIPO_DOCUMENTO VARCHAR(20) FOR COLUMN TIPO_DOCUM,
  ESTADO_OPERACION VARCHAR(20) FOR COLUMN ESTADO_OPE,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
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


COMMENT ON TABLE APPRV IS 'Cobranzas pendientes de Aprobación.';
LABEL ON TABLE APPRV IS 'Cobranzas pendientes de Aprobación.';

COMMENT ON COLUMN APPRV(
  NUMERO_CARTA_CREDITO IS 'Número de Carta de Crédito',
  TIPO_REGISTRO IS 'Tipo de Registro',
  FECHA_RECEPCION IS 'Fecha de recepción',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original',
  SALDO_PENDIENTE IS 'Saldo pendiente',
  TIPO_DOCUMENTO IS 'Tipo de Documento',
  ESTADO_OPERACION IS 'Estado de la operación',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN APPRV(
  NUMERO_CARTA_CREDITO IS 'Número de Carta de Crédito'  LABEL ... TEXT IS 'Número de Carta de Crédito',
  TIPO_REGISTRO IS 'Tipo de Registro'  LABEL ... TEXT IS 'Tipo de Registro',
  FECHA_RECEPCION IS 'Fecha de recepción'  LABEL ... TEXT IS 'Fecha de recepción',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original'  LABEL ... TEXT IS 'Monto original',
  SALDO_PENDIENTE IS 'Saldo pendiente'  LABEL ... TEXT IS 'Saldo pendiente',
  TIPO_DOCUMENTO IS 'Tipo de Documento'  LABEL ... TEXT IS 'Tipo de Documento',
  ESTADO_OPERACION IS 'Estado de la operación'  LABEL ... TEXT IS 'Estado de la operación',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_apprv_pk ON APPRV(numero_carta_credito, tipo_registro);
CREATE INDEX idx_apprv_created_at ON APPRV(created_at);

--==============================================================
-- TABLA: LCFEE
--==============================================================
-- Nombre de la Tabla: LCFEE
-- DESCRIPCIÓN: Control de Cobro de Comisiones
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE LCFEE (
  NUMERO_CARTA_CREDITO VARCHAR(30) FOR COLUMN NUMERO_CAR,
  CODIGO_DE_COMISION VARCHAR(20) FOR COLUMN CODIGO_DE_,
  FECHA_RECEPCION DATE FOR COLUMN FECHA_RECE,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  MONTO_ORIGINAL DECIMAL(18,2) FOR COLUMN MONTO_ORIG,
  SALDO_PENDIENTE DECIMAL(18,2) FOR COLUMN SALDO_PEND,
  TIPO_DOCUMENTO VARCHAR(20) FOR COLUMN TIPO_DOCUM,
  ESTADO_OPERACION VARCHAR(20) FOR COLUMN ESTADO_OPE,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
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


COMMENT ON TABLE LCFEE IS 'Control de Cobro de Comisiones';
LABEL ON TABLE LCFEE IS 'Control de Cobro de Comisiones';

COMMENT ON COLUMN LCFEE(
  NUMERO_CARTA_CREDITO IS 'Número de Carta de Crédito',
  CODIGO_DE_COMISION IS 'Código de Comisión',
  FECHA_RECEPCION IS 'Fecha de recepción',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original',
  SALDO_PENDIENTE IS 'Saldo pendiente',
  TIPO_DOCUMENTO IS 'Tipo de Documento',
  ESTADO_OPERACION IS 'Estado de la operación',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN LCFEE(
  NUMERO_CARTA_CREDITO IS 'Número de Carta de Crédito'  LABEL ... TEXT IS 'Número de Carta de Crédito',
  CODIGO_DE_COMISION IS 'Código de Comisión'  LABEL ... TEXT IS 'Código de Comisión',
  FECHA_RECEPCION IS 'Fecha de recepción'  LABEL ... TEXT IS 'Fecha de recepción',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original'  LABEL ... TEXT IS 'Monto original',
  SALDO_PENDIENTE IS 'Saldo pendiente'  LABEL ... TEXT IS 'Saldo pendiente',
  TIPO_DOCUMENTO IS 'Tipo de Documento'  LABEL ... TEXT IS 'Tipo de Documento',
  ESTADO_OPERACION IS 'Estado de la operación'  LABEL ... TEXT IS 'Estado de la operación',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_lcfee_pk ON LCFEE(numero_carta_credito, codigo_de_comision);
CREATE INDEX idx_lcfee_created_at ON LCFEE(created_at);

--==============================================================
-- TABLA: CNTRLRCO
--==============================================================
-- Nombre de la Tabla: CNTRLRCO
-- DESCRIPCIÓN: Cargos y tarifas de cobranzas.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CNTRLRCO (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  TIPO_PRODUCTO VARCHAR(20) FOR COLUMN TIPO_PRODU,
  NUMERO_TABLA VARCHAR(30) FOR COLUMN NUMERO_TAB,
  FECHA_RECEPCION DATE FOR COLUMN FECHA_RECE,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  MONTO_ORIGINAL DECIMAL(18,2) FOR COLUMN MONTO_ORIG,
  SALDO_PENDIENTE DECIMAL(18,2) FOR COLUMN SALDO_PEND,
  TIPO_DOCUMENTO VARCHAR(20) FOR COLUMN TIPO_DOCUM,
  ESTADO_OPERACION VARCHAR(20) FOR COLUMN ESTADO_OPE,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
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


COMMENT ON TABLE CNTRLRCO IS 'Cargos y tarifas de cobranzas.';
LABEL ON TABLE CNTRLRCO IS 'Cargos y tarifas de cobranzas.';

COMMENT ON COLUMN CNTRLRCO(
  CODIGO_BANCO IS 'Código de Banco',
  TIPO_PRODUCTO IS 'Tipo de Producto',
  NUMERO_TABLA IS 'Número de Tabla',
  FECHA_RECEPCION IS 'Fecha de recepción',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original',
  SALDO_PENDIENTE IS 'Saldo pendiente',
  TIPO_DOCUMENTO IS 'Tipo de Documento',
  ESTADO_OPERACION IS 'Estado de la operación',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN CNTRLRCO(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  TIPO_PRODUCTO IS 'Tipo de Producto'  LABEL ... TEXT IS 'Tipo de Producto',
  NUMERO_TABLA IS 'Número de Tabla'  LABEL ... TEXT IS 'Número de Tabla',
  FECHA_RECEPCION IS 'Fecha de recepción'  LABEL ... TEXT IS 'Fecha de recepción',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  MONTO_ORIGINAL IS 'Monto original'  LABEL ... TEXT IS 'Monto original',
  SALDO_PENDIENTE IS 'Saldo pendiente'  LABEL ... TEXT IS 'Saldo pendiente',
  TIPO_DOCUMENTO IS 'Tipo de Documento'  LABEL ... TEXT IS 'Tipo de Documento',
  ESTADO_OPERACION IS 'Estado de la operación'  LABEL ... TEXT IS 'Estado de la operación',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_cntrlrco_pk ON CNTRLRCO(codigo_banco, tipo_producto);
CREATE INDEX idx_cntrlrco_created_at ON CNTRLRCO(created_at);

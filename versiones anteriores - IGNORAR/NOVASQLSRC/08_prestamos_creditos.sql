--==============================================================
-- TABLA: DEALS
--==============================================================
-- Nombre de la Tabla: DEALS
-- DESCRIPCIÓN: Préstamos, certificados, giros y valores.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE DEALS (
  ID BIGINT FOR COLUMN ID GENERATED ALWAYS AS IDENTITY,
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


COMMENT ON TABLE DEALS IS 'Préstamos, certificados, giros y valores.';
LABEL ON TABLE DEALS IS 'Préstamos, certificados, giros y valores.';

COMMENT ON COLUMN DEALS(
  ID IS 'Identificador técnico',
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

LABEL ON COLUMN DEALS(
  ID IS 'Identificador técnico'  LABEL ... TEXT IS 'Identificador técnico',
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

CREATE INDEX idx_deals_pk ON DEALS(id);
CREATE INDEX idx_deals_created_at ON DEALS(created_at);

--==============================================================
-- TABLA: DLPMT
--==============================================================
-- Nombre de la Tabla: DLPMT
-- DESCRIPCIÓN: Plan de Pagos
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE DLPMT (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_SUCURSAL VARCHAR(20) FOR COLUMN CODIGO_SUC,
  CODIGO_MONEDA VARCHAR(20) FOR COLUMN CODIGO_MON,
  NUMERO_PRESTAMO VARCHAR(30) FOR COLUMN NUMERO_PRE,
  FECHA DATE FOR COLUMN FECHA,
  TIPO_REGISTRO VARCHAR(20) FOR COLUMN TIPO_REGIS,
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


COMMENT ON TABLE DLPMT IS 'Plan de Pagos';
LABEL ON TABLE DLPMT IS 'Plan de Pagos';

COMMENT ON COLUMN DLPMT(
  CODIGO_BANCO IS 'Código de Banco',
  CODIGO_SUCURSAL IS 'Código de Sucursal',
  CODIGO_MONEDA IS 'Código de Moneda',
  NUMERO_PRESTAMO IS 'Número de Préstamo',
  FECHA IS 'Fecha',
  TIPO_REGISTRO IS 'Tipo de Registro',
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

LABEL ON COLUMN DLPMT(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  CODIGO_SUCURSAL IS 'Código de Sucursal'  LABEL ... TEXT IS 'Código de Sucursal',
  CODIGO_MONEDA IS 'Código de Moneda'  LABEL ... TEXT IS 'Código de Moneda',
  NUMERO_PRESTAMO IS 'Número de Préstamo'  LABEL ... TEXT IS 'Número de Préstamo',
  FECHA IS 'Fecha'  LABEL ... TEXT IS 'Fecha',
  TIPO_REGISTRO IS 'Tipo de Registro'  LABEL ... TEXT IS 'Tipo de Registro',
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

CREATE INDEX idx_dlpmt_pk ON DLPMT(codigo_banco, codigo_sucursal);
CREATE INDEX idx_dlpmt_fecha ON DLPMT(fecha);

--==============================================================
-- TABLA: DLDRF
--==============================================================
-- Nombre de la Tabla: DLDRF
-- DESCRIPCIÓN: Detalle de Giros y Valores al Cobro.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE DLDRF (
  CODIGO_BANCO VARCHAR(20) FOR COLUMN CODIGO_BAN,
  CODIGO_SUCURSAL VARCHAR(20) FOR COLUMN CODIGO_SUC,
  CODIGO_MONEDA VARCHAR(20) FOR COLUMN CODIGO_MON,
  NUMERO_PRESTAMO VARCHAR(30) FOR COLUMN NUMERO_PRE,
  IDENTIFICACION VARCHAR(50) FOR COLUMN IDENTIFICA,
  NUMERO_DOCUMENTO VARCHAR(30) FOR COLUMN NUMERO_DOC,
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


COMMENT ON TABLE DLDRF IS 'Detalle de Giros y Valores al Cobro.';
LABEL ON TABLE DLDRF IS 'Detalle de Giros y Valores al Cobro.';

COMMENT ON COLUMN DLDRF(
  CODIGO_BANCO IS 'Código de Banco',
  CODIGO_SUCURSAL IS 'Código de Sucursal',
  CODIGO_MONEDA IS 'Código de Moneda',
  NUMERO_PRESTAMO IS 'Número de Préstamo',
  IDENTIFICACION IS 'Identificación',
  NUMERO_DOCUMENTO IS 'Número de Documento',
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

LABEL ON COLUMN DLDRF(
  CODIGO_BANCO IS 'Código de Banco'  LABEL ... TEXT IS 'Código de Banco',
  CODIGO_SUCURSAL IS 'Código de Sucursal'  LABEL ... TEXT IS 'Código de Sucursal',
  CODIGO_MONEDA IS 'Código de Moneda'  LABEL ... TEXT IS 'Código de Moneda',
  NUMERO_PRESTAMO IS 'Número de Préstamo'  LABEL ... TEXT IS 'Número de Préstamo',
  IDENTIFICACION IS 'Identificación'  LABEL ... TEXT IS 'Identificación',
  NUMERO_DOCUMENTO IS 'Número de Documento'  LABEL ... TEXT IS 'Número de Documento',
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

CREATE INDEX idx_dldrf_pk ON DLDRF(codigo_banco, codigo_sucursal);
CREATE INDEX idx_dldrf_created_at ON DLDRF(created_at);

--==============================================================
-- TABLA: DLSDE
--==============================================================
-- Nombre de la Tabla: DLSDE
-- DESCRIPCIÓN: Detalle de Deducciones del Plan de Pagos
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE DLSDE (
  NUMERO_PRESTAMO VARCHAR(30) FOR COLUMN NUMERO_PRE,
  FECHA DATE FOR COLUMN FECHA,
  TIPO_REGISTRO VARCHAR(20) FOR COLUMN TIPO_REGIS,
  SECUENCIA INT FOR COLUMN SECUENCIA,
  CODIGO_DEDUCCION VARCHAR(20) FOR COLUMN CODIGO_DED,
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


COMMENT ON TABLE DLSDE IS 'Detalle de Deducciones del Plan de Pagos';
LABEL ON TABLE DLSDE IS 'Detalle de Deducciones del Plan de Pagos';

COMMENT ON COLUMN DLSDE(
  NUMERO_PRESTAMO IS 'Número de Préstamo',
  FECHA IS 'Fecha',
  TIPO_REGISTRO IS 'Tipo de Registro',
  SECUENCIA IS 'Secuencia',
  CODIGO_DEDUCCION IS 'Código de Deducción',
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

LABEL ON COLUMN DLSDE(
  NUMERO_PRESTAMO IS 'Número de Préstamo'  LABEL ... TEXT IS 'Número de Préstamo',
  FECHA IS 'Fecha'  LABEL ... TEXT IS 'Fecha',
  TIPO_REGISTRO IS 'Tipo de Registro'  LABEL ... TEXT IS 'Tipo de Registro',
  SECUENCIA IS 'Secuencia'  LABEL ... TEXT IS 'Secuencia',
  CODIGO_DEDUCCION IS 'Código de Deducción'  LABEL ... TEXT IS 'Código de Deducción',
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

CREATE INDEX idx_dlsde_pk ON DLSDE(numero_prestamo, fecha);
CREATE INDEX idx_dlsde_fecha ON DLSDE(fecha);

--==============================================================
-- TABLA: DLCLP
--==============================================================
-- Nombre de la Tabla: DLCLP
-- DESCRIPCIÓN: Calificación y Previsión de Cartera.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE DLCLP (
  ID_CLIENTE VARCHAR(30) FOR COLUMN ID_CLIENTE,
  NUMERO_CUENTA VARCHAR(24) FOR COLUMN NUMERO_CUE,
  REFERENCIA VARCHAR(50) FOR COLUMN REFERENCIA,
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


COMMENT ON TABLE DLCLP IS 'Calificación y Previsión de Cartera.';
LABEL ON TABLE DLCLP IS 'Calificación y Previsión de Cartera.';

COMMENT ON COLUMN DLCLP(
  ID_CLIENTE IS 'ID Cliente',
  NUMERO_CUENTA IS 'Número de Cuenta',
  REFERENCIA IS 'Referencia',
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

LABEL ON COLUMN DLCLP(
  ID_CLIENTE IS 'ID Cliente'  LABEL ... TEXT IS 'ID Cliente',
  NUMERO_CUENTA IS 'Número de Cuenta'  LABEL ... TEXT IS 'Número de Cuenta',
  REFERENCIA IS 'Referencia'  LABEL ... TEXT IS 'Referencia',
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

CREATE INDEX idx_dlclp_pk ON DLCLP(id_cliente, numero_cuenta);
CREATE INDEX idx_dlclp_created_at ON DLCLP(created_at);

--==============================================================
-- TABLA: DDCPN
--==============================================================
-- Nombre de la Tabla: DDCPN
-- DESCRIPCIÓN: Transacciones pendientes de Cobro.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE DDCPN (
  NUMERO_PRESTAMO VARCHAR(30) FOR COLUMN NUMERO_PRE,
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


COMMENT ON TABLE DDCPN IS 'Transacciones pendientes de Cobro.';
LABEL ON TABLE DDCPN IS 'Transacciones pendientes de Cobro.';

COMMENT ON COLUMN DDCPN(
  NUMERO_PRESTAMO IS 'Número de Préstamo',
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

LABEL ON COLUMN DDCPN(
  NUMERO_PRESTAMO IS 'Número de Préstamo'  LABEL ... TEXT IS 'Número de Préstamo',
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

CREATE INDEX idx_ddcpn_pk ON DDCPN(numero_prestamo);
CREATE INDEX idx_ddcpn_created_at ON DDCPN(created_at);

--==============================================================
-- TABLA: DLITP
--==============================================================
-- Nombre de la Tabla: DLITP
-- DESCRIPCIÓN: Maestro de Deducciones de Préstamos.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE DLITP (
  NUMERO_PRESTAMO VARCHAR(30) FOR COLUMN NUMERO_PRE,
  CODIGO_DEDUCCION VARCHAR(20) FOR COLUMN CODIGO_DED,
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


COMMENT ON TABLE DLITP IS 'Maestro de Deducciones de Préstamos.';
LABEL ON TABLE DLITP IS 'Maestro de Deducciones de Préstamos.';

COMMENT ON COLUMN DLITP(
  NUMERO_PRESTAMO IS 'Número de Préstamo',
  CODIGO_DEDUCCION IS 'Código de Deducción',
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

LABEL ON COLUMN DLITP(
  NUMERO_PRESTAMO IS 'Número de Préstamo'  LABEL ... TEXT IS 'Número de Préstamo',
  CODIGO_DEDUCCION IS 'Código de Deducción'  LABEL ... TEXT IS 'Código de Deducción',
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

CREATE INDEX idx_dlitp_pk ON DLITP(numero_prestamo, codigo_deduccion);
CREATE INDEX idx_dlitp_created_at ON DLITP(created_at);

--==============================================================
-- TABLA: LNECR
--==============================================================
-- Nombre de la Tabla: LNECR
-- DESCRIPCIÓN: Maestro de Lineas de Crédito
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE LNECR (
  ID_CLIENTE VARCHAR(30) FOR COLUMN ID_CLIENTE,
  NUMERO_LINEA VARCHAR(30) FOR COLUMN NUMERO_LIN,
  FECHA_APROBACION DATE FOR COLUMN FECHA_APRO,
  FECHA_VENCIMIENTO DATE FOR COLUMN FECHA_VENC,
  MONTO_APROBADO DECIMAL(18,2) FOR COLUMN MONTO_APRO,
  MONTO_UTILIZADO DECIMAL(18,2) FOR COLUMN MONTO_UTIL,
  MONTO_DISPONIBLE DECIMAL(18,2) FOR COLUMN MONTO_DISP,
  ESTADO_LINEA VARCHAR(20) FOR COLUMN ESTADO_LIN,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
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


COMMENT ON TABLE LNECR IS 'Maestro de Lineas de Crédito';
LABEL ON TABLE LNECR IS 'Maestro de Lineas de Crédito';

COMMENT ON COLUMN LNECR(
  ID_CLIENTE IS 'ID Cliente',
  NUMERO_LINEA IS 'Número de Línea',
  FECHA_APROBACION IS 'Fecha de aprobación',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento',
  MONTO_APROBADO IS 'Monto aprobado',
  MONTO_UTILIZADO IS 'Monto utilizado',
  MONTO_DISPONIBLE IS 'Monto disponible',
  ESTADO_LINEA IS 'Estado de la línea',
  USUARIO_CREACION IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'
);

LABEL ON COLUMN LNECR(
  ID_CLIENTE IS 'ID Cliente'  LABEL ... TEXT IS 'ID Cliente',
  NUMERO_LINEA IS 'Número de Línea'  LABEL ... TEXT IS 'Número de Línea',
  FECHA_APROBACION IS 'Fecha de aprobación'  LABEL ... TEXT IS 'Fecha de aprobación',
  FECHA_VENCIMIENTO IS 'Fecha de vencimiento'  LABEL ... TEXT IS 'Fecha de vencimiento',
  MONTO_APROBADO IS 'Monto aprobado'  LABEL ... TEXT IS 'Monto aprobado',
  MONTO_UTILIZADO IS 'Monto utilizado'  LABEL ... TEXT IS 'Monto utilizado',
  MONTO_DISPONIBLE IS 'Monto disponible'  LABEL ... TEXT IS 'Monto disponible',
  ESTADO_LINEA IS 'Estado de la línea'  LABEL ... TEXT IS 'Estado de la línea',
  USUARIO_CREACION IS 'Usuario que creó el registro'  LABEL ... TEXT IS 'Usuario que creó el registro',
  USUARIO_ACTUALIZACION IS 'Usuario que actualizó el registro'  LABEL ... TEXT IS 'Usuario que actualizó el registro',
  VERSION_REGISTRO IS 'Versión del registro'  LABEL ... TEXT IS 'Versión del registro',
  OBSERVACIONES IS 'Observaciones'  LABEL ... TEXT IS 'Observaciones',
  ESTADO_REGISTRO IS 'Estado del registro'  LABEL ... TEXT IS 'Estado del registro',
  CREATED_AT IS 'Fecha de creación del registro'  LABEL ... TEXT IS 'Fecha de creación del registro',
  UPDATED_AT IS 'Fecha de última actualización'  LABEL ... TEXT IS 'Fecha de última actualización'
);

CREATE INDEX idx_lnecr_pk ON LNECR(id_cliente, numero_linea);
CREATE INDEX idx_lnecr_created_at ON LNECR(created_at);

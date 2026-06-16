--==============================================================
-- TABLA: CUMAD
--==============================================================
-- Nombre de la Tabla: CUMAD
-- DESCRIPCIÓN: Direcciones de correo y beneficiarios.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CUMAD (
  ID_CLIENTE_OPERACION VARCHAR(30) FOR COLUMN ID_CLIENTE,
  TIPO_REGISTRO VARCHAR(20) FOR COLUMN TIPO_REGIS,
  SECUENCIA INT FOR COLUMN SECUENCIA,
  TIPO_PERSONA VARCHAR(20) FOR COLUMN TIPO_PERSO,
  TIPO_IDENTIFICACION VARCHAR(20) FOR COLUMN TIPO_IDENT,
  NUMERO_IDENTIFICACION VARCHAR(30) FOR COLUMN NUMERO_IDE,
  NOMBRES VARCHAR(80) FOR COLUMN NOMBRES,
  APELLIDOS VARCHAR(80) FOR COLUMN APELLIDOS,
  RAZON_SOCIAL VARCHAR(80) FOR COLUMN RAZON_SOCI,
  FECHA_NACIMIENTO DATE FOR COLUMN FECHA_NACI,
  DIRECCION VARCHAR(120) FOR COLUMN DIRECCION,
  EMAIL VARCHAR(80) FOR COLUMN EMAIL,
  TELEFONO VARCHAR(80) FOR COLUMN TELEFONO,
  PAIS_RESIDENCIA VARCHAR(50) FOR COLUMN PAIS_RESID,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
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


COMMENT ON TABLE CUMAD IS 'Direcciones de correo y beneficiarios.';
LABEL ON TABLE CUMAD IS 'Direcciones de correo y beneficiarios.';

COMMENT ON COLUMN CUMAD(
  ID_CLIENTE_OPERACION IS 'Número de cliente u operación',
  TIPO_REGISTRO IS 'Tipo de registro',
  SECUENCIA IS 'Secuencia',
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

LABEL ON COLUMN CUMAD(
  ID_CLIENTE_OPERACION IS 'Número de cliente u operación'  LABEL ... TEXT IS 'Número de cliente u operación',
  TIPO_REGISTRO IS 'Tipo de registro'  LABEL ... TEXT IS 'Tipo de registro',
  SECUENCIA IS 'Secuencia'  LABEL ... TEXT IS 'Secuencia',
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

CREATE INDEX idx_cumad_pk ON CUMAD(id_cliente_operacion, tipo_registro, secuencia);
CREATE INDEX idx_cumad_created_at ON CUMAD(created_at);

--==============================================================
-- TABLA: CUMPR
--==============================================================
-- Nombre de la Tabla: CUMPR
-- DESCRIPCIÓN: Palabras clave omitidas en búsquedas de clientes.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CUMPR (
  PALABRA VARCHAR(50) FOR COLUMN PALABRA,
  TIPO_PERSONA VARCHAR(20) FOR COLUMN TIPO_PERSO,
  TIPO_IDENTIFICACION VARCHAR(20) FOR COLUMN TIPO_IDENT,
  NUMERO_IDENTIFICACION VARCHAR(30) FOR COLUMN NUMERO_IDE,
  NOMBRES VARCHAR(80) FOR COLUMN NOMBRES,
  APELLIDOS VARCHAR(80) FOR COLUMN APELLIDOS,
  RAZON_SOCIAL VARCHAR(80) FOR COLUMN RAZON_SOCI,
  FECHA_NACIMIENTO DATE FOR COLUMN FECHA_NACI,
  DIRECCION VARCHAR(120) FOR COLUMN DIRECCION,
  EMAIL VARCHAR(80) FOR COLUMN EMAIL,
  TELEFONO VARCHAR(80) FOR COLUMN TELEFONO,
  PAIS_RESIDENCIA VARCHAR(50) FOR COLUMN PAIS_RESID,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
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


COMMENT ON TABLE CUMPR IS 'Palabras clave omitidas en búsquedas de clientes.';
LABEL ON TABLE CUMPR IS 'Palabras clave omitidas en búsquedas de clientes.';

COMMENT ON COLUMN CUMPR(
  PALABRA IS 'Palabra reservada',
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

LABEL ON COLUMN CUMPR(
  PALABRA IS 'Palabra reservada'  LABEL ... TEXT IS 'Palabra reservada',
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

CREATE INDEX idx_cumpr_pk ON CUMPR(palabra);
CREATE INDEX idx_cumpr_created_at ON CUMPR(created_at);

--==============================================================
-- TABLA: CUMSD
--==============================================================
-- Nombre de la Tabla: CUMSD
-- DESCRIPCIÓN: Clientes para búsqueda por cadena de caracteres.
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE CUMSD (
  ID_CLIENTE VARCHAR(30) FOR COLUMN ID_CLIENTE,
  TIPO_PERSONA VARCHAR(20) FOR COLUMN TIPO_PERSO,
  TIPO_IDENTIFICACION VARCHAR(20) FOR COLUMN TIPO_IDENT,
  NUMERO_IDENTIFICACION VARCHAR(30) FOR COLUMN NUMERO_IDE,
  NOMBRES VARCHAR(80) FOR COLUMN NOMBRES,
  APELLIDOS VARCHAR(80) FOR COLUMN APELLIDOS,
  RAZON_SOCIAL VARCHAR(80) FOR COLUMN RAZON_SOCI,
  FECHA_NACIMIENTO DATE FOR COLUMN FECHA_NACI,
  DIRECCION VARCHAR(120) FOR COLUMN DIRECCION,
  EMAIL VARCHAR(80) FOR COLUMN EMAIL,
  TELEFONO VARCHAR(80) FOR COLUMN TELEFONO,
  PAIS_RESIDENCIA VARCHAR(50) FOR COLUMN PAIS_RESID,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
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


COMMENT ON TABLE CUMSD IS 'Clientes para búsqueda por cadena de caracteres.';
LABEL ON TABLE CUMSD IS 'Clientes para búsqueda por cadena de caracteres.';

COMMENT ON COLUMN CUMSD(
  ID_CLIENTE IS 'Identificador del cliente',
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

LABEL ON COLUMN CUMSD(
  ID_CLIENTE IS 'Identificador del cliente'  LABEL ... TEXT IS 'Identificador del cliente',
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

CREATE INDEX idx_cumsd_pk ON CUMSD(id_cliente);
CREATE INDEX idx_cumsd_created_at ON CUMSD(created_at);

--==============================================================
-- TABLA: SPINS
--==============================================================
-- Nombre de la Tabla: SPINS
-- DESCRIPCIÓN: Archivo de Instrucciones especiales (Usos).
-- Objetivo: Objetivo del uso de la tabla en el negocio
-- Tipo de Tabla: Maestro
-- Origen de los Datos: DDS→SQL Migration
-- Permanencia de los Datos: Permanente
-- Uso de los datos: Lectura-Escritura
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE SPINS (
  TIPO_INFORMACION VARCHAR(50) FOR COLUMN TIPO_INFOR,
  CUENTA_O_CLIENTE VARCHAR(50) FOR COLUMN CUENTA_O_C,
  SECUENCIA INT FOR COLUMN SECUENCIA,
  TIPO_PERSONA VARCHAR(20) FOR COLUMN TIPO_PERSO,
  TIPO_IDENTIFICACION VARCHAR(20) FOR COLUMN TIPO_IDENT,
  NUMERO_IDENTIFICACION VARCHAR(30) FOR COLUMN NUMERO_IDE,
  NOMBRES VARCHAR(80) FOR COLUMN NOMBRES,
  APELLIDOS VARCHAR(80) FOR COLUMN APELLIDOS,
  RAZON_SOCIAL VARCHAR(80) FOR COLUMN RAZON_SOCI,
  FECHA_NACIMIENTO DATE FOR COLUMN FECHA_NACI,
  DIRECCION VARCHAR(120) FOR COLUMN DIRECCION,
  EMAIL VARCHAR(80) FOR COLUMN EMAIL,
  TELEFONO VARCHAR(80) FOR COLUMN TELEFONO,
  PAIS_RESIDENCIA VARCHAR(50) FOR COLUMN PAIS_RESID,
  USUARIO_CREACION VARCHAR(30) FOR COLUMN USUARIO_CR,
  USUARIO_ACTUALIZACION VARCHAR(30) FOR COLUMN USUARIO_AC,
  VERSION_REGISTRO INT FOR COLUMN VERSION_RE,
  OBSERVACIONES VARCHAR(120) FOR COLUMN OBSERVACIO,
  ESTADO_REGISTRO CHAR(1) FOR COLUMN ESTADO_REG,
  CREATED_AT TIMESTAMP FOR COLUMN CREATED_AT DEFAULT CURRENT TIMESTAMP,
  UPDATED_AT TIMESTAMP FOR COLUMN UPDATED_AT,
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


COMMENT ON TABLE SPINS IS 'Archivo de Instrucciones especiales (Usos).';
LABEL ON TABLE SPINS IS 'Archivo de Instrucciones especiales (Usos).';

COMMENT ON COLUMN SPINS(
  TIPO_INFORMACION IS 'Tipo de información',
  CUENTA_O_CLIENTE IS 'Cuenta o cliente',
  SECUENCIA IS 'Secuencia',
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

LABEL ON COLUMN SPINS(
  TIPO_INFORMACION IS 'Tipo de información'  LABEL ... TEXT IS 'Tipo de información',
  CUENTA_O_CLIENTE IS 'Cuenta o cliente'  LABEL ... TEXT IS 'Cuenta o cliente',
  SECUENCIA IS 'Secuencia'  LABEL ... TEXT IS 'Secuencia',
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

CREATE INDEX idx_spins_pk ON SPINS(tipo_informacion, cuenta_o_cliente, secuencia);
CREATE INDEX idx_spins_created_at ON SPINS(created_at);

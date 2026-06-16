--==============================================================================
-- Nombre de la Tabla   : GLBLNVW
-- DESCRIPCIÓN          : Vista de cuenta mayor enriquecida. Combina GLBLN
--                        (balance por banco/sucursal/moneda/cuenta) con GLMST
--                        (centro de costo de la cuenta contable) y CCDSC
--                        (descripción del centro de costo).
-- Objetivo             : Encapsular el join GLBLN-GLMST-CCDSC para que el
--                        módulo de acceso a datos (GLDTAACC) consulte una
--                        única fuente con toda la información necesaria para
--                        la consulta de cuenta mayor (RF-01) y el cálculo de
--                        balance (RF-02), aplicando el principio DIP (la capa
--                        de negocio no conoce el detalle del join).
-- Tipo de Tabla        : Vista (consulta enriquecida)
-- Origen de los Datos  : Derivado de GLBLN, GLMST y CCDSC (sin almacenamiento
--                        propio).
-- Permanencia de Datos : No aplica (vista; refleja en tiempo real el contenido
--                        de las tablas base).
-- Uso de los datos     : Lectura exclusiva por GLDTAACC para la consulta de
--                        cuentas mayores del proceso de conciliación
--                        GLCNC001 (RF-01/RF-02).
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-13
-- Proyecto             : Taller IBM i - Conciliación GLBLN (IROJAS941 / PUB400)
--==============================================================================

CREATE OR REPLACE VIEW IROJAS941.GLBLNVW (
  CODIGO_BANCO,
  CODIGO_SUCURSAL,
  CODIGO_MONEDA,
  CUENTA_CONTABLE,
  DESCRIPCION_CUENTA,
  NATURALEZA_CUENTA,
  NIVEL_CUENTA,
  CENTRO_COSTO,
  DESCRIPCION_CENTRO_COSTO,
  SALDO_ACTUAL,
  FECHA_PROCESO_SISTEMA,
  ESTADO_REGISTRO
) AS
SELECT
  B.CODIGO_BANCO,
  B.CODIGO_SUCURSAL,
  B.CODIGO_MONEDA,
  B.CUENTA_CONTABLE,
  B.DESCRIPCION_CUENTA,
  B.NATURALEZA_CUENTA,
  B.NIVEL_CUENTA,
  M.CENTRO_COSTO,
  C.DESCRIPCION_CENTRO_COSTO,
  B.SALDO_ACTUAL,
  B.FECHA_PROCESO_SISTEMA,
  B.ESTADO_REGISTRO
FROM IROJAS941.GLBLN B
INNER JOIN IROJAS941.GLMST M
  ON M.CODIGO_BANCO = B.CODIGO_BANCO
 AND M.CODIGO_MONEDA = B.CODIGO_MONEDA
 AND M.CUENTA_CONTABLE = B.CUENTA_CONTABLE
LEFT JOIN IROJAS941.CCDSC C
  ON C.CODIGO_CENTRO_COSTO = M.CENTRO_COSTO;

--------------------------------------------------------------------------------
-- Metadata de la vista
--------------------------------------------------------------------------------
LABEL ON TABLE IROJAS941.GLBLNVW IS 'Vista de Cuenta Mayor Enriquecida';

COMMENT ON TABLE IROJAS941.GLBLNVW IS 'Vista que combina GLBLN (balance de la cuenta mayor) con GLMST (centro de costo) y CCDSC (descripción del centro de costo), entregando una fila por cuenta mayor con toda la información requerida por la consulta de cuenta mayor (RF-01) y el cálculo de balance (RF-02) del proceso de conciliación GLCNC001.';

--------------------------------------------------------------------------------
-- Labels cortos (encabezados de columna)
--------------------------------------------------------------------------------
LABEL ON COLUMN IROJAS941.GLBLNVW (CODIGO_BANCO IS 'Codigo Banco');
LABEL ON COLUMN IROJAS941.GLBLNVW (CODIGO_SUCURSAL IS 'Codigo Sucursal');
LABEL ON COLUMN IROJAS941.GLBLNVW (CODIGO_MONEDA IS 'Codigo Moneda');
LABEL ON COLUMN IROJAS941.GLBLNVW (CUENTA_CONTABLE IS 'Cuenta Contable');
LABEL ON COLUMN IROJAS941.GLBLNVW (DESCRIPCION_CUENTA IS 'Desc Cuenta');
LABEL ON COLUMN IROJAS941.GLBLNVW (NATURALEZA_CUENTA IS 'Naturaleza Cuenta');
LABEL ON COLUMN IROJAS941.GLBLNVW (NIVEL_CUENTA IS 'Nivel Cuenta');
LABEL ON COLUMN IROJAS941.GLBLNVW (CENTRO_COSTO IS 'Centro Costo');
LABEL ON COLUMN IROJAS941.GLBLNVW (DESCRIPCION_CENTRO_COSTO IS 'Desc Centro Costo');
LABEL ON COLUMN IROJAS941.GLBLNVW (SALDO_ACTUAL IS 'Saldo Actual');
LABEL ON COLUMN IROJAS941.GLBLNVW (FECHA_PROCESO_SISTEMA IS 'Fecha Proceso');
LABEL ON COLUMN IROJAS941.GLBLNVW (ESTADO_REGISTRO IS 'Estado Registro');

--------------------------------------------------------------------------------
-- Comentarios técnicos por columna
--------------------------------------------------------------------------------
COMMENT ON COLUMN IROJAS941.GLBLNVW.CODIGO_BANCO IS 'Código del banco de la cuenta mayor (GLBLN.CODIGO_BANCO)';
COMMENT ON COLUMN IROJAS941.GLBLNVW.CODIGO_SUCURSAL IS 'Código de sucursal del balance (GLBLN.CODIGO_SUCURSAL)';
COMMENT ON COLUMN IROJAS941.GLBLNVW.CODIGO_MONEDA IS 'Código de moneda del saldo (GLBLN.CODIGO_MONEDA)';
COMMENT ON COLUMN IROJAS941.GLBLNVW.CUENTA_CONTABLE IS 'Cuenta contable del plan de cuentas (GLBLN.CUENTA_CONTABLE / GLMST.CUENTA_CONTABLE)';
COMMENT ON COLUMN IROJAS941.GLBLNVW.DESCRIPCION_CUENTA IS 'Descripción de la cuenta mayor (GLBLN.DESCRIPCION_CUENTA)';
COMMENT ON COLUMN IROJAS941.GLBLNVW.NATURALEZA_CUENTA IS 'Naturaleza contable de la cuenta mayor (GLBLN.NATURALEZA_CUENTA), usada en GLBALCAL';
COMMENT ON COLUMN IROJAS941.GLBLNVW.NIVEL_CUENTA IS 'Nivel jerárquico de la cuenta mayor (GLBLN.NIVEL_CUENTA)';
COMMENT ON COLUMN IROJAS941.GLBLNVW.CENTRO_COSTO IS 'Centro de costo de la cuenta contable (GLMST.CENTRO_COSTO), utilizado para poblar cuentas[].cuentaMayor.centroCosto en el JSON de salida';
COMMENT ON COLUMN IROJAS941.GLBLNVW.DESCRIPCION_CENTRO_COSTO IS 'Descripción del centro de costo (CCDSC.DESCRIPCION_CENTRO_COSTO)';
COMMENT ON COLUMN IROJAS941.GLBLNVW.SALDO_ACTUAL IS 'Saldo fuente de la cuenta mayor (GLBLN.SALDO_ACTUAL), comparado contra el saldo final calculado durante la conciliación';
COMMENT ON COLUMN IROJAS941.GLBLNVW.FECHA_PROCESO_SISTEMA IS 'Fecha y hora del último proceso batch que actualizó el saldo (GLBLN.FECHA_PROCESO_SISTEMA)';
COMMENT ON COLUMN IROJAS941.GLBLNVW.ESTADO_REGISTRO IS 'Estado lógico del registro de balance (GLBLN.ESTADO_REGISTRO)';

-- Fase 2: Prototipos de consultas SQL para generar JSON (DB2 for i)
-- NOTA: Ajuste nombres de columnas/columnas/ESQUEMA según su DDL real.
-- Objetivo: 1) JSON por cuenta  2) JSON por lote/archivo  3) CTEs para cálculos

-- Parámetros de ejemplo (usar en su herramienta, p.ej. STRSQL o RUNSQLSTM)
-- :p_bank, :p_fecha_proceso, :p_lote

-- 1) JSON por cuenta (fragmento por cada cuenta)
WITH tx AS (
  -- Reemplace nombres de tabla/columnas según su esquema
  SELECT
    t.codigo_banco,
    t.codigo_sucursal,
    t.codigo_moneda,
    t.cuenta_contable,
    SUM(CASE WHEN t.debito_credito = 'D' THEN t.monto ELSE 0 END) AS total_debitos,
    SUM(CASE WHEN t.debito_credito = 'C' THEN t.monto ELSE 0 END) AS total_creditos,
    SUM(CASE WHEN t.debito_credito = 'D' THEN t.monto ELSE -t.monto END) AS diferencia_neta
  FROM TRANS t
  WHERE t.fecha_operacion = :p_fecha_proceso
  GROUP BY t.codigo_banco, t.codigo_sucursal, t.codigo_moneda, t.cuenta_contable
)

SELECT
  JSON_OBJECT(
    KEY 'metadata' VALUE JSON_OBJECT(
      KEY 'generatedAt' VALUE CURRENT_TIMESTAMP,
      KEY 'schema' VALUE 'contabilidad.v1'
    ),
    KEY 'ejecucion' VALUE JSON_OBJECT(
      KEY 'fechaProceso' VALUE :p_fecha_proceso,
      KEY 'banco' VALUE :p_bank
    ),
    KEY 'cuentas' VALUE JSON_ARRAYAGG(
      JSON_OBJECT(
        KEY 'banco' VALUE tx.codigo_banco,
        KEY 'sucursal' VALUE tx.codigo_sucursal,
        KEY 'moneda' VALUE tx.codigo_moneda,
        KEY 'cuentaContable' VALUE tx.cuenta_contable,
        KEY 'totalDebitos' VALUE tx.total_debitos,
        KEY 'totalCreditos' VALUE tx.total_creditos,
        KEY 'diferenciaNeta' VALUE tx.diferencia_neta
      )
    )
  ) FORMAT JSON
FROM tx;

-- 2) JSON por lote con detalle y controlTotales
WITH cuentas AS (
  SELECT
    g.codigo_banco,
    g.codigo_sucursal,
    g.codigo_moneda,
    g.cuenta_contable,
    -- En el DDL actual `GLBLN` expone `saldo_actual`.
    0.00 AS saldo_debitos,
    0.00 AS saldo_creditos,
    COALESCE(g.saldo_actual,0) AS saldo_neto
  FROM GLBLN g
  WHERE g.codigo_banco = :p_bank
),
control AS (
  SELECT
    SUM(saldo_debitos) AS sum_debitos,
    SUM(saldo_creditos) AS sum_creditos,
    SUM(saldo_neto) AS sum_diferencia_neta
  FROM cuentas
)

SELECT JSON_OBJECT(
  KEY 'metadata' VALUE JSON_OBJECT(KEY 'generatedAt' VALUE CURRENT_TIMESTAMP),
  KEY 'ejecucion' VALUE JSON_OBJECT(KEY 'lote' VALUE :p_lote, KEY 'banco' VALUE :p_bank),
  KEY 'cuentas' VALUE (
    SELECT JSON_ARRAYAGG(JSON_OBJECT(
      KEY 'cuentaContable' VALUE c.cuenta_contable,
      KEY 'saldoDebitos' VALUE c.saldo_debitos,
      KEY 'saldoCreditos' VALUE c.saldo_creditos,
      KEY 'saldoNeto' VALUE c.saldo_neto
    )) FROM cuentas c
  ) FORMAT JSON,
  KEY 'controlTotales' VALUE (
    SELECT JSON_OBJECT(
      KEY 'sumatoriaDebitos' VALUE ctrl.sum_debitos,
      KEY 'sumatoriaCreditos' VALUE ctrl.sum_creditos,
      KEY 'sumatoriaDiferenciaNeta' VALUE ctrl.sum_diferencia_neta
    ) FROM control ctrl
  ) FORMAT JSON
) FORMAT JSON
FROM SYSIBM.SYSDUMMY1;

-- 3) Ejemplo de CTEs para calcular saldos cruzando GLMST + TRANS
WITH movimientos AS (
  SELECT
    t.codigo_banco,
    t.cuenta_contable,
    SUM(CASE WHEN t.debito_credito = 'D' THEN t.monto ELSE 0 END) AS debitos,
    SUM(CASE WHEN t.debito_credito = 'C' THEN t.monto ELSE 0 END) AS creditos
  FROM TRANS t
  WHERE t.fecha_operacion BETWEEN :p_fecha_inicio AND :p_fecha_fin
  GROUP BY t.codigo_banco, t.cuenta_contable
),
cuentas AS (
  SELECT
    m.codigo_banco,
    m.cuenta_contable,
    m.debitos,
    m.creditos,
    (m.debitos - m.creditos) AS diferencia,
    gm.descripcion_cuenta AS nombre_cuenta -- columna real en GLMST
  FROM movimientos m
  LEFT JOIN GLMST gm ON gm.codigo_banco = m.codigo_banco AND gm.cuenta_contable = m.cuenta_contable
)
SELECT JSON_OBJECT(KEY 'accounts' VALUE JSON_ARRAYAGG(JSON_OBJECT(
  KEY 'cuenta' VALUE c.cuenta_contable,
  KEY 'nombre' VALUE c.nombre_cuenta,
  KEY 'debitos' VALUE c.debitos,
  KEY 'creditos' VALUE c.creditos,
  KEY 'diferencia' VALUE c.diferencia
))) FORMAT JSON
FROM cuentas c;

-- NOTAS:
-- - Reemplace `TRANS`, `GLBLN`, `GLMST` y nombres de columnas por los reales del sistema.
-- - Use `FORMAT JSON` en subqueries que ya devuelven JSON para evitar comillas dobles escapadas.
-- - Para salidas muy grandes, genere JSON por fragmentos (cabecera, bloques, pie) y use APIs IFS para escribir en UTF-8.
-- - Añada índices sobre columnas usadas en WHERE/GROUP BY (fecha_proceso, codigo_banco, cuenta_contable) para performance.

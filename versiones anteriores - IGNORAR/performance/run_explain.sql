-- run_explain.sql
-- Ejecutar EXPLAIN PLAN FOR las consultas críticas para capturar planes de acceso.
-- Reemplace {SCHEMA} por su esquema o ejecute `SET CURRENT SCHEMA = 'DETRI1';` antes.

-- Ejemplo: EXPLAIN del fragmento 'JSON por cuenta' (usar fecha y banco de ejemplo)
EXPLAIN PLAN FOR
WITH tx AS (
  SELECT
    t.codigo_banco,
    t.codigo_sucursal,
    t.codigo_moneda,
    t.cuenta_contable,
    SUM(CASE WHEN t.debito_credito = 'D' THEN t.monto ELSE 0 END) AS total_debitos,
    SUM(CASE WHEN t.debito_credito = 'C' THEN t.monto ELSE 0 END) AS total_creditos,
    SUM(CASE WHEN t.debito_credito = 'D' THEN t.monto ELSE -t.monto END) AS diferencia_neta
  FROM {SCHEMA}.TRANS t
  WHERE t.fecha_operacion = DATE('2026-06-11')
  GROUP BY t.codigo_banco, t.codigo_sucursal, t.codigo_moneda, t.cuenta_contable
)
SELECT * FROM tx;

-- Ejemplo: EXPLAIN del cruce GLBLN (resumen por banco)
EXPLAIN PLAN FOR
SELECT
  g.codigo_banco,
  g.codigo_sucursal,
  g.codigo_moneda,
  g.cuenta_contable,
  COALESCE(g.saldo_actual,0) AS saldo_neto
FROM {SCHEMA}.GLBLN g
WHERE g.codigo_banco = 'B001';

-- NOTA:
-- 1) Tras ejecutar `EXPLAIN PLAN FOR`, los detalles del plan se almacenan en las tablas de EXPLAIN del servidor DB2 for i.
-- 2) Use Visual Explain (Data Studio/ACS) para visualizar de forma gráfica, o consulte las tablas de EXPLAIN en QSYS2 según su versión.
-- 3) Ajuste las consultas aquí (fechas, filtros) para capturar planes representativos de su carga real.

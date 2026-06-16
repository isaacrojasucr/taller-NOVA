Fase 2 - Prototipos SQL para generación de JSON

Resumen
- Contiene plantillas SQL para generar JSON usando `JSON_OBJECT`, `JSON_ARRAYAGG` y CTEs.
- Archivo principal: `phase2_sql_queries.sql`.

Cómo usar
1. Abrir en STRSQL o usar `RUNSQLSTM` en IBM i.
2. Ajustar nombres de tablas y columnas según su DDL (`GLBLN`, `GLMST`, `TRANS`).
3. Definir parámetros: `:p_bank`, `:p_fecha_proceso`, `:p_lote`, `:p_fecha_inicio`, `:p_fecha_fin`.
4. Ejecutar las consultas y validar la salida JSON.

Notas de rendimiento
- Añadir índices en `fecha_proceso`, `codigo_banco` y `cuenta_contable` si las consultas son lentas.
- Para JSON muy grandes, generar por bloques y escribir en IFS con CCSID 1208 / UTF-8.

Ejemplos de salida (pequeños)
- `examples/sample_account.json` — ejemplo de JSON por cuenta.
- `examples/sample_batch.json` — ejemplo de JSON por lote con `controlTotales`.

Notas de performance detalladas
- Ver `performance_notes.md` para recomendaciones y checklist de pruebas.

Siguientes pasos sugeridos
- Validar nombres exactos de columnas desde `TALLERSQLSRC/db2fori_core_bancario_ddl.sql`.
- Probar las consultas con un subconjunto de datos y ajustar tipos/formatos.
- Integrar consultas en `DATA_ACCESS` RPGLE como `SELECT INTO CLOB` o usar `EXEC SQL` para leer fila a fila.
 - Integrar consultas en `DATA_ACCESS` RPGLE como `SELECT INTO CLOB` o usar `EXEC SQL` para leer fila a fila.

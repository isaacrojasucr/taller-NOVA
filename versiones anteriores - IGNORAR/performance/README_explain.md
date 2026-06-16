README - EXPLAIN & RUNSTATS

Propósito
- Scripts para preparar estadísticas (`run_runstats.sql`) y capturar planes de acceso (`run_explain.sql`) para las consultas críticas de Fase 2.

Pasos recomendados
1. Editar los scripts y reemplazar `{SCHEMA}` por su esquema (p.ej. `DETRI1`).
2. Ejecutar `run_runstats.sql` en una ventana STRSQL o mediante `RUNSQLSTM` para refrescar estadísticas.

   Ejemplo (STRSQL):
   CALL SYSPROC.ADMIN_CMD('RUNSTATS ON TABLE DETRI1.TRANS WITH DISTRIBUTION AND DETAILED INDEXES ALL');

3. Ejecutar `run_explain.sql` para cada consulta que quiera analizar. `EXPLAIN PLAN FOR` generará información de plan que puede visualizarse con Visual Explain.

Ver resultados
- Visual Explain (IBM Data Studio / ACS) es la forma recomendada de ver los planes gráficamente.
- También puede inspeccionar las tablas de EXPLAIN en la librería `QSYS2` (o las tablas locales de EXPLAIN) según la versión de su servidor. Consulte la documentación de DB2 for i si necesita el nombre exacto de las vistas disponibles.

Sugerencias
- Corra `RUNSTATS` fuera de horarios punta en producción.
- Para pruebas reproducibles: capture la consulta exacta (con parámetros fijos) y el resultado del `EXPLAIN` y guárdelos junto con las estadísticas (`RUNSTATS`).
- Si detecta scans completos, revise índices y filtros; pruebe agregar índices compuestos en (`cuenta_contable`, `fecha_operacion`) o en la columna `codigo_banco` según sea necesario.

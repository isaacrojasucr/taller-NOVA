-- run_runstats.sql
-- Ejecutar RUNSTATS para tablas críticas antes de pruebas de ejecución/EXPLAIN.
-- Reemplace {SCHEMA} por su esquema (p.ej. DETRI1) o ejecute `SET CURRENT SCHEMA = 'DETRI1';` antes.

-- RUNSTATS en TRANS
CALL SYSPROC.ADMIN_CMD('RUNSTATS ON TABLE {SCHEMA}.TRANS WITH DISTRIBUTION AND DETAILED INDEXES ALL');

-- RUNSTATS en GLBLN
CALL SYSPROC.ADMIN_CMD('RUNSTATS ON TABLE {SCHEMA}.GLBLN WITH DISTRIBUTION AND DETAILED INDEXES ALL');

-- RUNSTATS en GLMST
CALL SYSPROC.ADMIN_CMD('RUNSTATS ON TABLE {SCHEMA}.GLMST WITH DISTRIBUTION AND DETAILED INDEXES ALL');

-- Opcional: RUNSTATS en índices específicos
-- CALL SYSPROC.ADMIN_CMD('RUNSTATS ON TABLE {SCHEMA}.TRANS INDEX (idx_trans_contable_fecha) WITH DETAILED INDEXES ALL');

-- Nota: ejecutar con usuario con privilegios para RUNSTATS y con cuidado en producción (ventanas de mantenimiento).

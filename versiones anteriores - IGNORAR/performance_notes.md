Notas de performance — Fase 2 (generación de JSON)

Resumen rápido
- Objetivo: generar JSON por cuenta o por lote sin impactar negativamente la BD.

Recomendaciones principales
- Índices: Asegurar índices sobre `TRANS(fecha_operacion)`, `TRANS(cuenta_contable)`, `TRANS(codigo_banco)`; ya existen `idx_trans_contable_fecha` y `idx_trans_cuenta_fecha` en el DDL.
- Estadísticas: ejecutar `RUNSTATS` sobre tablas grandes antes de pruebas de carga.
- Filtrado temprano: aplique filtros por `codigo_banco`, `fecha_operacion` y rango de cuentas en el WHERE para reducir set de trabajo.
- Paginación/fragmentación: para salidas muy grandes, genere JSON en bloques (cabecera -> múltiples bloques de `N` cuentas -> pie) y escriba cada bloque en IFS; evite materializar un único CLOB enorme en memoria.
- Uso de cursores: considere `DECLARE CURSOR FOR` y fetch por bloques para construir JSON incrementalmente en RPGLE.
- Evitar doble-escape: use `FORMAT JSON` en subselects que ya retornan JSON para prevenir que las cadenas se escapen.
- CTEs vs tablas temporales: si hay múltiples pasos pesados, usar tablas temporales globales o permanentes (con índices) puede mejorar reproducibilidad y performance.
- Limitar funciones en WHERE: evite funciones sobre columnas indexadas en condiciones (p. ej. no aplicar `DATE(fecha_operacion)` sobre la columna si hay índice sobre la misma).

Pruebas y validación
- Pruebas de carga: generar datasets de prueba con tamaños representativos y medir tiempo de ejecución y memoria.
- Monitoreo: medir `AVG` y `MAX` de CPU y IO durante consultas; revisar waits en DB2 for i.
- Verificación del controlTotales: siempre comprobar que `controlTotales.sumatoriaDiferenciaNeta == SUM(diferencia_por_cuenta)`.

Sugerencias de tuning específicas
- Reescribir agregaciones por partición si hay muchas cuentas por banco.
- Usar `FETCH FIRST n ROWS ONLY` con `OFFSET` para procesar por páginas si el cliente no requiere un JSON atómico.
- Si la lógica de negocio requiere joins complicados, crear una tabla intermedia con resultados agregados y luego generar JSON a partir de esa tabla.

Operación en IFS
- Escribir en IFS con CCSID 1208 (UTF-8) y nombre `YYYYMMDD_HHMMSS_banco_lote.json`.
- Para reintentos en fallo I/O, usar backoff exponencial y registrar error en `JSON_EXPORT_LOG`.

Notas finales
- Estos son puntos iniciales; podemos convertirlos en una checklist de pruebas de performance y en scripts `EXPLAIN`/`RUNSTATS` si quieres que los genere.

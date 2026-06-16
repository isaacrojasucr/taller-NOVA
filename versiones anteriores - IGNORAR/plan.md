## Plan: Generar JSON y grabar en IFS (RPGLE Free-Form)

TL;DR: Implementar un proceso modular en RPGLE (Fully Free-Form) que consulte GLBLN y tablas relacionadas, calcule balances y estados financieros por cuenta, genere JSON por lote en UTF-8 y escriba el resultado en IFS. La implementación ubicará los módulos RPGLE en `NOVASRCMOD`, el programa principal `MAIN` en `NOVASRCPGM`, los enlaces/binder en `NOVASRCSRV` y los prototipos de llamadas en archivos TXT bajo `NOVASRCTXT`. El plan también valida que se cumplan las reglas de revisión IBM i para arquitectura modular, pruebas, documentación y JSON válido.

**Steps**
1. Fase 1 — Análisis y mapeo de datos
   - Revisar `TALLERSQLSRC/db2fori_core_bancario_ddl.sql` para confirmar estructura de `GLBLN`, `GLMST`, `TRANS`, `TTRAN`, `TRDSC` y claves/índices.
   - Definir el JSON objetivo (campos obligatorios, opcionales y estructura anidada) basándose en `TALLERSRCPGM/requerimientos y ejemplos/requerimientos_taller.md`.
   - Entregar un mapeo columna → JSON por cada entidad y validar que la salida incluirá `metadata`, `ejecucion`, `contexto`, `cuentas`, `controlTotales` e `incidentes`.

2. Fase 2 — Diseño de consultas SQL y prototipos JSON (DB-side)
   - Probar y crear consultas SQL que devuelvan `JSON_OBJECT` / `JSON_ARRAYAGG` por cuenta o por lote usando `TALLERSRCPGM/requerimientos y ejemplos/PracticaJSON.sql` como plantilla.
   - Implementar CTEs para cálculos de débitos/créditos, saldo calculado y conteos.
   - Validar performance con índices existentes y proponer índices adicionales si es necesario.
   - Revisar que no se usen objetos PF/LF o artefactos DDS si se modifica BD; mantener solo SQL DDL.

3. Fase 3 — Implementación RPGLE Free-Form (módulos y fuentes)
   - Crear las fuentes RPGLE en el directorio `NOVASRCMOD`, usando nombres de miembro de máximo 10 caracteres.
   - Colocar el programa principal `MAIN` en `NOVASRCPGM`, con nombre de miembro de máximo 10 caracteres.
   - Colocar los objetos de enlace / binder en `NOVASRCSRV`, usando nombres de máximo 10 caracteres.
   - Colocar los archivos TXT con los procedimientos y prototipos de llamadas en `NOVASRCTXT`, usando nombres de máximo 10 caracteres.
   - Diseñar módulos/routines separados: `MAIN` (orquestador), `DATA_ACCESS`, `BUSINESS_LOGIC`, `JSON_UTILS`, `IFS_IO`, `LOGGING`.
   - `DATA_ACCESS` debe manejar acceso a datos con cursors parametrizables y retorno de filas o CLOB JSON.
   - `BUSINESS_LOGIC` implementa cálculos de balance, reglas de estado, detección de diferencias y conciliación.
   - `JSON_UTILS` normaliza strings, genera metadatos y une fragmentos JSON cuando sea necesario.
   - `IFS_IO` encapsula la escritura en IFS, preferiblemente con `IFS_WRITE_UTF8` o API IFS nativa.
   - Mantener la separación de capas y evitar acoplar la lógica de negocio con la salida IFS.

4. Fase 4 — Manejo de I/O y CCSID
   - Forzar salida UTF-8 (CCSID 1208) para los archivos IFS.
   - Nombrar archivos con `YYYYMMDD_HHMMSS_env_runid.json`.
   - Implementar escritura por bloques si el JSON es muy grande: encabezado, bloques de cuentas y pie.

5. Fase 5 — Control de errores, logging y evidencia
   - En cada `Exec SQL` comprobar `SQLSTATE`/`SQLCODE` y encapsular errores en estructura `ERROR_REC` con `codigo`, `mensaje`, `contexto`.
   - Capturar fallos de escritura en IFS; reintentos con backoff y registro definitivo si falla.
   - Crear tabla `JSON_EXPORT_LOG` con columnas de seguimiento de ejecución y estado.
   - Generar documentación de flujo, responsabilidades y convenciones de nombres.
   - Registrar evidencia de pruebas y generación de JSON válido.

6. Fase 6 — Empaquetado, pruebas y despliegue
   - Crear fuentes de pruebas unitarias en `UNITSRCMOD`, usando un archivo por cada módulo de fase 3.
   - Crear los BND de unit tests en `UNITSRCSRV`, con nombres de máximo 10 caracteres.
   - Compilar módulos con `CRTBNDRPG` y crear SRVPGM y programa principal.
   - Ejecutar pruebas unitarias de reglas clave de conciliación y pruebas de integración del flujo principal.
   - Validar estructuralmente el JSON de salida y el cumplimiento de `controlTotales.sumatoriaDiferenciaNeta`.
   - Documentar pasos de despliegue, ejecución en QA y ejemplos de llamadas con parámetros.

**Relevant files**
- `TALLERSQLSRC/db2fori_core_bancario_ddl.sql` — Estructura BD.
- `TALLERSRCPGM/requerimientos y ejemplos/requerimientos_taller.md` — Requerimientos.
- `TALLERSRCPGM/requerimientos y ejemplos/GrabaIFS.sql` — Ejemplo de escritura IFS.
- `TALLERSRCPGM/requerimientos y ejemplos/PracticaJSON.sql` — Ejemplos JSON.
- `TALLERSRCPGM/requerimientos y ejemplos/EjemploJSON.sql` — Ejemplo de JSON/IFS.
- `TALLERSRCPGM/fase1-analisis.md` — Mapeo columna → JSON.
- `TALLERSRCPGM/Revision_IBMi.md` — Reglas de revisión aplicadas.

**Verification**
1. Verificar que las fuentes RPGLE se ubiquen en `NOVASRCMOD`, que `MAIN` esté en `NOVASRCPGM`, los binder en `NOVASRCSRV` y los TXT de prototipos en `NOVASRCTXT`.
2. Verificar que las fuentes de pruebas unitarias estén en `UNITSRCMOD` y sus binder en `UNITSRCSRV`, con un fuente por cada módulo de fase 3.
3. Validar que el JSON generado sea UTF-8 y contenga `metadata`, `ejecucion`, `contexto`, `cuentas`, `controlTotales` e `incidentes`.
4. Verificar que `controlTotales.sumatoriaDiferenciaNeta` coincida con la sumatoria de diferencias por cuenta.
5. Confirmar pruebas unitarias y de integración para el flujo principal con evidencia de ejecución.
5. Confirmar que la arquitectura está separada en capas (acceso, negocio, JSON, IFS) y cumple criterios SOLID.

**Decisions / Assumptions**
- Se asume que la implementación no requiere PF/LF y que la salida de datos en JSON se entrega con SQL RPGLE/IFS solamente.
- Se asume que `NOVASRCTXT` alojará archivos de prototipos de llamada para facilitar compilación y contratos SRVPGM.
- El plan actual se ajusta para cumplir las reglas de revisión IBM i al reforzar la validación del JSON y la separación de responsabilidades.

**Further Considerations**
1. Confirmar si existen convenciones adicionales de nombres de miembros dentro de `NOVASRCMOD` y `NOVASRCPGM`.
2. Evaluar si se necesita un archivo README adicional en `NOVASRCTXT` para documentar los prototipos y contratos.
3. Verificar que el flujo batch sea trazable por un ID de ejecución en `JSON_EXPORT_LOG`.

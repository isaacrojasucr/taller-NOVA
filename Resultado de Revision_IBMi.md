# Resultado de Revision - Taller IBM i
## Proceso de Conciliacion GLBLN / GLCNC001

| Campo             | Valor                                                      |
|-------------------|------------------------------------------------------------|
| Equipo            | Isaac Rojas                                                |
| Usuario IBM i     | IROJAS94                                                   |
| Libreria          | IROJAS941                                                  |
| Servidor          | PUB400.com                                                 |
| Fecha de revision | 2026-06-17                                                 |
| Documento base    | Revision_IBMi.md                                           |
| Revisor           | Agente IA (Claude)                                         |

---

## 1. Decision Final

> ### APROBADO CON OBSERVACIONES
>
> Sin hallazgos Criticos. Sin ausencia de evidencias minimas.
> Se identificaron 2 hallazgos de severidad Alta y 1 Baja,
> todos de naturaleza de metadata/limpieza, sin impacto funcional.
> Deben cerrarse con evidencia antes de la revision definitiva.

---

## 2. Resumen de Hallazgos

| ID    | Severidad | Componente                    | Estado  |
|-------|-----------|-------------------------------|---------|
| H-001 | Alta      | NOVASRCSQL — 115 archivos SQL | Abierto |
| H-002 | Alta      | NOVASRCSQL/ZTEST.sql          | Abierto |
| H-003 | Baja      | CNOFT.sql / MLNCT.sql         | Abierto |

---

## 3. Hallazgos Detallados

### H-001
- **Severidad:** Alta
- **Componente:** NOVASRCSQL — 115 archivos SQL (tablas y vista)
- **Seccion de referencia:** 13.1 / 15 / 16.1
- **Evidencia:** Busqueda del patron `LABEL ON COLUMN ... TEXT IS` sobre todos
  los archivos de `NOVASRCSQL/*.sql` retorna 0 coincidencias. Los archivos
  incluyen correctamente `LABEL ON COLUMN ... IS '...'` (encabezado corto) y
  `COMMENT ON COLUMN ...` (comentario tecnico), pero ninguno contiene el tercer
  elemento exigido: `LABEL ON COLUMN ... TEXT IS '...'` (descripcion larga de
  columna), requerido por la seccion 15 del checklist y la expresion regular
  `LABEL\s+ON\s+COLUMN\s+.*\s+TEXT\s+IS` de la seccion 16.1.
- **Impacto:** Incumplimiento del estandar de completitud de metadata en los
  115 objetos SQL del proyecto. La seccion 14.3 clasifica explicitamente como
  Falla Alta cuando una tabla SQL no cumple metadata/comentarios completos.
- **Recomendacion:** Agregar un bloque `LABEL ON COLUMN ... TEXT IS` para cada
  columna en todos los scripts SQL. El texto puede reutilizarse desde el
  `COMMENT ON COLUMN` ya existente. Ejemplo para CCDSC:
  ```sql
  LABEL ON COLUMN IROJAS941.CCDSC
    (CODIGO_CENTRO_COSTO  TEXT IS 'PK. Codigo del centro de costo del banco');
  LABEL ON COLUMN IROJAS941.CCDSC
    (DESCRIPCION_CENTRO_COSTO TEXT IS 'Descripcion legible del centro de costo');
  -- ... una linea por cada columna de la tabla ...
  ```
  Tras corregir los 115 scripts locales, re-ejecutar `CPYFRMSTMF` +
  `RUNSQLSTM` sobre los miembros correspondientes en IROJAS941.

---

### H-002
- **Severidad:** Alta
- **Componente:** `NOVASRCSQL/ZTEST.sql`
- **Seccion de referencia:** 13.1 / 13.2 / 15
- **Evidencia:** El archivo contiene unicamente:
  ```sql
  CREATE OR REPLACE TABLE IROJAS941.ZTEST (
    COL1 FOR COLUMN C1 VARCHAR(20) NOT NULL,
    COL2 FOR COLUMN C2 DECIMAL(18 , 2) NOT NULL DEFAULT 0,
    COL3 FOR COLUMN C3 DECIMAL(18) NOT NULL DEFAULT 0
  ) RCDFMT ZTESTR;
  ```
  Sin bloque de metadata (nombre, descripcion, objetivo, tipo, origen,
  permanencia, uso, autor, fecha, proyecto), sin `COMMENT ON TABLE`,
  sin `LABEL ON TABLE`, sin `COMMENT ON COLUMN`, sin `LABEL ON COLUMN`.
  Incumple integramente la estructura obligatoria minima de la seccion 13.1
  y la regla de metadata no vacia de la seccion 13.2. Se trata de un
  artefacto de desarrollo residual sin proposito funcional documentado.
- **Impacto:** Contamina la entrega final con un objeto sin contexto. Tabla
  no referenciada por ningun modulo RPGLE ni documentada en el plan de
  base de datos (DEPLOY.txt / estructura_bd.md).
- **Recomendacion:**
  1. Eliminar `NOVASRCSQL/ZTEST.sql` del repositorio local.
  2. Borrar el miembro en PUB400: `RMVM FILE(IROJAS941/NOVASRCSQL) MBR(ZTEST)`.
  3. Eliminar la tabla del sistema: `DROP TABLE IROJAS941.ZTEST`.

---

### H-003
- **Severidad:** Baja
- **Componente:** `NOVASRCSQL/CNOFT.sql` (linea 16) y
  `NOVASRCSQL/MLNCT.sql` (linea 18)
- **Seccion de referencia:** 16.1 (`\bFOR\s+COLUMN\b`)
- **Evidencia:** La columna `IDIOMA VARCHAR(20) NOT NULL` aparece sin alias
  `FOR COLUMN` en ambas tablas, mientras que el resto de columnas en esas
  mismas tablas si incluyen el alias de sistema corto. Ejemplo en CNOFT.sql:
  ```sql
  CODIGO_TABLA  FOR COLUMN CODTBL  VARCHAR(20) NOT NULL,  -- correcto
  IDIOMA                   VARCHAR(20) NOT NULL,           -- falta FOR COLUMN
  DESCRIPCION   FOR COLUMN DESCRIP  VARCHAR(120) NOT NULL, -- correcto
  ```
- **Impacto:** El campo quedara con nombre de sistema igual al nombre SQL
  (`IDIOMA`), sin alias de sistema corto explicito. Inconsistencia menor
  con el estandar del proyecto; no afecta funcionalidad.
- **Recomendacion:** Agregar el alias en ambas tablas:
  ```sql
  IDIOMA FOR COLUMN IDIOMA VARCHAR(20) NOT NULL,
  ```
  Re-ejecutar `RUNSQLSTM` sobre los miembros CNOFT y MLNCT.

---

## 4. Evaluacion por Seccion del Checklist

### 6.1 Principios SOLID — APROBADO

| Principio | Evidencia |
|-----------|-----------|
| SRP       | Cada modulo tiene una unica responsabilidad: GLDTAACC (acceso cuentas), GLMOVACC (movimientos), GLBALCAL (calculo de balance), GLCONCIL (reglas de conciliacion), GLJSONBL (construccion JSON), GLIFSOUT (escritura IFS), UTLFECHA/UTLNUM/UTLBITAC (utilidades) |
| OCP       | Reglas de clasificacion (CONCILIADA / PARCIAL / NO_CONCILIADA, severidades, tolerancia) aisladas en GLCONCIL; pueden evolucionar sin modificar GLCNC001, GLDATSRV ni GLOUTSRV |
| LSP       | Cada service program expone un contrato (.bnd) acotado; GLCNC001 invoca procedimientos EXTPROC sustituibles sin romper el flujo |
| ISP       | 4 binder sources independientes por capa (GLUTLSRV / GLDATSRV / GLBUSSRV / GLOUTSRV) en lugar de un contrato monolitico |
| DIP       | GLBUSSRV no contiene SQL ni referencia directa a tablas; recibe datos ya leidos por GLDATSRV a traves de parametros. GLCNC001 depende de abstracciones (prototipos EXTPROC), no de implementaciones |

Documentado en: `NOVASRCTXT/ARQDISEN.txt`, seccion 2.

---

### 6.2 Arquitectura IBM i — APROBADO

- Programa principal de orquestacion: `GLCNC001` (SQLRPGLE, actgrp(*caller),
  bnddir GLCNCBND).
- Modulos separados por capa: acceso a datos (GLDATSRV), negocio (GLBUSSRV),
  salida (GLOUTSRV), utilidades (GLUTLSRV).
- Flujo batch trazable por `idEjecucion` (patron `GLCNC<timestamp ISO>`,
  compartido entre JSON y bitacora .txt).
- Diagrama de componentes y flujo en `NOVASRCTXT/ARQDISEN.txt`.

---

### 6.3 Codigo limpio — APROBADO

- Procedimientos cortos y cohesivos: GLCONCIL (6 procedimientos, ninguno supera
  35 lineas de logica ejecutable). GLBALCAL (1 procedimiento con calculo
  directo). GLDTAACC (3 procedimientos con patron restart-key documentado).
- Sin duplicacion relevante: formateo de fechas/numeros centralizado en
  GLUTLSRV, reutilizado por GLCNC001 y GLJSONBL.
- Comentarios de bloque describiendo el WHY de cada procedimiento, no el WHAT.

---

### 6.4 Pruebas y documentacion — APROBADO

| Evidencia | Detalle |
|-----------|---------|
| Pruebas unitarias | `wFallos=0` sobre 11 casos: TSTBC01-03 (GLBALCAL), TSTCC01-04 (GLCONCIL), TSTJB01-05 (GLJSONBL) |
| Resultado en IFS | `/home/IROJAS94/conciliacion/tstdrv_resultado.txt` |
| Prueba de integracion | `CALL PGM(IROJAS941/GLCNCRUN)` completada sin errores. 8 cuentas procesadas, estados CONCILIADA/PARCIAL/NO_CONCILIADA generados correctamente |
| JSON validado | `/home/IROJAS94/conciliacion/glcnc001_test.json` (10,908 bytes). Todos los items de la seccion 6 de PRUEBAS.txt aprobados |
| Bitacora | `/home/IROJAS94/conciliacion/glcnc001_test.txt` (782 bytes). 4 incidentes registrados (3 MEDIA, 1 ALTA) |
| Documentacion | PRUEBAS.txt seccion 7 actualizada con rutas IFS y resultados reales |

---

### 6.5 Refactorizacion — APROBADO

- Diagnostico sistematico con programa `GLTESTDB` para aislar el problema de
  cursor SQL entre procedimientos.
- Correccion aplicada (patron restart-key en GLDTAACC/GLMOVACC) respaldada por
  ejecucion exitosa de GLCNCRUN y 11/11 pruebas unitarias sin regresion.
- Deuda tecnica resuelta: NAMING(*SQL) eliminado, cursor scope entre
  procedimientos corregido arquitecturalmente.

---

### 6.6 Nomenclatura y estandar de nombres — APROBADO (con H-003 pendiente)

- Convenciones documentadas en `NOVASRCTXT/NAMING.txt`: prefijos GL/UTL/TST,
  sufijos semanticos (*INI, *NEXT, *FIN, *ADD, *CNT, *GET, *TOT, *DIF, *CUL,
  *PART, *HASH), limite de 10 caracteres verificado en todos los objetos.
- Patron de nombres de archivos IFS documentado: `GLCNC<timestamp>` para
  idEjecucion.
- Observacion: H-003 (FOR COLUMN ausente en IDIOMA de CNOFT/MLNCT) es una
  inconsistencia menor dentro del estandar aplicado.

---

### Seccion 7 — Validaciones Funcionales JSON — APROBADO

| Validacion | Resultado |
|------------|-----------|
| JSON UTF-8 valido y parseable | OK |
| Claves de primer nivel en orden correcto | metadata, ejecucion, contexto, cuentas, controlTotales, incidentes |
| `metadata.versionEstructura` = "1.0.0" | OK |
| `metadata.ambiente` = parametro pAmbiente ("QA") | OK |
| `ejecucion.idEjecucion` patron GLCNC + timestamp | GLCNC20260617083543550147 |
| idEjecucion coincide entre JSON y bitacora | OK |
| `estadoEjecucion` consistente con severidad maxima | PARCIAL (incidente ALTA presente) |
| `cuentas[]` dentro del rango [pCtaIni, pCtaFin] | OK - 8 cuentas en rango 1000000001..1000000008 |
| Cuentas NO_CONCILIADA/PARCIAL con incidente correspondiente | OK - ERR-GL-001 (cuenta 06), WARN-GL-001 (cuentas 04, 05, 08) |
| `controlTotales.totalCuentasProcesadas` = len(cuentas) | 8 = 8 |
| `controlTotales.totalCuentasConciliadas` | 4 |
| `controlTotales.totalCuentasConDiferencia` | 4 |
| `sumatoriaDiferenciaNeta` = suma individual | -110.00 = (-20+30-100-20) |
| `sumatoriaSaldoFinalFuente` | 690,000.00 |
| `sumatoriaSaldoFinalConciliado` | 690,110.00 |

---

### Seccion 14 — Objetos Permitidos en BD — APROBADO

- Busqueda de patrones prohibidos (`CRTPF`, `CRTLF`, `.pf`, `.lf`, `.dds`) en
  archivos de entrega: 0 coincidencias.
- Los 3 archivos que contienen esas cadenas pertenecen a la carpeta
  "versiones anteriores - IGNORAR" y al propio documento de referencia
  `Revision_IBMi.md`, fuera del alcance de evaluacion.
- Todos los objetos de base de datos fueron creados via `CREATE OR REPLACE
  TABLE` o `CREATE OR REPLACE VIEW`.

---

### Checklist SQL (Seccion 15)

| Item                                                   | Estado |
|--------------------------------------------------------|--------|
| Bloque de metadata completo por tabla                  | PASS (excepto ZTEST — H-002) |
| `CREATE OR REPLACE TABLE` con `FOR COLUMN` y `PRIMARY KEY` | PASS (excepto IDIOMA en CNOFT/MLNCT — H-003) |
| `COMMENT ON TABLE` y `LABEL ON TABLE`                  | PASS |
| `COMMENT ON COLUMN` para todas las columnas            | PASS |
| `LABEL ON COLUMN` (encabezado corto) para todas las columnas | PASS |
| `LABEL ON COLUMN ... TEXT IS` (descripcion larga)      | **FAIL — H-001 (ausente en 115 objetos)** |
| No existen PF ni LF                                    | PASS |
| Solo tablas y vistas SQL                               | PASS (excepto ZTEST sin metadata — H-002) |

---

## 5. Condiciones de Cierre

Para que la revision quede en estado **Aprobado** sin observaciones, deben
cerrarse los siguientes hallazgos con evidencia:

| Hallazgo | Accion requerida | Evidencia de cierre |
|----------|-----------------|---------------------|
| H-001 | Agregar `LABEL TEXT IS` en los 115 scripts SQL y re-ejecutar RUNSQLSTM | Captura de RUNSQLSTM exitoso; verificacion via `SELECT COUNT(*)` en QSYS2.SYSCOLUMNS o LABEL corregido en al menos una muestra representativa |
| H-002 | Eliminar ZTEST.sql del repositorio local y `DROP TABLE IROJAS941.ZTEST` en PUB400 | Confirmacion de que `SELECT COUNT(*) FROM QSYS2.SYSTABLES WHERE TABLE_SCHEMA='IROJAS941' AND TABLE_NAME='ZTEST'` retorna 0 |
| H-003 | Agregar `FOR COLUMN IDIOMA` en CNOFT.sql y MLNCT.sql; re-ejecutar RUNSQLSTM sobre esos dos miembros | RUNSQLSTM exitoso para CNOFT y MLNCT |

---

## 6. Inventario de Objetos Entregados

| Tipo | Cantidad | Detalle |
|------|----------|---------|
| Tablas SQL (`CREATE OR REPLACE TABLE`) | 114 | Modulos 1-15 segun estructura_bd.md |
| Vistas SQL (`CREATE OR REPLACE VIEW`) | 1 | GLBLNVW (GLBLN + GLMST + CCDSC) |
| Modulos ILE RPG (`*MODULE`) | 12 | 9 productivos (NOVASRCMOD) + 3 de prueba (UNITSRCMOD) |
| Programas de servicio (`*SRVPGM`) | 5 | GLUTLSRV, GLDATSRV, GLBUSSRV, GLOUTSRV, TSTSRV |
| Directorio de enlace (`*BNDDIR`) | 1 | GLCNCBND |
| Programas (`*PGM`) | 2 | GLCNC001, TSTDRV |
| Documentos NOVASRCTXT | 7 | NAMING, ARQDISEN, PARAMEXE, ESTADOSC, BITACORA, DEPLOY, PRUEBAS |
| JSON de salida real | 1 | /home/IROJAS94/conciliacion/glcnc001_test.json |
| Bitacora de salida real | 1 | /home/IROJAS94/conciliacion/glcnc001_test.txt |
| Resultado de pruebas unitarias | 1 | /home/IROJAS94/conciliacion/tstdrv_resultado.txt |

# Plan: Reorganización y Validación de Script SQL Bancario

## Resumen Ejecutivo
Reorganizar archivo SQL monolítico de 114 tablas en **11 archivos SQL categorizados** por dominio funcional. Cada tabla recibirá metadata completa, comentarios detallados, alias de sistema (FOR COLUMN) generados automáticamente, y validación contra reglas de IBM i.

**Estado**: En preparación
**Tablas a procesar**: 114
**Archivos de salida esperados**: 11

---

## Análisis Actual del Código

### Archivo base
- **Ubicación**: `TALLERSQLSRC/db2fori_core_bancario_ddl.sql`
- **Contenido**: 114 tablas SQL en un único archivo
- **Líneas aprox**: ~1600+

### Deficiencias identificadas
1. ❌ Sin encabezado de metadata (bloque `--=====...`)
2. ❌ Sin `COMMENT ON TABLE` (solo `LABEL ON TABLE`)
3. ❌ Sin `COMMENT ON COLUMN` (solo `LABEL ON COLUMN`)
4. ❌ Sin `FOR COLUMN` (alias de sistema IBM i)
5. ❌ Sin `LABEL ... TEXT IS` completo en algunas columnas
6. ❌ Sin separación visual entre categorías

### Lo que SÍ tiene (reutilizable)
- ✅ `CREATE OR REPLACE TABLE` correcto
- ✅ `PRIMARY KEY` definidas
- ✅ `RCDFMT` (formato de registro)
- ✅ Índices básicos
- ✅ `LABEL ON COLUMN` con descripciones

---

## Categorización de Tablas (11 grupos)

1. **01_maestras.sql** → CUMST, APCLS, BAVEN, USERS, ACMST, UNCOL, OFMST, etc (4 tablas maestras)
2. **02_catalogos_auxiliares.sql** → CNOFT, CNOFC, HOLYD, MSSGS, PRENA, PRENS, HEAD, IBSDD, IBTBL, CIFXF (10 tablas)
3. **03_configuracion_parametros.sql** → CNTRLCNT, CNTRLBRN, CNTRLNUM, CNTRLTAX, CNTRLMSG, CNTRLRTE, etc (11 tablas)
4. **04_clientes_complementarios.sql** → CUMAD, CUMPR, CUMSD, SPINS (4 tablas)
5. **05_transacciones.sql** → TRANS, TTRAN, TRDSC, PBTRN, RCLNB, DEVOL, CMRIN, STPMT (8 tablas)
6. **06_chequeras.sql** → CHMST, CHPER, DEVOL, CMRIN (desglose específico: 4 tablas)
7. **07_caja_cajeros.sql** → TLMST, TDRCR, AUDIT, STPMT (4 tablas)
8. **08_prestamos_creditos.sql** → DEALS, DLPMT, DLDRF, DLSDE, DLCLP, DDCPN, DLITP, LNECR (8 tablas)
9. **09_cartas_credito.sql** → LCMST, LCDOC, LCFIN, LCFMT, LCADM, LCCOV, LCDIN, LCSTA, CNTRLLCP, CNTRLRLC (10 tablas)
10. **10_cobranzas_documentarias.sql** → DCMST, APPRV, LCFEE, CNTRLRCO (4 tablas)
11. **11_contabilidad_financiera.sql** → GLMST, INPUT, GLBLN (3 tablas)

---

## Template de Metadata (Estructura Completa)

Cada tabla tendrá este formato:

```sql
--==============================================================
-- TABLA: {NOMBRE_TABLA}
--==============================================================
-- Nombre de la Tabla: {NOMBRE_TABLA}
-- DESCRIPCIÓN: {Descripción completa del negocio}
-- Objetivo: {Para qué sirve}
-- Tipo de Tabla: {Maestro|Transaccional|Histórico|Catálogo|Configuración}
-- Origen de los Datos: {DDS→SQL Migration|Diseño nuevo|Integración}
-- Permanencia de Datos: {Permanente|Temporal|Histórico}
-- Uso de los datos: {Lectura|Lectura-Escritura|Auditoría}
-- Hecho por: Taller Isaac (Fase 1)
-- Fecha: 2026-06-12
-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL
--==============================================================

CREATE OR REPLACE TABLE {SCHEMA}.{TABLA} (
  columna1 VARCHAR(20) FOR COLUMN COL1,
  -- ...
  PRIMARY KEY (campo1, campo2)
) 
RCDFMT R{TABLA};

COMMENT ON TABLE {SCHEMA}.{TABLA} IS 
  'Descripción completa de la tabla para auditoría y documentación';

LABEL ON TABLE {TABLA} IS '{LABEL breve}';

COMMENT ON COLUMN {SCHEMA}.{TABLA}(
  columna1 IS 'Descripción técnica y funcional',
  columna2 IS 'Descripción técnica y funcional'
);

LABEL ON COLUMN {TABLA}(
  columna1 IS 'Etiqueta columna1'  LABEL ... TEXT IS 'Texto largo columna1',
  columna2 IS 'Etiqueta columna2'  LABEL ... TEXT IS 'Texto largo columna2'
);
```

---

## Estrategia de Ejecución

### Fase 1: Preparación (Este plan)
- [x] Análisis de 114 tablas
- [x] Categorización en 11 grupos
- [ ] Definir mapeo de alias FOR COLUMN (regla: primeros 10 caracteres del nombre en mayúsculas)

### Fase 2: Generación Automatizada (Implementación)
- [ ] Para cada archivo SQL de salida:
  1. Leer tabla original del archivo monolítico
  2. Extraer LABEL ON TABLE como descripción
  3. Generar encabezado de metadata con placeholders
  4. Insertar FOR COLUMN automáticamente en columnas
  5. Generar COMMENT ON TABLE y COMMENT ON COLUMN
  6. Generar LABEL ... TEXT IS si falta
  7. Escribir nuevo archivo SQL categorizado



## Definiciones de Alias FOR COLUMN (Automático)

**Estrategia**: Primeros 10 caracteres del nombre en mayúsculas, sanitizados.

Ejemplos:
- `codigo_tabla` → `COD_TABLE`
- `descripcion` → `DESCRIPCION` → `DESCRIPCIO` (10 car máximo)
- `usuario_creacion` → `USUARIO_CR` 
- `created_at` → `CREATED_AT`
- `observaciones` → `OBSERVACIO`

Regla: Si queda < 10 caracteres, usar el nombre completo.

---

## Decisiones Tomadas (Del Diálogo)

✅ **Agrupación**: Por categoría funcional (11 archivos), no uno-por-tabla ni monolítico
✅ **Metadata**: Usar placeholders con valores por defecto (Taller Isaac 2026-06-12)
✅ **FOR COLUMN**: Generar automáticamente siguiendo regla de 10 caracteres
✅ **LABEL TEXT IS**: Generar para todas las columnas basado en LABEL ON COLUMN existente

---

## Archivos a Crear

```
NOVASQLSRC/  ← CARPETA DE DESTINO CONFIRMADA
├── 01_maestras.sql
├── 02_catalogos_auxiliares.sql
├── 03_configuracion_parametros.sql
├── 04_clientes_complementarios.sql
├── 05_transacciones.sql
├── 06_chequeras.sql
├── 07_caja_cajeros.sql
├── 08_prestamos_creditos.sql
├── 09_cartas_credito.sql
├── 10_cobranzas_documentarias.sql
└── 11_contabilidad_financiera.sql
```

---

## Verificación Post-Implementación

Para cada tabla, validar:

| Regla | Patrón Regex | Estado |
|-------|-------------|--------|
| Metadata encabezado | `^--=+` + "Nombre de la Tabla" + "DESCRIPCIÓN" | ❓ |
| CREATE TABLE SQL | `CREATE\s+OR\s+REPLACE\s+TABLE` | ❓ |
| FOR COLUMN | `\bFOR\s+COLUMN\b` | ❓ |
| PRIMARY KEY | `CONSTRAINT\s+\w+\s+PRIMARY\s+KEY` | ❓ |
| RCDFMT | `\bRCDFMT\b` | ❓ |
| COMMENT ON TABLE | `COMMENT\s+ON\s+TABLE` | ❓ |
| LABEL ON TABLE | `LABEL\s+ON\s+TABLE` | ❓ |
| COMMENT ON COLUMN (todas) | Conteo == n_columnas | ❓ |
| LABEL ON COLUMN (todas) | Conteo == n_columnas | ❓ |
| LABEL TEXT IS | `LABEL.*TEXT\s+IS` | ❓ |
| Sin N/A | Detectar `N/A` en metadata | ❓ |
| Sin DDS | Sin `CRTPF|CRTLF|A\s+R` | ❓ |

---

## Próximos Pasos

1. **Revisar este plan** ← TÚ ESTÁS AQUÍ
2. Aprobar o sugerir cambios en:
   - Agrupación de categorías
   - Estructura de metadata
   - Alias FOR COLUMN
3. Ejecutar **Fase 2: Generación** (implementación automatizada)

---

## Notas Importantes

- **Schema**: Asumo `QGPL` o similar si no especificado (sin SQL schema prefijo en CREATE TABLE)
- **Archivo original**: Se mantiene intacto como referencia histórica
- **Regeneración**: Los scripts pueden regenerarse si las reglas de alias cambian
- **Proyecto**: TALLER ISAAC - Modernización SQL IBM i (Base Bancaria)

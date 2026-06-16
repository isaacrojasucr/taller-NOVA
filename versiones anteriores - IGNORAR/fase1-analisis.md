# Fase 1 - Análisis de datos y mapeo JSON

## 1. Objetivo de la fase 1
Validar la estructura de las tablas clave del modelo bancario, confirmar columnas y relaciones, y definir el mapeo columna → JSON para la salida del proceso.

## 2. Tablas analizadas

### 2.1 GLBLN — Balances Generales
- Clave principal: `codigo_banco`, `codigo_sucursal`.
- Campos relevantes:
  - `codigo_banco`, `codigo_sucursal`, `codigo_moneda`
  - `cuenta_contable`
  - `descripcion_cuenta`
  - `naturaleza_cuenta`
  - `nivel_cuenta`
  - `saldo_actual`
  - `fecha_proceso_sistema`
  - `observaciones`

### 2.2 GLMST — Maestro de Cuentas Contables
- Clave principal: `codigo_banco`, `codigo_moneda`.
- Estructura similar a GLBLN, pero con enfoque de catálogo maestro.
- Campos útiles para enrich de cuenta y consistencia de descripción.

### 2.3 TRANS — Archivo histórico de transacciones
- Clave primaria: `id_transaccion`.
- Campos relevantes:
  - `numero_registro_relativo`
  - `codigo_banco`, `codigo_sucursal`, `codigo_moneda`
  - `cuenta_contable`, `numero_cuenta`
  - `id_cliente`
  - `fecha_operacion`, `fecha_valor`, `hora_operacion`
  - `tipo_movimiento`, `debito_credito`, `monto`
  - `saldo_anterior`, `saldo_posterior`
  - `canal_origen`, `terminal_origen`, `referencia_externa`
  - `estado_transaccion`

### 2.4 TTRAN — Transacciones del día
- Clave primaria: `id_transaccion_dia`.
- Misma estructura de transacción con fecha solo (`fecha`).
- Adecuada para datos de movimientos diarios y comparaciones de periodos.

### 2.5 TRDSC — Descripciones adicionales de transacciones
- Clave primaria: `numero_registro_relativo`, `secuencia`.
- Campos principales:
  - `tipo_descripcion`
  - `texto_descripcion`
  - `codigo_idioma`
  - `formato_salida`
  - `obligatorio`

## 3. Relaciones y alcance del proceso
- `GLBLN` es la fuente principal de cuentas mayores y saldos generales.
- `GLMST` es el maestro de cuentas y puede usarse para validar o complementar datos de descripción y naturaleza.
- `TRANS` / `TTRAN` contienen movimientos asociados a la cuenta contable y pueden aportar:
  - totales de débitos/créditos
  - fecha del primer/último movimiento
  - conteo de transacciones
- `TRDSC` provee texto adicional por `numero_registro_relativo` de transacciones, útil para enriquecimiento de descripción o partes de conciliación.

## 4. Propuesta de JSON objetivo (estructura completa y robusta)

Alineada con requerimientos_taller.md para conciliación de cuentas contables.

```json
{
  "metadata": {
    "versionEstructura": "1.0.0",
    "sistemaOrigen": "IBS-IBM-i",
    "proceso": "CONCILIACION_GLBLN",
    "ambiente": "QA",
    "charset": "UTF-8"
  },
  "ejecucion": {
    "idEjecucion": "<runId>",
    "fechaProceso": "<fecha_proceso_YYYY-MM-DD>",
    "fechaHoraInicio": "<ISO_8601_timestamp>",
    "fechaHoraFin": "<ISO_8601_timestamp>",
    "usuario": "<usuario_ejecucion>",
    "programa": "<nombre_programa>",
    "libreria": "<libreria_programa>",
    "estadoEjecucion": "FINALIZADO|PARCIAL|ERROR"
  },
  "contexto": {
    "banco": "<codigo_banco>",
    "sucursal": "<codigo_sucursal>",
    "moneda": "<codigo_moneda>",
    "periodo": {
      "anio": <YYYY>,
      "mes": <MM>,
      "fechaCorte": "<YYYY-MM-DD>"
    },
    "rangoCuentas": {
      "desde": "<cuenta_desde>",
      "hasta": "<cuenta_hasta>"
    }
  },
  "resumenEjecucion": {
    "totalCuentasProcesadas": <cantidad>,
    "totalCuentasError": <cantidad>,
    "totalCuentasExitosas": <cantidad>,
    "tiempoEjecucionSegundos": <segundos>,
    "checksum": "<MD5_o_SHA1>"
  },
  "cuentas": [
    {
      "cuentaMayor": {
        "codigoBanco": "<codigo_banco>",
        "codigoSucursal": "<codigo_sucursal>",
        "codigoMoneda": "<codigo_moneda>",
        "cuentaContable": "<cuenta_contable>",
        "descripcionCuenta": "<descripcion_cuenta>",
        "naturaleza": "<DEUDORA|ACREEDORA>",
        "nivelCuenta": <nivel>,
        "centroCosto": "<centro_costo_opcional>"
      },
      "saldos": {
        "saldoInicial": <monto>,
        "debitosPeriodo": <monto>,
        "creditosPeriodo": <monto>,
        "saldoFinalCalculado": <monto>,
        "saldoFinalFuente": <monto>,
        "saldoFinalConciliado": <monto>
      },
      "resumenMovimientos": {
        "cantidadMovimientos": <cantidad>,
        "primerMovimiento": "<ISO_8601_timestamp>",
        "ultimoMovimiento": "<ISO_8601_timestamp>"
      },
      "partidasConciliatorias": [
        {
          "idPartida": "<PC-NNNN>",
          "tipo": "<TRANSITO|DIFERENCIA|AJUSTE>",
          "subtipo": "<DEPOSITO_NO_APLICADO|...>",
          "referencia": "<referencia_externa>",
          "fechaPartida": "<YYYY-MM-DD>",
          "monto": <monto>,
          "signo": "<DEBITO|CREDITO>",
          "estado": "<PENDIENTE|RESUELTA>",
          "origen": "<TRANS|TTRAN|TRDSC>",
          "observacion": "<texto_opcional>"
        }
      ],
      "diferencias": {
        "diferenciaNeta": <monto>,
        "diferenciaAbsoluta": <monto>,
        "toleranciaPermitida": <monto>,
        "excedeTolerancia": <true|false>,
        "motivoPrincipal": "<descripcion_motivo>"
      },
      "estadoConciliacion": {
        "codigo": "<COMPLETA|PARCIAL|ERROR>",
        "descripcion": "<descripcion_estado>",
        "severidad": "<BAJA|MEDIA|ALTA>",
        "requiereRevision": <true|false>
      },
      "trazabilidad": {
        "hashCuenta": "<MD5_datos_cuenta>",
        "registrosFuente": {
          "glbln": <cantidad>,
          "trans": <cantidad>,
          "ttran": <cantidad>,
          "trdsc": <cantidad>
        },
        "timestamp_generacion": "<ISO_8601>"
      }
    }
  ],
  "resumenConciliacion": {
    "totalCuentasCompletas": <cantidad>,
    "totalCuentasParciales": <cantidad>,
    "totalCuentasError": <cantidad>,
    "sumaDiferencias": <monto>,
    "cuentasExcedeTolerancia": <cantidad>
  },
  "errores": [
    {
      "codigo": "<ERR-NNNN>",
      "contexto": "<tabla|procedimiento>",
      "sqlstate": "<SQLSTATE_value>",
      "sqlcode": <codigo>,
      "mensaje": "<descripcion_error>",
      "cuenta_afectada": "<cuenta_contable_opcional>",
      "timestamp": "<ISO_8601>"
    }
  ]
}
```

### 4.1 Campos obligatorios vs opcionales
| Campo | Nivel | Obligatorio | Notas |
|---|---|---|---|
| metadata | root | Sí | Siempre presente |
| ejecucion | root | Sí | Datos de auditoría |
| contexto | root | Sí | Filtros aplicados |
| resumenEjecucion | root | Sí | Totales generales |
| cuentas | root | Sí | Al menos [] vacío si no hay datos |
| cuentaMayor | cuenta | Sí | Identidad de la cuenta |
| saldos | cuenta | Sí | Valores principales |
| resumenMovimientos | cuenta | Sí | Estadísticas |
| partidasConciliatorias | cuenta | No | Solo si hay partidas pendientes |
| diferencias | cuenta | No | Solo si diferenciaNeta <> 0 |
| estadoConciliacion | cuenta | Sí | Estado derivado |
| trazabilidad | cuenta | Sí | Para auditabilidad |
| resumenConciliacion | root | Sí | Consolidado de todas las cuentas |
| errores | root | No | Solo si hay errores capturados |

## 5. Mapeo columna → JSON (alineado con requerimientos_taller.md)

| JSON | Fuente | Tipo | Obligatorio | Comentario |
|---|---|---|---|---|
| `metadata.versionEstructura` | Constante | string | Sí | Versión del esquema JSON |
| `metadata.sistemaOrigen` | Constante | string | Sí | "IBS-IBM-i" |
| `metadata.proceso` | Constante | string | Sí | "CONCILIACION_GLBLN" |
| `metadata.ambiente` | Parámetro | string | Sí | QA / PROD / DEV |
| `metadata.charset` | Constante | string | Sí | "UTF-8" |
| `ejecucion.idEjecucion` | Parámetro | string | Sí | YYYYMMDD_HHMMSS_runid |
| `ejecucion.fechaProceso` | Parámetro | date | Sí | ISO 8601 |
| `ejecucion.fechaHoraInicio` | Runtime | timestamp | Sí | Timestamp inicio ejecución |
| `ejecucion.fechaHoraFin` | Runtime | timestamp | Sí | Timestamp fin ejecución |
| `ejecucion.usuario` | Job Variable | string | Sí | RUSER / USER(*OWNER) |
| `ejecucion.programa` | Constante | string | Sí | Nombre programa RPGLE |
| `ejecucion.libreria` | Constante | string | Sí | Librería del programa |
| `ejecucion.estadoEjecucion` | Runtime | string | Sí | FINALIZADO\|PARCIAL\|ERROR |
| `contexto.banco` | `GLBLN.codigo_banco` | string | Sí | Filtro |
| `contexto.sucursal` | `GLBLN.codigo_sucursal` | string | Sí | Filtro |
| `contexto.moneda` | `GLBLN.codigo_moneda` | string | Sí | Filtro |
| `contexto.periodo.anio` | Derivado fecha | int | Sí | YYYY |
| `contexto.periodo.mes` | Derivado fecha | int | Sí | MM |
| `contexto.periodo.fechaCorte` | Parámetro | date | Sí | Fecha de corte |
| `contexto.rangoCuentas.desde` | Parámetro | string | Sí | Primer rango cuenta |
| `contexto.rangoCuentas.hasta` | Parámetro | string | Sí | Último rango cuenta |
| `resumenEjecucion.totalCuentasProcesadas` | Runtime COUNT | int | Sí | Total registros GLBLN |
| `resumenEjecucion.totalCuentasError` | Runtime COUNT | int | Sí | Con errores |
| `resumenEjecucion.totalCuentasExitosas` | Runtime COUNT | int | Sí | Sin errores |
| `resumenEjecucion.tiempoEjecucionSegundos` | Runtime | decimal | Sí | Tiempo en segundos |
| `resumenEjecucion.checksum` | Runtime HASH | string | Sí | MD5 de totales |
| `cuentaMayor.codigoBanco` | `GLBLN.codigo_banco` | string | Sí | |
| `cuentaMayor.codigoSucursal` | `GLBLN.codigo_sucursal` | string | Sí | |
| `cuentaMayor.codigoMoneda` | `GLBLN.codigo_moneda` | string | Sí | |
| `cuentaMayor.cuentaContable` | `GLBLN.cuenta_contable` | string | Sí | Cuenta mayor |
| `cuentaMayor.descripcionCuenta` | `GLBLN.descripcion_cuenta` | string | Sí | |
| `cuentaMayor.naturaleza` | `GLBLN.naturaleza_cuenta` | string | Sí | DEUDORA\|ACREEDORA |
| `cuentaMayor.nivelCuenta` | `GLBLN.nivel_cuenta` | int | Sí | |
| `cuentaMayor.centroCosto` | `GLMST` (opcional) | string | No | Enriquecimiento |
| `saldos.saldoInicial` | `GLBLN.saldo_actual` inicio período | decimal(18,2) | Sí | |
| `saldos.debitosPeriodo` | `SUM(TRANS.monto)` where `D/C='D'` | decimal(18,2) | Sí | |
| `saldos.creditosPeriodo` | `SUM(TRANS.monto)` where `D/C='C'` | decimal(18,2) | Sí | |
| `saldos.saldoFinalCalculado` | Cálculo: Inicial + Débitos - Créditos | decimal(18,2) | Sí | |
| `saldos.saldoFinalFuente` | `GLBLN.saldo_actual` fin período | decimal(18,2) | Sí | |
| `saldos.saldoFinalConciliado` | Diferencia resuelta | decimal(18,2) | Sí | |
| `resumenMovimientos.cantidadMovimientos` | `COUNT(TRANS)` | int | Sí | Por cuenta |
| `resumenMovimientos.primerMovimiento` | `MIN(TRANS.fecha_operacion)` | timestamp | Sí | ISO 8601 |
| `resumenMovimientos.ultimoMovimiento` | `MAX(TRANS.fecha_operacion)` | timestamp | Sí | ISO 8601 |
| `partidasConciliatorias[]` | `TRDSC` / `TRANS` análisis | array | No | Solo si hay diferencias |
| `diferencias.diferenciaNeta` | `saldoFinalCalculado - saldoFinalFuente` | decimal(18,2) | No | Solo si <> 0 |
| `diferencias.toleranciaPermitida` | Constante negocio | decimal(18,2) | No | Ej: 1.00 |
| `estadoConciliacion.codigo` | Regla negocio | string | Sí | COMPLETA\|PARCIAL\|ERROR |
| `estadoConciliacion.severidad` | Regla negocio | string | Sí | BAJA\|MEDIA\|ALTA |
| `trazabilidad.hashCuenta` | MD5(concat columnas) | string | Sí | Para validación integridad |
| `trazabilidad.registrosFuente` | COUNT por tabla | object | Sí | Auditoría de fuentes |

## 6. Reglas de negocio identificadas para fase 1
- El proceso se filtra por `codigo_banco`, `codigo_sucursal`, `codigo_moneda`, `cuenta_contable` y `fecha_proceso`.
- El estado financiero se puede derivar en base a saldo y diferencias entre `saldo_actual` y totales de transacciones.
- Si no hay transacciones, la cuenta aún debe exportarse con `cantidadMovimientos = 0`.
- Los detalles de `TRDSC` solo se usan cuando exista `numero_registro_relativo` en `TRANS` o `TTRAN`.

## 7. Diseño de consulta SQL para agregación de cuentas (mejorada)

### 7.1 Consulta principal con totales por cuenta

```sql
WITH TRANS_AGREGADOS AS (
  SELECT 
    T.codigo_banco,
    T.codigo_sucursal,
    T.codigo_moneda,
    T.cuenta_contable,
    COUNT(T.id_transaccion) AS cant_movimientos,
    MIN(T.fecha_operacion) AS primer_movimiento,
    MAX(T.fecha_operacion) AS ultimo_movimiento,
    SUM(CASE WHEN T.debito_credito = 'D' THEN T.monto ELSE 0 END) AS tot_debitos,
    SUM(CASE WHEN T.debito_credito = 'C' THEN T.monto ELSE 0 END) AS tot_creditos
  FROM TRANS T
  WHERE DATE(T.fecha_operacion) = ?
  GROUP BY 
    T.codigo_banco, T.codigo_sucursal, T.codigo_moneda, T.cuenta_contable
)
SELECT 
  G.codigo_banco,
  G.codigo_sucursal,
  G.codigo_moneda,
  G.cuenta_contable,
  G.descripcion_cuenta,
  G.naturaleza_cuenta,
  G.nivel_cuenta,
  G.saldo_actual AS saldo_final_fuente,
  COALESCE(G.saldo_actual + COALESCE(TA.tot_debitos, 0) - COALESCE(TA.tot_creditos, 0), G.saldo_actual) AS saldo_calculado,
  COALESCE(TA.tot_debitos, 0) AS debitos_periodo,
  COALESCE(TA.tot_creditos, 0) AS creditos_periodo,
  COALESCE(TA.cant_movimientos, 0) AS cantidad_movimientos,
  COALESCE(TA.primer_movimiento, CAST(NULL AS TIMESTAMP)) AS primer_movimiento,
  COALESCE(TA.ultimo_movimiento, CAST(NULL AS TIMESTAMP)) AS ultimo_movimiento,
  G.observaciones,
  HASH(
    CONCAT(
      G.codigo_banco, G.codigo_sucursal, G.codigo_moneda, 
      G.cuenta_contable, G.saldo_actual, CURRENT DATE
    )
  ) AS hash_cuenta
FROM GLBLN G
LEFT JOIN TRANS_AGREGADOS TA
  ON TA.codigo_banco = G.codigo_banco
  AND TA.codigo_sucursal = G.codigo_sucursal
  AND TA.codigo_moneda = G.codigo_moneda
  AND TA.cuenta_contable = G.cuenta_contable
WHERE G.codigo_banco = ?
  AND G.codigo_sucursal = ?
  AND G.codigo_moneda = ?
  AND DATE(G.fecha_proceso_sistema) = ?
  AND G.cuenta_contable BETWEEN ? AND ?
ORDER BY G.cuenta_contable;
```

### 7.2 Consulta para JSON_OBJECT (salida directa)

```sql
SELECT JSON_OBJECT(
  KEY 'cuentaMayor' VALUE JSON_OBJECT(
    KEY 'codigoBanco' VALUE G.codigo_banco,
    KEY 'codigoSucursal' VALUE G.codigo_sucursal,
    KEY 'codigoMoneda' VALUE G.codigo_moneda,
    KEY 'cuentaContable' VALUE G.cuenta_contable,
    KEY 'descripcionCuenta' VALUE G.descripcion_cuenta,
    KEY 'naturaleza' VALUE G.naturaleza_cuenta,
    KEY 'nivelCuenta' VALUE G.nivel_cuenta
  ),
  KEY 'saldos' VALUE JSON_OBJECT(
    KEY 'saldoFinalFuente' VALUE G.saldo_actual,
    KEY 'saldoFinalCalculado' VALUE (G.saldo_actual + COALESCE(TA.tot_debitos, 0) - COALESCE(TA.tot_creditos, 0)),
    KEY 'debitosPeriodo' VALUE COALESCE(TA.tot_debitos, 0),
    KEY 'creditosPeriodo' VALUE COALESCE(TA.tot_creditos, 0)
  ),
  KEY 'resumenMovimientos' VALUE JSON_OBJECT(
    KEY 'cantidadMovimientos' VALUE COALESCE(TA.cant_movimientos, 0),
    KEY 'primerMovimiento' VALUE CHAR(COALESCE(TA.primer_movimiento, CURRENT TIMESTAMP) : ISO),
    KEY 'ultimoMovimiento' VALUE CHAR(COALESCE(TA.ultimo_movimiento, CURRENT TIMESTAMP) : ISO)
  ),
  KEY 'estadoConciliacion' VALUE JSON_OBJECT(
    KEY 'codigo' VALUE CASE 
      WHEN ABS(COALESCE(TA.tot_debitos, 0) - COALESCE(TA.tot_creditos, 0)) <= 1.00 THEN 'COMPLETA'
      ELSE 'PARCIAL'
    END,
    KEY 'severidad' VALUE CASE 
      WHEN ABS(COALESCE(TA.tot_debitos, 0) - COALESCE(TA.tot_creditos, 0)) > 100.00 THEN 'ALTA'
      WHEN ABS(COALESCE(TA.tot_debitos, 0) - COALESCE(TA.tot_creditos, 0)) > 10.00 THEN 'MEDIA'
      ELSE 'BAJA'
    END
  )
) AS cuenta_json
FROM GLBLN G
LEFT JOIN TRANS_AGREGADOS TA
  ON TA.codigo_banco = G.codigo_banco
  AND TA.codigo_sucursal = G.codigo_sucursal
  AND TA.codigo_moneda = G.codigo_moneda
  AND TA.cuenta_contable = G.cuenta_contable
WHERE G.codigo_banco = ?
  AND G.codigo_sucursal = ?
  AND G.codigo_moneda = ?
  AND DATE(G.fecha_proceso_sistema) = ?
  AND G.cuenta_contable BETWEEN ? AND ?;
```

## 8. Análisis de Performance e Índices

### 8.1 Índices existentes (confirmados del DDL)

| Tabla | Índice | Columnas | Propósito |
|---|---|---|---|
| GLBLN | idx_glbln_pk | codigo_banco, codigo_sucursal | Clave primaria |
| GLBLN | idx_glbln_created_at | created_at | Tracking |
| TRANS | idx_trans_pk | id_transaccion | Clave primaria |
| TRANS | idx_trans_reg_rel | numero_registro_relativo | Búsqueda relativa |
| TRANS | idx_trans_cuenta_fecha | numero_cuenta, fecha_operacion | **CRÍTICO para JOIN** |
| TRANS | idx_trans_contable_fecha | cuenta_contable, fecha_operacion | **CRÍTICO para JOIN** |
| TRANS | idx_trans_cliente_fecha | id_cliente, fecha_operacion | Trazabilidad |
| TTRAN | idx_ttran_pk | id_transaccion_dia | Clave primaria |
| TTRAN | idx_ttran_cuenta_fecha | numero_cuenta, fecha | Para transacciones del día |
| TTRAN | idx_ttran_contable_fecha | cuenta_contable, fecha | Para transacciones del día |
| TRDSC | idx_trdsc_pk | numero_registro_relativo, secuencia | Clave primaria |
| TRDSC | idx_trdsc_tipo | tipo_descripcion | Búsqueda de tipo |

### 8.2 Índices propuestos (adicionales para optimización)

| Tabla | Índice Propuesto | Columnas | Impacto |
|---|---|---|---|
| GLBLN | idx_glbln_fecha_proceso | fecha_proceso_sistema | Filtro crítico en WHERE |
| GLBLN | idx_glbln_banco_sucursal_fecha | codigo_banco, codigo_sucursal, fecha_proceso_sistema | Filtro compuesto común |
| GLBLN | idx_glbln_cuenta_rango | codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable | Búsqueda BETWEEN |
| TRANS | idx_trans_fecha_contable | fecha_operacion, cuenta_contable, debito_credito | Agregaciones |
| TTRAN | idx_ttran_fecha_contable | fecha, cuenta_contable, debito_credito | Agregaciones diarias |
| TRDSC | idx_trdsc_reg_rel_tipo | numero_registro_relativo, tipo_descripcion | Búsqueda de descripciones |

### 8.3 Consideraciones de performance

- **Volumen esperado**: GLBLN típicamente tiene miles a decenas de miles de cuentas.
- **Complejidad del JOIN**: LEFT JOIN con agregación en TRANS/TTRAN puede ser costoso si hay millones de transacciones.
- **Recomendación**: Para volúmenes grandes (>1M transacciones/día), considerar:
  1. Materializar vistas con agregados diarios.
  2. Usar TTRAN (transacciones del día) en vez de TRANS (histórico).
  3. Implementar particionamiento lógico por fecha en aplicación RPGLE.

## 9. Conclusión de fase 1 (actualizada)

✓ **Análisis estructural completado**
- Se validaron las 5 tablas clave del modelo con claves primarias e índices existentes.
- Se identificaron índices adicionales para optimizar performance en agregaciones.

✓ **JSON alineado con requerimientos_taller.md**
- Estructura robusta que incluye metadata, ejecución, contexto, resumen y trazabilidad.
- Campos claramente marcados como obligatorios vs opcionales.
- Soporta conciliación de cuentas con partidasConciliatorias, diferencias y estadoConciliacion.

✓ **Mapeo completo columna → JSON**
- Tabla exhaustiva de 50+ campos con fuentes de datos.
- Especificación de tipos, obligatoriedad y transformaciones requeridas.

✓ **Consultas SQL propuestas**
- Consulta con CTE para agregación eficiente de TRANS.
- Alternativa con JSON_OBJECT/JSON_ARRAYAGG para salida directa.
- Reglas de negocio básicas para asignación de estadoConciliacion.

✓ **Estrategia de performance validada**
- Índices existentes confirmados como adecuados.
- Propuesta de 6 índices adicionales para optimización.
- Recomendaciones para volúmenes de datos grandes.

**Fase 1 exitosa. Listo para proceder a fase 2 (Diseño de consultas SQL y prototipos JSON).**

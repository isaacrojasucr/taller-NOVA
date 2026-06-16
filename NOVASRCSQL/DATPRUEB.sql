--==============================================================================
-- Nombre del Script    : DATPRUEB
-- DESCRIPCIÓN          : Datos de prueba del núcleo funcional de la
--                        conciliación GLBLN (CCDSC, GLMST, GLBLN, TRANS,
--                        TRDSC, TTRAN) para el banco '001', sucursal '01',
--                        moneda 'USD' y fecha de proceso 2026-06-30.
-- Objetivo             : Proveer una carga mínima y controlada de 8 cuentas
--                        contables que, al ejecutar GLCNC001 con
--                        pTolerancia = 50.00, produce una mezcla de los 3
--                        estados de conciliación definidos en
--                        NOVASRCTXT/ESTADOSC.txt:
--                          - CONCILIADA  : 1000000001, 1000000002,
--                                          1000000003, 1000000007
--                                          (sin partidas TTRAN del día)
--                          - PARCIAL     : 1000000004 (TTRAN D 20.00),
--                                          1000000005 (TTRAN C 30.00),
--                                          1000000008 (TTRAN D 80.00 +
--                                          C 60.00, diferencia neta 20.00)
--                          - NO_CONCILIADA: 1000000006 (TTRAN D 100.00,
--                                          excede pTolerancia = 50.00)
-- Tipo de Script       : Carga de datos de prueba (DML)
-- Origen de los Datos  : Valores ficticios definidos para el taller, sin
--                        relación con datos productivos.
-- Permanencia de Datos : Temporal (entorno de pruebas IROJAS941 en PUB400).
-- Uso de los datos     : Ejecutar una sola vez (carga inicial sobre tablas
--                        vacias) antes de invocar GLCNC001 con los
--                        parámetros de NOVASRCTXT/PRUEBAS.txt. No incluye
--                        DELETE previo: las tablas nucleo (TRANS/TRDSC/
--                        TTRAN) participan en restricciones FK que
--                        requieren las tablas en estado *JRN para soportar
--                        DELETE (SQL7008); al ser la carga inicial sobre
--                        tablas vacias no es necesario.
-- Hecho por            : Isaac Rojas
-- Fecha                : 2026-06-14
-- Proyecto             : Taller IBM i - Conciliación GLBLN (IROJAS941 / PUB400)
--==============================================================================

--------------------------------------------------------------------------------
-- CCDSC: centro de costo usado por las 8 cuentas de prueba
--------------------------------------------------------------------------------
INSERT INTO IROJAS941.CCDSC
  (CODIGO_CENTRO_COSTO, DESCRIPCION_CENTRO_COSTO, CODIGO_BANCO,
   TIPO_CENTRO_COSTO, RESPONSABLE_CC, USUARIO_CREACION)
VALUES
  ('CC-OPER01', 'Operaciones Sucursal 01', '001', 'OPERATIVO',
   'Juan Perez', 'IROJAS94');

--------------------------------------------------------------------------------
-- GLMST: maestro de cuentas contables (banco='001', moneda='USD')
--------------------------------------------------------------------------------
INSERT INTO IROJAS941.GLMST
  (CODIGO_BANCO, CODIGO_MONEDA, CUENTA_CONTABLE, DESCRIPCION_CUENTA,
   NATURALEZA_CUENTA, NIVEL_CUENTA, CENTRO_COSTO, SALDO_ACTUAL,
   FECHA_PROCESO_SISTEMA, USUARIO_CREACION)
VALUES
  ('001', 'USD', '1000000001', 'Caja General',
   'DEUDORA', 'Detalle', 'CC-OPER01', 50000.00,
   TIMESTAMP('2026-06-30 00:00:00'), 'IROJAS94'),
  ('001', 'USD', '1000000002', 'Bancos Corresponsales',
   'DEUDORA', 'Detalle', 'CC-OPER01', 120000.00,
   TIMESTAMP('2026-06-30 00:00:00'), 'IROJAS94'),
  ('001', 'USD', '1000000003', 'Cuentas por Cobrar Varios',
   'DEUDORA', 'Detalle', 'CC-OPER01', 30000.00,
   TIMESTAMP('2026-06-30 00:00:00'), 'IROJAS94'),
  ('001', 'USD', '1000000004', 'Depositos a la Vista',
   'ACREEDORA', 'Detalle', 'CC-OPER01', 200000.00,
   TIMESTAMP('2026-06-30 00:00:00'), 'IROJAS94'),
  ('001', 'USD', '1000000005', 'Depositos a Plazo',
   'ACREEDORA', 'Detalle', 'CC-OPER01', 150000.00,
   TIMESTAMP('2026-06-30 00:00:00'), 'IROJAS94'),
  ('001', 'USD', '1000000006', 'Obligaciones Financieras Diversas',
   'ACREEDORA', 'Detalle', 'CC-OPER01', 80000.00,
   TIMESTAMP('2026-06-30 00:00:00'), 'IROJAS94'),
  ('001', 'USD', '1000000007', 'Otros Activos',
   'DEUDORA', 'Detalle', 'CC-OPER01', 15000.00,
   TIMESTAMP('2026-06-30 00:00:00'), 'IROJAS94'),
  ('001', 'USD', '1000000008', 'Cuentas por Pagar Proveedores',
   'ACREEDORA', 'Detalle', 'CC-OPER01', 45000.00,
   TIMESTAMP('2026-06-30 00:00:00'), 'IROJAS94');

--------------------------------------------------------------------------------
-- GLBLN: saldo fuente por cuenta mayor (banco='001', sucursal='01',
-- moneda='USD'); SALDO_ACTUAL es el saldo contra el que se concilia.
--------------------------------------------------------------------------------
INSERT INTO IROJAS941.GLBLN
  (CODIGO_BANCO, CODIGO_SUCURSAL, CODIGO_MONEDA, CUENTA_CONTABLE,
   DESCRIPCION_CUENTA, NATURALEZA_CUENTA, NIVEL_CUENTA, SALDO_ACTUAL,
   FECHA_PROCESO_SISTEMA, USUARIO_CREACION)
VALUES
  ('001', '01', 'USD', '1000000001', 'Caja General',
   'DEUDORA', 'Detalle', 50000.00,
   TIMESTAMP('2026-06-30 00:00:00'), 'IROJAS94'),
  ('001', '01', 'USD', '1000000002', 'Bancos Corresponsales',
   'DEUDORA', 'Detalle', 120000.00,
   TIMESTAMP('2026-06-30 00:00:00'), 'IROJAS94'),
  ('001', '01', 'USD', '1000000003', 'Cuentas por Cobrar Varios',
   'DEUDORA', 'Detalle', 30000.00,
   TIMESTAMP('2026-06-30 00:00:00'), 'IROJAS94'),
  ('001', '01', 'USD', '1000000004', 'Depositos a la Vista',
   'ACREEDORA', 'Detalle', 200000.00,
   TIMESTAMP('2026-06-30 00:00:00'), 'IROJAS94'),
  ('001', '01', 'USD', '1000000005', 'Depositos a Plazo',
   'ACREEDORA', 'Detalle', 150000.00,
   TIMESTAMP('2026-06-30 00:00:00'), 'IROJAS94'),
  ('001', '01', 'USD', '1000000006', 'Obligaciones Financieras Diversas',
   'ACREEDORA', 'Detalle', 80000.00,
   TIMESTAMP('2026-06-30 00:00:00'), 'IROJAS94'),
  ('001', '01', 'USD', '1000000007', 'Otros Activos',
   'DEUDORA', 'Detalle', 15000.00,
   TIMESTAMP('2026-06-30 00:00:00'), 'IROJAS94'),
  ('001', '01', 'USD', '1000000008', 'Cuentas por Pagar Proveedores',
   'ACREEDORA', 'Detalle', 45000.00,
   TIMESTAMP('2026-06-30 00:00:00'), 'IROJAS94');

--------------------------------------------------------------------------------
-- TRANS: historico de transacciones del 2026-06-30 (una por cuenta para las
-- 4 cuentas CONCILIADA, y una de respaldo por cada partida TTRAN de las
-- cuentas PARCIAL/NO_CONCILIADA, referenciada por NUMERO_REGISTRO_RELATIVO).
--------------------------------------------------------------------------------
INSERT INTO IROJAS941.TRANS
  (ID_TRANSACCION, NUMERO_REGISTRO_RELATIVO, CODIGO_BANCO, CODIGO_SUCURSAL,
   CODIGO_MONEDA, CUENTA_CONTABLE, NUMERO_CUENTA, ID_CLIENTE,
   FECHA_OPERACION, FECHA_VALOR, HORA_OPERACION, TIPO_MOVIMIENTO,
   DEBITO_CREDITO, MONTO, SALDO_ANTERIOR, SALDO_POSTERIOR, CANAL_ORIGEN,
   TERMINAL_ORIGEN, REFERENCIA_EXTERNA, ESTADO_TRANSACCION, USUARIO_CREACION)
VALUES
  -- Cuentas CONCILIADA: movimiento historico ya consolidado, sin partida
  -- pendiente en TTRAN para el 2026-06-30.
  (900001, 'NRR00001', '001', '01', 'USD', '1000000001', 'CTA-DET-0001',
   'CLI-0001', '2026-06-30', '2026-06-30', '08:00:00', 'DEPOSITO',
   'D', 500.00, 0.00, 500.00, 'BATCH', 'SISTEMA', 'REF-20260630-001',
   'PROCESADA', 'IROJAS94'),
  (900002, 'NRR00002', '001', '01', 'USD', '1000000002', 'CTA-DET-0002',
   'CLI-0002', '2026-06-30', '2026-06-30', '08:05:00', 'RETIRO',
   'C', 300.00, 0.00, -300.00, 'BATCH', 'SISTEMA', 'REF-20260630-002',
   'PROCESADA', 'IROJAS94'),
  (900003, 'NRR00003', '001', '01', 'USD', '1000000003', 'CTA-DET-0003',
   'CLI-0003', '2026-06-30', '2026-06-30', '08:10:00', 'DEPOSITO',
   'D', 1000.00, 0.00, 1000.00, 'BATCH', 'SISTEMA', 'REF-20260630-003',
   'PROCESADA', 'IROJAS94'),
  (900004, 'NRR00004', '001', '01', 'USD', '1000000007', 'CTA-DET-0007',
   'CLI-0004', '2026-06-30', '2026-06-30', '08:15:00', 'RETIRO',
   'C', 200.00, 0.00, -200.00, 'BATCH', 'SISTEMA', 'REF-20260630-004',
   'PROCESADA', 'IROJAS94'),
  -- Respaldo historico de las partidas en transito (TTRAN) de las cuentas
  -- PARCIAL (1000000004, 1000000005, 1000000008) y NO_CONCILIADA
  -- (1000000006).
  (900005, 'NRR00005', '001', '01', 'USD', '1000000004', 'CTA-DET-0004',
   'CLI-0005', '2026-06-30', '2026-06-30', '09:00:00', 'TRANSFERENCIA',
   'D', 20.00, 0.00, 20.00, 'BATCH', 'SISTEMA', 'REF-20260630-005',
   'PROCESADA', 'IROJAS94'),
  (900006, 'NRR00006', '001', '01', 'USD', '1000000005', 'CTA-DET-0005',
   'CLI-0006', '2026-06-30', '2026-06-30', '09:05:00', 'TRANSFERENCIA',
   'C', 30.00, 0.00, -30.00, 'BATCH', 'SISTEMA', 'REF-20260630-006',
   'PROCESADA', 'IROJAS94'),
  (900007, 'NRR00007', '001', '01', 'USD', '1000000006', 'CTA-DET-0006',
   'CLI-0007', '2026-06-30', '2026-06-30', '09:10:00', 'TRANSFERENCIA',
   'D', 100.00, 0.00, 100.00, 'BATCH', 'SISTEMA', 'REF-20260630-007',
   'PROCESADA', 'IROJAS94'),
  (900008, 'NRR00008', '001', '01', 'USD', '1000000008', 'CTA-DET-0008',
   'CLI-0008', '2026-06-30', '2026-06-30', '09:15:00', 'TRANSFERENCIA',
   'D', 80.00, 0.00, 80.00, 'BATCH', 'SISTEMA', 'REF-20260630-008',
   'PROCESADA', 'IROJAS94'),
  (900009, 'NRR00009', '001', '01', 'USD', '1000000008', 'CTA-DET-0008B',
   'CLI-0009', '2026-06-30', '2026-06-30', '09:20:00', 'TRANSFERENCIA',
   'C', 60.00, 0.00, -60.00, 'BATCH', 'SISTEMA', 'REF-20260630-009',
   'PROCESADA', 'IROJAS94');

--------------------------------------------------------------------------------
-- TRDSC: descripcion de las partidas en transito (NRR00005..NRR00009),
-- leida por GLMOVPINI/GLMOVPNXT (GLCONCIL) para el detalle de cada partida.
--------------------------------------------------------------------------------
INSERT INTO IROJAS941.TRDSC
  (NUMERO_REGISTRO_RELATIVO, SECUENCIA, TIPO_DESCRIPCION, TEXTO_DESCRIPCION,
   CODIGO_IDIOMA, FORMATO_SALIDA, OBLIGATORIO, USUARIO_CREACION)
VALUES
  ('NRR00005', 1, 'TRANSITO',
   'Partida en transito pendiente de aplicar al saldo GLBLN de la cuenta 1000000004',
   'ES', 'TEXTO', FALSE, 'IROJAS94'),
  ('NRR00006', 1, 'TRANSITO',
   'Partida en transito pendiente de aplicar al saldo GLBLN de la cuenta 1000000005',
   'ES', 'TEXTO', FALSE, 'IROJAS94'),
  ('NRR00007', 1, 'TRANSITO',
   'Partida en transito pendiente de aplicar al saldo GLBLN de la cuenta 1000000006',
   'ES', 'TEXTO', FALSE, 'IROJAS94'),
  ('NRR00008', 1, 'TRANSITO',
   'Partida en transito pendiente de aplicar al saldo GLBLN de la cuenta 1000000008 (debito)',
   'ES', 'TEXTO', FALSE, 'IROJAS94'),
  ('NRR00009', 1, 'TRANSITO',
   'Partida en transito pendiente de aplicar al saldo GLBLN de la cuenta 1000000008 (credito)',
   'ES', 'TEXTO', FALSE, 'IROJAS94');

--------------------------------------------------------------------------------
-- TTRAN: movimientos del dia 2026-06-30, pendientes de aplicar al saldo
-- GLBLN. Cada fila referencia su respaldo historico en TRANS via
-- NUMERO_REGISTRO_RELATIVO (FK TTRAN_FK_TRANS).
--------------------------------------------------------------------------------
INSERT INTO IROJAS941.TTRAN
  (ID_TRANSACCION_DIA, NUMERO_REGISTRO_RELATIVO, CODIGO_BANCO, CODIGO_SUCURSAL,
   CODIGO_MONEDA, CUENTA_CONTABLE, NUMERO_CUENTA, ID_CLIENTE, FECHA,
   FECHA_VALOR, HORA_OPERACION, TIPO_MOVIMIENTO, DEBITO_CREDITO, MONTO,
   SALDO_ANTERIOR, SALDO_POSTERIOR, CANAL_ORIGEN, TERMINAL_ORIGEN,
   REFERENCIA_EXTERNA, ESTADO_TRANSACCION, USUARIO_CREACION)
VALUES
  -- 1000000004: PARCIAL (D 20.00 -> diferenciaNeta = -20.00, dentro de
  -- pTolerancia = 50.00).
  (700005, 'NRR00005', '001', '01', 'USD', '1000000004', 'CTA-DET-0004',
   'CLI-0005', '2026-06-30', '2026-06-30', '09:00:00', 'TRANSFERENCIA',
   'D', 20.00, 0.00, 20.00, 'BATCH', 'SISTEMA', 'REF-20260630-005',
   'PENDIENTE', 'IROJAS94'),
  -- 1000000005: PARCIAL (C 30.00 -> diferenciaNeta = +30.00, dentro de
  -- pTolerancia = 50.00).
  (700006, 'NRR00006', '001', '01', 'USD', '1000000005', 'CTA-DET-0005',
   'CLI-0006', '2026-06-30', '2026-06-30', '09:05:00', 'TRANSFERENCIA',
   'C', 30.00, 0.00, -30.00, 'BATCH', 'SISTEMA', 'REF-20260630-006',
   'PENDIENTE', 'IROJAS94'),
  -- 1000000006: NO_CONCILIADA (D 100.00 -> diferenciaNeta = -100.00,
  -- excede pTolerancia = 50.00).
  (700007, 'NRR00007', '001', '01', 'USD', '1000000006', 'CTA-DET-0006',
   'CLI-0007', '2026-06-30', '2026-06-30', '09:10:00', 'TRANSFERENCIA',
   'D', 100.00, 0.00, 100.00, 'BATCH', 'SISTEMA', 'REF-20260630-007',
   'PENDIENTE', 'IROJAS94'),
  -- 1000000008: PARCIAL (D 80.00 + C 60.00 -> diferenciaNeta = -20.00,
  -- dentro de pTolerancia = 50.00).
  (700008, 'NRR00008', '001', '01', 'USD', '1000000008', 'CTA-DET-0008',
   'CLI-0008', '2026-06-30', '2026-06-30', '09:15:00', 'TRANSFERENCIA',
   'D', 80.00, 0.00, 80.00, 'BATCH', 'SISTEMA', 'REF-20260630-008',
   'PENDIENTE', 'IROJAS94'),
  (700009, 'NRR00009', '001', '01', 'USD', '1000000008', 'CTA-DET-0008B',
   'CLI-0009', '2026-06-30', '2026-06-30', '09:20:00', 'TRANSFERENCIA',
   'C', 60.00, 0.00, -60.00, 'BATCH', 'SISTEMA', 'REF-20260630-009',
   'PENDIENTE', 'IROJAS94');

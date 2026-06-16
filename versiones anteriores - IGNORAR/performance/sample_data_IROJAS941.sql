-- sample_data_IROJAS941.sql
-- Datos de prueba para Fase 2 (esquema IROJAS941)
-- Inserta filas de ejemplo en GLMST, GLBLN y TRANS para pruebas de EXPLAIN/consulta/JSON.

SET SCHEMA IROJAS941;

-- Limpiar registros de prueba previos (usa referencia_externa con prefijo SAMPLE_)
DELETE FROM IROJAS941.TRANS WHERE referencia_externa LIKE 'SAMPLE_%';
DELETE FROM IROJAS941.GLBLN WHERE observaciones LIKE 'SAMPLE_%';
DELETE FROM IROJAS941.GLMST WHERE observaciones LIKE 'SAMPLE_%';
-- Insertar cuentas en GLMST (maestro de cuentas contables)
INSERT INTO IROJAS941.GLMST (codigo_banco, codigo_moneda, cuenta_contable, descripcion_cuenta, naturaleza_cuenta, nivel_cuenta, saldo_actual, fecha_proceso_sistema, observaciones, usuario_creacion, created_at)
VALUES
('B001','USD','100-001-0001','Caja y Bancos - Cuenta Principal','A','1',0.00, TIMESTAMP('2026-06-12 00:00:00'), 'SAMPLE_CUENTA_1', 'tests', CURRENT TIMESTAMP);

INSERT INTO IROJAS941.GLMST (codigo_banco, codigo_moneda, cuenta_contable, descripcion_cuenta, naturaleza_cuenta, nivel_cuenta, saldo_actual, fecha_proceso_sistema, observaciones, usuario_creacion, created_at)
VALUES
('B001','USD','200-010-0050','Cuentas por Pagar - Proveedores','P','1',0.00, TIMESTAMP('2026-06-12 00:00:00'), 'SAMPLE_CUENTA_2', 'tests', CURRENT TIMESTAMP);

-- Insertar balances en GLBLN (balances generales)
INSERT INTO IROJAS941.GLBLN (codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable, descripcion_cuenta, naturaleza_cuenta, nivel_cuenta, saldo_actual, fecha_proceso_sistema, observaciones, usuario_creacion, created_at)
VALUES
('B001','S01','USD','100-001-0001','Caja y Bancos - Cuenta Principal','A','1',1250.50, TIMESTAMP('2026-06-11 00:00:00'), 'SAMPLE_BAL_1', 'tests', CURRENT TIMESTAMP);

INSERT INTO IROJAS941.GLBLN (codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable, descripcion_cuenta, naturaleza_cuenta, nivel_cuenta, saldo_actual, fecha_proceso_sistema, observaciones, usuario_creacion, created_at)
VALUES
('B001','S01','USD','200-010-0050','Cuentas por Pagar - Proveedores','P','1',-500.00, TIMESTAMP('2026-06-11 00:00:00'), 'SAMPLE_BAL_2', 'tests', CURRENT TIMESTAMP);

-- Insertar transacciones en TRANS (varias filas por cuenta para agregación)
INSERT INTO IROJAS941.TRANS (
  numero_registro_relativo, codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable, numero_cuenta, id_cliente, fecha_operacion, fecha_valor, hora_operacion, tipo_movimiento, debito_credito, monto, saldo_anterior, saldo_posterior, canal_origen, terminal_origen, referencia_externa, estado_transaccion, usuario_creacion, created_at
) VALUES
('RR1001','B001','S01','USD','100-001-0001','ACC1001','CUST001', DATE('2026-06-11'), DATE('2026-06-11'),'10:01','DEP','D',500.00,750.50,1250.50,'ONLINE','TERM01','SAMPLE_DEP_001','COMPLETED','tests',CURRENT TIMESTAMP);

INSERT INTO IROJAS941.TRANS (
  numero_registro_relativo, codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable, numero_cuenta, id_cliente, fecha_operacion, fecha_valor, hora_operacion, tipo_movimiento, debito_credito, monto, saldo_anterior, saldo_posterior, canal_origen, terminal_origen, referencia_externa, estado_transaccion, usuario_creacion, created_at
) VALUES
('RR1002','B001','S01','USD','100-001-0001','ACC1001','CUST001', DATE('2026-06-11'), DATE('2026-06-11'),'11:15','PAY','C',300.00,1250.50,950.50,'POS','TERM02','SAMPLE_PAY_001','COMPLETED','tests',CURRENT TIMESTAMP);

INSERT INTO IROJAS941.TRANS (
  numero_registro_relativo, codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable, numero_cuenta, id_cliente, fecha_operacion, fecha_valor, hora_operacion, tipo_movimiento, debito_credito, monto, saldo_anterior, saldo_posterior, canal_origen, terminal_origen, referencia_externa, estado_transaccion, usuario_creacion, created_at
) VALUES
('RR1003','B001','S01','USD','100-001-0001','ACC1001','CUST002', DATE('2026-06-11'), DATE('2026-06-11'),'12:30','DEP','D',450.50,500.00,950.50,'ONLINE','TERM03','SAMPLE_DEP_002','COMPLETED','tests',CURRENT TIMESTAMP);

INSERT INTO IROJAS941.TRANS (
  numero_registro_relativo, codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable, numero_cuenta, id_cliente, fecha_operacion, fecha_valor, hora_operacion, tipo_movimiento, debito_credito, monto, saldo_anterior, saldo_posterior, canal_origen, terminal_origen, referencia_externa, estado_transaccion, usuario_creacion, created_at
) VALUES
('RR2001','B001','S01','USD','200-010-0050','ACC2001','SUPP001', DATE('2026-06-11'), DATE('2026-06-11'),'09:00','INVOICE','C',500.00,0.00,-500.00,'BATCH','TERM10','SAMPLE_INV_001','COMPLETED','tests',CURRENT TIMESTAMP);
-- Verificación rápida: mostrar conteos (opcional, ejecutar manualmente)
-- SELECT COUNT(*) FROM IROJAS941.GLMST WHERE observaciones LIKE 'SAMPLE_%';
-- SELECT COUNT(*) FROM IROJAS941.GLBLN WHERE observaciones LIKE 'SAMPLE_%';
-- SELECT COUNT(*) FROM IROJAS941.TRANS WHERE referencia_externa LIKE 'SAMPLE_%';

-- Fin del script de datos de prueba

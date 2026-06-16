# -*- coding: utf-8 -*-
"""
Especificaciones de metadata por tabla para gen_novasrc_sql.py (Fase A.2).

Cada entrada de TABLE_SPECS provee los campos de metadata (Objetivo, Tipo de
Tabla, Origen de los Datos, Permanencia de Datos, Uso de los datos), el LABEL
ON TABLE y el COMMENT ON TABLE, y opcionalmente la lista de FK a declarar
(fks), para una tabla del "resto del esquema" (Fase A.2, completitud DBA).
"""

SCOPE_NOTE = (
    "Completar el esquema documentado en estructura_bd.md ({modulo}) bajo el "
    "alcance de completitud de base de datos del taller. No es consultada "
    "directamente por los modulos RPGLE de GLCNC001."
)

USO_NOTE = (
    "Tabla de completitud del esquema (alcance DBA), disponible para futuras "
    "consultas del taller. No es leida actualmente por los modulos RPGLE de "
    "GLCNC001 (RF-01/RF-02/RF-03)."
)

ORIGEN_PARAM = (
    "Mantenimiento administrativo / parametrizacion del sistema core bancario "
    "(carga manual o por proceso de configuracion)."
)

ORIGEN_BATCH = (
    "Sistema transaccional (core bancario), generado por procesos batch del "
    "dia operativo."
)

ORIGEN_HIST = (
    "Sistema transaccional (core bancario); registros consolidados desde el "
    "proceso operativo correspondiente."
)

ORIGEN_CLIENTE = (
    "Sistema transaccional (core bancario); mantenimiento de datos de clientes "
    "mediante procesos de apertura, actualizacion y gestion de relaciones."
)


def _spec(modulo, tipo_tabla, origen, permanencia, label_tabla, comment_tabla, fks=None):
    return {
        "objetivo": SCOPE_NOTE.format(modulo=modulo),
        "tipo_tabla": tipo_tabla,
        "origen": origen,
        "permanencia": permanencia,
        "uso": USO_NOTE,
        "label_tabla": label_tabla,
        "comment_tabla": comment_tabla,
        "fks": fks or [],
    }


ORIGEN_CUENTA = (
    "Sistema transaccional (core bancario), generado por procesos de apertura "
    "y operacion diaria de cuentas de detalle."
)

ORIGEN_CREDITO = (
    "Sistema transaccional (core bancario), generado por procesos de "
    "otorgamiento y administracion de prestamos, certificados, giros y "
    "valores al cobro."
)

ORIGEN_COMEX = (
    "Sistema transaccional (core bancario), generado por procesos de "
    "comercio exterior: emision, negociacion y liquidacion de cartas de "
    "credito y cobranzas documentarias."
)

ORIGEN_CONTABLE = (
    "Sistema transaccional (core bancario), generado por los procesos "
    "contables (batch de fin de dia, asientos automaticos y consolidacion "
    "de balances)."
)

ORIGEN_GARANTIA = (
    "Sistema transaccional (core bancario), generado por procesos de "
    "constitucion, avaluo y administracion de garantias asociadas a "
    "operaciones de credito."
)

ORIGEN_LINEA = (
    "Sistema transaccional (core bancario), generado por procesos de "
    "otorgamiento y administracion de lineas de credito a clientes."
)

ORIGEN_ACTIVOFIJO = (
    "Mantenimiento administrativo del area de Activos Fijos / "
    "Contabilidad, generado por procesos de adquisicion, depreciacion y "
    "control de activos fijos del banco."
)

ORIGEN_CXP = (
    "Sistema transaccional (core bancario), generado por procesos de "
    "cuentas por pagar a proveedores: registro de facturas, amortizaciones "
    "y pagos."
)

ORIGEN_PAGOS = (
    "Sistema transaccional (core bancario), generado por procesos de pagos "
    "y transferencias a clientes y terceros (ordenes de pago, Swift, Telex)."
)

ORIGEN_PROPUESTA = (
    "Sistema transaccional (core bancario), generado por el area de "
    "analisis y riesgo de credito durante el proceso de evaluacion y "
    "aprobacion de propuestas de credito."
)

ORIGEN_DOC = (
    "Mantenimiento administrativo / operativo, generado por los procesos "
    "de gestion documental asociados a cuentas y expedientes de clientes "
    "(catalogacion y control de recepcion de documentos)."
)

ORIGEN_SEGURIDAD = (
    "Mantenimiento administrativo, generado por el area de seguridad / "
    "administracion del sistema al definir perfiles y autorizaciones de "
    "usuarios por menu y opcion."
)

M1 = "Modulo 1 - Archivos Comunes"
M2 = "Modulo 2 - Clientes"
M3 = "Modulo 3 - Cuentas de Detalle/Chequeras"
M4 = "Modulo 4 - Contratos/Certificados/Giros/Valores al Cobro"
M5 = "Modulo 5 - Cartas de Credito"
M6 = "Modulo 6 - Cobranzas"
M7 = "Modulo 7 - Contabilidad"
M8 = "Modulo 8 - Garantias"
M9 = "Modulo 9 - Lineas de Credito"
M10 = "Modulo 10 - Activos Fijos"
M11 = "Modulo 11 - Proveedores y Cuentas por Pagar"
M12 = "Modulo 12 - Pagos y Transferencias"
M13 = "Modulo 13 - Propuesta de Credito"
M14 = "Modulo 14 - Manejo de Documentos"
M15 = "Modulo 15 - Seguridad"

TABLE_SPECS = {
    "CNOFT": _spec(
        M1, "Catalogo / Parametros generales", ORIGEN_PARAM, "Permanente",
        "Maestro Tablas Comunes",
        "Catalogo general de valores parametrizables del sistema, identificados "
        "por codigo de tabla e idioma. Funciona como tabla de dominio reutilizable "
        "por otros procesos."
    ),
    "CNOFC": _spec(
        M1, "Catalogo / Referencias del sistema", ORIGEN_PARAM, "Permanente",
        "Referencias del Sistema",
        "Referencias del sistema o de datos comunes, identificadas por codigo de "
        "tabla y codigo de registro. Tabla de dominio reutilizable por otros "
        "procesos."
    ),
    "MLNCT": _spec(
        M1, "Catalogo / Configuracion", ORIGEN_PARAM, "Permanente",
        "Formatos Notificacion Cliente",
        "Patrones y formatos de notificaciones a clientes, parametrizados por "
        "banco, codigo de notificacion, nivel, idioma y secuencia."
    ),
    "MLNOT": _spec(
        M1, "Transaccional / Operativo", ORIGEN_BATCH,
        "Temporal (vigente hasta su paso a historico en HSNOT)",
        "Datos Notificacion Pendiente",
        "Datos a imprimir en la notificacion del dia, identificados por banco, "
        "fecha de proceso, numero de cuenta, codigo de notificacion y nivel. Se "
        "consolida en HSNOT tras su impresion."
    ),
    "HSNOT": _spec(
        M1, "Historico", ORIGEN_HIST, "Permanente (historico)",
        "Historico Notificaciones",
        "Historico de datos impresos en notificaciones, identificado por banco, "
        "fecha de proceso, numero de cuenta, codigo de notificacion y nivel."
    ),
    "HEAD": _spec(
        M1, "Catalogo", ORIGEN_PARAM, "Permanente",
        "Titulos de Reportes",
        "Catalogo de titulos de reportes, identificados por el nombre del printer "
        "file y un numero de secuencia de linea de titulo."
    ),
    "MSSGS": _spec(
        M1, "Catalogo de mensajes de sistema", ORIGEN_PARAM, "Permanente",
        "Mensajes de Error",
        "Catalogo de mensajes de error del sistema. La tabla no define una clave "
        "natural en estructura_bd.md, por lo que utiliza la columna ID como "
        "llave primaria tecnica (surrogate key)."
    ),
    "HOLYD": _spec(
        M1, "Catalogo", ORIGEN_PARAM, "Permanente",
        "Calendario de Feriados",
        "Calendario de feriados por moneda y fecha, utilizado para validaciones "
        "de dias habiles en procesos batch."
    ),
    "APCLS": _spec(
        M1, "Maestro", ORIGEN_PARAM, "Permanente",
        "Maestro de Productos",
        "Maestro de productos del banco, identificados por codigo de banco y "
        "codigo de producto."
    ),
    "RATES": _spec(
        M1, "Maestro / Parametros", ORIGEN_PARAM, "Permanente",
        "Tasas de Cambio",
        "Tasas de cambio (posicion / contravalor) vigentes por banco y moneda."
    ),
    "RTRNS": _spec(
        M1, "Historico", ORIGEN_HIST, "Permanente (historico)",
        "Historico Tasas de Cambio",
        "Historico de tasas de cambio por banco, moneda y fecha."
    ),
    "HLHIS": _spec(
        M1, "Historico", ORIGEN_HIST, "Permanente (historico)",
        "Historico Cambios Retencion",
        "Historico de cambios aplicados sobre retenciones. La tabla no define una "
        "clave natural en estructura_bd.md, por lo que utiliza la columna ID como "
        "llave primaria tecnica (surrogate key)."
    ),
    "PRENA": _spec(
        M1, "Catalogo / Documentacion tecnica", ORIGEN_PARAM, "Permanente",
        "Desc Programas EN",
        "Descripciones de programas del sistema en idioma ingles, identificadas "
        "por el nombre del programa."
    ),
    "PRENS": _spec(
        M1, "Catalogo / Documentacion tecnica", ORIGEN_PARAM, "Permanente",
        "Desc Programas ES",
        "Descripciones de programas del sistema en idioma espanol, identificadas "
        "por el nombre del programa."
    ),
    "UT500": _spec(
        M1, "Transaccional / Operativo", ORIGEN_BATCH, "Permanente",
        "Agenda Personalizada",
        "Agenda personalizada por usuario y fecha, de uso operativo."
    ),
    "UT510": _spec(
        M1, "Transaccional / Operativo", ORIGEN_BATCH, "Permanente",
        "Mensajes de Usuario",
        "Mensajes dirigidos a usuarios del sistema, identificados por codigo de "
        "usuario y fecha."
    ),
    "MICRF": _spec(
        M1, "Catalogo / Control de archivado", ORIGEN_PARAM, "Permanente",
        "Reportes en Microficha",
        "Control de reportes salvados en microficha, identificados por tipo de "
        "formulario, nombre del reporte y secuencia."
    ),
    "IBSDD": _spec(
        M1, "Diccionario tecnico", ORIGEN_PARAM, "Permanente",
        "Diccionario de Datos IBS",
        "Diccionario de datos del sistema IBS. La tabla no define una clave "
        "natural en estructura_bd.md, por lo que utiliza la columna ID como "
        "llave primaria tecnica (surrogate key)."
    ),
    "IBTBL": _spec(
        M1, "Catalogo / Cruce", ORIGEN_PARAM, "Permanente",
        "Referencias Cruzadas Intersuc",
        "Referencias cruzadas para el manejo de operaciones intersucursales. La "
        "tabla no define una clave natural en estructura_bd.md, por lo que "
        "utiliza la columna ID como llave primaria tecnica (surrogate key)."
    ),
    "CIFXF": _spec(
        M1, "Relacion / Cruce", ORIGEN_BATCH, "Permanente",
        "Relacion Operaciones Cliente",
        "Relacion de operaciones con clientes. La tabla no define una clave "
        "natural en estructura_bd.md, por lo que utiliza la columna ID como "
        "llave primaria tecnica (surrogate key)."
    ),
    "CNTRLCNT": _spec(
        M1, "Control / Parametros", ORIGEN_PARAM, "Permanente",
        "Parametros Generales Sistema",
        "Parametros generales del sistema, identificados por codigo de banco."
    ),
    "CNTRLBRN": _spec(
        M1, "Maestro / Control", ORIGEN_PARAM, "Permanente",
        "Maestro de Sucursales",
        "Maestro de sucursales por banco, identificado por codigo de banco y "
        "codigo de sucursal."
    ),
    "CNTRLNUM": _spec(
        M1, "Control / Parametros", ORIGEN_PARAM, "Permanente",
        "Control Numeracion Automatica",
        "Control de numeracion automatica de operaciones, identificado por "
        "codigo de aplicacion y tipo de cuenta."
    ),
    "CNTRLTAX": _spec(
        M1, "Control / Parametros", ORIGEN_PARAM, "Permanente",
        "Definiciones Cobro Impuestos",
        "Definiciones para el manejo del cobro de impuestos, identificadas por "
        "codigo de banco y codigo de impuesto."
    ),

    # ------------------------------------------------------------------
    # Modulo 2 - Clientes
    # ------------------------------------------------------------------
    "CUMST": _spec(
        M2, "Maestro", ORIGEN_CLIENTE, "Permanente",
        "Maestro de Clientes",
        "Maestro de clientes del banco, identificado por id_cliente. Contiene "
        "datos de identificacion, contacto y demograficos utilizados como "
        "referencia conceptual desde otros modulos del esquema (por ejemplo "
        "CUMAD, CUMSD, SPINS, ACMST, DEALS, LCMST, entre otros)."
    ),
    "CUMAD": _spec(
        M2, "Transaccional / Detalle", ORIGEN_CLIENTE, "Permanente",
        "Direcciones y Beneficiarios",
        "Direcciones de correo y beneficiarios de operaciones/clientes, "
        "identificados por id_cliente_operacion, tipo_registro y secuencia. "
        "FK hacia CUMST.id_cliente.",
        fks=[{
            "name": "CUMST",
            "cols": ["ID_CLIENTE_OPERACION"],
            "ref_table": "CUMST",
            "ref_cols": ["ID_CLIENTE"],
        }],
    ),
    "CUMPR": _spec(
        M2, "Catalogo", ORIGEN_PARAM, "Permanente",
        "Palabras Reservadas Busqueda",
        "Catalogo de palabras reservadas que se omiten en la busqueda de "
        "clientes por cadena de caracteres, identificadas por la palabra."
    ),
    "CUMSD": _spec(
        M2, "Indice / Busqueda", ORIGEN_CLIENTE, "Permanente",
        "Busqueda de Clientes",
        "Indice de clientes para busqueda por cadena de caracteres, "
        "identificado por id_cliente. FK hacia CUMST.id_cliente.",
        fks=[{
            "name": "CUMST",
            "cols": ["ID_CLIENTE"],
            "ref_table": "CUMST",
            "ref_cols": ["ID_CLIENTE"],
        }],
    ),
    "SPINS": _spec(
        M2, "Catalogo / Parametros", ORIGEN_CLIENTE, "Permanente",
        "Instrucciones Especiales",
        "Instrucciones especiales (usos) asociadas a un cliente o cuenta, "
        "identificadas por tipo_informacion, cuenta_o_cliente y secuencia. La "
        "columna cuenta_o_cliente es una referencia conceptual a "
        "CUMST.id_cliente o ACMST.numero_cuenta segun el tipo_informacion "
        "(sin FK declarada por tratarse de una referencia ambigua a dos "
        "tablas distintas)."
    ),

    # ------------------------------------------------------------------
    # Modulo 3 - Cuentas de Detalle/Chequeras
    # ------------------------------------------------------------------
    "ACMST": _spec(
        M3, "Maestro", ORIGEN_CUENTA, "Permanente",
        "Maestro de Cuentas Detalle",
        "Maestro de cuentas de detalle (cuentas de ahorro, corriente, entre "
        "otras) del banco. La tabla no define una clave natural en "
        "estructura_bd.md, por lo que utiliza la columna ID como llave "
        "primaria tecnica (surrogate key). Es referenciada conceptualmente "
        "desde otras tablas del modulo (STPMT, UNCOL, PBTRN, RCLNB, CHMST, "
        "CHSTS, CMRIN, OVDRF, SPINS) a traves de numero_cuenta, sin FK "
        "declarada por no existir dicha columna en ACMST."
    ),
    "STPMT": _spec(
        M3, "Transaccional / Operativo", ORIGEN_CUENTA, "Permanente",
        "Ordenes No Pago Cheques",
        "Ordenes de no pago (stop payment) sobre cheques, identificadas por "
        "codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable, "
        "numero_cuenta y secuencia. La columna numero_cuenta es una "
        "referencia conceptual a ACMST (sin FK declarada por no existir "
        "dicha columna en ACMST)."
    ),
    "UNCOL": _spec(
        M3, "Maestro", ORIGEN_CUENTA, "Permanente",
        "Maestro de Retenciones",
        "Maestro de retenciones (holds) aplicadas sobre cuentas, "
        "identificado por codigo_banco, codigo_sucursal y numero_cuenta. La "
        "columna numero_cuenta es una referencia conceptual a ACMST (sin FK "
        "declarada por no existir dicha columna en ACMST)."
    ),
    "PBTRN": _spec(
        M3, "Transaccional / Operativo", ORIGEN_CUENTA,
        "Permanente (historico)",
        "Transacciones Libreta Ahorro",
        "Transacciones registradas en libretas de ahorro (passbook), "
        "identificadas por numero_cuenta, fecha y hora. La columna "
        "numero_cuenta es una referencia conceptual a ACMST (sin FK "
        "declarada por no existir dicha columna en ACMST)."
    ),
    "OFMST": _spec(
        M3, "Maestro / Transaccional", ORIGEN_CUENTA, "Permanente",
        "Cheques Certificados Gerencia",
        "Maestro de cheques certificados y cheques de gerencia, identificado "
        "por codigo_banco, codigo_sucursal y numero_cheque."
    ),
    "RCLNB": _spec(
        M3, "Transaccional / Operativo", ORIGEN_CUENTA,
        "Permanente (historico)",
        "Transacciones Ctas Reconciliables",
        "Transacciones de cuentas reconciliables (cuentas puente), "
        "identificadas por codigo_banco, codigo_sucursal, codigo_moneda, "
        "cuenta_contable, numero_cuenta y fecha. La columna numero_cuenta es "
        "una referencia conceptual a ACMST (sin FK declarada por no existir "
        "dicha columna en ACMST)."
    ),
    "TLMST": _spec(
        M3, "Maestro", ORIGEN_PARAM, "Permanente",
        "Maestro de Cajeros",
        "Maestro de cajeros (tellers) del banco, identificado por "
        "codigo_de_cajero y codigo_moneda."
    ),
    "TDRCR": _spec(
        M3, "Maestro / Catalogo", ORIGEN_PARAM, "Permanente",
        "Maestro Transacciones Cajero",
        "Catalogo de transacciones de cajero (debito/credito, "
        "efectivo/cheque, entre otras), identificado por "
        "codigo_de_transaccion."
    ),
    "AUDIT": _spec(
        M3, "Transaccional / Operativo", ORIGEN_BATCH,
        "Permanente (historico)",
        "Detalle Diario Transacciones Caja",
        "Detalle diario de transacciones de caja realizadas por cajeros, "
        "identificado por codigo_banco, codigo_sucursal, codigo_cajero, "
        "codigo_moneda y numero_referencia."
    ),
    "CHMST": _spec(
        M3, "Maestro", ORIGEN_CUENTA, "Permanente",
        "Maestro de Chequeras",
        "Maestro de chequeras emitidas, identificado por codigo_banco, "
        "codigo_sucursal, codigo_moneda, numero_cuenta y cheque_inicial. La "
        "columna numero_cuenta es una referencia conceptual a ACMST (sin FK "
        "declarada por no existir dicha columna en ACMST)."
    ),
    "CHPER": _spec(
        M3, "Transaccional / Configuracion", ORIGEN_CUENTA, "Permanente",
        "Personalizacion Chequeras",
        "Personalizacion de chequeras por cuenta, identificada por "
        "codigo_banco, codigo_sucursal y numero_cuenta. Las columnas "
        "codigo_banco, codigo_sucursal y numero_cuenta son una referencia "
        "conceptual a CHMST (sin FK declarada, ya que numero_cuenta en CHMST "
        "forma parte de una clave compuesta de 5 columnas y no constituye "
        "una clave referenciable de forma individual)."
    ),
    "CHSTS": _spec(
        M3, "Transaccional / Operativo", ORIGEN_CUENTA,
        "Permanente (historico)",
        "Cambio Estatus Cuentas Detalle",
        "Historico de cambios de estatus aplicados a cuentas de detalle, "
        "identificado por codigo_banco, codigo_sucursal, codigo_moneda, "
        "cuenta_contable y numero_cuenta."
    ),
    "DEVOL": _spec(
        M3, "Transaccional / Operativo", ORIGEN_CUENTA,
        "Permanente (historico)",
        "Detalle Cheques Devueltos",
        "Detalle de cheques devueltos, identificado por numero_cuenta y "
        "numero_cheque."
    ),
    "CMRIN": _spec(
        M3, "Transaccional / Detalle", ORIGEN_CUENTA,
        "Permanente (historico)",
        "Detalle Camara Entrante",
        "Detalle de operaciones de camara de compensacion entrante, "
        "identificado por codigo_banco, codigo_sucursal, codigo_moneda, "
        "numero_cuenta y monto. La columna numero_cuenta es una referencia "
        "conceptual a ACMST (sin FK declarada por no existir dicha columna "
        "en ACMST)."
    ),
    "OVDRF": _spec(
        M3, "Transaccional / Diario", ORIGEN_CUENTA,
        "Permanente (historico)",
        "Archivo Diario Sobregiros",
        "Archivo diario de cuentas en sobregiro. La tabla no define una "
        "clave natural en estructura_bd.md, por lo que utiliza la columna ID "
        "como llave primaria tecnica (surrogate key). La referencia a la "
        "cuenta es conceptual a ACMST (sin FK declarada por no existir una "
        "columna numero_cuenta en ACMST)."
    ),
    "CNTRLMSG": _spec(
        M3, "Catalogo / Parametros", ORIGEN_PARAM, "Permanente",
        "Mensajes Estados de Cuenta",
        "Mensajes parametrizables a imprimir en los estados de cuenta, "
        "identificados por codigo_banco."
    ),
    "CNTRLRTE": _spec(
        M3, "Catalogo / Parametros", ORIGEN_PARAM, "Permanente",
        "Tasas Cargos Cuentas Detalle",
        "Tasas y cargos por servicio aplicables a cuentas de detalle, "
        "identificados por codigo_banco, tipo_producto y codigo_tabla."
    ),
    "CNTRLDEV": _spec(
        M3, "Catalogo", ORIGEN_PARAM, "Permanente",
        "Causales Devolucion Cheques",
        "Catalogo de causales de devolucion de cheques, identificado por "
        "codigo_causal."
    ),

    # ------------------------------------------------------------------
    # Modulo 4 - Contratos/Certificados/Giros/Valores al Cobro
    # ------------------------------------------------------------------
    "DEALS": _spec(
        M4, "Maestro", ORIGEN_CREDITO, "Permanente",
        "Maestro de Prestamos y Valores",
        "Maestro de prestamos, certificados, giros, valores al cobro e "
        "inversiones del banco. La tabla no define una clave natural en "
        "estructura_bd.md, por lo que utiliza la columna ID como llave "
        "primaria tecnica (surrogate key). Es referenciada conceptualmente "
        "desde otras tablas del modulo (DLPMT, DLDRF, DLSDE, DDCPN, DLITP) a "
        "traves de numero_prestamo, sin FK declarada por no existir dicha "
        "columna en DEALS."
    ),
    "DLPMT": _spec(
        M4, "Transaccional / Operativo", ORIGEN_CREDITO, "Permanente",
        "Plan de Pagos",
        "Plan de pagos de prestamos, identificado por codigo_banco, "
        "codigo_sucursal, codigo_moneda, numero_prestamo, fecha y "
        "tipo_registro. La columna numero_prestamo es una referencia "
        "conceptual a DEALS (sin FK declarada por no existir dicha columna "
        "en DEALS)."
    ),
    "DLDRF": _spec(
        M4, "Transaccional / Detalle", ORIGEN_CREDITO,
        "Permanente (historico)",
        "Detalle Giros y Valores Cobro",
        "Detalle de giros y valores al cobro, identificado por "
        "codigo_banco, codigo_sucursal, codigo_moneda, numero_prestamo, "
        "identificacion y numero_documento. La columna numero_prestamo es "
        "una referencia conceptual a DEALS (sin FK declarada por no existir "
        "dicha columna en DEALS)."
    ),
    "DLSDE": _spec(
        M4, "Transaccional / Detalle", ORIGEN_CREDITO, "Permanente",
        "Deducciones Plan de Pagos",
        "Detalle de deducciones del plan de pagos, identificado por "
        "numero_prestamo, fecha, tipo_registro, secuencia y "
        "codigo_deduccion. La columna numero_prestamo es una referencia "
        "conceptual a DEALS (sin FK declarada por no existir dicha columna "
        "en DEALS)."
    ),
    "DLCLP": _spec(
        M4, "Transaccional / Detalle", ORIGEN_CREDITO, "Permanente",
        "Calificacion y Prevision Cartera",
        "Calificacion y prevision de cartera por cliente, identificada por "
        "id_cliente, numero_cuenta y referencia. FK hacia CUMST.id_cliente.",
        fks=[{
            "name": "CUMST",
            "cols": ["ID_CLIENTE"],
            "ref_table": "CUMST",
            "ref_cols": ["ID_CLIENTE"],
        }],
    ),
    "DDCPN": _spec(
        M4, "Transaccional / Operativo", ORIGEN_CREDITO,
        "Permanente (historico)",
        "Transacciones Pendientes Cobro",
        "Transacciones pendientes de cobro, identificadas por "
        "numero_prestamo. La columna numero_prestamo es una referencia "
        "conceptual a DEALS (sin FK declarada por no existir dicha columna "
        "en DEALS)."
    ),
    "DLITP": _spec(
        M4, "Maestro / Detalle", ORIGEN_CREDITO, "Permanente",
        "Maestro Deducciones Prestamos",
        "Maestro de deducciones de prestamos, identificado por "
        "numero_prestamo y codigo_deduccion. La columna numero_prestamo es "
        "una referencia conceptual a DEALS (sin FK declarada por no existir "
        "dicha columna en DEALS)."
    ),
    "CDRTE": _spec(
        M4, "Catalogo / Parametros", ORIGEN_PARAM, "Permanente",
        "Tasas de Depositos",
        "Tabla de tasas de depositos, identificada por numero_tabla, fecha "
        "y codigo_moneda."
    ),
    "CNTRLDLS": _spec(
        M4, "Catalogo / Parametros", ORIGEN_PARAM, "Permanente",
        "Tasas Control Prestamos",
        "Tabla de tasas para control de prestamos, identificada por "
        "codigo_banco, numero_tabla y tipo_producto."
    ),
    "LCMST": _spec(
        M5, "Maestro", ORIGEN_COMEX, "Permanente",
        "Maestro Cartas de Credito",
        "Maestro de cartas de credito del banco. La tabla no define una "
        "clave natural en estructura_bd.md, por lo que utiliza la columna "
        "ID como llave primaria tecnica (surrogate key). Es referenciada "
        "conceptualmente desde otras tablas del modulo (LCDOC, LCADM, "
        "LCCOV, LCDIN) y del modulo de cobranzas (APPRV, LCFEE) a traves "
        "de numero_carta_credito, sin FK declarada por no existir dicha "
        "columna en LCMST."
    ),
    "LCDOC": _spec(
        M5, "Transaccional / Detalle", ORIGEN_COMEX, "Permanente",
        "Documentos Cartas Credito",
        "Documentos asociados a cartas de credito, identificados por "
        "numero_carta_credito, tipo_registro, codigo_banco, "
        "codigo_documento y numero_linea. La columna numero_carta_credito "
        "es una referencia conceptual a LCMST (sin FK declarada por no "
        "existir dicha columna en LCMST)."
    ),
    "LCFIN": _spec(
        M5, "Catalogo / Configuracion", ORIGEN_PARAM, "Permanente",
        "Indice Formatos Cartas Credito",
        "Indice de formatos de cartas de credito, identificado por nivel, "
        "codigo_documento y secuencia_de_texto."
    ),
    "LCFMT": _spec(
        M5, "Catalogo / Configuracion", ORIGEN_PARAM, "Permanente",
        "Formatos Cartas de Credito",
        "Formatos de cartas de credito, identificados por "
        "codigo_documento, secuencia_de_texto y numero_linea."
    ),
    "LCADM": _spec(
        M5, "Transaccional / Detalle", ORIGEN_COMEX, "Permanente",
        "Enmiendas Cartas de Credito",
        "Enmiendas a cartas de credito, identificadas por "
        "numero_carta_credito y numero_enmienda. La columna "
        "numero_carta_credito es una referencia conceptual a LCMST (sin "
        "FK declarada por no existir dicha columna en LCMST)."
    ),
    "LCCOV": _spec(
        M5, "Transaccional / Detalle", ORIGEN_COMEX, "Permanente (historico)",
        "Negociaciones Cartas Credito",
        "Negociaciones de cartas de credito, identificadas por "
        "numero_carta_credito y secuencia. La columna numero_carta_credito "
        "es una referencia conceptual a LCMST (sin FK declarada por no "
        "existir dicha columna en LCMST)."
    ),
    "LCDIN": _spec(
        M5, "Transaccional / Detalle", ORIGEN_COMEX, "Permanente (historico)",
        "Documentos Recibidos Cartas Credito",
        "Documentos recibidos en cartas de credito, identificados por "
        "numero_carta_credito y secuencia. La columna numero_carta_credito "
        "es una referencia conceptual a LCMST (sin FK declarada por no "
        "existir dicha columna en LCMST)."
    ),
    "LCSTA": _spec(
        M5, "Transaccional / Estadistica", ORIGEN_COMEX, "Permanente (historico)",
        "Estadistica Cartas de Credito",
        "Estadistica de aperturas, enmiendas y pagos de cartas de credito. "
        "La tabla no define una clave natural en estructura_bd.md, por lo "
        "que utiliza la columna ID como llave primaria tecnica (surrogate "
        "key)."
    ),
    "CNTRLLCP": _spec(
        M5, "Catalogo / Parametros", ORIGEN_PARAM, "Permanente",
        "Control Cartas de Credito",
        "Archivo de control de cartas de credito, identificado por "
        "codigo_banco y lcrparm."
    ),
    "CNTRLRLC": _spec(
        M5, "Catalogo / Parametros", ORIGEN_PARAM, "Permanente",
        "Tarifas Cartas de Credito",
        "Tabla de cargos por servicios o tarifas de cartas de credito, "
        "identificada por codigo_banco, tipo_producto y numero_tabla."
    ),
    "DCMST": _spec(
        M6, "Maestro", ORIGEN_COMEX, "Permanente",
        "Maestro Cobranzas Documentarias",
        "Maestro de cobranzas documentarias. La tabla no define una clave "
        "natural en estructura_bd.md, por lo que utiliza la columna ID "
        "como llave primaria tecnica (surrogate key)."
    ),
    "APPRV": _spec(
        M6, "Transaccional / Detalle", ORIGEN_COMEX, "Permanente",
        "Cobranzas Pendientes Aprobacion",
        "Cobranzas pendientes de aprobacion, identificadas por "
        "numero_carta_credito y tipo_registro. La columna "
        "numero_carta_credito es una referencia conceptual a LCMST (sin "
        "FK declarada por no existir dicha columna en LCMST)."
    ),
    "LCFEE": _spec(
        M6, "Transaccional / Detalle", ORIGEN_COMEX, "Permanente",
        "Control Cobro Comisiones",
        "Control de cobro de comisiones, identificado por "
        "numero_carta_credito y codigo_de_comision. La columna "
        "numero_carta_credito es una referencia conceptual a LCMST (sin "
        "FK declarada por no existir dicha columna en LCMST)."
    ),
    "CNTRLRCO": _spec(
        M6, "Catalogo / Parametros", ORIGEN_PARAM, "Permanente",
        "Tarifas Cobranzas",
        "Tabla de cargos por servicios o tarifas de cobranzas, "
        "identificada por codigo_banco, tipo_producto y numero_tabla."
    ),
    "INPUT": _spec(
        M7, "Transaccional / Detalle (derivado)", ORIGEN_CONTABLE, "Permanente",
        "Asientos Contables Aprobados",
        "Archivo de asientos contables aprobados (archivos derivados), "
        "identificado por numero_del_lote y secuencia_dentro_del_lote."
    ),
    "GLBSE": _spec(
        M7, "Transaccional / Resumen", ORIGEN_CONTABLE, "Permanente",
        "Balances Generales Consolidado",
        "Balances generales consolidados. La tabla no define una clave "
        "natural en estructura_bd.md, por lo que utiliza la columna ID "
        "como llave primaria tecnica (surrogate key)."
    ),
    "GLFIN": _spec(
        M7, "Transaccional / Resumen", ORIGEN_CONTABLE, "Permanente",
        "Estados Financieros por Niveles",
        "Estados financieros por niveles. La tabla no define una clave "
        "natural en estructura_bd.md, por lo que utiliza la columna ID "
        "como llave primaria tecnica (surrogate key)."
    ),
    "INPT2": _spec(
        M7, "Transaccional / Detalle", ORIGEN_CONTABLE, "Permanente",
        "Entradas Contables Automaticas",
        "Entradas contables automaticas generadas en el fin de dia. La "
        "tabla no define una clave natural en estructura_bd.md, por lo "
        "que utiliza la columna ID como llave primaria tecnica (surrogate "
        "key)."
    ),
    "NXINP": _spec(
        M7, "Transaccional / Detalle", ORIGEN_CONTABLE, "Permanente",
        "Transacciones Contables Proximo Dia",
        "Transacciones contables del proximo dia, identificadas por "
        "numero_batch y secuencia."
    ),
    "BUMST": _spec(
        M7, "Maestro / Parametros", ORIGEN_CONTABLE, "Permanente",
        "Maestro de Presupuestos",
        "Maestro de presupuestos, identificado por codigo_banco, "
        "codigo_sucursal, codigo_moneda, numero_presupuesto y "
        "centro_costo."
    ),
    "ROCOL": _spec(
        M8, "Maestro", ORIGEN_GARANTIA, "Permanente",
        "Maestro de Garantias",
        "Maestro de garantias del banco, identificado por codigo_banco, "
        "id_cliente y numero_garantia. FK hacia CUMST.id_cliente.",
        fks=[{
            "name": "CUMST",
            "cols": ["ID_CLIENTE"],
            "ref_table": "CUMST",
            "ref_cols": ["ID_CLIENTE"],
        }],
    ),
    "RCOLL": _spec(
        M8, "Transaccional / Detalle", ORIGEN_GARANTIA, "Permanente",
        "Relaciones Entre Garantias",
        "Relaciones entre garantias, identificadas por codigo_banco, "
        "cuenta_a_garantizar y cuenta_que_garantiza."
    ),
    "LNECR": _spec(
        M9, "Maestro", ORIGEN_LINEA, "Permanente",
        "Maestro Lineas de Credito",
        "Maestro de lineas de credito, identificado por id_cliente y "
        "numero_linea. FK hacia CUMST.id_cliente.",
        fks=[{
            "name": "CUMST",
            "cols": ["ID_CLIENTE"],
            "ref_table": "CUMST",
            "ref_cols": ["ID_CLIENTE"],
        }],
    ),
    "CLSMS": _spec(
        M10, "Catalogo / Parametros", ORIGEN_ACTIVOFIJO, "Permanente",
        "Clases Amortizacion Activos Fijos",
        "Maestro de clases de amortizacion de activos fijos, identificado "
        "por codigo_clase."
    ),
    "LOCMS": _spec(
        M10, "Catalogo / Parametros", ORIGEN_ACTIVOFIJO, "Permanente",
        "Localizaciones Activos Fijos",
        "Maestro de localizaciones de activos fijos, identificado por "
        "numero_localizacion."
    ),
    "FIXMS": _spec(
        M10, "Maestro", ORIGEN_ACTIVOFIJO, "Permanente",
        "Maestro de Activos Fijos",
        "Maestro de activos fijos del banco, identificado por "
        "numero_activo."
    ),
    "CNTRLFIX": _spec(
        M10, "Catalogo / Parametros", ORIGEN_ACTIVOFIJO, "Permanente",
        "Control de Activos Fijos",
        "Archivo de control de activos fijos, identificado por "
        "codigo_banco."
    ),
    "BAVEN": _spec(
        M11, "Maestro", ORIGEN_CXP, "Permanente",
        "Maestro de Proveedores",
        "Maestro de proveedores, identificado por numero_proveedor."
    ),
    "BAPRC": _spec(
        M11, "Maestro", ORIGEN_CXP, "Permanente",
        "Maestro Cuentas por Pagar",
        "Maestro de cuentas por pagar, identificado por codigo_banco, "
        "codigo_sucursal, origen_cuenta, tipo_cuenta, id_cliente, "
        "numero_referencia y tipo_registro. FK hacia CUMST.id_cliente.",
        fks=[{
            "name": "CUMST",
            "cols": ["ID_CLIENTE"],
            "ref_table": "CUMST",
            "ref_cols": ["ID_CLIENTE"],
        }],
    ),
    "BAMOR": _spec(
        M11, "Transaccional / Detalle", ORIGEN_CXP, "Permanente",
        "Amortizaciones Cuentas por Pagar",
        "Amortizaciones de cuentas por pagar, identificadas por "
        "codigo_banco, codigo_sucursal, origen_cuenta, tipo_cuenta, "
        "id_cliente, numero_referencia y tipo_registro."
    ),
    "BAINP": _spec(
        M11, "Transaccional / Detalle", ORIGEN_CXP, "Permanente",
        "Transacciones Contables Diarias CxP",
        "Transacciones contables diarias de cuentas por pagar, "
        "identificadas por numero_batch y secuencia."
    ),
    "BAHIS": _spec(
        M11, "Transaccional / Historico", ORIGEN_CXP, "Permanente",
        "Historico Cuentas por Pagar",
        "Historico de cuentas por pagar, identificado por codigo_banco, "
        "origen_cuenta, tipo_cuenta, id_cliente, numero_referencia y fecha."
    ),
    "CNTRLBAF": _spec(
        M11, "Catalogo / Parametros", ORIGEN_PARAM, "Permanente",
        "Control CxP Comisiones",
        "Archivo de control de cuentas por pagar (seccion comisiones), "
        "identificado por codigo_banco y codigo_moneda."
    ),
    "CNTRLBAP": _spec(
        M11, "Catalogo / Parametros", ORIGEN_PARAM, "Permanente",
        "Control CxP Otros Parametros",
        "Archivo de control de cuentas por pagar (otros parametros), "
        "identificado por codigo_banco y codigo_moneda."
    ),
    "FIWRT": _spec(
        M12, "Transaccional / Historico", ORIGEN_PAGOS, "Permanente",
        "Historico Pagos y Recibos",
        "Transacciones historicas de pagos y recibos, identificadas por "
        "codigo_banco y numero_transferencia."
    ),
    "POFED": _spec(
        M12, "Transaccional / Detalle", ORIGEN_PAGOS, "Permanente",
        "Ordenes de Pago",
        "Ordenes de pago, identificadas por codigo_banco, codigo_moneda, "
        "id_cliente, tipo_registro, numero_cuenta y numero_referencia."
    ),
    "POSWF": _spec(
        M12, "Transaccional / Detalle", ORIGEN_PAGOS, "Permanente",
        "Ordenes de Pago via Swift",
        "Ordenes de pago via Swift, identificadas por codigo_banco, "
        "codigo_moneda, id_cliente, tipo_registro, numero_cuenta, "
        "numero_referencia y monto."
    ),
    "POTLX": _spec(
        M12, "Transaccional / Detalle", ORIGEN_PAGOS, "Permanente",
        "Ordenes de Pago via Telex",
        "Ordenes de pago via Telex, identificadas por codigo_banco, "
        "codigo_moneda, id_cliente, tipo_registro, numero_cuenta y "
        "numero_referencia."
    ),
    "SWITF": _spec(
        M12, "Transaccional / Historico", ORIGEN_PAGOS, "Permanente",
        "Historico Pagos y Recibos Swift",
        "Historico de pagos y recibos via Swift, identificado por "
        "codigo_banco, numero_referencia y formato_swift."
    ),
    "CNTRLPRF": _spec(
        M12, "Catalogo / Parametros", ORIGEN_PARAM, "Permanente",
        "Control de Pagos y Recibos",
        "Archivo de control de pagos y recibos, identificado por "
        "codigo_banco, parametro y codigo_tabla."
    ),
    "PLPCR": _spec(
        M13, "Maestro", ORIGEN_PROPUESTA, "Permanente",
        "Propuestas de Credito",
        "Propuestas de credito, identificadas por numero_propuesta."
    ),
    "PLPRD": _spec(
        M13, "Transaccional / Detalle", ORIGEN_PROPUESTA, "Permanente",
        "Detalle Productos Propuesta",
        "Detalle de productos asociados a una propuesta de credito, "
        "identificado por numero_propuesta, codigo_producto y "
        "tipo_producto. FK hacia PLPCR.numero_propuesta.",
        fks=[{
            "name": "PLPCR",
            "cols": ["NUMERO_PROPUESTA"],
            "ref_table": "PLPCR",
            "ref_cols": ["NUMERO_PROPUESTA"],
        }],
    ),
    "PLGRT": _spec(
        M13, "Transaccional / Detalle", ORIGEN_PROPUESTA, "Permanente",
        "Garantias Asociadas a Propuesta",
        "Garantias asociadas a una propuesta de credito, identificadas "
        "por numero_propuesta y secuencia. FK hacia PLPCR.numero_propuesta.",
        fks=[{
            "name": "PLPCR",
            "cols": ["NUMERO_PROPUESTA"],
            "ref_table": "PLPCR",
            "ref_cols": ["NUMERO_PROPUESTA"],
        }],
    ),
    "DPMST": _spec(
        M13, "Transaccional / Detalle", ORIGEN_PROPUESTA, "Permanente",
        "Cabecera Declaracion Patrimonial PN",
        "Cabecera de declaracion patrimonial de personas naturales, "
        "identificada por id_cliente y secuencia."
    ),
    "DPDTL": _spec(
        M13, "Transaccional / Detalle", ORIGEN_PROPUESTA, "Permanente",
        "Detalle Declaracion Patrimonial PN",
        "Detalle de declaracion patrimonial de personas naturales, "
        "identificado por id_cliente, secuencia y tipo_registro."
    ),
    "IFMST": _spec(
        M13, "Transaccional / Detalle", ORIGEN_PROPUESTA, "Permanente",
        "Cabecera Declaracion Patrimonial PJ",
        "Cabecera de declaracion patrimonial de personas juridicas, "
        "identificada por id_cliente, anio, mes y formato_balance."
    ),
    "IFDTL": _spec(
        M13, "Transaccional / Detalle", ORIGEN_PROPUESTA, "Permanente",
        "Detalle Declaracion Patrimonial PJ",
        "Detalle de declaracion patrimonial de personas juridicas, "
        "identificado por id_cliente, anio, mes, formato_balance, "
        "codigo_linea y codigo_cuenta."
    ),
    "DPGLN": _spec(
        M13, "Catalogo / Parametros", ORIGEN_PROPUESTA, "Permanente",
        "Plan de Cuentas de Clientes",
        "Plan de cuentas de clientes, identificado por tipo_balance y "
        "codigo_cuenta."
    ),
    "LIMST": _spec(
        M13, "Transaccional / Detalle", ORIGEN_PROPUESTA, "Permanente",
        "Cabecera Declaracion Legal PJ",
        "Cabecera de declaracion legal de personas juridicas, "
        "identificada por id_cliente."
    ),
    "DITBL": _spec(
        M14, "Catalogo / Parametros", ORIGEN_DOC, "Permanente",
        "Tablas de Tipos de Documentos",
        "Catalogo de tipos de documentos por tabla, identificado por "
        "numero_tabla y secuencia."
    ),
    "DIMST": _spec(
        M14, "Maestro", ORIGEN_DOC, "Permanente",
        "Maestro de Inventario de Documentos",
        "Inventario de documentos por cuenta, identificado por "
        "tipo_cuenta, numero_tabla y secuencia."
    ),
    "USERS": _spec(
        M15, "Catalogo / Parametros", ORIGEN_SEGURIDAD, "Permanente",
        "Autorizaciones por Menus",
        "Autorizaciones de usuarios por menu y opcion, identificadas por "
        "codigo_usuario, menu y opcion."
    ),
}

# -*- coding: utf-8 -*-
"""
Generador de scripts SQL para NOVASRCSQL/ (Fase A.2 - resto del esquema).

Lee CONTEXTO TALLER/estructura_bd.md, extrae la definicion de columnas de cada
tabla y genera un archivo .sql por tabla siguiendo el estandar de metadata de
Revision_IBMi.md (secciones 13/15/16): encabezado de metadata, CREATE OR
REPLACE TABLE con FOR COLUMN, CONSTRAINT ... PRIMARY KEY, RCDFMT,
COMMENT ON TABLE / LABEL ON TABLE, y COMMENT ON COLUMN / LABEL ON COLUMN /
LABEL ON COLUMN ... TEXT IS para el 100% de las columnas.

Uso:
    python gen_novasrc_sql.py MODNAME1 MODNAME2 ...
    (MODNAME = nombre de tabla, p.ej. CNOFT). Si no se pasan argumentos,
    genera TODAS las tablas configuradas en TABLE_SPECS.
"""

import re
import sys
from pathlib import Path
from datetime import date

BASE = Path(__file__).parent
ESTRUCTURA = BASE / "CONTEXTO TALLER" / "estructura_bd.md"
OUT_DIR = BASE / "NOVASRCSQL"
SCHEMA = "IROJAS941"
HECHO_POR = "Isaac Rojas"
FECHA = "2026-06-13"
PROYECTO = "Taller IBM i - Conciliacion GLBLN (IROJAS941 / PUB400)"

# --------------------------------------------------------------------------
# Diccionario de palabras: humanizacion (para LABEL TEXT IS / COMMENT) y
# abreviaturas (para FOR COLUMN, alias de sistema <=10 caracteres)
# --------------------------------------------------------------------------
WORD_ES = {
    "codigo": "Codigo", "numero": "Numero", "fecha": "Fecha",
    "descripcion": "Descripcion", "nombre": "Nombre", "tipo": "Tipo",
    "estado": "Estado", "monto": "Monto", "saldo": "Saldo", "tasa": "Tasa",
    "cuenta": "Cuenta", "contable": "Contable", "cliente": "Cliente",
    "banco": "Banco", "sucursal": "Sucursal", "moneda": "Moneda",
    "referencia": "Referencia", "documento": "Documento", "garantia": "Garantia",
    "propuesta": "Propuesta", "producto": "Producto", "proveedor": "Proveedor",
    "prestamo": "Prestamo", "registro": "Registro", "secuencia": "Secuencia",
    "identificacion": "Identificacion", "id": "Id", "usuario": "Usuario",
    "creacion": "Creacion", "actualizacion": "Actualizacion", "version": "Version",
    "observaciones": "Observaciones", "operacion": "Operacion", "valor": "Valor",
    "vencimiento": "Vencimiento", "apertura": "Apertura", "pago": "Pago",
    "pagos": "Pagos", "interes": "Interes", "anio": "Anio", "mes": "Mes",
    "dia": "Dia", "hora": "Hora", "comision": "Comision", "comisiones": "Comisiones",
    "deduccion": "Deduccion", "deducciones": "Deducciones", "linea": "Linea",
    "credito": "Credito", "carta": "Carta", "enmienda": "Enmienda",
    "negociacion": "Negociacion", "transaccion": "Transaccion",
    "transacciones": "Transacciones", "activo": "Activo", "activos": "Activos",
    "fijo": "Fijo", "fijos": "Fijos", "localizacion": "Localizacion",
    "clase": "Clase", "amortizacion": "Amortizacion", "amortizaciones": "Amortizaciones",
    "presupuesto": "Presupuesto", "centro": "Centro", "costo": "Costo",
    "balance": "Balance", "lote": "Lote", "batch": "Lote", "impuesto": "Impuesto",
    "causal": "Causal", "devolucion": "Devolucion", "cheque": "Cheque",
    "cheques": "Cheques", "chequera": "Chequera", "cajero": "Cajero", "caja": "Caja",
    "retencion": "Retencion", "retenciones": "Retenciones", "reporte": "Reporte",
    "programa": "Programa", "mensaje": "Mensaje", "mensajes": "Mensajes",
    "idioma": "Idioma", "notificacion": "Notificacion", "feriado": "Feriado",
    "aplicacion": "Aplicacion", "parametro": "Parametro", "indicador": "Indicador",
    "obligatorio": "Obligatorio", "formato": "Formato", "salida": "Salida",
    "texto": "Texto", "responsable": "Responsable", "menu": "Menu",
    "opcion": "Opcion", "tabla": "Tabla", "nivel": "Nivel", "naturaleza": "Naturaleza",
    "relativo": "Relativo", "principal": "Principal", "total": "Total",
    "porcentaje": "Porcentaje", "plazo": "Plazo", "periodo": "Periodo",
    "frecuencia": "Frecuencia", "categoria": "Categoria", "clasificacion": "Clasificacion",
    "departamento": "Departamento", "telefono": "Telefono", "direccion": "Direccion",
    "correo": "Correo", "beneficiario": "Beneficiario", "titular": "Titular",
    "firma": "Firma", "limite": "Limite", "disponible": "Disponible",
    "utilizado": "Utilizado", "vigente": "Vigente", "origen": "Origen",
    "destino": "Destino", "movimiento": "Movimiento", "ajuste": "Ajuste",
    "diferencia": "Diferencia", "minimo": "Minimo", "maximo": "Maximo",
    "ultimo": "Ultimo", "ultima": "Ultima", "primer": "Primer", "primera": "Primera",
    "anterior": "Anterior", "posterior": "Posterior", "actual": "Actual",
    "general": "General", "especial": "Especial", "extra": "Extra",
    "adicional": "Adicional", "control": "Control", "sistema": "Sistema",
    "proceso": "Proceso", "resultado": "Resultado", "calculo": "Calculo",
    "automatico": "Automatico", "manual": "Manual", "interno": "Interno",
    "externo": "Externo", "interna": "Interna", "externa": "Externa",
    "input": "Entrada", "output": "Salida", "input2": "Entrada 2",
    "swift": "SWIFT", "telex": "Telex", "ibs": "IBS", "intersucursal": "Intersucursal",
    "intersucursales": "Intersucursales", "cruzadas": "Cruzadas", "dictionary": "Diccionario",
    "diccionario": "Diccionario", "microficha": "Microficha", "personalizada": "Personalizada",
    "agenda": "Agenda", "usos": "Usos", "string": "Cadena", "caracteres": "Caracteres",
    "palabras": "Palabras", "reservadas": "Reservadas", "busqueda": "Busqueda",
    "instrucciones": "Instrucciones", "especiales": "Especiales", "ahorro": "Ahorro",
    "libretas": "Libretas", "certificados": "Certificados", "gerencia": "Gerencia",
    "reconciliables": "Reconciliables", "transacciones_dia": "Transacciones del Dia",
    "diarias": "Diarias", "diario": "Diario", "sobregiros": "Sobregiros",
    "personalizacion": "Personalizacion", "estatus": "Estatus", "detalle": "Detalle",
    "camara": "Camara", "entrante": "Entrante", "tarifas": "Tarifas",
    "servicio": "Servicio", "servicios": "Servicios", "calificacion": "Calificacion",
    "previsión": "Prevision", "prevision": "Prevision", "cartera": "Cartera",
    "pendientes": "Pendientes", "cobro": "Cobro", "deducciones_prestamo": "Deducciones de Prestamo",
    "depositos": "Depositos", "asientos": "Asientos", "aprobados": "Aprobados",
    "derivados": "Derivados", "consolidado": "Consolidado", "financieros": "Financieros",
    "niveles": "Niveles", "automaticas": "Automaticas", "siguiente": "Siguiente",
    "proximo": "Proximo", "presupuestos": "Presupuestos", "garantias": "Garantias",
    "relaciones": "Relaciones", "creditos": "Creditos", "lineas": "Lineas",
    "clases": "Clases", "localizaciones": "Localizaciones", "amortizaciones_activos": "Amortizaciones de Activos",
    "proveedores": "Proveedores", "transferencias": "Transferencias", "recibos": "Recibos",
    "ordenes": "Ordenes", "via": "via", "historicas": "Historicas", "historico": "Historico",
    "propuestas": "Propuestas", "productos": "Productos", "asociados": "Asociados",
    "patrimonial": "Patrimonial", "personas": "Personas", "naturales": "Naturales",
    "juridicas": "Juridicas", "legal": "Legal", "plan": "Plan", "inventario": "Inventario",
    "documentos": "Documentos", "tipos": "Tipos", "autorizaciones": "Autorizaciones",
    "menus": "Menus", "fin": "Fin", "dia_corriente": "Dia Corriente", "campo": "Campo",
    "numerico": "Numerico", "vigencia": "Vigencia", "desde": "Desde", "hasta": "Hasta",
    "orden": "Orden", "visualizacion": "Visualizacion",
    "persona": "Persona", "nombres": "Nombres", "apellidos": "Apellidos",
    "razon": "Razon", "social": "Social", "nacimiento": "Nacimiento",
    "email": "Email", "pais": "Pais", "residencia": "Residencia",
    "palabra": "Palabra", "informacion": "Informacion", "o": "o",
}

ABBR = {
    "codigo": "COD", "numero": "NUM", "fecha": "FCH", "descripcion": "DESC",
    "nombre": "NOM", "tipo": "TIPO", "estado": "EST", "monto": "MONTO",
    "saldo": "SALDO", "tasa": "TASA", "cuenta": "CTA", "contable": "CTBLE",
    "cliente": "CLI", "banco": "BANCO", "sucursal": "SUC", "moneda": "MON",
    "referencia": "REF", "documento": "DOC", "garantia": "GAR", "propuesta": "PROP",
    "producto": "PROD", "proveedor": "PROV", "prestamo": "PMO", "registro": "REG",
    "secuencia": "SEQ", "identificacion": "ID", "usuario": "USR", "creacion": "CREA",
    "actualizacion": "ACTUA", "version": "VERS", "observaciones": "OBSERVAC",
    "operacion": "OPER", "valor": "VALOR", "vencimiento": "VENC", "apertura": "APERT",
    "pago": "PAGO", "pagos": "PAGOS", "interes": "INT", "anio": "ANIO", "mes": "MES",
    "dia": "DIA", "hora": "HORA", "comision": "COMIS", "comisiones": "COMIS",
    "deduccion": "DEDUC", "deducciones": "DEDUC", "linea": "LIN", "credito": "CRED",
    "carta": "CARTA", "enmienda": "ENM", "negociacion": "NEGOC", "transaccion": "TRAN",
    "transacciones": "TRAN", "activo": "ACT", "activos": "ACT", "fijo": "FIJO",
    "fijos": "FIJOS", "localizacion": "LOC", "clase": "CLASE", "amortizacion": "AMORT",
    "amortizaciones": "AMORT", "presupuesto": "PPTO", "centro": "CENT", "costo": "COSTO",
    "balance": "BAL", "lote": "LOTE", "batch": "BATCH", "impuesto": "IMP",
    "causal": "CAUSAL", "devolucion": "DEVOL", "cheque": "CHEQUE", "cheques": "CHEQUES",
    "chequera": "CHEQ", "cajero": "CAJERO", "caja": "CAJA", "retencion": "RET",
    "retenciones": "RET", "reporte": "RPT", "programa": "PGM", "mensaje": "MSG",
    "mensajes": "MSG", "idioma": "IDIOMA", "notificacion": "NOTIF", "feriado": "FERIADO",
    "aplicacion": "APLIC", "parametro": "PARM", "indicador": "IND", "obligatorio": "OBLIGAT",
    "formato": "FMT", "salida": "SAL", "texto": "TXT", "responsable": "RESP",
    "menu": "MENU", "opcion": "OPC", "tabla": "TBL", "nivel": "NIVEL",
    "naturaleza": "NAT", "relativo": "REL", "principal": "PPAL", "total": "TOTAL",
    "porcentaje": "PCT", "plazo": "PLAZO", "periodo": "PER", "frecuencia": "FREC",
    "categoria": "CAT", "clasificacion": "CLASIF", "departamento": "DEPTO",
    "telefono": "TEL", "direccion": "DIR", "correo": "CORREO", "beneficiario": "BENEF",
    "titular": "TIT", "firma": "FIRMA", "limite": "LIM", "disponible": "DISP",
    "utilizado": "UTIL", "vigente": "VIG", "origen": "ORIG", "destino": "DEST",
    "movimiento": "MOV", "ajuste": "AJUSTE", "diferencia": "DIF", "minimo": "MIN",
    "maximo": "MAX", "ultimo": "ULT", "ultima": "ULT", "primer": "PRI", "primera": "PRI",
    "anterior": "ANT", "posterior": "POST", "actual": "ACT", "general": "GRAL",
    "especial": "ESP", "extra": "XTRA", "adicional": "ADIC", "control": "CTRL",
    "sistema": "SIS", "proceso": "PROC", "resultado": "RES", "calculo": "CALC",
    "automatico": "AUTO", "manual": "MAN", "interno": "INT", "externo": "EXT",
    "interna": "INT", "externa": "EXT", "swift": "SWIFT", "telex": "TELEX",
    "ibs": "IBS", "intersucursal": "INTERSUC", "intersucursales": "INTERSUC",
    "cruzadas": "CRUZ", "diccionario": "DICC", "microficha": "MCRF",
    "personalizada": "PERSONAL", "agenda": "AGENDA", "string": "STR",
    "caracteres": "CAR", "palabras": "PAL", "reservadas": "RES", "busqueda": "BUSQ",
    "instrucciones": "INSTR", "especiales": "ESP", "ahorro": "AHORRO",
    "libretas": "LIBR", "certificados": "CERT", "gerencia": "GER",
    "reconciliables": "RECON", "diarias": "DIAR", "diario": "DIAR",
    "sobregiros": "SOBREG", "personalizacion": "PERSONAL", "estatus": "ESTATUS",
    "detalle": "DET", "camara": "CAM", "entrante": "ENTR", "tarifas": "TARIF",
    "servicio": "SERV", "servicios": "SERV", "calificacion": "CALIF",
    "prevision": "PREV", "cartera": "CARTERA", "pendientes": "PEND",
    "cobro": "COBRO", "depositos": "DEPOS", "asientos": "ASIENT",
    "aprobados": "APROB", "derivados": "DERIV", "consolidado": "CONSOL",
    "financieros": "FIN", "niveles": "NIVELES", "automaticas": "AUTO",
    "siguiente": "SIG", "proximo": "PROX", "presupuestos": "PPTO",
    "garantias": "GAR", "relaciones": "REL", "creditos": "CRED", "lineas": "LIN",
    "clases": "CLASES", "localizaciones": "LOC", "proveedores": "PROV",
    "transferencias": "TRANSF", "recibos": "RECIB", "ordenes": "ORD",
    "via": "VIA", "historicas": "HIST", "historico": "HIST", "propuestas": "PROP",
    "productos": "PROD", "asociados": "ASOC", "patrimonial": "PATRIM",
    "personas": "PERS", "naturales": "NAT", "juridicas": "JURID", "legal": "LEGAL",
    "plan": "PLAN", "inventario": "INV", "documentos": "DOC", "tipos": "TIPOS",
    "autorizaciones": "AUTORIZ", "menus": "MENUS", "fin": "FIN", "campo": "CAMPO",
    "numerico": "NUM", "vigencia": "VIG", "desde": "DESDE", "hasta": "HASTA",
    "orden": "ORD", "visualizacion": "VISUAL",
}


def humanize(colname):
    words = colname.split("_")
    out = []
    for w in words:
        out.append(WORD_ES.get(w.lower(), w.capitalize()))
    return " ".join(out)


ALIAS_OVERRIDES = {
    # DESC es palabra reservada (ORDER BY ... DESC); se evita como alias corto
    "descripcion": "DESCRIP",
}


def abbreviate(colname, used):
    if colname.lower() in ALIAS_OVERRIDES:
        cand = ALIAS_OVERRIDES[colname.lower()]
    elif len(colname) <= 10 and "_" not in colname:
        cand = colname.upper()
    else:
        words = colname.split("_")
        cand = "".join(ABBR.get(w.lower(), w.upper()[:4]) for w in words)
        if len(cand) > 10:
            # progressive shortening: truncate each piece to 3 chars
            cand = "".join(ABBR.get(w.lower(), w.upper()[:3])[:3] for w in words)
        if len(cand) > 10:
            cand = cand[:10]
    base = cand
    i = 1
    while cand in used:
        suffix = str(i)
        cand = base[:10 - len(suffix)] + suffix
        i += 1
    used.add(cand)
    return cand


# --------------------------------------------------------------------------
# Parser de estructura_bd.md
# --------------------------------------------------------------------------
TYPE_MAP = {
    "VARCHAR": lambda size: f"VARCHAR({size})",
    "CHAR": lambda size: f"CHAR({size})",
    "DECIMAL": lambda size: f"DECIMAL({size.replace(',', ' , ')})",
    "INT": lambda size: "INTEGER",
    "BIGINT": lambda size: "BIGINT",
    "DATE": lambda size: "DATE",
    "TIME": lambda size: "TIME",
    "TIMESTAMP": lambda size: "TIMESTAMP",
    "BOOLEAN": lambda size: "BOOLEAN",
}


def parse_table(table_name):
    text = ESTRUCTURA.read_text(encoding="utf-8")
    pattern = re.compile(
        r"^####\s+" + re.escape(table_name) + r"\s*\n"
        r"Descripcion:\s*(.+?)\s*\n\n"
        r"\|\s*Campo.*\n\|[-:| ]+\n"
        r"((?:\|.*\n)+)",
        re.MULTILINE,
    )
    m = pattern.search(text)
    if not m:
        raise ValueError(f"No se encontro la tabla {table_name} en estructura_bd.md")
    descripcion = m.group(1).strip()
    rows_text = m.group(2)
    columns = []
    for line in rows_text.strip().splitlines():
        cells = [c.strip() for c in line.strip().strip("|").split("|")]
        if len(cells) < 6:
            continue
        campo, tipo, tamano, pk, fk, ref = cells[:6]
        campo = campo.strip("` ")
        columns.append({
            "name": campo,
            "type": tipo.strip(),
            "size": tamano.strip(),
            "pk": pk.strip().upper() == "SI",
            "fk": fk.strip().upper() == "SI",
            "ref": ref.strip(),
        })
    return descripcion, columns


def sql_type(col):
    base = col["type"].upper()
    size = col["size"]
    fn = TYPE_MAP.get(base)
    if fn is None:
        return base
    if size in ("-", "", None):
        return fn(None)
    return fn(size)


def not_null_clause(col, has_default=True):
    return "NOT NULL"


# --------------------------------------------------------------------------
# Generacion del archivo .sql
# --------------------------------------------------------------------------
# Columnas de auditoria estandar (presentes en todas las tablas), con la misma
# redaccion utilizada en CCDSC/GLMST/GLBLN/TRANS/TRDSC/TTRAN (Fase A.1).
AUDIT_COLS = {
    "usuario_creacion": {
        "alias": "USRCREA",
        "type": "VARCHAR(30)   NOT NULL",
        "short": "Usuario Creacion",
        "text": "Identificador del usuario o proceso que creó el registro",
        "comment": "Usuario o proceso que creó el registro (auditoría)",
    },
    "usuario_actualizacion": {
        "alias": "USRACTUA",
        "type": "VARCHAR(30)",
        "short": "Usuario Actualiza",
        "text": "Identificador del usuario o proceso que realizó la última actualización del registro",
        "comment": "Usuario o proceso que modificó por última vez el registro (auditoría)",
    },
    "version_registro": {
        "alias": "VERSREG",
        "type": "INTEGER       NOT NULL DEFAULT 1",
        "short": "Version Registro",
        "text": "Número de versión del registro, incrementado en cada actualización para control de concurrencia",
        "comment": "Contador de versión del registro, incrementado en cada UPDATE",
    },
    "observaciones": {
        "alias": "OBSERVAC",
        "type": "VARCHAR(120)",
        "short": "Observaciones",
        "text": "Notas u observaciones libres asociadas al registro",
        "comment": "Observaciones generales asociadas al registro",
    },
    "estado_registro": {
        "alias": "ESTREG",
        "type": "CHAR(1)       NOT NULL DEFAULT 'A'",
        "short": "Estado Registro",
        "text": "Estado del registro: A = Activo, I = Inactivo",
        "comment": "Estado lógico del registro: A = Activo, I = Inactivo",
    },
    "created_at": {
        "alias": "CREATEDAT",
        "type": "TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP",
        "short": "Fecha Creacion",
        "text": "Fecha y hora en que se creó el registro",
        "comment": "Marca de tiempo de creación del registro",
    },
    "updated_at": {
        "alias": "UPDATEDAT",
        "type": "TIMESTAMP",
        "short": "Fecha Actualiza",
        "text": "Fecha y hora de la última actualización del registro",
        "comment": "Marca de tiempo de la última actualización del registro",
    },
}


def generate_sql(table_name, spec, descripcion, columns):
    used_aliases = set()
    col_defs = []
    label_short = []
    comments = []

    pk_cols = [c["name"] for c in columns if c["pk"]]
    has_pk = len(pk_cols) > 0
    surrogate = not has_pk

    if surrogate:
        used_aliases.add("ID")
        col_defs.append("  ID                     BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL")
        pk_cols = ["ID"]
        label_short.append(f"LABEL ON COLUMN {SCHEMA}.{table_name} (ID IS 'Id');")
        comments.append(
            f"COMMENT ON COLUMN {SCHEMA}.{table_name}.ID IS "
            f"'PK tecnica (surrogate key). estructura_bd.md indica que {table_name} no tiene clave natural definida';"
        )

    for col in columns:
        cname = col["name"]
        cupper = cname.upper()
        audit = AUDIT_COLS.get(cname)
        ctype = sql_type(col)

        if cname == "id" and col["pk"]:
            alias = abbreviate(cname, used_aliases)
            type_and_null = "BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL"
        elif audit:
            alias = audit["alias"]
            used_aliases.add(alias)
            type_and_null = audit["type"]
        else:
            alias = abbreviate(cname, used_aliases)
            type_and_null = f"{ctype} NOT NULL"

        if alias == cupper:
            col_defs.append(f"  {cupper:<22} {type_and_null}")
        else:
            col_defs.append(f"  {cupper:<22} FOR COLUMN {alias:<10} {type_and_null}")

        pk_note = ""
        if col["pk"]:
            idx = pk_cols.index(cname) + 1 if cname in pk_cols else None
            if idx:
                pk_note = f"PK ({idx}/{len(pk_cols)}). "
        ref_note = ""
        if col["ref"] and col["ref"] != "-":
            ref_note = f" Referencia conceptual a {col['ref']} (segun estructura_bd.md)."

        if audit:
            short_label = audit["short"]
            comment_text = f"{pk_note}{audit['comment']}{ref_note}".strip()
        else:
            human = humanize(cname)
            short_label = human if len(human) <= 30 else human[:30]
            comment_text = f"{pk_note}{human} de {table_name}.{ref_note}".strip()

        label_short.append(f"LABEL ON COLUMN {SCHEMA}.{table_name} ({cupper} IS '{short_label}');")
        comments.append(f"COMMENT ON COLUMN {SCHEMA}.{table_name}.{cupper} IS '{comment_text}';")

    # PK constraint
    pk_list = ", ".join(c.upper() if c != "ID" else "ID" for c in pk_cols)
    constraints = [f"  CONSTRAINT {table_name}_PK PRIMARY KEY ({pk_list})"]

    # FK constraints (solo los declarados explicitamente en spec["fks"])
    for fk in spec.get("fks", []):
        fk_cols = ", ".join(fk["cols"])
        ref_cols = ", ".join(fk["ref_cols"])
        constraints.append(
            f"  CONSTRAINT {table_name}_FK_{fk['name']} FOREIGN KEY ({fk_cols})\n"
            f"    REFERENCES {SCHEMA}.{fk['ref_table']} ({ref_cols})"
        )

    rcdfmt = (table_name + "R")[:10]

    header = f"""--==============================================================================
-- Nombre de la Tabla   : {table_name}
-- DESCRIPCIÓN          : {descripcion}
-- Objetivo             : {spec['objetivo']}
-- Tipo de Tabla        : {spec['tipo_tabla']}
-- Origen de los Datos  : {spec['origen']}
-- Permanencia de Datos : {spec['permanencia']}
-- Uso de los datos     : {spec['uso']}
-- Hecho por            : {HECHO_POR}
-- Fecha                : {FECHA}
-- Proyecto             : {PROYECTO}
--==============================================================================
"""

    create_stmt = (
        f"CREATE OR REPLACE TABLE {SCHEMA}.{table_name} (\n"
        + ",\n".join(col_defs) + ",\n"
        + ",\n".join(constraints) + "\n"
        + f") RCDFMT {rcdfmt};\n"
    )

    table_label = f"LABEL ON TABLE {SCHEMA}.{table_name} IS '{spec['label_tabla']}';\n"
    table_comment = f"COMMENT ON TABLE {SCHEMA}.{table_name} IS '{spec['comment_tabla']}';\n"

    body = (
        header + "\n"
        + create_stmt + "\n"
        + "--------------------------------------------------------------------------------\n"
        + "-- Metadata de la tabla\n"
        + "--------------------------------------------------------------------------------\n"
        + table_label + "\n"
        + table_comment + "\n"
        + "--------------------------------------------------------------------------------\n"
        + "-- Labels cortos (encabezados de columna)\n"
        + "--------------------------------------------------------------------------------\n"
        + "\n".join(label_short) + "\n\n"
        + "--------------------------------------------------------------------------------\n"
        + "-- Comentarios tecnicos por columna\n"
        + "--------------------------------------------------------------------------------\n"
        + "\n".join(comments) + "\n"
    )
    return body


def write_table(table_name, spec):
    descripcion, columns = parse_table(table_name)
    body = generate_sql(table_name, spec, descripcion, columns)
    out_path = OUT_DIR / f"{table_name}.sql"
    out_path.write_text(body, encoding="utf-8")
    print(f"OK  {out_path}  ({len(columns)} columnas{' + ID surrogate' if not any(c['pk'] for c in columns) else ''})")


if __name__ == "__main__":
    # Las especificaciones de cada tabla (TABLE_SPECS) se importan desde un
    # modulo separado por lote/modulo para mantener este generador generico.
    import importlib
    targets = sys.argv[1:]
    specs_module = importlib.import_module("table_specs")
    TABLE_SPECS = specs_module.TABLE_SPECS
    if not targets:
        targets = list(TABLE_SPECS.keys())
    for t in targets:
        if t not in TABLE_SPECS:
            print(f"SKIP {t}: sin spec en table_specs.py")
            continue
        write_table(t, TABLE_SPECS[t])

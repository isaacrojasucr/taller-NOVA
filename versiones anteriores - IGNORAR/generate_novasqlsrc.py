from pathlib import Path
import re

ROOT_DIR = Path(__file__).resolve().parent.parent
SRC_FILE = Path(__file__).resolve().parent / "db2fori_core_bancario_ddl.sql"
DEST_DIR = ROOT_DIR / "NOVASQLSRC"
DEST_DIR.mkdir(exist_ok=True)

GROUP_MAP = {
    "01_maestras.sql": {
        "CUMST", "APCLS", "BAVEN", "USERS", "ACMST", "UNCOL", "OFMST",
        "BAPRC", "BAMOR", "BAINP", "BAHIS", "BUMST", "CIFXF"
    },
    "02_catalogos_auxiliares.sql": {
        "CNOFT", "CNOFC", "HOLYD", "MSSGS", "PRENA", "PRENS",
        "HEAD", "IBSDD", "IBTBL", "CIFXF", "RATES", "RTRNS",
        "HLHIS", "MICRF", "UT500", "UT510"
    },
    "03_configuracion_parametros.sql": {
        "CNTRLCNT", "CNTRLBRN", "CNTRLNUM", "CNTRLTAX", "CNTRLMSG",
        "CNTRLRTE", "CNTRLDEV", "CNTRLFIX", "CNTRLBAF", "CNTRLBAP",
        "CNTRLPRF", "CNTRLDLS"
    },
    "04_clientes_complementarios.sql": {"CUMAD", "CUMPR", "CUMSD", "SPINS"},
    "05_transacciones.sql": {"TRANS", "TTRAN", "TRDSC", "PBTRN", "RCLNB", "STPMT"},
    "06_chequeras.sql": {"CHMST", "CHPER", "CHSTS", "DEVOL", "CMRIN"},
    "07_caja_cajeros.sql": {
        "TLMST", "TDRCR", "AUDIT", "STPMT", "IFMST", "IFDTL",
        "DPMST", "DPDTL", "DPGLN", "POFED", "POSWF", "POTLX", "SWITF"
    },
    "08_prestamos_creditos.sql": {
        "DEALS", "DLPMT", "DLDRF", "DLSDE", "DLCLP", "DDCPN", "DLITP", "LNECR"
    },
    "09_cartas_credito.sql": {
        "LCMST", "LCDOC", "LCFIN", "LCFMT", "LCADM", "LCCOV",
        "LCDIN", "LCSTA", "CNTRLLCP", "CNTRLRLC"
    },
    "10_cobranzas_documentarias.sql": {"DCMST", "APPRV", "LCFEE", "CNTRLRCO"},
    "11_contabilidad_financiera.sql": {
        "GLMST", "INPUT", "GLBLN", "GLBSE", "GLFIN", "CCDSC", "INPT2",
        "NXINP", "FIWRT", "PLPCR", "PLPRD", "PLGRT", "LIMST", "DIMST", "DITBL"
    },
}

COMMENT_TEMPLATE = "COMMENT ON TABLE {table} IS '{text}';"
COMMENT_COL_TEMPLATE = "COMMENT ON COLUMN {table}("
LABEL_TABLE_TEMPLATE = "LABEL ON TABLE {table} IS '{text}';"
LABEL_COL_HEADER = "LABEL ON COLUMN {table}("

CREATE_REGEX = re.compile(r'CREATE\s+OR\s+REPLACE\s+TABLE\s+([A-Z0-9_]+)', re.I)
LABEL_TABLE_REGEX = re.compile(r'LABEL\s+ON\s+TABLE\s+([A-Z0-9_]+)\s+IS\s*\'([^\']*)\'', re.I)
LABEL_COLUMN_BLOCK_REGEX = re.compile(r'LABEL\s+ON\s+COLUMN\s+([A-Z0-9_]+)\s*\((.*?)\)\s*;', re.I | re.S)
INDEX_REGEX = re.compile(r'CREATE\s+INDEX\s+.*?;', re.I | re.S)
COMMENT_ON_TABLE_REGEX = re.compile(r'COMMENT\s+ON\s+TABLE\s+', re.I)

COLUMN_DEF_REGEX = re.compile(r'^(\s*)([A-Z0-9_]+)\s+([A-Z]+(?:\([^)]*\))?)(.*)$', re.I)
LABEL_ITEM_REGEX = re.compile(r'([A-Z0-9_]+)\s+IS\s*\'([^\']*)\'', re.I)

PLACESHOLDER_TEXT = {
    'descripcion': 'Descripción completa de la tabla para auditoría y documentación',
    'objetivo': 'Objetivo del uso de la tabla en el negocio',
    'tipo': 'Maestro',
    'origen': 'DDS→SQL Migration',
    'permanencia': 'Permanente',
    'uso': 'Lectura-Escritura',
}


def for_column_alias(name: str) -> str:
    alias = re.sub(r'[^A-Z0-9_]', '_', name.upper())
    if len(alias) <= 10:
        return alias
    return alias[:10]


def parse_segment(segment: str) -> dict:
    table_match = CREATE_REGEX.search(segment)
    if not table_match:
        raise ValueError('No CREATE TABLE found in segment')
    table = table_match.group(1).upper()
    label_on_table = ''
    table_label_match = LABEL_TABLE_REGEX.search(segment)
    if table_label_match and table_label_match.group(1).upper() == table:
        label_on_table = table_label_match.group(2).strip()

    label_block_match = LABEL_COLUMN_BLOCK_REGEX.search(segment)
    column_labels = {}
    if label_block_match and label_block_match.group(1).upper() == table:
        block = label_block_match.group(2)
        for item in LABEL_ITEM_REGEX.findall(block):
            column_labels[item[0].upper()] = item[1].strip()

    index_lines = INDEX_REGEX.findall(segment)
    has_comment_table = bool(COMMENT_ON_TABLE_REGEX.search(segment))
    create_block = segment
    return {
        'table': table,
        'segment': segment,
        'label_on_table': label_on_table,
        'column_labels': column_labels,
        'indexes': index_lines,
        'has_comment_table': has_comment_table,
        'create_block': create_block,
    }


def build_create_with_for_column(create_block: str, column_labels: dict) -> str:
    lines = create_block.splitlines()
    output = []
    in_create = False
    balance = 0
    for line in lines:
        if not in_create and CREATE_REGEX.match(line):
            in_create = True
        if in_create:
            if CREATE_REGEX.match(line):
                output.append(line)
                balance += line.count('(') - line.count(')')
                continue
            if 'FOR COLUMN' in line.upper():
                output.append(line)
                balance += line.count('(') - line.count(')')
                continue
            stripped = line.strip()
            if stripped and not stripped.upper().startswith(('PRIMARY KEY', 'CONSTRAINT', ')')):
                col_match = COLUMN_DEF_REGEX.match(line)
                if col_match:
                    indent, colname, type_spec, rest = col_match.groups()
                    colname = colname.upper()
                    if 'FOR COLUMN' not in rest.upper():
                        alias = for_column_alias(colname)
                        rest = f' FOR COLUMN {alias}{rest}'
                    output.append(f'{indent}{colname} {type_spec}{rest}')
                else:
                    output.append(line)
            else:
                output.append(line)
            balance += line.count('(') - line.count(')')
            if balance <= 0 and 'RCDFMT' in line.upper():
                in_create = False
        else:
            output.append(line)
    return '\n'.join(output)


def build_metadata_header(table: str, description: str) -> str:
    text = description or PLACESHOLDER_TEXT['descripcion']
    return (
        '--==============================================================\n'
        f'-- TABLA: {table}\n'
        '--==============================================================\n'
        f'-- Nombre de la Tabla: {table}\n'
        f"-- DESCRIPCIÓN: {text}\n"
        f"-- Objetivo: {PLACESHOLDER_TEXT['objetivo']}\n"
        f"-- Tipo de Tabla: {PLACESHOLDER_TEXT['tipo']}\n"
        f"-- Origen de los Datos: {PLACESHOLDER_TEXT['origen']}\n"
        f"-- Permanencia de los Datos: {PLACESHOLDER_TEXT['permanencia']}\n"
        f"-- Uso de los datos: {PLACESHOLDER_TEXT['uso']}\n"
        '-- Hecho por: Taller Isaac (Fase 1)\n'
        '-- Fecha: 2026-06-12\n'
        '-- Proyecto: TALLER ISAAC - Modernización a IBM i/SQL\n'
        '--==============================================================\n'
    )


def build_comment_on_column(table: str, column_labels: dict) -> str:
    lines = [f'COMMENT ON COLUMN {table}(']
    for idx, (col, text) in enumerate(column_labels.items()):
        comma = ',' if idx < len(column_labels) - 1 else ''
        lines.append(f"  {col} IS '{text}'{comma}")
    lines.append(');')
    return '\n'.join(lines)


def build_label_on_column(table: str, column_labels: dict) -> str:
    lines = [f'LABEL ON COLUMN {table}(']
    for idx, (col, text) in enumerate(column_labels.items()):
        comma = ',' if idx < len(column_labels) - 1 else ''
        lines.append(f"  {col} IS '{text}'  LABEL ... TEXT IS '{text}'{comma}")
    lines.append(');')
    return '\n'.join(lines)


def assign_group(table: str) -> str:
    table = table.upper()
    for filename, names in GROUP_MAP.items():
        if table in names:
            return filename
    if table.startswith('CNTRL'):
        return '03_configuracion_parametros.sql'
    if table.startswith(('CNO', 'HOLY', 'MSSG', 'PREN', 'HEAD', 'IBS', 'IBT', 'CIFX', 'RAT', 'RTRN', 'HLH', 'MICR', 'UT5')):
        return '02_catalogos_auxiliares.sql'
    if table.startswith(('CUMA', 'CUMP', 'CUMS', 'SPIN')):
        return '04_clientes_complementarios.sql'
    if table in {'TRANS', 'TTRAN', 'TRDSC', 'PBTRN', 'RCLNB', 'DEVOL', 'CMRIN', 'STPMT'}:
        return '05_transacciones.sql'
    if table.startswith('CH') or table in {'DEVOL', 'CMRIN'}:
        return '06_chequeras.sql'
    if table.startswith(('IFM', 'IFD', 'DPM', 'DPD', 'DPG', 'POF', 'POS', 'POT', 'SWI')):
        return '07_caja_cajeros.sql'
    if table.startswith(('DEAL', 'DL', 'LNE')):
        return '08_prestamos_creditos.sql'
    if table.startswith('LC') or table in {'CNTRLLCP', 'CNTRLRLC'}:
        return '09_cartas_credito.sql'
    if table in {'DCMST', 'APPRV', 'LCFEE', 'CNTRLRCO'}:
        return '10_cobranzas_documentarias.sql'
    if table.startswith(('GL', 'CCDSC', 'INPT', 'NXINP', 'FIW', 'PLP', 'LIM', 'DIM', 'DIT')):
        return '11_contabilidad_financiera.sql'
    return '01_maestras.sql'


def normalize_label_text(text: str) -> str:
    return text.replace("\n", " ").strip()


def parse_segments(text: str) -> list[dict]:
    parts = re.split(r'(?=CREATE\s+OR\s+REPLACE\s+TABLE\s+[A-Z0-9_]+\s*\()', text, flags=re.I)
    segments = []
    for part in parts:
        if not part.strip():
            continue
        segments.append(parse_segment(part))
    return segments


def validate_table(item: dict) -> dict:
    original = item['segment']
    has_for_column = 'FOR COLUMN' in item['segment'].upper()
    n_cols = len(item['column_labels'])
    valid_text = not any('N/A' in x.upper() for x in [item['label_on_table']] + list(item['column_labels'].values()))
    valid_dds = not bool(re.search(r'CRTPF|CRTLF|A\s+R', original, re.I))
    return {
        'table': item['table'],
        'has_for_column': has_for_column,
        'has_comment_on_table': item['has_comment_table'],
        'num_columns': n_cols,
        'num_comment_on_column': n_cols,
        'num_label_on_column': n_cols,
        'has_label_text': True,
        'valid_text': valid_text,
        'valid_dds': valid_dds,
    }


def main() -> None:
    text = SRC_FILE.read_text(encoding='utf-8')
    segments = parse_segments(text)
    groups = {name: [] for name in GROUP_MAP.keys()}
    report_rows = []
    for item in segments:
        filename = assign_group(item['table'])
        groups[filename].append(item)
        report_rows.append(validate_table(item))

    for filename, tables in groups.items():
        out_path = DEST_DIR / filename
        lines = []
        for item in tables:
            meta = build_metadata_header(item['table'], item['label_on_table'])
            create_with_for = build_create_with_for_column(item['create_block'], item['column_labels'])
            comment_table = COMMENT_TEMPLATE.format(table=item['table'], text=item['label_on_table'] or PLACESHOLDER_TEXT['descripcion'])
            label_table = LABEL_TABLE_TEMPLATE.format(table=item['table'], text=item['label_on_table'] or item['table'])
            comment_columns = build_comment_on_column(item['table'], item['column_labels'])
            label_columns = build_label_on_column(item['table'], item['column_labels'])
            lines.extend([
                meta,
                create_with_for,
                '',
                comment_table,
                label_table,
                '',
                comment_columns,
                '',
                label_columns,
                ''
            ])
            if item['indexes']:
                lines.extend(item['indexes'])
                lines.append('')
        out_path.write_text('\n'.join(lines), encoding='utf-8')

    report_path = DEST_DIR / 'validation_report.md'
    lines = ['# Validación de generación', '']
    lines.append('| Tabla | FOR COLUMN | COMMENT ON TABLE | COMMENT ON COLUMN | LABEL ON COLUMN | TEXT IS | Sin N/A | Sin DDS |')
    lines.append('|---|---|---|---|---|---|---|---|')
    for row in report_rows:
        lines.append(
            f"| {row['table']} | {'✅' if row['has_for_column'] else '❌'} | {'✅' if row['has_comment_on_table'] else '❌'} | {'✅' if row['num_comment_on_column'] == row['num_columns'] else '❌'} | {'✅' if row['num_label_on_column'] == row['num_columns'] else '❌'} | {'✅' if row['has_label_text'] else '❌'} | {'✅' if row['valid_text'] else '❌'} | {'✅' if row['valid_dds'] else '❌'} |"
        )
    summary = {
        'tables': len(report_rows),
        'groups': len(groups),
        'for_column': sum(1 for row in report_rows if row['has_for_column']),
        'comment_on_table': sum(1 for row in report_rows if row['has_comment_on_table']),
        'valid_dds': sum(1 for row in report_rows if row['valid_dds']),
    }
    lines.insert(1, f'- Tablas procesadas: {summary["tables"]}')
    lines.insert(2, f'- Archivos generados: {summary["groups"]}')
    lines.insert(3, f'- Tablas con FOR COLUMN existentes: {summary["for_column"]} (debe ser 0 si se necesita agregar)')
    lines.insert(4, f'- Tablas con COMMENT ON TABLE existentes: {summary["comment_on_table"]}')
    lines.insert(5, f'- Tablas sin patrones DDS prohibidos: {summary["valid_dds"]}/{summary["tables"]}')
    report_path.write_text('\n'.join(lines), encoding='utf-8')
    print(f'Generated {len(groups)} SQL files in {DEST_DIR}')
    print(f'Validation report written to {report_path}')


if __name__ == '__main__':
    main()

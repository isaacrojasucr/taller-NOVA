from pathlib import Path
import re
text = Path(r"C:\Users\paopo\OneDrive\Escritorio\GithubIsaac-Taller\taller-NOVA\estructura_bd.md").read_text(encoding='utf-8')
lines = text.splitlines()

def normalize_type(tipo, tam):
    t = tipo.strip().upper()
    if 'VARCHAR' in t:
        size = tam.strip()
        if size == '-' or size == '':
            size = '50'
        return f"VARCHAR({size})"
    if t == 'CHAR':
        size = tam.strip()
        if size == '-' or size == '':
            size = '1'
        return f"CHAR({size})"
    if t == 'DECIMAL' or t == 'NUMERIC':
        size = tam.strip()
        if size == '-' or size == '':
            size = '18,2'
        return f"DECIMAL({size})"
    if t == 'INT':
        return 'INT'
    if t == 'BIGINT':
        return 'BIGINT'
    if t == 'DATE':
        return 'DATE'
    if t == 'TIMESTAMP':
        return 'TIMESTAMP'
    if t == 'TIME':
        return 'TIME'
    if t == 'BOOLEAN':
        return 'CHAR(1)'
    return t if t else 'VARCHAR(50)'

def label_from_column(col):
    label = col.replace('_', ' ').strip()
    return label.capitalize()

records = []
i = 0
while i < len(lines):
    line = lines[i].strip()
    if line.startswith('#### '):
        table_name = line[5:].strip()
        desc = ''
        i += 1
        while i < len(lines) and lines[i].strip() == '':
            i += 1
        if i < len(lines) and lines[i].strip().startswith('Descripcion:'):
            desc = lines[i].split('Descripcion:', 1)[1].strip()
            i += 1
        while i < len(lines) and not lines[i].strip().startswith('|'):
            i += 1
        if i >= len(lines):
            continue
        i += 1
        if i < len(lines) and lines[i].strip().startswith('|'):
            i += 1
        fields = []
        while i < len(lines) and lines[i].strip().startswith('|'):
            row = [cell.strip() for cell in lines[i].strip().strip('|').split('|')]
            if len(row) >= 6 and row[0] != 'Campo':
                fields.append({
                    'name': row[0],
                    'type': row[1],
                    'size': row[2],
                    'pk': row[3].strip().upper() == 'SI',
                    'fk': row[4].strip().upper() == 'SI',
                    'ref': row[5]
                })
            i += 1
        indices = []
        while i < len(lines) and lines[i].strip() == '':
            i += 1
        if i < len(lines) and lines[i].strip().startswith('Indices sugeridos'):
            i += 1
            while i < len(lines) and lines[i].strip().startswith('- '):
                m = re.search(r'`([^`]+)`\s*:\s*\(([^)]+)\)', lines[i])
                if m:
                    idx_name = m.group(1).strip()
                    cols = [c.strip() for c in m.group(2).split(',') if c.strip()]
                    indices.append({'name': idx_name, 'cols': cols})
                i += 1
        records.append({'table': table_name, 'description': desc, 'fields': fields, 'indices': indices})
    else:
        i += 1

output_lines = []
for record in records:
    t = record['table']
    output_lines.append(f"CREATE OR REPLACE TABLE {t} (")
    pk_cols = [f['name'] for f in record['fields'] if f['pk']]
    has_pk = len(pk_cols) > 0
    for f in record['fields']:
        coltype = normalize_type(f['type'], f['size'])
        if not has_pk and f['name'] == 'id' and coltype.upper() == 'BIGINT':
            output_lines.append(f"  {f['name']} {coltype} GENERATED ALWAYS AS IDENTITY,")
        else:
            output_lines.append(f"  {f['name']} {coltype},")
    if not has_pk:
        if any(f['name'] == 'id' and normalize_type(f['type'], f['size']).upper() == 'BIGINT' for f in record['fields']):
            if output_lines[-1].endswith(','):
                output_lines[-1] = output_lines[-1][:-1]
            output_lines.append(f"  PRIMARY KEY (id)")
        else:
            output_lines.append(f"  id BIGINT GENERATED ALWAYS AS IDENTITY,")
            output_lines.append(f"  PRIMARY KEY (id)")
    else:
        if output_lines[-1].endswith(','):
            output_lines[-1] = output_lines[-1][:-1]
        output_lines.append(f"  PRIMARY KEY ({', '.join(pk_cols)})")
    output_lines.append(f") RCDFMT R{t};")
    output_lines.append("")
    output_lines.append(f"LABEL ON TABLE {t} IS '{record['description']}';")
    output_lines.append(f"LABEL ON COLUMN {t} (")
    for idx, f in enumerate(record['fields']):
        label = label_from_column(f['name'])
        comma = ',' if idx < len(record['fields'])-1 else ''
        output_lines.append(f"  {f['name']} IS '{label}'{comma}")
    output_lines.append(");")
    output_lines.append("")
    if record['indices']:
        for idx in record['indices']:
            cols = ', '.join(idx['cols'])
            if has_pk and set(idx['cols']) == set(pk_cols):
                continue
            output_lines.append(f"CREATE INDEX {idx['name']} ON {t}({cols});")
    output_lines.append("")

Path(r"C:\Users\paopo\OneDrive\Escritorio\GithubIsaac-Taller\taller-NOVA\db2fori_core_bancario_ddl.sql").write_text('\n'.join(output_lines), encoding='utf-8')
print(f'Wrote {len(records)} tables to db2fori_core_bancario_ddl.sql')

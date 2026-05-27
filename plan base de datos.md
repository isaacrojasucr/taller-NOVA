## Plan: Generar DDL DB2 for i para Core Bancario

TL;DR: Convertir el diccionario y listas de tablas de `estructura_bd.md` en un script SQL nativo para DB2 for i con `CREATE OR REPLACE TABLE`, `RCDFMT`, etiquetas `LABEL ON TABLE` y `LABEL ON COLUMN`, claves primarias y los índices sugeridos.

**Steps**
1. Crear un archivo de salida en la raíz del workspace, por ejemplo `db2fori_core_bancario_ddl.sql`.
2. Para cada tabla definida en `estructura_bd.md`:
   - Generar `CREATE OR REPLACE TABLE` con columnas, tipos y longitudes exactas del diccionario.
   - Incluir `PRIMARY KEY` según la clave reportada o, si no existe, usar `id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY`.
   - Append `RCDFMT R<TABLA>` al final de cada definición.
3. Agregar `LABEL ON TABLE` para cada tabla usando su descripción funcional.
4. Agregar `LABEL ON COLUMN` para cada columna usando la descripción del campo.
5. Añadir índices `CREATE INDEX` sugeridos en el documento y los necesarios para las claves foráneas implícitas.
6. Donde el diccionario no aporta FK explícitos, inferir relaciones a partir del ER diagram y las referencias funcionales.
7. Revisar sintaxis de DB2 for i, con foco en las cláusulas `CREATE OR REPLACE TABLE`, `RCDFMT`, `LABEL` y tipos compatibles.

**Relevant files**
- `c:\Users\paopo\OneDrive\Escritorio\GithubIsaac-Taller\taller-NOVA\estructura_bd.md` — fuente de verdad para nombres, descripciones, PK/columns y tipos.
- `c:\Users\paopo\OneDrive\Escritorio\GithubIsaac-Taller\taller-NOVA\db2fori_core_bancario_ddl.sql` — archivo nuevo donde escribir el DDL.

**Verification**
1. Confirma que cada tabla en el script termina con `RCDFMT R<TABLA>`.
2. Verifica que cada tabla tenga `LABEL ON TABLE` y `LABEL ON COLUMN` para todas columnas definidas.
3. Asegura que las tablas sin clave natural tengan un `BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY`.
4. Revisa los índices sugeridos y que existan para PKs y FK implícitos.
5. Si hay acceso a DB2 for i, ejecutar el script de validación syntax-only contra el motor.

**Decisions**
- Usar los tipos y longitudes del diccionario cuando existen.
- Para tablas inferidas sin diccionario detallado, usar campos y longitudes basados en la clave funcional y estándares bancarios, siempre con `VARCHAR`, `DECIMAL`, `DATE`, `TIMESTAMP` o `BIGINT`.
- Incluir los campos de auditoría `estado_registro`, `created_at`, y `updated_at` en tablas inferidas si no están ya definidos.

**Further Considerations**
1. Confirmar si el script debe incluir también `ALTER TABLE ... ADD CONSTRAINT` para todas las FK o sólo índices.
2. Validar si las etiquetas deben incluir descripciones de tipo de datos o solo funcionales.
3. Determinar si el script debe ser ordenado por módulo o por dependencia de tablas para permitir carga en DB2 for i.

> Actúa como un Administrador de Bases de Datos (DBA) experto en DB2 para IBM i (AS400) con más de 20 años de experiencia.

**Contexto:**
Analiza el contexto de nuestros chats anteriores para entender lo que hemos construido hasta el momento. Tienes a tu disposición los siguientes archivos para esta fase:
- `db2fori_core_bancario_ddl.sql`: Contiene el script DDL a implementar.
- `estructura_bd.md`: Especificaciones y diccionario de la base de datos.

**Entorno de Trabajo:**
- **IDE:** Visual Studio Code.
- **Conexión Activa:** Servidor AS400 (IBM i), específicamente el servidor público `PUB400.COM`.
- **DBMS:** IBM DB2 for i.

**Objetivo:**
Preparar el entorno e implementar la base de datos utilizando el script DDL proporcionado, asegurando la integridad estructural basada en la documentación.

**Instrucciones de Ejecución y Validación (Paso a Paso):**

1. **Análisis Previo:** Revisa brevemente la congruencia entre `estructura_bd.md`, el plan y el archivo `.sql`. Avísame si detectas alguna inconsistencia antes de empezar.

2. **Ejecución Secuencial:** Guíame o ejecuta (según las capacidades de la extensión que estemos usando) las sentencias SQL de forma iterativa y controlada.

3. **Validación de Éxito:** Por cada bloque de sentencias ejecutado, valida que la creación de las tablas, claves e índices haya sido exitosa en el servidor PUB400.COM.

4. **Manejo y Resolución de Errores:** Si una ejecución falla, detén el proceso inmediatamente. Analiza el código de error (`SQLCODE`/`SQLSTATE` de DB2), explícame la causa raíz y propón la sentencia SQL corregida respetando la sintaxis estricta de DB2 for i. Una vez solucionado, retomaremos la implementación desde ese punto.

Por favor, confirma que has entendido este flujo de trabajo y dime cuál es el primer paso que ejecutaremos.

### ¿Por qué esta versión funcionará mejor?

- **Estructura Visual:** Al separar el "Entorno", el "Contexto" y las "Instrucciones", ayudas a que la IA no pase por alto los detalles de la conexión (`PUB400.COM`) y se enfoque en el dialecto correcto (DB2 for i, que tiene particularidades distintas al DB2 de Linux/Windows).
- **Gestión de Errores Precisa:** Le exige a la IA que use los códigos de error específicos (`SQLCODE`/`SQLSTATE`), lo cual es vital en entornos AS400 para evitar que adivine el problema.
- **Freno de Seguridad:** La instrucción "detén el proceso inmediatamente" evita que Copilot intente seguir ejecutando un script de cientos de líneas si una tabla principal falló al inicio (lo que causaría un efecto dominó de errores de llaves foráneas).
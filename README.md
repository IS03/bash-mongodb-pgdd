**IES – Procesamiento de Grandes Volúmenes de Datos**
**Trabajo Práctico Integrador**

- Uso de Bash, Docker / Docker Compose y bases de datos NoSQL (MongoDB) para la ingestión, almacenamiento y consulta de grandes volúmenes de datos.

🎯 El objetivo es, desarrollar una solución contenerizada que permita automatizar la creación de un entorno con MongoDB y Mongo Express, importar datos de ejemplo mediante scripts en Bash y realizar consultas desde la terminal. El entorno debe ser completamente reproducible y ejecutable con un solo comando.


📁 Estructura del proyecto:
practico/
├── init.sh
├── README.md
│
├── data/
│ └── ejemplo.json
│
├── scripts/
│ └── import.sh
│
└── docker/
└── docker-compose.yml



1️⃣ Paso 1: El script crea la estructura del proyecto, verifica la instalación de Docker y genera el archivo `data/ejemplo.json` con los siguientes datos de ejemplo. Ejecutando "bash init.sh".


2️⃣ Paso 2: Define dos servicios:
🔹 mongodb
- Imagen: mongo: 7
- Usuario / contraseña: admin / admin
- Base de datos: testdb
- Volumen persistente: mongo_data
- Monta el archivo data/ejemplo.json para su importación

🔹 mongo-express
- Imagen: mongo-express:1.0.2-20
- Accesible en http://localhost:8081
- Autenticación básica: admin / admin
- Conectado al contenedor mongodb


3️⃣ Paso 3: El script ejecuta el comando mongoimport dentro del contenedor mongodb para cargar el contenido de data/ejemplo.json en la base testdb, creando la colección usuarios. Ejecutando "bash scripts/import.sh".


4️⃣ Paso 4: Desde el navegador, entro a http://localhost:8081, para corroborar que el login funciona correctamente, y puedo ingresar a testdb y abrir la
coleeción de usuarios.


5️⃣ Paso 5: Realicé consultas desde bash en el contenedor de MongoDB para validar info y todo funciona correctamente.

Consulta 1: db.usuarios.find()
    Muestra todos los registros de la colección.
    🔹 Resultado: Se visualizan los documentos correspondientes a Ana y Luis.

Consulta 2: db.usuarios.find({ edad: { $gt: 30 } })
    Filtra los usuarios con edad mayor a 30 años.
    🔹 Resultado: Devuelve únicamente a Luis (35).

Consulta 3: db.usuarios.find({ intereses: "docker" })
    Busca los usuarios que poseen el interés “docker”.
    🔹 Resultado: Devuelve a Ana (28).

Consulta 4: db.usuarios.countDocuments()
    Cuenta la cantidad total de documentos de la colección.
    🔹 Resultado: Devuelve 2.
#!/usr/bin/env bash


# PASO 1

# Creacion de las carpetas

mkdir -p data

mkdir -p scripts

mkdir -p docker


echo "Carpetas creadas."



# Verificacion de docker

docker --version


echo "Verificacion docker correcta."


# Creacion del ejemplo json

cd data

touch ejemplo.json

cat <<EOF > ejemplo.json
[
  {
    "nombre": "Ana",
    "edad": 28,
    "intereses": ["datos", "bash", "docker"]
  },
  {
    "nombre": "Luis",
    "edad": 35,
    "intereses": ["mongodb", "cloud", "devops"]
  }
]
EOF


echo "Ejemplo creado."

cd ..



#!/bin/bash

# Importar los datos de ejemplo a mongodb

docker exec -it mongodb mongoimport \
  --username admin \
  --password admin \
  --authenticationDatabase admin \
  --db testdb \
  --collection usuarios \
  --jsonArray \
  --file /data/ejemplo.json

echo "Importación completa."

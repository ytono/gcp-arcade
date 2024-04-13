#!/bin/bash

set -e
REGION=$1
PROJECT_ID=$2

gsutil cp gs://spls/gsp814/cloudsql-postgresql-tooling.zip .
unzip cloudsql-postgresql-tooling.zip

cd cloudsql-postgresql-tooling

sed -i "s/us-central1/$REGION/g" ./infrastructure/terraform/variables.tf

bash init-db.sh

cd infrastructure/terraform/

public_ip_address=$(terraform output -raw public_ip_address)
username=$(terraform output -raw username)
password=$(terraform output -raw password)
database=$(terraform output -raw db_name)

cd ../../

docker run --rm --tty -v \
"$PWD":/data mesmacosta/postgresql2datacatalog:stable \
--datacatalog-project-id=$PROJECT_ID \
--datacatalog-location-id=$REGION \
--postgresql-host=$public_ip_address \
--postgresql-user=$username \
--postgresql-pass=$password \
--postgresql-database=$database

# ./cleanup-db.sh

# docker run --rm --tty -v \
# "$PWD":/data mesmacosta/postgresql-datacatalog-cleaner:stable \
# --datacatalog-project-ids=$PROJECT_ID \
# --rdbms-type=postgresql \
# --table-container-type=schema

# ./delete-db.sh
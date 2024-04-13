#!/bin/bash

set -e

REGION=$1
PROJECT_ID=$2

gsutil cp gs://spls/gsp814/cloudsql-sqlserver-tooling.zip .
unzip cloudsql-sqlserver-tooling.zip

cd cloudsql-sqlserver-tooling

sed -i "s/us-central1/$REGION/g" ./infrastructure/terraform/variables.tf

bash init-db.sh

cd infrastructure/terraform/

public_ip_address=$(terraform output -raw public_ip_address)
username=$(terraform output -raw username)
password=$(terraform output -raw password)
database=$(terraform output -raw db_name)

cd ../../

docker run --rm --tty -v \
"$PWD":/data mesmacosta/sqlserver2datacatalog:stable \
--datacatalog-project-id=$PROJECT_ID \
--datacatalog-location-id=$REGION \
--sqlserver-host=$public_ip_address \
--sqlserver-user=$username \
--sqlserver-pass=$password \
--sqlserver-database=$database

#./cleanup-db.sh

# docker run --rm --tty -v \
# "$PWD":/data mesmacosta/sqlserver-datacatalog-cleaner:stable \
# --datacatalog-project-ids=$PROJECT_ID \
# --rdbms-type=sqlserver \
# --table-container-type=schema

# ./delete-db.sh


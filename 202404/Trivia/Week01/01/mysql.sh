#!/bin/bash

set -e
REGION=$1
PROJECT_ID=$2

gsutil cp gs://spls/gsp814/cloudsql-mysql-tooling.zip .
unzip cloudsql-mysql-tooling.zip

cd cloudsql-mysql-tooling

sed -i "s/us-central1/$REGION/g" ./infrastructure/terraform/variables.tf

bash init-db.sh


cd infrastructure/terraform/

public_ip_address=$(terraform output -raw public_ip_address)
username=$(terraform output -raw username)
password=$(terraform output -raw password)
database=$(terraform output -raw db_name)

cd ../../

docker run --rm --tty -v \
"$PWD":/data mesmacosta/mysql2datacatalog:stable \
--datacatalog-project-id=$PROJECT_ID \
--datacatalog-location-id=$REGION \
--mysql-host=$public_ip_address \
--mysql-user=$username \
--mysql-pass=$password \
--mysql-database=$database

# ./cleanup-db.sh

# docker run --rm --tty -v \
# "$PWD":/data mesmacosta/mysql-datacatalog-cleaner:stable \
# --datacatalog-project-ids=$PROJECT_ID \
# --rdbms-type=mysql \
# --table-container-type=database

# ./delete-db.sh




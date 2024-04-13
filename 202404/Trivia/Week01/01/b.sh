read -p "PROJECT_ID: " PROJECT_ID; echo $PROJECT_ID
read -p "ACCOUNT: " ACCOUNT; echo $ACCOUNT

if [ ${#ACCOUNT} -ne 0 ]; then
  gcloud auth login ${ACCOUNT} --project ${PROJECT_ID}
fi

read -p "REGION: " REGION; echo $REGION

gcloud services enable datacatalog.googleapis.com --quiet

bash sqlserver.sh $REGION $PROJECT_ID &

bash pg.sh $REGION $PROJECT_ID &

bash mysql.sh $REGION $PROJECT_ID &

gcloud iam service-accounts create sqlserver2dc-credentials \
--display-name  "Service Account for SQL Server to Data Catalog connector" \
--project $PROJECT_ID

gcloud iam service-accounts keys create "sqlserver2dc-credentials.json" \
--iam-account "sqlserver2dc-credentials@$PROJECT_ID.iam.gserviceaccount.com"

gcloud projects add-iam-policy-binding $PROJECT_ID \
--member "serviceAccount:sqlserver2dc-credentials@$PROJECT_ID.iam.gserviceaccount.com" \
--quiet \
--project $PROJECT_ID \
--role "roles/datacatalog.admin"

gcloud iam service-accounts create postgresql2dc-credentials \
--display-name  "Service Account for PostgreSQL to Data Catalog connector" \
--project $PROJECT_ID

gcloud iam service-accounts keys create "postgresql2dc-credentials.json" \
--iam-account "postgresql2dc-credentials@$PROJECT_ID.iam.gserviceaccount.com"

gcloud projects add-iam-policy-binding $PROJECT_ID \
--member "serviceAccount:postgresql2dc-credentials@$PROJECT_ID.iam.gserviceaccount.com" \
--quiet \
--project $PROJECT_ID \
--role "roles/datacatalog.admin"

gcloud iam service-accounts create mysql2dc-credentials \
--display-name  "Service Account for MySQL to Data Catalog connector" \
--project $PROJECT_ID

gcloud iam service-accounts keys create "mysql2dc-credentials.json" \
--iam-account "mysql2dc-credentials@$PROJECT_ID.iam.gserviceaccount.com"

gcloud projects add-iam-policy-binding $PROJECT_ID \
--member "serviceAccount:mysql2dc-credentials@$PROJECT_ID.iam.gserviceaccount.com" \
--quiet \
--project $PROJECT_ID \
--role "roles/datacatalog.admin"


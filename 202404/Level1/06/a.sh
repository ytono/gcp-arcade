# Getting Started with BigQuery ML

read -p "PROJECT: " PROJECT; echo $PROJECT
read -p "ACCOUNT: " ACCOUNT; echo $ACCOUNT
if [ ${#ACCOUNT} -ne 0 ]; then
  gcloud auth login ${ACCOUNT} --project ${PROJECT} --quiet
fi

read -p "INSTANCE_NAME: " INSTANCE_NAME; echo $INSTANCE_NAME
read -p "REGION: " REGION; echo $REGION

gcloud services enable dataplex.googleapis.com 

export PROJECT_ID=$(gcloud config get-value project)

gcloud config set compute/region $REGION

gcloud dataplex lakes create customer-engagements \
   --location=$REGION \
   --display-name="Customer Engagements"

gcloud dataplex zones create raw-event-data \
    --location=$REGION \
    --lake=customer-engagements \
    --display-name="Raw Event Data" \
    --resource-location-type=SINGLE_REGION \
    --type=CURATED \
    --discovery-enabled \
    --discovery-schedule="0 * * * *"

gsutil mb -l $REGION gs://$PROJECT_ID

gcloud dataplex assets create raw-event-files \
--location=$REGION \
--lake=customer-engagements \
--zone=raw-event-data \
--display-name="Raw Event Files" \
--resource-type=STORAGE_BUCKET \
--resource-name=projects/$PROJECT_ID/buckets/$PROJECT_ID \
--discovery-enabled 


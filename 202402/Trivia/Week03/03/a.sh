# Eventarc for Cloud Run

read -p "PROJECT_ID: " PROJECT_ID; echo $PROJECT_ID
read -p "ACCOUNT: " ACCOUNT; echo $ACCOUNT

if [ ${#ACCOUNT} -ne 0 ]; then
  gcloud auth login ${ACCOUNT} --project ${PROJECT_ID}
fi

gcloud config set project ${PROJECT_ID}

read -p "REGION: "  REGION; echo $REGION

export BUCKET_NAME=${PROJECT_ID}-cr-bucket

gsutil mb -p ${PROJECT_ID} \
  -l ${REGION} \
  gs://${BUCKET_NAME}/

## Task 1. Set up your environment
gcloud config set run/region "${REGION}"
gcloud config set run/platform managed
gcloud config set eventarc/location "${REGION}"

## Task 2. Enable service account

export PROJECT_NUMBER="$(gcloud projects list \
  --filter=${PROJECT_ID} \
  --format='value(PROJECT_NUMBER)')"

gcloud projects add-iam-policy-binding ${PROJECT_ID} \
  --member=serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com \
  --role='roles/eventarc.admin'

## Task 3. Event discovery

gcloud beta eventarc attributes types list

gcloud beta eventarc attributes types describe \
  google.cloud.pubsub.topic.v1.messagePublished

## Task 4. Create a Cloud Run sink

export SERVICE_NAME=event-display
export IMAGE_NAME="gcr.io/cloudrun/hello"

gcloud run deploy ${SERVICE_NAME} \
  --image ${IMAGE_NAME} \
  --allow-unauthenticated \
  --max-instances=3

## Task 5. Create a Cloud Pub/Sub event trigger
read -p "*******************************************"
gcloud beta eventarc attributes types describe \
  google.cloud.pubsub.topic.v1.messagePublished

gcloud beta eventarc triggers create trigger-pubsub \
  --destination-run-service=${SERVICE_NAME} \
  --matching-criteria="type=google.cloud.pubsub.topic.v1.messagePublished"

export TOPIC_ID=$(gcloud eventarc triggers describe trigger-pubsub \
  --format='value(transport.pubsub.topic)')

gcloud eventarc triggers list

gcloud pubsub topics publish ${TOPIC_ID} --message="Hello there"
sleep 1
gcloud pubsub topics publish ${TOPIC_ID} --message="Hello there"
sleep 1
gcloud pubsub topics publish ${TOPIC_ID} --message="Hello there"
sleep 1
gcloud pubsub topics publish ${TOPIC_ID} --message="Hello there"
sleep 1

read -p "*******************************************"
gcloud eventarc triggers delete trigger-pubsub


## Task 6. Create a Audit Logs event trigger


# gcloud projects set-iam-policy ${PROJECT_ID} auditConfigs.yaml
echo "****************************************************"
echo "****************************************************"
read -p "*** https://console.cloud.google.com/iam-admin/audit ****"
# https://console.cloud.google.com/iam-admin/audit

gsutil cp random.txt gs://${BUCKET_NAME}/random.txt

gcloud beta eventarc attributes types describe google.cloud.audit.log.v1.written

gcloud beta eventarc triggers create trigger-auditlog \
--destination-run-service=${SERVICE_NAME} \
--matching-criteria="type=google.cloud.audit.log.v1.written" \
--matching-criteria="serviceName=storage.googleapis.com" \
--matching-criteria="methodName=storage.objects.create" \
--service-account=${PROJECT_NUMBER}-compute@developer.gserviceaccount.com

gcloud eventarc triggers list

gsutil cp random.txt gs://${BUCKET_NAME}/random.txt
sleep 1
gsutil cp random.txt gs://${BUCKET_NAME}/random.txt
sleep 1
gsutil cp random.txt gs://${BUCKET_NAME}/random.txt
sleep 1
gsutil cp random.txt gs://${BUCKET_NAME}/random.txt
sleep 1

# gcloud eventarc triggers delete trigger-auditlog

# gcloud auth revoke
read -p "account_id: " ACCOUNT_ID

if [ ${#ACCOUNT_ID} -ne 0 ]; then
  gcloud auth login ${ACCOUNT_ID} --project=${PROJECT_ID}
fi

read -p "service_url: " SERVICE_URL
curl -X GET -O ${SERVICE_URL}/assets/config/tasks.json

PROJECT_ID=$(cat tasks.json|jq -r .tasks[0].project_id)
DATASET_NAME=$(cat tasks.json|jq -r .tasks[0].challenges[0].command)
REGION_NAME=$(cat tasks.json|jq -r .tasks[0].region)

bq --project_id=${PROJECT_ID} mk --location=${REGION_NAME} -d ${DATASET_NAME}
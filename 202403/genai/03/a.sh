read -p "service_url: " SERVICE_URL
read -p "account_id: " ACCOUNT_ID

PROJECT_ID=$(cat tasks.json|jq -r .tasks[0].project_id)
if [ ${#ACCOUNT_ID} -ne 0 ]; then
  gcloud auth login ${ACCOUNT_ID} --project=${PROJECT_ID}
fi

curl -X GET -O ${SERVICE_URL}/assets/config/tasks.json

DATASET_NAME=$(cat tasks.json|jq -r .tasks[0].challenges[0].command)
REGION_NAME=$(cat tasks.json|jq -r .tasks[0].challenges[2].command)

bq mk --location=${REGION_NAME} -d ${DATASET_NAME} &


DATASET_NAME=$(cat tasks.json|jq -r .tasks[1].challenges[0].command)
REGION_NAME=$(cat tasks.json|jq -r .tasks[1].challenges[2].command)
TABLE_NAME=$(cat tasks.json|jq -r .tasks[1].challenges[3].command)

bq mk --location=${REGION_NAME} -d ${DATASET_NAME}
bq mk -t ${DATASET_NAME}.${TABLE_NAME} 

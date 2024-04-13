read -p "service_url: " SERVICE_URL
read -p "account_id: " ACCOUNT_ID

if [ ${#ACCOUNT_ID} -ne 0 ]; then
  gcloud auth login ${ACCOUNT_ID} --project=${PROJECT_ID}
fi

curl -X GET -O ${SERVICE_URL}/assets/config/tasks.json

PROJECT_ID=$(cat tasks.json|jq -r .tasks[0].project_id)
gcloud config set project ${PROJECT_ID}

NETWORK_NAME=$(cat tasks.json|jq -r .tasks[0].challenges[1].command)
gcloud compute networks create ${NETWORK_NAME} --subnet-mode=custom &


NETWORK_NAME=$(cat tasks.json|jq -r .tasks[1].challenges[0].command)
SUBNET_NAME=$(cat tasks.json|jq -r .tasks[1].challenges[1].command)
REGION_NAME=$(cat tasks.json|jq -r .tasks[1].challenges[2].command)
IP_RANGE=$(cat tasks.json|jq -r .tasks[1].challenges[3].command)

gcloud compute networks create ${NETWORK_NAME} --subnet-mode=custom
gcloud compute networks subnets create ${SUBNET_NAME} --network=${NETWORK_NAME} --range=${IP_RANGE} --region=${REGION_NAME}




read -p "account_id: " ACCOUNT_ID

PROJECT_ID=$(cat tasks.json|jq -r .tasks[0].project_id)
if [ ${#ACCOUNT_ID} -ne 0 ]; then
  gcloud auth login ${ACCOUNT_ID} --project=${PROJECT_ID}
fi

read -p "service_url: " SERVICE_URL
curl -X GET -O ${SERVICE_URL}/assets/config/tasks.json

FIREWALL_NAME=$(cat tasks.json|jq -r .tasks[0].challenges[1].command)
DIRECTION=$(cat tasks.json|jq -r .tasks[0].challenges[3].command)
TARGET_TAGS=$(cat tasks.json|jq -r .tasks[0].challenges[5].command)
SOURCE_RANGES=$(cat tasks.json|jq -r .tasks[0].challenges[6].command)


gcloud compute firewall-rules create ${FIREWALL_NAME} --direction=${DIRECTION^^} --priority=1000 --network=default --action=ALLOW --rules=tcp:80 --source-ranges=${SOURCE_RANGES} --target-tags=${TARGET_TAGS}



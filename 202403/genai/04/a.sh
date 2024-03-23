read -p "account_id: " ACCOUNT_ID

PROJECT_ID=$(cat tasks.json|jq -r .tasks[0].project_id)
if [ ${#ACCOUNT_ID} -ne 0 ]; then
  gcloud auth login ${ACCOUNT_ID} --project=${PROJECT_ID}
fi

read -p "service_url: " SERVICE_URL
curl -X GET -O ${SERVICE_URL}/assets/config/tasks.json

TOPIC_NAME=$(cat tasks.json|jq -r .tasks[0].challenges[0].command)

gcloud pubsub topics create ${TOPIC_NAME} &

TOPIC_NAME=$(cat tasks.json|jq -r .tasks[1].challenges[0].command)
SUBSCRIPTION_NAME=$(cat tasks.json|jq -r .tasks[1].challenges[2].command)

gcloud pubsub topics create ${TOPIC_NAME}
gcloud pubsub subscriptions create ${SUBSCRIPTION_NAME} --topic ${TOPIC_NAME}  

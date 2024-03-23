read -p "account_id: " ACCOUNT_ID

if [ ${#ACCOUNT_ID} -ne 0 ]; then
  gcloud auth login ${ACCOUNT_ID} --project=${PROJECT_ID}
fi

read -p "service_url: " SERVICE_URL
curl -X GET -O ${SERVICE_URL}/assets/config/tasks.json

PROJECT_ID=$(cat tasks.json|jq -r .tasks[0].project_id)
REPO_NAME=$(cat tasks.json|jq -r .tasks[0].challenges[1].command)

gcloud config set project ${PROJECT_ID}
gcloud source repos create ${REPO_NAME} --project=${PROJECT_ID}
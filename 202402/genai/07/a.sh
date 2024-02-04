read -p "service_url: " SERVICE_URL

curl -X GET -O ${SERVICE_URL}/assets/config/tasks.json
cat tasks.json

echo ""
RESOURCE_NAME=`cat tasks.json | jq -r .tasks[].resource_name`

echo "RESOURCE_NAME: ${RESOURCE_NAME}"

gcloud compute networks create $RESOURCE_NAME --subnet-mode=custom

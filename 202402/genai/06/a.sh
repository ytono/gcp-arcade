read -p "service_url: " SERVICE_URL

curl -X GET -O ${SERVICE_URL}/assets/config/tasks.json
cat tasks.json

echo ""
RESOURCE_NAME=`cat tasks.json | jq -r .tasks[].resource_name`
REGION=`cat tasks.json | jq -r .tasks[].region`

echo "RESOURCE_NAME: ${RESOURCE_NAME}"
echo "REGION: ${REGION}"

gsutil mb -l $REGION gs://$RESOURCE_NAME

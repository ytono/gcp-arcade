read -p "service_url: " SERVICE_URL

curl -X GET -O ${SERVICE_URL}/assets/config/tasks.json

URI=`jq -r .uri tasks.json`
ENDPOINT=`jq -r .endpoint tasks.json`

echo "URI: ${URI}"
echo "ENDPOINT: ${ENDPOINT}"

curl -X GET https://${URI}${ENDPOINT}?message=arcade

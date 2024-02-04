read -p "service_url: " SERVICE_URL

curl -X GET -O ${SERVICE_URL}/assets/config/tasks.json

cat tasks.json

echo ""

URI=`cat tasks.json | jq -r .uri`
ENDPOINT=`cat tasks.json | jq -r .endpoint`

echo "URI: ${URI}"
echo "ENDPOINT: ${ENDPOINT}"

curl -X GET https://${URI}${ENDPOINT}?message=arcade
read -p "service_url: " SERVICE_URL

curl -X GET -O ${SERVICE_URL}/assets/config/tasks.json
curl -X GET -O ${SERVICE_URL}/assets/config/persona.json

NAME=$(jq -r '.persona[0].name' persona.json)
KNOWLEDGE=$(jq -r '.persona[0].knowledge' persona.json)
ROLE=$(jq -r '.persona[0].role' persona.json)
TOPIC=$(jq -r '.persona[0].topic' persona.json)
LIST=$(jq -r '.persona[0].role' persona.json | sed 's/I am a tutor //g' -)

MSG="Hello"
echo $MSG > response.json
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=${NAME}&message=Hello&role=${ROLE}&knowledge=${KNOWLEDGE}" | jq -r .msg >> response.json
MSG="How would I prepare for ${TOPIC}"
echo "1." $MSG >> response.json
MESSAGE=$(echo $MSG |sed 's/ /+/g')
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=${NAME}&message=${MESSAGE}%3F&role=${ROLE}&knowledge=${KNOWLEDGE}" | jq -r .msg >> response.json
MSG="What are some good sources to help with ${LIST}"
echo "2." $MSG >> response.json
MESSAGE=$(echo $MSG |sed 's/ /+/g')
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=${NAME}&message=${MESSAGE}%3F&role=${ROLE}&knowledge=${KNOWLEDGE}" | jq -r .msg >> response.json
MSG="Can you list the main topics in the ${TOPIC} exam"
echo "3." $MSG >> response.json
MESSAGE=$(echo $MSG |sed 's/ /+/g')
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=${NAME}&message=${MESSAGE}%3F&role=${ROLE}&knowledge=${KNOWLEDGE}" | jq -r .msg >> response.json

MSG="Can you list three important facts about ${TOPIC} exam"
echo "4." $MSG >> response.json
MESSAGE=$(echo $MSG |sed 's/ /+/g')
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=${NAME}&message=${MESSAGE}%3F&role=${ROLE}&knowledge=${KNOWLEDGE}" | jq -r .msg >> response.json
MSG="Where can I find out more information on ${TOPIC} exam"
echo "5." $MSG >> response.json
MESSAGE=$(echo $MSG |sed 's/ /+/g')
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=${NAME}&message=${MESSAGE}%3F&role=${ROLE}&knowledge=${KNOWLEDGE}" | jq -r .msg >> response.json
MSG="What happens after I pass the ${TOPIC} exam"
echo "6." $MSG >> response.json
MESSAGE=$(echo $MSG |sed 's/ /+/g')
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=${NAME}&message=${MESSAGE}%3F&role=${ROLE}&knowledge=${KNOWLEDGE}" | jq -r .msg >> response.json
MSG="Can you give me the URL for the ${TOPIC} exam"
echo "7." $MSG >> response.json
MESSAGE=$(echo $MSG |sed 's/ /+/g')
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=${NAME}&message=${MESSAGE}%3F&role=${ROLE}&knowledge=${KNOWLEDGE}" | jq -r .msg >> response.json
MSG="Can you write a five line poem about ${TOPIC} exam"
echo "8." $MSG >> response.json
MESSAGE=$(echo $MSG |sed 's/ /+/g')
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=${NAME}&message=${MESSAGE}%3F&role=${ROLE}&knowledge=${KNOWLEDGE}" | jq -r .msg >> response.json

URI=`jq -r .uri tasks.json`
ENDPOINT=`jq -r .endpoint tasks.json`

echo "URI: ${URI}"
echo "ENDPOINT: ${ENDPOINT}"

curl -X GET https://${URI}${ENDPOINT}?message=arcade





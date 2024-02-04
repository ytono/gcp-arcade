read -p "service_url: " SERVICE_URL

curl -X GET -O ${SERVICE_URL}/assets/config/tasks.json

cat tasks.json

echo ""
read -p "item: " ITEM
ITEM=$(echo ${ITEM} | sed 's/ /+/g')
read -p "list: " LIST
LIST=$(echo ${LIST} | sed 's/ /+/g')
read -p "topic: " TOPIC
TOPIC=$(echo ${TOPIC} | sed 's/ /+/g')
read -p "persona: " PERSONA
PERSONA=$(echo ${PERSONA} | sed 's/ /+/g')

curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=${PERSONA}&message=Hello&role=tutor&knowledge=${TOPIC}"
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=${PERSONA}&message=What+do+you+know+about+${TOPIC}%3F&role=tutor&knowledge=${TOPIC}"
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=${PERSONA}&message=What+do+you+know+about+well+known+${LIST}%3F&role=tutor&knowledge=${TOPIC}"
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=${PERSONA}&message=What+can+you+tell+me+about+${ITEM}%3F&role=tutor&knowledge=${TOPIC}"
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=${PERSONA}&message=Can+you+list+five+${LIST}%3F&role=tutor&knowledge=${TOPIC}"

curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=${PERSONA}&message=Can+you+list+three+important+facts+about+${LIST}+%3F&role=tutor&knowledge=${TOPIC}"
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=${PERSONA}&message=Where+can+I+find+out+more+information+on+${TOPIC}+and+${LIST}%3F&role=tutor&knowledge=${TOPIC}"
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=${PERSONA}&message=What+is+important+to+know+about+${ITEM}+%3F&role=tutor&knowledge=${TOPIC}"
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=${PERSONA}&message=Can+you+itemize+five+things+about+${ITEM}+%3F&role=tutor&knowledge=${TOPIC}"
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=${PERSONA}&message=Can+you+write+a+five+line+poem+about+${ITEM}+%3F&role=tutor&knowledge=${TOPIC}"

URI=`cat tasks.json | jq -r .uri`
ENDPOINT=`cat tasks.json | jq -r .endpoint`

echo "URI: ${URI}"
echo "ENDPOINT: ${ENDPOINT}"

curl -X GET https://${URI}${ENDPOINT}?message=arcade
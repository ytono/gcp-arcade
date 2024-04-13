read -p "service_url: " SERVICE_URL

curl -X GET -O ${SERVICE_URL}/assets/config/tasks.json
curl -X GET -O ${SERVICE_URL}/assets/config/persona.json

KNOWLEDGE=$(jq -r '.persona[0].knowledge' persona.json | sed 's/ /+/g')
ROLE=$(jq -r '.persona[0].role' persona.json | sed 's/ /+/g')
TOPIC=$(jq -r '.persona[0].topic' persona.json | sed 's/ /+/g')
LIST=$(jq -r '.persona[0].role' persona.json | sed 's/I am a tutor //g' - |sed 's/ /+/g')

curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=Marco&message=Hello&role=${ROLE}&knowledge=${KNOWLEDGE}" > response.json
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=Marco&message=How+would+I+prepare+for+${TOPIC}%3F&role=${ROLE}&knowledge=${KNOWLEDGE}" >> response.json
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=Marco&message=What+are+some+good+sources+to+help+with+${LIST}%3F&role=${ROLE}&knowledge=${KNOWLEDGE}" >> response.json
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=Marco&message=Can+you+list+the+main+topics+in+the+${TOPIC}+exam%3F&role=${ROLE}&knowledge=${KNOWLEDGE}" >> response.json

curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=Marco&message=Can+you+list+three+important+facts+about+${TOPIC}+exam%3F&role=${ROLE}&knowledge=${KNOWLEDGE}" >> response.json
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=Marco&message=Where+can+I+find+out+more+information+on+${TOPIC}+exam%3F&role=${ROLE}&knowledge=${KNOWLEDGE}" >> response.json
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=Marco&message=What+happens+after+I+pass+the+${TOPIC}+exam+%3F&role=${ROLE}&knowledge=${KNOWLEDGE}" >> response.json
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=Marco&message=Can+you+give+me+the+URL+for+the+${TOPIC}+exam%3F&role=${ROLE}&knowledge=${KNOWLEDGE}" >> response.json
curl -X GET "https://arcade-api-kjyo252taq-uc.a.run.app/v1/v1?name=Marco&message=Can+you+write+a+five+line+poem+about+${TOPIC}+exam%3F&role=${ROLE}&knowledge=${KNOWLEDGE}" >> response.json

URI=`jq -r .uri tasks.json`
ENDPOINT=`jq -r .endpoint tasks.json`

echo "URI: ${URI}"
echo "ENDPOINT: ${ENDPOINT}"

curl -X GET https://${URI}${ENDPOINT}?message=arcade





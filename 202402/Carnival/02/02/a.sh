#! /bin/bash

echo "Translate Text with the Cloud Translation API"

read -p "PROJECT: " PROJECT; echo $PROJECT
read -p "ACCOUNT: " ACCOUNT; echo $ACCOUNT
if [ ${#ACCOUNT} -ne 0 ]; then
  gcloud auth login ${ACCOUNT} --project ${PROJECT}
fi

## Task 1. Create an API key

export API_KEY=$(gcloud beta services api-keys create --display-name="API key 1" --format=json | jq -r .response.keyString)

## Task 2. Translate text
TEXT="My%20name%20is%20Steve"
curl "https://translation.googleapis.com/language/translate/v2?target=es&key=${API_KEY}&q=${TEXT}"

## Task 3. Detect the language
TEXT_ONE="Meu%20nome%20é%20Steven"
TEXT_TWO="日本のグーグルのオフィスは、東京の六本木ヒルズにあります"
curl "https://translation.googleapis.com/language/translate/v2/detect?key=${API_KEY}&q=${TEXT_ONE}&q=${TEXT_TWO}"


gcloud auth revoke $ACCOUNT
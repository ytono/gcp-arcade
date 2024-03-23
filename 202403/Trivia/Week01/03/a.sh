read -p "PROJECT: " PROJECT; echo $PROJECT
read -p "ACCOUNT: " ACCOUNT; echo $ACCOUNT
if [ ${#ACCOUNT} -ne 0 ]; then
  gcloud auth login ${ACCOUNT} --project ${PROJECT}
fi

## Task 1. Create an API key

export API_KEY=$(gcloud beta services api-keys create --display-name="API key 1" --format=json | jq -r .response.keyString)

echo "export API_KEY='${API_KEY}'"

gcloud compute instances list

read -p "ZONE: " ZONE

gcloud compute ssh linux-instance --zone ${ZONE}

export IMAGE_FILE=manif-des-sans-papiers.jpg
export PROJECT_ID=$DEVSHELL_PROJECT_ID

gcloud services enable vision.googleapis.com --project=$PROJECT_ID
gcloud services enable translate.googleapis.com --project=$PROJECT_ID
gcloud services enable language.googleapis.com --project=$PROJECT_ID

# Task 1. Verify your resources

export API_KEY=$(gcloud beta services api-keys create --display-name="API key 1" --format=json | jq -r .response.keyString)

# Task 2. Create Request.json file

cat <<EOF >request.json
{
  "requests": [
      {
        "image": {
          "source": {
              "gcsImageUri": "gs://${PROJECT_ID}-bucket/${IMAGE_FILE}"
          }
        },
        "features": [
          {
            "type": "TEXT_DETECTION",
            "maxResults": 10
          }
        ]
      }
  ]
}
EOF

# Task 3. Update the json file

curl -s -X POST -H "Content-Type: application/json" --data-binary @request.json https://vision.googleapis.com/v1/images:annotate?key=${API_KEY}

curl -s -X POST -H "Content-Type: application/json" --data-binary @request.json https://vision.googleapis.com/v1/images:annotate?key=${API_KEY} -o text-response.json

gsutil cp text-response.json gs://${PROJECT_ID}-bucket/

echo "****************************************************************************"
echo "****************************************************************************"
echo "****************************************************************************"
echo "****************************************************************************"
read

cat <<EOF >request.json
{
  "requests": [
      {
        "image": {
          "source": {
              "gcsImageUri": "gs://${PROJECT_ID}-bucket/${IMAGE_FILE}"
          }
        },
        "features": [
          {
            "type": "LANDMARK_DETECTION"
          }
        ]
      }
  ]
}
EOF

curl -s -X POST -H "Content-Type: application/json" --data-binary @request.json  https://vision.googleapis.com/v1/images:annotate?key=${API_KEY} -o landmark-response.json

gsutil cp landmark-response.json gs://${PROJECT_ID}-bucket/


read -p "PROJECT: " PROJECT_ID; echo $PROJECT_ID
read -p "ACCOUNT: " ACCOUNT; echo $ACCOUNT
if [ ${#ACCOUNT} -ne 0 ]; then
  gcloud auth login ${ACCOUNT} --project ${PROJECT_ID}
fi

export LOCATION=us-central1

## Task 1. Set up AutoML
gcloud services enable automl.googleapis.com

gsutil mb -p $PROJECT_ID \
    -c standard    \
    -l us \
    gs://$PROJECT_ID-vcm/

## Task 2. Upload training images to Cloud Storage
export BUCKET=$PROJECT_ID-vcm
gsutil -m cp -r gs://spls/gsp223/images/* gs://${BUCKET}

## Task 3. Create a dataset
# gsutil cp gs://spls/gsp223/data.csv .
cp data_org.csv data.csv
sed -i -e "s/placeholder/${BUCKET}/g" ./data.csv
gsutil cp ./data.csv gs://${BUCKET}

## Task 4. Inspect images
curl \
-X POST \
-H "Authorization: Bearer $(gcloud auth print-access-token)" \
-H "Content-Type: application/json; charset=utf-8" \
https://${LOCATION}-aiplatform.googleapis.com/v1/projects/${PROJECT_ID}/locations/${LOCATION}/datasets -d \
$'{
  "display_name": "clouds",
  "metadata_schema_uri": "gs://google-cloud-aiplatform/schema/dataset/metadata/image_1.0.0.yaml"
}' -o response.json

export OPERATION_NAME=$(cat response.json |jq -r .name)

curl \
-X GET \
-H "Authorization: Bearer $(gcloud auth print-access-token)" \
-H "Content-Type: application/json; charset=utf-8" \
https://${LOCATION}-aiplatform.googleapis.com/v1/${OPERATION_NAME}

export DATASET_ID=$(cat response.json |jq .name|awk -F/ '{print $6}')

read -p "pause:"

cat <<EOF > request.json
{
  "import_configs": [
    {
      "gcs_source": {
        "uris": "gs://${BUCKET}/data.csv"
      },
     "import_schema_uri" : "gs://google-cloud-aiplatform/schema/dataset/ioformat/image_classification_single_label_io_format_1.0.0.yaml"
    }
  ]
}
EOF
curl -X POST \
    -H "Authorization: Bearer $(gcloud auth print-access-token)" \
    -H "Content-Type: application/json; charset=utf-8" \
    -d @request.json \
    "https://${LOCATION}-aiplatform.googleapis.com/v1/projects/${PROJECT_ID}/locations/${LOCATION}/datasets/${DATASET_ID}:import" -o response.json

curl -X GET \
    -H "Authorization: Bearer $(gcloud auth print-access-token)" \
    -H "Content-Type: application/json; charset=utf-8" \
    -d @request.json \
    "https://${LOCATION}-aiplatform.googleapis.com/v1/projects/${PROJECT_ID}/locations/${LOCATION}/datasets/${DATASET_ID}/operations"

## Task 5. Generate predictions

gsutil cp gs://spls/gsp223/examples/* .

ENDPOINT=$(gcloud run services describe automl-service --platform managed --region ${LOCATION} --format 'value(status.url)')

## Task 6. Pop Quiz

INPUT_DATA_FILE=CLOUD1-JSON

curl -X POST -H "Content-Type: application/json" $ENDPOINT/v1 -d "@${INPUT_DATA_FILE}" | jq

INPUT_DATA_FILE=CLOUD2-JSON

curl -X POST -H "Content-Type: application/json" $ENDPOINT/v1 -d "@${INPUT_DATA_FILE}" | jq

# gcloud auth revoke $ACCOUNT
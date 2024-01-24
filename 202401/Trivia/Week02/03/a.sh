export PROJECT_ID=qwiklabs-gcp-01-8872978e85dd
export ACCOUNT=student-03-a61d519153ca@qwiklabs.net
export REGION=us-east4

gcloud auth login ${ACCOUNT} --project=${PROJECT_ID}

export ID=$(gcloud info --format='value(config.project)')

gcloud functions deploy GCFunction --region=$REGION --trigger-http --source=. --entry-point=helloHttp --runtime nodejs18 --quiet

##
curl -m 70 -X POST https://$REGION-$PROJECT_ID.cloudfunctions.net/GCFunction \
-H "Authorization: bearer $(gcloud auth print-identity-token)" \
-H "Content-Type: application/json" \
-d '{"message":"Hello World!"}'

gcloud auth revoke
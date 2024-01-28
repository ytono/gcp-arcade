read -p "Region : " REGION

gcloud services enable run.googleapis.com

sleep 25

mkdir gc-function
mv index.js package.json gc-function

gcloud functions deploy GCFunction --region=$REGION --gen2 --trigger-http --source=./gc-function --entry-point=helloWorld --runtime=nodejs20 --allow-unauthenticated --max-instances=5 --quiet

sleep 2
##
curl -m 70 -X POST https://$REGION-$DEVSHELL_PROJECT_ID.cloudfunctions.net/GCFunction \
-H "Authorization: bearer $(gcloud auth print-identity-token)" \
-H "Content-Type: application/json" \
-d '{"message":"Hello World!"}'

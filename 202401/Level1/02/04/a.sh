export PROJECT_ID=$(gcloud config get-value project)

read -p "Region : " REGION

gcloud config set compute/region $REGION


gcloud services enable \
  artifactregistry.googleapis.com \
  cloudfunctions.googleapis.com \
  cloudbuild.googleapis.com \
  eventarc.googleapis.com \
  run.googleapis.com \
  logging.googleapis.com \
  pubsub.googleapis.com

# Task 2. Create an HTTP function

mkdir ~/hello-http
mv index.js package.json ~/hello-http
cd ~/hello-http

gcloud functions deploy nodejs-http-function \
  --gen2 \
  --runtime nodejs16 \
  --entry-point helloWorld \
  --source . \
  --region $REGION \
  --trigger-http \
  --timeout 600s \
  --max-instances 1

gcloud functions call nodejs-http-function \
  --gen2 --region $REGION

# Task 3. Create a Cloud Storage function

PROJECT_NUMBER=$(gcloud projects list --filter="project_id:$PROJECT_ID" --format='value(project_number)')
SERVICE_ACCOUNT=$(gsutil kms serviceaccount -p $PROJECT_NUMBER)

gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member serviceAccount:$SERVICE_ACCOUNT \
  --role roles/pubsub.publisher

mkdir ~/hello-storage
mv index2.js ~/hello-storage/index.js
mv package2.json ~/hello-storage/package.json
cd ~/hello-storage

BUCKET="gs://gcf-gen2-storage-$PROJECT_ID"
gsutil mb -l $REGION $BUCKET

gcloud functions deploy nodejs-storage-function \
  --gen2 \
  --runtime nodejs16 \
  --entry-point helloStorage \
  --source . \
  --region $REGION \
  --trigger-bucket $BUCKET \
  --trigger-location $REGION \
  --max-instances 1

echo "Hello World" > random.txt
gsutil cp random.txt $BUCKET/random.txt

gcloud functions logs read nodejs-storage-function \
  --region $REGION --gen2 --limit=100 --format "value(log)"

# Task 4. Create a Cloud Audit Logs function

read -p "Audit Log Settings"

gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member serviceAccount:$PROJECT_NUMBER-compute@developer.gserviceaccount.com \
  --role roles/eventarc.eventReceiver

cd ~
git clone https://github.com/GoogleCloudPlatform/eventarc-samples.git

cd ~/eventarc-samples/gce-vm-labeler/gcf/nodejs

gcloud functions deploy gce-vm-labeler \
  --gen2 \
  --runtime nodejs16 \
  --entry-point labelVmCreation \
  --source . \
  --region $REGION \
  --trigger-event-filters="type=google.cloud.audit.log.v1.written,serviceName=compute.googleapis.com,methodName=beta.compute.instances.insert" \
  --trigger-location $REGION \
  --max-instances 1

read -p "Create a VM"

gcloud compute instances list

read -p "ZONE: " ZONE

gcloud compute instances describe instance-1 --zone $ZONE

gcloud compute instances delete instance-1 --zone $ZONE

# Task 5. Deploy different revisions

mkdir ~/hello-world-colored
mv main.py ~/hello-world-colored/main.py
touch ~/hello-world-colored/requirements.txt
cd ~/hello-world-colored

COLOR=orange
gcloud functions deploy hello-world-colored \
  --gen2 \
  --runtime python39 \
  --entry-point hello_world \
  --source . \
  --region $REGION \
  --trigger-http \
  --allow-unauthenticated \
  --update-env-vars COLOR=$COLOR \
  --max-instances 1

COLOR=yellow
gcloud functions deploy hello-world-colored \
  --gen2 \
  --runtime python39 \
  --entry-point hello_world \
  --source . \
  --region $REGION \
  --trigger-http \
  --allow-unauthenticated \
  --update-env-vars COLOR=$COLOR \
  --max-instances 1

mkdir ~/min-instances
mv main.go go.mod ~/min-instances
cd ~/min-instances

gcloud functions deploy slow-function \
  --gen2 \
  --runtime go116 \
  --entry-point HelloWorld \
  --source . \
  --region $REGION \
  --trigger-http \
  --allow-unauthenticated \
  --max-instances 4

gcloud functions call slow-function \
  --gen2 --region $REGION

gcloud functions deploy slow-function \
  --gen2 \
  --runtime go116 \
  --entry-point HelloWorld \
  --source . \
  --region $REGION \
  --trigger-http \
  --allow-unauthenticated \
  --min-instances 1 \
  --max-instances 4

gcloud functions call slow-function \
  --gen2 --region $REGION

# Task 7. Create a function with concurrency

SLOW_URL=$(gcloud functions describe slow-function --region $REGION --gen2 --format="value(serviceConfig.uri)")

hey -n 10 -c 10 $SLOW_URL

gcloud run services delete slow-function --region $REGION

gcloud functions deploy slow-concurrent-function \
  --gen2 \
  --runtime go116 \
  --entry-point HelloWorld \
  --source . \
  --region $REGION \
  --trigger-http \
  --allow-unauthenticated \
  --min-instances 1 \
  --max-instances 4 

gcloud functions deploy slow-concurrent-function \
  --gen2 \
  --runtime go116 \
  --entry-point HelloWorld \
  --source . \
  --region $REGION \
  --trigger-http \
  --allow-unauthenticated \
  --min-instances 1 \
  --max-instances 4 \
  --max-concurrency 100 \
  --cpu 1
  
SLOW_CONCURRENT_URL=$(gcloud functions describe slow-concurrent-function --region $REGION --gen2 --format="value(serviceConfig.uri)")

hey -n 10 -c 10 $SLOW_CONCURRENT_URL




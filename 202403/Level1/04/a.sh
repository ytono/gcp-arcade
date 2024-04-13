# Getting Started with BigQuery ML

read -p "PROJECT: " PROJECT; echo $PROJECT
read -p "ACCOUNT: " ACCOUNT; echo $ACCOUNT
if [ ${#ACCOUNT} -ne 0 ]; then
  gcloud auth login ${ACCOUNT} --project ${PROJECT}
fi

read -p "REGION: " REGION; echo $REGION

gcloud artifacts repositories create my-repository --repository-format=docker --location=${REGION}

gcloud auth configure-docker ${REGION}-docker.pkg.dev

cd test

docker build -t ${REGION}-docker.pkg.dev/${PROJECT}/my-repository/node-app:0.2 .

docker images

docker push ${REGION}-docker.pkg.dev/${PROJECT}/my-repository/node-app:0.2
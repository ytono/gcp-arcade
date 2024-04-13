# Deploy Your Website on Cloud Run
read -p "PROJECT: " PROJECT; echo $PROJECT
read -p "ACCOUNT: " ACCOUNT; echo $ACCOUNT
if [ ${#ACCOUNT} -ne 0 ]; then
  gcloud auth login ${ACCOUNT} --project ${PROJECT}
fi

read -p "REGION: " REGION; echo $REGION

# タスク 1. ソース リポジトリのクローンを作成する
# git clone https://github.com/googlecodelabs/monolith-to-microservices.git
# cd ~/monolith-to-microservices
cd ~/monolith-to-microservices/monolith

# タスク 2. Cloud Build を使用して Docker コンテナを作成する
gcloud artifacts repositories create monolith-demo --repository-format=docker --location=${REGION}

gcloud auth configure-docker 

gcloud services enable artifactregistry.googleapis.com \
    cloudbuild.googleapis.com \
    run.googleapis.com

gcloud builds submit --tag ${REGION}-docker.pkg.dev/${PROJECT}/monolith-demo/monolith:1.0.0

cd ~/monolith-to-microservices/react-app/src/pages/Home
mv index.js.new index.js

cat ~/monolith-to-microservices/react-app/src/pages/Home/index.js

cd ~/monolith-to-microservices/react-app
npm run build:monolith &

# タスク 3. コンテナを Cloud Run にデプロイする
cd ~/monolith-to-microservices/monolith
gcloud run deploy monolith --image ${REGION}-docker.pkg.dev/${PROJECT}/monolith-demo/monolith:1.0.0 --region ${REGION} --quiet

gcloud run services list

# タスク 4. 同時実行の値を小さくした新しいリビジョンを作成する
gcloud run deploy monolith --image ${REGION}-docker.pkg.dev/${PROJECT}/monolith-demo/monolith:1.0.0 --region ${REGION} --concurrency 1

echo "Check!!!!!"

gcloud run deploy monolith --image ${REGION}-docker.pkg.dev/${PROJECT}/monolith-demo/monolith:1.0.0 --region ${REGION} --concurrency 80

# タスク 5. ウェブサイトに変更を加える
# cd ~/monolith-to-microservices/react-app/src/pages/Home
# mv index.js.new index.js

# cat ~/monolith-to-microservices/react-app/src/pages/Home/index.js

# cd ~/monolith-to-microservices/react-app
# npm run build:monolith

cd ~/monolith-to-microservices/monolith
gcloud builds submit --tag ${REGION}-docker.pkg.dev/${PROJECT}/monolith-demo/monolith:2.0.0

echo "Check!!!!!"
# タスク 6. ダウンタイムなしでウェブサイトを更新する

gcloud run deploy monolith --image ${REGION}-docker.pkg.dev/${PROJECT}/monolith-demo/monolith:2.0.0 --region ${REGION}

echo "Check!!!!!"

gcloud run services describe monolith --platform managed --region ${REGION}

gcloud beta run services list


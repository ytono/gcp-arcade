# Getting Started with BigQuery ML

read -p "PROJECT: " PROJECT; echo $PROJECT
read -p "ACCOUNT: " ACCOUNT; echo $ACCOUNT
if [ ${#ACCOUNT} -ne 0 ]; then
  gcloud auth login ${ACCOUNT} --project ${PROJECT}
fi

read -p "ZONE: " ZONE; echo $ZONE

gcloud config set compute/region ${ZONE%-*}
gcloud config set compute/zone ${ZONE}

gcloud container clusters create --machine-type=e2-medium --zone=${ZONE} --num-nodes=1 lab-cluster

gcloud container clusters get-credentials lab-cluster --zone=${ZONE}

kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0

kubectl expose deployment hello-server --type=LoadBalancer --port 8080

kubectl get service

read -p "wait" ; sleep 5
kubectl get service
read -p "wait" ; sleep 2
kubectl get service
read -p "wait" ; sleep 2

gcloud container clusters delete lab-cluster


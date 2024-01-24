
gcloud container clusters create "standard-cluster-1" --zone="us-central1-a"

kubectl apply -f deployment.yaml

gcloud container clusters resize "standard-cluster-1" --num-nodes=4 --zone="us-central1-a"


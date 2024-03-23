read -p "PROJECT_ID: " PROJECT_ID; echo $PROJECT_ID
read -p "ACCOUNT: " ACCOUNT; echo $ACCOUNT

if [ ${#ACCOUNT} -ne 0 ]; then
  gcloud auth login ${ACCOUNT} --project ${PROJECT_ID}
fi

read -p "ZONE: " ZONE; echo $ZONE

gcloud config set compute/zone ${ZONE}
gcloud container clusters create io --num-nodes 1


# タスク 2. Kubernetes のクイックデモ
kubectl create deployment nginx --image=nginx:1.10.0
kubectl get pods

kubectl expose deployment nginx --port 80 --type LoadBalancer
kubectl get services

# タスク 3. Pod


# タスク 4. Pod を作成する
cd orchestrate-with-kubernetes/kubernetes
cat pods/monolith.yaml

kubectl create -f pods/monolith.yaml
kubectl get pods
kubectl describe pods monolith

# タスク 5. Pod を操作する
kubectl port-forward monolith 10080:80 &

curl http://127.0.0.1:10080
curl http://127.0.0.1:10080/secure

curl -u user http://127.0.0.1:10080/login

TOKEN=$(curl http://127.0.0.1:10080/login -u user|jq -r '.token')

curl -H "Authorization: Bearer $TOKEN" http://127.0.0.1:10080/secure

kubectl logs monolith

# kubectl logs -f monolith

curl http://127.0.0.1:10080

kubectl exec monolith --stdin --tty -c monolith -- ping -c 3 google.com



# タスク 6. Service

# タスク 7. Service を作成する

cat pods/secure-monolith.yaml

kubectl create secret generic tls-certs --from-file tls/
kubectl create configmap nginx-proxy-conf --from-file nginx/proxy.conf
kubectl create -f pods/secure-monolith.yaml

cat services/monolith.yaml

kubectl create -f services/monolith.yaml

gcloud compute firewall-rules create allow-monolith-nodeport --allow=tcp:31000

gcloud compute instances list

read -p "EXTERNAL_IP: " EXTERNAL_IP; echo $EXTERNAL_IP

curl -k https://${EXTERNAL_IP}:31000

# タスク 8. Pod にラベルを追加する

kubectl get pods -l "app=monolith"

kubectl get pods -l "app=monolith,secure=enabled"

kubectl label pods secure-monolith 'secure=enabled'

kubectl get pods secure-monolith --show-labels

kubectl describe services monolith | grep Endpoints

gcloud compute instances list
curl -k https://$EXTERNAL_IP:31000

# タスク 9. Kubernetes でアプリケーションをデプロイする

# タスク 10. Deployment を作成する

cat deployments/auth.yaml
kubectl create -f deployments/auth.yaml

kubectl create -f services/auth.yaml

kubectl create -f deployments/hello.yaml
kubectl create -f services/hello.yaml

kubectl create configmap nginx-frontend-conf --from-file=nginx/frontend.conf
kubectl create -f deployments/frontend.yaml
kubectl create -f services/frontend.yaml

kubectl get services frontend


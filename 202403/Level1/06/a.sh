# Deploy Your Website on Cloud Run
read -p "PROJECT: " PROJECT; echo $PROJECT
read -p "ACCOUNT: " ACCOUNT; echo $ACCOUNT
if [ ${#ACCOUNT} -ne 0 ]; then
  gcloud auth login ${ACCOUNT} --project ${PROJECT}
fi

read -p "REGION: " REGION; echo $REGION

export PROJECT_NUMBER=`gcloud projects describe ${PROJECT} --format "value(projectNumber)"`

# タスク 1. HTTP とヘルスチェックのファイアウォール ルールを構成する
gcloud compute firewall-rules create app-allow-http --network my-internal-app --allow tcp:80 --source-ranges 0.0.0.0/0 --target-tags lb-backend
gcloud compute firewall-rules create app-allow-health-check --allow tcp --source-ranges "130.211.0.0/22,35.191.0.0/16" --target-tags lb-backend

# タスク 2. インスタンス テンプレートを構成し、インスタンス グループを作成する
gcloud compute instance-templates create instance-template-1 --machine-type=e2-medium --network-interface=network-tier=PREMIUM,subnet=subnet-a --metadata=startup-script-url=gs://cloud-training/gcpnet/ilb/startup.sh --maintenance-policy=MIGRATE --provisioning-model=STANDARD --service-account=${PROJECT_NUMBER}-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --region=${REGION} --tags=lb-backend --create-disk=auto-delete=yes,boot=yes,device-name=instance-template-1,image=projects/debian-cloud/global/images/debian-12-bookworm-v20240312,mode=rw,size=10,type=pd-balanced --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any
gcloud compute instance-templates create instance-template-2 --machine-type=e2-medium --network-interface=network-tier=PREMIUM,subnet=subnet-b --metadata=startup-script-url=gs://cloud-training/gcpnet/ilb/startup.sh --maintenance-policy=MIGRATE --provisioning-model=STANDARD --service-account=${PROJECT_NUMBER}-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --region=${REGION} --tags=lb-backend --create-disk=auto-delete=yes,boot=yes,device-name=instance-template-1,image=projects/debian-cloud/global/images/debian-12-bookworm-v20240312,mode=rw,size=10,type=pd-balanced --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any

gcloud compute instance-groups managed create instance-group-1 --base-instance-name=instance-group-1 --size=1 --template=projects/${PROJECT}/global/instanceTemplates/instance-template-1 --zone=${REGION}-a --list-managed-instances-results=PAGELESS --no-force-update-on-repair --default-action-on-vm-failure=repair --standby-policy-mode=manual
gcloud compute instance-groups managed set-autoscaling instance-group-1 --zone=${REGION}-a --cool-down-period=45 --max-num-replicas=5 --min-num-replicas=1 --mode=on --target-cpu-utilization=0.8

gcloud compute instance-groups managed create instance-group-2 --base-instance-name=instance-group-2 --size=1 --template=projects/${PROJECT}/global/instanceTemplates/instance-template-2 --zone=${REGION}-b --list-managed-instances-results=PAGELESS --no-force-update-on-repair --default-action-on-vm-failure=repair --standby-policy-mode=manual
gcloud compute instance-groups managed set-autoscaling instance-group-2 --zone=${REGION}-b --cool-down-period=45 --max-num-replicas=5 --min-num-replicas=1 --mode=on --target-cpu-utilization=0.8

gcloud compute instances create utility-vm \
    --zone=${REGION}-a \
    --machine-type=e2-micro \
    --network-interface=network=my-internal-app,network-tier=PREMIUM,private-network-ip=10.10.20.50,stack-type=IPV4_ONLY,subnet=subnet-a \
    --maintenance-policy=MIGRATE \
    --provisioning-model=STANDARD \
    --service-account=${PROJECT_NUMBER}-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
    --create-disk=auto-delete=yes,boot=yes,device-name=utility-vm,image=projects/debian-cloud/global/images/debian-12-bookworm-v20240312,mode=rw,size=10,type=projects/${PROJECT}/zones/${REGION}-a/diskTypes/pd-balanced \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --labels=goog-ec-src=vm_add-gcloud \
    --reservation-affinity=any
  
# タスク 3. 内部ロードバランサを構成する

# タスク 4. 内部ロードバランサをテストする


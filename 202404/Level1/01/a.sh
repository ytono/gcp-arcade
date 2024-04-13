# Getting Started with BigQuery ML

read -p "PROJECT: " PROJECT; echo $PROJECT
read -p "ACCOUNT: " ACCOUNT; echo $ACCOUNT
if [ ${#ACCOUNT} -ne 0 ]; then
  gcloud auth login ${ACCOUNT} --project ${PROJECT} --quiet
fi

read -p "INSTANCE_NAME: " INSTANCE_NAME; echo $INSTANCE_NAME
read -p "ZONE: " ZONE; echo $ZONE

cat <<EOF > request.json
{
    "kind": "compute#firewall",
    "name": "default-allow-http",
    "selfLink": "projects/${PROJECT}/global/firewalls/default-allow-http",
    "network": "projects/${PROJECT}/global/networks/default",
    "direction": "INGRESS",
    "priority": 1000,
    "targetTags": [
        "http-server"
    ],
    "allowed": [
        {
            "IPProtocol": "tcp",
            "ports": [
                "80"
            ]
        }
    ],
    "sourceRanges": [
        "0.0.0.0/0"
    ]
}
EOF

curl \
-X POST \
-H "Authorization: Bearer $(gcloud auth print-access-token)" \
-H "Content-Type: application/json; charset=utf-8" \
https://www.googleapis.com/compute/v1/projects/${PROJECT}/global/firewalls --data-binary @request.json

gcloud compute instances create ${INSTANCE_NAME} \
    --zone=${ZONE} \
    --machine-type=e2-medium \
    --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default \
    --metadata=startup-script=sudo\ \
apt-get\ install\ apache2\ --yes \
    --maintenance-policy=MIGRATE \
    --provisioning-model=STANDARD \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
    --tags=http-server \
    --create-disk=auto-delete=yes,boot=yes,device-name=${INSTANCE_NAME},image=projects/debian-cloud/global/images/debian-12-bookworm-v20240312,mode=rw,size=10,type=projects/${PROJECT}/zones/${ZONE}/diskTypes/pd-balanced \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --labels=goog-ec-src=vm_add-gcloud \
    --reservation-affinity=any

export IP=$(gcloud compute instances describe ${INSTANCE_NAME} --zone=${ZONE} --format='value(networkInterfaces[0].accessConfigs[0].natIP)')
curl http://${IP}
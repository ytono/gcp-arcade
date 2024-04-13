# Terraform の状態の管理
read -p "PROJECT: " PROJECT; echo $PROJECT
read -p "ACCOUNT: " ACCOUNT; echo $ACCOUNT
if [ ${#ACCOUNT} -ne 0 ]; then
  gcloud auth login ${ACCOUNT} --project ${PROJECT}
  gcloud auth application-default login ${ACCOUNT} --project ${PROJECT}
fi

read -p "REGION: " REGION; echo $REGION

# タスク 1. バックエンドの操作

cat <<EOF > main.tf
provider "google" {
  project     = "${PROJECT}"
  region      = "${REGION}"
}

resource "google_storage_bucket" "test-bucket-for-state" {
  name        = "${PROJECT}"
  location    = "US"
  uniform_bucket_level_access = true
}

terraform {
  backend "local" {
    path = "terraform/state/terraform.tfstate"
  }
}
EOF

terraform init
terraform apply -auto-approve
terraform show

cat <<EOF > main.tf
provider "google" {
  project     = "${PROJECT}"
  region      = "${REGION}"
}

resource "google_storage_bucket" "test-bucket-for-state" {
  name        = "${PROJECT}"
  location    = "US"
  uniform_bucket_level_access = true
}

terraform {
  backend "gcs" {
    bucket  = "${PROJECT}"
    prefix  = "terraform/state"
  }
}
EOF

terraform init -reconfigure

gcloud storage buckets update gs://${PROJECT} --update-labels=key=value

terraform refresh
terraform show

echo "Check!!!!"

# タスク 2. Terraform 構成のインポート

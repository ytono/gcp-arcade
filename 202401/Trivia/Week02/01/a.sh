# Validating Policies for Terraform on Google Cloud

USER=`gcloud config get core/account`

## Validate a constraint
git clone https://github.com/GoogleCloudPlatform/policy-library.git

cd policy-library/
cp samples/iam_service_accounts_only.yaml policies/constraints

cat policies/constraints/iam_service_accounts_only.yaml

echo <<EOF > main.tf
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 3.84"
    }
  }
}

resource "google_project_iam_binding" "sample_iam_binding" {
  project = "$DEVSHELL_PROJECT_ID"
  role    = "roles/viewer"

  members = [
    "user:$USER"
  ]
}
EOF

terraform init

terraform plan -out=test.tfplan

terraform show -json ./test.tfplan > ./tfplan.json

sudo apt-get install google-cloud-sdk-terraform-tools

gcloud beta terraform vet tfplan.json --policy-library=.

read -p "- qwiklabs.net" yn

terraform plan -out=test.tfplan

gcloud beta terraform vet tfplan.json --policy-library=.

terraform apply test.tfplan -auto-approve








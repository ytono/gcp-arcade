# Validating Policies for Terraform on Google Cloud

USER_ACCOUNT=`gcloud config get core/account`

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
  project = "DEVSHELL_PROJECT_ID"
  role    = "roles/viewer"

  members = [
    "user:USER_ACCOUNT"
  ]
}
EOF

sed -i "s/DEVSHELL_PROJECT_ID/${DEVSHELL_PROJECT_ID}/g" main.tf
sed -i "s/USER_ACCOUNT/${USER_ACCOUNT}/g" main.tf

terraform init

terraform plan -out=test.tfplan

terraform show -json ./test.tfplan > ./tfplan.json

sudo apt-get install google-cloud-sdk-terraform-tools

gcloud beta terraform vet tfplan.json --policy-library=.

echo <<EOF >> ~/policy-library/policies/constraints/iam_service_accounts_only.yaml
    - qwiklabs.net
EOF

terraform plan -out=test.tfplan

gcloud beta terraform vet tfplan.json --policy-library=.

terraform apply test.tfplan -auto-approve








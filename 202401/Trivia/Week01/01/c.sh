# Managing Vault Tokens

read -p "ROOT Key: " ROOT_TOKEN

export VAULT_ADDR="http://127.0.0.1:8200"
export VAULT_TOKEN="${ROOT_TOKEN}"

echo $VAULT_ADDR
echo $VAULT_TOKEN

vault status

### Tokens overview

unset VAULT_TOKEN

vault auth enable approle

vault write auth/approle/role/jenkins policies="jenkins" period="24h"

vault read -format=json auth/approle/role/jenkins/role-id | jq -r ".data.role_id" > role_id.txt

vault write -f -format=json auth/approle/role/jenkins/secret-id | jq -r ".data.secret_id" > secret_id.txt

vault write auth/approle/login role_id=$(cat role_id.txt) secret_id=$(cat secret_id.txt)

read -p "Token: " TOKEN

vault token lookup $TOKEN

vault token lookup -format=json $TOKEN | jq -r .data.policies > token_policies.txt

export PROJECT_ID=$(gcloud config get-value project)
gsutil cp token_policies.txt gs://$PROJECT_ID

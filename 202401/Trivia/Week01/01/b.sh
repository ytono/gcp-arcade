# Managing Vault Tokens

read -p "ROOT Key: " ROOT_TOKEN

export VAULT_ADDR="http://127.0.0.1:8200"
export VAULT_TOKEN="${ROOT_TOKEN}"

echo $VAULT_ADDR
echo $VAULT_TOKEN

vault status

### Tokens overview

## Task 3. Service tokens

### Tokens with use limit

vault token create -ttl=1h -use-limit=2 -policy=default

read -p "Limit Token: " USE_LIMIT_TOKEN

VAULT_TOKEN=$USE_LIMIT_TOKEN vault token lookup

VAULT_TOKEN=$USE_LIMIT_TOKEN vault write cubbyhole/token value=1234567890

VAULT_TOKEN=$USE_LIMIT_TOKEN vault read cubbyhole/token

### Periodic service tokens

vault token create -policy="default" -period=24h

read -p "Limit Token: " USE_PERIODIC_TOKEN

vault token lookup $USE_PERIODIC_TOKEN

### Renew service tokens

vault token create -ttl=45 -explicit-max-ttl=120

read -p "Limit Token: " TOKEN

vault token renew $TOKEN

sleep 15

vault token renew -increment=60 $TOKEN

sleep 15

vault token renew -increment=60 $TOKEN

sleep 92

### Short-lived tokens

vault token create -ttl=60s

read -p "Short-lived Token: " TOKEN

vault token lookup $TOKEN

### Orphan tokens

vault token create -orphan

read -p "Orphan Token: " TOKEN

vault token lookup $TOKEN

### Token role

vault write auth/token/roles/zabbix \
    allowed_policies="policy1, policy2, policy3" \
    orphan=true \
    period=8h

vault token create -role=zabbix

### Revoke service tokens

vault policy write test -<<EOF
path "auth/token/create" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
EOF

vault token create -ttl=60 -policy=test -format=json | jq -r ".auth.client_token" > parent_token.txt

VAULT_TOKEN=$(cat parent_token.txt) vault token create -ttl=180 -policy=default -format=json | jq -r ".auth.client_token" > child_token.txt

VAULT_TOKEN=$(cat parent_token.txt) vault token create -orphan -ttl=180 -policy=default -format=json | jq -r ".auth.client_token" > orphan_token.txt

vault token revoke $(cat parent_token.txt)

vault token lookup $(cat parent_token.txt)

vault token lookup $(cat child_token.txt)

vault token lookup $(cat orphan_token.txt)

### Apply token types

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

## Task 4. Batch tokens

### Create batch tokens

vault policy write test -<<EOF
path "auth/token/create" {
   capabilities = ["create", "read", "update", "delete", "list"]
}
EOF

vault token create -type=batch -policy=test -ttl=20m

read -p "Batch Token: " TOKEN

vault token lookup $TOKEN

### Test batch tokens

vault login $TOKEN

vault write cubbyhole/token value="1234567890"

vault token create -policy=default

vault login $ROOT_TOKEN

vault token revoke $TOKEN

### Apply batch tokens

vault write auth/approle/role/shipping policies="shipping" \
     token_type="batch" \
     token_ttl="20m"

vault read -format=json auth/approle/role/shipping/role-id \
    | jq -r ".data.role_id" > role_id.txt

vault write -f -format=json auth/approle/role/shipping/secret-id | jq -r ".data.secret_id" > secret_id.txt

vault write auth/approle/login role_id=$(cat role_id.txt) \
     secret_id=$(cat secret_id.txt)

read -p "Batch Token: " TOKEN

vault token lookup $TOKEN

## Task 5. Token management

### Configure the token TTL

vault token create -policy=default

vault auth list -detailed

vault read sys/auth/token/tune

vault write sys/auth/token/tune default_lease_ttl=8h max_lease_ttl=720h

vault read sys/auth/token/tune

vault token create -policy=default

### Get the token count

vault read sys/internal/counters/tokens

curl --header "X-Vault-Token:<your root token>" \
       $VAULT_ADDR/v1/sys/internal/counters/tokens | jq .data




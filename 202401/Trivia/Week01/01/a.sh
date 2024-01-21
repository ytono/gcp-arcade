# Managing Vault Tokens

## Task 1. Install Vault
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt-get update
sudo apt-get install vault

vault

## Task 2. Start the Vault server

vault server -dev
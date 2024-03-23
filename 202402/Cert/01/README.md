# Arcade Hero: Enter the Storage
mkdir instance
curl -O https://raw.githubusercontent.com/ytono/gcp-arcade/main/202402/Cert/01/provider.tf
curl -O https://raw.githubusercontent.com/ytono/gcp-arcade/main/202402/Cert/01/mynetwork.tf
curl -O https://raw.githubusercontent.com/ytono/gcp-arcade/main/202402/Cert/01/instance/main.tf
curl -O https://raw.githubusercontent.com/ytono/gcp-arcade/main/202402/Cert/01/instance/variables.tf

mv main.tf instance/
mv variables.tf instance/

terraform init
terraform apply -auto-approve
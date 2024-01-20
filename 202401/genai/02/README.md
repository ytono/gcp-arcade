PROJECT_ID=

pip install google-cloud-aiplatform==1.36.2 --upgrade --user

curl -O https://raw.githubusercontent.com/ytono/gcp-arcade/blob/main/202401/genai/02/a.py

sed -i 's/<PROJECT_ID>/${PROJECT_ID}/g' a.py

python a.py

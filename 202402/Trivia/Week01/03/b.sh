read -p "USERNAME: " USERNAME
read -p "PROJECT_ID: " PROJECT_ID

gcloud auth login $USERNAME --PROJECT $PROJECT_ID --force

# Task 1. Enable Google App Engine Admin API

gcloud services enable appengine.googleapis.com

# Task 2. Download the Hello World app
cd helloworld

# Task 3. Deploy your app

gcloud app create

gcloud app deploy --quiet

# Task 4. View your application

gcloud app browse

# Task 5. Make a change

sed -i "s/hello world/goodbye world/g" index.php

gcloud app deploy --quiet

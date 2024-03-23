# Task 1. Enable Google App Engine Admin API

gcloud services enable appengine.googleapis.com

# Task 2. Download the Hello World app
git clone https://github.com/GoogleCloudPlatform/java-docs-samples.git

cd java-docs-samples/appengine-java8/helloworld

# Task 3. Test the application using the development server

mvn clean
mvn package

# mvn appengine:run

# Task 4. Deploy your app

gcloud app create

sed -i "s/gcloud app create/$PROJECT_ID/g" pom.xml

mvn package appengine:deploy

# Task 5. View your application

gcloud app browse

# Task 6. Test your knowledge

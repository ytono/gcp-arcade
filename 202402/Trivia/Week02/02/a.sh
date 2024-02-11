read -p "Region: " REGION


## Task 1. Prepare the case study application
git clone https://github.com/GoogleCloudPlatform/training-data-analyst

ln -s ~/training-data-analyst/courses/developingapps/v1.3/python/firebase ~/firebase

cd ~/firebase/start

sed -i "s/us-central/$REGION/g" prepare_environment.sh

. prepare_environment.sh

python run_server.py

## Task 2. Examine the case study application code
## Task 3. Configure Identity Platform Authentication
## Task 4. Integrate a client-side web application with Identity Platform
## Task 5. Run the application



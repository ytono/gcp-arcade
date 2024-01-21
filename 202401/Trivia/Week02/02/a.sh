export PROJECT_ID=$DEVSHELL_PROJECT_ID
export ACCOUNT=`gcloud config get core/account`

read -p "Account 2: " ACCOUNT2

gcloud auth login $ACCOUNT --project=$PROJECT_ID

gsutil mb -p $PROJECT_ID gs://$PROJECT_ID
gsutil cp sample.txt gs://$PROJECT_ID/

gcloud projects remove-iam-policy-binding $PROJECT_ID \
    --member=user:$ACCOUNT2 --role=roles/viewer 

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member=user:$ACCOUNT2 --role=roles/storage.objectViewer

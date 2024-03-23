read -p "PROJECT: " PROJECT_ID; echo $PROJECT_ID
read -p "ACCOUNT: " ACCOUNT; echo $ACCOUNT
if [ ${#ACCOUNT} -ne 0 ]; then
  gcloud auth login ${ACCOUNT} --project ${PROJECT_ID}
fi

# Task 1. Create an API key
export API_KEY=$(gcloud beta services api-keys create --display-name="API key 1" --format=json | jq -r .response.keyString)


# Task 2. Upload an image to a Cloud Storage bucket

gcloud storage buckets create gs://${PROJECT_ID}-bucket --no-uniform-bucket-level-access --no-public-access-prevention

gcloud storage cp *.png gs://${PROJECT_ID}-bucket/

gcloud storage objects update gs://${PROJECT_ID}-bucket/*.png --add-acl-grant=entity=allUsers,role=READER

# Task 3. Create your request

cat <<EOF > request.json
{
"requests": [
    {
        "image": {
        "source": {
            "gcsImageUri": "gs://${PROJECT_ID}-bucket/donuts.png"
        }
        },
        "features": [
        {
            "type": "LABEL_DETECTION",
            "maxResults": 10
        }
        ]
    }
]
}
EOF

# Task 4. Label detection

curl -s -X POST -H "Content-Type: application/json" --data-binary @request.json  https://vision.googleapis.com/v1/images:annotate?key=${API_KEY}

# Task 5. Web detection

cat <<EOF > request.json
{
"requests": [
    {
        "image": {
        "source": {
            "gcsImageUri": "gs://${PROJECT_ID}-bucket/donuts.png"
        }
        },
        "features": [
        {
            "type": "WEB_DETECTION",
            "maxResults": 10
        }
        ]
    }
]
}
EOF

curl -s -X POST -H "Content-Type: application/json" --data-binary @request.json  https://vision.googleapis.com/v1/images:annotate?key=${API_KEY}

# Task 6. Face detection

cat <<EOF > request.json
{
"requests": [
    {
        "image": {
        "source": {
            "gcsImageUri": "gs://${PROJECT_ID}-bucket/selfie.png"
        }
        },
        "features": [
        {
            "type": "FACE_DETECTION"
        },
        {
            "type": "LANDMARK_DETECTION"
        }
        ]
    }
]
}
EOF

curl -s -X POST -H "Content-Type: application/json" --data-binary @request.json  https://vision.googleapis.com/v1/images:annotate?key=${API_KEY}

# Task 7. Landmark annotation


cat <<EOF > request.json
{
"requests": [
    {
        "image": {
        "source": {
            "gcsImageUri": "gs://${PROJECT_ID}-bucket/city.png"
        }
        },
        "features": [
        {
            "type": "LANDMARK_DETECTION",
            "maxResults": 10
        }
        ]
    }
]
}
EOF

curl -s -X POST -H "Content-Type: application/json" --data-binary @request.json  https://vision.googleapis.com/v1/images:annotate?key=${API_KEY}


# Task 8. Object localization

cat <<EOF > request.json
{
"requests": [
    {
    "image": {
        "source": {
        "imageUri": "https://cloud.google.com/vision/docs/images/bicycle_example.png"
        }
    },
    "features": [
        {
        "maxResults": 10,
        "type": "OBJECT_LOCALIZATION"
        }
    ]
    }
]
}
EOF

curl -s -X POST -H "Content-Type: application/json" --data-binary @request.json  https://vision.googleapis.com/v1/images:annotate?key=${API_KEY}

# Task 9. Explore other Vision API methods


gcloud auth revoke $ACCOUNT
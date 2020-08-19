#!/bin/sh -l

IMAGE_NAME="$INPUT_GCR_HOST/$GOOGLE_PROJECT_ID/$INPUT_IMAGE_NAME"

echo $GCLOUD_SERVICE_KEY | base64 -d | docker login -u _json_key --password-stdin https://$INPUT_GCR_HOST/
docker build -t $IMAGE_NAME:$INPUT_IMAGE_TAG $DOCKER_BUILD_ARGS .
docker tag $IMAGE_NAME:$INPUT_IMAGE_TAG $IMAGE_NAME:latest
docker push $IMAGE_NAME:$INPUT_IMAGE_TAG
docker push $IMAGE_NAME:latest

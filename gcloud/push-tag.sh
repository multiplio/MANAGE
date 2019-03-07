#!/bin/bash
set -e

# tag image for registry
docker tag ${PROJECT_NAME}/${DOCKER_IMAGE_NAME}:latest gcr.io/${PROJECT_NAME}/${DOCKER_IMAGE_NAME}:$TRAVIS_COMMIT
docker tag ${PROJECT_NAME}/${DOCKER_IMAGE_NAME}:latest gcr.io/${PROJECT_NAME}/${DOCKER_IMAGE_NAME}:$TRAVIS_COMMIT
# push image to registry
docker push gcr.io/${PROJECT_NAME}/${DOCKER_IMAGE_NAME}

# add version tag to image
gcloud --quiet container images add-tag gcr.io/${PROJECT_NAME}/${DOCKER_IMAGE_NAME}:$TRAVIS_COMMIT gcr.io/${PROJECT_NAME}/${DOCKER_IMAGE_NAME}:$TRAVIS_TAG
# add "stable" tag to image
gcloud --quiet container images add-tag gcr.io/${PROJECT_NAME}/${DOCKER_IMAGE_NAME}:$TRAVIS_COMMIT gcr.io/${PROJECT_NAME}/${DOCKER_IMAGE_NAME}:stable
# add "latest" tag to image
gcloud --quiet container images add-tag gcr.io/${PROJECT_NAME}/${DOCKER_IMAGE_NAME}:$TRAVIS_COMMIT gcr.io/${PROJECT_NAME}/${DOCKER_IMAGE_NAME}:latest

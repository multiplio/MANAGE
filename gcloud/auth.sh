#!/bin/bash
set -e

# decode gcloud key from env variable to file
echo $GCLOUD_SERVICE_KEY | base64 --decode -i > ${HOME}/gcloud-service-key.json
# authenticate with service account + setup docker credentials
gcloud --quiet auth activate-service-account --key-file ${HOME}/gcloud-service-key.json
gcloud --quiet auth configure-docker

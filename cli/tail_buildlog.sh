#!/bin/bash

BUILD_NAME=$(gcloud beta builds list --filter=status='WORKING' --format=json|jq -r '.[0].name')
gcloud beta builds log --stream $BUILD_NAME

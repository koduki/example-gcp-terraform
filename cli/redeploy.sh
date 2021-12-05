#!/bin/bash

APP_DIR=$(cd $(dirname $0);pwd)

gcloud beta builds triggers run --branch=main push-gcp-terraform --format=json > /tmp/result.json
cat /tmp/result.json

sleep 2

$APP_DIR/tail_buildlog.sh

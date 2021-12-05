#!/bin/sh

GITHUB_TOKEN=$1
PROJECT_ID=$2
BUILD_ID=$3
BRANCH_FROM=$4
BRANCH_TO=$5
IS_DEPLOY=$6

OWNER=koduki
REPO=gcp-terraform
COMPARE=${OWNER}:${BRANCH_FROM}
BASE=${BRANCH_TO}

TITLE="Review Request of Terraform for ${BRANCH_TO}"
if [ $IS_DEPLOY == "TRUE" ]; then
  DEPLOY_MSG="Once you approve & merge this request, deplyment is executed."
else
  DEPLOY_MSG=""
fi
BODY="Please review below Terraform Plan. ${DEPLOY_MSG} \
\n \
\n \
url:\n \
https://console.cloud.google.com/cloud-build/builds;region=global/${BUILD_ID}?project=${PROJECT_ID}"

DATA='{ "title": "'$TITLE'","body": "'$BODY'","head": "'$COMPARE'","base": "'$BASE'"}'
curl -v -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/$OWNER/$REPO/pulls --data "$DATA"
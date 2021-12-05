#!/bin/bash

IMAGE="hashicorp/terraform:1.0.1"
SECRET_DIR="$HOME/.secret"
CREDENTIALS="/secret/bootstrap-terraform.json"
SCRIPT_DIR=$(cd $(dirname $0); pwd;)

if [ -n "$RUNTIE" ]; then
  CMD=$RUNTIE #RUNTIE=podman
else
  CMD="docker"
fi

while getopts d: OPT
do
  case $OPT in
    "d" ) DIR_VALUE="$OPTARG" ;;
  esac
done

if [ -n "$DIR_VALUE" ]; then
    WORKSPACE="$(cd $SCRIPT_DIR/../$(echo $DIR_VALUE|sed 's/environments.*//g');pwd)"
    WORK_DIR="/workspace/environments/$(echo $DIR_VALUE|sed 's/.*environments\///g')" 

    echo "WORKSPACE: "$WORKSPACE 1>&2
    echo "WORK_DIR : "$WORK_DIR 1>&2
    echo "------" 1>&2

    shift `expr $OPTIND - 1`
    echo $@ 1>&2

    $CMD run --workdir=$WORK_DIR -v $WORKSPACE:/workspace/ -v $SECRET_DIR:/secret -e GOOGLE_APPLICATION_CREDENTIALS=$CREDENTIALS $IMAGE $@
else
    echo "Usage: $(basename $0) [-d mount directory] {Terraform args}" 1>&2
    exit 1
fi
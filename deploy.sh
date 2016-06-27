#!/bin/bash

set -e

if [ $# -lt 2 ]; then
    echo You must provide arguments:
    echo " 1. Job name (mandatory)"
    echo " 2. Build number (mandatory)"
    echo " 3. Feature name (optional)"
    exit 1
fi

JOB_NAME=$1
BUILD_NUMBER=$2
FEATURE_NAME=$3

# Static parameters
if [ -z "$FEATURE_NAME" ]; then
  BOX_PLAYBOOK=deployment/boxes/master.yml
else
  BOX_PLAYBOOK=deployment/boxes/pr.yml
fi
BOX_NAME=todo-app
BOX_ADDRESS=10.10.0.12
BOX_USER=vagrant
BOX_PWD=

# Register the new Prudentia box and provisions it
prudentia ssh <<EOF
unregister $BOX_NAME

register
$BOX_PLAYBOOK
$BOX_NAME
$BOX_ADDRESS
$BOX_USER
$BOX_PWD

set jenkins_job_name $JOB_NAME
set jenkins_build_number $BUILD_NUMBER
set feature_name $FEATURE_NAME

verbose 1
provision $BOX_NAME

EOF

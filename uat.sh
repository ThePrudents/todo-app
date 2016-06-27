#!/bin/bash

set -e

if [ $# -ne 1 ]; then
    echo You must provide the feature name as argument
    exit 1
fi

FEATURE_NAME=$1

cd client/tests

# clean workspace
#rm -rf node_modules
#npm cache clean

# install npm deps
npm install

# run e2e tests
DISPLAY=:99 npm test -- --speedMode --url=http://$FEATURE_NAME.todo.dev/index.html

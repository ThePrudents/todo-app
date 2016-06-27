#!/bin/bash

set -e

cd client
rm -f client.tgz
tar -zcf client.tgz index.html js node_modules

cd ../server
rm -f server.jar
sbt assembly
cp target/scala-2.11/todo-app-assembly-0.1.jar server.jar

#!/bin/sh

search_dir=/Users/ludo/a/java-docs-samples/appengine-java21
for entry in "$search_dir"/*
do
if [ ! -d "$$entry" ]; then
  cd  "$entry"
  current_dir="$(basename $(pwd))"
  gcloud config set project ludo-in-in
     mvn clean install appengine:deploy -Dapp.deploy.projectId="ludo-in-in" -Dapp.deploy.version="${current_dir}" \
          -Dapp.deploy.promote=false \
          -DskipTests=true
	   echo "${current_dir} done"
  fi
done

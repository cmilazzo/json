#!/bin/bash
echo 'Git Clone the following url'
echo "$path"
git clone -c http.sslVerify=false "$path"

echo 'Git project downloaded'

cd test-sandbox-locations-api

echo 'running concat command' 
node concat-json.js

echo 'Starting JSON Server'
json-server --host 0.0.0.0 data.json -r routes.json
echo 'Started'

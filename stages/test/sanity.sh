#!/bin/bash
echo "SANITY TEST FOR $ENV ENVIRONMENT FOR 3min (every 10sec)"

for i in {1..18}    # 18 x 10s
do
  STATUS=$(curl -s -o /dev/null --insecure -w '%{http_code}' $K8S_URL/gologic-demo-app-$BUILD_TAG/hello?name=Chehine)
  if [ $STATUS -eq 200 ]; then
    echo "Got 200! All done!"
    exit 0
  else
    echo "Got $STATUS :( Not done yet..."
  fi
  sleep 10
done
echo "The request has timed out. This step failed"
exit 1

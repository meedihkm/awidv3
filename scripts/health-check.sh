#!/bin/bash

URL=$1
MAX_RETRIES=5
WAIT_SECONDS=5

echo "Checking health for $URL..."

for ((i=1; i<=$MAX_RETRIES; i++)); do
  HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL/health")
  
  if [ "$HTTP_CODE" -eq 200 ]; then
    echo "Health check passed! ($HTTP_CODE)"
    exit 0
  else
    echo "Attempt $i/$MAX_RETRIES failed (Status: $HTTP_CODE). Retrying in $WAIT_SECONDS seconds..."
    sleep $WAIT_SECONDS
  fi
done

echo "Health check failed after $MAX_RETRIES attempts."
exit 1

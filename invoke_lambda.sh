#!/bin/bash

deployment_strategy=$1

if [ -z "$deployment_strategy" ]; then
  echo "Deployment strategy argument required (add, rollback, start, gracefulrestart, restart, stop)"
  exit 1
fi

aws lambda invoke \
  --function-name "$LAMBDA_FUNCTION_NAME" \
  --payload "{\"deployment_strategy\": \"$deployment_strategy\"}" \
  /tmp/lambda_output.json

status_code=$(jq -r '.statusCode' /tmp/lambda_output.json)
body=$(jq -r '.body' /tmp/lambda_output.json)

if [ "$status_code" != "200" ]; then
  echo "Lambda invocation failed: $body"
  exit 1
fi

echo "Lambda invocation succeeded: $body"

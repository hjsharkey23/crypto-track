#!/bin/bash

curl "http://localhost:4741/coins/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
    --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "coin": {
      "name": "'"${NAME}"'",
      "quantity": "'"${QUANTITY}"'"
    }
  }'

echo

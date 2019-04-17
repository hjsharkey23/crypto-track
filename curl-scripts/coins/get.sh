#!/bin/bash

curl "http://localhost:4741/coins" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}" \

echo

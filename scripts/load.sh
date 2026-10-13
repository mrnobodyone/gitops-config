#!/usr/bin/env bash
# нагрузка: создаёт ссылки и ходит по ним
HOST=${1:-dev.shortener.lab}
while true; do
  code=$(curl -sk -X POST "https://${HOST}/api/shorten" \
    -H 'Content-Type: application/json' \
    -d '{"url":"https://example.com"}' | jq -r .code)
  for _ in 1 2 3; do curl -sk -o /dev/null "https://${HOST}/${code}"; done
  curl -sk -o /dev/null "https://${HOST}/nope00"   # 404
  sleep 0.5
done

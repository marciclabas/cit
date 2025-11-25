help:
  just -f kill.just --list

# Kill the postgres container
postgres:
  docker rm -f pg

# Kill the rabbitmq container
rabbitmq:
  docker rm -f rabbit

# Kill the redis container
redis:
  docker rm -f redis

# Kill the cloudflared tunnel
tunnel:
  pkill -f cloudflared

ocr:
  docker rm -f ocr
help:
  @just --list

# Run postgres DB in docker
postgres DB="db" USER="user" PASSWD="passwd":
  @echo "Running postgres DB in docker. Container name: 'pg'"
  docker run --name pg -e POSTGRES_USER={{USER}} -e POSTGRES_PASSWORD={{PASSWD}} -e POSTGRESS_DB={{DB}} -p 5432:5432 -d postgres:latest

# Run RabbitMQ in docker
rabbitmq:
  @echo "Running rabbitmq in docker. Container name: 'rabbit'"
  docker run -it -d --name rabbit -p 5672:5672 -p 15672:15672 rabbitmq:latest

# Run Redis in docker
redis:
  docker run -d --name redis -p 6379:6379 redis/redis-stack-server:latest

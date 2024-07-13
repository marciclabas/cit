IMAGE := "moveread/image"
VERSION := "0.0.0"
NAME := "container"

set dotenv-load

help:
	@just --list

build *PARAMS:
	docker build -t {{IMAGE}}:{{VERSION}} . --progress=plain {{PARAMS}}
	@just tag

tag:
	docker tag {{IMAGE}}:{{VERSION}} {{IMAGE}}:latest

push:
	docker push {{IMAGE}}:{{VERSION}}

run: kill
	docker run -dp 8000:80 -p 2222:2222 \
		--mount type=bind,source={{justfile_directory()}}/data,target=/data \
		--env-file .env \
		--name {{NAME}} \
		{{IMAGE}}:{{VERSION}}

ssh:
	docker exec -it {{NAME}} /bin/bash

kill:
	docker rm -f {{NAME}}

up:
	docker compose up -d

down:
	docker compose down

compose-ssh:
	docker compose exec {{NAME}} /bin/bash
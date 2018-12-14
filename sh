#!/bin/bash

if [ $1 = "start" ]; then
	source .env
	if [ ! -e $APP_PATH ]; then
		git clone $SOURCE_REPOSITORY $APP_PATH
	fi
	docker-compose up -d
elif [ $1 = 'debug' ]; then
    docker-compose up
elif [ $1 = 'ssh' ]; then
    docker exec -it nuxt ash
elif [ $1 = 'stop' ]; then
    docker stop nuxt
elif [ $1 = 'restart' ]; then
    docker stop nuxt && docker-compose up -d
elif [ $1 = 'clear' ]; then
    docker stop nuxt && docker rm nuxt
else
    echo 'No argument!'
fi

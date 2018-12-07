#!/bin/bash

if [ $1 = "up" ]; then
	source .env
	if [ ! -e $APP_PATH ]; then
		git clone $SOURCE_REPOSITORY $APP_PATH
	fi
	docker-compose up -d
elif [ $1 = 'in' ]; then
    docker exec -it nuxt ash
elif [ $1 = 'clear' ]; then
    docker stop nuxt && docker rm nuxt
else
    echo 'No argument!'
fi

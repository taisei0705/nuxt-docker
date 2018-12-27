#!/bin/bash
APP_NAME="nuxt"
source .env
if [ $1 = "start" ]; then
	if [ ! -e $APP_PATH ]; then
		git clone $SOURCE_REPOSITORY $APP_PATH
	fi
	docker-compose up -d
    docker logs -f $APP_NAME
elif [ $1 = 'debug' ]; then
    docker-compose up
elif [ $1 = 'ssh' ]; then
    docker exec -it $APP_NAME ash
elif [ $1 = 'stop' ]; then
    docker stop $APP_NAME
elif [ $1 = 'restart' ]; then
    docker stop $APP_NAME && docker rm $APP_NAME docker-compose up -d && docker logs -f $APP_NAME
elif [ $1 = 'clear' ]; then
    docker stop $APP_NAME && docker rm $APP_NAME
else
    echo 'No argument!'
fi

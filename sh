#!/bin/bash

if [ $1 = "up" ]; then
	docker-compose up -d
elif [ $1 = 'in' ]; then
    docker exec -it nuxt ash
elif [ $1 = 'clear' ]; then
    docker stop nuxt && docker rm nuxt
else
    echo 'No argument!'
fi

#!/bin/bash

export HOST_UID=$(id -u)

docker-compose up -d

sh run.sh php-cli composer install --no-interaction

sleep 30s

docker-compose restart supervisor

sh run.sh php-cli bin/console doctrine:migrations:migrate --no-interaction
sh run.sh php-cli bin/console doctrine:fixtures:load --no-interaction
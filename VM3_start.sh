#!/bin/bash

a=$(sudo docker ps | grep piggymetrics | cut -d' ' -f 1)
echo "ID container="$a
if [ -n "${a}" ]; then
  echo "piggymetrics runing"
  docker-compose stop
  docker-compose rm -f
 else
  echo "piggymetrics do'nt run"
fi

docker pull 192.168.2.112:5000/piggymetrics-config:latest
docker pull 192.168.2.112:5000/piggymetrics-registry:latest
docker pull 192.168.2.112:5000/piggymetrics-gateway:latest
docker pull 192.168.2.112:5000/piggymetrics-auth-service:latest
docker pull 192.168.2.112:5000/piggymetrics-mongodb:latest
docker pull 192.168.2.112:5000/piggymetrics-account-service:latest
docker pull 192.168.2.112:5000/piggymetrics-statistics-service:latest
docker pull 192.168.2.112:5000/piggymetrics-notification-service:latest
docker pull 192.168.2.112:5000/piggymetrics-monitoring:latest
docker pull 192.168.2.112:5000/piggymetrics-turbine-stream-service:latest

docker-compose up -d

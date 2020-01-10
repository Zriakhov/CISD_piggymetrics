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

#docker pull 192.168.2.112:443/piggymetrics-config:stable
docker pull 10.23.27.6:443/piggymetrics-config:stable
#docker pull 192.168.2.112:443/piggymetrics-registry:stable
docker pull 10.23.27.6:443/piggymetrics-registry:stable
#docker pull 192.168.2.112:443/piggymetrics-gateway:stable
docker pull 10.23.27.6:443/piggymetrics-gateway:stable
#docker pull 192.168.2.112:443/piggymetrics-auth-service:stable
docker pull 10.23.27.6:443/piggymetrics-auth-service:stable
#docker pull 192.168.2.112:443/piggymetrics-mongodb:stable
docker pull 10.23.27.6:443/piggymetrics-mongodb:stable
#docker pull 192.168.2.112:443/piggymetrics-account-service:stable
docker pull 10.23.27.6:443/piggymetrics-account-service:stable
#docker pull 192.168.2.112:443/piggymetrics-statistics-service:stable
docker pull 10.23.27.6:443/piggymetrics-statistics-service:stable
#docker pull 192.168.2.112:443/piggymetrics-notification-service:stable
docker pull 10.23.27.6:443/piggymetrics-notification-service:stable
#docker pull 192.168.2.112:443/piggymetrics-monitoring:stable
docker pull 10.23.27.6:443/piggymetrics-monitoring:stable
#docker pull 192.168.2.112:443/piggymetrics-turbine-stream-service:stable
docker pull 10.23.27.6:443/piggymetrics-turbine-stream-service:stable

docker-compose up -d

#!/bin/bash
# Install Docker
curl -fsSL https://get.docker.com/ | sh

# Start Artifactory docker container
sudo docker run -id -e RUNTIME_OPTS="-Xms512m -Xmx1024m" \
    --name="artifactory" -p 80:8080 \
    -v /data/artifactory/data:/artifactory/data \
    -v /data/artifactory/logs:/artifactory/logs \
    -v /data/artifactory/backup:/artifactory/backup \
    mattgruter/artifactory

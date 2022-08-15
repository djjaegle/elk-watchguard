#!/bin/sh
echo "This script will setup ELK using Docker"
imageName="ghcr.io/djjaegle/elk-wg-syslog"
#Login to remote GitHub container registry
cat ./.github.token | docker login ghcr.io -u djjaegle --password-stdin
#Clean up and start latest eptc-api image
echo "Pulling latest eptc-api image..."
docker image rm $imageName
docker pull $imageName
cat ./.github.token | docker login ghcr.io -u djjaegle --password-stdin
echo "Creating elk-data volume..."
docker volume create elk-data
echo "Spinning up docker ELK container...."
docker run -d --name elk \
    -p 5140:5140/udp -p 5601:5601/tcp \
    -v "elk-data:/var/lib/elasticsearch" \
    --restart=unless-stopped \
    $imageName

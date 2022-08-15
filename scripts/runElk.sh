#!/bin/sh
echo "This script will setup ELK using Docker"
imageName="ghcr.io/djjaegle/elk-wg-syslog"
#Login to remote GitHub container registry
echo $GITHUB_TOKEN | docker login ghcr.io -u djjaegle --password-stdin
echo "Pulling latest elk-wg-syslog image..."
docker pull $imageName
echo "Spinning up ELK docker container...."
docker run -d --name elk \
    -p 5140:5140/udp -p 5601:5601/tcp \
    -v "elk-data:/var/lib/elasticsearch" \
    --restart=unless-stopped \
    $imageName
echo "ELK run script complete!"

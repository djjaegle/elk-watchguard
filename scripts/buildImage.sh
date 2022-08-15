#!/bin/sh
if [ $# -eq 0 ]
  then
    echo "Please supply a version argument"
    exit 1
fi
imagePrefix="ghcr.io/djjaegle/elk-wg-syslog"
imageName="$imagePrefix:$1"
echo "Creating docker image: $imageName"
docker build -t $imageName .
docker tag $imageName "$imagePrefix:latest"
echo "Pushing docker image: $imageName"
cat ./.github.token | docker login ghcr.io -u djjaegle --password-stdin
docker push $imageName
docker push "$imagePrefix:latest"
echo "Image build complete!"

#!/bin/sh
# maven01 $workspace $jarname
# ${projectName} ${docker_path} ${jarName}

set -e
projectName=$1
docker_path=$2
appName=$3

#user_name=
#password=

tag=$(date +%s)
server_path=192.168.3.161:5000
target_image=${projectName}:${tag}
#${BUILD_NUMBER}
echo ${target_image}

cd ${docker_path}

docker build --build-arg app=${appName} -t ${target_image}

docker tag ${target_image} ${server_path}/${projectName}
echo The name of image is "${server_path}\/${projectName}"
docker push ${server_path}/${projectName}:latest

docker rmi -f $(docker iamges | grep ${projectName} | grep ${tag} | awk '{print $3}' | head -n 1)

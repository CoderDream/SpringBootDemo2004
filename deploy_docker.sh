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


jarName=spring-boot-demo-0.0.1-SNAPSHOT.jar
jarFolder=ph
projectName=ph

docker_path=${WORKSPACE}

cp ${WORKSPACE}/target/${jarName} ${docker_path}

sh /root/docker_dir/deploy_docker.sh ${projectName} ${docker_path} ${jarName}

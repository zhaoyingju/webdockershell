#!/bin/sh
project="webdockershell"
echo '构建docker镜像'
docker build --no-cache --pull --tag $project --build-arg env=$5  $6
echo '>>>获取旧的容器id'
CID=$(docker ps |grep "$3" |awk '{print $1}')
echo $CID
echo '>>>停止旧的容器'
if [ "$CID" != "" ];then
 docker stop $CID
 echo '>>>删除旧的容器'
 docker rm $CID
fi
sleep 10
echo '>>>启动新的容器'
docker run $7  --name $3 $3:$4
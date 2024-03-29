#!/bin/sh
release_path="/var/code/release/webdockershell"
cd $release_path
project="webshell"
echo '构建docker镜像'
docker build --no-cache --pull --tag $project .
echo '>>>获取旧的容器id'
CID=$(docker ps |grep "$project" |awk '{print $1}')
echo $CID
echo '>>>停止旧的容器'
if [ "$CID" != "" ];then
 docker stop $CID
 echo '>>>删除旧的容器'
 docker rm $CID
fi
sleep 10
echo '>>>启动新的容器'
#docker run -t -d --name=$webshell -p 5000:5000 $project

imageid=$(docker images |grep "webshell" |awk '{print $3}')
docker login --username=hncore registry.cn-hangzhou.aliyuncs.com/hncore/webshell
docker tag $imageid registry.cn-hangzhou.aliyuncs.com/hncore/webshell/webshell:latest
docker push registry.cn-hangzhou.aliyuncs.com/hncore/webshell/webshell:latest

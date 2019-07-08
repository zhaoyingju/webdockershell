#!/bin/sh

release_path="/var/code/release/webdockershell"
cd $release_path
imageid=$(docker images |grep "webshell" |awk '{print $3}')
docker login --username=hncore registry.cn-hangzhou.aliyuncs.com/hncore/webshell
docker tag $imageid registry.cn-hangzhou.aliyuncs.com/hncore/webshell/webshell:latest
docker push registry.cn-hangzhou.aliyuncs.com/hncore/webshell/webshell:latest
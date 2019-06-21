#/bin/sh
# git yum安装 检查git 是否存在 存在不安装
set -xe
git --version
#设置user and email
git_url="https://github.com/zhaoyingju/webdockershell.git"
path="/var/code/webdockershell"
dockerfile_path="/var/code/webdockershell/Dockerfile"

release_path="/var/code/release/webdockershell"

dockerfile_path_target="/var/code/release/webdockershell/Dockerfile"

#验证录入的地址是否存在 不存在创建
if [ ! -d "$path" ];then
 mkdir -p $path
 cd $path
 git init
fi
 cd $path

# 拉取代码
echo '>>>拉取代码'
git pull $git_url

echo '执行dotnet编译发布'
dotnet restore
dotnet build

#验证发布地址是否存在 不存在创建

echo '>>>创建发布目录'
if [ ! -d "$release_path" ];then
 mkdir -p $release_path
fi
echo '>>>清空发布目录'
rm * -rf
echo '>>>发布'
cp $dockerfile_path $dockerfile_path_target
dotnet publish -o $release_path



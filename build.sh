#/bin/sh
# git yum安装 检查git 是否存在 存在不安装
set -xe
git --version
#设置user and email
git_url="https://github.com/zhaoyingju/webdockershell.git"

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
dotnet publish

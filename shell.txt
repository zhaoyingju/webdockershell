#/bin/sh
# git yum安装 检查git 是否存在 存在不安装
git --version
if [ $? -ne 0 ];then
 yum install git
 if [ $? -ne 0 ];then
  echo "yum安装失败！"
  exit 0
 fi
fi

#设置user and email
git_url="https://github.com/zhaoyingju/webdockershell.git"
username="zhaoyingju"
email="zhaoyingju@163.com"
path="/var/code/webdockershell"
git config -- user.name $username
git config  user.email $email

#验证录入的地址是否存在 不存在创建
if [ ! -d "$path" ];then
 mkdir -p $path
 cd $path
 git init
fi
 cd $path

# 拉取代码
git pull $git_url

dotnet restore
dotnet build
dotnet publish
dotnet run
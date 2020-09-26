#!/usr/bin/env sh

#docker build -t ncov .

run()
{
  echo "请输入my.bupt.edu.cn门户的账号密码"
  read -p "请输入学号：" USERID
  read -p "请输入密码：" PASSWD
  read -p "Server酱参数，请输入token：" TOKEN
  echo
  echo "启动docker, name：ncov"
  docker run -d  \
         --name ncov \
         -e BUPT_SSO_USER=$USERID \
         -e BUPT_SSO_PASS=$PASSWD \
         -e SERVER_CHAN_SCKEY=$TOKEN \
         ncov

  echo "启动成功！"
}

del()
{
  echo "删除容器"
  docker container stop ncov
  docker container rm ncov
  echo "删除成功"
}

build()
{
  echo "build容器"
  docker build -t ncov .
}

usage()
{
	echo "Usage: $0 [-i|-o|-r|-c|] "
	echo "where:     -i 创建容器并初始化个人信息"
	echo "           -d 删除容器"
	echo "           -b build容器"
	echo
	exit
}

case $1 in	usage;;

-i)
	run;;

-d)
	logout;;
-b)
  build;;
-h)
	usage;;
*)
	usage;;
esac

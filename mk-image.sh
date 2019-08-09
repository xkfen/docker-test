#!/usr/bin/env bash
# 当前完整的项目目录
root=`pwd`
#镜像名称即是项目名称
image_name=${root##*/}
# 生成docker image
docker rmi -f $image_name
echo '正在生成docker镜像'
# 传一个版本号过来
version="v0.1"
docker build -f Dockerfile -t $image_name:${version} .
echo "docker image build success !!!"
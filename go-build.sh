#!/usr/bin/env bash

# 当前完整的项目目录
root=`pwd`
# 打印当前完整的项目目录
echo ${root}
# 截取完整项目目录，得到项目名称
# ${string##*chars}	从 string 字符串最后一次出现 *chars 的位置开始，截取 *chars 右边的所有字符
echo ${root##*/}
# 切换到项目目录
cd ${root}
# 以下两种方式都可以实现go build
#GOARCH=amd64 GOOS=linux go build -o  ${root##*/} main.go
#chmod u+x ${root##*/}
## 如果让用户提供入口函数的路径，用户要给的是项目下入口的路径，如
mainPath=${root}/main.go
build_command="ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o ${root##*/} ${mainPath}"  
echo $build_command
$build_command
# 修改文件权限
chmod u+x ${root##*/}
echo "go build success!!!"

#镜像名称即是项目名称
image_name=${root##*/}
# 生成docker image
docker rmi -f $image_name
echo '正在生成docker镜像'
# 传一个版本号过来
version="v0.1"
docker build -f Dockerfile -t $image_name:${version} .
echo "docker image build success !!!"

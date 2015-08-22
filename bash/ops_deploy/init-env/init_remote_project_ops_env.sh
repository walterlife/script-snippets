#!/usr/bin/env bash

. ./settings.sh
. ./functions.sh

if [ ! -f ${SERIVCE_LIST} ]; then
    echo -e "${SERIVCE_LIST} file not exist!!!"
    exit 1
fi

from_local="./data/init-dev/"

if [ ! -d $from_local -o ! -r $from_local -o ! -w $from_local -o -x $from_local ]; then
    echo -e "$from_local is not a dir or one of r-w-x do not give!!!"
    exit 1
fi

exc_list_file="../exclude.list"
if [ ! -f ${exc_list_file} ]; then
    touch ${exc_list_file}
fi

#1 远程创建目录
cmd="mkdir -p game bin bak tmp"
awk '{print "sshpass -p " $4 " ssh -p" $2 " " $3 "@" $1 " '"${cmd}"' "}' ${SERIVCE_LIST} | sh

if [ $? -ne 0 ]; then 
    echo -e "exec awk mkdir error!!!"
    exit 1
fi

#2 将本地初始化文件上传到指定服务器
while read line; do
    RS_HOST=$(echo $line | awk '{print $1}' )
    RS_PORT=$(echo $line | awk '{print $2}' )
    RS_USER=$(echo $line | awk '{print $3}' )
    RS_PASSWD=$(echo $line | awk '{print $4}' )
    echo -e "将在远程服务器${FG_GREEN}[${RS_HOST}]${END}上初始化${FG_GREEN}[${PROJECT_NAME}]${END}后台${FG_GREEN} 运维 ${END}环境..."

    dist_from_local_to_remote ${RS_HOST} ${RS_PORT} ${RS_USER} ${RS_PASSWD} ${from_local} ${RS_PATH} ${exc_list_file}
done < ${SERIVCE_LIST}

#3 安装生产环境依赖软件
awk '{print "sshpass -p " $4 " ssh -p" $2 " " $3 "@" $1 " bash " $5 " install " $4 }' ${SERIVCE_LIST} | sh

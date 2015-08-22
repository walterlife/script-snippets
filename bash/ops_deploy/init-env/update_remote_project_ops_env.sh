#!/usr/bin/env bash

. ./settings.sh
. ./functions.sh

if [ $# -ne 1 ] ;then
    name=`basename $0`
    echo -e "Usage \t\n $name file_name"
    exit 0
fi

from_local=$1

# 目前只支持发布文件
if [ -d ${from_local} ]; then
    echo -e "${from_local} is a dir, now only can update file!!!"
    exit 1
fi

if [ -f ${from_local} ]; then
    echo -e "${from_local} not exist !!!"
    exit 1
fi

exc_list_file="../exclude.list"
if [ ! -f ${exc_list_file} ]; then
    touch ${exc_list_file}
fi

while read line; do
    RS_HOST=$(echo $line | awk '{print $1}' )
    RS_PORT=$(echo $line | awk '{print $2}' )
    RS_USER=$(echo $line | awk '{print $3}' )
    RS_PASSWD=$(echo $line | awk '{print $4}' )
    echo -e "将在远程服务器${FG_GREEN}[${RS_HOST}]${END}上初始化${FG_GREEN}[${PROJECT_NAME}]${END}后台${FG_GREEN} 运维 ${END}环境..."

    dist_from_local_to_remote ${RS_HOST} ${RS_PORT} ${RS_USER} ${RS_PASSWD} ${from_local} ${RS_PATH} ${exc_list_file}
done < ${SERIVCE_LIST}

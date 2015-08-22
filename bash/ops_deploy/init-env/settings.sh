#!/usr/bin/env bash 
#set -x

RED="\033[0;31m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[0;33m"
GRAY="\033[0;37m"
LIGHT_RED="\033[1;31m"
LIGHT_YELLOW="\033[1;33m"
LIGHT_GREEN="\033[1;32m"
LIGHT_BLUE="\033[0;34m"
LIGHT_GRAY="\033[1;37m"
END="\033[0;00m"

dt=`date +"%Y %m %d %H %M %S"`
array=($dt)

YEAR=${array[0]}
MONTH=${array[1]}
DAY=${array[2]}
HOUR=${array[3]}
MINUTE=${array[4]}
SECOND=${array[5]}

PROJECT_NAME="aturtle"

# 发布中心所在机器的ip
RS_HOST="10.1.1.113"

# 发布中心所在机器的port
RS_PORT=22000

# 发布中心所在机器的user
RS_USER="shootao"

# 发布中心所在机器的password
RS_PASSWD="aturtle@shootao"

RS_PATH="~/bin"

SERIVCE_LIST="init_service_list"

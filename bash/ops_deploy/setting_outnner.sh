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

PROJECT_NAME="XXX"

# 发布中心所在机器的ip
RS_HOST="XXX"

# 发布中心所在机器的port
RS_PORT="XXX"

# 发布中心所在机器的user
RS_USER="XXX"

# 发布中心所在机器的password
RS_PASSWD="XXX"

# 发布中心路径
RS_PATH="XXX"

##############################################

# 发布服务的名称
SV_NAME="XXX"

# 发布服务的根路径
SV_ROOT_PATH="XXX"

# 发布服务机器的ip
SV_HOST="XXX"

# 发布服务机器的port
SV_PORT="XXX"

# 发布服务机器的user
SV_USER="XXX"

# 发布服务机器的password
SV_PASSWD="XXX"

# 是否是第一次部署
FIRST_DEPOLY=1

# 生产环境初始化脚本
OPS_INIT_SCRIPT="./init-env/project_ops_init.sh"

OPS_SERVICE_MAP="./services_map/ip_service_map_outner"

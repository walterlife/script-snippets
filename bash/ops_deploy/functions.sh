#!/usr/bin/env bash
#set -x 

function rsync_for_release() 
{
    echo
    local frm_local=$1
    local to_rs=$2
    local rs_user=$3
    local rs_host=$4
    local rs_port=$5
    local rs_passwd=$6
    local ex_list=$7
    local sv_host=$8
    local rs_date=$9
    echo -e ${YELLOW}"rsync local ${project_name} to ${RED}${rs_host}:${sv_host}${END}:"
    echo -e "\tFROM LOCAL DIR:${frm_local}"
    echo -e "\tTO  REMOTE DIR:${to_rs}"
     
    sshpass -p ${rs_passwd} ssh -o "StrictHostKeyChecking no" -p${rs_port} ${rs_user}@${rs_host} "mkdir -p ${to_rs}/${sv_host}"

    sshpass -p ${rs_passwd} rsync -vr --copy-links --exclude-from ${ex_list} --progress "-e ssh -o 'StrictHostKeyChecking no' -p ${rs_port}" ${frm_local} ${rs_user}@${rs_host}:${to_rs}/${sv_host}/${rs_date}

}

function remote_stop() 
{
    echo
    local sv_root_path="$1"
    local sv_name="$2"

    local sv_host="$3"
    local sv_user="$4"
    local sv_passwd="$5"
    local sv_port="$6"

    local rs_host="$7"
    local rs_user="$8"
    local rs_passwd="$9"
    local rs_port="${10}"

    echo -e "IN REMOTE ${rs_host} ${RED} STOP ${YELLOW}${sv_name}${END} ${RED}${sv_host}${END}:"

    stop_it="$sv_root_path/${sv_name}/stop"
    cmd="sshpass -p ${rs_passwd} ssh -p${rs_port} ${rs_user}@${rs_host} sshpass -p ${sv_passwd} ssh -p${sv_port} ${sv_user}@${sv_host} ${stop_it}"
    ${cmd}
    sleep 2
}

function remote_state() 
{
    echo
    local sv_root_path="$1"
    local sv_name="$2"

    local sv_host="$3"
    local sv_user="$4"
    local sv_passwd="$5"
    local sv_port="$6"

    local rs_host="$7"
    local rs_user="$8"
    local rs_passwd="$9"
    local rs_port="${10}"

    echo -e "IN REMOTE ${rs_host} ${RED} STATE ${YELLOW}${sv_name}${END} ${RED}${sv_host}${END}:"

    state="$sv_root_path/${sv_name}/status"
    cmd="sshpass -p ${rs_passwd} ssh -p${rs_port} ${rs_user}@${rs_host} sshpass -p ${sv_passwd} ssh -o 'StrictHostKeyChecking no' -p${sv_port} ${sv_user}@${sv_host} ${state}"
    ${cmd}
}

function remote_distribute() 
{
    echo
    local sv_root_path="$1"
    local sv_name="$2"
    local rs_path="$3"

    local sv_host="$4"
    local sv_user="$5"
    local sv_passwd="$6"
    local sv_port="$7"

    local rs_host="$8"
    local rs_user="$9"
    local rs_passwd="${10}"
    local rs_port="${11}"

    local rs_date="${12}"

    # 第一次部署
    if [ ${FIRST_DEPOLY} -eq 1 ]; then
        #local sv_remote_file="${rs_path}/${sv_host}/${sv_name}"
        local sv_remote_file="${rs_path}/${sv_host}/${rs_date}/${sv_name}"
        local sv_dist_path="${sv_root_path}"

        echo -e "IN REMOTE ${rs_host} FIRST DISTRIBUTE ${YELLOW}${sv_name}${END} to ${RED}${sv_host} ${sv_dist_path}${END}:"

        cmd="sshpass -p ${rs_passwd} ssh -p${rs_port} ${rs_user}@${rs_host} sshpass -p ${sv_passwd} scp -r -P${sv_port} ${sv_remote_file} ${sv_user}@${sv_host}:${sv_dist_path}"
        ${cmd}
        return
    fi

    local sv_remote_file="${rs_path}/${sv_host}/${rs_date}/${sv_name}/bin/lib*.so"
    local sv_dist_path="${sv_root_path}/${sv_name}/bin/"
    echo -e "IN REMOTE ${rs_host} DISTRIBUTE ${YELLOW}${sv_name}${END} to ${RED}${sv_host} ${sv_dist_path}${END}:"

    cmd="sshpass -p ${rs_passwd} ssh -p${rs_port} ${rs_user}@${rs_host} sshpass -p ${sv_passwd} scp -P${sv_port} ${sv_remote_file} ${sv_user}@${sv_host}:${sv_dist_path}"
    ${cmd}

    if [ "${sv_name}" = "online" ] || [ "${sv_name}" = "battle" ] || [ "${sv_name}" = "fighting" ];then
        sv_remote_file="${rs_path}/${sv_host}/${rs_date}/${sv_name}/etc/conf/*"
        sv_dist_path="${sv_root_path}/${sv_name}/etc/conf/"

        echo -e "IN REMOTE ${rs_host} DISTRIBUTE ${YELLOW}${sv_name}${END} to ${RED}${sv_host} ${sv_dist_path}${END}:"
        cmd="sshpass -p ${rs_passwd} ssh -p${rs_port} ${rs_user}@${rs_host} sshpass -p ${sv_passwd} scp -P${sv_port} ${sv_remote_file} ${sv_user}@${sv_host}:${sv_dist_path}"
        ${cmd}

        sv_remote_file="${rs_path}/${sv_host}/${rs_date}/${sv_name}/etc/scripts/*"
        sv_dist_path="${sv_root_path}/${sv_name}/etc/scripts/"

        echo -e "IN REMOTE ${rs_host} DISTRIBUTE ${YELLOW}${sv_name}${END} to ${RED}${sv_host} ${sv_dist_path}${END}:"
        cmd="sshpass -p ${rs_passwd} ssh -p${rs_port} ${rs_user}@${rs_host} sshpass -p ${sv_passwd} scp -P${sv_port} ${sv_remote_file} ${sv_user}@${sv_host}:${sv_dist_path}"
        ${cmd}
    fi
    sleep 1
}

function remote_start() 
{
    echo
    local sv_root_path="$1"
    local sv_name="$2"

    local sv_host="$3"
    local sv_user="$4"
    local sv_passwd="$5"
    local sv_port="$6"

    local rs_host="$7"
    local rs_user="$8"
    local rs_passwd="$9"
    local rs_port="${10}"

    echo -e "IN REMOTE ${rs_host} ${RED} STOP ${YELLOW}${sv_name}${END} ${RED}${sv_host}${END}:"

    local start_it="$sv_root_path/${sv_name}/startup"
    cmd="sshpass -p ${rs_passwd} ssh -p${rs_port} ${rs_user}@${rs_host} sshpass -p ${sv_passwd} ssh -p${sv_port} ${sv_user}@${sv_host} ${start_it}"
    ${cmd}

    sleep 1
    echo -e "${GREEN}FINISH ${sv_name}${END}"
}

#
# 检查远程中心服务器上本次要发布的目录数据是否存在一个基本版本，
# 如果不存在，则将上一次存在的版本在远程服务器本地拷贝一个
#
function check_remote_data()
{
    echo
    local rs_path=$1
    local rs_user=$2
    local rs_host=$3
    local rs_port=$4
    local rs_passwd=$5

    local check_cmd="`dirname ${rs_path}`/init_dir_with_last_dir.sh"
    echo -e ${YELLOW}"INIT DATA FOR ${project_name} IN REMOTE CENTER SERVER ${RED}${rs_host}${END}:"
    cmd="sshpass -p ${rs_passwd} ssh -p${rs_port} ${rs_user}@${rs_host} ${check_cmd} ${remote_path}"
    ${cmd}
}

function init_config() {
    THE_PATH=`dirname $0`
    cd ${THE_PATH} 
    cd ..

    # 更新online配表
    cd "./build/online/etc/conf"
    ./import_xml_from_design.sh

    # 格式化服务配置文件
    cd ../../../../ops_deploy/conf-praser
    python ./conf_praser.py
    bash ./cp_conf.sh

    cd ../
    exc_list_file="./exclude.list"

    if [ ! -f ${exc_list_file} ]; then
        touch ${exc_list_file}
    fi
} 

function usage() {
    echo "Usage:    $0 [0|1] info [all|ip]  --get all serives info on gived ip "
    echo "          $0 [0|1] start [all|ip] [all|login|online|gateway|switch|nickname|fighting|db|battle|rank|gamecenter]   --start gived ip's service" 
    echo "          $0 [0|1] stop [all|ip] [all|login|online|gateway|switch|nickname|fighting|db|battle|rank|gamecenter]   --stop gived ip's service" 
    echo "          $0 [0|1] restart [all|ip] [all|login|online|gateway|switch|nickname|fighting|db|battle|rank|gamecenter]   --stop gived ip's service" 
    echo "          $0 [0|1] state ip [all|login|online|gateway|switch|nickname|fighting|db|battle|rank|gamecenter]   --state gived ip's service" 
    echo "          $0 [0|1] rs [all|ip] [all|login|online|gateway|switch|nickname|fighting|db|battle|rank|gamecenter]   --relesae gived ip's service" 
    echo "          $0 [0|1] rs [login|online|gateway|switch|nickname|fighting|db|battle|rank|gamecenter]   --relesae gived service on all IP" 
    exit
} 

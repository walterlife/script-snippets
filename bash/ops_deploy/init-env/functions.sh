#!/usr/bin/env bash

function dist_from_local_to_remote() 
{
    local rs_host=$1
    local rs_port=$2
    local rs_user=$3
    local rs_passwd=$4
    local frm_local=$5
    local rs_path=$6
    local ex_list=$7
    echo
    sshpass -p${rs_passwd} rsync -vr --exclude-from ${ex_list} --progress "-e ssh -p ${rs_port}" ${frm_local} ${rs_user}@${rs_host}:${rs_path}
    echo
}

function exec_on_dest_svr_from_center_svr_with_passwd() 
{
    if [ $# -eq 9 ];then
        local chost=$1
        local cport=$2
        local cuser=$3
        local cpass=$4

        local dhost=$5
        local dport=$6
        local duser=$7
        local dpass=$8

        local dcmd=$9

        local lcmd="sshpass -p${cpass} ssh -p${cport} ${cuser}@${chost} sshpass -p ${dpass} ssh -p${dport} ${duser}@${dhost} ${dcmd}"
        echo
        ${lcmd}
        echo
    else
        echo -e "${FG_RED}参数不对,${END}Usage\n\t${FG_YELLOW} ${FUNCNAME} ${FG_GREEN}chost cport cuser cpass dhost dport duser dpass dcmd${END}"
        echo -e "\t ${FUNCNAME} $@"
        echo
        echo
    fi
}

function exec_on_dest_svr_from_center_svr_with_passwd_key() 
{
    if [ $# -eq 9 ];then
        local chost=$1
        local cport=$2
        local cuser=$3
        local cpass=$4

        local dhost=$5
        local dport=$6
        local duser=$7
        local dkey=$8

        local dcmd=$9

        local lcmd="sshpass -p ${cpass} ssh -p${cport} ${cuser}@${chost} ssh -i ${dkey} -p${dport} ${duser}@${dhost} ${dcmd}"
        echo
        ${lcmd}
        echo
    else
        echo -e "${FG_RED}参数不对${END},Usage\n\t${FG_YELLOW} ${FUNCNAME} ${FG_GREEN}chost cport cuser cpass dhost dport duser dkey dcmd${END}"
        echo -e "\t ${FUNCNAME} $@"
        echo
        echo
    fi
}

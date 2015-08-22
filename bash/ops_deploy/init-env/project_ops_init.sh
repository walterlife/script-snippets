#!/usr/bin/env bash
set -ueo errexit

#
#定义控制输出终端颜色的代码
#
FG_RED="\033[1;31m"
FG_YELLOW="\033[1;33m"
FG_GREEN="\033[1;32m"
FG_BLUE="\033[0;34m"
FG_GRAY="\033[1;37m"
FG_LIGHT_RED="\033[0;31m"
FG_LIGHT_GREEN="\033[0;32m"
FG_LIGHT_BLUE="\033[0;34m"
FG_LIGHT_YELLOW="\033[0;33m"
FG_LIGHT_GRAY="\033[0;37m"
END="\033[0;00m"

#
#功能说明：
#   在本地批量自动安装文件
#   函数内部检测帐号是否为root, 当是以root账户时直接执行安装，否则执行 sudo 安装-需要交互输入密码
#
#   对于远程服务器的安装，可以通过将本脚本上传上去后执行安装
#
#
function install_package_list()
{
    if [ $# -gt 0 ]; then
        if [ ${USER} = "root" ];then
            shift
            pkg_list=$@
            apt-get install --yes ${pkg_list}
        else
            pass=$1
            shift
            pkg_list=$@
            echo "${pass}" | sudo -S apt-get install --yes ${pkg_list}
        fi
    else
        echo -e "${FG_RED}参数不对,${END}Usage: \n\t${FG_YELLOW} ${FUNCNAME} package name list ${FG_GREEN} ${END}"
        echo -e "\t ${FUNCNAME} $@"
    fi
}

function install_project_env()
{
    if [ $# -eq 2 ] && [ -f $2 ];then
        IFS='\n'
        for pkg in `cat $2`; do
            if [ ! -z "${pkg}" ];then
                pkgs="${pkgs} ${pkg}"
            fi
        done
        if [ ! -z "${pkgs}" ];then
            install_package_list $1 ${pkgs}
        else
            echo -e "${FG_RED}Package list file is empty:${FG_YELLOW}$1!${END}"
        fi
    elif [ $# -gt 0 ] && [ ! -z ${2:0} ];then
        pkgs=$@
        if [ ${pkgs:0:1} = "." ] || [ ${pkgs:0:1} = "/" ];then
            echo -e "${FG_RED}It is a file or package name:${FG_YELLOW}${pkgs}!${END}"
        else
            install_package_list $@
        fi
    else
        echo -e "${FG_RED}参数不对,${END}Usage: \n\t${FG_YELLOW} ${FUNCNAME} package name list ${FG_GREEN} ${END}"
        echo -e "\n\t${FG_YELLOW} ${FUNCNAME} package_list_file ${FG_GREEN} ${END}"
        echo -e "\t ${FUNCNAME} $@"
    fi
}

function main() 
{
    if [ $# -lt 2 ]; then
        echo "Usage: $0 [install/initdir] param"
        exit
    fi

    method=$1
    shift
    param=$@

    if [ $method == "install" ]; then
        pkg_list="sshpass libxml2 libssl1.0.0 libglib2.0-0 libgd2-xpm curl libcurl3-gnutls libdb5.1 libdb5.1++ python2.7 tcpdump"
        install_package_list $param $pkg_list
    fi
} 

main $@
exit

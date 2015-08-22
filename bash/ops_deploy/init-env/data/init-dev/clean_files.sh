#!/usr/bin/env bash
########################################################################
#    File Name: clean_log.sh
# 
#       Author: Shootao Shanghai,Inc.
#         Mail: walter@shootao.com
# Created Time: Sat 21 Mar 2015 10:03:56 AM CST
#  Description: ...
# 
########################################################################

#set -t 

function clean_files()
{
    local delete_files_dir=$1
    local keep_file_seconds=$2
    if [ -d $delete_files_dir ] && [ -x ${delete_files_dir} ] && [ -r ${delete_files_dir} ] && [ -w ${delete_files_dir} ];then
        cd $delete_files_dir
        if [ $? -ne 0 ];then
            echo -e "cd ${delete_files_dir} failed with code:$?"
        else
            now=`date "+%s"`
            for f in `ls . -t`
            do
                mt=`stat ${f} -c "%Y"`
                seconds=`expr ${now} - ${mt}`
                if [ ${seconds} -ge ${keep_file_seconds} ];then
                    if [ -d "$f" ] && [ ! -L "$f" ] && [ "$f" != "." ] && [ "$f" != ".." ] && [ -r "$f" ] && [ -w "$f" ] && [ -x "$f" ];then
                        rmdir ${f}
                        if [ $? -eq 0 ];then
                            # removed empty dir.
                            echo -e "rm emtpy dir:$f"
                        else
                            # remove dir failed, teat it as dir with content.
                            pushd "$PWD" 1
                            clean_files ${f} $keep_file_seconds
                            popd 1
                            rmdir "$f"  # maybe failed(not empty), maybe succeed, just ignore error msg
                        fi
                    elif [ -f "$f" ] && [ -r "$f" ] && [ -w "$f" ];then
                        if [ "$f" == "clean_log.sh" ]; then
                            echo -e "You should not rm youself(bash script):$f"
                        else
                            echo -e "rm file:$f"
                            rm -f $f
                        fi
                    else
                        if [ "$f" != "." ] && [ "$f" != ".." ];then
                            echo -e "You have no right to rm: $f"
                        else
                            echo -e "Escape:$f"
                        fi
                    fi
                else
                    echo "The new file will not be rm:${f}"
                fi
            done
        fi
    elif [ -f "$delete_files_dir" ] && [ -r "$delete_files_dir" ] && [ -w "$delete_files_dir" ];then
        if [ "$delete_files_dir" == "clean_log.sh" ]; then
            echo -e "You should not rm youself(bash script):$delete_files_dir"
        else
            echo -e "rm file:$delete_files_dir"
            rm -f $delete_files_dir
        fi
    else
        :
    fi
}

#保留日志的天数
if [ $# -ne 2 ]; then
    name=`basename $0`
    echo -e "USAGE:\n\t$name delete_files_dir keep_files_days"
    echo -e "\n\tRemove file and subdir in the delete_files_dir with keep_files_days check --- just rm old files and subdirs."
    exit 1
fi

delete_files_dir=$1
keep_files_days=$2

expr match "${keep_files_days}" "[0-9]*$" > /dev/null
if [ $? -ne 0 ]; then
    echo -e "The keep_files_days must be integer number!"
    exit 1
else
    keep_files_days=`expr $keep_files_days`
    if [ ${keep_files_days} -gt 0 ];then
        let "keep_file_seconds=$keep_files_days*24*3600"
        clean_files $delete_files_dir $keep_file_seconds
        exit 0
    else
        echo "At least keep file one day."
        exit 1
    fi
fi

#!/usr/bin/env bash

# FROEGROUND
FG_BLACK="\e[30m"
FG_RED="\e[31m"
FG_GREEN="\e[32m"
FG_YELLOW="\e[33m"
FG_BLUE="\e[34m"
FG_PURPLE="\e[35m"
FG_CYAN="\e[36m"
FG_WHITE="\e[37m"

# BACKGROUND
BG_BLACK="\e[40m"
BG_RED="\e[41m"
BG_GREEN="\e[42m"
BG_YELLOW="\e[43m"
BG_BLUE="\e[44m"
BG_PURPLE="\e[45m"
BG_CYAN="\e[46m"
BG_WHITE="\e[47m"

# ACTION
DONE="\e[0m"
HIGHLIGHT="\e[1m"
UNDERLINE="\e[4m"
BLINK="\e[5m"
REVERSE="\e[7m"
INVISIBLE="\e[8m"

function log() 
{
    if [[ $# < 2 ]]; then
        name=`basename $0`
        echo -e "${DONE}${FG_RED}Usage:\n\t$name [error|warn|info|debug]] msg [format]!!!${DONE}"
        exit 1
    fi

    level=$1
    msg="$2"

    FG=""
    BG=""
    AC="${DONE}"

    case $level in
        "error") :
            FG="${FG_RED}"
            AC="${HIGHLIGHT}"
            ;;
        "warn") :
            FG="${FG_YELLOW}"
            ;;
        "info") :
            FG="${FG_BLUE}"
            AC="${HIGHLIGHT}"
            ;;
        "debug") :
            FG="${FG_WHITE}"
            ;;
    esac
    
    echo -e "${DONE}${AC}${FG}${msg}${DONE}"
} 

#logger $@

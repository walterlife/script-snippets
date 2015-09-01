#!/usr/bin/env bash

# @usage    print text colorfully
# @author   walter
# @version  1.0
# @date     2015-09-01

# clear color to be initial
F_CLEAR() {
    tput sgr 0
    return 0
}

F_BLACK() {
    tput setaf 0
    return 0
} 

F_RED() {
    tput setaf 1
    return 0
} 

F_GREEN() {
    tput setaf 2
    return 0
} 

F_YELLOW() {
    tput setaf 3
    return 0
} 

F_BLUE() {
    tput setaf 4
    return 0
} 

F_MAGENTA() {
    tput setaf 5
    return 0
} 

F_CYAN() {
    tput setaf 6
    return 0
} 

F_WHITE() {
    tput setaf 7
    return 0
} 

# example
# F_CLEAR && F_RED && echo -e "Hello World" && F_CLEAR

# dir to store logs

log_dir				../log

#触控统计位置
ck_stat_dir         /opt/taomee/games/

# log level
# 0: 长期保存的log (任何情况下都会打印)
# 1: utrace, 在线跟踪号码的详细日志 (任何情况下都会打印)
# 2: fatal,  致命错误, 写完fatal就直接退出进程
# 3: error,  严重错误, 导致程序必须对此进一步处理 (例如输入非法, 导致必须立刻返回)
# 4: warn,   异常警告, 程序不对此做处理, 程序也能正确的执行下去 (通常记录一些不合理的设计)
# 5: info,   信息记录, 可记录一些业务信息 (eg: 业务流程数据, 系统统计信息)
# 6: debug,  调试出书，通常开发用来记录调试数据
# 7: trace,  开发时用的log (发布时通常对这个级别的设定报警)
log_level			7

# max size of each log file
log_size			104857600

# max number of log files per log level
max_log_files		100

# 使用tlog的话，此配置项用于配置tlog切换文件的时间间隔
tlog_file_interval_sec	86400

# 严格模式执行，做更严格规的逻辑检测，在遇到部分错误时 直接退出程序； 默认为 严格，配置为 0 非严格，只记录错误日志不退出程序
# 程序中加载给配置 给全局变量 g_strict_mode
strict_mode   1

# 控制是否监控整个系统各个模块时间消耗,
# 辅助监控、定位整个系统性能瓶颈
# 当一次通信链路上每个模块都启用，则在客户端收到回包时，可以看到该包在服务器上的游历历程和每个节点的时间，内存消耗
enable_time_trace   1

# 使用老的log系统的话，此配置项用于配置老log系统切换文件的时间间隔
log_save_next_file_interval_min 1440

# Max opened fd allowed. If this item is missing, then the default value 20000 will be used
max_open_fd		20000

# size of the buffer to hold incoming/outcoming packets
shmq_length		4194304

# running mode of the program
run_mode		background

# if a client doesn't send any data in a given time, AsyncServer will close this connection.
# if this option is configured 0 or left blank, no timeout will be checked.
#cli_socket_timeout	30

# Configure the max allowed size of an incoming packet.
# If this option is missing or configured 0, then 8192 will be used as the max allowed size.
incoming_packet_max_size	131072

#
# mcast address
#
# mcast ip
mcast_ip		239.0.0.111

# mcast port
mcast_port		5538

# interface on which arriving multicast datagrams will be received
mcast_incoming_if	eth0

#
# mcast config for synchronize the name and ip address of a given service
#
# mcast ip
addr_mcast_ip		239.0.0.111

# mcast port
addr_mcast_port		5555
# interface on which arriving multicast datagrams will be received
addr_mcast_incoming_if	eth0

# sms warning system ip addr
warning_ip			192.168.0.39

# sms warning system port
warning_port		33001

# project name
project_name		{{ pname }}

# a short message will be sent to the following phone numbers when system crash
#phone_numbers		13808888888

# dll file
dll_file			../bin/libbattle.so

# bind file
bind_conf			../etc/bind.conf

# common configurations
commom_conf			../etc/common.conf

# config files for lua
conf_dir            ../etc/conf/
main_lua_path       ../etc/scripts/main.lua

# tm_dirty
tm_dirty_shm_file_path ../../dirty/tm_dirty_shm_file

# Shard&Server
shard				1
server_name			0902

#annoucement
note_path ./conf/annoucement.xml

#magic pri_key
mpri_key            d948fd580edee4d5e48019cf01788733

# overseas
# google grade switch(1 open, 0 close)
google_grade_sw     1

intersvr_id 1

server_control_pve  0
open_lua_control    0

# --gameID:开发测试用100632, 压力测试用:, 对外发布时 Android:632, iOS:633， iOS越狱:634, 客户端上传此ID,服务器会校验是否匹配；对开发环境用的100632服务器不校验(方便调试，测试)
# 100633, 100634, 开发测试备用
game_id             {{ game_id }}

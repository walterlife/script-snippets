# dir to store logs
log_dir				../log

# log level
log_level			8

# max size of each log file
log_size			104857600

# max number of log files per log level
max_log_files		100

# 使用tlog的话，此配置项用于配置tlog切换文件的时间间隔
tlog_file_interval_sec	86400

# 严格模式执行，做更严格规的逻辑检测，在遇到部分错误时 直接退出程序； 默认为 严格，配置为 0 非严格，只记录错误日志不退出程序
# 程序中加载给配置 给全局变量 g_strict_mode
strict_mode   1

# 控制是否监控整个系统各个模块时间消耗
# 辅助监控、定位整个系统性能瓶颈
# 当一次通信链路上每个模块都启用，则在客户端收到回包时，可以看到该包在服务器上的游历历程和每个节点的时间，内存消耗
enable_time_trace  1 


# 使用老的log系统的话，此配置项用于配置老log系统切换文件的时间间隔
log_save_next_file_interval_min 1440

# Max opened fd allowed. If this item is missing, then the default value 20000 will be used
max_open_fd		20000

# size of the buffer to hold incoming/outcoming packets
shmq_length		4194304

# running mode of the program
run_mode		background

#Try restarting times when the child process crashes
restart_child_process   0 

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
mcast_ip		239.0.0.110

# mcast port
mcast_port		5538

# interface on which arriving multicast datagrams will be received
mcast_incoming_if	eth0

#
# mcast config for synchronize the name and ip address of a given service
#
# mcast ip
addr_mcast_ip		239.0.0.110

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

phone_numbers		13808888888

# dll file
dll_file			../bin/libnickname.so

# bind file
bind_conf			../etc/bind.conf

channel_id			94
# game_id (连接pay server使用)

game_id				{{ game_id }}
# item_set_id (连接pay server 使用)
item_set_id			8

#db_path
DB_PATH				./{{ pname }}_leveldb/db_	
DB_DIR				./{{ pname }}_leveldb/

# dir to store logs
log_dir				../log

# log level
log_level			7

# max size of each log file
log_size			104857600

# max number of log files per log level
max_log_files		100

# 使用tlog的话，此配置项用于配置tlog切换文件的时间间隔
tlog_file_interval_sec	86400

# 使用老的log系统的话，此配置项用于配置老log系统切换文件的时间间隔
log_save_next_file_interval_min 1440


# 严格模式执行，做更严格规的逻辑检测，在遇到部分错误时 直接退出程序； 默认为 严格，配置为 0 非严格，只记录错误日志不退出程序
# 程序中加载给配置 给全局变量 g_strict_mode
strict_mode   1

# 控制是否监控整个系统各个模块时间消耗
# 辅助监控、定位整个系统性能瓶颈
# 当一次通信链路上每个模块都启用，则在客户端收到回包时，可以看到该包在服务器上的游历历程和每个节点的时间，内存消耗
enable_time_trace   1


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
dll_file			../bin/libswitch.so

# bind file
bind_conf			../etc/bind.conf

# switch <--> db tcp连接对应的ip和port
tcp_db_ip           {{ db_ip }}
tcp_db_port         {{ min }}{{ mid }}01

# switch <--> pay tcp连接对应的ip和port
tcp_pay_ip			10.1.1.101
tcp_pay_port		24100
# 和pay通信是的pri_key
sign_id				b3103a252c64f0e3352af7118429644e
#sign_id             95c3690b381b2126905271d35fdc6d56	#外网

# 渠道id (如果是多个渠道号,请用英文字符";"分割开,最后无需添加";". 如 1;3;94)
channel_id			0
# game_id (连接pay server使用)
# --gameID:开发测试用100632, 压力测试用:, 对外发布时 Android:632, iOS:633， iOS越狱:634, 客户端上传此ID,服务器会校验是否匹配；对开发环境用的100632服务器不校验(方便调试，测试)
# 100633, 100634, 开发测试备用
game_id             {{ game_id }}

# item_set_id (连接pay server 使用)
item_set_id			8

# rmb->diamond rate
exchange_diamond_rate 10

# tm_dirty
#tm_dirty_shm_file_path ../../dirty/tm_dirty_shm_file

# gobal db
tcp_global_ip       {{ db_ip }}
tcp_global_port     {{ min }}{{ mid }}01

# fighting ip
tcp_fighting_ip     {{ fighting_ip }}
tcp_fighting_port   {{ min}}{{ mid }}09

#tcp_mcard_ip        10.1.1.101
tcp_mcard_ip        10.1.1.110
tcp_mcard_port      36000

#GM操作的校验key列表(填多个的话,以 逗号分隔)
gm_check_key        3004,9004

#允许进行GM操作的IP地址(填多个的话, 以 逗号分隔)
gm_accept_ip        10.1.15.19,10.1.1.38,103.249.130.113

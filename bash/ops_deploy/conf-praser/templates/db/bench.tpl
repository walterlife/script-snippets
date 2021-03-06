# db conf
background      false

log_dir	 		../log
log_level		8
log_size		1024000
log_save_next_file_interval_min 3600
tlog_file_interval_sec          66400  # MAX 86400

# 严格模式执行，做更严格规的逻辑检测，在遇到部分错误时 直接退出程序； 默认为 严格，配置为 0 非严格，只记录错误日志不退出程序
# 程序中加载给配置 给全局变量 g_strict_mode
strict_mode   1

# 控制是否监控整个系统各个模块时间消耗
# 辅助监控、定位整个系统性能瓶颈
# 当一次通信链路上每个模块都启用，则在客户端收到回包时，可以看到该包在服务器上的游历历程和每个节点的时间，内存消耗
enable_time_trace   1

bind_file		../etc/bind.conf
dll_file        ../bin/libdb.so
pkg_timeout		5
worker_num		2
send_sem_key    {{ min }}{{ mid }}01
recv_sem_key    {{ min }}{{ mid }}02

#配置一个表示 10 库都使用该IP，否则请配置10个, ip之间用英文字符逗号隔开，不要留空格,对应库后缀顺序同此处的ip顺序
DB_IP           {{ db_host }}

#为简化 数据库端口必须统一
DB_PORT         3306

#为简化 数据库账户名必须统一
DB_USER         {{ db_user }}

#为简化 数据库账户密码必须统一
DB_PASSWD       {{ db_passwd }}

#为简化 数据库名库前缀必须统一, 注意后面的下划线不能少'_'， 分库会在后面加上 0，1，2，... , 9
DB_NAME_PREFIX  {{ db_prefix }} 

IS_LOG_DEBUG_SQL 	1		

INIT_XIAOMEE 	2000 	
INIT_DAMEE 	    800000 
INIT_USERFLAG 	1
PRE_TABLEID    	1

#需要分表的表数目
table_split_num     10
#服务器开启个数
open_num    1

#服务器切换人数
turn_limit  800 

#服务器注册人数上限
upper_limit 1000

restart_child_process  10

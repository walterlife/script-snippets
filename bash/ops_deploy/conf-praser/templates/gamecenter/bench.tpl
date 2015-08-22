# gamecenter 配置
background      false

log_dir	 		../log
log_level		7
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
pkg_timeout		5
worker_num		2
send_sem_key    {{ min }}{{ mid }}03
recv_sem_key    {{ min }}{{ mid }}04

#配置一个表示 10 库都使用该IP，否则请配置10个, ip之间用英文字符逗号隔开，不要留空格,对应库后缀顺序同此处的ip顺序
DB_IP           {{ gc_host }}

#为简化 数据库端口必须统一
DB_PORT         3306

#为简化 数据库账户名必须统一
DB_USER         {{ gc_user }}

#为简化 数据库账户密码必须统一
DB_PASSWD       {{ gc_passwd }}

#为简化 数据库名库前缀必须统一, 注意后面的下划线不能少'_'， 分库会在后面加上 0，1，2，... , 9
DB_NAME         DB_GAMECENTER

IS_LOG_DEBUG_SQL 	1		

INIT_XIAOMEE 	2000 	
INIT_DAMEE 	    800000 
INIT_USERFLAG 	1
PRE_TABLEID    	1

restart_child_process  1

# 统计online N分钟前的数据
serv_write_delay    3
# gmc 隔多长时间读取数据
gmc_interval        1

# --gameID:开发测试用100632, 压力测试用:, 对外发布时 Android:632, iOS:633， iOS越狱:634, 客户端上传此ID,服务器会校验是否匹配；对开发环境用的100632服务器不校验(方便调试，测试)
# 100633, 100634, 开发测试备用
game_id             {{ game_id }}
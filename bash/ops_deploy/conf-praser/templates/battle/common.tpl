# Tcp Proxy, attach to DB  this must be the same as the socket of the db
tcp_proxy_ip        {{ db_ip }}
tcp_proxy_port      {{ min }}{{ mid}}01

# Tcp switch
tcp_switch_ip       {{ switch_ip }}
tcp_switch_port     {{ min }}{{ mid}}04 

tcp_stat_ip         10.1.1.155
tcp_stat_port       50003

# ranking
tcp_ranking_ip      {{ rank_ip }}
tcp_ranking_port    {{ min }}{{ mid}}06

#magic card 
tcp_mcard_ip        10.1.1.109
tcp_mcard_port      36000

# statistics
stat_msg_path       /home/stat/stat-cli-new/spool/inbox/aturtle.log
stat_online_path    /home/stat/stat-cli-new/spool/inbox/aturtle_online.log
cur_version         123

# leveldb_path
leveldb_path        aturtle_online_leveldb/

# alarm
tcp_alarm_ip        10.1.1.155
tcp_alarm_port      60321

tcp_topairank_ip    10.1.1.156
tcp_topairank_port  60323

 
# gobal db
tcp_global_ip       {{ db_ip }}
tcp_global_port     {{ min }}{{ mid }}01
 
# fighting ip
tcp_fighting_ip     {{ fighting_ip }}
tcp_fighting_port   {{ min }}{{ mid }}09

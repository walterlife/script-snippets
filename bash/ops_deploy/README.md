## 说明
+ 该工具是作者在工作中写的小工具，用于后台程序初次部署，更新，重启，查看服务状态
+ 文件说明
- conf-praser       该目录使用服务的配置文件模板生成部署服务的配置文件，主要配置服务的bind.conf,bench.conf(这部分可以根据不同的通信框架进行定制)
+ conf_praser.py    生成配置文件脚本
+ service\_id       存储上次部署时的serivice\_id(不同的通信框架用途不一)
+ settings.py       配置模板中的key-val值
+ templates         配置文件模板
- exclude.list      rsync exclude 文件列表
- functions.sh      base function
- init-env          用于初始化生产环境
- RELEASE_SERVICE   主程序
- services_map      存储各个机器上部署的服务
- setting_outnner.sh 配置用户,密码等信息
- log.sh            落日志bash 简单实现接口

## 思路
+ 该工具部署思路是从内网将部署程序 release 到 外网发布中心机器，再将该服务依次release 到需要部署该服务的机器上
+ 初始化生产环境脚本主要是安装生产环境下必须的软件

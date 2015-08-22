#!/usr/bin/env python
# -*- coding=utf-8 -*-
########################################################################
#    File Name: settings.py
# 
#       Author: Shootao Shanghai,Inc.
#         Mail: walter@shootao.com
# Created Time: Tue 07 Apr 2015 01:23:41 PM CST
#  Description: ...
#                
########################################################################

import os
import sys

templates_path = os.path.join(os.path.dirname(__file__), "templates")

ol_ip = "XXX.XXX.XXX"
bt_ip = "XXX.XXX.XXX"
gt_ip = "XXX.XXX.XXX"
lg_ip = "XXX.XXX.XXX"
sw_ip = "XXX.XXX.XXX"
db_ip = "XXX.XXX.XXX"
ft_ip = "XXX.XXX.XXX"
rk_ip = "XXX.XXX.XXX"
nk_ip = "XXX.XXX.XXX"
gc_ip = "XXX.XXX.XXX"

db_store_ip = "XXX.XXX.XXX"
gc_store_ip = "XXX.XXX.XXX"

usage = "ops"
min = "1"    #表示生产环境

mid = "00"  #多个online时递增, 部署失败时，得将mid 还原

if os.path.isfile('service_id') :
    with open('service_id', 'r') as sidhd:
        mid = sidhd.readline().strip()
        if "" == mid:
            mid = "00";
    with open('service_id', 'w') as sidhd:
        sidhd.write("{:0>2}\n".format(int(mid) + 1))
else :
    with open('service_id', 'w') as sidhd:
        sidhd.write("{:0>2}\n".format(int(mid) + 1))

pname = "XXX"
game_id = "XXX"

tpl_values = {
        'db': {
            'bind':{
                'server_ip' : db_ip,
                'min': min, 
                'mid': mid,
            },
            'bench':{
                'min': min, 
                'mid': mid,
                'db_host': db_store_ip,
                'db_user' : "XXX",
                'db_passwd' : "XXX",
                'db_prefix' : "XXX",
            },
        },

        'gamecenter': {
            'bind':{
                'server_ip' : gc_ip,
                'min': min, 
                'mid': mid,
            },
            'bench':{
                'min': min, 
                'mid': mid,
                'gc_host': gc_store_ip,
                'gc_user' : "XXX",
                'gc_passwd' : "XXX",
                'game_id' : game_id,
            },
        },

        'gateway' : {
            'bind':{
                'server_ip' : gt_ip,
                'min': min,
                'mid': mid,
                'pname': pname,
                'usage': usage,
            },
            'bench':{
                'switch_ip' : sw_ip,
                'min': min, 
                'mid': mid,
                'pname' : pname,
                'game_id': game_id,
                'gcip': gc_ip,
            },
            'xml':{
                'login_ip' : lg_ip,
                "online_ip" : ol_ip,
                'min': min, 
                'mid': mid,
                'pname': pname,
                'usage': usage,
            },
        },

        'login' : {
            'bind':{
                'server_ip' : lg_ip,
                'min': min, 
                'mid': mid,
                'pname': pname,
                'usage': usage,
            },
            'bench':{
                'db_ip' : db_ip, 
                'switch_ip': sw_ip,
                'nick_ip': nk_ip,
                'min': min, 
                'mid': mid,
                'pname' : pname,
                'game_id' : game_id,
            },
            'xml':{
                'online_ip' : ol_ip, 
                'db_ip': db_ip,
                'login_ip': lg_ip,
                'min': min, 
                'mid': mid,
                'pname': pname,
                'usage': usage,
            },
        },

        'online' : {
            'bind':{
                'server_ip' : ol_ip, 
                'min': min, 
                'mid': mid,
                'pname': pname,
                'usage': usage,
            },
            'bench':{
                'pname' : pname,
                'game_id' : game_id,
            },
            'common':{
                'db_ip' : db_ip, 
                'switch_ip': sw_ip,
                'rank_ip': rk_ip,
                'fighting_ip': ft_ip,
                'min': min, 
                'mid': mid,
            },
            'xml':{
                'battle_ip' : bt_ip, 
                'min': min, 
                'mid': mid,
                'pname': pname,
                'usage': usage,
            },
        },

        'battle' : {
            'bind':{
                'server_ip' : bt_ip, 
                'min': min, 
                'mid': mid,
                'pname': pname,
                'usage': usage,
            },
            'bench':{
                'pname' : pname,
                'game_id' : game_id,
            },
            'common':{
                'db_ip' : db_ip, 
                'switch_ip': sw_ip,
                'rank_ip': rk_ip,
                'fighting_ip': ft_ip,
                'min': min, 
                'mid': mid,
            },
        },

        'rank' : {
            'bind':{
                'server_ip' : rk_ip, 
                'min': min, 
                'mid': mid,
                'pname': pname,
                'usage': usage,
            },
            'bench':{
                'game_id' : game_id,
            },
        },

        'switch' : {
            'bind':{
                'server_ip' : sw_ip, 
                'min': min, 
                'mid': mid,
                'pname': pname,
                'usage': usage,
            },
            'bench':{
                'db_ip' : db_ip, 
                'fighting_ip': ft_ip,
                'min': min, 
                'mid': mid,
                'pname' : pname,
                'game_id' : game_id,
            },
            'xml':{
                'db_ip' : db_ip, 
                'min': min, 
                'mid': mid,
                'pname': pname,
                'usage': usage,
            },
        },

        'nickname' : {
            'bind':{
                'server_ip' : nk_ip, 
                'min': min, 
                'mid': mid,
                'pname': pname,
                'usage': usage,
            },
            'bench':{
                'pname' : pname,
                'game_id' : game_id,
            },
        },

        'fighting' : {
            'bind':{
                'server_ip' : ft_ip, 
                'min': min, 
                'mid': mid,
                'pname': pname,
                'usage': usage,
            },
            'bench':{
                'pname' : pname,
                'game_id' : game_id,
            },
        },
}


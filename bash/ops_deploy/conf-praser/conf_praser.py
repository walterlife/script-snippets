#!/usr/bin/env python
# -*- coding=utf-8 -*-
########################################################################
#    File Name: test.py
# 
#       Author: Shootao Shanghai,Inc.
#         Mail: walter@shootao.com
# Created Time: 2015年04月04日 星期六 22时16分34秒
#  Description: ...
#                
########################################################################

from jinja2 import *
import settings as st
import subprocess

def praser_db(path, vals) :
    db_env = Environment(loader = FileSystemLoader(path))

    fout = open(path+'bind.conf', 'w')
    bind_tpl = db_env.get_template('bind.tpl')
    fout.write("%s" %(bind_tpl.render(vals.get('bind'))).encode('utf8'))
    fout.close()

    fout = open(path+'bench.conf', 'w')
    bench_tpl = db_env.get_template('bench.tpl')
    fout.write("%s" %(bench_tpl.render(vals.get('bench'))).encode('utf8'))
    fout.close()

def praser_gamecenter(path, vals) :
    gc_env = Environment(loader = FileSystemLoader(path))

    fout = open(path+'bind.conf', 'w')
    bind_tpl = gc_env.get_template('bind.tpl')
    fout.write("%s" %(bind_tpl.render(vals.get('bind'))).encode('utf8'))
    fout.close()

    fout = open(path+'bench.conf', 'w')
    bench_tpl = gc_env.get_template('bench.tpl')
    fout.write("%s" %(bench_tpl.render(vals.get('bench'))).encode('utf8'))
    fout.close()

def praser_gateway(path, vals) :
    gt_env = Environment(loader = FileSystemLoader(path))

    fout = open(path+'bind.conf', 'w')
    bind_tpl = gt_env.get_template('bind.tpl')
    fout.write("%s" %(bind_tpl.render(vals.get('bind'))).encode('utf8'))
    fout.close()

    fout = open(path+'bench.conf', 'w')
    bench_tpl = gt_env.get_template('bench.tpl')
    fout.write("%s" %(bench_tpl.render(vals.get('bench'))).encode('utf8'))
    fout.close()

    fout = open(path+'login_server.xml', 'w')
    login_tpl = gt_env.get_template('login_server.tpl')
    fout.write("%s" %(login_tpl.render(vals.get('xml'))).encode('utf8'))
    fout.close()

    fout = open(path+'online_server.xml', 'w')
    online_tpl = gt_env.get_template('online_server.tpl')
    fout.write("%s" %(online_tpl.render(vals.get('xml'))).encode('utf8'))
    fout.close()

def praser_login(path, vals) :
    lg_env = Environment(loader = FileSystemLoader(path))

    fout = open(path+'bind.conf', 'w')
    bind_tpl = lg_env.get_template('bind.tpl')
    fout.write("%s" %(bind_tpl.render(vals.get('bind'))).encode('utf8'))
    fout.close()

    fout = open(path+'bench.conf', 'w')
    bench_tpl = lg_env.get_template('bench.tpl')
    fout.write("%s" %(bench_tpl.render(vals.get('bench'))).encode('utf8'))
    fout.close()

    fout = open(path+'login_server.xml', 'w')
    login_tpl = lg_env.get_template('login_server.tpl')
    fout.write("%s" %(login_tpl.render(vals.get('xml'))).encode('utf8'))
    fout.close()

    fout = open(path+'online_server.xml', 'w')
    online_tpl = lg_env.get_template('online_server.tpl')
    fout.write("%s" %(online_tpl.render(vals.get('xml'))).encode('utf8'))
    fout.close()

    fout = open(path+'db_server.xml', 'w')
    db_tpl = lg_env.get_template('db_server.tpl')
    fout.write("%s" %(db_tpl.render(vals.get('xml'))).encode('utf8'))
    fout.close()

def praser_online(path, vals) :
    ol_env = Environment(loader = FileSystemLoader(path))

    fout = open(path+'bind.conf', 'w')
    bind_tpl = ol_env.get_template('bind.tpl')
    fout.write("%s" %(bind_tpl.render(vals.get('bind'))).encode('utf8'))
    fout.close()

    fout = open(path+'bench.conf', 'w')
    bench_tpl = ol_env.get_template('bench.tpl')
    fout.write("%s" %(bench_tpl.render(vals.get('bench'))).encode('utf8'))
    fout.close()

    fout = open(path+'common.conf', 'w')
    common_tpl = ol_env.get_template('common.tpl')
    fout.write("%s" %(common_tpl.render(vals.get('common'))).encode('utf8'))
    fout.close()

    fout = open(path+'inter_server.xml', 'w')
    inter_tpl = ol_env.get_template('inter_server.tpl')
    fout.write("%s" %(inter_tpl.render(vals.get('xml'))).encode('utf8'))
    fout.close()

def praser_battle(path, vals) :
    bt_env = Environment(loader = FileSystemLoader(path))

    fout = open(path+'bind.conf', 'w')
    bind_tpl = bt_env.get_template('bind.tpl')
    fout.write("%s" %(bind_tpl.render(vals.get('bind'))).encode('utf8'))
    fout.close()

    fout = open(path+'bench.conf', 'w')
    bench_tpl = bt_env.get_template('bench.tpl')
    fout.write("%s" %(bench_tpl.render(vals.get('bench'))).encode('utf8'))
    fout.close()

    fout = open(path+'common.conf', 'w')
    common_tpl = bt_env.get_template('common.tpl')
    fout.write("%s" %(common_tpl.render(vals.get('common'))).encode('utf8'))
    fout.close()

def praser_rank(path, vals) :
    rk_env = Environment(loader = FileSystemLoader(path))

    fout = open(path+'bind.conf', 'w')
    bind_tpl = rk_env.get_template('bind.tpl')
    fout.write("%s" %(bind_tpl.render(vals.get('bind'))).encode('utf8'))
    fout.close()

def praser_switch(path, vals) :
    sw_env = Environment(loader = FileSystemLoader(path))

    fout = open(path+'bind.conf', 'w')
    bind_tpl = sw_env.get_template('bind.tpl')
    fout.write("%s" %(bind_tpl.render(vals.get('bind'))).encode('utf8'))
    fout.close()

    fout = open(path+'bench.conf', 'w')
    bench_tpl = sw_env.get_template('bench.tpl')
    fout.write("%s" %(bench_tpl.render(vals.get('bench'))).encode('utf8'))
    fout.close()

    fout = open(path+'db_server.xml', 'w')
    db_tpl = sw_env.get_template('db_server.tpl')
    fout.write("%s" %(db_tpl.render(vals.get('xml'))).encode('utf8'))
    fout.close()

def praser_nickname(path, vals) :
    nk_env = Environment(loader = FileSystemLoader(path))

    fout = open(path+'bind.conf', 'w')
    bind_tpl = nk_env.get_template('bind.tpl')
    fout.write("%s" %(bind_tpl.render(vals.get('bind'))).encode('utf8'))
    fout.close()

    fout = open(path+'bench.conf', 'w')
    bench_tpl = nk_env.get_template('bench.tpl')
    fout.write("%s" %(bench_tpl.render(vals.get('bench'))).encode('utf8'))
    fout.close()

def praser_fighting(path, vals) :
    ft_env = Environment(loader = FileSystemLoader(path))

    fout = open(path+'bind.conf', 'w')
    bind_tpl = ft_env.get_template('bind.tpl')
    fout.write("%s" %(bind_tpl.render(vals.get('bind'))).encode('utf8'))
    fout.close()

    fout = open(path+'bench.conf', 'w')
    bench_tpl = ft_env.get_template('bench.tpl')
    fout.write("%s" %(bench_tpl.render(vals.get('bench'))).encode('utf8'))
    fout.close()

if __name__ == '__main__':
    praser_db(path = st.templates_path+'/db/', vals = st.tpl_values.get('db'))
    praser_gamecenter(path = st.templates_path+'/gamecenter/', vals = st.tpl_values.get('gamecenter'))
    praser_gateway(path = st.templates_path+'/gateway/', vals = st.tpl_values.get('gateway'))
    praser_login(path = st.templates_path+'/login/', vals = st.tpl_values.get('login'))
    praser_online(path = st.templates_path+'/online/', vals = st.tpl_values.get('online'))
    praser_battle(path = st.templates_path+'/battle/', vals = st.tpl_values.get('battle'))
    praser_rank(path = st.templates_path+'/rank/', vals = st.tpl_values.get('rank'))
    praser_switch(path = st.templates_path+'/switch/', vals = st.tpl_values.get('switch'))
    praser_nickname(path = st.templates_path+'/nickname/', vals = st.tpl_values.get('nickname'))
    praser_fighting(path = st.templates_path+'/fighting/', vals = st.tpl_values.get('fighting'))

    #subprocess.Popen('sh ./cp_conf.sh', shell = True)

#!/usr/bin/env python
# -*- coding=utf-8 -*-

# brief     most used python snippts
# author    walter
# email     walterzywei@gmail.com
# date      2015-09-06

if __name__ == '__main__':
    l = ['ds ', '', '2121']

    # filter out empty strings in a sting list
    l = [x for x in l if x.strip() != '']

    # swap variables
    # 1. 将右边的a, b => (a, b)
    # 2. 将tuple 赋值给 b, a
    b, a = a, b
    
    # 左边变量的数目必须和右边tuple 的元素个数相等
    people = ['walte', 'depops', '12332222' ]
    name, title, phone= people 

    # _ 的作用 保存上一次变量的运行结果, None 不会保存
    num = 1111
    num 
    _ # 1111
    
    # join 合并字符串, 只可以连接字符串 list，不会做类型转换
    colors = ["re", "blue", "green", "yellow"]
    result = ','.join(colors)

    # 关键字  in 的使用
    str="dssdsds"
    if 'd' in str :
        print "yes"
    else:
        print "no"
    
    # dict get 方法
    d = {'a': 1, 'b': 2}
    d.get(c) # None
    d.get('c', 14) # 14

    # dict setdefault 方法
    equities = {}
    for (port, equity) in data:
        equities.setdefault(port, []).append(equity)

    # dict fromkeys 需要提供value 的值
    d = {}
    d.fromkeys(['a', 'b', 'c'], 2) # {'a': 2, 'b': 2, 'c': 3}

    # dict 的组装和拆分
    # zip 将两个list 组成 一个 dict 左边的值作为 KEY, 右边的值作为VALUE
    a = [1, 2, 3,]
    b = [4, 5, 6, 7]
    p = dict(zip(a, b)) # {1: 4, 2: 5, 3: 6} 元素的个数以 KEY的数量为主

    # dict keys(), values() 方法
    p.keys() # [1, 2, 3]
    p.values() # [4, 5, 6]

    # enumerate 的使用
    a = [1, 2, 3]
    for (index, value) in enumerate(a):
        print index, value

    # format ^居中 <左对齐 >右对齐
    name = "walter"
    print "hello {nm:^10}!!".format(nm=name)
    print "hello {nm:,>10}!!".format(nm=name)

    # 迭代器
    [n ** 2 for n in xrange(1, 10)] # 1 表示数字间间隔

    # sorted
    a_list = [3, 2, 4, 1]
    new_list = sorted(a_list)

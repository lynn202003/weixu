*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.usermanage    ${common.token}
Variables  API/cfg.py

*** Test Cases ***
用户列表---usermanage0001
#前提是已经有用户列表的数据
    [Tags]    冒烟测试
    [Documentation]     正常获取用户列表
    getUserList      ${local_url}     type=0     phone=130     registDate=2020-04-22,2020-05-22     orderBy=registDate_desc       pageSize=10       pageNum=1


用户列表---usermanage0001
    [Documentation]     获取用户列表时type为空
    getUserList      ${local_url}     type=${EMPTY}     phone=130     registDate=2020-04-22,2020-05-22     orderBy=registDate_desc       pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时type为空格
    getUserList      ${local_url}     type=${EMPTY}     phone=130     registDate=2020-04-22,2020-05-22     orderBy=registDate_desc       pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时type参数不传
    getUserList      ${local_url}        phone=130     registDate=2020-04-22,2020-05-22     orderBy=registDate_desc       pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时type为中文
    getUserList      ${local_url}        type=中文     phone=130     registDate=2020-04-22,2020-05-22     orderBy=registDate_desc       pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时type为字母
    getUserList      ${local_url}        type=jil     phone=130     registDate=2020-04-22,2020-05-22     orderBy=registDate_desc       pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时phone为空
    getUserList      ${local_url}        type=0     phone=${EMPTY}     registDate=2020-04-22,2020-05-22     orderBy=registDate_desc       pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时phone为空格
    getUserList      ${local_url}        type=0     phone=${SPACE}     registDate=2020-04-22,2020-05-22     orderBy=registDate_desc       pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时phone参数不传
    getUserList      ${local_url}        type=0        registDate=2020-04-22,2020-05-22     orderBy=registDate_desc       pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时phone传入列表中存在的手机号
    getUserList      ${local_url}        type=0     phone=130    registDate=2020-04-22,2020-05-22     orderBy=registDate_desc       pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时phone传入列表中不存在的手机号
    getUserList      ${local_url}        type=0     phone=111    registDate=2020-04-22,2020-05-22     orderBy=registDate_desc       pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时registDate传入列表中不存在的日期
    getUserList      ${local_url}        type=0     phone=130    registDate=2021-04-22,2021-05-22     orderBy=registDate_desc       pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时registDate传入列表中存在的日期
    getUserList      ${local_url}        type=0     phone=130    registDate=2020-04-22,2020-05-22      orderBy=registDate_desc       pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时registDate传入开始时间晚于结束时间
    getUserList      ${local_url}        type=0     phone=130    registDate=2020-05-22 ,2020-04-22   orderBy=registDate_desc       pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时registDate参数不传
    getUserList      ${local_url}        type=0     phone=130      orderBy=registDate_desc       pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时registDate传入空格
    getUserList      ${local_url}        type=0     phone=130      registDate=${SPACE}  orderBy=registDate_desc       pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时registDate为空
    getUserList      ${local_url}        type=0     phone=130      registDate=${EMPTY}  orderBy=registDate_desc       pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时orderBy传入空格
    getUserList      ${local_url}        type=0     phone=130      registDate=${EMPTY}    orderBy=${SPACE}     pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时orderBy为空
    getUserList      ${local_url}        type=0     phone=130      registDate=${EMPTY}    orderBy=${EMPTY}     pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时orderBy参数不传
    getUserList      ${local_url}        type=0     phone=130      registDate=${EMPTY}         pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时orderBy输入registDate_desc
    getUserList      ${local_url}        type=0     phone=130      registDate=${EMPTY}      orderBy=registDate_desc     pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时orderBy输入registDate_asc
    getUserList      ${local_url}        type=0     phone=130      registDate=${EMPTY}      orderBy=registDate_asc     pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时pageSize输入每页范围内的记录
    getUserList      ${local_url}        type=0     phone=130      registDate=${EMPTY}      orderBy=registDate_asc     pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时pageSize输入超过每页范围内的记录
    getUserList      ${local_url}        type=0     phone=130      registDate=${EMPTY}      orderBy=registDate_asc     pageSize=60      pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时pageSize参数不传
    getUserList      ${local_url}        type=0     phone=130      registDate=${EMPTY}      orderBy=registDate_asc         pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时pageSize输入为空
    getUserList      ${local_url}        type=0     phone=130      registDate=${EMPTY}      orderBy=registDate_asc     pageSize=${EMPTY}     pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时pageSize输入为空格
    getUserList      ${local_url}        type=0     phone=130      registDate=${EMPTY}      orderBy=registDate_asc     pageSize=${SPACE}     pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时pageNum输入存在的页码
    getUserList      ${local_url}        type=0     phone=130      registDate=${EMPTY}      orderBy=registDate_asc     pageSize=10       pageNum=1

用户列表---usermanage0001
    [Documentation]     获取用户列表时pageNum输入不存在的页码
    getUserList      ${local_url}        type=0     phone=130      registDate=${EMPTY}      orderBy=registDate_asc     pageSize=10       pageNum=100

用户列表---usermanage0001
    [Documentation]     获取用户列表时pageNum输入的内容为空
    getUserList      ${local_url}        type=0     phone=130      registDate=${EMPTY}      orderBy=registDate_asc     pageSize=10       pageNum=${EMPTY}

用户列表---usermanage0001
    [Documentation]     获取用户列表时pageNum输入的内容为空格
    getUserList      ${local_url}        type=0     phone=130      registDate=${EMPTY}      orderBy=registDate_asc     pageSize=10       pageNum=${SPACE}


用户列表---usermanage0001
    [Documentation]     获取用户列表时pageNum参数不传
    getUserList      ${local_url}        type=0     phone=130      registDate=${EMPTY}      orderBy=registDate_asc     pageSize=10
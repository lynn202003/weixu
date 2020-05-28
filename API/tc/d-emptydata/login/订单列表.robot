*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.ordermanage    ${common.token}
Variables  API/cfg.py

*** Test Cases ***
订单列表--order0001
    [Tags]    冒烟测试
    [Documentation]      正常获取订单列表
    ${getorderlist}     getOrderList      ${local_url}     type=1     package=0    buyDate=2020-05-01     orderBy=buyDate_asc      pageSize=10     pageNum=1
    should be true     $getorderlist["type"]=="处处有码"

订单列表--order0001001
    [Tags]    冒烟测试
    [Documentation]      获取订单列表时type为空
    ${getorderlist}     getOrderList      ${local_url}     type=${EMPTY}     package=0    buyDate=2020-05-01     orderBy=buyDate_asc      pageSize=10     pageNum=1
    should be true     $getorderlist["type"]=="处处有码"

订单列表--order0001002
    [Tags]    冒烟测试
    [Documentation]      获取订单列表时type为空格
    ${getorderlist}     getOrderList      ${local_url}     type=${SPACE}     package=0    buyDate=2020-05-01     orderBy=buyDate_asc      pageSize=10     pageNum=1
    should be true     $getorderlist["type"]=="处处有码"

订单列表--order0001003
    [Tags]    冒烟测试
    [Documentation]      获取订单列表时type参数不传
    ${getorderlist}     getOrderList      ${local_url}        package=0    buyDate=2020-05-01     orderBy=buyDate_asc      pageSize=10     pageNum=1
    should be true     $getorderlist["type"]=="处处有码"
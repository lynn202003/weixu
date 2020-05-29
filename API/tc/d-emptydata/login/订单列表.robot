*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.ordermanage    ${common.token}
Variables  API/cfg.py

*** Test Cases ***
订单列表--order0001
    [Tags]    冒烟测试
    [Documentation]      正常获取订单列表
    ${getorderlist}     getOrderList      ${local_url}     type=1     package=0    buyDate=2020-05-25     orderBy=buyDate_asc      pageSize=10     pageNum=1
    ${getorderlist}    evaluate  "totalSize" in $getorderlist["data"]
    run keyword if    $getorderlist      log to console    pass

订单列表--order0001001
    [Documentation]      获取订单列表时type为空
    ${getorderlist}     getOrderList      ${local_url}     type=${EMPTY}     package=0    buyDate=2020-05-25     orderBy=buyDate_asc      pageSize=10     pageNum=1
    ${getorderlist}   evaluate  "totalSize" in $getorderlist["data"]
    run keyword if    $getorderlist      log to console    pass

订单列表--order0001002
    [Documentation]      获取订单列表时type为空格
    ${getorderlist}     getOrderList      ${local_url}     type=${SPACE}     package=0    buyDate=2020-05-25     orderBy=buyDate_asc      pageSize=10     pageNum=1
    ${getorderlist}    evaluate  "totalSize" in $getorderlist["data"]
    run keyword if     $getorderlist      log to console    pass

订单列表--order0001003
    [Documentation]      获取订单列表时type参数不传
    ${getorderlist}     getOrderList      ${local_url}        package=0    buyDate=2020-05-25     orderBy=buyDate_asc      pageSize=10     pageNum=1
    ${getorderlist}    evaluate  "totalSize" in $getorderlist["data"]
    run keyword if    $getorderlist      log to console    pass

订单列表--order0001004
    [Documentation]      获取订单列表时package参数不传
    ${getorderlist}     getOrderList      ${local_url}       type=1       buyDate=2020-05-25     orderBy=buyDate_asc      pageSize=10     pageNum=1
    ${getorderlist}    evaluate  "totalSize" in $getorderlist["data"]
    run keyword if     $getorderlist      log to console    pass

订单列表--order0001005
    [Documentation]      获取订单列表时package参数为空
    ${getorderlist}     getOrderList      ${local_url}       type=1   package=${EMPTY}    buyDate=2020-05-01     orderBy=buyDate_asc      pageSize=10     pageNum=1
    ${getorderlist}    evaluate  "totalSize" in $getorderlist["data"]
    run keyword if     $getorderlist      log to console    pass

订单列表--order0001006
    [Documentation]      获取订单列表时package参数为空格
    ${getorderlist}     getOrderList      ${local_url}       type=1   package=${SPACE}    buyDate=2020-05-01     orderBy=buyDate_asc      pageSize=10     pageNum=1
    ${getorderlist}    evaluate  "totalSize" in $getorderlist["data"]
     run keyword if     $getorderlist      log to console    pass

订单列表--order0001007
    [Documentation]      获取订单列表时buyDate参数为空格
    ${getorderlist}     getOrderList      ${local_url}       type=1   package=0   buyDate=${SPACE}      orderBy=buyDate_asc      pageSize=10     pageNum=1
    ${getorderlist}    evaluate  "totalSize" in $getorderlist["data"]
     run keyword if    $getorderlist      log to console    pass

订单列表--order0001008
    [Documentation]      获取订单列表时buyDate参数为空
    ${getorderlist}     getOrderList      ${local_url}       type=1   package=0   buyDate=${EMPTY}      orderBy=buyDate_asc      pageSize=10     pageNum=1
    ${getorderlist}    evaluate  "totalSize" in $getorderlist["data"]
     run keyword if     $getorderlist      log to console    pass

订单列表--order0001009
    [Documentation]      获取订单列表时buyDate参数不传
    ${getorderlist}     getOrderList      ${local_url}       type=1   package=0        orderBy=buyDate_asc      pageSize=10     pageNum=1
    ${getorderlist}    evaluate  "totalSize" in $getorderlist["data"]
     run keyword if     $getorderlist      log to console    pass

订单列表--order0001010
    [Documentation]      获取订单列表时orderBy参数不传
    ${getorderlist}     getOrderList      ${local_url}       type=1   package=0    buyDate= 020-05-01         pageSize=10     pageNum=1
    ${getorderlist}    evaluate  "totalSize" in $getorderlist["data"]
    run keyword if     $getorderlist      log to console    pass

订单列表--order0001011
    [Documentation]      获取订单列表时orderBy参数为空
    ${getorderlist}     getOrderList      ${local_url}       type=1   package=0    buyDate= 020-05-01   orderBy=${EMPTY}      pageSize=10     pageNum=1
    ${getorderlist}    evaluate  "totalSize" in $getorderlist["data"]
    run keyword if     $getorderlist      log to console    pass

订单列表--order0001012
    [Documentation]      获取订单列表时orderBy参数为空格
    ${getorderlist}     getOrderList      ${local_url}       type=1   package=0    buyDate= 020-05-01   orderBy=${SPACE}      pageSize=10     pageNum=1
    ${getorderlist}     evaluate  "totalSize" in $getorderlist["data"]
     run keyword if     $getorderlist      log to console    pass

订单列表--order0001013
    [Documentation]      获取订单列表时pageSize参数为空格
    ${getorderlist}     getOrderList      ${local_url}       type=1   package=0    buyDate= 020-05-01   orderBy=${SPACE}      pageSize=${SPACE}     pageNum=1
    ${getorderlist}    evaluate  "totalSize" in $getorderlist["data"]
     run keyword if    $getorderlist      log to console    pass

订单列表--order0001014
    [Documentation]      获取订单列表时pageSize参数为空
    ${getorderlist}     getOrderList      ${local_url}       type=1   package=0    buyDate= 020-05-01   orderBy=${SPACE}      pageSize=${EMPTY}     pageNum=1
    ${getorderlist}    evaluate  "totalSize" in $getorderlist["data"]
    run keyword if     $getorderlist      log to console    pass

订单列表--order0001015
    [Documentation]      获取订单列表时pageSize参数不传
    ${getorderlist}     getOrderList      ${local_url}       type=1   package=0    buyDate= 020-05-01   orderBy=${SPACE}          pageNum=1
    ${getorderlist}    evaluate  "totalSize" in $getorderlist["data"]
    run keyword if     $getorderlist      log to console    pass

订单列表--order0001016
    [Documentation]      获取订单列表时pageNum参数不传
    ${getorderlist}     getOrderList      ${local_url}       type=1   package=0    buyDate= 020-05-01   orderBy=${SPACE}      pageSize=10
    ${getorderlist}    evaluate  "totalSize" in $getorderlist["data"]
    run keyword if    $getorderlist      log to console    pass

订单列表--order0001017
    [Documentation]      获取订单列表时pageNum参数为空
    ${getorderlist}     getOrderList      ${local_url}       type=1   package=0    buyDate= 020-05-01   orderBy=${SPACE}      pageSize=${EMPTY}
    ${getorderlist}    evaluate  "totalSize" in $getorderlist["data"]
    run keyword if     $getorderlist      log to console    pass

订单列表--order0001018
    [Documentation]      获取订单列表时pageNum参数为空格
    ${getorderlist}     getOrderList      ${local_url}       type=1   package=0    buyDate= 020-05-01   orderBy=${SPACE}      pageSize=${SPACE}
    ${getorderlist}    evaluate  "totalSize" in $getorderlist["data"]
    run keyword if    $getorderlist      log to console    pass
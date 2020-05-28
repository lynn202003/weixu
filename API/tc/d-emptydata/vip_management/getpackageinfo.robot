*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.vipManage     ${common.token}
Variables  API/cfg.py


*** Test Cases ***
获取套餐信息---pack0004
#已创建了一个套餐
    [Tags]    冒烟测试
    [Documentation]      正常获取套餐信息
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${getpackage}      GetPackage       ${local_url}     packageId=${addpackage}[data][packageId]
    should be true       $getpackage["data"]["package"]=="测试版"
    [Teardown]     deletePackageInfo        ${local_url}     id=${addpackage}[data][packageId]

获取套餐信息---pack0004001
    [Documentation]      获取套餐信息时packageId为空
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31    nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${getpackage}      GetPackage       ${local_url}     packageId=${EMPTY}
    ${errors}    Evaluate  "packageId" in $getpackage["errors"]
    run keyword if   ${errors}    log to console    pass
    [Teardown]     deletePackageInfo        ${local_url}     id=${addpackage}[data][packageId]

获取套餐信息---pack0004002
    [Documentation]      获取套餐信息时packageId为空格
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${getpackage}      GetPackage       ${local_url}     packageId=${SPACE}
    ${errors}    Evaluate  "packageId" in $getpackage["errors"]
    run keyword if   ${errors}    log to console    pass
    [Teardown]     deletePackageInfo        ${local_url}     id=${addpackage}[data][packageId]


获取套餐信息---pack0004003
    [Documentation]      获取套餐信息时packageId参数不传
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${getpackage}      GetPackage       ${local_url}
    should be true       $getpackage["error_msg"]=="记录不存在！"
    [Teardown]     deletePackageInfo        ${local_url}     id=${addpackage}[data][packageId]


获取套餐信息---pack0004004
    [Documentation]      获取套餐信息时packageId传入不存在的id
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31    nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${getpackage}      GetPackage       ${local_url}      packageId=jijkjik121
    ${errors}    Evaluate  "packageId" in $getpackage["errors"]
    run keyword if   ${errors}    log to console    pass
    [Teardown]     deletePackageInfo        ${local_url}     id=${addpackage}[data][packageId]

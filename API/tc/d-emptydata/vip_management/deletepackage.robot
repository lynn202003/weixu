*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.vipManage    ${common.token}
Variables  API/cfg.py

*** Test Cases ***
删除套餐---pack0003
    [Tags]    冒烟测试
    [Documentation]     正常删除套餐
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${deletepackageinfo}      deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]
    should be true       $deletepackageinfo["error_msg"]=="删除成功！"

删除套餐---pack0003001
    [Documentation]     删除套餐时id为空
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${deletepackageinfo}      deletePackageInfo       ${local_url}     id=${EMPTY}
    ${errors}    Evaluate  "id" in $deletepackageinfo["errors"]
    run keyword if   ${errors}    log to console    pass
    [Teardown]     deletePackageInfo        ${local_url}     id=${addpackage}[data][packageId]

删除套餐---pack0003002
    [Documentation]     删除套餐时id为空格
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${deletepackageinfo}      deletePackageInfo       ${local_url}     id=${SPACE}
    ${errors}    Evaluate  "id" in $deletepackageinfo["errors"]
    run keyword if   ${errors}    log to console    pass
    [Teardown]     deletePackageInfo        ${local_url}    id=${addpackage}[data][packageId]

删除套餐---pack0003003
    [Documentation]     删除套餐时id参数不传
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${deletepackageinfo}      deletePackageInfo       ${local_url}
    should be true       $deletepackageinfo["error_msg"]=="记录不存在！"
    [Teardown]     deletePackageInfo        ${local_url}     id=${addpackage}[data][packageId]

删除套餐---pack0003004
    [Documentation]     删除套餐时id输入不存在的id
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${deletepackageinfo}      deletePackageInfo       ${local_url}     id=ftgt12521212512
    ${errors}    Evaluate  "id" in $deletepackageinfo["errors"]
    run keyword if   ${errors}    log to console    pass
    [Teardown]     deletePackageInfo        ${local_url}    id=${addpackage}[data][packageId]

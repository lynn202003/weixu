*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.vipManage    ${common.token}
Variables  API/cfg.py

*** Test Cases ***
上架套餐---pack0005
    [Tags]    冒烟测试
    [Documentation]     正常上架套餐
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${putonpackageinfo}      putOnPackageInfo       ${local_url}     id=${addpackage}[data][packageId]
    should be true       $putonpackageinfo["error_msg"]=="上架成功！"
    [Teardown]     deletePackageInfo        ${local_url}     id=${addpackage}[data][packageId]

上架套餐---pack0005001
    [Documentation]     上架套餐时id为空
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${putonpackageinfo}      putOnPackageInfo       ${local_url}     id=${EMPTY}
    ${errors}    Evaluate  "id" in $putonpackageinfo["errors"]
    run keyword if   ${errors}    log to console    pass
    [Teardown]     deletePackageInfo        ${local_url}     id=${addpackage}[data][packageId]

上架套餐---pack0005002
    [Documentation]     上架套餐时id为空格
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${putonpackageinfo}      putOnPackageInfo       ${local_url}     id=${SPACE}
    ${errors}    Evaluate  "id" in $putonpackageinfo["errors"]
    run keyword if   ${errors}    log to console    pass
    [Teardown]     deletePackageInfo        ${local_url}     id=${addpackage}[data][packageId]

上架套餐---pack0005003
    [Documentation]     上架套餐时id参数不传
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${putonpackageinfo}      putOnPackageInfo       ${local_url}
    should be true       $putonpackageinfo["error_msg"]=="记录不存在！"
    [Teardown]     deletePackageInfo        ${local_url}    id=${addpackage}[data][packageId]


上架套餐---pack0005004
    [Documentation]     上架套餐时id传入不存在的id
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${putonpackageinfo}      putOnPackageInfo       ${local_url}      id=jikk12121
    ${errors}    Evaluate  "id" in $putonpackageinfo["errors"]
    run keyword if   ${errors}    log to console    pass
    [Teardown]     deletePackageInfo        ${local_url}    id=${addpackage}[data][packageId]
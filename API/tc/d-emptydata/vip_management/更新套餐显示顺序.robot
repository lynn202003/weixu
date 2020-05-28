*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.usermanage    ${common.token}
Variables  API/cfg.py

*** Test Cases ***
更新套餐显示顺序---pack0008
#已创建了一个套餐
    [Tags]    冒烟测试
    [Documentation]      正常更新套餐显示顺序
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=1      originalPrice=1     isRecommend=1
    ${getpackage}      updatePackageIndex       ${local_url}     packageId1=${addpackage}["data"]["packageId"]    showIndex1=""     packageId2=""    showIndex2=""
    ${getpackage}      updatePackageIndex       ${local_url}     packageId1=${addpackage}["data"]["packageId"]    showIndex1=""     packageId2=""    showIndex2=""
    should be true       $getpackage["data"]["package"]=="测试版"
    [Teardown]     deletePackageInfo        ${local_url}     id=${addpackage}["data"]["packageId"]
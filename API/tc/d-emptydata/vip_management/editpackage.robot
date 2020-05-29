*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.vipManage    ${common.token}
Variables  API/cfg.py

*** Test Cases ***
编辑套餐---pack0002
    [Tags]    冒烟测试
    [Documentation]     正常编辑套餐
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}      packageId=${addpackage}[data][packageId]        productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="更新成功！"
    deletePackageInfo       ${local_url}     id=${updatePackageInfo}[data][packageId]

编辑套餐---pack0002001
    [Documentation]     编辑套餐时packageId为空
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}      packageId=${EMPTY}       productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${errors}   Evaluate  "$.packageId" in $updatePackageInfo["errors"]
    run keyword if   ${errors}  log to console   pass
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]



编辑套餐---pack0002002
    [Documentation]     编辑套餐时packageId为空格
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31      nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}      packageId=${SPACE}       productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${errors}   Evaluate  "$.packageId" in $updatePackageInfo["errors"]
    run keyword if   ${errors}  log to console   pass
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002003
    [Documentation]     编辑套餐时packageId参数不传
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}       productType=1     package=测试版       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="记录不存在！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]


编辑套餐---pack0002004
    [Documentation]     编辑套餐时packageId传入不存在的id
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}     packageId=gtgggg    productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${errors}   Evaluate  "$.packageId" in $updatePackageInfo["errors"]
    run keyword if   ${errors}  log to console   pass
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002005
    [Documentation]     编辑套餐时productType为中文
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]     productType=中文     package=测试版     vipCycle=31      nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="更新成功！"
    deletePackageInfo       ${local_url}     id=${updatePackageInfo}[data][packageId]

编辑套餐---pack0002006
    [Documentation]     编辑套餐时productType为英文
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]     productType=jio     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="更新成功！"
    deletePackageInfo       ${local_url}     id=${updatePackageInfo}[data][packageId]

编辑套餐---pack0002007
    [Documentation]     编辑套餐时productType为字符
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=%^&     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="更新成功！"
    deletePackageInfo       ${local_url}     id=${updatePackageInfo}[data][packageId]

编辑套餐---pack0002008
#现在是为空，空格，不传都可更新成功
    [Documentation]     编辑套餐时productType为空
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=${EMPTY}      package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="套餐类型设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002009
    [Documentation]     编辑套餐时productType为空格
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=${SPACE}       package=测试版     vipCycle=31      nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="套餐类型设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002010
    [Documentation]     编辑套餐时productType参数不传
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]           package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true      $updatePackageInfo["error_msg"]=="套餐类型设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002011
    [Documentation]     编辑套餐时package为空格
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2       package=${SPACE}     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="套餐名称设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]


编辑套餐---pack0002012
    [Documentation]     编辑套餐时package为空
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2        package=${EMPTY}    vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true      $updatePackageInfo["error_msg"]=="套餐名称设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]


编辑套餐---pack0002013
    [Documentation]     编辑套餐时package参数不传
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]     productType=2       vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="套餐名称设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002014
    [Documentation]     编辑套餐时package为有效长度内的中文
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中国    vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="更新成功！"
    deletePackageInfo       ${local_url}     id=${updatePackageInfo}[data][packageId]

编辑套餐---pack0002015
    [Documentation]     编辑套餐时package为有效长度内的字母
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=jii     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="更新成功！"
    deletePackageInfo       ${local_url}     id=${updatePackageInfo}[data][packageId]

编辑套餐---pack0002016
    [Documentation]     编辑套餐时package为有效长度内的数字
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]     productType=2         package=125     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="更新成功！"
    deletePackageInfo       ${local_url}     id=${updatePackageInfo}[data][packageId]

编辑套餐---pack0002017
    [Documentation]     编辑套餐时package为有效长度内的字符
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]     productType=2         package=%^&     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="更新成功！"
    deletePackageInfo       ${local_url}     id=${updatePackageInfo}[data][packageId]

编辑套餐---pack0002018
    [Documentation]     编辑套餐时package为1个有效字符
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]     productType=2         package=中     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="套餐名称设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002019
    [Documentation]     编辑套餐时package为2个有效字符
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="更新成功！"
    deletePackageInfo       ${local_url}     id=${updatePackageInfo}[data][packageId]


编辑套餐---pack0002020
    [Documentation]     编辑套餐时package为8个有效字符
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31      nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]     productType=2         package=中中是国是不国是      vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="更新成功！"
    deletePackageInfo       ${local_url}     id=${updatePackageInfo}[data][packageId]


编辑套餐---pack0002021
    [Documentation]     编辑套餐时packagee为9个有效字符
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中是国是不国是你是是中     vipCycle=31      nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="套餐名称设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002022
    [Documentation]     编辑套餐时vipCycle为空格
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国     vipCycle=${SPACE}         nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="会员周期设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002023
    [Documentation]     编辑套餐时vipCycle为空
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31      nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国     vipCycle=${EMPTY}          nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="会员周期设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002024
    [Documentation]     编辑套餐时vipCycle参数不传
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]    productType=2         package=中中是国          nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true      $updatePackageInfo["error_msg"]=="会员周期设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002025
    [Documentation]     编辑套餐时vipCycle为31
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国     vipCycle=31          nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="更新成功！"
    deletePackageInfo       ${local_url}     id=${updatePackageInfo}[data][packageId]

编辑套餐---pack0002026
    [Documentation]     编辑套餐时vipCycle为365
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国     vipCycle=365         nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="更新成功！"
    deletePackageInfo       ${local_url}     id=${updatePackageInfo}[data][packageId]

编辑套餐---pack0002027
    [Documentation]     编辑套餐时vipCycle为字母
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国     vipCycle=ji        nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="更新成功！"
    deletePackageInfo       ${local_url}     id=${updatePackageInfo}[data][packageId]

编辑套餐---pack0002028
    [Documentation]     编辑套餐时nowPrice为10001
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国    vipCycle=365       nowPrice=${10001}      originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="套餐的当前售价设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002029
    [Documentation]     编辑套餐时nowPrice为小数
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31       nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国     vipCycle=365     nowPrice=${0.1}     originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="套餐的当前售价设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002030
    [Documentation]     编辑套餐时nowPrice为0
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]     productType=2         package=中中是国     vipCycle=365     nowPrice=${0}     originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="套餐的当前售价设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002031
    [Documentation]     编辑套餐时nowPrice为负数
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国    vipCycle=365     nowPrice=${-9}     originalPrice=${1}     isRecommend=${1}
    should be true      $updatePackageInfo["error_msg"]=="套餐的当前售价设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002032
    [Documentation]     编辑套餐时nowPrice为10000
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国     vipCycle=365     nowPrice=${10000}     originalPrice=${1}     isRecommend=${1}
    should be true      $updatePackageInfo["error_msg"]=="更新成功！"
    deletePackageInfo       ${local_url}     id=${updatePackageInfo}[data][packageId]

编辑套餐---pack0002033
    [Documentation]     编辑套餐时nowPrice为1
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国     vipCycle=365     nowPrice=${1}     originalPrice=${1}     isRecommend=${1}
    should be true      $updatePackageInfo["error_msg"]=="更新成功！"
    deletePackageInfo       ${local_url}     id=${updatePackageInfo}[data][packageId]

编辑套餐---pack0002034
    [Documentation]     编辑套餐时nowPrice为空
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国     vipCycle=365     nowPrice=${EMPTY}    originalPrice=${1}     isRecommend=${1}
    ${errors}    Evaluate  "$.nowPrice" in $updatePackageInfo["errors"]
    run keyword if   ${errors}    log to console    pass
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002035
    [Documentation]     编辑套餐时nowPrice为空格
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国    vipCycle=365     nowPrice=${SPACE}     originalPrice=${1}     isRecommend=${1}
    ${errors}    Evaluate  "$.nowPrice" in $updatePackageInfo["errors"]
    run keyword if   ${errors}    log to console    pass
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002036
    [Documentation]     编辑套餐时nowPrice参数不传
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国    vipCycle=365         originalPrice=${1}     isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="套餐的当前售价设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002037
    [Documentation]     编辑套餐时nowPrice为字母
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]     productType=2         package=中中是国     vipCycle=365     nowPrice=jil   originalPrice=${1}     isRecommend=${1}
    ${errors}    Evaluate  "$.nowPrice" in $updatePackageInfo["errors"]
    run keyword if   ${errors}    log to console    pass
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002038
    [Documentation]     编辑套餐时originalPrice为空
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国    vipCycle=365     nowPrice=${1}   originalPrice=${EMPTY}   isRecommend=${1}
    ${errors}    Evaluate  "$.originalPrice" in $updatePackageInfo["errors"]
    run keyword if   ${errors}    log to console    pass
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002039
    [Documentation]     编辑套餐时originalPrice空格
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国     vipCycle=365      nowPrice=${1}  originalPrice=${SPACE}     isRecommend=${1}
    ${errors}    Evaluate  "$.originalPrice" in $updatePackageInfo["errors"]
    run keyword if   ${errors}    log to console    pass
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002040
    [Documentation]     编辑套餐时originalPrice参数不传
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]     productType=2         package=中中是国     vipCycle=365     nowPrice=${1}     isRecommend=${1}
    should be true    $updatePackageInfo["error_msg"]=="套餐原价设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002041
    [Documentation]     编辑套餐时originalPrice为1
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31    nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]     productType=2         package=中中是     vipCycle=365     nowPrice=${1}    originalPrice=${1}    isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="更新成功！"
    deletePackageInfo       ${local_url}     id=${updatePackageInfo}[data][packageId]


编辑套餐---pack0002042
    [Documentation]     编辑套餐时originalPrice为10000
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31    nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国    vipCycle=365     nowPrice=${1}    originalPrice=${10000}    isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="更新成功！"
    deletePackageInfo       ${local_url}     id=${updatePackageInfo}[data][packageId]


编辑套餐---pack0002043
    [Documentation]     编辑套餐时originalPrice为10001
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31    nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是     vipCycle=365     nowPrice=${1}    originalPrice=${10001}    isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="套餐原价设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]


编辑套餐---pack0002044
    [Documentation]     编辑套餐时originalPrice为0
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国     vipCycle=365    nowPrice=${1}    originalPrice=${0}    isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="套餐原价设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]



编辑套餐---pack0002045
    [Documentation]     编辑套餐时originalPrice为小数
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国     vipCycle=365    nowPrice=${1}   originalPrice=${0.2}    isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="套餐原价设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002046
    [Documentation]     编辑套餐时originalPrice为负数
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国    vipCycle=365     nowPrice=${1}    originalPrice=${-9}   isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="套餐原价设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002047
    [Documentation]     编辑套餐时originalPrice为中文
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31    nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]     productType=2         package=中中是国是    vipCycle=365     nowPrice=${1}     originalPrice=中   isRecommend=${1}
    ${errors}    Evaluate  "$.originalPrice" in $updatePackageInfo["errors"]
    run keyword if   ${errors}    log to console    pass
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002048
    [Documentation]     编辑套餐时isRecommend为空
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31    nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国     vipCycle=365     nowPrice=${1}    originalPrice=${1}   isRecommend=${EMPTY}
    ${errors}    Evaluate  "$.isRecommend" in $updatePackageInfo["errors"]
    run keyword if   ${errors}    log to console    pass
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002049
    [Documentation]     编辑套餐时isRecommend为空格
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国    vipCycle=365     nowPrice=${1}    originalPrice=${1}  isRecommend=${SPACE}
    ${errors}    Evaluate  "$.isRecommend" in $updatePackageInfo["errors"]
    run keyword if   ${errors}    log to console    pass
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002050
    [Documentation]     编辑套餐时isRecommend参数不传
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是    vipCycle=365     nowPrice=${1}    originalPrice=${1}
    should be true       $updatePackageInfo["error_msg"]=="推荐参数设置错误！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]


编辑套餐---pack0002051
    [Documentation]     编辑套餐时isRecommend为1
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国    vipCycle=365    nowPrice=${1}    originalPrice=${1}   isRecommend=${1}
    should be true       $updatePackageInfo["error_msg"]=="更新成功！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

编辑套餐---pack0002052
    [Documentation]     编辑套餐时isRecommend为2
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    ${updatePackageInfo}     updatePackageInfo      ${local_url}    packageId=${addpackage}[data][packageId]      productType=2         package=中中是国     vipCycle=365    nowPrice=${1}    originalPrice=${1}   isRecommend=${2}
    should be true       $updatePackageInfo["error_msg"]=="更新成功！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]


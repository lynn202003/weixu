*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.vipManage    ${common.token}
Variables  API/cfg.py

*** Test Cases ***
添加套餐---pack0001
    [Tags]    冒烟测试
    [Documentation]     正常添加套餐
    ${addpackage}     addPackage      ${local_url}     productType=1     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

添加套餐---pack00010001
    [Documentation]     添加套餐时productType为数字
    ${addpackage}     addPackage      ${local_url}     productType=5     package=测试版     vipCycle=31    nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}    id=${addpackage}[data][packageId]

添加套餐---pack00010002
    [Documentation]     添加套餐时productType为中文
    ${addpackage}     addPackage      ${local_url}     productType=中文     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

添加套餐---pack00010003
    [Documentation]     添加套餐时productType为英文
    ${addpackage}     addPackage      ${local_url}     productType=jio     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

添加套餐---pack00010004
    [Documentation]     添加套餐时productType为字符
    ${addpackage}     addPackage      ${local_url}     productType=%^&     package=测试版     vipCycle=31    nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

添加套餐---pack00010005
    [Documentation]     添加套餐时productType为空
    ${addpackage}     addPackage      ${local_url}     productType=${EMPTY}     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="套餐类型设置错误！"


添加套餐---pack00010006
    [Documentation]     添加套餐时productType为空格
    ${addpackage}     addPackage      ${local_url}     productType=${SPACE}     package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="套餐类型设置错误！"

添加套餐---pack00010007
    [Documentation]     添加套餐时productType参数不传
    ${addpackage}     addPackage      ${local_url}        package=测试版     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="套餐类型设置错误！"


添加套餐---pack00010008
    [Documentation]     添加套餐时package为空格
    ${addpackage}     addPackage      ${local_url}     productType=1     package=${SPACE}     vipCycle=31      nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="套餐名称设置错误！"


添加套餐---pack00010009
    [Documentation]     添加套餐时package为空
    ${addpackage}     addPackage      ${local_url}     productType=1     package=${EMPTY}     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="套餐名称设置错误！"


添加套餐---pack00010010
    [Documentation]     添加套餐时package参数不传
    ${addpackage}     addPackage      ${local_url}     productType=1       vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="套餐名称设置错误！"


添加套餐---pack00010011
    [Documentation]     添加套餐时package为有效长度内的中文
    ${addpackage}     addPackage      ${local_url}     productType=1     package=中国     vipCycle=31      nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

添加套餐---pack00010012
    [Documentation]     添加套餐时package为有效长度内的字母
    ${addpackage}     addPackage      ${local_url}     productType=1     package=jii     vipCycle=31      nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

添加套餐---pack00010013
    [Documentation]     添加套餐时package为有效长度内的数字
    ${addpackage}     addPackage      ${local_url}     productType=1     package=125    vipCycle=31      nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

添加套餐---pack00010014
    [Documentation]     添加套餐时package为有效长度内的字符
    ${addpackage}     addPackage      ${local_url}     productType=1     package=%^&    vipCycle=31      nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

添加套餐---pack00010015
    [Documentation]     添加套餐时package为1个有效字符
    ${addpackage}     addPackage      ${local_url}     productType=1     package=中    vipCycle=31      nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="套餐名称设置错误！"


添加套餐---pack00010016
    [Documentation]     添加套餐时package为2个有效字符
    ${addpackage}     addPackage      ${local_url}     productType=1     package=中中    vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

添加套餐---pack00010017
    [Documentation]     添加套餐时package为8个有效字符
    ${addpackage}     addPackage      ${local_url}     productType=1     package=中中是国是不国是    vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}    id=${addpackage}[data][packageId]

添加套餐---pack00010018
    [Documentation]     添加套餐时package为9个有效字符
    ${addpackage}     addPackage      ${local_url}     productType=1     package=中中是国是不国是你   vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="套餐名称设置错误！"



添加套餐---pack00010019
    [Documentation]     添加套餐时vipCycle为空格
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=${SPACE}     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="会员周期设置错误！"


添加套餐---pack00010020
    [Documentation]     添加套餐时vipCycle为空
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=${EMPTY}    nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="会员周期设置错误！"


添加套餐---pack00010021
    [Documentation]     添加套餐时vipCycle参数不传
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是          nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="会员周期设置错误！"


添加套餐---pack00010022
    [Documentation]     添加套餐时vipCycle为31
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=31     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}    id=${addpackage}[data][packageId]

添加套餐---pack00010023
    [Documentation]     添加套餐时vipCycle为365
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365     nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}    id=${addpackage}[data][packageId]


添加套餐---pack00010024
    [Documentation]     添加套餐时vipCycle为字母
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=ji   nowPrice=${1}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

添加套餐---pack00010025
    [Documentation]     添加套餐时nowPrice为10001
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365     nowPrice=${10001}      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="套餐的当前售价设置错误！"


添加套餐---pack00010026
    [Documentation]     添加套餐时nowPrice为小于1的小数
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${0.1}    originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="套餐的当前售价设置错误！"


添加套餐---pack00010027
    [Documentation]     添加套餐时nowPrice为大于1的小数
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${1.1}    originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

添加套餐---pack00010028
    [Documentation]     添加套餐时nowPrice为0
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365    nowPrice=${0}     originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="套餐的当前售价设置错误！"


添加套餐---pack00010029
    [Documentation]     添加套餐时nowPrice为负数
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365  nowPrice=${-6}     originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="套餐的当前售价设置错误！"



添加套餐---pack00010030
    [Documentation]     添加套餐时nowPrice为10000
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${10000}    originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

添加套餐---pack00010031
    [Documentation]     添加套餐时nowPrice为1
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${1}    originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

添加套餐---pack00010032
    [Documentation]     添加套餐时nowPrice为有效范围内的两位小数
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${1.23}    originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

添加套餐---pack00010033
    [Documentation]     添加套餐时nowPrice为有大于1小于10000的三位小数
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${1.234}    originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="套餐的当前售价设置错误！"


添加套餐---pack00010034
#为空和空格时报错信息为实体验证错误
    [Documentation]     添加套餐时nowPrice为空
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${EMPTY}    originalPrice=${1}     isRecommend=${1}
    ${errors}    Evaluate   "$.nowPrice" in $addpackage["errors"]
    run keyword if      ${errors}     log to console    pass



添加套餐---pack00010035
    [Documentation]     添加套餐时nowPrice为空格
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${SPACE}   originalPrice=${1}     isRecommend=${1}
    ${errors}    Evaluate   "$.nowPrice" in $addpackage["errors"]
    run keyword if      ${errors}     log to console    pass


添加套餐---pack00010036
    [Documentation]     添加套餐时nowPrice参数不传
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365      originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="套餐的当前售价设置错误！"


添加套餐---pack00010037
    [Documentation]     添加套餐时nowPrice为字母
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=jil   originalPrice=${1}     isRecommend=${1}
    ${errors}    Evaluate   "$.nowPrice" in $addpackage["errors"]
    run keyword if      ${errors}     log to console    pass


添加套餐---pack00010038
    [Documentation]     添加套餐时originalPrice为空
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${1}    originalPrice=${EMPTY}    isRecommend=${1}
    ${errors}    Evaluate   "$.originalPrice" in $addpackage["errors"]
    run keyword if      ${errors}     log to console    pass

添加套餐---pack00010039
    [Documentation]     添加套餐时originalPrice为空格
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${1}    originalPrice=${SPACE}     isRecommend=${1}
    ${errors}     Evaluate  "$.originalPrice" in $addpackage["errors"]
    run keyword if      ${errors}     log to console    pass

添加套餐---pack00010040
    [Documentation]     添加套餐时originalPrice参数不传
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${1}       isRecommend=${1}
    should be true       $addpackage["error_msg"]=="套餐原价设置错误！"

添加套餐---pack00010041
    [Documentation]     添加套餐时originalPrice为1
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${1}    originalPrice=${1}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}    id=${addpackage}[data][packageId]

添加套餐---pack00010042
    [Documentation]     添加套餐时originalPrice为10000
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${1}   originalPrice=${10000}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]

添加套餐---pack00010043
    [Documentation]     添加套餐时originalPrice为10001
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${1}   originalPrice=${10001}    isRecommend=${1}
    should be true       $addpackage["error_msg"]=="套餐原价设置错误！"


添加套餐---pack00010044
    [Documentation]     添加套餐时originalPrice为0
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${1}    originalPrice=${0}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="套餐原价设置错误！"


添加套餐---pack00010045
    [Documentation]     添加套餐时originalPrice为小数
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${1}    originalPrice=${0.2}     isRecommend=${1}
    should be true       $addpackage["error_msg"]=="套餐原价设置错误！"


添加套餐---pack00010046
    [Documentation]     添加套餐时originalPrice为负数
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${1}   originalPrice=${-9}    isRecommend=${1}
    should be true       $addpackage["error_msg"]=="套餐原价设置错误！"


添加套餐---pack00010047
    [Documentation]     添加套餐时originalPrice为中文
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${1}    originalPrice=中    isRecommend=${1}
    ${errors}    Evaluate   "$.originalPrice" in $addpackage["errors"]
    run keyword if      ${errors}     log to console    pass


添加套餐---pack00010048
    [Documentation]     添加套餐时isRecommend为空
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${1}    originalPrice=${1}    isRecommend=${EMPTY}
    ${errors}     Evaluate   "$.isRecommend" in $addpackage["errors"]
    run keyword if      ${errors}     log to console    pass

添加套餐---pack00010049
    [Documentation]     添加套餐时isRecommend为空格
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${1}    originalPrice=${1}    isRecommend=${SPACE}
    ${errors}    Evaluate   "$.isRecommend" in $addpackage["errors"]
    run keyword if      ${errors}     log to console    pass

添加套餐---pack00010050
    [Documentation]     添加套餐时isRecommend参数不传
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${1}   originalPrice=${1}
    should be true       $addpackage["error_msg"]=="推荐参数设置错误！"

添加套餐---pack00010051
    [Documentation]     添加套餐时isRecommend为1
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${1}   originalPrice=${1}      isRecommend=${1}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}    id=${addpackage}[data][packageId]

添加套餐---pack00010052
    [Documentation]     添加套餐时isRecommend为2
    ${addpackage}     addPackage      ${local_url}     productType=1     package=蝇是     vipCycle=365   nowPrice=${1}    originalPrice=${1}     isRecommend=${2}
    should be true       $addpackage["error_msg"]=="新增成功！"
    deletePackageInfo       ${local_url}     id=${addpackage}[data][packageId]
*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.childusermanage    ${common.token}
Library  API.pylib.rolemanage        ${common.token}
Variables  API/cfg.py

*** Test Cases ***
列出子帐号---sysuser0001
    [Tags]    冒烟测试
    [Documentation]     列出子帐号
    ${getrolelists}    GetSysUserList     ${local_url}
    should be true     $getrolelists["data"]["totalSize"]>0

列出子帐号---sysuser0001001
    [Documentation]     列出子帐号name模糊查找,查询包含了中文字的name
    ${getrolelists}    GetSysUserList     ${local_url}   name=测试呀    orderBy=updateTime_desc         pageSize=10        pageNum=1
    should be true     $getrolelists["data"]["totalSize"]>0
    ${datalists}       Evaluate    $getrolelists["data"]["list"]
    :FOR  ${one}   IN   @{datalists}
      \  ${onename}    Evaluate   "中国" in $one["name"]
      \  run keyword if    ${onename}   log to console    pass

列出子帐号---sysuser0001002
    [Documentation]     列出子帐号name模糊查找,查询包含了数字的name
    ${getrolelists}    GetSysUserList     ${local_url}   name=12     orderBy=updateTime_desc         pageSize=10        pageNum=1
    should be true     $getrolelists["data"]["totalSize"]>0
    ${datalists}       Evaluate    $getrolelists["data"]["list"]
    :FOR  ${one}   IN   @{datalists}
      \  ${onename}    Evaluate   "12" in $one["name"]
      \  run keyword if    ${onename}   log to console    pass

列出子帐号---sysuser0001003
    [Documentation]     列出子帐号name模糊查找,查询包含了字母的name
    ${getrolelists}    GetSysUserList     ${local_url}   name=jk     orderBy=updateTime_desc         pageSize=10        pageNum=1
    should be true     $getrolelists["data"]["totalSize"]>0
    ${datalists}       Evaluate    $getrolelists["data"]["list"]
    :FOR  ${one}   IN   @{datalists}
      \  ${onename}    Evaluate   "jk" in $one["name"]
      \  run keyword if    ${onename}   log to console    pass

列出子帐号---sysuser0001004
    [Documentation]     列出子帐号name模糊查找,查询包含了字符的name
    ${getrolelists}    GetSysUserList     ${local_url}   name=#$%@     orderBy=updateTime_desc         pageSize=10        pageNum=1
    should be true     $getrolelists["data"]["totalSize"]>0
    ${datalists}       Evaluate    $getrolelists["data"]["list"]
    :FOR  ${one}   IN   @{datalists}
      \  ${onename}    Evaluate   "#$%@" in $one["name"]
      \  run keyword if    ${onename}   log to console    pass


列出子帐号---sysuser0001005
    [Documentation]     列出子帐号name精准查找,输入完整的name
    ${getrolelists}    GetSysUserList     ${local_url}   name=测试呀12     orderBy=updateTime_desc         pageSize=10        pageNum=1
    should be true     $getrolelists["data"]["totalSize"]>0
    ${datalists}       Evaluate    $getrolelists["data"]["list"]
    :FOR  ${one}   IN   @{datalists}
      \  ${onename}    Evaluate   "测试呀12" in $one["name"]
      \  run keyword if    ${onename}   log to console    pass

列出子帐号---sysuser0001006
    [Documentation]     列出子帐号不传参数name
    ${getrolelists}    GetSysUserList     ${local_url}       orderBy=updateTime_desc         pageSize=10        pageNum=1
    should be true     $getrolelists["data"]["totalSize"]>0


列出子帐号---sysuser0001007
    [Documentation]     列出子帐号参数name为空
    ${getrolelists}    GetSysUserList     ${local_url}     name=${EMPTY}   orderBy=updateTime_desc         pageSize=10        pageNum=1
    should be true     $getrolelists["data"]["totalSize"]>0


列出子帐号---sysuser0001008
    [Documentation]     列出子帐号orderBy参数为updateTime_desc
    ${getrolelists}    GetSysUserList     ${local_url}   name=测试呀12    orderBy=updateTime_desc         pageSize=10        pageNum=1
    should be true     $getrolelists["data"]["totalSize"]>0
    ${datalists}       Evaluate    $getrolelists["data"]["list"]
    :FOR  ${one}   IN   @{datalists}
      \  ${onename}    Evaluate   "测试呀12" in $one["name"]
      \  run keyword if    ${onename}   log to console    pass

列出子帐号---sysuser0001009
    [Documentation]     列出子帐号orderBy参数为updateTime_asc
    ${getrolelists}    GetSysUserList     ${local_url}   name=测试呀12     orderBy=updateTime_asc         pageSize=10        pageNum=1
    should be true     $getrolelists["data"]["totalSize"]>0
    ${datalists}       Evaluate    $getrolelists["data"]["list"]
    :FOR  ${one}   IN   @{datalists}
      \  ${onename}    Evaluate   "测试呀12" in $one["name"]
      \  run keyword if    ${onename}   log to console    pass

列出子帐号---sysuser0001010
    [Documentation]     列出子帐号orderBy参数为空
    ${getrolelists}    GetSysUserList     ${local_url}   name=测试呀12     orderBy=${EMPTY}        pageSize=10        pageNum=1
    should be true     $getrolelists["data"]["totalSize"]>0

列出子帐号---sysuser0001011
    [Documentation]     列出子帐号不传参数orderBy
    ${getrolelists}    GetSysUserList     ${local_url}   name=测试呀12       pageSize=10        pageNum=1
    should be true     $getrolelists["data"]["totalSize"]>0


列出子帐号---sysuser0001012
    [Documentation]     列出子帐号不传参数pageSize
    ${getrolelists}    GetSysUserList     ${local_url}   name=测试呀12              pageNum=1
    should be true     $getrolelists["data"]["totalSize"]>0

列出子帐号---sysuser0001013
    [Documentation]     列出子帐号参数pageSize为空
    ${getrolelists}    GetSysUserList     ${local_url}   name=测试呀12       pageSize=${EMPTY}      pageNum=1
    should be true     $getrolelists["data"]["totalSize"]>0

列出子帐号---sysuser0001014
    [Documentation]     列出子帐号参数pageSize传入不在范围内的页数
    ${getrolelists}    GetSysUserList     ${local_url}   name=测试呀12        pageSize=60     pageNum=1
    should be true     $getrolelists["data"]["totalSize"]>0

列出子帐号---sysuser0001015
    [Documentation]     列出子帐号参数pageNum传入不在范围内的页数
    ${getrolelists}    GetSysUserList     ${local_url}   name=测试呀12        pageSize=10     pageNum=9
    should be true     $getrolelists["data"]["list"]==[]

列出子帐号---sysuser0001016
    [Documentation]     列出子帐号参数pageNum为空
    ${getrolelists}    GetSysUserList     ${local_url}   name=测试呀12        pageSize=10     pageNum=${EMPTY}
    should be true     $getrolelists["data"]["totalSize"]>0

列出子帐号---sysuser0001017
    [Documentation]     列出子帐号不传参数pageNum
    ${getrolelists}    GetSysUserList     ${local_url}   name=测试呀12        pageSize=10
    should be true    $getrolelists["data"]["totalSize"]>0
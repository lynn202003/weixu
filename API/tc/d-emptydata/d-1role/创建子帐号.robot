*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.childusermanage    ${common.token}
Library  API.pylib.rolemanage        ${common.token}
Library  API.pylib.sql     192.168.0.247     wx_db       wx_db       wx_db
Variables  API/cfg.py

*** Test Cases ***
创建子帐号---sysuser0007
    [Tags]    冒烟测试
    [Documentation]     正常创建子帐号
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    [teardown]     Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]

创建子帐号---sysuser0007001
    [Documentation]     创建子帐号时userName为小写英文字母
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}           pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzxjioj   name=5254    password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzxjioj"
    [teardown]   Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]

创建子帐号---sysuser0007002
    [Documentation]     创建子帐号时userName为数字
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=123456  name=5254    password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="123456"
    [teardown]   Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]

创建子帐号---sysuser0007003
    [Documentation]     创建子帐号时userName为大写英文字母
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=HILJOP   name=5254    password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["error_msg"]=="账号为6-12位小写英文字母及数字组成！"


创建子帐号---sysuser0007004
    [Documentation]     创建子帐号时userName为特殊字符
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}         pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=%^&#^&*(    name=5485    password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["error_msg"]=="账号为6-12位小写英文字母及数字组成！"

创建子帐号---sysuser0007005
    [Documentation]     创建子帐号时userName为空
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=${EMPTY}    name=$%^#    password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["error_msg"]=="账号为6-12位小写英文字母及数字组成！"

创建子帐号---sysuser0007006
    [Documentation]     创建子帐号时userName为空格
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=${SPACE}    name=$%^#    password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["error_msg"]=="账号为6-12位小写英文字母及数字组成！"

创建子帐号---sysuser0007007
    [Documentation]     创建子帐号时userName为中文
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}       pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=我是子帐号名称   name=5254    password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["error_msg"]=="账号为6-12位小写英文字母及数字组成！"

创建子帐号---sysuser0007008
    [Documentation]     创建子帐号时不传userName参数
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}     pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   name=5254    password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["error_msg"]=="账号为6-12位小写英文字母及数字组成！"

创建子帐号---sysuser0007009
    [Documentation]     创建子帐号时userName输入5位有效字符
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}     pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}    userName=12525   name=5254    password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["error_msg"]=="账号为6-12位小写英文字母及数字组成！"

创建子帐号---sysuser0007010
    [Documentation]     创建子帐号时userName输入6位有效字符
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}     pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}    userName=125256  name=5254    password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="125256"
    [teardown]   Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]

创建子帐号---sysuser0007011
    [Documentation]     创建子帐号时userName输入13位有效字符
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}     pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}    userName=jilijilijilij  name=5254    password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["error_msg"]=="账号为6-12位小写英文字母及数字组成！"

创建子帐号---sysuser0007012
    [Documentation]     创建子帐号时userName输入12位有效字符
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}     pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}    userName=jilijilijili  name=5254    password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="jilijilijili"
    [teardown]   Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]


创建子帐号---sysuser0007014
    [Documentation]     创建子帐号时name为空
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=123652    name=${EMPTY}    password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["error_msg"]=="用户名为2-10位字符组成！"

创建子帐号---sysuser0007015
    [Documentation]     创建子帐号时name为空格
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=${SPACE}    password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["error_msg"]=="用户名为2-10位字符组成！"

创建子帐号---sysuser0007016
    [Documentation]     创建子帐号时name参数不传
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["error_msg"]=="用户名为2-10位字符组成！"

创建子帐号---sysuser0007017
    [Documentation]     创建子帐号时name输入1位有效字符
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=你    password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["error_msg"]=="用户名为2-10位字符组成！"

创建子帐号---sysuser0007018
    [Documentation]     创建子帐号时name输入2位有效字符
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=你好   password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="251252"
    [teardown]   Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]

创建子帐号---sysuser0007019
    [Documentation]     创建子帐号时name输入10位有效字符
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=1258kokokl   password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="251252"
    [teardown]   Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]

创建子帐号---sysuser0007020
    [Documentation]     创建子帐号时name输入11位有效字符
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=1258kokokl2   password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["error_msg"]=="用户名为2-10位字符组成！"


创建子帐号---sysuser0007021
    [Documentation]     创建子帐号时name输入有效范围内的中文
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=中国人中是中  password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true       $adduser["data"]["userName"]=="251252"
    [teardown]   Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]


创建子帐号---sysuser0007022
    [Documentation]     创建子帐号时name输入有效范围内的数字
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=1258454   password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true       $adduser["data"]["userName"]=="251252"
    [teardown]    Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]

创建子帐号---sysuser0007023
    [Documentation]     创建子帐号时name输入有效范围内的字符
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=$%^&*&^%   password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true       $adduser["data"]["userName"]=="251252"
    [teardown]   Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]

创建子帐号---sysuser0007024
    [Documentation]     创建子帐号时name输入有效范围内的大写字母
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=HUJIJKI   password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true       $adduser["data"]["userName"]=="251252"
    [teardown]   Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]


创建子帐号---sysuser0007025
    [Documentation]     创建子帐号时password为空
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=123652    name=1254525    password=${EMPTY}    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"

创建子帐号---sysuser0007026
    [Documentation]     创建子帐号时password为空格
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=123652    password=${SPACE}     roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"

创建子帐号---sysuser0007027
    [Documentation]     创建子帐号时password参数不传
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=123652   roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"

创建子帐号---sysuser0007028
    [Documentation]     创建子帐号时password输入5位有效字符
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=123652    password=125ko    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"

创建子帐号---sysuser0007029
    [Documentation]     创建子帐号时password输入21位有效字符
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=123652    password=451254hyhyhyhgtt25695   roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"

创建子帐号---sysuser0007030
    [Documentation]     创建子帐号时password输入6位有效字符
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=123652    password=jiji25   roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="251252"
    [teardown]   Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]

创建子帐号---sysuser0007031
    [Documentation]     创建子帐号时password输入20位有效字符
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=123652    password=451254hyhyhyhgtt2569   roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="251252"
    [teardown]   Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]


创建子帐号---sysuser0007032
    [Documentation]    创建子帐号时password输入有效范围内的数字
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=123652    password=4251252   roleId= ${getrolelists}[data][list][0][roleId]
    should be true      $adduser["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"

创建子帐号---sysuser0007033
    [Documentation]    创建子帐号时password输入有效范围内的字母
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=123652    password=kijklij   roleId= ${getrolelists}[data][list][0][roleId]
    should be true      $adduser["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"

创建子帐号---sysuser0007034
    [Documentation]    创建子帐号时password输入有效范围内的符号
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=123652    password=$%^&*%$   roleId= ${getrolelists}[data][list][0][roleId]
    should be true      $adduser["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"

创建子帐号---sysuser0007035
    [Documentation]    创建子帐号时password输入有效范围内的中文
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=123652    password=中国是中国是中   roleId= ${getrolelists}[data][list][0][roleId]
    should be true      $adduser["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"


创建子帐号---sysuser0007036
    [Documentation]    创建子帐号时password输入有效范围内的数字+中文
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=123652    password=1232中国是中要是中国   roleId= ${getrolelists}[data][list][0][roleId]
    should be true      $adduser["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"


创建子帐号---sysuser0007037
    [Documentation]    创建子帐号时password输入有效范围内的小写字母+大写字母
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=123652    password=kokoKOUHJJ   roleId= ${getrolelists}[data][list][0][roleId]
    should be true      $adduser["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"

创建子帐号---sysuser0007038
    [Documentation]    创建子帐号时password输入有效范围内的小写字母+数字+字符
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=123652    password=kok123#@$   roleId= ${getrolelists}[data][list][0][roleId]
    should be true      $adduser["data"]["userName"]=="251252"
    [teardown]   Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]


创建子帐号---sysuser0007039
    [Documentation]     创建子帐号时roleId为空
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=123652    name=1254525    password=123yui    roleId=${EMPTY}
    should be true     $adduser["error_msg"]=="角色ID不能为空！"

创建子帐号---sysuser0007040
    [Documentation]     创建子帐号时roleId为空格
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=123652    password=123iuy     roleId=${SPACE}
    should be true     $adduser["error_msg"]=="角色ID不能为空！"

创建子帐号---sysuser0007041
    [Documentation]     创建子帐号时roleId参数不传
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=123652     password=123ytt
    should be true     $adduser["error_msg"]=="角色ID不能为空！"

创建子帐号---sysuser0007042
    [Documentation]     创建子帐号时roleId输入中文
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=123652       password=123opy     roleId=中国人
    should be true     $adduser["error_msg"]=="角色ID错误！"

创建子帐号---sysuser0007043
    [Documentation]     创建子帐号时roleId输入英文
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=123652       password=1236lo      roleId=kokokoJII
    should be true     $adduser["error_msg"]=="角色ID错误！"

创建子帐号---sysuser0007044
    [Documentation]     创建子帐号时roleId输入特殊字符
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=123652       password=1236#@      roleId=#$%^&#
    should be true     $adduser["error_msg"]=="角色ID错误！"

创建子帐号---sysuser0007045
    [Documentation]     创建子帐号时roleId输入不存在的id号
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=251252    name=123652       password=1236##      roleId=45958452855deeeeeeee
    should be true     $adduser["error_msg"]=="角色ID错误！"
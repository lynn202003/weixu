*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.rolemanage    ${common.token}
Variables  API/cfg.py
Library  API.pylib.childusermanage    ${common.token}

#Suite Setup  Delete_ALLSysRole   ${local_url}
*** Test Cases ***
查看子帐号---role0008
    [Tags]    冒烟测试
    [Documentation]     有子帐号的情况下查看子帐号
    ${getrolelist}    GetRoleList    ${local_url}
    ${getroleuserlist}     GetRoleUserList     ${local_url}    roleId=${getrolelist}[data][list][0][roleId]
    ${getuserlist}     GetSysUserList      ${local_url}     orderBy=updateTime_desc      pageSize=10     pageNum=1
    should be true     $getroleuserlist["data"]["list"][0]["userId"]==$getuserlist["data"]["list"][0]["userId"]

创建子帐号---sysuser0007013
    [Documentation]     创建子帐号时userName输入重复的帐号
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}     pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}    userName=test05    name=5254    password=123koll    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["error_msg"]=="账号名已占用！"
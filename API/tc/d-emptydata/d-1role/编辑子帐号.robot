*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.childusermanage    ${common.token}
Library  API.pylib.rolemanage        ${common.token}
Variables  API/cfg.py
Library  API.pylib.sql      192.168.0.247     wx_db       wx_db       wx_db

*** Test Cases ***
编辑子帐号---sysuser0008
    [Tags]    冒烟测试
    [Documentation]     正常编辑子帐号
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=1236lok    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updatauser}    UpdateSysUser       ${local_url}     userId=${adduser}[data][userId]       name=15221        roleId=${getrolelists}[data][list][0][roleId]
    should be true     $updatauser["data"]["name"]=="15221"
    [teardown]    Run Keywords   db_connect    AND   deletedata        sys_user         ${updatauser}[data][userId]

编辑子帐号---sysuser0008001
    [Documentation]     编辑子帐号时userId为空
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=1236lok    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updatauser}    UpdateSysUser       ${local_url}     userId=${EMPTY}       name=15221        roleId=${getrolelists}[data][list][0][roleId]
    should be true     $updatauser["error_msg"]=="参数错误！"
    [teardown]    Run Keywords   db_connect    AND  deletedata        sys_user         ${adduser}[data][userId]

编辑子帐号---sysuser0008002
    [Documentation]     编辑子帐号时userId为空格
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=1236lok    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updatauser}    UpdateSysUser       ${local_url}     userId=${EMPTY}       name=15221        roleId=${getrolelists}[data][list][0][roleId]
    should be true     $updatauser["error_msg"]=="参数错误！"
    [teardown]    Run Keywords   db_connect    AND  deletedata        sys_user         ${adduser}[data][userId]

编辑子帐号---sysuser0008003
    [Documentation]     编辑子帐号时userId参数不传
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=1236lok    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updatauser}    UpdateSysUser       ${local_url}   name=15221        roleId=${getrolelists}[data][list][0][roleId]
    should be true     $updatauser["error_msg"]=="参数错误！"
    [teardown]    Run Keywords   db_connect    AND  deletedata        sys_user         ${adduser}[data][userId]

编辑子帐号---sysuser0008004
    [Documentation]     编辑子帐号时userId为中文
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=1236lok    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updatauser}    UpdateSysUser       ${local_url}   userId=我是子帐号呀     name=15221        roleId=${getrolelists}[data][list][0][roleId]
    should be true     $updatauser["error_msg"]=="参数错误！"
    [teardown]    Run Keywords   db_connect    AND  deletedata        sys_user         ${adduser}[data][userId]

编辑子帐号---sysuser0008005
    [Documentation]     编辑子帐号时userId为不存在的id
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=1236lok    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updatauser}    UpdateSysUser       ${local_url}   userId=125258525koklkokok     name=15221        roleId=${getrolelists}[data][list][0][roleId]
    should be true     $updatauser["error_msg"]=="参数错误！"
    [teardown]    Run Keywords   db_connect    AND  deletedata        sys_user    ${adduser}[data][userId]


编辑子帐号---sysuser0008006
    [Documentation]     编辑子帐号时name为一个有效字
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=1236lok    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updatauser}    UpdateSysUser       ${local_url}     userId=${adduser}[data][userId]       name=1       roleId=${getrolelists}[data][list][0][roleId]
    should be true     $updatauser["error_msg"]=="用户名为2-10位字符组成！"
    [teardown]    Run Keywords   db_connect    AND  deletedata        sys_user         ${adduser}[data][userId]

编辑子帐号---sysuser0008007
    [Documentation]     编辑子帐号时name为10个有效字
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=1236lok    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updatauser}    UpdateSysUser       ${local_url}     userId=${adduser}[data][userId]       name=1236542525      roleId=${getrolelists}[data][list][0][roleId]
    should be true     $updatauser["data"]["name"]=="1236542525"
    [teardown]    Run Keywords   db_connect    AND  deletedata        sys_user         ${updatauser}[data][userId]

编辑子帐号---sysuser0008008
    [Documentation]     编辑子帐号时name为11个有效字
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=1236lok    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updatauser}    UpdateSysUser       ${local_url}     userId=${adduser}[data][userId]       name=12362545254       roleId=${getrolelists}[data][list][0][roleId]
    should be true     $updatauser["error_msg"]=="用户名为2-10位字符组成！"
    [teardown]    Run Keywords   db_connect    AND  deletedata        sys_user         ${adduser}[data][userId]

编辑子帐号---sysuser0008009
    [Documentation]     编辑子帐号时name为空
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=1236lok    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updatauser}    UpdateSysUser       ${local_url}     userId=${adduser}[data][userId]       name=${EMPTY}       roleId=${getrolelists}[data][list][0][roleId]
    should be true     $updatauser["error_msg"]=="用户名为2-10位字符组成！"
    [teardown]    Run Keywords   db_connect    AND  deletedata        sys_user         ${adduser}[data][userId]

编辑子帐号---sysuser0008010
    [Documentation]     编辑子帐号时name为空格
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=1236lok    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updatauser}    UpdateSysUser       ${local_url}     userId=${adduser}[data][userId]       name=${SPACE}       roleId=${getrolelists}[data][list][0][roleId]
    should be true     $updatauser["error_msg"]=="用户名为2-10位字符组成！"
    [teardown]    Run Keywords   db_connect    AND  deletedata        sys_user         ${adduser}[data][userId]

编辑子帐号---sysuser0008011
    [Documentation]     编辑子帐号时name参数不传
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=1236lok    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updatauser}    UpdateSysUser       ${local_url}     userId=${adduser}[data][userId]      roleId=${getrolelists}[data][list][0][roleId]
    should be true    $updatauser["error_msg"]=="用户名为2-10位字符组成！"
    [teardown]    Run Keywords   db_connect    AND  deletedata        sys_user         ${adduser}[data][userId]


编辑子帐号---sysuser0008012
    [Documentation]     编辑子帐号时roleId为空
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=1236lok    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updatauser}    UpdateSysUser       ${local_url}     userId=${adduser}[data][userId]       name=125251      roleId=${EMPTY}
    should be true     $updatauser["error_msg"]=="角色ID不能为空！"
    [teardown]    Run Keywords   db_connect    AND  deletedata        sys_user         ${adduser}[data][userId]

编辑子帐号---sysuser0008013
    [Documentation]     编辑子帐号时roleId为空格
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=1236lok    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updatauser}    UpdateSysUser       ${local_url}     userId=${adduser}[data][userId]       name=1254252      roleId=${SPACE}
    should be true     $updatauser["error_msg"]=="角色ID不能为空！"
    [teardown]    Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]

编辑子帐号---sysuser0008014
    [Documentation]     编辑子帐号时roleId参数不传
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=1236lok    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updatauser}    UpdateSysUser       ${local_url}     userId=${adduser}[data][userId]       name=1254252
    should be true     $updatauser["error_msg"]=="角色ID不能为空！"
    [teardown]    Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]

编辑子帐号---sysuser0008015
    [Documentation]     编辑子帐号时roleId为不存在的角色id
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=1236lok    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updatauser}    UpdateSysUser       ${local_url}     userId=${adduser}[data][userId]       name=1254252      roleId=12585254gttgtgg
    should be true     $updatauser["error_msg"]=="角色ID错误！"
    [teardown]    Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]
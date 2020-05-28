*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.childusermanage    ${common.token}
Library  API.pylib.rolemanage        ${common.token}
Variables  API/cfg.py
Library  API.pylib.sql      192.168.0.247     wx_db       wx_db       wx_db

*** Test Cases ***
解冻子帐号---sysuser0009
    [Tags]    冒烟测试
    [Documentation]     解冻子帐号
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=1236fr   roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updateuserstatus}   UpdateSysUserStatus       ${local_url}     userId=${adduser}[data][userId]       status=2
    should be true     $updateuserstatus["error_msg"]=="冻结用户成功！"
    [teardown]   Run Keywords   db_connect    AND   deletedata        sys_user         ${updateuserstatus}[data][userId]


解冻子帐号---sysuser0009001
    [Documentation]     解冻子帐号userId为空
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=12362re    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updateuserstatus}   UpdateSysUserStatus       ${local_url}     userId=${EMPTY}      status=2
    should be true     $updateuserstatus["error_msg"]=="参数错误！"
    [teardown]   Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]

解冻子帐号---sysuser0009002
    [Documentation]     解冻子帐号userId为空格
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=12362rt    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updateuserstatus}   UpdateSysUserStatus       ${local_url}     userId=${SPACE}      status=2
    should be true     $updateuserstatus["error_msg"]=="参数错误！"
    [teardown]   Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]

解冻子帐号---sysuser0009003
    [Documentation]     解冻子帐号时参数userId不传
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=123626tr   roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updateuserstatus}   UpdateSysUserStatus       ${local_url}     status=2
    should be true     $updateuserstatus["error_msg"]=="参数错误！"
    [teardown]   Run Keywords   db_connect    AND    deletedata        sys_user         ${adduser}[data][userId]

解冻子帐号---sysuser0009004
    [Documentation]     解冻子帐号时userId传入不存在的id
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=12362rt    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updateuserstatus}   UpdateSysUserStatus       ${local_url}    userId=2585251jikikfr     status=2
    should be true     $updateuserstatus["error_msg"]=="参数错误！"
    [teardown]   Run Keywords   db_connect    AND    deletedata        sys_user         ${adduser}[data][userId]

解冻子帐号---sysuser0009005
    [Documentation]     解冻子帐号status为空
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=12362rt    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updateuserstatus}   UpdateSysUserStatus       ${local_url}     userId=${adduser}[data][userId]     status=${EMPTY}
    should be true     $updateuserstatus["error_msg"]=="参数错误！"
    [teardown]   Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]

解冻子帐号---sysuser0009006
    [Documentation]     解冻子帐号status为空格
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=12362er    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updateuserstatus}   UpdateSysUserStatus       ${local_url}     userId=${adduser}[data][userId]      status=${SPACE}
    should be true     $updateuserstatus["error_msg"]=="参数错误！"
    [teardown]   Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]

解冻子帐号---sysuser0009007
    [Documentation]     解冻子帐号时参数status不传
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=12362er    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updateuserstatus}   UpdateSysUserStatus       ${local_url}     userId=${adduser}[data][userId]
    should be true     $updateuserstatus["error_msg"]=="参数错误！"
    [teardown]   Run Keywords   db_connect    AND    deletedata        sys_user         ${adduser}[data][userId]

解冻子帐号---sysuser0009008
    [Documentation]     解冻子帐号时参数status传入除1,2以外的数字
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=12362er    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updateuserstatus}   UpdateSysUserStatus       ${local_url}     status=2    userId=${adduser}[data][userId]    status=3
    should be true     $updateuserstatus["error_msg"]=="参数错误！"
    [teardown]   Run Keywords   db_connect    AND    deletedata        sys_user         ${adduser}[data][userId]

解冻子帐号---sysuser0009009
    [Documentation]     解冻子帐号时参数status传入中文
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=123626re    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updateuserstatus}   UpdateSysUserStatus       ${local_url}     status=2    userId=${adduser}[data][userId]    status=是中是中蝇蝇
    should be true     $updateuserstatus["error_msg"]=="参数错误！"
    [teardown]   Run Keywords   db_connect    AND   deletedata        sys_user         ${adduser}[data][userId]

解冻子帐号---sysuser0009010
    [Documentation]     解冻子帐号时参数status传入英文
    ${getrolelists}    GetRoleList     ${local_url}    roleName=${EMPTY}      orderBy=createTime_asc        pageSize=10            pageNum=1
    ${adduser}    AddSysUser     ${local_url}   userName=xzx88888   name=5254    password=1236263e    roleId= ${getrolelists}[data][list][0][roleId]
    should be true     $adduser["data"]["userName"]=="xzx88888"
    ${updateuserstatus}   UpdateSysUserStatus       ${local_url}     status=2    userId=${adduser}[data][userId]    status=kokokoko
    should be true     $updateuserstatus["error_msg"]=="参数错误！"
    [teardown]   Run Keywords   db_connect    AND    deletedata        sys_user         ${adduser}[data][userId]
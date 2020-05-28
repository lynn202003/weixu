*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.rolemanage     ${common.token}
Variables  API/cfg.py
#Suite Setup  Delete_ALLSysRole   ${local_url}
*** Test Cases ***
删除角色---role0024
    [Tags]    冒烟测试
    [Documentation]     正常删除角色
    ${addrole}     AddSysRole     ${local_url}      roleName=453      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="453"
    ${deleterole}    DeleteSysRole   ${local_url}  roleId=${addrole}[data][roleId]
    should be true     $deleterole["error_msg"]=="删除成功！"

删除角色---role0024001
    [Documentation]     roleId为中文时
    ${addrole}     AddSysRole     ${local_url}      roleName=453      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="453"
    ${deleterole}    DeleteSysRole   ${local_url}  roleId=我是中文
    should be true     $deleterole["error_msg"]=='角色ID参数错误！'
    [Teardown]      DeleteSysRole   ${local_url}   roleId=${addrole}[data][roleId]

删除角色---role0024002
    [Documentation]     roleId为英文时
    ${addrole}     AddSysRole     ${local_url}      roleName=453      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="453"
    ${deleterole}    DeleteSysRole   ${local_url}  roleId=jifkdk
    should be true     $deleterole["error_msg"]== '角色ID参数错误！'
    [Teardown]      DeleteSysRole   ${local_url}  roleId=${addrole}[data][roleId]

删除角色---role0024003
    [Documentation]     roleId为空时
    ${addrole}     AddSysRole     ${local_url}      roleName=453      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="453"
    ${deleterole}    DeleteSysRole   ${local_url}  roleId=${EMPTY}
    should be true     $deleterole["error_msg"]=='角色ID参数不能为空！'
    [Teardown]      DeleteSysRole   ${local_url}  roleId=${addrole}[data][roleId]

删除角色---role0024004
    [Documentation]     roleId为空格时
    ${addrole}     AddSysRole     ${local_url}      roleName=453      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="453"
    ${deleterole}    DeleteSysRole   ${local_url}  roleId=${SPACE}
    should be true     $deleterole["error_msg"]=='角色ID参数不能为空！'
    [Teardown]      DeleteSysRole   ${local_url}  roleId=${addrole}[data][roleId]

删除角色---role0024005
    [Documentation]     roleId参数不传时    #现在是参数不传时也能删除，提示该角色下含有子账号，您无法删除
    ${addrole}     AddSysRole     ${local_url}      roleName=453      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="453"
    ${deleterole}    DeleteSysRole   ${local_url}
    should be true     $deleterole["error_msg"]=='角色ID参数不能为空！'
    [Teardown]      DeleteSysRole   ${local_url}  roleId=${addrole}[data][roleId]

删除角色---role0024006
    [Documentation]     传入不存在的roleId
    ${addrole}     AddSysRole     ${local_url}      roleName=453      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="453"
    ${deleterole}    DeleteSysRole   ${local_url}    roleId=gggggg25232252
    should be true     $deleterole["error_msg"]=='角色ID参数错误！'
    [Teardown]      DeleteSysRole   ${local_url}  roleId=${addrole}[data][roleId]
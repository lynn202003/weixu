*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.rolemanage     ${common.token}
Variables  API/cfg.py
#Suite Setup  Delete_ALLSysRole   ${local_url}
*** Test Cases ***
编辑角色---role0002
    [Tags]    冒烟测试
    [Documentation]     正常编辑角色
    ${addrole}     AddSysRole     ${local_url}      roleName=45120uu      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="45120uu"
    ${updatarole}    UpdateSysRole   ${local_url}   roleId=${addrole}[data][roleId]    roleName=test4531   remark=rtr       roleRights=4,6
    should be true     $updatarole["data"]["roleName"]=='test4531'
    [teardown]   DeleteSysRole    ${local_url}   roleId=${updatarole}[data][roleId]

编辑角色---role0002001
    [Documentation]     编辑角色时角色名称输入中文
    ${addrole}     AddSysRole     ${local_url}      roleName=45120uu      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="45120uu"
    ${updatarole}    UpdateSysRole   ${local_url}   roleId=${addrole}[data][roleId]    roleName=你好   remark=rtr       roleRights=4,6
    should be true     $updatarole["data"]["roleName"]=="你好"
    [teardown]   DeleteSysRole    ${local_url}   roleId=${updatarole}[data][roleId]

编辑角色---role0002002
    [Documentation]     编辑角色时角色名称输入英文
    ${addrole}     AddSysRole     ${local_url}      roleName=45120uu      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="45120uu"
    ${updatarole}    UpdateSysRole   ${local_url}   roleId=${addrole}[data][roleId]    roleName=jiluur   remark=rtr       roleRights=4,6
    should be true     $updatarole["data"]["roleName"]=="jiluur"
    [teardown]   DeleteSysRole    ${local_url}   roleId=${updatarole}[data][roleId]

编辑角色---role0002003
    [Documentation]     编辑角色时角色名称输入特殊字符
    ${addrole}     AddSysRole     ${local_url}      roleName=45120uu      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="45120uu"
    ${updatarole}    UpdateSysRole   ${local_url}   roleId=${addrole}[data][roleId]    roleName=$%^&    remark=rtr       roleRights=4,6
    should be true     $updatarole["data"]["roleName"]=="$%^&"
    [teardown]   DeleteSysRole    ${local_url}   roleId=${updatarole}[data][roleId]


编辑角色---role0002004
    [Documentation]     编辑角色时角色名称为空
    ${addrole}     AddSysRole     ${local_url}      roleName=45120uu      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="45120uu"
    ${updatarole}    UpdateSysRole   ${local_url}   roleId=${addrole}[data][roleId]    roleName=${EMPTY}    remark=rtr       roleRights=4,6
    should be true     $updatarole["error_msg"]=="角色名不能为空！"
    [teardown]   DeleteSysRole    ${local_url}   roleId=${addrole}[data][roleId]

编辑角色---role0002005
    [Documentation]     编辑角色时角色名称为空格
    ${addrole}     AddSysRole     ${local_url}      roleName=45120uu      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="45120uu"
    ${updatarole}    UpdateSysRole   ${local_url}   roleId=${addrole}[data][roleId]    roleName=${SPACE}    remark=rtr       roleRights=4,6
    should be true     $updatarole["error_msg"]=="角色名不能为空！"
    [teardown]   DeleteSysRole    ${local_url}   roleId=${addrole}[data][roleId]

编辑角色---role0002006
#编辑角色的前置条件是还要有一个角色
    [Documentation]     编辑角色时角色名称重复
    ${addrole}     AddSysRole     ${local_url}      roleName=45120uy      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="45120uy"
    ${updatarole}    UpdateSysRole   ${local_url}   roleId=${addrole}[data][roleId]    roleName=45120uy    remark=rtr       roleRights=4,6
    should be true     ${updatarole}["error_msg"]=='角色名“45120uy”已占用！'
    [teardown]   DeleteSysRole    ${local_url}   roleId=${addrole}[data][roleId]

编辑角色---role0002007
    [Documentation]     编辑角色时缺少roleName参数
    ${addrole}     AddSysRole     ${local_url}      roleName=45120uy      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="45120uy"
    ${updatarole}    UpdateSysRole   ${local_url}   roleId=${addrole}[data][roleId]       remark=rtr       roleRights=4,6
    should be true     $updatarole["error_msg"]=="角色名不能为空！"
    [teardown]   DeleteSysRole    ${local_url}   roleId=${addrole}[data][roleId]

编辑角色---role0002008
    [Documentation]     编辑角色时角色名称输入一个有效字
    ${addrole}     AddSysRole     ${local_url}      roleName=45120uy      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="45120uy"
    ${updatarole}    UpdateSysRole   ${local_url}   roleId=${addrole}[data][roleId]    roleName=你     remark=rtr       roleRights=4,6
    should be true     $updatarole["data"]["roleName"]=="你"
    [teardown]   DeleteSysRole   ${local_url}    roleId=${updatarole}[data][roleId]

编辑角色---role0002009
    [Documentation]     编辑角色时角色名称输入8个有效字
    ${addrole}     AddSysRole     ${local_url}      roleName=45120uy      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="45120uy"
    ${updatarole}    UpdateSysRole   ${local_url}   roleId=${addrole}[data][roleId]    roleName=我是角色名称有没     remark=rtr       roleRights=4,6
    should be true     $updatarole["data"]["roleName"]=="我是角色名称有没"
    [teardown]   DeleteSysRole   ${local_url}    roleId=${updatarole}[data][roleId]


编辑角色---role0002010
    [Documentation]     编辑角色时角色名称输入9个有效字
    ${addrole}     AddSysRole     ${local_url}      roleName=45120uy      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="45120uy"
    ${updatarole}    UpdateSysRole   ${local_url}   roleId=${addrole}[data][roleId]    roleName=我是角色名称有没有     remark=rtr       roleRights=4,6
    should be true      $updatarole["error_msg"]=="角色名最多不能超过8个字符！"
    [teardown]   DeleteSysRole    ${local_url}   roleId=${addrole}[data][roleId]


编辑角色---role0002011
    [Documentation]     编辑角色时roleId为空
    ${addrole}     AddSysRole     ${local_url}      roleName=45120uy      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="45120uy"
    ${updatarole}    UpdateSysRole   ${local_url}   roleId=${EMPTY}    roleName=45120uy      remark=rtr       roleRights=4,6
    should be true     $updatarole["error_msg"]=="无此记录！"
    [teardown]   DeleteSysRole    ${local_url}   roleId=${addrole}[data][roleId]


编辑角色---role0002012
    [Documentation]     编辑角色时roleId为空格
    ${addrole}     AddSysRole     ${local_url}      roleName=45120uy      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="45120uy"
    ${updatarole}    UpdateSysRole   ${local_url}   roleId=${SPACE}    roleName=45120uy      remark=rtr       roleRights=4,6
    should be true     $updatarole["error_msg"]=="无此记录！"
    [teardown]   DeleteSysRole    ${local_url}   roleId=${addrole}[data][roleId]

编辑角色---role0002013
    [Documentation]     编辑角色时roleId为中文
    ${addrole}     AddSysRole     ${local_url}      roleName=45120uy      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="45120uy"
    ${updatarole}    UpdateSysRole   ${local_url}   roleId=中国人    roleName=45120uy      remark=rtr       roleRights=4,6
    should be true     $updatarole["error_msg"]=="无此记录！"
    [teardown]   DeleteSysRole    ${local_url}   roleId=${addrole}[data][roleId]

编辑角色---role0002014
    [Documentation]     编辑角色时roleId为特殊字符
    ${addrole}     AddSysRole     ${local_url}      roleName=45120uy      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="45120uy"
    ${updatarole}    UpdateSysRole   ${local_url}   roleId=^&*(    roleName=45120uy      remark=rtr       roleRights=4,6
    should be true     $updatarole["error_msg"]=="无此记录！"
    [teardown]   DeleteSysRole    ${local_url}   roleId=${addrole}[data][roleId]

编辑角色---role0002015
    [Documentation]     编辑角色时roleId为不存在的id
    ${addrole}     AddSysRole     ${local_url}      roleName=45120uy      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="45120uy"
    ${updatarole}    UpdateSysRole   ${local_url}   roleId=ffffffff552525   roleName=45120uy      remark=rtr       roleRights=4,6
    should be true     $updatarole["error_msg"]=="无此记录！"
    [teardown]   DeleteSysRole    ${local_url}   roleId=${addrole}[data][roleId]

编辑角色---role0002016
    [Documentation]     编辑角色时roleId参数不传
    ${addrole}     AddSysRole     ${local_url}      roleName=45120uy      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="45120uy"
    ${updatarole}    UpdateSysRole   ${local_url}     roleName=45120uy      remark=rtr       roleRights=4,6
    should be true     $updatarole["error_msg"]=="无此记录！"
    [teardown]   DeleteSysRole    ${local_url}   roleId=${addrole}[data][roleId]


编辑角色---role0002017
    [Documentation]     编辑角色时remark为空
    ${addrole}     AddSysRole     ${local_url}      roleName=45120uy      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="45120uy"
    ${updatarole}    UpdateSysRole   ${local_url}   roleId=${addrole}[data][roleId]    roleName=45120uy      remark=${EMPTY}       roleRights=4,6
    should be true     $updatarole["data"]["roleName"]=="45120uy"
    [teardown]   DeleteSysRole    ${local_url}   roleId=${updatarole}[data][roleId]

编辑角色---role0002018
#现在是角色说明为空格也可以创建成功
    [Documentation]     编辑角色时remark为空格
    ${addrole}     AddSysRole     ${local_url}      roleName=45120uy      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="45120uy"
    ${updatarole}    UpdateSysRole   ${local_url}   roleId=${addrole}[data][roleId]    roleName=45120uy      remark=${SPACE}       roleRights=4,6
    should be true     $updatarole["error_msg"]=="角色说明不能为空！"
    [teardown]   DeleteSysRole    ${local_url}   roleId=${addrole}[data][roleId]


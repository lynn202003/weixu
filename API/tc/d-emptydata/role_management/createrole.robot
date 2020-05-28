*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.rolemanage    ${common.token}
Variables  API/cfg.py

#Suite Setup  Delete_ALLSysRole   ${local_url}
*** Test Cases ***
创建角色---role0001
    [Tags]    冒烟测试
    [Documentation]     正常创建角色
    ${addrole}    AddSysRole     ${local_url}      roleName=xzx88888    remark=rtr       roleRights=4,12,14
    should be true     $addrole["data"]["roleName"]=="xzx88888"
    [teardown]   DeleteSysRole   ${local_url}    roleId=${addrole}[data][roleId]

创建角色---role0001001
    [Documentation]     角色名称输入中文
    ${addrole}    AddSysRole     ${local_url}      roleName=你好      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="你好"
    [teardown]   DeleteSysRole   ${local_url}    roleId=${addrole}[data][roleId]


创建角色---role0001002
    [Documentation]     角色名称输入英文
    ${addrole}    AddSysRole     ${local_url}      roleName=jilij      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="jilij"
    [teardown]   DeleteSysRole   ${local_url}    roleId=${addrole}[data][roleId]


创建角色---role0001003
    [Documentation]     角色名称输入特殊字符
    ${addrole}    AddSysRole     ${local_url}      roleName=$%^&      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="$%^&"
    [teardown]   DeleteSysRole   ${local_url}    roleId=${addrole}[data][roleId]

创建角色---role0001004
    [Documentation]     角色名称为空
    ${addrole}    AddSysRole     ${local_url}      roleName=${EMPTY}     remark=rtr       roleRights=4,6
    should be true     $addrole["error_msg"]=='角色名不能为空！'

创建角色---role0001005
    [Documentation]     角色名称为空格
    ${addrole}    AddSysRole     ${local_url}     roleName=${SPACE}     remark=rtr       roleRights=4,6
    should be true     $addrole["error_msg"]=="角色名不能为空！"

创建角色---role0001006
    [Documentation]     角色名称重复
    ${addrole}    AddSysRole     ${local_url}   roleName=oooo      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="oooo"
    ${aginaddrole}    AddSysRole     ${local_url}   roleName=oooo   remark=rtr       roleRights=4,6
    should be true     $aginaddrole["error_msg"]=="角色名“oooo”已占用！"
    [teardown]    DeleteSysRole   ${local_url}    roleId=${addrole}[data][roleId]

创建角色---role0001007
    [Documentation]     缺少roleName参数
    ${addrole}    AddSysRole     ${local_url}        remark=rtr       roleRights=4,6
    should be true     $addrole["error_msg"]=="角色名不能为空！"

创建角色---role0001008
    [Documentation]     角色名称输入一个有效字
    ${addrole}    AddSysRole     ${local_url}      roleName=你      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="你"
    [teardown]   DeleteSysRole   ${local_url}    roleId=${addrole}[data][roleId]

创建角色---role0001009
    [Documentation]     角色名称输入8个有效字
    ${addrole}    AddSysRole     ${local_url}      roleName=我是角色名称有没      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["roleName"]=="我是角色名称有没"
    [teardown]   DeleteSysRole   ${local_url}    roleId=${addrole}[data][roleId]


创建角色---role0001010
    [Documentation]     角色名称输入9个有效字
    ${addrole}    AddSysRole     ${local_url}      roleName=我是角色名称有没有      remark=rtr       roleRights=4,6
    should be true      $addrole["error_msg"]=="角色名最多不能超过8个字符！"


创建角色---role0001011
    [Documentation]     角色说明输入中文
    ${addrole}    AddSysRole     ${local_url}      roleName=你好      remark=我是角色说明       roleRights=4,6
    should be true     $addrole["data"]["remark"]=="我是角色说明"
    [teardown]   DeleteSysRole   ${local_url}    roleId=${addrole}[data][roleId]


创建角色---role0001012
    [Documentation]    角色说明输入英文
    ${addrole}    AddSysRole     ${local_url}      roleName=jilij      remark=rtr       roleRights=4,6
    should be true     $addrole["data"]["remark"]=="rtr"
    [teardown]   DeleteSysRole   ${local_url}    roleId=${addrole}[data][roleId]


创建角色---role0001013
    [Documentation]    角色说明输入特殊字符
    ${addrole}    AddSysRole     ${local_url}      roleName=jilij      remark=$%^&       roleRights=4,6
    should be true     $addrole["data"]["remark"]=="$%^&"
    [teardown]   DeleteSysRole   ${local_url}    roleId=${addrole}[data][roleId]

创建角色---role0001014
    [Documentation]     角色说明为空
    ${addrole}    AddSysRole     ${local_url}      roleName=jilij     remark=${EMPTY}       roleRights=4,6
    should be true     $addrole["data"]["remark"]==""
    [teardown]   DeleteSysRole   ${local_url}    roleId=${addrole}[data][roleId]

创建角色---role0001015
#现在是角色说明为空格也可以创建成功
    [Documentation]     角色说明为空格
    ${addrole}    AddSysRole     ${local_url}     roleName=jilij     remark=${SPACE}       roleRights=4,6
    should be true     $addrole["error_msg"]=="角色说明不能为空！"


创建角色---role0001016
    [Documentation]     缺少remark参数
    ${addrole}    AddSysRole     ${local_url}        roleName=你       roleRights=4,6
    should be true     $addrole["data"]["remark"]==""
    [teardown]   DeleteSysRole   ${local_url}    roleId=${addrole}[data][roleId]

创建角色---role0001017
    [Documentation]     角色说明输入一个有效字
    ${addrole}    AddSysRole     ${local_url}      roleName=你      remark=r      roleRights=4,6
    should be true     $addrole["data"]["remark"]=="r"
    [teardown]   DeleteSysRole   ${local_url}    roleId=${addrole}[data][roleId]

创建角色---role0001018
    [Documentation]     角色说明输入20个有效字
    ${addrole}    AddSysRole     ${local_url}      roleName=我是角色名称有没      remark=rtrhggtfgrtgtrfreewd       roleRights=4,6
    should be true     $addrole["data"]["remark"]=="rtrhggtfgrtgtrfreewd"
    [teardown]   DeleteSysRole   ${local_url}    roleId=${addrole}[data][roleId]


创建角色---role0001019
    [Documentation]     角色说明输入21个有效字
    ${addrole}    AddSysRole     ${local_url}      roleName=我是角色名称有没     remark=我要输入二十一个字现在有没有二十一个字有没       roleRights=4,6
    should be true      $addrole["error_msg"]=='角色描述最多不能超过20个字符！'

创建角色---role0001020
    [Documentation]     角色权限为空
    ${addrole}    AddSysRole     ${local_url}      roleName=jilij1     remark=1234      roleRights=${EMPTY}
    should be true     $addrole["error_msg"]=="角色权限不能为空！"

创建角色---role0001021
    [Documentation]     角色权限为中文
    ${addrole}    AddSysRole     ${local_url}      roleName=jilii    remark=1234      roleRights=中国,人民
    should be true     $addrole["error_msg"]=="角色权限参数输入错误！"

创建角色---role0001
    [Documentation]    token为空
    SetToken       ${EMPTY}
    ${addrole}    AddSysRole     ${local_url}      roleName=xzx88888    remark=rtr       roleRights=4,12,14
    should be true     $addrole['error_code']=='没有登陆或令牌过期！'
    [teardown]   DeleteSysRole   ${local_url}    roleId=${addrole}[data][roleId]

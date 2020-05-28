*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.rolemanage    ${common.token}
Variables  API/cfg.py

#Suite Setup  Delete_ALLSysRole   ${local_url}
*** Test Cases ***
查看子帐号---role0007
    [Tags]    冒烟测试
    [Documentation]     无子帐号的情况下查看子帐号
    ${getrolelist}    GetRoleList    ${local_url}
    ${getroleuserlist}     GetRoleUserList     ${local_url}    roleId=$getrolelist["data"]["list"][0]["roleId"]
    should be true     $getroleuserlist["data"]["totalSize"]==0

查看子帐号---role0007001
    [Documentation]    查看子帐号参数roleId为空
    ${getrolelist}    GetRoleList    ${local_url}
    ${getroleuserlist}     GetRoleUserList     ${local_url}    roleId=${EMPTY}
    should be true     $getroleuserlist["error_msg"]=="角色ID不能为空！"

查看子帐号---role0007002
    [Documentation]    查看子帐号参数roleId为空格
    ${getrolelist}    GetRoleList    ${local_url}
    ${getroleuserlist}     GetRoleUserList     ${local_url}    roleId=${SPACE}
    should be true     $getroleuserlist["error_msg"]=="角色ID不能为空！"

查看子帐号---role0007003
    [Documentation]    查看子帐号不传参数roleId
    ${getrolelist}    GetRoleList    ${local_url}
    ${getroleuserlist}     GetRoleUserList     ${local_url}
    should be true     $getroleuserlist["error_msg"]=="角色ID不能为空！"

查看子帐号---role0007004
#现在roleid为其它字符时，返回结果是0
    [Documentation]    查看子帐号参数roleId为中文
    ${getrolelist}    GetRoleList    ${local_url}
    ${getroleuserlist}     GetRoleUserList     ${local_url}    roleId=中国人
    should be true     $getroleuserlist["data"]["totalSize"]==0

查看子帐号---role0007005
#现在roleid为其它字符时，返回结果是0
    [Documentation]    查看子帐号参数roleId为负数
    ${getrolelist}    GetRoleList    ${local_url}
    ${getroleuserlist}     GetRoleUserList     ${local_url}    roleId=-3
    should be true     $getroleuserlist["data"]["totalSize"]==0

查看子帐号---role0007006
#现在roleid为其它字符时，返回结果是0
    [Documentation]    查看子帐号参数roleId为小数
    ${getrolelist}    GetRoleList    ${local_url}
    ${getroleuserlist}     GetRoleUserList     ${local_url}    roleId=1.5
    should be true     $getroleuserlist["data"]["totalSize"]==0

查看子帐号---role0007007
#现在roleid为其它字符时，返回结果是0
    [Documentation]    查看子帐号参数roleId为字母
    ${getrolelist}    GetRoleList    ${local_url}
    ${getroleuserlist}     GetRoleUserList     ${local_url}    roleId=ave
    should be true     $getroleuserlist["data"]["totalSize"]==0

查看子帐号---role0007008
#现在roleid为其它字符时，返回结果是0
    [Documentation]    查看子帐号参数roleId为特殊字符
    ${getrolelist}    GetRoleList    ${local_url}
    ${getroleuserlist}     GetRoleUserList     ${local_url}    roleId=！@#
    should be true     $getroleuserlist["data"]["totalSize"]==0

查看子帐号---role0007009
#现在roleid为其它字符时，返回结果是0
    [Documentation]    查看子帐号参数roleId为特殊字符
    ${getrolelist}    GetRoleList    ${local_url}
    ${getroleuserlist}     GetRoleUserList     ${local_url}    roleId=45125852545kikkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkoiuuh
    should be true     $getroleuserlist["data"]["totalSize"]==0
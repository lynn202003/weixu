*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.rolemanage     ${common.token}
Variables  API/cfg.py

*** Test Cases ***
获取角色列表---role0004
    [Tags]    冒烟测试
    [Documentation]     模糊查询角色列表
    ${getrolelist}     GetRoleList     ${local_url}      roleName=我是k2     orderBy=updateTime_asc      pageSize=10   pageNum=1
    ${getrole}    Evaluate     $getrolelist["data"]["list"]
    :FOR  ${one}   in    @{getrole}
       \  ${rolename}    Evaluate   "我是k2" in $one["roleName"]
       \  run keyword if    ${rolename}   log to console    pass
    Check_Sort     ${local_url}       updateTime_asc

获取角色列表---role0004001
    [Documentation]     角色列表中不传参数roleName
    ${getrolelist}     GetRoleList     ${local_url}       orderBy=updateTime_asc      pageSize=10   pageNum=1
    should be true   $getrolelist["data"]["totalSize"]>0

获取角色列表---role0004002
    [Documentation]     角色列表中参数roleName为空
    ${getrolelist}     GetRoleList     ${local_url}      roleName=${EMPTY}   orderBy=updateTime_asc      pageSize=10   pageNum=1
    should be true      $getrolelist["data"]["totalSize"]>0

获取角色列表---role0004003
    [Documentation]     角色列表中参数orderBy为空
    ${getrolelist}     GetRoleList     ${local_url}       orderBy=${EMPTY}      pageSize=10   pageNum=1
    should be true      $getrolelist["data"]["totalSize"]>0

获取角色列表---role0004004
    [Documentation]     角色列表中不传参数orderBy
    ${getrolelist}     GetRoleList     ${local_url}       pageSize=10   pageNum=1
    should be true      $getrolelist["data"]["totalSize"]>0

获取角色列表---role0004005
    [Documentation]     角色列表中参数orderBy为createTime_asc
    ${getrolelist}     GetRoleList     ${local_url}     orderBy=createTime_asc    pageSize=10   pageNum=1
    should be true      $getrolelist["data"]["totalSize"]>0
    Check_Sort          ${local_url}        createTime_asc


获取角色列表---role0004006
    [Documentation]     角色列表中参数orderBy为createTime_desc
    ${getrolelist}     GetRoleList     ${local_url}     orderBy=createTime_desc   pageSize=10   pageNum=1
    should be true      $getrolelist["data"]["totalSize"]>0
    Check_Sort          ${local_url}        createTime_desc


获取角色列表---role0004007
    [Documentation]     角色列表中参数orderBy为updateTime_asc
    ${getrolelist}     GetRoleList     ${local_url}     orderBy=updateTime_asc   pageSize=10   pageNum=1
    should be true      $getrolelist["data"]["totalSize"]>0
    Check_Sort          ${local_url}        updateTime_asc

获取角色列表---role0004008
    [Documentation]     角色列表中参数orderBy为updateTime_desc
    ${getrolelist}     GetRoleList     ${local_url}     orderBy=updateTime_desc   pageSize=10   pageNum=1
    should be true      $getrolelist["data"]["totalSize"]>0
    Check_Sort          ${local_url}        updateTime_desc


获取角色列表---role0004009
    [Documentation]     角色列表中不传参数pageSize
    ${getrolelist}     GetRoleList     ${local_url}     orderBy=updateTime_asc       pageNum=1
    should be true     $getrolelist["data"]["totalSize"]>0

获取角色列表---role0004010
    [Documentation]     角色列表中参数pageSize为空
    ${getrolelist}     GetRoleList     ${local_url}     orderBy=updateTime_asc    pageSize=${EMPTY}    pageNum=1
    should be true       $getrolelist["title"]=="实体验证错误"

获取角色列表---role0004011
    [Documentation]     角色列表中参数pageSize超出条数范围
    ${getrolelist}     GetRoleList     ${local_url}     orderBy=updateTime_asc    pageSize=60   pageNum=1
    should be true       $getrolelist["data"]["totalSize"]>0

获取角色列表---role0004012
    [Documentation]     角色列表中不传参数pageNum
    ${getrolelist}     GetRoleList     ${local_url}     orderBy=updateTime_asc     pageSize=10
    should be true       $getrolelist["data"]["totalSize"]>0

获取角色列表---role0004013
    [Documentation]     角色列表中参数pageNum为空
    ${getrolelist}     GetRoleList     ${local_url}     orderBy=updateTime_asc    pageSize=10    pageNum=${EMPTY}
    should be true       $getrolelist["title"]=="实体验证错误"

获取角色列表---role0004014
    [Documentation]     角色列表中参数pageNum超出条数范围
    ${getrolelist}     GetRoleList     ${local_url}     orderBy=updateTime_asc    pageSize=10  pageNum=60
    should be true       $getrolelist["data"]["totalSize"]>0
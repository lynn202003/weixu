*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.rolemanage    ${common.token}
Variables  API/cfg.py

*** Test Cases ***
获取权限菜单列表---role0010
    [Tags]    冒烟测试
    [Documentation]    menuId为1-7的数字时获取单个权限菜单
    ${getallsysmenu}    GetAllSysMenu     ${local_url}      menuId=1
    should be true     $getallsysmenu["data"]["list"][0]["parentId"]=="1"

获取权限菜单列表---role0010001
#现在为负数获取到的是0
    [Documentation]    menuId值为负数
    ${getallsysmenu}    GetAllSysMenu     ${local_url}      menuId=-3
    should be true     $getallsysmenu["data"]["totalSize"]==0

获取权限菜单列表---role0010002
    [Documentation]    menuId值为小数
    ${getallsysmenu}    GetAllSysMenu     ${local_url}      menuId=1.5
    should be true     $getallsysmenu["data"]["totalSize"]==0


获取权限菜单列表---role0010003
    [Documentation]    menuId值为中文
    ${getallsysmenu}    GetAllSysMenu     ${local_url}      menuId=中国人
    should be true     $getallsysmenu["data"]["totalSize"]==0


获取权限菜单列表---role0010004
    [Documentation]    menuId值为字母
    ${getallsysmenu}    GetAllSysMenu     ${local_url}      menuId=jik
    should be true     $getallsysmenu["data"]["totalSize"]==0


获取权限菜单列表---role0010005
    [Documentation]    menuId值为特殊字符
    ${getallsysmenu}    GetAllSysMenu     ${local_url}      menuId=%^&*
    should be true     $getallsysmenu["data"]["totalSize"]==0


获取权限菜单列表---role0010006
    [Documentation]    menuId值为超长字符
    ${getallsysmenu}    GetAllSysMenu     ${local_url}      menuId=1111111111111111111111111111
    should be true     $getallsysmenu["data"]["totalSize"]==0


获取权限菜单列表---role0010007
    [Documentation]    menuId值为空
    ${getallsysmenu}    GetAllSysMenu     ${local_url}      menuId=${EMPTY}
    should be true     $getallsysmenu["error_msg"]=="参数错误！"

获取权限菜单列表---role0010008
    [Documentation]    menuId值为空格
    ${getallsysmenu}    GetAllSysMenu     ${local_url}      menuId=${SPACE}
    should be true     $getallsysmenu["error_msg"]=="参数错误！"

获取权限菜单列表---role0010009
#现在为0是可以获取到所有的
    [Documentation]    menuId值为0
    ${getallsysmenu}    GetAllSysMenu     ${local_url}      menuId=0
    should be true     $getallsysmenu["data"]["totalSize"]==7

获取权限菜单列表---role0010010
    [Documentation]    不传参数menuId
    ${getallsysmenu}    GetAllSysMenu     ${local_url}
    should be true     $getallsysmenu["error_msg"]=="参数错误！"
*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.childusermanage    ${common.token}
Library  API.pylib.rolemanage        ${common.token}
Variables  API/cfg.py
Suite Setup    suitesetup     ${local_url}        test06      kwg        kok25125

*** Test Cases ***
重置密码---sysuser0008
    [Tags]    冒烟测试
    [Documentation]     正常重置密码
    ${getuserlist}      GetSysUserList    ${local_url}
    ${updatepassword}   UpdateSysUserPassword       ${local_url}     userId=${getuserlist}[data][list][0][userId]       password=1234te6
    should be true     $updatepassword["error_msg"]=="重置密码成功！"

重置密码---sysuser0008001
    [Documentation]     重置密码时密码为6位有效数
    ${getuserlist}      GetSysUserList    ${local_url}
    ${updatepassword}   UpdateSysUserPassword       ${local_url}     userId=${getuserlist}[data][list][0][userId]        password=123tey
    should be true     $updatepassword["error_msg"]=="重置密码成功！"

重置密码---sysuser0008002
    [Documentation]     重置密码时密码为20位有效数
    ${getuserlist}      GetSysUserList    ${local_url}
    ${updatepassword}   UpdateSysUserPassword       ${local_url}     userId=${getuserlist}[data][list][0][userId]       password=123663#@#$yt125845op
    should be true     $updatepassword["error_msg"]=="重置密码成功！"

重置密码---sysuser0008003
    [Documentation]     重置密码时密码为5位有效数
    ${getuserlist}      GetSysUserList    ${local_url}
    ${updatepassword}   UpdateSysUserPassword       ${local_url}     userId=${getuserlist}[data][list][0][userId]       password=12uio
    should be true     $updatepassword["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"


重置密码---sysuser0008004
    [Documentation]     重置密码时密码为21位有效数
    ${getuserlist}      GetSysUserList    ${local_url}
    ${updatepassword}   UpdateSysUserPassword       ${local_url}      userId=${getuserlist}[data][list][0][userId]       password=123663#@#$yt125845opt
    should be true     $updatepassword["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"

重置密码---sysuser0008005
    [Documentation]     重置密码时password为空
    ${getuserlist}      GetSysUserList    ${local_url}
    ${updatepassword}   UpdateSysUserPassword       ${local_url}     userId=${getuserlist}[data][list][0][userId]         password=${EMPTY}
    should be true     $updatepassword["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"

重置密码---sysuser0008006
    [Documentation]     不传参数password
    ${getuserlist}      GetSysUserList    ${local_url}
    ${updatepassword}   UpdateSysUserPassword       ${local_url}     userId=${getuserlist}[data][list][0][userId]       password=${EMPTY}
    should be true     $updatepassword["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"

重置密码---sysuser0008007
    [Documentation]     重置密码时password为空格
    ${getuserlist}      GetSysUserList    ${local_url}
    ${updatepassword}   UpdateSysUserPassword       ${local_url}     userId=${getuserlist}[data][list][0][userId]         password=${SPACE}
    should be true     $updatepassword["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"


重置密码---sysuser0008008
    [Documentation]     重置密码时password为有效范围内的数字
    ${getuserlist}      GetSysUserList    ${local_url}
    ${updatepassword}   UpdateSysUserPassword       ${local_url}     userId=${getuserlist}[data][list][0][userId]         password=12365285
    should be true     $updatepassword["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"


重置密码---sysuser0008009
    [Documentation]     重置密码时password为有效范围内的字母
    ${getuserlist}      GetSysUserList    ${local_url}
    ${updatepassword}   UpdateSysUserPassword       ${local_url}    userId=${getuserlist}[data][list][0][userId]         password=kolololkl
    should be true     $updatepassword["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"

重置密码---sysuser0008010
    [Documentation]     重置密码时password为有效范围内的符号
    ${getuserlist}      GetSysUserList    ${local_url}
    ${updatepassword}   UpdateSysUserPassword       ${local_url}     userId=${getuserlist}[data][list][0][userId]        password=%^&$#%^&
    should be true     $updatepassword["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"

重置密码---sysuser0008011
    [Documentation]     重置密码时password为有效范围内的中文
    ${getuserlist}      GetSysUserList    ${local_url}
    ${updatepassword}   UpdateSysUserPassword       ${local_url}     userId=${getuserlist}[data][list][0][userId]         password=中国是中要是中国
    should be true     $updatepassword["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"


重置密码---sysuser0008012
    [Documentation]     重置密码时password为有效范围内的数字+中文
    ${getuserlist}      GetSysUserList    ${local_url}
    ${updatepassword}   UpdateSysUserPassword       ${local_url}     userId=${getuserlist}[data][list][0][userId]         password=1232中国是中要是中国
    should be true     $updatepassword["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"

重置密码---sysuser0008013
    [Documentation]     重置密码时password为有效范围内的小写字母+大写字母
    ${getuserlist}      GetSysUserList    ${local_url}
    ${updatepassword}   UpdateSysUserPassword       ${local_url}     userId=${getuserlist}[data][list][0][userId]         password=kokoKOUHJJ
    should be true     $updatepassword["error_msg"]=="密码必须为6-20位，且由字母、数字和符号两种以上组成！"

重置密码---sysuser0008014
    [Documentation]     重置密码时password为有效范围内的小写字母+数字+字符
    ${getuserlist}      GetSysUserList    ${local_url}
    ${updatepassword}   UpdateSysUserPassword       ${local_url}     userId=${getuserlist}[data][list][0][userId]         password=kok123#@$
    should be true     $updatepassword["error_msg"]=="重置密码成功！"


重置密码---sysuser0008015
    [Documentation]     重置密码时userId为空格
    ${getuserlist}      GetSysUserList    ${local_url}
    ${updatepassword}   UpdateSysUserPassword       ${local_url}     userId=${SPACE}      password=123456
    should be true     $updatepassword["error_msg"]=="参数错误！"

重置密码---sysuser0008016
    [Documentation]     重置密码时userId为空
    ${getuserlist}      GetSysUserList    ${local_url}
    ${updatepassword}   UpdateSysUserPassword       ${local_url}     userId=${EMPTY}      password=123456
    should be true     $updatepassword["error_msg"]=="参数错误！"

重置密码---sysuser0008017
    [Documentation]     重置密码时userId参数不传
    ${getuserlist}      GetSysUserList    ${local_url}
    ${updatepassword}   UpdateSysUserPassword       ${local_url}       password=123456
    should be true     $updatepassword["error_msg"]=="参数错误！"

重置密码---sysuser0008018
    [Documentation]     重置密码时userId传入不存在的id
    ${getuserlist}      GetSysUserList    ${local_url}
    ${updatepassword}   UpdateSysUserPassword       ${local_url}     userId=1258524kikkklol      password=123456
    should be true     $updatepassword["error_msg"]=="参数错误！"
*** Settings ***
Library  API.pylib.login
Variables  API/cfg.py

*** Test Cases ***
正常登录---user0001
    [Tags]    冒烟测试
    [Documentation]    输入正确的帐号和密码
    ${userlogin}    user_login     ${local_url}      userName=lynn     password=test123
    should be true     $userlogin["data"]["userName"]=="lynn"

用户名错误登录---user0001001
    [Documentation]    用户名为中文
    ${userlogin}    user_login    ${local_url}      userName=我是用户名     password=qwer1234
    should be true     $userlogin["error_msg"]=="用户名或密码错误！"

用户名错误登录---user0001002
    [Documentation]    用户名为大写字母
    ${userlogin}    user_login    ${local_url}       userName=HUIO     password=qwer1234
    should be true     $userlogin["error_msg"]=="用户名或密码错误！"

用户名错误登录---user0001003
    [Documentation]    用户名为特殊字符
    ${userlogin}    user_login    ${local_url}      userName=%$^&*      password=qwer1234
    should be true     $userlogin["error_msg"]=="用户名或密码错误！"

用户名错误登录---user0001004
    [Documentation]    用户名为空
    ${userlogin}    user_login    ${local_url}     userName=${EMPTY}    password=qwer1234
    should be true     $userlogin["errors"]["UserName"]==['The UserName field is required.']

用户名错误登录---user0001005
    [Documentation]    用户名为空格
    ${userlogin}    user_login    ${local_url}       userName=${SPACE}   password=qwer1234
    should be true     $userlogin["errors"]["UserName"]==["The UserName field is required."]

用户名错误登录---user0001006
    [Documentation]    用户名长度为5位规定字符
    ${userlogin}    user_login    ${local_url}        userName=12345      password=qwer1234
    should be true     $userlogin["error_msg"]=="用户名或密码错误！"

用户名错误登录---user0001007
    [Documentation]    用户名长度为6位规定字符
    ${userlogin}    user_login    ${local_url}         userName=123456     password=qwer1234
    should be true     $userlogin["error_msg"]=="用户名或密码错误！"

用户名错误登录---user0001008
    [Documentation]    用户名长度为12位规定字符
    ${userlogin}    user_login    ${local_url}       userName=123456457891      password=qwer1234}
    should be true     $userlogin["error_msg"]=="用户名或密码错误！"

用户名错误登录---user0001009
    [Documentation]    用户名长度为13位规定字符
    ${userlogin}    user_login    ${local_url}        userName=1234564578912     password=qwer1234
    should be true     $userlogin["error_msg"]=="用户名或密码错误！"

用户名错误登录---user0001010
    [Documentation]    用户名参数不传
    ${userlogin}    user_login    ${local_url}          password=qwer1234
    should be true     $userlogin["errors"]["UserName"]==["The UserName field is required."]

密码错误登录---user0001011
    [Documentation]     密码参数不传
    ${userlogin}    user_login    ${local_url}        userName=1234564578912
   should be true     $userlogin["errors"]["Password"]==["The Password field is required."]

密码错误登录---user0001012
    [Documentation]    传入相同的参数
    ${userlogin}    user_login    ${local_url}        userName=1234564578912     userName=1234564578912
    should be true     $userlogin["errors"]["Password"]==["The Password field is required."]






*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.usermanage    ${common.token}
Variables  API/cfg.py

*** Test Cases ***
用户列表---usermanage0001
#前提是已经有用户的数据
    [Tags]    冒烟测试
    [Documentation]     正常注销帐户
    closeUser      ${local_url}     uid=
*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.rolemanage    ${common.token}
Variables  API/cfg.py

#Suite Setup  Delete_ALLSysRole   ${local_url}
Suite Setup       create_twentyrole     ${local_url}    ${20}     我是k2      uiou       4,5,6

Suite Teardown    Delete_ALLSysRole       ${local_url}     ${10}
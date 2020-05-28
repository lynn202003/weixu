*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.rolemanage    ${common.token}
Variables  API/cfg.py

Suite Setup  Delete_ALLSysRole   ${local_url}     ${10}
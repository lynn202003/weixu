*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.rolemanage    ${common.token}
Variables  API/cfg.py

Suite Setup       AddSysRole     ${local_url}      roleName=suite1    remark=rtr452       roleRights=4,12,14

*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.rolemanage    ${common.token}
Variables  API/cfg.py

#Suite Setup  Delete_ALLSysRole   ${local_url}
Suite Setup       suitesetup     ${local_url}        test05      kwg        12541kok


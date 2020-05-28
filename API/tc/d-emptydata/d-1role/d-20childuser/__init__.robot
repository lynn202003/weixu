*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.childusermanage    ${common.token}
Variables  API/cfg.py

Suite Setup  create_twentyuser   ${local_url}    ${20}   tes   测试呀12jk    test1234

Suite Teardown   delete_alluser    ${local_url}    192.168.0.247     wx_db       wx_db       wx_db    sys_user
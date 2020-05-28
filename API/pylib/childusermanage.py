# coding: utf-8
import requests
import json
from API.log.log import log1
from API.cfg import *
from API import getcwd
from API.pylib.common import *
from random import randint
from API.pylib.rolemanage import rolemanage
from API.pylib.sql import sql

class childusermanage():
    def __init__(self,token):
        self.token=token
    def GetSysUserList(self,url,**params):
        '''获取子帐号列表'''
        URL=f'{url}/api/SysUsers/GetSysUserList'
        resp=requests.get(URL,headers={'Content-Type': 'application/json','Authorization':self.token},params=params)
        result=resp.json()
        if result["data"]["totalSize"]>=0:
            log1.info("成功获取子帐号列表")
            return result
        else:
            log1.error("获取子帐号列表失败",exc_info=1)

    def AddSysUser(self,url,**data):
        '''创建子帐号'''
        URL=f'{url}/api/SysUsers/AddSysUser'
        jsoninfo=json.dumps(data)
        resp=requests.post(URL,headers={'Content-Type': 'application/json','Authorization':self.token},data=jsoninfo)
        result=resp.json()
        if ("data" in result) and "userId" in result["data"]:
            log1.info(f"子帐号创建成功，返回信息为{result}")
            return result
        elif "error_msg" in result:
            log1.info(f"参数数错，返回信息是{result},传入的参数是{data}")
            return result
        else:
            log1.error(f"子帐号创建失败，传入的参数为{data}",exc_info=1)

    def UpdateSysUser(self,url,**data):
        '''编辑子帐号'''
        URL=f'{url}/api/SysUsers/UpdateSysUser'
        jsoninfo=json.dumps(data)
        resp=requests.post(URL,headers={'Content-Type': 'application/json','Authorization':self.token},data=jsoninfo)
        result=resp.json()
        print(result)
        if ("error_msg" in result) and result["error_msg"]=="更新成功！" and "userId" in result["data"]:
            log1.info(f"子帐号编辑成功，返回信息为{result}")
            return result
        elif "error_msg" in result:
            log1.info(f"参数错误，返回的消息是{result},传入的参数是{data}")
            return result
        else:
            log1.error(f"子帐号编辑失败，传入参数为{data}",exc_info=1)

    def UpdateSysUserStatus(self,url,**data):
        '''冻结/解冻子账号'''
        URL=f'{url}/api/SysUsers/UpdateSysUserStatus'
        jsoninfo=json.dumps(data)
        resp=requests.post(URL,headers={'Content-Type': 'application/json','Authorization':self.token},data=jsoninfo)
        result=resp.json()
        print(result)
        if ("error_msg" in result) and result["error_msg"]=="冻结用户成功！":
            log1.info(f"子帐号冻结成功")
            return result
        elif ("error_msg" in result) and result["error_msg"]=="解冻用户成功！":
            log1.info(f"子帐号解冻成功")
            return result
        elif "error_msg" in result:
            log1.info(f"参数错误，返回的信息是{result},传入的参数是{data}")
            return result
        else:
            log1.error(f'冻结/解冻失败，返回结果是{result}',exc_info=1)
            log1.error(f"子帐号冻结/解冻失败，传入的参数为{data}",exc_info=1)

    def GetCurrentSysUser(self,url,**params):
        '''获取当前登录用户信息'''
        URL=f'{url}/api/SysUsers/GetCurrentSysUser'
        resp=requests.get(URL,headers={'Content-Type': 'application/json','Authorization':self.token},params=params)
        result=resp.json()
        if ("data" in result) and ("userId" in result["data"]):
            log1.info("成功获取到获取当前用户信息")
            return result
        else:
            log1.error(f'获取当前用户信息失败，传入的参数为{params}')

    def UpdateSysUserPassword(self,url,**data):
        '''重置密码'''
        URL=f'{url}/api/SysUsers/UpdateSysUserPassword'
        jsoninfo=json.dumps(data)
        resp=requests.post(URL,headers={'Content-Type': 'application/json','Authorization':self.token},data=jsoninfo)
        result=resp.json()
        if ("error_msg" in result) and result["error_msg"]=="重置密码成功！":
            log1.info("密码重置成功")
            return result
        elif "error_msg" in result:
            log1.info(f"参数错误，返回信息是{result},传入的参数是{data}")
            return result
        else:
            log1.error(f"密码重置失败，传入的参数为{data}",exc_info=1)

    def create_twentyuser(self,url,number,username,name,password):
        '''生成20个随机子帐号'''
        a=rolemanage(common.token)
        getrolelist=a.GetRoleList(url)
        for one in range(0,number):
            rand = randint(1000, 1999)
            self.AddSysUser(url,userName=username+str(rand), name=name, password=password,roleId=getrolelist["data"]["list"][0]["roleId"])

    def delete_alluser(self,url,host,user,password,db,tabls_name):
        '''删除所有子帐号'''
        getuserlist=self.GetSysUserList(url,orderBy="updateTime_desc")
        number = 0
        one = sql(host, user, password, db)
        one.db_connect()
        for user in getuserlist["data"]["list"]:
            print(user)
            one.deletedata(tabls_name,user["userId"])
            number+=1
            if number==20:
                break
        one.sql_close()

if __name__ == '__main__':
    a=childusermanage(common.token)
    a.delete_alluser("http://192.168.0.247","192.168.0.247","wx_db","wx_db","wx_db","sys_user")
    # a.UpdateSysUserStatus("http://192.168.0.247",userId="b856c37f643047939ab66196595835a7",status="1")   #1为解冻，2为冻结
    # a.GetSysUserList("http://192.168.0.247",userId="b856c37f643047939ab66196595835a7",name="51",orderBy="updateTime_asc",pageSize=10,pageNum=10)
    # a.AddSysUser("http://192.168.0.247",userName="test0",name="kwg",password="1254123",roleId="8fb055bafe6f4113948bfe7793c034be")
    # a.UpdateSysUser("http://222.66.148.78:58080",userId="f1d8419588cc4af48c1298b6f87e6c63",name="t20200514",roleId="05f3953f97204c11a0d5288b2e0fdefa")
    # a.create_twentyrole("http://192.168.0.247",20,"tes","测试呀12","test1234")


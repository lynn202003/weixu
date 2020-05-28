#coding:utf-8
import requests
import json
from API import getcwd
from API.log.log import log1
from API.pylib.common import *
from API.cfg import *
class usermanage():
    def __init__(self,token):
        self.token=token

    def getUserList(self,url,**params):
        '''获取用户列表接口'''
        URL=f'{url}/api/userManage/getUserList'
        # params={"type":type,"phone":phone,"registDate":registDate,"orderBy":orderBy,"pageSize":pageSize,"pageNum":pageNum}
        resq=requests.get(URL,params=params,headers={'Content-Type': 'application/json','Authorization':self.token})
        result=resq.json()
        if ("data" in result) and result["data"]["totalSize"]>=0:
            log1.info("成功获取用户列表接口")
            return result
        elif "title" in result:
            log1.info(f"参数格式错误，传入的参数是{params}")
            return result
        else:
            log1.error(f"获取用户列表接口失败，返回信息为{result},传入的参数为{params}")


    def closeUser(self,url,**params):
        '''注销账号'''
        URL=f'{url}/api/userManage/closeUser'
        resp=requests.get(URL,headers={'Content-Type': 'application/json','Authorization':self.token},params=params)
        result=resp.json()
        if "data" in result:
            log1.info("成功注销账号")
            return result
        elif "title" in result:
            log1.info(f"参数格式错误，传入的参数是{params}")
        elif "error_msg" in result and result["error_msg"]=="参数错误！":
            log1.info(f"参数错误，传入的参数是{params}")
        else:
            log1.error(f"注销帐号失败，返回信息是{result},传入的参数是{params}")

if __name__ == '__main__':
      a=usermanage(common.token)
      a.getUserList("http://192.168.0.247",type="0",phone="130",registDate="2020-04-22,2020-05-22",orderBy="registDate_desc",pageSize=10,pageNum=1)




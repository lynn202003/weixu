#coding:utf-8
import requests
import json
from API import getcwd
from API.log.log import log1
import time
class login():
    '''用户登录接口'''
    def user_login(self,url,**data):
        URL=f"{url}/api/user/LoginAdmin"
        # data={"userName":username,"password":password}
        log1.info(data)
        jsoninfo=json.dumps(data)
        resp=requests.post(URL,headers={'Content-Type': 'application/json'},data=jsoninfo)
        result=resp.json()
        log1.info(result)
        if ("error_msg" in result) and result["error_msg"]=="登陆成功" and  "token" in result:
            log1.info(f"登录成功，返回值为{result}")
            token="Bearer "+result["token"]
            self.token=token
            log1.info(f'token值为{token}')
            return result
        elif ("error_msg" in result) and result["error_msg"]=="用户名或密码错误！":
            log1.info(f"登录的用户名或者密码错误,传入的参数是{data}")
            return result
        elif ("errors" in result) and  ("Password" in result["errors"]):
            log1.info(f"密码错误，传入的参数是{data}")
            return result
        elif ("errors" in result) and  ("UserName" in result["errors"]):
            log1.info(f"用户名错误，传入的参数是{data}")
            return result
        else:
            log1.error("登录失败",exc_info=1)


    def check_tokentime(self,url,username,password):
        '''检查token时效性'''
        self.user_login(url,userName=username,password=password)
        before=self.token
        self.user_login(url,userName=username,password=password)
        after =self.token
        if before==after:
            log1.info("token时效性测试正确")
        else:
            log1.error("token时效性测试错误")


    def loginout(self,url,username):
        '''退出'''
        URL=f"{url}/api/user/LogoutAdmin"
        param={"userName":username}
        resp=requests.get(URL,headers={'Content-Type': 'application/json','Authorization':self.token},params=param)
        result=resp.json()
        print(result)
        if result["error_msg"]=="退出成功！":
            log1.info(f"退出成功，返回值为{result}")
            return result
        else:
            log1.error("退出失败",exc_info=1)

if __name__ == '__main__':
    a=login()
    a.user_login("http://222.66.148.78:58080",userName="test",password="qwer1234")
    a.loginout("http://222.66.148.78:58080","test")
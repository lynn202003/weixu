import unittest
from API.pylib.login import login
from API.excel import Excel

class test_login(unittest.TestCase):
    #用unittest的用例
    def test_error(self):
        #使用的是参数化，把用户名各种情况下的数据放入excel中进行参数化，前提是返回结果都一致才好做断言
        '''用户名错误时'''
        c=Excel(r"D:\工作文件\处处有码\login.xls","userdata")
        datas=c.login_data()
        for one in datas:
            user=one["username"]
            pas=one["password"]
            a=login()
            result=a.user_login("http://192.168.0.247",userName=user,password=pas)
            login_user=result["error_msg"]
            self.assertEqual(login_user,"用户名或密码错误！")


    def test_log(self):
        '''测试正确的用户名和密码'''
        a=login()
        result=a.user_login("http://192.168.0.247",userName="lynn",password="test123")
        print(result)
        login_user=result["data"]["userName"]
        self.assertEqual(login_user,"lynn")


    def test_lo(self):
        '''用户名为大写字母时'''
        a=login()
        result=a.user_login("http://192.168.0.247",userName="HUIO",password="test123")
        print(result)
        login_user=result["error_msg"]
        self.assertEqual(login_user,"用户名或密码错误！")

    def test_err(self):
        '''用户名为特殊字符时'''
        a=login()
        result=a.user_login("http://192.168.0.247",userName="%$^&*",password="test123")
        login_user=result["error_msg"]
        self.assertEqual(login_user,"用户名或密码错误！")



if __name__ == '__main__':
    d=test_login()
    d.test_error()

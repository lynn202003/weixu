#coding:utf-8
import unittest
from API.send_mail import send_mail
# def all_case():
#     case_dir=r"d:\工作文件\新版微续\newWX\API\test_case"
#     testcase=unittest.TestSuite()
#     discover=unittest.defaultTestLoader.discover(case_dir,pattern="test*.py",top_level_dir=None)
#     for test_suite in discover:
#         for test_case in test_suite:
#             testcase.addTests(test_case)
#     print(testcase)
#     return testcase
# if __name__ == '__main__':
#     runner=unittest.TextTestRunner()
#     runner.run(all_case())


def all_case():
    case_dir=r"d:\工作文件\新版微续\newWX\API\test_case"
    testcase=unittest.TestSuite()
    discover=unittest.defaultTestLoader.discover(case_dir,pattern="test*.py",top_level_dir=None)
    testcase.addTests(discover)#直接加载discover
    print(testcase)
    return testcase

if __name__ == '__main__':
    #主函数，运行所有用例并生成报告发送邮件给指定的人
    import HTMLTestRunner
    report_path=r"D:\工作文件\新版微续\result.html"
    fp=open(report_path,"wb")
    #stream:测试报告写入文件的存储区域
    runner = HTMLTestRunner.HTMLTestRunner(
        stream=fp,
        title='自动化测试报告',
        description='用例执行情况'
    )
    runner.run(all_case())
    sender="258251011@qq.com"#邮箱配置
    psw = "***"  # 自己的密码
    #收件人多个人，中间用,隔开
    receiver="258251011@qq.com"
    smtpserver = "smtp.qq.com"  # 邮箱服务器
    send_mail(report_path, sender, receiver, smtpserver, psw)
    fp.close()



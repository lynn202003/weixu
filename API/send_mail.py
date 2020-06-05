import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
import time
def send_mail(reportfile,sender,recevice,smtpserver,psw,port=465):
    '''发送测试报告内容'''
    # 打开测试报告
    with open(reportfile,"rb") as f:
        mail_body=f.read()
    # 定义邮件内容
    msg=MIMEMultipart()
    msg["Subject"]="自动化测试报告"
    msg["from"]=sender
    msg["to"]=recevice
    # msg["to"] = ";".join(receiver) # 多个收件人 list 转 str
    msg['date'] = time.strftime('%Y-%m-%d-%H_%M_%S')
    # 正文
    body = MIMEText(mail_body, _subtype='html', _charset='utf-8')
    msg.attach(body)
    # 添加附件
    att=MIMEText(open(reportfile,"rb").read(),"base64", "utf-8")
    att["Content-Type"] = "application/octet-stream"
    att["Content-Disposition"] = 'attachment; filename= "report.html"' #附件的名称
    msg.attach(att)
    #发送邮件
    try:
        smtp=smtplib.SMTP_SSL(smtpserver,port) # QQ 邮箱
        # HELO 向服务器标识用户身份
        smtp.helo(smtpserver)
        # 服务器返回结果确认
        smtp.ehlo(smtpserver)
    except:
        smtp=smtplib.SMTP()
        smtp.connect(smtpserver,port)   # 连服务器
        # 登录邮箱服务器用户名和密码
    smtp.login(sender,psw)   # 登录
    smtp.sendmail(sender,recevice,msg.as_string())   # 发送
    smtp.quit()
if __name__ == '__main__':
    reportfile = r"D:\工作文件\新版微续\result.html"#测试报告路径
    smtpserver = "smtp.qq.com"  #  邮箱服务器
    sender = "258251011@qq.com" # 自己的账号
    psw = "***" #自己的密码
    recevice = "258251011@qq.com" #对方的账号
    send_mail(reportfile,sender,recevice,smtpserver,psw)


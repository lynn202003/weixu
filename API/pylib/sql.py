#coding:utf-8
import pymysql  #连接的是my sql
from API.log.log import log1
from API import getcwd

class sql():
    def __init__(self,host,user,password,db):   #用户名，密码，库名
        self.host=host
        self.user=user
        self.password=password
        self.db=db
    def db_connect(self):
        # 连接数据库
        connection=pymysql.connect(self.host,self.user,self.password,self.db, charset="utf8")
        self.connection=connection

    def getcollist(self,tabls_name):
        cursor=self.connection.cursor()   # 使用 cursor() 方法创建一个游标对象 cursor
        cursor.execute(f"select * from {tabls_name}")
        data = cursor.fetchone()
        col_name_list = [tuple[0] for tuple in cursor.description]
        print(col_name_list )
        self.connection.close()
        return data

    def query(self,tabls_name):
        #查询表里所有的列
        # 使用 execute() 方法执行 SQL 查询
        try:
            cursor=self.connection.cursor()
            cursor.execute("select * from %s" % tabls_name)
            # 获取所有记录列表
            data =cursor.fetchall()
            for row in data:
                USER_ID = row[0]
                USERNAME = row[1]
                PASSWORD = row[2]
                NAME = row[3]
                ROLE_ID = row[5]
                STATUS = row[8]
                CreateTime = row[15]
                UpdateTime = row[16]
                log1.info(f"USER_ID={USER_ID},USERNAME={USERNAME},PASSWORD={PASSWORD},NAME={NAME},ROLE_ID={ROLE_ID},STATUS={STATUS},CreateTime={CreateTime},UpdateTime={UpdateTime}")
        except:
            print("Error: unable to fetch data")
        return data

    def deletedata(self, tabls_name, name):
        cursor = self.connection.cursor()
        # SQL 删除语句
        sql = f"DELETE FROM {tabls_name} WHERE USER_ID='{name}'"
        try:
            # 执行SQL语句
            cursor.execute(sql)
        #提交到数据库执行
            self.connection.commit()
            for one in self.query(tabls_name):
                if one[0]==name:
                    log1.log("没有删除掉")
            log1.info(f"delete OK,删除的数据USER_ID={name}")
        except:
            # 发生错误时回滚
            self.connection.rollback()
            # 关闭连接
    def sql_close(self):
        '''关闭数据库'''
        self.connection.close()



if __name__ == '__main__':
    a = sql("192.168.0.247", "wx_db", "wx_db", "wx_db")
    a.db_connect()
    a.deletedata("sys_user","2546da1785eb499681e22693b4f1d9d5")
    # a.getcollist("sys_user")
    # a=sql()
    # a.query("sys_user")

#
# '''
#     def sqlconnet(self,tabls_name):
#         #查询表里所有的列
#         connection=pymysql.connect("192.168.0.247",
#                             "wx_db",   #用户名
#                             "wx_db",   #密码
#                             "wx_db",    #库名
#                             charset="utf8")
#         # 使用 cursor() 方法创建一个游标对象 cursor
#         cursor=connection.cursor()
#         # 使用 execute() 方法执行 SQL 查询
#         try:
#             cursor.execute("select * from %s" % tabls_name)
#             # 获取所有记录列表
#             datas= cursor.fetchall()
#             for row in datas:
#                 USER_ID = row[0]
#                 USERNAME = row[1]
#                 PASSWORD = row[2]
#                 NAME = row[3]
#                 ROLE_ID = row[5]
#                 STATUS = row[8]
#                 CreateTime=row[15]
#                 UpdateTime=row[16]
#                 data=f"USER_ID={USER_ID},USERNAME={USERNAME},PASSWORD={PASSWORD},NAME={NAME},ROLE_ID={ROLE_ID},STATUS={STATUS},CreateTime={CreateTime},UpdateTime={UpdateTime}"
#         except:
#             print("Error: unable to fetch data")
#         connection.close()
#         return datas
#
#
#     def getcol(self,tabls_name):
#         #获取表里所有的字段名
#         connection = pymysql.connect("192.168.0.247",
#                                      "wx_db",  # 用户名
#                                      "wx_db",  # 密码
#                                      "wx_db",  # 库名
#                                      charset="utf8")
#         cursor = connection.cursor()
#         cursor.execute(f"select * from {tabls_name}")
#         data = cursor.fetchone()
#         col_name_list = [tuple[0] for tuple in cursor.description]
#         print(col_name_list )
#         connection.close()
#         return data
#
#
#     def deletedata(self,tabls_name,name):
#         #删除数据
#         connection = pymysql.connect("192.168.0.247",
#                                      "wx_db",  # 用户名
#                                      "wx_db",  # 密码
#                                      "wx_db",  # 库名
#                                      charset="utf8")
#         # 使用cursor()方法获取操作游标
#         cursor = connection.cursor()
#         # SQL 删除语句
#         sql = f"DELETE FROM {tabls_name} WHERE USER_ID='{name}'"
#         try:
#             # 执行SQL语句
#             cursor.execute(sql)
#         #提交到数据库执行
#             connection.commit()
#             for one in self.sqlconnet(tabls_name):
#                 if one[0]==name:
#                     log1.log("没有删除掉")
#             log1.info(f"delete OK,删除的数据USER_ID={name}")
#         except:
#             # 发生错误时回滚
#             connection.rollback()
#             # 关闭连接
#         connection.close()
# '''






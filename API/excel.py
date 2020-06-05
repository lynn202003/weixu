import xlrd
class Excel():
    '''从excel中读取数据'''
    def __init__(self,excelpath,sheetname):
        self.path=xlrd.open_workbook(excelpath)   #打开表格
        self.table=self.path.sheet_by_name(sheetname)   #通过表名获取
        # 获取第一行作为 key 值
        self.keys=self.table.row_values(0)
        #获取总行数
        self.rownum=self.table.nrows
        #获取总列数
        self.colnum=self.table.ncols

    def login_data(self):
        if self.rownum<=1:
            print("总行数小于1")
        else:
            c=[]
            for i in range(1,self.rownum):  #第一行为标题（第一行为0），所以从第二行开始
               s={}
               # 从第二行取对应 values 值
               values=self.table.row_values(i)
               for x in range(self.colnum):
                   s[self.keys[x]]=values[x]
               a=s["username"]
               b=s["password"]
               c.append(s)
            c.append(s)
            return c

if __name__ == '__main__':
    data=Excel("D:\工作文件\处处有码\login.xls","userdata")
    print(data.login_data())
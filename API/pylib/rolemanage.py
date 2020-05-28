#coding:utf-8
import requests
import json
from API import getcwd
from API.log.log import log1
from API.pylib.common import *
from API.cfg import *
from random import randint
from datetime import datetime

class rolemanage():
    def __init__(self,token):
        self.token=token
    def GetAllSysMenu(self,url,**params):
        '''获取权限菜单列表'''
        URL=f'{url}/api/SysMenus/GetAllSysMenu'
        # params={"menuId":menuId}
        resp=requests.get(URL,headers={'Content-Type': 'application/json','Authorization':self.token},params=params)
        result=resp.json()
        if ("data" in result) and result["data"]["totalSize"]>=1:
            log1.info("成功获取权限菜单列表")
            return result
        elif ("data" in result) and result["data"]["totalSize"]==0:
            log1.info(f"传入的参数错误，传入值为{params}")
            return result
        elif "error_msg" in result:
            log1.info(f"传入的参数是{params}")
            return result
        else:
            log1.error("获取权限菜单列表失败",exc_info=1)

    def SetToken(self,newToken):
        self.token=newToken

    def AddSysRole(self, url,**data):
        '''创建角色'''
        URL = f'{url}/api/SysRoles/AddSysRole'
        jsoninfo = json.dumps(data)
        resp = requests.post(URL, headers={'Content-Type': 'application/json', 'Authorization': self.token}, data=jsoninfo)
        result = resp.json()
        print(result)
        if ("error_msg" in result) and result["error_msg"] == '新增成功！' and "roleId" in result["data"]:
            log1.info(f"新增成功，返回信息是{result}")
            return result
        elif ("error_msg" in result) and "已占用" in result["error_msg"]:
            log1.info(f"角色名已占用,传入的参数是{data}")
            return result
        elif ("error_msg" in result) and result["error_msg"]=="角色名不能为空！":
            log1.info(f"角色名不能为空,传入的参数是{data}")
            return result
        elif ("error_msg" in result) and result["error_msg"]=="角色名最多不能超过8个字符！":
            log1.info(f"角色名不能超过8个字符,传入的参数是{data}")
            return result
        elif ("error_msg" in result) and result["error_msg"]=="角色说明最多不能超过21个字符！":
            log1.info(f"角色说明不能超过21个字符,传入的参数是{data}")
            return result
        elif "error_msg" in result:
            log1.info(f"返回的响应结果是{result},传入的参数是{data}")
            return result
        else:
            log1.error("新增失败", exc_info=1)


    def GetRoleList(self, url,**params):
        '''获取角色列表'''
        URL = f'{url}/api/SysRoles/GetRoleList'
        # data = {"roleName": roleName, "remark": remark, "roleRights": roleRights}
        resp = requests.get(URL, headers={'Content-Type': 'application/json', 'Authorization':self.token},params=params)
        result = resp.json()
        print(result)
        if "data" in result and result["data"]["totalSize"]>=1:
            log1.info(f"获取角色列表成功，返回信息是{result}")
            return result
        elif "title" in result:
            log1.info(f"参数错误，传入的参数是{params}")
            return result
        else:
            log1.error("获取角色列表失败", exc_info=1)


    def DeleteSysRole(self, url,**data):
        '''删除某个角色'''
        URL = f'{url}/api/SysRoles/DeleteSysRole'
        jsoninfo = json.dumps(data)
        resp = requests.post(URL, headers={'Content-Type': 'application/json', 'Authorization': self.token}, data=jsoninfo)
        result = resp.json()
        if ("error_msg" in result) and result["error_msg"] == '删除成功！':
            log1.info(f"删除成功，返回信息是{result}")
            return result
        elif ("error_msg" in result) and result["error_msg"]=="该角色下含有子账号，您无法删除！":
            log1.info("该角色下含有子账号，您无法删除")
            return result
        elif "traceId" in result:
            log1.info(f"参数错误，传入的参数为{data}")
            return result
        elif "error_msg" in result:
            log1.info(f"传入的参数是{data}")
            return result
        else:
            log1.error("删除失败", exc_info=1)


    def Delete_ALLSysRole(self,url,pageSize):
        '''删除所有角色'''
        page_idx=1
        while True:
            getallrole=self.GetRoleList(url,roleName="",orderBy="createTime_asc",pageSize=pageSize,pageNum=page_idx)
            # 删除时作判断，如果无子帐号直接删除，如果有子帐号，先查看该角色下的所有子帐号，循环一个一个对子帐号进行冻结，然后再次删除
            cnt=0
            for one in getallrole["data"]["list"]:
                rolelist=self.DeleteSysRole(url,roleId=one["roleId"])
                log1.info(rolelist)
                if ("error_msg" in rolelist) and rolelist["error_msg"]=="该角色下含有子账号，您无法删除！":
                    pass
                else:
                    cnt+=1
            if cnt==0:
                #获取页数，把记录条数的总数对一页的数量取余，能整除就算除法，不能整除就取整
                if getallrole["data"]["totalSize"]%pageSize==0:
                    pages=getallrole["data"]["totalSize"]/pageSize
                else:
                    pages = getallrole["data"]["totalSize"]//pageSize+1
                # pages=(getallrole["data"]["totalSize"]+9)/pageSize
                if page_idx<pages:
                    page_idx+=1
                else:
                    break



            #         getrolelist=self.GetRoleUserList(url,roleId=one["roleId"])
            #         for i in getrolelist["data"]["list"]:
            #             a = childusermanage(self.token)
            #             a.UpdateSysUserStatus(url,userId=i['userId'],status="1")
            #         self.DeleteSysRole(url, roleId=one["roleId"])
            # again_getallrole = self.GetRoleList(url, roleName="", orderBy="createTime_asc", pageSize=10, pageNum=1)
            # if again_getallrole["data"]["totalSize"] == 0:
            #     log1.info("所有角色删除干净")
            # elif again_getallrole["data"]["totalSize"] > 0:
            #     log1.info(f"角色没有删除干净,返回结果{again_getallrole}")
            # else:
            #     log1.error("删除角色时失败", exc_info=1)



        #             a.UpdateSysUser(url,userId=i["userId"],name="t20",roleId=roleid)
        #             afterrollist=self.GetRoleUserList(url, roleId=one["roleId"])
        #             if ("data" in afterrollist) and afterrollist["data"]["totalSize"]=="0":
        #                 log1.info("该角色下已没有子帐号")
        #                 self.DeleteSysRole(url, roleId=one["roleId"])
        #             else:
        #                 log1.error("该角色下还存在子帐号或者编辑子帐号失败")
        # again_getallrole = self.GetRoleList(url, roleName="", orderBy="createTime_asc", pageSize=10, pageNum=1)
        # if again_getallrole["data"]["totalSize"]==0:
        #     log1.info("所有角色删除干净")
        # elif again_getallrole["data"]["totalSize"]>0:
        #     log1.info(f"角色没有删除干净,返回结果{again_getallrole}")
        # else:
        #     log1.error("删除角色时失败",exc_info=1)

    def Check_Sort(self,url,str_oder):
        '''检查排序时间'''
        page_idx=1
        pre=None
        while True:
            getallrole=self.GetRoleList(url,roleName="",orderBy=str_oder,pageSize=10,pageNum=page_idx)


            oder_by = str_oder.split('_')

            if len(getallrole["data"]["list"]) ==0:
                break;
            if not pre:
                pre = datetime.strptime(getallrole["data"]["list"][0][oder_by[0]], "%Y-%m-%d %H:%M:%S")

            for one in getallrole["data"]["list"]:
                t2=datetime.strptime(one[oder_by[0]],"%Y-%m-%d %H:%M:%S")
                delta=t2-pre
                pre=t2
                if oder_by[1] == "asc" and delta.total_seconds() < 0:
                    return False
                elif oder_by[1] == "desc" and delta.total_seconds() > 0:
                    return  False

            page_idx+=1

        return True

    def GetRoleUserList(self, url,**params):
        '''查看子账号'''
        URL = f'{url}/api/SysRoles/GetRoleUserList'
        resp = requests.get(URL, headers={'Content-Type': 'application/json', 'Authorization': self.token},params=params )
        result = resp.json()
        print(result)
        if "data" in result and result["data"]["totalSize"]>=0:
            log1.info(f"查看子帐号成功，返回信息是{result}")
            return result
        elif "data" in result and result["data"]["totalSize"]==0:
            log1.info(f"返回的消息是{result},传入的参数是{params}")
            return result
        elif "error_msg" in result:
            log1.info(f"返回的消息是{result},传入的参数是{params}")
            return result
        else:
            log1.error("无法查看子帐号", exc_info=1)

    def UpdateSysRole(self, url, **data):
        '''编辑角色'''
        URL = f'{url}/api/SysRoles/UpdateSysRole'
        jsoninfo=json.dumps(data)
        resp = requests.post(URL, headers={'Content-Type': 'application/json', 'Authorization': self.token}, data=jsoninfo)
        result = resp.json()
        print(result)
        if ("error_msg" in result) and result["error_msg"] == '更新成功！' and "roleId" in result["data"]:
            log1.info(f"编辑角色成功，返回信息是{result}")
            return result
        elif "error_msg" in result:
            log1.info(f"返回的信息是{result},传入的参数是{data}")
            return result
        else:
            log1.error("编辑角色失败", exc_info=1)

    def create_twentyrole(self,url,number,rolename,remark,rolerights):
        '''生成20个角色'''
        for one in range(0,number):
            rand = randint(1000, 1999)
            self.AddSysRole(url,roleName=rolename+str(rand), remark=remark, roleRights=rolerights)



    def suitesetup(self,url,userName,name,password):
        '''初始化条件中创建一个子帐号用'''
        from API.pylib.childusermanage import childusermanage
        getrolelist=self.GetRoleList(url,roleName="",orderBy="updateTime_desc",pageSize=10,pageNum=1)
        a=childusermanage(common.token)
        a.AddSysUser(url,userName=userName,name=name,password=password,roleId=getrolelist["data"]["list"][0]["roleId"])


if __name__ == '__main__':
    b=rolemanage(common.token)
    # b.GetAllSysMenu("http://192.168.0.247","1")
    #b.AddSysRole("http://222.66.148.78:58080", roleName="rrr", remark="rtr", roleRights="4,5,7,9")
    # b.DeleteSysRole("http://192.168.0.247",roleId="f1cb1a689f2a4b57bcf8761b350c0ffc")
    # b.GetRoleList("http://192.168.0.247",roleName="",orderBy="createTime_asc",pageSize=10,pageNum=1)
    # b.UpdateSysRole("http://192.168.0.247", roleId="a6ea44d401fb4e96a7c181dda0061e5f",roleName="rrras2", remark="rtr", roleRights="4,5,7,9")
    # b.GetRoleUserList("http://192.168.0.247", roleId="a6ea44d401fb4e96a7c181dda0061e5f")
    b.Delete_ALLSysRole("http://222.66.148.78:58080",20)
    # rlt=b.Check_Sort("http://222.66.148.78:58080","createTime_desc")
    # print(rlt)
    # b.create_twentyrole("http://192.168.0.247","mmm","uiou","4,5,6")
#coding:utf-8
import requests
import json
from API import getcwd
from API.log.log import log1
from API.pylib.common import *
from API.cfg import *
class vipManage():
    def __init__(self,token):
        self.token=token

    def getPackageList(self,url,**params):
        '''获取套餐列表'''
        URL=f'{url}/api/vipManage/getPackageList'
        resp=requests.get(URL,headers={'Content-Type': 'application/json','Authorization':self.token},params=params)
        result=resp.json()
        if "data" in result and result["data"]["totalSize"]>=0:
            log1.info("成功获取套餐列表")
            return result
        else:
            log1.error(f"获取套餐列表失败,返回结果是{result},传入的参数是{params}",exc_info=1)


    def addPackage(self,url,**data):
        '''添加套餐'''
        URL=f'{url}/api/vipManage/addPackage'
        jsoninfo=json.dumps(data)
        resp=requests.post(URL,headers={'Content-Type': 'application/json','Authorization':self.token},data=jsoninfo)
        result=resp.json()
        if "error_msg" in result and result["error_msg"]=="新增成功！":
            log1.info(f"套餐添加成功,返回信息处理为{result}")
            return result
        elif "title" in result:
            log1.info(f"参数格式错误，传入的参数是{data}")
            return result
        elif "error_msg" in result:
            log1.info(f"参数错误，传入的参数是{data}")
            return result
        else:
            log1.error(f"套餐添加失败，返回值是{result},传入的参数是{data}",exc_info=1)

    def updatePackageInfo(self,url,**data):
        '''编辑套餐'''
        URL=f'{url}/api/vipManage/updatePackageInfo'
        jsoninfo=json.dumps(data)
        resp=requests.post(URL,headers={'Content-Type': 'application/json','Authorization':self.token},data=jsoninfo)
        result=resp.json()
        if "error_msg" in result and result["error_msg"] == "更新成功！":
            log1.info("套餐编辑成功")
            return result
        elif "error_msg" in result:
            log1.info(f"参数错误，传入的参数是{data}")
            return result
        elif "title" in result:
            log1.info(f"参数格式错误，传入的参数是{data}")
            return result
        else:
            log1.error(f"套餐编辑失败，返回值是{result},传入的参数是{data}", exc_info=1)


    def updatePackageIndex(self,url,**params):
        '''更新套餐显示顺序'''
        URL=f'{url}/api/vipManage/updatePackageIndex'
        resp=requests.get(URL,headers={'Content-Type': 'application/json','Authorization':self.token},params=params)
        result=resp.json()
        if "data" in result:
            log1.info("更新套餐显示顺序成功")
            return result
        else:
            log1.error(f"更新套餐显示顺序失败，返回值是{result},传入的参数是{params}", exc_info=1)



    def putOnPackageInfo(self,url,**params):
        '''上架套餐'''
        URL=f'{url}/api/vipManage/putOnPackageInfo'
        resp=requests.get(URL,headers={'Content-Type': 'application/json','Authorization':self.token},params=params)
        result=resp.json()
        if "error_msg" in result and result["error_msg"]=="上架成功！":
            log1.info("上架套餐成功")
            return result
        elif "error_msg" in result:
            log1.info(f"参数错误，传入的参数是{params}")
            return result
        elif "title" in result:
            log1.info(f"参数格式错误，传入的参数是{params}")
            return result
        else:
            log1.error(f"上架套餐失败，返回值是{result},传入的参数是{params}", exc_info=1)



    def pullOffPackageInfo(self,url,**params):
        '''下架套餐'''
        URL=f'{url}/api/vipManage/pullOffPackageInfo'
        resp=requests.get(URL,headers={'Content-Type': 'application/json','Authorization':self.token},params=params)
        result=resp.json()
        if "error_msg" in result and result["error_msg"]=="下架成功！":
            log1.info("下架套餐成功")
            return result
        elif "error_msg" in result:
            log1.info(f"参数错误，传入的参数为{params}")
            return result
        elif "title" in result:
            log1.info(f"参数格式错误，传入的参数为{params}")
            return result
        else:
            log1.error(f"下架套餐失败，返回值是{result},传入的参数是{params}",exc_info=1)


    def deletePackageInfo(self,url,**params):
        '''删除套餐'''
        URL=f'{url}/api/vipManage/deletePackageInfo'
        resp=requests.get(URL,headers={'Content-Type': 'application/json','Authorization':self.token},params=params)
        result=resp.json()
        if "error_msg" in result and result["error_msg"]=='删除成功！':
            log1.info("删除套餐成功")
            return result
        elif "title" in result:
            log1.info(f"参数格式错误，传入的参数是{params}")
            return result
        elif "error_msg" in result:
            log1.info(f"参数错误.传入的参数是{params}")
            return result
        else:
            log1.error(f"删除套餐失败，返回值是{result},传入的参数是{params}", exc_info=1)


    def GetPackage(self,url,**params):
        '''获取套餐信息'''
        URL=f'{url}/api/vipManage/GetPackage'
        resp=requests.get(URL,headers={'Content-Type': 'application/json','Authorization':self.token},params=params)
        result=resp.json()
        if ("data" in result) and ("packageId" in result["data"]):
            log1.info("删除套餐成功")
            return result
        elif "error_msg" in result:
            log1.info(f"参数错误，传入的参数是{params}")
            return result
        elif "title" in result:
            log1.info(f"参数格式错误，传入的参数是{params}")
            return result
        else:
            log1.error(f"删除套餐失败，返回值是{result},传入的参数是{params}", exc_info=1)

if __name__ == '__main__':
      c=vipManage(common.token)
      # c.getPackageList(local_url,productType="1",vipCycle="31",packageName="基础版",orderBy="createDate_desc",pageSize=10,pageNum=1)
      c.addPackage(local_url,productType="1",package="测试套餐1",vipCycle="31",nowPrice=1,originalPrice=1,isRecommend=2)
      # c.updatePackageInfo(local_url,packageId=6,productType="1",package="测试套餐1",vipCycle="31",nowPrice=1.2,originalPrice=1,isRecommend=1)
      # c.updatePackageIndex(local_url,packageId1=6,showIndex1=,packageId2=,showIndex2=)


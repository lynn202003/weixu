# coding: utf-8
import requests
import json
from API import getcwd
from API.log.log import log1
from API.pylib.common import *
from API.cfg import *
class ordermanage():
    def __init__(self,token):
        self.token=token

    def getOrderList(self,url,**params):
        '''订单列表'''
        URL=f'{url}/api/order/getOrderList'
        resp=requests.get(URL,headers={'Content-Type': 'application/json','Authorization':self.token},params=params)
        result=resp.json()
        if "totalSize" in result["data"]:
            log1.info("成功获取订单列表")
            return result

        else:
            log1.error("获取订单列表失败")

if __name__ == '__main__':
    c=ordermanage(common.token)
    c.getOrderList(local_url)


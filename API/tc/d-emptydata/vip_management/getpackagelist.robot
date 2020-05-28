*** Settings ***
Variables  API/pylib/common.py
Library  API.pylib.vipManage   ${common.token}
Variables  API/cfg.py

*** Test Cases ***
获取套餐列表---pack0007
#前提是已经有套餐列表的数据,微续=1、处处有码=2
    [Tags]    冒烟测试
    [Documentation]     正常获取套餐列表
    ${getagelist}     getPackageList      ${local_url}     productType=1    vipCycle=31    packageName=基础版     orderBy=createDate_desc     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---pack0007001
    [Documentation]     获取套餐列表时productType为空
    ${getagelist}     getPackageList      ${local_url}     productType=${EMPTY}    vipCycle=31    packageName=基础版     orderBy=createDate_desc     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时productType为空格
    ${getagelist}     getPackageList      ${local_url}     productType=${SPACE}    vipCycle=31    packageName=基础版     orderBy=createDate_desc     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时productType参数不传
    ${getagelist}     getPackageList      ${local_url}      vipCycle=31    packageName=基础版     orderBy=createDate_desc     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时productType参数为数字
    ${getagelist}     getPackageList      ${local_url}     productType=1      vipCycle=31    packageName=基础版     orderBy=createDate_desc     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时productType参数为字母
    ${getagelist}     getPackageList      ${local_url}     productType=jili      vipCycle=31    packageName=基础版     orderBy=createDate_desc     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时productType参数为中文
    ${getagelist}     getPackageList      ${local_url}     productType=中国     vipCycle=31    packageName=基础版     orderBy=createDate_desc     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时vipCycle参数为空
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=${EMPTY}    packageName=基础版     orderBy=createDate_desc     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时vipCycle参数为空格
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=${SPACE}    packageName=基础版     orderBy=createDate_desc     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时vipCycle参数不传
    ${getagelist}     getPackageList      ${local_url}     productType=2     packageName=基础版     orderBy=createDate_desc     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0


获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时vipCycle参数为数字
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=366     packageName=基础版     orderBy=createDate_desc     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0


获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时vipCycle参数为字母
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=ko     packageName=基础版     orderBy=createDate_desc     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时vipCycle参数为中文
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=中文     packageName=基础版     orderBy=createDate_desc     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时packageName参数为空
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=13    packageName=${EMPTY}     orderBy=createDate_desc     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0


获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时packageName参数为空格
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=13    packageName=${SPACE}     orderBy=createDate_desc     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0


获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时packageName参数不传
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=13     orderBy=createDate_desc     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0


获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时packageName参数为英文
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=13      packageName=kok     orderBy=createDate_desc     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时packageName参数为字符
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=13      packageName=$#%     orderBy=createDate_desc     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时orderBy参数为空
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=13      packageName=基础版     orderBy=${EMPTY}     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时orderBy参数为空格
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=13      packageName=基础版     orderBy=${SPACE}     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时orderBy参数不传
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=13      packageName=基础版         pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时orderBy参数为createDate_desc
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=13      packageName=基础版     orderBy=createDate_desc     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时orderBy参数为createDate_asc
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=13      packageName=基础版     orderBy=createDate_asc     pageSize=10      pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时pageSize为空
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=13      packageName=基础版     orderBy=createDate_asc     pageSize=${EMPTY}     pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时pageSize为空格
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=13      packageName=基础版     orderBy=createDate_asc     pageSize=${SPACE}     pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时pageSize参数不传
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=13      packageName=基础版     orderBy=createDate_asc        pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时pageSize为每页包含的记录数
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=13      packageName=基础版     orderBy=createDate_asc     pageSize=10    pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时pageSize为每页不包含的记录数
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=13      packageName=基础版     orderBy=createDate_asc     pageSize=60    pageNum=1
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时pageNum为空
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=13      packageName=基础版     orderBy=createDate_asc     pageSize=10    pageNum=${EMPTY}
    should be true       $getagelist["data"] >=0


获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时pageNum为空格
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=13      packageName=基础版     orderBy=createDate_asc     pageSize=10    pageNum=${SPACE}
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时pageNum参数不传
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=13      packageName=基础版     orderBy=createDate_asc     pageSize=10
    should be true       $getagelist["data"] >=0

获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时pageNum为存在的页码
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=13      packageName=基础版     orderBy=createDate_asc     pageSize=10    pageNum=1
    should be true       $getagelist["data"] >=0


获取套餐列表---usermanage0001
    [Documentation]     获取套餐列表时pageNum为不存在的页码
    ${getagelist}     getPackageList      ${local_url}     productType=2    vipCycle=13      packageName=基础版     orderBy=createDate_asc     pageSize=10    pageNum=100
    should be true       $getagelist["data"] >=0
# salt-minion初始化
> 基于cloudinit

## 部署方式说明

### 部署方式一:  支持ssh连接 可以远程连接master

#### 配置文件

- id_rsa  ssh私钥
- config-salt.tpl  初始化安装salt-minion基础配置模板 
  涉及三个部分
    - yum源安装
    - master主机ip
    - role 角色定义
- remote.sh  salt-minion安装完成以后 执行sls部署下发任务
  - 说明: 需要在执行脚本配置对应的salt-api地址以及下发的任务对象,其中涉及对指定minion角色下发任务的 可以在
  主文件main.tf中 执行脚本携带参数 ,如下面脚本 web为指定角色, iftop 为指定执行的sls文件
``` demo shell
  provisioner "file" {
    source      = "remote.sh"
    destination = "/tmp/remote.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/remote.sh",
      "/tmp/remote.sh web iftop",
    ]
  }
```

### 部署方式二: 支持salt-api 远程访问

###配置文件

- id_rsa  ssh私钥
- config-salt.tpl  初始化安装salt-minion基础配置模板 
  涉及三个部分
    - yum源安装
    - master主机ip
    - role 角色定义
    
-  部署完成以后远程调用salt-api  方式为iac自定义pipeline
   - 说明: 可以把要执行的curl命令放入pipeline中去执行
   - demo 执行的sls文件如iftop.sls所示 安装iotop
   - 此处执行curl命令执行 sleep 60s 保证salt-minion安装完成
``` curldemo
 curl -k http://www.toutiao.com -vvv  -H "Accept: application/json"  -H "Content-Type:application/json" -X POST --data '{"client": "local", "fun": "state.sls", "eauth":"pam", "username":"saltapi","password":"saltapi", "tgt":"*"}'
 
 curl -k http://www.baidu.com -vvv  -H "Accept: application/json"  -H "Content-Type:application/json" -X POST --data '{"client": "local", "fun": "state.sls", "eauth":"pam", "username":"saltapi","password":"saltapi", "tgt":"role:web", "tgt_type":"grain", "arg":"iftop"}'

``` 

   



  
  
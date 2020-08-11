### **清风自动化测试执行节点框架入门** 

- **知识准备** 

1. 了解mysql环境搭建
2. 了解idea IDE环境搭建


- **测试执行框架搭建** 

1. 访问git资源，并将其导入idea IDE中。
2. 搭建好本地的mysql数据库，新建一个用户test，密码设置为test1234，设置为管理员权限。
3. 启动并进入mysql，执行下列sql文件：

- /deploy/scripts/qfsoft_db_timp.sql
- /deploy/scripts/qfsoft_db_atmp.sql

4. 将libs目录中的jar包导入到idea项目工程中的Libraries中。
5. 该项目已写好一个演示测试用例，直接运行下列执行类即可：  
 **com.qfsoft.qfsoft_app_atev.test.DebugCase**  
此时测试框架就可以单独跑起来了~

- **管理节点搭建**  

如果想进一步搭建本地可视化测试管理节点服务，可以继续查看下列开源项目：
[https://github.com/polohelcly/qfsoft_web_atmv](https://github.com/polohelcly/qfsoft_web_atmv)

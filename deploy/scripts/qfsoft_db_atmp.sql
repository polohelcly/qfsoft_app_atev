/*
SQLyog Community
MySQL - 10.3.12-MariaDB-log : Database - qfsoft_db_atmp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `qfsoft_db_atmp`;

/*Table structure for table `t_base_cache` */

DROP TABLE IF EXISTS `t_base_cache`;

CREATE TABLE `t_base_cache` (
  `cache_id` varchar(64) NOT NULL,
  `cache_key` varchar(128) DEFAULT NULL,
  `cache_value` text DEFAULT NULL,
  `last_status` varchar(32) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_base_cache` */

/*Table structure for table `t_base_module` */

DROP TABLE IF EXISTS `t_base_module`;

CREATE TABLE `t_base_module` (
  `module_id` varchar(64) NOT NULL,
  `parent_id` varchar(64) DEFAULT NULL,
  `module_code` varchar(128) DEFAULT NULL,
  `module_name` varchar(1024) DEFAULT NULL,
  `module_type` varchar(32) DEFAULT NULL,
  `tester` varchar(128) DEFAULT NULL,
  `last_status` varchar(32) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_base_module` */

insert  into `t_base_module`(`module_id`,`parent_id`,`module_code`,`module_name`,`module_type`,`tester`,`last_status`,`memo`) values 
('28bb518f-6985-11e4-8943-54dd5a29be40',NULL,'1','所有功能','menu',NULL,'enabled',NULL),
('e3212044-843a-11e8-9c96-0242ac110004','28bb518f-6985-11e4-8943-54dd5a29be40','X_01','演示功能','menu',NULL,'enabled',NULL),
('fbe198ac-843a-11e8-9c96-0242ac110004','e3212044-843a-11e8-9c96-0242ac110004','X_01_001','百度搜索验证','node','chenjinjun','enabled',NULL);

/*Table structure for table `t_base_node` */

DROP TABLE IF EXISTS `t_base_node`;

CREATE TABLE `t_base_node` (
  `node_id` varchar(64) NOT NULL,
  `node_name` varchar(1024) DEFAULT NULL,
  `node_type` varchar(32) DEFAULT NULL,
  `node_ip` varchar(32) DEFAULT NULL,
  `last_status` varchar(32) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_base_node` */

insert  into `t_base_node`(`node_id`,`node_name`,`node_type`,`node_ip`,`last_status`,`memo`) values 
('49205851-66a3-11e9-8c64-000c29d6aa4f','测试执行节点_at1.windows','windows','127.0.0.1','enabled',NULL);

/*Table structure for table `t_base_param` */

DROP TABLE IF EXISTS `t_base_param`;

CREATE TABLE `t_base_param` (
  `param_id` varchar(64) NOT NULL,
  `param_type` varchar(32) DEFAULT NULL,
  `param_key` varchar(128) DEFAULT NULL,
  `param_value` text DEFAULT NULL,
  `last_status` varchar(32) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`param_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_base_param` */

insert  into `t_base_param`(`param_id`,`param_type`,`param_key`,`param_value`,`last_status`,`memo`) values 
('81c83afe-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_client.appium','android','enabled',''),
('81e0d880-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_client.appium.android','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nPlatformVersion = 8.1\r\nDeviceName = MI 8\r\nAppPackage = com.android.calculator2\r\nAppActivity = .Calculator\r\nServerUrl = http://127.0.0.1:4723/wd/hub\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('81ef4f7f-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_client.appium.ios','','enabled',''),
('8203adb5-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_client.appium.windows','','enabled',''),
('820d7640-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_client.selenium','chrome','enabled',''),
('820fba42-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_client.selenium.phantomjs','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nClientDriver = /data/project/automation/product/driver/PhantomJsDriver_Linux_x64\r\nClientAgent = Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('8212a91d-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_attachpath','/data/project/nginx/www/attach/atev','enabled',''),
('8213cc65-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_atevurl','http://${SERVER_IP()}:8080/qfsoft_app_atev','enabled',''),
('8214d5ee-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_client.selenium.firefox','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nClientDriver = /data/project/automation/product/driver/FirefoxDriver_WIN_x64.exe\r\nClientBinaryPath = /data/project/automation/product/client/MozillaFirefox/firefox.exe\r\nClientProfilePath = c:\\Users\\0424\\appData\\Roaming\\Mozilla\\Firefox\\Profiles\\hw4x9hjf.default\r\nArguments = --disable-gpu\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('82194564-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_client.http','chrome','enabled',''),
('821c10df-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_client.http.firefox','Snapshot_Switch = on\r\nSnapshot_Type = html\r\nClientAgent = Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0','enabled',''),
('821d24d8-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_client.http.ie','Snapshot_Switch = on\r\nSnapshot_Type = html\r\nClientAgent = Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Safari/537.36 Edge/13.10586','enabled',''),
('821ee187-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_client.http.edge','Snapshot_Switch = on\r\nSnapshot_Type = html\r\nClientAgent = Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','enabled',''),
('82204bdc-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_client.http.chrome','Snapshot_Switch = on\r\nSnapshot_Type = html\r\nClientAgent = Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36','enabled',''),
('8221cd31-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_attachurl','http://${SERVER_IP()}/attach/atev','enabled',''),
('8224a519-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_server','737e1eb2-518d-11e7-9ab3-000c29ce8469','enabled',''),
('8226a7db-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_client.robot','linux','enabled',''),
('8227d159-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_client.robot.linux','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nObject_Path = /data/project/automation/product\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('82294543-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_client.robot.windows','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nObject_Path = d:\\project\\automation\\product\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('822a2c1d-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_client.selenium.ie','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nClientDriver = /data/project/automation/product/driver/IEDriver_WIN_x64.exe\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('822cea7e-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_client.selenium.edge','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nClientDriver = /data/project/automation/product/driver/EdgeDriver_WIN_x64.exe\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('822e7f62-5612-11e9-a1d6-000c29d6aa4f','centos','localconfig_client.selenium.chrome','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nClientDriver = /data/project/automation/product/driver/ChromeDriver_Linux_x64\r\nClientBinaryPath = /usr/bin/google-chrome-stable\r\nArguments = disable-infobars,--disable-gpu,--headless,--no-sandbox,window-size=1366x768,--hide-scrollbars,blink-settings=imagesEnabled=false\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('8fd40f59-ef84-11ea-b1be-000c29d6aa4f','centos','localconfig_task.function','X_01_001.C11001,function,java.code,auto,1,1','enabled',''),
('93960c34-ef84-11ea-b1be-000c29d6aa4f','windows','localconfig_task.function','X_01_001.C11001,function,java.code,auto,1,1','enabled',''),
('f8522312-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_client.appium','android','enabled',''),
('f854107f-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_client.appium.android','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nPlatformVersion = 8.1\r\nDeviceName = MI 8\r\nAppPackage = com.android.calculator2\r\nAppActivity = .Calculator\r\nServerUrl = http://127.0.0.1:4723/wd/hub\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('f85673ac-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_client.appium.ios','','enabled',''),
('f858c4ee-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_client.appium.windows','','enabled',''),
('f85b0fdc-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_client.selenium','chrome','enabled',''),
('f85cf4c6-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_client.selenium.phantomjs','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nClientDriver = d:\\project\\automation\\product\\driver\\PhantomJsDriver_Win_x32.exe\r\nClientAgent = Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('f862a80f-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_attachpath','d:\\git_client\\gitee\\nginx.www\\attach\\atev','enabled',''),
('f866d58a-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_atevurl','http://${SERVER_IP()}:9280/qfsoft_app_atev','enabled',''),
('f86912fd-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_client.selenium.firefox','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nClientDriver = d:\\project\\automation\\product\\driver\\FirefoxDriver_WIN_x64.exe\r\nClientBinaryPath = d:\\project\\automation\\product\\client\\MozillaFirefox\\firefox.exe\r\nClientProfilePath = c:\\Users\\0424\\appData\\Roaming\\Mozilla\\Firefox\\Profiles\\hw4x9hjf.default\r\nArguments = --disable-gpu\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('f86b9826-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_client.http','chrome','enabled',''),
('f86da7ba-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_client.http.firefox','Snapshot_Switch = on\r\nSnapshot_Type = html\r\nClientAgent = Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0','enabled',''),
('f870555a-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_client.http.ie','Snapshot_Switch = on\r\nSnapshot_Type = html\r\nClientAgent = Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Safari/537.36 Edge/13.10586','enabled',''),
('f872a650-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_client.http.edge','Snapshot_Switch = on\r\nSnapshot_Type = html\r\nClientAgent = Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','enabled',''),
('f8753b8c-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_client.http.chrome','Snapshot_Switch = on\r\nSnapshot_Type = html\r\nClientAgent = Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36','enabled',''),
('f8777cdf-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_attachurl','http://${SERVER_IP()}/attach/atev','enabled',''),
('f87bd80b-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_server','737e1eb2-518d-11e7-9ab3-000c29ce8469','enabled',''),
('f87e270c-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_client.robot','windows','enabled',''),
('f88010a1-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_client.robot.linux','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nObject_Path = /data/project/automation/product\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('f881df3a-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_client.robot.windows','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nObject_Path = d:\\project\\automation\\product\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('f8837a25-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_client.selenium.ie','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nClientDriver = d:\\project\\automation\\product\\driver\\IEDriver_WIN_x64.exe\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('f8857ca0-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_client.selenium.edge','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nClientDriver = d:\\project\\automation\\product\\driver\\EdgeDriver_WIN_x64.exe\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('f8877fe5-5486-11e9-bcb7-000c29d6aa4f','windows','localconfig_client.selenium.chrome','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nClientDriver = d:\\project\\automation\\product\\driver\\ChromeDriver_Win_x32.exe\r\nClientBinaryPath = d:\\project\\automation\\product\\client\\GoogleChrome\\chrome.exe\r\nArguments = disable-infobars,--disable-gpu,--no-sandbox,window-size=1366x768,--hide-scrollbars,blink-settings=imagesEnabled=false\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled','');

/*Table structure for table `t_base_server` */

DROP TABLE IF EXISTS `t_base_server`;

CREATE TABLE `t_base_server` (
  `server_id` varchar(64) NOT NULL COMMENT '编号',
  `server_name` varchar(1024) DEFAULT NULL COMMENT '环境名称',
  `test_type` varchar(32) DEFAULT NULL COMMENT '环境类型，字典：server_type',
  `operator` varchar(128) DEFAULT NULL COMMENT '负责人',
  `last_status` varchar(32) DEFAULT NULL COMMENT '状态，字典：common_status',
  `memo` text DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_base_server` */

insert  into `t_base_server`(`server_id`,`server_name`,`test_type`,`operator`,`last_status`,`memo`) values 
('737e1eb2-518d-11e7-9ab3-000c29ce8469','功能测试环境','function','chenjinjun','enabled','');

/*Table structure for table `t_base_server_cache` */

DROP TABLE IF EXISTS `t_base_server_cache`;

CREATE TABLE `t_base_server_cache` (
  `server_cache_id` varchar(64) NOT NULL,
  `server_id` varchar(64) DEFAULT NULL,
  `cache_key` varchar(128) DEFAULT NULL,
  `cache_value` text DEFAULT NULL,
  `last_status` varchar(32) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`server_cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_base_server_cache` */

/*Table structure for table `t_base_server_config` */

DROP TABLE IF EXISTS `t_base_server_config`;

CREATE TABLE `t_base_server_config` (
  `server_config_id` varchar(64) NOT NULL,
  `detail_code` varchar(128) DEFAULT NULL,
  `detail_name` varchar(1024) DEFAULT NULL,
  `detail_type` varchar(32) DEFAULT NULL,
  `last_status` varchar(32) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`server_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_base_server_config` */

insert  into `t_base_server_config`(`server_config_id`,`detail_code`,`detail_name`,`detail_type`,`last_status`,`memo`) values 
('ff7b340e-f8d9-11ea-839b-000c29446980','baidu.service','百度-应用服务','service','enabled','');

/*Table structure for table `t_base_server_detail` */

DROP TABLE IF EXISTS `t_base_server_detail`;

CREATE TABLE `t_base_server_detail` (
  `server_detail_id` varchar(64) NOT NULL,
  `server_id` varchar(64) DEFAULT NULL,
  `detail_code` varchar(128) DEFAULT NULL,
  `detail_name` varchar(1024) DEFAULT NULL,
  `detail_type` varchar(32) DEFAULT NULL,
  `detail_value` text DEFAULT NULL,
  `last_status` varchar(32) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`server_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_base_server_detail` */

insert  into `t_base_server_detail`(`server_detail_id`,`server_id`,`detail_code`,`detail_name`,`detail_type`,`detail_value`,`last_status`,`memo`) values 
('233a476e-f8da-11ea-839b-000c29446980','737e1eb2-518d-11e7-9ab3-000c29ce8469','baidu.service','百度-应用服务','service','{\r\n	\"site\": \"https://www.baidu.com\"\r\n}','enabled','');

/*Table structure for table `t_node_param` */

DROP TABLE IF EXISTS `t_node_param`;

CREATE TABLE `t_node_param` (
  `param_id` varchar(64) NOT NULL,
  `node_id` varchar(64) DEFAULT NULL,
  `param_key` varchar(128) DEFAULT NULL,
  `param_value` text DEFAULT NULL,
  `last_status` varchar(32) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`param_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_node_param` */

insert  into `t_node_param`(`param_id`,`node_id`,`param_key`,`param_value`,`last_status`,`memo`) values 
('48268972-a558-11e9-a484-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_atevurl','http://${SERVER_IP()}:9280/qfsoft_app_atev','enabled',''),
('df36eea4-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_client.appium','android','enabled',''),
('df3c334c-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_client.appium.android','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nPlatformVersion = 8.1\r\nDeviceName = MI 8\r\nAppPackage = com.android.calculator2\r\nAppActivity = .Calculator\r\nServerUrl = http://127.0.0.1:4723/wd/hub\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('df3fbe30-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_client.appium.ios','','enabled',''),
('df41c605-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_client.appium.windows','','enabled',''),
('df447a5f-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_client.selenium','chrome','enabled',''),
('df47d430-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_client.selenium.phantomjs','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nClientDriver = d:\\project\\automation\\product\\driver\\PhantomJsDriver_Win_x32.exe\r\nClientAgent = Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('df49b8da-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_task.function','1_02_001.C11001,function,java.code,develop,1,1\n','enabled',''),
('df4c2a71-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_attachpath','d:\\git_client\\gitee\\nginx.www\\attach\\atev','enabled',''),
('df507154-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_client.selenium.firefox','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nClientDriver = d:\\project\\automation\\product\\driver\\FirefoxDriver_WIN_x64.exe\r\nClientBinaryPath = d:\\project\\automation\\product\\client\\MozillaFirefox\\firefox.exe\r\nClientProfilePath = c:\\Users\\0424\\appData\\Roaming\\Mozilla\\Firefox\\Profiles\\hw4x9hjf.default\r\nArguments = --disable-gpu\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('df529e88-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_client.http','chrome','enabled',''),
('df543b3b-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_client.http.firefox','Snapshot_Switch = on\r\nSnapshot_Type = html\r\nClientAgent = Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0','enabled',''),
('df55e999-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_client.http.ie','Snapshot_Switch = on\r\nSnapshot_Type = html\r\nClientAgent = Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Safari/537.36 Edge/13.10586','enabled',''),
('df57bb96-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_client.http.edge','Snapshot_Switch = on\r\nSnapshot_Type = html\r\nClientAgent = Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','enabled',''),
('df59b6e2-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_client.http.chrome','Snapshot_Switch = on\r\nSnapshot_Type = html\r\nClientAgent = Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36','enabled',''),
('df5b7cc3-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_attachurl','http://${SERVER_IP()}/attach/atev','enabled',''),
('df5f2254-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_server','737e1eb2-518d-11e7-9ab3-000c29ce8469','enabled',''),
('df60e39c-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_client.robot','windows','enabled',''),
('df62bebe-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_client.robot.linux','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nObject_Path = /data/project/automation/product\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('df64e8f9-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_client.robot.windows','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nObject_Path = d:\\project\\automation\\product\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('df669633-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_client.selenium.ie','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nClientDriver = d:\\project\\automation\\product\\driver\\IEDriver_WIN_x64.exe\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('df68f379-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_client.selenium.edge','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nClientDriver = d:\\project\\automation\\product\\driver\\EdgeDriver_WIN_x64.exe\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled',''),
('df6ac932-67d9-11e9-9da5-000c29d6aa4f','49205851-66a3-11e9-8c64-000c29d6aa4f','localconfig_client.selenium.chrome','Snapshot_Switch = on\r\nSnapshot_Type = jpg\r\nClientDriver = d:\\project\\automation\\product\\driver\\ChromeDriver_Win_x32.exe\r\nClientBinaryPath = d:\\project\\automation\\product\\client\\GoogleChrome\\chrome.exe\r\nArguments = disable-infobars,--disable-gpu,--headless,--no-sandbox,window-size=1366x768,--hide-scrollbars,blink-settings=imagesEnabled=false\r\nDelay_Time = 500\r\nDelay_Num = 50\r\nDelay_Num_Short = 25\r\nDelay_Num_Long = 100','enabled','');

/*Table structure for table `t_node_reporter` */

DROP TABLE IF EXISTS `t_node_reporter`;

CREATE TABLE `t_node_reporter` (
  `reporter_id` varchar(64) NOT NULL,
  `parent_id` varchar(64) DEFAULT NULL,
  `reporter_code` varchar(128) DEFAULT NULL,
  `reporter_name` varchar(1024) DEFAULT NULL,
  `reporter_value` text DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`reporter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_node_reporter` */

insert  into `t_node_reporter`(`reporter_id`,`parent_id`,`reporter_code`,`reporter_name`,`reporter_value`,`memo`) values 
('23327473-bc58-11e7-a95a-000c29cd7ff1',NULL,'1','所有报表',NULL,NULL),
('307e44e7-ff44-11e8-9a6f-0242ac110004','c98b2d48-bdea-11e7-92a2-000c29ce8469','1_01_001','测试结果汇总','/jsp/module/atmp/node/measure/reporter/reporter_tasklog-sum.jsp',NULL),
('c98b2d48-bdea-11e7-92a2-000c29ce8469','23327473-bc58-11e7-a95a-000c29cd7ff1','1_01','测试执行',NULL,NULL);

/*Table structure for table `t_node_task_log` */

DROP TABLE IF EXISTS `t_node_task_log`;

CREATE TABLE `t_node_task_log` (
  `task_log_id` varchar(64) NOT NULL,
  `server_id` varchar(64) DEFAULT NULL,
  `node_id` varchar(64) DEFAULT NULL,
  `batch_no` varchar(64) DEFAULT NULL,
  `module_code` varchar(128) DEFAULT NULL,
  `test_code` varchar(128) DEFAULT NULL,
  `test_type` varchar(32) DEFAULT NULL,
  `run_plugin` varchar(32) DEFAULT NULL,
  `test_status` varchar(32) DEFAULT NULL,
  `run_pos` int(4) DEFAULT NULL,
  `firetime_start` varchar(32) DEFAULT NULL,
  `firetime_end` varchar(32) DEFAULT NULL,
  `log_time` double(10,4) DEFAULT NULL,
  `log_data` mediumtext DEFAULT NULL,
  `log_result` varchar(32) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`task_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_node_task_log` */

/*Table structure for table `t_test_action` */

DROP TABLE IF EXISTS `t_test_action`;

CREATE TABLE `t_test_action` (
  `action_id` varchar(64) NOT NULL,
  `action_type` varchar(32) DEFAULT NULL,
  `action_code` varchar(128) DEFAULT NULL,
  `action_name` varchar(1024) DEFAULT NULL,
  `action_key` varchar(128) DEFAULT NULL,
  `last_status` varchar(32) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_test_action` */

insert  into `t_test_action`(`action_id`,`action_type`,`action_code`,`action_name`,`action_key`,`last_status`,`memo`) values 
('00502a83-db9a-11e6-a18d-000c29874a1a','selenium','waitfor_not_exist_short','等待不存在(短)','object','enabled',NULL),
('03238856-c111-11e6-b286-00505682d627','selenium','click','点击','object','enabled',NULL),
('0cc72046-cb65-11e6-b286-00505682d627','base','query_server','查询数据库','db_name,sql','enabled',NULL),
('2735c656-c111-11e6-b286-00505682d627','selenium','select','选择','object,value','enabled',NULL),
('3b196a27-db9a-11e6-a18d-000c29874a1a','selenium','is_waitfor_exist_short','等待是否存在(短)','object','enabled',NULL),
('40c04e96-d30e-11e6-b610-000c29874a1a','base','waitfor','等待延时','millisecond','enabled',NULL),
('435ba8c5-db9a-11e6-a18d-000c29874a1a','selenium','get_attri','获取属性','object,attri','enabled',NULL),
('43c088d9-d245-11e6-b610-000c29874a1a','http','get_param','获取关联参数','left,right,pos','enabled',NULL),
('4c8c1fa0-745d-11e8-9d5f-0242ac110004','appium','click','点击','object','enabled',NULL),
('4c8c2107-745d-11e8-9d5f-0242ac110004','appium','set_text','设置文本框','object,value','enabled',NULL),
('4c8c2138-745d-11e8-9d5f-0242ac110004','appium','get_text','获取文本框','object','enabled',NULL),
('582b595d-d328-11e6-b610-000c29874a1a','selenium','get_text2','获取文本框2','object','enabled',NULL),
('58f85139-b0f1-11e8-a5b6-0242ac110004','robot','click','点击','object','enabled',NULL),
('5b5fd37f-cb46-11e6-b286-00505682d627','http','get_text','获取文本框','object','enabled',NULL),
('5d97609e-b0f1-11e8-a5b6-0242ac110004','robot','drag','拖拽','object','enabled',NULL),
('60a13059-d326-11e6-b610-000c29874a1a','base','check_match','检查点-匹配变量','name,expect,real','enabled',NULL),
('60f8891a-d328-11e6-b610-000c29874a1a','http','get_text2','获取文本框2','object','enabled',NULL),
('67249ad4-b0f1-11e8-a5b6-0242ac110004','robot','set_text','设置文本框','object,value','enabled',NULL),
('7322d394-c825-11e6-b286-00505682d627','base','test_fun','测试功能','code,param','enabled',NULL),
('8df82bf1-d17e-11e6-b610-000c29874a1a','base','set_param','设置变量','key,value','enabled',NULL),
('9041150d-d17a-11e6-b610-000c29874a1a','base','run_shell','执行Shell','ip,port,user,pwd,cmd','enabled',NULL),
('9685941c-db9a-11e6-a18d-000c29874a1a','selenium','input_text','输入文本','value','enabled',NULL),
('96d34514-82ad-11e8-9c96-0242ac110004','http','send_get','请求GET','url','enabled',NULL),
('9816569c-87d7-11e8-9c96-0242ac110004','http','send_json','请求JSON','url,param','enabled',NULL),
('9bc35970-5369-11e8-b791-000c296b25ed','base','test_api','测试接口','api,path,query,body','enabled',NULL),
('a3ebca6d-cb18-11e6-b286-00505682d627','selenium','waitfor_exist','等待存在','object','enabled',NULL),
('a4067a01-cb18-11e6-b286-00505682d627','selenium','close_window','关闭窗口','','enabled',NULL),
('a422ab7e-cb18-11e6-b286-00505682d627','selenium','go_window','切换窗口','object','enabled',NULL),
('a43de2c1-cb18-11e6-b286-00505682d627','selenium','go_mainframe','切换主框架','','enabled',NULL),
('a45ac50a-cb18-11e6-b286-00505682d627','selenium','waitfor_exist_short','等待存在(短)','object','enabled',NULL),
('a5613381-cb18-11e6-b286-00505682d627','selenium','view','查看','object','enabled',NULL),
('a838c2d3-cb16-11e6-b286-00505682d627','selenium','refresh','刷新','','enabled',NULL),
('a85233a0-cb16-11e6-b286-00505682d627','selenium','set_prompt','设置对话框','value','enabled',NULL),
('a870ad38-cb16-11e6-b286-00505682d627','selenium','set','勾选','object,value','enabled',NULL),
('a88f320f-cb16-11e6-b286-00505682d627','selenium','set_text','设置文本框','object,value','enabled',NULL),
('a8abbd7e-cb16-11e6-b286-00505682d627','selenium','visit_exist','访问页面并出现','page,object','enabled',NULL),
('a8c61b2b-cb16-11e6-b286-00505682d627','selenium','upload','上传','object,filepath','enabled',NULL),
('a8e25b04-cb16-11e6-b286-00505682d627','selenium','eventjs','执行JS','jscript','enabled',NULL),
('a8facceb-cb16-11e6-b286-00505682d627','selenium','get_text','获取文本框','object','enabled',NULL),
('a9157364-cb16-11e6-b286-00505682d627','selenium','event','执行事件','object,event','enabled',NULL),
('a9f49f83-82ad-11e8-9c96-0242ac110004','http','send_post','请求POST','url,param','enabled',NULL),
('e1fb5c58-cb47-11e6-b286-00505682d627','base','check_equals','检查点-等于变量','name,expect,real','enabled',NULL),
('e6b5288b-db99-11e6-a18d-000c29874a1a','selenium','get_table','获取表格','object','enabled',NULL),
('e8b093db-db99-11e6-a18d-000c29874a1a','selenium','get_units','获取元素组','object','enabled',NULL),
('e8cc1892-db99-11e6-a18d-000c29874a1a','selenium','is_waitfor_enable','等待是否有效','object','enabled',NULL),
('e8ee4906-db99-11e6-a18d-000c29874a1a','http','is_exist','是否存在','object','enabled',NULL),
('e915a930-db99-11e6-a18d-000c29874a1a','selenium','is_waitfor_exist','等待是否存在','object','enabled',NULL),
('e934c69d-db99-11e6-a18d-000c29874a1a','selenium','waitfor_not_exist','等待不存在','object','enabled',NULL),
('e9575ec2-db99-11e6-a18d-000c29874a1a','http','get_params','获取关联参数组','left,right','enabled',NULL),
('f918d7ef-c110-11e6-b286-00505682d627','selenium','visit','访问页面','page','enabled',NULL),
('fdb9ba09-cb65-11e6-b286-00505682d627','base','edit_server','编辑数据库','db_name,sql','enabled',NULL);

/*Table structure for table `t_test_api` */

DROP TABLE IF EXISTS `t_test_api`;

CREATE TABLE `t_test_api` (
  `api_id` varchar(64) NOT NULL,
  `module_code` varchar(128) DEFAULT NULL,
  `test_code` varchar(128) DEFAULT NULL,
  `detail_code` varchar(128) DEFAULT NULL,
  `api_name` varchar(1024) DEFAULT NULL,
  `api_spec` text DEFAULT NULL,
  `last_status` varchar(32) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_test_api` */

insert  into `t_test_api`(`api_id`,`module_code`,`test_code`,`detail_code`,`api_name`,`api_spec`,`last_status`,`memo`) values 
('58927957-bc46-11e9-a0c6-000c29d6aa4f','X_01_001','A11001','baidu.service','查询百度搜索','{\r\n	\"url\": \"/s\",\r\n	\"method\": \"get\",\r\n	\"format\": \"form\",\r\n	\"header\": {},\r\n	\"data_path\": {},\r\n	\"data_param\": {\r\n		\"wd\": \"test\",\r\n		\"ie\": \"UTF-8\"\r\n	},\r\n	\"data_body\": {}\r\n}','enabled','');

/*Table structure for table `t_test_fun` */

DROP TABLE IF EXISTS `t_test_fun`;

CREATE TABLE `t_test_fun` (
  `fun_id` varchar(64) NOT NULL,
  `module_code` varchar(128) DEFAULT NULL,
  `test_code` varchar(128) DEFAULT NULL,
  `fun_name` varchar(1024) DEFAULT NULL,
  `param_body` text DEFAULT NULL,
  `last_status` varchar(32) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`fun_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_test_fun` */

insert  into `t_test_fun`(`fun_id`,`module_code`,`test_code`,`fun_name`,`param_body`,`last_status`,`memo`) values 
('41ffec64-bb0b-11e9-a0c6-000c29d6aa4f','X_01_001','F11001','执行百度搜索','{\"关键字\":\"test\"}','enabled','');

/*Table structure for table `t_test_object` */

DROP TABLE IF EXISTS `t_test_object`;

CREATE TABLE `t_test_object` (
  `object_id` varchar(64) NOT NULL,
  `module_code` varchar(128) DEFAULT NULL,
  `object_name` varchar(1024) DEFAULT NULL,
  `object_type` varchar(32) DEFAULT NULL,
  `object_value` text DEFAULT NULL,
  `device_type` varchar(64) DEFAULT NULL,
  `last_status` varchar(32) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_test_object` */

insert  into `t_test_object`(`object_id`,`module_code`,`object_name`,`object_type`,`object_value`,`device_type`,`last_status`,`memo`) values 
('0a174e1e-85d4-11e8-9c96-0242ac110004','X_01_001','百度首页.搜索按钮','button','.//input[@id=\'su\']','web','enabled',''),
('133a0183-1863-11e9-bdef-0242ac110004','X_01_001','百度首页','page','https://www.baidu.com','web','enabled',''),
('7cc702fb-85bb-11e8-9c96-0242ac110004','X_01_001','百度首页.搜索输入','input','.//input[@id=\'kw\']','web','enabled','');

/*Table structure for table `t_test_reporter` */

DROP TABLE IF EXISTS `t_test_reporter`;

CREATE TABLE `t_test_reporter` (
  `reporter_id` varchar(64) NOT NULL,
  `parent_id` varchar(64) DEFAULT NULL,
  `reporter_code` varchar(128) DEFAULT NULL,
  `reporter_name` varchar(1024) DEFAULT NULL,
  `reporter_value` text DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`reporter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_test_reporter` */

insert  into `t_test_reporter`(`reporter_id`,`parent_id`,`reporter_code`,`reporter_name`,`reporter_value`,`memo`) values 
('0e3a0be7-bbe9-11e7-a95a-000c29cd7ff1','c98b2d48-bdea-11e7-92a2-000c29ce8469','1_01_001','自动化测试','/jsp/module/atmp/test/measure/reporter/reporter_at-sum.jsp',NULL),
('23327473-bc58-11e7-a95a-000c29cd7ff1',NULL,'1','所有报表',NULL,NULL),
('3453060a-ff44-11e8-9a6f-0242ac110004','c98b2d48-bdea-11e7-92a2-000c29ce8469','1_01_002','测试报告汇总','/jsp/module/atmp/test/measure/reporter/reporter_tasklog-sum.jsp',NULL),
('3828307a-ff44-11e8-9a6f-0242ac110004','c98b2d48-bdea-11e7-92a2-000c29ce8469','1_01_003','测试报告趋势','/jsp/module/atmp/test/measure/reporter/reporter_task-trend.jsp',NULL),
('c98b2d48-bdea-11e7-92a2-000c29ce8469','23327473-bc58-11e7-a95a-000c29cd7ff1','1_01','测试执行',NULL,NULL);

/*Table structure for table `t_test_schema` */

DROP TABLE IF EXISTS `t_test_schema`;

CREATE TABLE `t_test_schema` (
  `schema_id` varchar(64) NOT NULL,
  `schema_code` varchar(128) DEFAULT NULL,
  `schema_name` varchar(1024) DEFAULT NULL,
  `test_type` varchar(32) DEFAULT NULL,
  `tc_module` text DEFAULT NULL,
  `tc_level` text DEFAULT NULL,
  `tc_status` text DEFAULT NULL,
  `tc_tester` text DEFAULT NULL,
  `tc_plugin` text DEFAULT NULL,
  `last_status` varchar(32) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`schema_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_test_schema` */

insert  into `t_test_schema`(`schema_id`,`schema_code`,`schema_name`,`test_type`,`tc_module`,`tc_level`,`tc_status`,`tc_tester`,`tc_plugin`,`last_status`,`memo`) values 
('c1fd836b-88af-11e7-a102-000c29ce8469','smoke_demo','演示功能冒烟测试','function','X_01_001','1','auto','','java.code','enabled','');

/*Table structure for table `t_test_task` */

DROP TABLE IF EXISTS `t_test_task`;

CREATE TABLE `t_test_task` (
  `task_id` varchar(64) NOT NULL,
  `task_name` varchar(1024) DEFAULT NULL,
  `test_type` varchar(32) DEFAULT NULL,
  `work_group` varchar(32) DEFAULT NULL,
  `version` varchar(32) DEFAULT NULL,
  `firetime_start` varchar(32) DEFAULT NULL,
  `firetime_end` varchar(32) DEFAULT NULL,
  `tester` varchar(128) DEFAULT NULL,
  `log_result` varchar(32) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_test_task` */

insert  into `t_test_task`(`task_id`,`task_name`,`test_type`,`work_group`,`version`,`firetime_start`,`firetime_end`,`tester`,`log_result`,`memo`) values 
('538d3a15-6975-11e8-a12c-0242ac110002','演示迭代测试任务','function','tech-test.test1','1.0.0','2019-01-14 20:33:04.824','2019-01-14 20:33:09.815','chenjinjun','idle','');

/*Table structure for table `t_test_task_log` */

DROP TABLE IF EXISTS `t_test_task_log`;

CREATE TABLE `t_test_task_log` (
  `task_log_id` varchar(64) NOT NULL,
  `task_id` varchar(64) DEFAULT NULL,
  `server_id` varchar(64) DEFAULT NULL,
  `node_id` varchar(64) DEFAULT NULL,
  `batch_no` varchar(64) DEFAULT NULL,
  `module_code` varchar(128) DEFAULT NULL,
  `test_code` varchar(128) DEFAULT NULL,
  `test_type` varchar(32) DEFAULT NULL,
  `run_plugin` varchar(32) DEFAULT NULL,
  `test_status` varchar(32) DEFAULT NULL,
  `run_pos` int(4) DEFAULT NULL,
  `firetime_start` varchar(32) DEFAULT NULL,
  `firetime_end` varchar(32) DEFAULT NULL,
  `log_time` double(10,4) DEFAULT NULL,
  `log_data` text DEFAULT NULL,
  `log_result` varchar(32) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`task_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_test_task_log` */

/*Table structure for table `t_test_tc` */

DROP TABLE IF EXISTS `t_test_tc`;

CREATE TABLE `t_test_tc` (
  `tc_id` varchar(64) NOT NULL,
  `module_code` varchar(128) DEFAULT NULL,
  `test_code` varchar(128) DEFAULT NULL,
  `test_type` varchar(32) DEFAULT NULL,
  `tc_level` varchar(32) DEFAULT NULL,
  `tc_path` text DEFAULT NULL,
  `tc_summary` text DEFAULT NULL,
  `detail_step` text DEFAULT NULL,
  `expect_result` text DEFAULT NULL,
  `last_status` varchar(32) DEFAULT NULL,
  `run_plugin` varchar(32) DEFAULT NULL,
  `run_flag` int(4) DEFAULT NULL,
  `tester` varchar(128) DEFAULT NULL,
  `developer` varchar(128) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`tc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_test_tc` */

insert  into `t_test_tc`(`tc_id`,`module_code`,`test_code`,`test_type`,`tc_level`,`tc_path`,`tc_summary`,`detail_step`,`expect_result`,`last_status`,`run_plugin`,`run_flag`,`tester`,`developer`,`memo`) values 
('14c38651-7af5-11e9-9e39-000c29d6aa4f','X_01_001','C11003','function','1','手工演示用例','用例调试测试一下XX3','','没有异常','manual','manual',0,'chenjinjun','chenjinjun',''),
('b52b99bf-5e5a-11e8-bfd3-000c296b25ed','X_01_001','C11002','function','1','调试用例视图','用例调试测试一下XX2','','没有异常','develop','java.view',0,'chenjinjun','chenjinjun',''),
('ff83e744-5e53-11e8-bfd3-000c296b25ed','X_01_001','C11001','function','1','调试用例代码','用例调试测试一下XX1','','没有异常','auto','java.code',0,'chenjinjun','chenjinjun','');

/*Table structure for table `t_test_tc_step` */

DROP TABLE IF EXISTS `t_test_tc_step`;

CREATE TABLE `t_test_tc_step` (
  `tc_step_id` varchar(64) NOT NULL,
  `tc_id` varchar(64) DEFAULT NULL,
  `action_type` varchar(32) DEFAULT NULL,
  `action_code` varchar(256) DEFAULT NULL,
  `action_key` varchar(1024) DEFAULT NULL,
  `action_value` text DEFAULT NULL,
  `last_status` varchar(16) DEFAULT NULL,
  `seq` int(4) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`tc_step_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_test_tc_step` */

insert  into `t_test_tc_step`(`tc_step_id`,`tc_id`,`action_type`,`action_code`,`action_key`,`action_value`,`last_status`,`seq`,`memo`) values 
('0510b097-8ff3-11e8-9569-0242ac110004','ff83e744-5e53-11e8-bfd3-000c296b25ed','base','waitfor','millisecond','{\"millisecond\":\"1000\"}','enabled',4,NULL),
('248b3878-8808-11e8-9c96-0242ac110004','b52b99bf-5e5a-11e8-bfd3-000c296b25ed','selenium','visit','page','{\"page\":\"百度首页\"}','enabled',1,NULL),
('38007b15-8808-11e8-9c96-0242ac110004','ff83e744-5e53-11e8-bfd3-000c296b25ed','base','query_server','db_name,sql','{\"db_name\":\"qfsoft_db_prp\",\"sql\":\"SELECT * FROM t_invest_soccer_detail t WHERE 1=1\"}','enabled',1,NULL),
('51f328a0-8808-11e8-9c96-0242ac110004','b52b99bf-5e5a-11e8-bfd3-000c296b25ed','selenium','set_text','object,value','{\"value\":\"test\",\"object\":\"搜索输入\"}','enabled',2,NULL),
('7f75c977-b591-11e8-a5b6-0242ac110004','ff83e744-5e53-11e8-bfd3-000c296b25ed','base','testapi','api,param','{\"param\":\" {\\\"version\\\": \\\"5.3.5\\\", \\\"system\\\": \\\"Android\\\"}\",\"api\":\"测试调试JSON\"}','enabled',2,NULL),
('83877197-8808-11e8-9c96-0242ac110004','b52b99bf-5e5a-11e8-bfd3-000c296b25ed','selenium','click','object','{\"object\":\"搜索按钮\"}','enabled',3,NULL),
('99730dd2-882c-11e8-9c96-0242ac110004','b52b99bf-5e5a-11e8-bfd3-000c296b25ed','base','waitfor','millisecond','{\"millisecond\":\"1000\"}','enabled',4,NULL),
('b6043665-b591-11e8-a5b6-0242ac110004','ff83e744-5e53-11e8-bfd3-000c296b25ed','base','check_equals','name,expect,real','{\"expect\":\"test\",\"name\":\"返回信息校验\",\"real\":\"${data}\"}','enabled',5,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

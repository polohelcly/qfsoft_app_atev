/*
SQLyog Community
MySQL - 10.3.12-MariaDB-log : Database - qfsoft_db_timp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `qfsoft_db_timp`;

/*Table structure for table `t_sys_cache` */

DROP TABLE IF EXISTS `t_sys_cache`;

CREATE TABLE `t_sys_cache` (
  `cache_id` varchar(64) NOT NULL,
  `cache_ip` varchar(32) DEFAULT NULL,
  `cache_key` varchar(128) DEFAULT NULL,
  `cache_value` text DEFAULT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_cache` */

/*Table structure for table `t_sys_info` */

DROP TABLE IF EXISTS `t_sys_info`;

CREATE TABLE `t_sys_info` (
  `info_id` varchar(64) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `info_type` varchar(32) DEFAULT NULL,
  `info_name` varchar(1024) DEFAULT NULL,
  `author` varchar(128) DEFAULT NULL,
  `firetime` datetime DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_info` */

/*Table structure for table `t_sys_info_reply` */

DROP TABLE IF EXISTS `t_sys_info_reply`;

CREATE TABLE `t_sys_info_reply` (
  `info_reply_id` varchar(64) NOT NULL,
  `info_id` varchar(64) DEFAULT NULL,
  `author` varchar(128) DEFAULT NULL,
  `firetime` datetime DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`info_reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_info_reply` */

/*Table structure for table `t_sys_language` */

DROP TABLE IF EXISTS `t_sys_language`;

CREATE TABLE `t_sys_language` (
  `language_id` varchar(64) NOT NULL,
  `language_key` varchar(128) DEFAULT NULL,
  `language_value` text DEFAULT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_language` */

/*Table structure for table `t_sys_link` */

DROP TABLE IF EXISTS `t_sys_link`;

CREATE TABLE `t_sys_link` (
  `link_id` varchar(64) NOT NULL,
  `project_code` varchar(128) DEFAULT NULL,
  `link_name` varchar(1024) DEFAULT NULL,
  `link_type` varchar(32) DEFAULT NULL,
  `link_value` text DEFAULT NULL,
  `last_status` varchar(16) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_link` */

/*Table structure for table `t_sys_log` */

DROP TABLE IF EXISTS `t_sys_log`;

CREATE TABLE `t_sys_log` (
  `log_id` varchar(64) NOT NULL,
  `project_code` varchar(128) DEFAULT NULL,
  `fun_url` text DEFAULT NULL,
  `operate_ip` varchar(32) DEFAULT NULL,
  `operate_client` text DEFAULT NULL,
  `total_num` int(4) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_log` */

/*Table structure for table `t_sys_menu` */

DROP TABLE IF EXISTS `t_sys_menu`;

CREATE TABLE `t_sys_menu` (
  `menu_id` varchar(64) NOT NULL,
  `parent_id` varchar(64) DEFAULT NULL,
  `project_code` varchar(128) DEFAULT NULL,
  `menu_code` varchar(128) DEFAULT NULL,
  `menu_type` varchar(32) DEFAULT NULL,
  `menu_name` varchar(1024) DEFAULT NULL,
  `menu_value` text DEFAULT NULL,
  `last_status` varchar(32) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_menu` */

/*Table structure for table `t_sys_message` */

DROP TABLE IF EXISTS `t_sys_message`;

CREATE TABLE `t_sys_message` (
  `message_id` varchar(64) NOT NULL,
  `message_code` varchar(128) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_message` */

insert  into `t_sys_message`(`message_id`,`message_code`,`memo`) values 
('14833218-a74e-11e3-8a3d-001fd0caf5f1','1001','功能操作响应成功'),
('15742886-a74e-11e3-8a3d-001fd0caf5f1','2001','系统登录错误：用户名或密码错误'),
('2608f400-2e8a-11e5-af10-00505682d627','2006','系统登录错误：浏览器版本错误，请使用Firefox及Chome核心的浏览器'),
('4ea6a9bd-7932-11e8-b51d-0242ac110004','2007','不存在相关数据'),
('584f8544-f4ff-11e3-8eb4-000c298ff75e','2005','存在重复数据，请检查处理后再重试'),
('ce176132-bf90-11e3-8eb4-000c298ff75e','2002','您没有授权相关功能的权限'),
('d28d7d41-bf90-11e3-8eb4-000c298ff75e','2003','功能操作失败，请联系管理员'),
('d854fd23-bf90-11e3-8eb4-000c298ff75e','2004','两次输入的密码不一致');

/*Table structure for table `t_sys_param` */

DROP TABLE IF EXISTS `t_sys_param`;

CREATE TABLE `t_sys_param` (
  `param_id` varchar(64) NOT NULL,
  `project_code` varchar(128) DEFAULT NULL,
  `param_type` varchar(32) DEFAULT NULL,
  `param_key` varchar(128) DEFAULT NULL,
  `param_value` text DEFAULT NULL,
  `last_status` varchar(32) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`param_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_param` */

/*Table structure for table `t_sys_project` */

DROP TABLE IF EXISTS `t_sys_project`;

CREATE TABLE `t_sys_project` (
  `project_id` varchar(64) NOT NULL,
  `project_code` varchar(128) DEFAULT NULL,
  `project_name` varchar(1024) DEFAULT NULL,
  `seq` int(4) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_project` */

/*Table structure for table `t_sys_role` */

DROP TABLE IF EXISTS `t_sys_role`;

CREATE TABLE `t_sys_role` (
  `role_id` varchar(64) NOT NULL,
  `role_name` varchar(1024) DEFAULT NULL,
  `role_type` varchar(32) DEFAULT NULL,
  `last_status` varchar(32) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_role` */

insert  into `t_sys_role`(`role_id`,`role_name`,`role_type`,`last_status`,`memo`) values 
('508003e3-ee72-11e9-98ae-0242ac110002','公司同事','normal','enabled',''),
('61f548ad-e469-11e7-9915-000c29ce8469','演示角色','normal','enabled',''),
('6cd4917e-a744-11e3-8a3d-001fd0caf5f1','超级管理员','super','enabled',''),
('fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f','培训学员','normal','enabled','');

/*Table structure for table `t_sys_role_purview` */

DROP TABLE IF EXISTS `t_sys_role_purview`;

CREATE TABLE `t_sys_role_purview` (
  `role_purview_id` varchar(64) NOT NULL,
  `role_id` varchar(64) DEFAULT NULL,
  `project_code` varchar(128) DEFAULT NULL,
  `table_name` varchar(1024) DEFAULT NULL,
  `purview_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`role_purview_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_role_purview` */

/*Table structure for table `t_sys_udc` */

DROP TABLE IF EXISTS `t_sys_udc`;

CREATE TABLE `t_sys_udc` (
  `udc_id` varchar(64) NOT NULL,
  `project_code` varchar(128) DEFAULT NULL,
  `udc_code` varchar(128) DEFAULT NULL,
  `option_key` varchar(32) DEFAULT NULL,
  `option_value` text DEFAULT NULL,
  `last_status` varchar(32) DEFAULT NULL,
  `seq` int(4) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`udc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_udc` */

/*Table structure for table `t_sys_user` */

DROP TABLE IF EXISTS `t_sys_user`;

CREATE TABLE `t_sys_user` (
  `user_id` varchar(64) NOT NULL,
  `user_code` varchar(128) DEFAULT NULL,
  `user_name` varchar(1024) DEFAULT NULL,
  `user_pwd` varchar(32) DEFAULT NULL,
  `user_type` varchar(32) DEFAULT NULL,
  `work_depart` varchar(32) DEFAULT NULL,
  `work_group` varchar(32) DEFAULT NULL,
  `gender` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `user_logo` varchar(256) DEFAULT NULL,
  `user_style` varchar(32) DEFAULT NULL,
  `last_status` varchar(32) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_user` */

insert  into `t_sys_user`(`user_id`,`user_code`,`user_name`,`user_pwd`,`user_type`,`work_depart`,`work_group`,`gender`,`phone`,`email`,`user_logo`,`user_style`,`last_status`,`memo`) values 
('013822bc-f282-11e9-98ae-0242ac110002','lirenwan','李仁万','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','male','','','/attachfile/image/user/honor_of_king/001.jpg','blue','enabled',NULL),
('04cf11ad-f317-11e9-98ae-0242ac110002','wangwenyue','王文越','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','male','','','/attachfile/image/user/honor_of_king/001.jpg','blue','enabled',NULL),
('059ec9aa-f281-11e9-98ae-0242ac110002','baisen','白森','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','male','','','/attachfile/image/user/honor_of_king/001.jpg','blue','enabled',NULL),
('0f0c68d6-f281-11e9-98ae-0242ac110002','liuling','刘玲','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','female','','','/attachfile/image/user/honor_of_king/001.jpg','pink','enabled',NULL),
('1ba79bff-f281-11e9-98ae-0242ac110002','helinhua','何林华','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','female','','','/attachfile/image/user/honor_of_king/001.jpg','pink','enabled',NULL),
('38234b71-dbb9-11e9-9251-000c29d6aa4f','linshuyang','林曙阳','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-test','tech-test.test1','female','','shuyang.lin@zatech.com','/attachfile/image/user/honor_of_king/074.jpg','pink','enabled',NULL),
('4505724b-6c9d-11ea-a678-0242ac110002','zhoudezhang','周德章','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','male','','','/attachfile/image/user/honor_of_king/001.jpg','blue','enabled',NULL),
('46297337-f280-11e9-98ae-0242ac110002','zhongpeiru','钟佩茹','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','female','','','/attachfile/image/user/honor_of_king/001.jpg','pink','enabled',NULL),
('49e874a6-f281-11e9-98ae-0242ac110002','zhaojingli','赵静丽','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','female','','','/attachfile/image/user/honor_of_king/001.jpg','pink','enabled',NULL),
('5853f029-f281-11e9-98ae-0242ac110002','ouyangyun','欧阳云','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','male','','','/attachfile/image/user/honor_of_king/001.jpg','blue','enabled',NULL),
('71b5b910-f281-11e9-98ae-0242ac110002','liaojinghong','廖竟宏','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','male','','','/attachfile/image/user/honor_of_king/001.jpg','blue','enabled',NULL),
('8222644a-f281-11e9-98ae-0242ac110002','jiangyingzhe','姜应哲','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','male','','','/attachfile/image/user/honor_of_king/001.jpg','blue','enabled',NULL),
('8cf4925e-f281-11e9-98ae-0242ac110002','yihaiyan','易海燕','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','female','','','/attachfile/image/user/honor_of_king/001.jpg','pink','enabled',NULL),
('a18c58c3-f281-11e9-98ae-0242ac110002','liyouming','黎又铭','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','male','','','/attachfile/image/user/honor_of_king/001.jpg','blue','enabled',NULL),
('acd56901-f281-11e9-98ae-0242ac110002','dongshaofeng','董邵峰','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','male','','','/attachfile/image/user/honor_of_king/001.jpg','blue','enabled',NULL),
('b513beb4-f281-11e9-98ae-0242ac110002','pengshun','彭顺','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','male','','','/attachfile/image/user/honor_of_king/001.jpg','blue','enabled',NULL),
('c15db67f-f281-11e9-98ae-0242ac110002','chenliming','陈丽名','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','female','','','/attachfile/image/user/honor_of_king/001.jpg','pink','enabled',NULL),
('c91cf612-197d-11ea-a678-0242ac110002','lufang','卢芳','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','male','','','/attachfile/image/user/honor_of_king/001.jpg','blue','enabled',NULL),
('ce6a9096-f281-11e9-98ae-0242ac110002','panqifang','潘启芳','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','male','','','/attachfile/image/user/honor_of_king/001.jpg','blue','enabled',NULL),
('dc5be6a8-f281-11e9-98ae-0242ac110002','chenyouli','陈有利','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','male','','','/attachfile/image/user/honor_of_king/001.jpg','blue','enabled',NULL),
('e0151cb8-e47f-11e7-9915-000c29ce8469','guest','游客','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-test','tech-test.test1','male','','','/attachfile/image/user/honor_of_king/001.jpg','pink','enabled',NULL),
('e956429a-f281-11e9-98ae-0242ac110002','xiongliang','熊亮','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','female','','','/attachfile/image/user/honor_of_king/001.jpg','pink','enabled',NULL),
('ed82b619-a388-11e3-bcd5-3148d8615fb9','chenjinjun','陈进军','d4d9b07b6993bb68e909dd23b723b8d9','employee','tech-test','tech-test.test1','male','18988793306','jinjun.chen@zatech.com','/attachfile/image/user/honor_of_king/086.jpg','dark','enabled',NULL),
('f5375124-f281-11e9-98ae-0242ac110002','linlianglai','林良来','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','male','','','/attachfile/image/user/honor_of_king/001.jpg','blue','enabled',NULL),
('fad06fb2-f280-11e9-98ae-0242ac110002','liujialun','刘嘉伦','16d7a4fca7442dda3ad93c9a726597e4','employee','tech-training','tech-training.zelin','male','','','/attachfile/image/user/honor_of_king/001.jpg','blue','enabled',NULL);

/*Table structure for table `t_sys_user_login` */

DROP TABLE IF EXISTS `t_sys_user_login`;

CREATE TABLE `t_sys_user_login` (
  `user_login_id` varchar(64) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `project_code` varchar(128) DEFAULT NULL,
  `operate_ip` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`user_login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_user_login` */

/*Table structure for table `t_sys_user_role` */

DROP TABLE IF EXISTS `t_sys_user_role`;

CREATE TABLE `t_sys_user_role` (
  `user_role_id` varchar(64) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `role_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_user_role` */

insert  into `t_sys_user_role`(`user_role_id`,`user_id`,`role_id`) values 
('0123fa6d-197e-11ea-a678-0242ac110002','c91cf612-197d-11ea-a678-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('018cfb27-e480-11e7-9915-000c29ce8469','e0151cb8-e47f-11e7-9915-000c29ce8469','61f548ad-e469-11e7-9915-000c29ce8469'),
('083a1d8f-b3f6-11e3-b884-1f3dd36da803','ed82b619-a388-11e3-bcd5-3148d8615fb9','6cd4917e-a744-11e3-8a3d-001fd0caf5f1'),
('45595bf3-f317-11e9-98ae-0242ac110002','04cf11ad-f317-11e9-98ae-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('68e82709-6c9d-11ea-a678-0242ac110002','4505724b-6c9d-11ea-a678-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('6de06477-f282-11e9-98ae-0242ac110002','013822bc-f282-11e9-98ae-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('6de068ac-f282-11e9-98ae-0242ac110002','059ec9aa-f281-11e9-98ae-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('6de06978-f282-11e9-98ae-0242ac110002','0f0c68d6-f281-11e9-98ae-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('6de06a1d-f282-11e9-98ae-0242ac110002','1ba79bff-f281-11e9-98ae-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('6de06aa9-f282-11e9-98ae-0242ac110002','46297337-f280-11e9-98ae-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('6de06b0b-f282-11e9-98ae-0242ac110002','49e874a6-f281-11e9-98ae-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('6de06b52-f282-11e9-98ae-0242ac110002','5853f029-f281-11e9-98ae-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('6de06b8c-f282-11e9-98ae-0242ac110002','71b5b910-f281-11e9-98ae-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('6de06bba-f282-11e9-98ae-0242ac110002','8222644a-f281-11e9-98ae-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('6de06bed-f282-11e9-98ae-0242ac110002','8cf4925e-f281-11e9-98ae-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('6de06c14-f282-11e9-98ae-0242ac110002','a18c58c3-f281-11e9-98ae-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('6de06c3a-f282-11e9-98ae-0242ac110002','acd56901-f281-11e9-98ae-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('6de06c61-f282-11e9-98ae-0242ac110002','b513beb4-f281-11e9-98ae-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('6de06c85-f282-11e9-98ae-0242ac110002','c15db67f-f281-11e9-98ae-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('6de06cab-f282-11e9-98ae-0242ac110002','ce6a9096-f281-11e9-98ae-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('6de06cd0-f282-11e9-98ae-0242ac110002','dc5be6a8-f281-11e9-98ae-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('6de06cfd-f282-11e9-98ae-0242ac110002','e956429a-f281-11e9-98ae-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('6de06d27-f282-11e9-98ae-0242ac110002','f5375124-f281-11e9-98ae-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('6de06d4c-f282-11e9-98ae-0242ac110002','fad06fb2-f280-11e9-98ae-0242ac110002','fe8f9b4e-dbb8-11e9-9251-000c29d6aa4f'),
('ffbae949-f02b-11e9-98ae-0242ac110002','38234b71-dbb9-11e9-9251-000c29d6aa4f','508003e3-ee72-11e9-98ae-0242ac110002');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

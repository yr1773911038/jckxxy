/*
SQLyog v10.2 
MySQL - 5.6.17 : Database - cmf
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cmf` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cmf`;

/*Table structure for table `cmf_ad` */

DROP TABLE IF EXISTS `cmf_ad`;

CREATE TABLE `cmf_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `cmf_ad` */

insert  into `cmf_ad`(`ad_id`,`ad_name`,`ad_content`,`status`) values (1,'中小企业产品展销展示','&lt;img src=&quot;/cmf/themes/demo/Public/images/3-1.png&quot; class=&quot;img-responsive&quot; alt=&quot;Responsive image&quot;&gt;&lt;/img&gt;\n',1),(2,'城市时尚电动汽车','&lt;img src=&quot;/cmf/themes/demo/Public/images/3-5.png&quot; class=&quot;img-responsive&quot; alt=&quot;Responsive image&quot;&gt;&lt;/img&gt;',1),(3,'政策文件查询','&lt;img src=&quot;/cmf/themes/demo/Public/images/3-4.png&quot; class=&quot;img-responsive&quot; alt=&quot;Responsive image&quot;&gt;&lt;/img&gt;',1),(9,'交易会','&lt;img src=&quot;/cmf/themes/demo/Public/images/4-1.png&quot; class=&quot;img-responsive&quot; alt=&quot;Responsive image&quot;&gt;&lt;/img&gt;\n',1);

/*Table structure for table `cmf_asset` */

DROP TABLE IF EXISTS `cmf_asset`;

CREATE TABLE `cmf_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';

/*Data for the table `cmf_asset` */

/*Table structure for table `cmf_auth_access` */

DROP TABLE IF EXISTS `cmf_auth_access`;

CREATE TABLE `cmf_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

/*Data for the table `cmf_auth_access` */

/*Table structure for table `cmf_auth_rule` */

DROP TABLE IF EXISTS `cmf_auth_rule`;

CREATE TABLE `cmf_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

/*Data for the table `cmf_auth_rule` */

insert  into `cmf_auth_rule`(`id`,`module`,`type`,`name`,`param`,`title`,`status`,`condition`) values (1,'Admin','admin_url','admin/content/default',NULL,'内容管理',1,''),(2,'Api','admin_url','api/guestbookadmin/index',NULL,'所有留言',1,''),(3,'Api','admin_url','api/guestbookadmin/delete',NULL,'删除网站留言',1,''),(4,'Comment','admin_url','comment/commentadmin/index',NULL,'评论管理',1,''),(5,'Comment','admin_url','comment/commentadmin/delete',NULL,'删除评论',1,''),(6,'Comment','admin_url','comment/commentadmin/check',NULL,'评论审核',1,''),(7,'Portal','admin_url','portal/adminpost/index',NULL,'文章管理',1,''),(8,'Portal','admin_url','portal/adminpost/listorders',NULL,'文章排序',1,''),(9,'Portal','admin_url','portal/adminpost/top',NULL,'文章置顶',1,''),(10,'Portal','admin_url','portal/adminpost/recommend',NULL,'文章推荐',1,''),(11,'Portal','admin_url','portal/adminpost/move',NULL,'批量移动',1,''),(12,'Portal','admin_url','portal/adminpost/check',NULL,'文章审核',1,''),(13,'Portal','admin_url','portal/adminpost/delete',NULL,'删除文章',1,''),(14,'Portal','admin_url','portal/adminpost/edit',NULL,'编辑文章',1,''),(15,'Portal','admin_url','portal/adminpost/edit_post',NULL,'提交编辑',1,''),(16,'Portal','admin_url','portal/adminpost/add',NULL,'添加文章',1,''),(17,'Portal','admin_url','portal/adminpost/add_post',NULL,'提交添加',1,''),(18,'Portal','admin_url','portal/adminterm/index',NULL,'分类管理',1,''),(19,'Portal','admin_url','portal/adminterm/listorders',NULL,'文章分类排序',1,''),(20,'Portal','admin_url','portal/adminterm/delete',NULL,'删除分类',1,''),(21,'Portal','admin_url','portal/adminterm/edit',NULL,'编辑分类',1,''),(22,'Portal','admin_url','portal/adminterm/edit_post',NULL,'提交编辑',1,''),(23,'Portal','admin_url','portal/adminterm/add',NULL,'添加分类',1,''),(24,'Portal','admin_url','portal/adminterm/add_post',NULL,'提交添加',1,''),(25,'Portal','admin_url','portal/adminpage/index',NULL,'页面管理',1,''),(26,'Portal','admin_url','portal/adminpage/listorders',NULL,'页面排序',1,''),(27,'Portal','admin_url','portal/adminpage/delete',NULL,'删除页面',1,''),(28,'Portal','admin_url','portal/adminpage/edit',NULL,'编辑页面',1,''),(29,'Portal','admin_url','portal/adminpage/edit_post',NULL,'提交编辑',1,''),(30,'Portal','admin_url','portal/adminpage/add',NULL,'添加页面',1,''),(31,'Portal','admin_url','portal/adminpage/add_post',NULL,'提交添加',1,''),(32,'Admin','admin_url','admin/recycle/default',NULL,'回收站',1,''),(33,'Portal','admin_url','portal/adminpost/recyclebin',NULL,'文章回收',1,''),(34,'Portal','admin_url','portal/adminpost/restore',NULL,'文章还原',1,''),(35,'Portal','admin_url','portal/adminpost/clean',NULL,'彻底删除',1,''),(36,'Portal','admin_url','portal/adminpage/recyclebin',NULL,'页面回收',1,''),(37,'Portal','admin_url','portal/adminpage/clean',NULL,'彻底删除',1,''),(38,'Portal','admin_url','portal/adminpage/restore',NULL,'页面还原',1,''),(39,'Admin','admin_url','admin/extension/default',NULL,'扩展工具',1,''),(40,'Admin','admin_url','admin/backup/default',NULL,'备份管理',1,''),(41,'Admin','admin_url','admin/backup/restore',NULL,'数据还原',1,''),(42,'Admin','admin_url','admin/backup/index',NULL,'数据备份',1,''),(43,'Admin','admin_url','admin/backup/index_post',NULL,'提交数据备份',1,''),(44,'Admin','admin_url','admin/backup/download',NULL,'下载备份',1,''),(45,'Admin','admin_url','admin/backup/del_backup',NULL,'删除备份',1,''),(46,'Admin','admin_url','admin/backup/import',NULL,'数据备份导入',1,''),(47,'Admin','admin_url','admin/plugin/index',NULL,'插件管理',1,''),(48,'Admin','admin_url','admin/plugin/toggle',NULL,'插件启用切换',1,''),(49,'Admin','admin_url','admin/plugin/setting',NULL,'插件设置',1,''),(50,'Admin','admin_url','admin/plugin/setting_post',NULL,'插件设置提交',1,''),(51,'Admin','admin_url','admin/plugin/install',NULL,'插件安装',1,''),(52,'Admin','admin_url','admin/plugin/uninstall',NULL,'插件卸载',1,''),(53,'Admin','admin_url','admin/slide/default',NULL,'幻灯片',1,''),(54,'Admin','admin_url','admin/slide/index',NULL,'幻灯片管理',1,''),(55,'Admin','admin_url','admin/slide/listorders',NULL,'幻灯片排序',1,''),(56,'Admin','admin_url','admin/slide/toggle',NULL,'幻灯片显示切换',1,''),(57,'Admin','admin_url','admin/slide/delete',NULL,'删除幻灯片',1,''),(58,'Admin','admin_url','admin/slide/edit',NULL,'编辑幻灯片',1,''),(59,'Admin','admin_url','admin/slide/edit_post',NULL,'提交编辑',1,''),(60,'Admin','admin_url','admin/slide/add',NULL,'添加幻灯片',1,''),(61,'Admin','admin_url','admin/slide/add_post',NULL,'提交添加',1,''),(62,'Admin','admin_url','admin/slidecat/index',NULL,'幻灯片分类',1,''),(63,'Admin','admin_url','admin/slidecat/delete',NULL,'删除分类',1,''),(64,'Admin','admin_url','admin/slidecat/edit',NULL,'编辑分类',1,''),(65,'Admin','admin_url','admin/slidecat/edit_post',NULL,'提交编辑',1,''),(66,'Admin','admin_url','admin/slidecat/add',NULL,'添加分类',1,''),(67,'Admin','admin_url','admin/slidecat/add_post',NULL,'提交添加',1,''),(68,'Admin','admin_url','admin/ad/index',NULL,'网站广告',1,''),(69,'Admin','admin_url','admin/ad/toggle',NULL,'广告显示切换',1,''),(70,'Admin','admin_url','admin/ad/delete',NULL,'删除广告',1,''),(71,'Admin','admin_url','admin/ad/edit',NULL,'编辑广告',1,''),(72,'Admin','admin_url','admin/ad/edit_post',NULL,'提交编辑',1,''),(73,'Admin','admin_url','admin/ad/add',NULL,'添加广告',1,''),(74,'Admin','admin_url','admin/ad/add_post',NULL,'提交添加',1,''),(75,'Admin','admin_url','admin/link/index',NULL,'友情链接',1,''),(76,'Admin','admin_url','admin/link/listorders',NULL,'友情链接排序',1,''),(77,'Admin','admin_url','admin/link/toggle',NULL,'友链显示切换',1,''),(78,'Admin','admin_url','admin/link/delete',NULL,'删除友情链接',1,''),(79,'Admin','admin_url','admin/link/edit',NULL,'编辑友情链接',1,''),(80,'Admin','admin_url','admin/link/edit_post',NULL,'提交编辑',1,''),(81,'Admin','admin_url','admin/link/add',NULL,'添加友情链接',1,''),(82,'Admin','admin_url','admin/link/add_post',NULL,'提交添加',1,''),(83,'Api','admin_url','api/oauthadmin/setting',NULL,'第三方登陆',1,''),(84,'Api','admin_url','api/oauthadmin/setting_post',NULL,'提交设置',1,''),(85,'Admin','admin_url','admin/menu/default',NULL,'菜单管理',1,''),(86,'Admin','admin_url','admin/navcat/default1',NULL,'前台菜单',1,''),(87,'Admin','admin_url','admin/nav/index',NULL,'菜单管理',1,''),(88,'Admin','admin_url','admin/nav/listorders',NULL,'前台导航排序',1,''),(89,'Admin','admin_url','admin/nav/delete',NULL,'删除菜单',1,''),(90,'Admin','admin_url','admin/nav/edit',NULL,'编辑菜单',1,''),(91,'Admin','admin_url','admin/nav/edit_post',NULL,'提交编辑',1,''),(92,'Admin','admin_url','admin/nav/add',NULL,'添加菜单',1,''),(93,'Admin','admin_url','admin/nav/add_post',NULL,'提交添加',1,''),(94,'Admin','admin_url','admin/navcat/index',NULL,'菜单分类',1,''),(95,'Admin','admin_url','admin/navcat/delete',NULL,'删除分类',1,''),(96,'Admin','admin_url','admin/navcat/edit',NULL,'编辑分类',1,''),(97,'Admin','admin_url','admin/navcat/edit_post',NULL,'提交编辑',1,''),(98,'Admin','admin_url','admin/navcat/add',NULL,'添加分类',1,''),(99,'Admin','admin_url','admin/navcat/add_post',NULL,'提交添加',1,''),(100,'Admin','admin_url','admin/menu/index',NULL,'后台菜单',1,''),(101,'Admin','admin_url','admin/menu/add',NULL,'添加菜单',1,''),(102,'Admin','admin_url','admin/menu/add_post',NULL,'提交添加',1,''),(103,'Admin','admin_url','admin/menu/listorders',NULL,'后台菜单排序',1,''),(104,'Admin','admin_url','admin/menu/export_menu',NULL,'菜单备份',1,''),(105,'Admin','admin_url','admin/menu/edit',NULL,'编辑菜单',1,''),(106,'Admin','admin_url','admin/menu/edit_post',NULL,'提交编辑',1,''),(107,'Admin','admin_url','admin/menu/delete',NULL,'删除菜单',1,''),(108,'Admin','admin_url','admin/menu/lists',NULL,'所有菜单',1,''),(109,'Admin','admin_url','admin/setting/default',NULL,'设置',1,''),(110,'Admin','admin_url','admin/setting/userdefault',NULL,'个人信息',1,''),(111,'Admin','admin_url','admin/user/userinfo',NULL,'修改信息',1,''),(112,'Admin','admin_url','admin/user/userinfo_post',NULL,'修改信息提交',1,''),(113,'Admin','admin_url','admin/setting/password',NULL,'修改密码',1,''),(114,'Admin','admin_url','admin/setting/password_post',NULL,'提交修改',1,''),(115,'Admin','admin_url','admin/setting/site',NULL,'网站信息',1,''),(116,'Admin','admin_url','admin/setting/site_post',NULL,'提交修改',1,''),(117,'Admin','admin_url','admin/route/index',NULL,'路由列表',1,''),(118,'Admin','admin_url','admin/route/add',NULL,'路由添加',1,''),(119,'Admin','admin_url','admin/route/add_post',NULL,'路由添加提交',1,''),(120,'Admin','admin_url','admin/route/edit',NULL,'路由编辑',1,''),(121,'Admin','admin_url','admin/route/edit_post',NULL,'路由编辑提交',1,''),(122,'Admin','admin_url','admin/route/delete',NULL,'路由删除',1,''),(123,'Admin','admin_url','admin/route/ban',NULL,'路由禁止',1,''),(124,'Admin','admin_url','admin/route/open',NULL,'路由启用',1,''),(125,'Admin','admin_url','admin/route/listorders',NULL,'路由排序',1,''),(126,'Admin','admin_url','admin/mailer/default',NULL,'邮箱配置',1,''),(127,'Admin','admin_url','admin/mailer/index',NULL,'SMTP配置',1,''),(128,'Admin','admin_url','admin/mailer/index_post',NULL,'提交配置',1,''),(129,'Admin','admin_url','admin/mailer/active',NULL,'邮件模板',1,''),(130,'Admin','admin_url','admin/mailer/active_post',NULL,'提交模板',1,''),(131,'Admin','admin_url','admin/setting/clearcache',NULL,'清除缓存',1,''),(132,'User','admin_url','user/indexadmin/default',NULL,'用户管理',1,''),(133,'User','admin_url','user/indexadmin/default1',NULL,'用户组',1,''),(134,'User','admin_url','user/indexadmin/index',NULL,'本站用户',1,''),(135,'User','admin_url','user/indexadmin/ban',NULL,'拉黑会员',1,''),(136,'User','admin_url','user/indexadmin/cancelban',NULL,'启用会员',1,''),(137,'User','admin_url','user/oauthadmin/index',NULL,'第三方用户',1,''),(138,'User','admin_url','user/oauthadmin/delete',NULL,'第三方用户解绑',1,''),(139,'User','admin_url','user/indexadmin/default3',NULL,'管理组',1,''),(140,'Admin','admin_url','admin/rbac/index',NULL,'角色管理',1,''),(141,'Admin','admin_url','admin/rbac/member',NULL,'成员管理',1,''),(142,'Admin','admin_url','admin/rbac/authorize',NULL,'权限设置',1,''),(143,'Admin','admin_url','admin/rbac/authorize_post',NULL,'提交设置',1,''),(144,'Admin','admin_url','admin/rbac/roleedit',NULL,'编辑角色',1,''),(145,'Admin','admin_url','admin/rbac/roleedit_post',NULL,'提交编辑',1,''),(146,'Admin','admin_url','admin/rbac/roledelete',NULL,'删除角色',1,''),(147,'Admin','admin_url','admin/rbac/roleadd',NULL,'添加角色',1,''),(148,'Admin','admin_url','admin/rbac/roleadd_post',NULL,'提交添加',1,''),(149,'Admin','admin_url','admin/user/index',NULL,'管理员',1,''),(150,'Admin','admin_url','admin/user/delete',NULL,'删除管理员',1,''),(151,'Admin','admin_url','admin/user/edit',NULL,'管理员编辑',1,''),(152,'Admin','admin_url','admin/user/edit_post',NULL,'编辑提交',1,''),(153,'Admin','admin_url','admin/user/add',NULL,'管理员添加',1,''),(154,'Admin','admin_url','admin/user/add_post',NULL,'添加提交',1,''),(155,'Admin','admin_url','admin/plugin/update',NULL,'插件更新',1,''),(156,'Admin','admin_url','admin/storage/index',NULL,'文件存储',1,''),(157,'Admin','admin_url','admin/storage/setting_post',NULL,'文件存储设置提交',1,''),(158,'Admin','admin_url','admin/slide/ban',NULL,'禁用幻灯片',1,''),(159,'Admin','admin_url','admin/slide/cancelban',NULL,'启用幻灯片',1,''),(160,'Admin','admin_url','admin/user/ban',NULL,'禁用管理员',1,''),(161,'Admin','admin_url','admin/user/cancelban',NULL,'启用管理员',1,''),(162,'Study','admin_url','study/index/index',NULL,'PHP学习',1,''),(163,'Study1','admin_url','study1/index/index',NULL,'PHP学习',1,''),(164,'Content','admin_url','content/index/index',NULL,'内容信息列表',1,'');

/*Table structure for table `cmf_comments` */

DROP TABLE IF EXISTS `cmf_comments`;

CREATE TABLE `cmf_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

/*Data for the table `cmf_comments` */

/*Table structure for table `cmf_common_action_log` */

DROP TABLE IF EXISTS `cmf_common_action_log`;

CREATE TABLE `cmf_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';

/*Data for the table `cmf_common_action_log` */

/*Table structure for table `cmf_content` */

DROP TABLE IF EXISTS `cmf_content`;

CREATE TABLE `cmf_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `keyword` varchar(45) DEFAULT NULL,
  `news` text,
  `type` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `cmf_content` */

insert  into `cmf_content`(`id`,`title`,`keyword`,`news`,`type`,`state`) values (0,'个','刚刚','仍然','娃娃','已发布'),(1,'还带双双','分飞','哈博卡病毒','模块','未发布'),(2,'给他','大大','色','户','已发布'),(3,'那个本','复古','不菲的','不敢呗','未发布'),(4,'个人','吃的','吃的','分飞','已发布'),(5,'护肤','感觉','不过','的的','未发布'),(6,'你感觉','开','不过','分飞','已发布'),(7,'的焊接','好','合肥百货','和接发红包','未发布'),(8,'你个','老地方','不过','困','已发布'),(9,'看过','那个','吃v','毕业以后','已发布'),(10,'刚','股','吃那个饭店','额滴神','未发布'),(12,'','','','','未发布');

/*Table structure for table `cmf_guestbook` */

DROP TABLE IF EXISTS `cmf_guestbook`;

CREATE TABLE `cmf_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';

/*Data for the table `cmf_guestbook` */

/*Table structure for table `cmf_links` */

DROP TABLE IF EXISTS `cmf_links`;

CREATE TABLE `cmf_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

/*Data for the table `cmf_links` */

insert  into `cmf_links`(`link_id`,`link_url`,`link_name`,`link_image`,`link_target`,`link_description`,`link_status`,`link_rating`,`link_rel`,`listorder`) values (1,'http://www.thinkcmf.com','ThinkCMF','','_blank','',0,0,'',0),(2,'#','搜索帮助','','_blank','',1,0,NULL,0),(3,'#','意见反馈','','_blank','',1,0,NULL,0),(4,'#','举报','','_blank','',1,0,NULL,0),(5,'#','官方微博','','_blank','',1,0,NULL,0);

/*Table structure for table `cmf_menu` */

DROP TABLE IF EXISTS `cmf_menu`;

CREATE TABLE `cmf_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

/*Data for the table `cmf_menu` */

insert  into `cmf_menu`(`id`,`parentid`,`app`,`model`,`action`,`data`,`type`,`status`,`name`,`icon`,`remark`,`listorder`) values (1,0,'Admin','Content','default','',0,1,'内容管理','th','',30),(2,1,'Api','Guestbookadmin','index','',1,1,'所有留言','','',0),(3,2,'Api','Guestbookadmin','delete','',1,0,'删除网站留言','','',0),(4,1,'Comment','Commentadmin','index','',1,1,'评论管理','','',0),(5,4,'Comment','Commentadmin','delete','',1,0,'删除评论','','',0),(6,4,'Comment','Commentadmin','check','',1,0,'评论审核','','',0),(7,1,'Portal','AdminPost','index','',1,1,'文章管理','','',1),(8,7,'Portal','AdminPost','listorders','',1,0,'文章排序','','',0),(9,7,'Portal','AdminPost','top','',1,0,'文章置顶','','',0),(10,7,'Portal','AdminPost','recommend','',1,0,'文章推荐','','',0),(11,7,'Portal','AdminPost','move','',1,0,'批量移动','','',1000),(12,7,'Portal','AdminPost','check','',1,0,'文章审核','','',1000),(13,7,'Portal','AdminPost','delete','',1,0,'删除文章','','',1000),(14,7,'Portal','AdminPost','edit','',1,0,'编辑文章','','',1000),(15,14,'Portal','AdminPost','edit_post','',1,0,'提交编辑','','',0),(16,7,'Portal','AdminPost','add','',1,0,'添加文章','','',1000),(17,16,'Portal','AdminPost','add_post','',1,0,'提交添加','','',0),(18,1,'Portal','AdminTerm','index','',0,1,'分类管理','','',2),(19,18,'Portal','AdminTerm','listorders','',1,0,'文章分类排序','','',0),(20,18,'Portal','AdminTerm','delete','',1,0,'删除分类','','',1000),(21,18,'Portal','AdminTerm','edit','',1,0,'编辑分类','','',1000),(22,21,'Portal','AdminTerm','edit_post','',1,0,'提交编辑','','',0),(23,18,'Portal','AdminTerm','add','',1,0,'添加分类','','',1000),(24,23,'Portal','AdminTerm','add_post','',1,0,'提交添加','','',0),(25,1,'Portal','AdminPage','index','',1,1,'页面管理','','',3),(26,25,'Portal','AdminPage','listorders','',1,0,'页面排序','','',0),(27,25,'Portal','AdminPage','delete','',1,0,'删除页面','','',1000),(28,25,'Portal','AdminPage','edit','',1,0,'编辑页面','','',1000),(29,28,'Portal','AdminPage','edit_post','',1,0,'提交编辑','','',0),(30,25,'Portal','AdminPage','add','',1,0,'添加页面','','',1000),(31,30,'Portal','AdminPage','add_post','',1,0,'提交添加','','',0),(32,1,'Admin','Recycle','default','',1,1,'回收站','','',4),(33,32,'Portal','AdminPost','recyclebin','',1,1,'文章回收','','',0),(34,33,'Portal','AdminPost','restore','',1,0,'文章还原','','',1000),(35,33,'Portal','AdminPost','clean','',1,0,'彻底删除','','',1000),(36,32,'Portal','AdminPage','recyclebin','',1,1,'页面回收','','',1),(37,36,'Portal','AdminPage','clean','',1,0,'彻底删除','','',1000),(38,36,'Portal','AdminPage','restore','',1,0,'页面还原','','',1000),(39,0,'Admin','Extension','default','',0,1,'扩展工具','cloud','',40),(40,39,'Admin','Backup','default','',1,1,'备份管理','','',0),(41,40,'Admin','Backup','restore','',1,1,'数据还原','','',0),(42,40,'Admin','Backup','index','',1,1,'数据备份','','',0),(43,42,'Admin','Backup','index_post','',1,0,'提交数据备份','','',0),(44,40,'Admin','Backup','download','',1,0,'下载备份','','',1000),(45,40,'Admin','Backup','del_backup','',1,0,'删除备份','','',1000),(46,40,'Admin','Backup','import','',1,0,'数据备份导入','','',1000),(47,39,'Admin','Plugin','index','',1,1,'插件管理','','',0),(48,47,'Admin','Plugin','toggle','',1,0,'插件启用切换','','',0),(49,47,'Admin','Plugin','setting','',1,0,'插件设置','','',0),(50,49,'Admin','Plugin','setting_post','',1,0,'插件设置提交','','',0),(51,47,'Admin','Plugin','install','',1,0,'插件安装','','',0),(52,47,'Admin','Plugin','uninstall','',1,0,'插件卸载','','',0),(53,39,'Admin','Slide','default','',1,1,'幻灯片','','',1),(54,53,'Admin','Slide','index','',1,1,'幻灯片管理','','',0),(55,54,'Admin','Slide','listorders','',1,0,'幻灯片排序','','',0),(56,54,'Admin','Slide','toggle','',1,0,'幻灯片显示切换','','',0),(57,54,'Admin','Slide','delete','',1,0,'删除幻灯片','','',1000),(58,54,'Admin','Slide','edit','',1,0,'编辑幻灯片','','',1000),(59,58,'Admin','Slide','edit_post','',1,0,'提交编辑','','',0),(60,54,'Admin','Slide','add','',1,0,'添加幻灯片','','',1000),(61,60,'Admin','Slide','add_post','',1,0,'提交添加','','',0),(62,53,'Admin','Slidecat','index','',1,1,'幻灯片分类','','',0),(63,62,'Admin','Slidecat','delete','',1,0,'删除分类','','',1000),(64,62,'Admin','Slidecat','edit','',1,0,'编辑分类','','',1000),(65,64,'Admin','Slidecat','edit_post','',1,0,'提交编辑','','',0),(66,62,'Admin','Slidecat','add','',1,0,'添加分类','','',1000),(67,66,'Admin','Slidecat','add_post','',1,0,'提交添加','','',0),(68,39,'Admin','Ad','index','',1,1,'网站广告','','',2),(69,68,'Admin','Ad','toggle','',1,0,'广告显示切换','','',0),(70,68,'Admin','Ad','delete','',1,0,'删除广告','','',1000),(71,68,'Admin','Ad','edit','',1,0,'编辑广告','','',1000),(72,71,'Admin','Ad','edit_post','',1,0,'提交编辑','','',0),(73,68,'Admin','Ad','add','',1,0,'添加广告','','',1000),(74,73,'Admin','Ad','add_post','',1,0,'提交添加','','',0),(75,39,'Admin','Link','index','',0,1,'友情链接','','',3),(76,75,'Admin','Link','listorders','',1,0,'友情链接排序','','',0),(77,75,'Admin','Link','toggle','',1,0,'友链显示切换','','',0),(78,75,'Admin','Link','delete','',1,0,'删除友情链接','','',1000),(79,75,'Admin','Link','edit','',1,0,'编辑友情链接','','',1000),(80,79,'Admin','Link','edit_post','',1,0,'提交编辑','','',0),(81,75,'Admin','Link','add','',1,0,'添加友情链接','','',1000),(82,81,'Admin','Link','add_post','',1,0,'提交添加','','',0),(83,39,'Api','Oauthadmin','setting','',1,1,'第三方登陆','leaf','',4),(84,83,'Api','Oauthadmin','setting_post','',1,0,'提交设置','','',0),(85,0,'Admin','Menu','default','',1,1,'菜单管理','list','',20),(86,85,'Admin','Navcat','default1','',1,1,'前台菜单','','',0),(87,86,'Admin','Nav','index','',1,1,'菜单管理','','',0),(88,87,'Admin','Nav','listorders','',1,0,'前台导航排序','','',0),(89,87,'Admin','Nav','delete','',1,0,'删除菜单','','',1000),(90,87,'Admin','Nav','edit','',1,0,'编辑菜单','','',1000),(91,90,'Admin','Nav','edit_post','',1,0,'提交编辑','','',0),(92,87,'Admin','Nav','add','',1,0,'添加菜单','','',1000),(93,92,'Admin','Nav','add_post','',1,0,'提交添加','','',0),(94,86,'Admin','Navcat','index','',1,1,'菜单分类','','',0),(95,94,'Admin','Navcat','delete','',1,0,'删除分类','','',1000),(96,94,'Admin','Navcat','edit','',1,0,'编辑分类','','',1000),(97,96,'Admin','Navcat','edit_post','',1,0,'提交编辑','','',0),(98,94,'Admin','Navcat','add','',1,0,'添加分类','','',1000),(99,98,'Admin','Navcat','add_post','',1,0,'提交添加','','',0),(100,85,'Admin','Menu','index','',1,1,'后台菜单','','',0),(101,100,'Admin','Menu','add','',1,0,'添加菜单','','',0),(102,101,'Admin','Menu','add_post','',1,0,'提交添加','','',0),(103,100,'Admin','Menu','listorders','',1,0,'后台菜单排序','','',0),(104,100,'Admin','Menu','export_menu','',1,0,'菜单备份','','',1000),(105,100,'Admin','Menu','edit','',1,0,'编辑菜单','','',1000),(106,105,'Admin','Menu','edit_post','',1,0,'提交编辑','','',0),(107,100,'Admin','Menu','delete','',1,0,'删除菜单','','',1000),(108,100,'Admin','Menu','lists','',1,0,'所有菜单','','',1000),(109,0,'Admin','Setting','default','',0,1,'设置','cogs','',0),(110,109,'Admin','Setting','userdefault','',0,1,'个人信息','','',0),(111,110,'Admin','User','userinfo','',1,1,'修改信息','','',0),(112,111,'Admin','User','userinfo_post','',1,0,'修改信息提交','','',0),(113,110,'Admin','Setting','password','',1,1,'修改密码','','',0),(114,113,'Admin','Setting','password_post','',1,0,'提交修改','','',0),(115,109,'Admin','Setting','site','',1,1,'网站信息','','',0),(116,115,'Admin','Setting','site_post','',1,0,'提交修改','','',0),(117,115,'Admin','Route','index','',1,0,'路由列表','','',0),(118,115,'Admin','Route','add','',1,0,'路由添加','','',0),(119,118,'Admin','Route','add_post','',1,0,'路由添加提交','','',0),(120,115,'Admin','Route','edit','',1,0,'路由编辑','','',0),(121,120,'Admin','Route','edit_post','',1,0,'路由编辑提交','','',0),(122,115,'Admin','Route','delete','',1,0,'路由删除','','',0),(123,115,'Admin','Route','ban','',1,0,'路由禁止','','',0),(124,115,'Admin','Route','open','',1,0,'路由启用','','',0),(125,115,'Admin','Route','listorders','',1,0,'路由排序','','',0),(126,109,'Admin','Mailer','default','',1,1,'邮箱配置','','',0),(127,126,'Admin','Mailer','index','',1,1,'SMTP配置','','',0),(128,127,'Admin','Mailer','index_post','',1,0,'提交配置','','',0),(129,126,'Admin','Mailer','active','',1,1,'邮件模板','','',0),(130,129,'Admin','Mailer','active_post','',1,0,'提交模板','','',0),(131,109,'Admin','Setting','clearcache','',1,1,'清除缓存','','',1),(132,0,'User','Indexadmin','default','',1,1,'用户管理','group','',10),(133,132,'User','Indexadmin','default1','',1,1,'用户组','','',0),(134,133,'User','Indexadmin','index','',1,1,'本站用户','leaf','',0),(135,134,'User','Indexadmin','ban','',1,0,'拉黑会员','','',0),(136,134,'User','Indexadmin','cancelban','',1,0,'启用会员','','',0),(137,133,'User','Oauthadmin','index','',1,1,'第三方用户','leaf','',0),(138,137,'User','Oauthadmin','delete','',1,0,'第三方用户解绑','','',0),(139,132,'User','Indexadmin','default3','',1,1,'管理组','','',0),(140,139,'Admin','Rbac','index','',1,1,'角色管理','','',0),(141,140,'Admin','Rbac','member','',1,0,'成员管理','','',1000),(142,140,'Admin','Rbac','authorize','',1,0,'权限设置','','',1000),(143,142,'Admin','Rbac','authorize_post','',1,0,'提交设置','','',0),(144,140,'Admin','Rbac','roleedit','',1,0,'编辑角色','','',1000),(145,144,'Admin','Rbac','roleedit_post','',1,0,'提交编辑','','',0),(146,140,'Admin','Rbac','roledelete','',1,1,'删除角色','','',1000),(147,140,'Admin','Rbac','roleadd','',1,1,'添加角色','','',1000),(148,147,'Admin','Rbac','roleadd_post','',1,0,'提交添加','','',0),(149,139,'Admin','User','index','',1,1,'管理员','','',0),(150,149,'Admin','User','delete','',1,0,'删除管理员','','',1000),(151,149,'Admin','User','edit','',1,0,'管理员编辑','','',1000),(152,151,'Admin','User','edit_post','',1,0,'编辑提交','','',0),(153,149,'Admin','User','add','',1,0,'管理员添加','','',1000),(154,153,'Admin','User','add_post','',1,0,'添加提交','','',0),(155,47,'Admin','Plugin','update','',1,0,'插件更新','','',0),(156,39,'Admin','Storage','index','',1,1,'文件存储','','',0),(157,156,'Admin','Storage','setting_post','',1,0,'文件存储设置提交','','',0),(158,54,'Admin','Slide','ban','',1,0,'禁用幻灯片','','',0),(159,54,'Admin','Slide','cancelban','',1,0,'启用幻灯片','','',0),(160,149,'Admin','User','ban','',1,0,'禁用管理员','','',0),(161,149,'Admin','User','cancelban','',1,0,'启用管理员','','',0),(162,0,'Study','Index','index','',1,1,'PHP学习','','',0),(163,162,'Content','Index','index','',1,1,'内容信息列表','','',0),(164,162,'Study1','Index','index','',1,1,'学生信息查询','','',0);

/*Table structure for table `cmf_nav` */

DROP TABLE IF EXISTS `cmf_nav`;

CREATE TABLE `cmf_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='前台导航表';

/*Data for the table `cmf_nav` */

insert  into `cmf_nav`(`id`,`cid`,`parentid`,`label`,`target`,`href`,`icon`,`status`,`listorder`,`path`) values (1,1,0,'首页','','home','',1,0,'0-1'),(2,1,0,'列表演示','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}','',0,0,'0-2'),(3,1,0,'瀑布流','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}','',0,0,'0-3'),(5,1,0,'政策文件','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"27\";}}','',1,0,'0-5'),(6,1,0,'领导讲话','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"26\";}}','',1,0,'0-6'),(7,1,0,'机构设置','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"25\";}}','',1,0,'0-7'),(8,1,0,'融资服务','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"24\";}}','',1,0,'0-8'),(9,1,0,'人才服务','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"23\";}}','',1,0,'0-9'),(10,1,0,'专题活动','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"20\";}}','',1,0,'0-10'),(11,1,0,'通知公告','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"19\";}}','',1,0,'0-11'),(12,1,0,'重要新闻','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"4\";}}','',1,0,'0-12'),(19,3,0,'习近平参观中埃科技展 为百...','','home','',1,0,'0-19');

/*Table structure for table `cmf_nav_cat` */

DROP TABLE IF EXISTS `cmf_nav_cat`;

CREATE TABLE `cmf_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否显示，1显示，0不显示',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';

/*Data for the table `cmf_nav_cat` */

insert  into `cmf_nav_cat`(`navcid`,`name`,`active`,`remark`) values (1,'主导航',1,'主导航'),(3,'二级菜单',0,'');

/*Table structure for table `cmf_oauth_user` */

DROP TABLE IF EXISTS `cmf_oauth_user`;

CREATE TABLE `cmf_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

/*Data for the table `cmf_oauth_user` */

/*Table structure for table `cmf_options` */

DROP TABLE IF EXISTS `cmf_options`;

CREATE TABLE `cmf_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='全站配置表';

/*Data for the table `cmf_options` */

insert  into `cmf_options`(`option_id`,`option_name`,`option_value`,`autoload`) values (1,'member_email_active','{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}',1),(2,'site_options','{\"site_name\":\"\\u804a\\u57ce\\u4e2d\\u5c0f\\u4f01\\u4e1a\\u670d\\u52a1\\u4e2d\\u5fc3\",\"site_host\":\"http:\\/\\/127.0.0.1\\/\",\"site_admin_url_password\":\"\",\"site_tpl\":\"demo\",\"mobile_tpl_enabled\":\"1\",\"site_adminstyle\":\"bluesky\",\"site_icp\":\"\",\"site_admin_email\":\"1003270759@qq.com\",\"site_tongji\":\"\",\"site_copyright\":\"\\u804a\\u57ce\\u4e2d\\u5c0f\\u4f01\\u4e1a\\u670d\\u52a1\\u4e2d\\u5fc3 2015-2010 \\u7248\\u6743\\u6240\\u6709 \\u804a\\u57ce\\u4e2d\\u5c0f\\u4f01\\u4e1a\\u670d\\u52a1\\u4e2d\\u5fc3 \\u4e3b\\u529e\",\"site_seo_title\":\"\\u804a\\u57ce\\u4e2d\\u5c0f\\u4f01\\u4e1a\\u670d\\u52a1\\u4e2d\\u5fc3\",\"site_seo_keywords\":\"\",\"site_seo_description\":\"\",\"urlmode\":\"0\",\"html_suffix\":\"\",\"comment_time_interval\":60}',1),(3,'cmf_settings','{\"banned_usernames\":\"\"}',1);

/*Table structure for table `cmf_plugins` */

DROP TABLE IF EXISTS `cmf_plugins`;

CREATE TABLE `cmf_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

/*Data for the table `cmf_plugins` */

/*Table structure for table `cmf_posts` */

DROP TABLE IF EXISTS `cmf_posts`;

CREATE TABLE `cmf_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='Portal文章表';

/*Data for the table `cmf_posts` */

insert  into `cmf_posts`(`id`,`post_author`,`post_keywords`,`post_source`,`post_date`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`post_modified`,`post_content_filtered`,`post_parent`,`post_type`,`post_mime_type`,`comment_count`,`smeta`,`post_hits`,`post_like`,`istop`,`recommended`) values (14,1,'男子轻生从9楼跳下 消防气垫受违停影响没接住','','2016-01-21 11:13:20','<p><a href=\"http://www.cankaoxiaoxi.com/roll/roll10/2016/0121/1058747.shtml\" target=\"_blank\">男子轻生从9楼跳下 消防气垫受违停影响没接住</a></p>','男子轻生从9楼跳下 消防气垫受违停影响没接住','男子轻生从9楼跳下 消防气垫受违停影响没接住',1,1,'2016-01-21 11:13:06',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(13,1,'韩剧焚烧人民币引争议 KBS电视台公开道歉 ','','2016-01-21 11:13:04','<p><a href=\"http://baidu.hz.letv.com/kan/awYCM?fr=open_bdnews\" target=\"_blank\">韩剧焚烧人民币引争议 KBS电视台公开道歉 </a><a href=\"http://baidu.hz.letv.com/kan/awYCM?fr=open_bdnews\" target=\"_blank\"><span class=\"related-video-icon\"></span></a></p>','韩剧焚烧人民币引争议 KBS电视台公开道歉 ','韩剧焚烧人民币引争议 KBS电视台公开道歉 ',1,1,'2016-01-21 11:12:51',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(12,1,'融资33亿“新美大”仍存盈利压力 王兴内部讲话谈创新','','2016-01-21 11:10:55','<p><a href=\"http://kejishuoshuo.baijia.baidu.com/article/302777\" target=\"_blank\">融资33亿“新美大”仍存盈利压力 王兴内部讲话谈创新</a></p>','融资33亿“新美大”仍存盈利压力 王兴内部讲话谈创新','融资33亿“新美大”仍存盈利压力 王兴内部讲话谈创新',1,1,'2016-01-21 11:10:41',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',7,0,0,0),(11,1,'中国二次元市场产业链残缺 国产作品全线折戟于日漫','','2016-01-21 11:10:39','<p><a href=\"http://liruchao.baijia.baidu.com/article/303018\" target=\"_blank\">中国二次元市场产业链残缺 国产作品全线折戟于日漫</a></p>','中国二次元市场产业链残缺 国产作品全线折戟于日漫','中国二次元市场产业链残缺 国产作品全线折戟于日漫',1,1,'2016-01-21 11:10:28',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',5,0,0,0),(10,1,'国网冀北电力周密部署春节供电保障工作','国网冀','2016-01-21 11:10:11','<p>中电新闻网讯 通讯员 徐国栋 报道 \r\n为确保冀北地区广大客户过一个亮堂、温暖的新春佳节，1月26日，公司超前谋划，周密部署，制订春节期间值班管理、安全生产、抢修服务、保障供电等工作方\r\n案和应急预案，从整体工作部署、人员组织安排、电网运行方式等多方面，认真组织和准备，确保节日期间电力供应。</p><p _fckxhtmljob=\"1\">　　公司营销部制定具体措施，一是开展节前隐患排查治理工作，巡查基建、配网和营销工作现场6567处，消除树\r\n障6555处，改造10千伏线路186.2千米，更换重过载配变44台，整改重要客户责任安全隐患305个。二是积极迎战极寒天气，做好冬季用电宣传工\r\n作，科学预测负荷需求，及时启动应急预案，实行每日“零报告”，完善应急保暖物资、备品备件、抢修车辆保障措施，确保抢修队伍实时响应、配农网运行基本正\r\n常。三是做好主动服务，对接地方政府，及时了解掌握春节期间重大活动安排和用电需求。开展返乡农民工专项服务（预计节前冀北地区返乡过节农民工约17万\r\n人），各地营业窗口帮助返乡用户办理完成各类用电需求。四是加强95598值班应急管理，做好供电服务舆情防范，充分发挥省级95598监控、督导作用，\r\n有效应对客户用电诉求。五是开展“冀北电力情”主题宣传活动。以对联、扑克牌（电力版）、海报等形式，让广大客户了解安全用电、科学用电等常识。制作宣传\r\n《思念》《团圆》《欢乐》三部系列短片，积极开展“弘扬传统美德，为父母亲情交费”等电子渠道服务活动，截至目前，公司电子渠道共计推广应用78.556\r\n万户。</p><p _fckxhtmljob=\"1\">　　春节期间，公司各单位将加强故障抢修、优质服务工作的组织协调，提前落实应急预案、抢修人员、车辆和物资准\r\n备，确保发生故障后快速响应，迅速组织恢复供电。与此同时，公司相关部门将加强工作协同，严格按照服务、通知、报告、督导“四到位”的要求，消除用电隐\r\n患，确保用电安全。</p>','国网冀北电力周密部署春节供电保障','国网冀北电力周密部署春节供电保障工作',1,1,'2016-01-21 11:09:59',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',104,0,0,0),(9,1,'微博效放开140字数限制 段子手、明星、红人占领难社交','','2016-01-21 11:02:06','<p><a href=\"http://lidonglou.baijia.baidu.com/article/303046\" target=\"_blank\">微博效放开140字数限制 段子手、明星、红人占领难社交</a></p>','微博效放开140字数限制 段子手、明星、红人占领难社交','微博效放开140字数限制 段子手、明星、红人占领难社交',1,1,'2016-01-21 11:01:45',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',8,0,0,0),(15,1,'女子因与7名男子发暧昧短信被丈夫逼迫裸奔(图)','','2016-01-21 11:13:36','<p><a href=\"http://www.cankaoxiaoxi.com/world/20160121/1058475.shtml\" target=\"_blank\">女子因与7名男子发暧昧短信被丈夫逼迫裸奔(图)</a></p>','女子因与7名男子发暧昧短信被丈夫逼迫裸奔(图)','女子因与7名男子发暧昧短信被丈夫逼迫裸奔(图)',1,1,'2016-01-21 11:13:23',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(16,1,'网曝女子地铁用包霸道占座 周围乘客愤怒指责','','2016-01-21 11:13:49','<p><a href=\"http://baidu.hz.letv.com/kan/awaiA?fr=open_bdnews\" target=\"_blank\">网曝女子地铁用包霸道占座 周围乘客愤怒指责</a><a href=\"http://baidu.hz.letv.com/kan/awaiA?fr=open_bdnews\" target=\"_blank\"><span class=\"related-video-icon\"></span></a></p>','网曝女子地铁用包霸道占座 周围乘客愤怒指责','网曝女子地铁用包霸道占座 周围乘客愤怒指责',1,1,'2016-01-21 11:13:38',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',2,0,0,0),(17,1,'男子跳江救落水男童 称手机换一条命算什么 ','','2016-01-21 13:55:53','<p>费费v<a href=\"http://picture.youth.cn/qtdb/201601/t20160121_7552151_1.htm\" target=\"_blank\">男子跳江救落水男童 称手机换一条命算什么 </a></p>','男子跳江救落水男童 称手机换一条命算什么 ','男子跳江救落水男童 称手机换一条命算什么 ',1,1,'2016-01-21 13:55:35',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',86,0,0,0),(18,1,'东航超额售机票 40余人无法登机滞留浦东机场','','2016-01-21 13:56:19','<p><a href=\"http://society.huanqiu.com/article/2016-01/8421537.html?from=bdwz\" target=\"_blank\">东航超额售机票 40余人无法登机滞留浦东机场</a></p>','东航超额售机票 40余人无法登机滞留浦东机场','东航超额售机票 40余人无法登机滞留浦东机场',1,1,'2016-01-21 13:55:55',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',3,0,0,0),(19,1,'杀人狂魔”周克华、张君抓捕关押细节首次披露','','2016-01-21 13:56:37','<p><a href=\"http://www.cankaoxiaoxi.com/roll/roll10/2016/0121/1059474.shtml\" target=\"_blank\">杀人狂魔”周克华、张君抓捕关押细节首次披露</a></p>','杀人狂魔”周克华、张君抓捕关押细节首次披露','杀人狂魔”周克华、张君抓捕关押细节首次披露',1,1,'2016-01-21 13:56:20',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',1,0,0,0),(20,1,'今日Apps:ImgPlay创建属于自己的GIF动态闪图 ','','2016-01-21 13:56:53','<p><a href=\"http://news.china.com.cn/zhuanti/bdjr/2016-01/21/content_37631467.htm\" target=\"_blank\">今日Apps:ImgPlay创建属于自己的GIF动态闪图 </a></p>','今日Apps:ImgPlay创建属于自己的GIF动态闪图 ','今日Apps:ImgPlay创建属于自己的GIF动态闪图 ',1,1,'2016-01-21 13:56:38',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(21,1,'多名老人住殡仪馆等死调查:拆迁款被儿子领走','','2016-01-21 13:57:11','<p><a href=\"http://www.vistastory.com/a/201601/45624.html\" target=\"_blank\">多名老人住殡仪馆等死调查:拆迁款被儿子领走</a></p>','多名老人住殡仪馆等死调查:拆迁款被儿子领走','多名老人住殡仪馆等死调查:拆迁款被儿子领走',1,1,'2016-01-21 13:56:54',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',1,0,0,0),(22,1,'猴年春晚吉祥物发布 网友吐槽：红绿灯成精了','','2016-01-21 13:58:00','<p><a href=\"http://www.cankaoxiaoxi.com/roll/roll10/2016/0121/1059530.shtml\" target=\"_blank\">猴年春晚吉祥物发布 网友吐槽：红绿灯成精了</a></p>','猴年春晚吉祥物发布 网友吐槽：红绿灯成精了','猴年春晚吉祥物发布 网友吐槽：红绿灯成精了',1,1,'2016-01-21 13:57:46',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(23,1,'天津爆炸受损车流入市场 550辆进口车半价拍走','','2016-01-21 13:58:17','<p>模块<a href=\"http://china.huanqiu.com/article/2016-01/8421766.html?from=bdwz\" target=\"_blank\">天津爆炸受损车流入市场 550辆进口车半价拍走</a></p>','天津爆炸受损车流入市场 550辆进口车半价拍走','天津爆炸受损车流入市场 550辆进口车半价拍走',1,1,'2016-01-21 13:58:02',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',1,0,0,0),(24,1,'食药监总局曝光35家餐企食品检出罂粟壳成分','','2016-01-21 13:58:39','<p><a href=\"http://news.china.com/domestic/945/20160121/21239940.html\" target=\"_blank\">食药监总局曝光35家餐企食品检出罂粟壳成分</a></p>','食药监总局曝光35家餐企食品检出罂粟壳成分','食药监总局曝光35家餐企食品检出罂粟壳成分',1,1,'2016-01-21 13:58:19',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',2,0,0,0),(25,1,'中国在东南沿海进行大规模实弹登陆演习(图)','','2016-01-21 18:25:35','<p><a href=\"http://www.cankaoxiaoxi.com/roll/roll10/2016/0121/1059524.shtml\" target=\"_blank\">中国在东南沿海进行大规模实弹登陆演习(图)</a></p>','中国在东南沿海进行大规模实弹登','中国在东南沿海进行大规模实弹登陆演习(图)',1,1,'2016-01-21 18:24:53',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(26,1,' “棉裤”预警地图出炉(图) 九成国土将被速冻','','2016-01-21 18:26:06','<ul class=\"ulist focuslistnews list-paddingleft-2\"><li><p><a href=\"http://www.cankaoxiaoxi.com/roll/roll10/2016/0121/1058748.shtml\" target=\"_blank\">“棉裤”预警地图出炉(图)</a>&nbsp;<a href=\"http://china.huanqiu.com/article/2016-01/8424227.html?from=bdwz\" target=\"_blank\">九成国土将被速冻</a></p></li></ul><p><br/></p>',' “棉裤”预警地图出炉(图) ',' “棉裤”预警地图出炉(图) 九成国土将被速冻',1,1,'2016-01-21 18:25:36',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',2,0,0,0),(27,1,'2015年司法体制改革带给老百姓哪些“获得感”','','2016-01-21 18:26:28','<p><a href=\"http://china.huanqiu.com/article/2016-01/8423936.html?from=bdwz\" target=\"_blank\">2015年司法体制改革带给老百姓哪些“获得感”</a></p>','2015年司法体制改革带给老百姓','2015年司法体制改革带给老百姓哪些“获得感”',1,1,'2016-01-21 18:26:08',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(28,1,'浙江嘉兴大量融雪盐包被市民顺走','','2016-01-21 18:27:44','<p><a href=\"http://society.huanqiu.com/article/2016-01/8421312.html?from=bdwz\" target=\"_blank\">浙江嘉兴大量融雪盐包被市民顺走 媒体：勿食用</a></p>','浙江嘉兴大量融雪盐包被市民顺走 ','浙江嘉兴大量融雪盐包被市民顺走 媒体：勿食用',1,1,'2016-01-21 18:26:29',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',4,0,0,0),(29,1,'习近平参观中埃科技展 为百度等中企点赞 ','','2016-01-21 18:34:13','<p><strong><a href=\"http://tech.huanqiu.com/original/2016-01/8420906.html?from=bdwz\" target=\"_blank\" class=\"a3\">习近平参观中埃科技展 为百度等中企点赞 </a></strong></p>','习近平参观中埃科技展 为百度等中企点赞 ','习近平参观中埃科技展 为百度等中企点赞 ',1,1,'2016-01-21 18:33:43',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(30,1,'现象级网剧《太子妃》被下线 或因“毁三观”伤风化','','2016-01-21 21:22:12','<p><a href=\"http://lannylin.baijia.baidu.com/article/302832\" target=\"_blank\">现象级网剧《太子妃》被下线 或因“毁三观”伤风化</a></p>','现象级网剧《太子妃》被下线 或因“毁三观”伤风化','现象级网剧《太子妃》被下线 或因“毁三观”伤风化',1,1,'2016-01-21 21:21:52',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',1,0,0,0),(31,1,'苹果、微软涉及非洲童工事件 4万名儿童工作数十小时','','2016-01-21 21:22:45','<p><a href=\"http://zhanglei.baijia.baidu.com/article/303528\" target=\"_blank\">苹果、微软涉及非洲童工事件 4万名儿童工作数十小时</a></p>','苹果、微软涉及非洲童工事件 4万名儿童工作数十小时','苹果、微软涉及非洲童工事件 4万名儿童工作数十小时',1,1,'2016-01-21 21:22:24',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',3,0,0,0),(32,1,'低价低质？2016是小米的坎儿','','2016-01-21 21:23:16','<p><a href=\"http://beihai.baijia.baidu.com/article/302925\" target=\"_blank\">低价低质？2016是小米的坎儿</a></p>','低价低质？2016是小米的坎儿&quot;黑美国&quot;黑史：满口改革大搞反腐','低价低质？2016是小米的坎儿',1,1,'2016-01-21 21:22:46',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',1,0,0,0),(33,1,'阿里大事记：2015年的7个细节','','2016-01-21 21:23:39','<p><a href=\"http://lanjingtmt.baijia.baidu.com/article/303043\" target=\"_blank\">阿里大事记：2015年的7个细节</a></p>','阿里大事记：2015年的7个细节&quot;黑美国&quot;黑史：满口改革大搞反腐','阿里大事记：2015年的7个细节',1,1,'2016-01-21 21:23:18',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',1,0,0,0),(34,1,'新浪微博放开140字 全为内容荒','','2016-01-21 21:24:01','<p><a href=\"http://laotie.baijia.baidu.com/article/303011\" target=\"_blank\">新浪微博放开140字 全为内容荒</a></p>','新浪微博放开140字 全为内容荒&quot;黑美国&quot;黑史：满口改革大搞反腐','新浪微博放开140字 全为内容荒',1,1,'2016-01-21 21:23:40',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',2,0,0,0),(35,1,'政府应该怎么治理假医假药假广告','','2016-01-21 21:24:26','<p><a href=\"http://earlzhang.baijia.baidu.com/article/302744\" target=\"_blank\">政府应该怎么治理假医假药假广告</a></p>','政府应该怎么治理假医假药假广告&quot;黑美国&quot;黑史：满口改革大搞反腐','政府应该怎么治理假医假药假广告',1,1,'2016-01-21 21:24:03',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',3,0,0,0),(36,1,'长城边疆为轴的中国文明断代史','','2016-01-21 21:24:52','<p><a href=\"http://renzaotiantang.baijia.baidu.com/article/302945\" target=\"_blank\">长城边疆为轴的中国文明断代史</a></p>','长城边疆为轴的中国文明断代史&quot;黑美国&quot;黑史：满口改革大搞反腐','长城边疆为轴的中国文明断代史',1,1,'2016-01-21 21:24:28',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',15,0,0,0),(37,1,'&quot;黑美国&quot;黑史：满口改革大搞反腐','','2016-01-21 21:25:52','<p><a href=\"http://daxianggonghui.baijia.baidu.com/article/301374\" target=\"_blank\">&quot;黑美国&quot;黑史：满口改革大搞反腐</a></p>','&quot;黑美国&quot;黑史：满口改革大搞反腐&quot;黑美国&quot;黑史：满口改革大搞反腐','&quot;黑美国&quot;黑史：满口改革大搞反腐',1,1,'2016-01-21 21:25:17',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',12,0,0,0),(38,1,'诺奖得主不是院士甚至不是教授','','2016-01-21 21:28:39','<p><a href=\"http://iscientists.baijia.baidu.com/article/303050\" target=\"_blank\">诺奖得主不是院士甚至不是教授</a></p>','诺奖得主不是院士甚至不是教授','诺奖得主不是院士甚至不是教授',1,1,'2016-01-21 21:28:13',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(39,1,'专访完美世界：如何斗腾讯和网易','','2016-01-21 21:28:58','<p><a href=\"http://yuyi.baijia.baidu.com/article/303578\" target=\"_blank\">专访完美世界：如何斗腾讯和网易</a></p>','专访完美世界：如何斗腾讯和网易','专访完美世界：如何斗腾讯和网易',1,1,'2016-01-21 21:28:40',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(40,1,'700Bike：技术产品化的不可控','','2016-01-21 21:29:16','<p><a href=\"http://niubsir.baijia.baidu.com/article/302980\" target=\"_blank\">700Bike：技术产品化的不可控</a></p>','700Bike：技术产品化的不可控','700Bike：技术产品化的不可控',1,1,'2016-01-21 21:28:59',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(41,1,'华为、小米、魅族和锤子们正在','','2016-01-21 21:29:44','<p><a href=\"http://lihao.baijia.baidu.com/article/296045\" target=\"_blank\" title=\"华为、小米、魅族和锤子们正在联手剿杀中国代工厂\">华为、小米、魅族和锤子们正在</a></p>','华为、小米、魅族和锤子们正在','华为、小米、魅族和锤子们正在',1,1,'2016-01-21 21:29:17',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',1,0,0,0),(42,1,'台湾大选的时候 搅屎棍黄安为','','2016-01-21 21:30:04','<p><span class=\"listnum num2\"></span><a href=\"http://husaimeng.baijia.baidu.com/article/299059\" target=\"_blank\" title=\"台湾大选的时候 搅屎棍黄安为什么能够得逞？\">台湾大选的时候 搅屎棍黄安为</a></p>','台湾大选的时候 搅屎棍黄安为','台湾大选的时候 搅屎棍黄安为',1,1,'2016-01-21 21:29:46',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(43,1,'中国土豪遇见好莱坞，万达花23','','2016-01-21 21:30:24','<p><a href=\"http://b12.baijia.baidu.com/article/299644\" target=\"_blank\" title=\"中国土豪遇见好莱坞，万达花230亿买了个爹\">中国土豪遇见好莱坞，万达花23</a></p>','中国土豪遇见好莱坞，万达花23','中国土豪遇见好莱坞，万达花23',1,1,'2016-01-21 21:30:06',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',2,0,0,0),(44,1,'为何中国成了今年来最大一只黑','','2016-01-21 21:30:43','<p><span class=\"listnum num4\"></span><a href=\"http://yixianrong.baijia.baidu.com/article/298413\" target=\"_blank\" title=\"为何中国成了今年来最大一只黑天鹅？\">为何中国成了今年来最大一只黑</a></p>','为何中国成了今年来最大一只黑','为何中国成了今年来最大一只黑',1,1,'2016-01-21 21:30:25',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',4,0,0,0),(45,1,'苹果在中国市场的欢喜与隐忧','','2016-01-21 21:31:04','<p><span class=\"listnum num5\"></span><a href=\"http://niubsir.baijia.baidu.com/article/298829\" target=\"_blank\" title=\"苹果在中国市场的欢喜与隐忧\">苹果在中国市场的欢喜与隐忧</a></p>','苹果在中国市场的欢喜与隐忧','苹果在中国市场的欢喜与隐忧',1,1,'2016-01-21 21:30:44',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(46,1,'[视频]山东文化科技卫生三下乡活动在东营启动','','2016-01-21 21:53:40','<ul class=\"ulist focuslistnews list-paddingleft-2\" id=\"localnews-focus\"><li><p><span class=\"dot\"></span><a href=\"http://www.sd.xinhuanet.com/sdws/2016-01/21/c_1117846599.htm\" target=\"_blank\">[视频]山东文化科技卫生三下乡活动在东营启动</a></p></li></ul><p><br/></p>','[视频]山东文化科技卫生三下乡活动在东营启动','[视频]山东文化科技卫生三下乡活动在东营启动',1,1,'2016-01-21 21:53:18',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(47,1,'山东省利津县三年增绿计划实现应绿尽绿','','2016-01-21 21:53:58','<p><a href=\"http://www.zgmuye.com/news/show-35860.html\" target=\"_blank\">山东省利津县三年增绿计划实现应绿尽绿</a></p>','山东省利津县三年增绿计划实现应绿尽绿','山东省利津县三年增绿计划实现应绿尽绿',1,1,'2016-01-21 21:53:41',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(48,1,'中国创新创业产教研战略联盟在山东省东营市成立','','2016-01-21 21:54:17','<p><a href=\"http://www.sd.xinhuanet.com/sd/dy/2016-01/21/c_1117852116.htm\" target=\"_blank\">中国创新创业产教研战略联盟在山东省东营市成立</a></p>','中国创新创业产教研战略联盟在山东省东营市成立','中国创新创业产教研战略联盟在山东省东营市成立',1,1,'2016-01-21 21:53:59',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(49,1,'工资欠了三万元 老板给了“闭门羹”','','2016-01-21 21:54:37','<p><a href=\"http://www.dzwww.com/shandong/sdnews/201601/t20160120_13724967.htm\" target=\"_blank\">工资欠了三万元 老板给了“闭门羹”</a></p>','工资欠了三万元 老板给了“闭门羹”','工资欠了三万元 老板给了“闭门羹”',1,1,'2016-01-21 21:54:19',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(50,1,'山东电网2015年消纳“绿电”180亿千瓦时','','2016-01-21 21:54:56','<p><a href=\"http://guangfu.bjx.com.cn/news/20160121/703562.shtml\" target=\"_blank\">山东电网2015年消纳“绿电”180亿千瓦时</a></p>','山东电网2015年消纳“绿电”180亿千瓦时','山东电网2015年消纳“绿电”180亿千瓦时',1,1,'2016-01-21 21:54:38',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(51,1,'赞！东营这10人被表彰为见义勇为先进分子 奖金...','','2016-01-21 21:55:13','<p><a href=\"http://dongying.sdchina.com/show/3678668.html\" target=\"_blank\">赞！东营这10人被表彰为见义勇为先进分子 奖金...</a></p>','赞！东营这10人被表彰为见义勇为先进分子 奖金...','赞！东营这10人被表彰为见义勇为先进分子 奖金...',1,1,'2016-01-21 21:54:57',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(52,1,'东营：酒驾连环撞牵出“案中案” 司机早被吊销驾...','','2016-01-21 21:55:30','<p><a href=\"http://news.dahe.cn/2016/01-21/106352880.html\" target=\"_blank\">东营：酒驾连环撞牵出“案中案” 司机早被吊销驾...</a></p>','东营：酒驾连环撞牵出“案中案” 司机早被吊销驾...','东营：酒驾连环撞牵出“案中案” 司机早被吊销驾...',1,1,'2016-01-21 21:55:14',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(53,1,'时尚体验 三星S6 Edge+东营报价4680元','','2016-01-21 21:55:48','<p><a href=\"http://mobile.zol.com.cn/565/5651164.html\" target=\"_blank\">时尚体验 三星S6 Edge+东营报价4680元</a></p>','时尚体验 三星S6 Edge+东营报价4680元','时尚体验 三星S6 Edge+东营报价4680元',1,1,'2016-01-21 21:55:31',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(54,1,'山东东营河口区推动海参产业实现突破','','2016-01-21 21:56:55','<p><a href=\"http://www.shuichan.cc/news_view-270654.html\" target=\"_blank\">山东东营河口区推动海参产业实现突破</a></p>','山东东营河口区推动海参产业实现突破','山东东营河口区推动海参产业实现突破',1,1,'2016-01-21 21:56:37',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',1,0,0,0),(55,1,'谣言为什么不缺受众 明明漏洞百出却仍转发无','','2016-01-21 21:57:27','<p><a href=\"http://news.sdinfo.net/shxw/2467767.shtml\" target=\"_blank\">谣言为什么不缺受众 明明漏洞百出却仍转发无</a></p>','谣言为什么不缺受众 明明漏洞百出却仍转发无','谣言为什么不缺受众 明明漏洞百出却仍转发无',1,1,'2016-01-21 21:56:56',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(56,1,'闹乌龙！老人开车去赶集忘记车停哪 报案说车','','2016-01-21 21:57:53','<p><a href=\"http://www.dzwww.com/shandong/sdnews/201601/t20160120_13722771.htm\" target=\"_blank\">闹乌龙！老人开车去赶集忘记车停哪 报案说车</a></p>','闹乌龙！老人开车去赶集忘记车停哪 报案说车','闹乌龙！老人开车去赶集忘记车停哪 报案说车',1,1,'2016-01-21 21:57:28',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',5,0,0,0),(57,1,'这个男子真“暴”！强行提供贷款拘禁对方逼迫','','2016-01-21 21:59:48','<p><a href=\"http://www.dzwww.com/shandong/sdnews/201601/t20160120_13719535.htm\" target=\"_blank\">这个男子真“暴”！强行提供贷款拘禁对方逼迫</a></p>','这个男子真“暴”！强行提供贷款拘禁对方逼迫','这个男子真“暴”！强行提供贷款拘禁对方逼迫',1,1,'2016-01-21 21:59:27',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(58,1,'东营市民政局为困难居民送温暖','','2016-01-21 22:00:06','<p><a href=\"http://www.dzwww.com/shandong/sdnews/201601/t20160120_13718048.htm\" target=\"_blank\">东营市民政局为困难居民送温暖</a></p>','东营市民政局为困难居民送温暖','东营市民政局为困难居民送温暖',1,1,'2016-01-21 21:59:49',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(59,1,'年关将近 东营公安机关发布公交车“防扒秘籍”','','2016-01-21 22:00:29','<p><a href=\"http://sd.dzwww.com/sdxwjxs/dy_132271/201601/t20160120_13720971.htm\" target=\"_blank\">年关将近 东营公安机关发布公交车“防扒秘籍”</a></p>','年关将近 东营公安机关发布公交车“防扒秘籍”','年关将近 东营公安机关发布公交车“防扒秘籍”',1,1,'2016-01-21 22:00:08',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(60,1,'东营获立法权后首个立法计划草案向社会公开','','2016-01-21 22:00:50','<p><a href=\"http://news.dahe.cn/2016/01-19/106344337.html\" target=\"_blank\">东营获立法权后首个立法计划草案向社会公开</a></p>','东营获立法权后首个立法计划草案向社会公开','东营获立法权后首个立法计划草案向社会公开',1,1,'2016-01-21 22:00:30',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',1,0,0,0),(61,1,'人民币基金吃相难看：跳单剽窃常态 也有死亡潮','','2016-01-21 22:03:06','<p><a href=\"http://yuyi.baijia.baidu.com/article/303623\" target=\"_blank\">人民币基金吃相难看：跳单剽窃常态 也有死亡潮</a></p>','人民币基金吃相难看：跳单剽窃常态 也有死亡潮','人民币基金吃相难看：跳单剽窃常态 也有死亡潮',1,1,'2016-01-21 22:02:47',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(62,1,'百度邀您参与2016年春运服务体验大调查','','2016-01-21 22:03:24','<p><a href=\"http://chunyun.itsc.cn/\" target=\"_blank\">百度邀您参与2016年春运服务体验大调查</a></p>','百度邀您参与2016年春运服务体验大调查','百度邀您参与2016年春运服务体验大调查',1,1,'2016-01-21 22:03:07',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',1,0,0,0),(63,1,'最靠谱的奢侈品报告出炉了 2015年中国市场下滑了2%','','2016-01-21 22:03:43','<p><a href=\"http://www.jiemian.com/article/517009.html\" target=\"_blank\">最靠谱的奢侈品报告出炉了 2015年中国市场下滑了2%</a></p>','最靠谱的奢侈品报告出炉了 2015年中国市场下滑了2%','最靠谱的奢侈品报告出炉了 2015年中国市场下滑了2%',1,1,'2016-01-21 22:03:26',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(64,1,'2016年中央政法工作会议','','2016-01-21 22:04:01','<p><a href=\"http://topics.gmw.cn/node_82116.htm\" target=\"_blank\">2016年中央政法工作会议</a></p>','2016年中央政法工作会议','2016年中央政法工作会议',1,1,'2016-01-21 22:03:44',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',1,0,0,0),(65,1,'调查称中国网骗高知人群受害多 仅2成辟谣行骗信息','','2016-01-21 22:04:20','<p><a href=\"http://china.cankaoxiaoxi.com/bd/20160120/1057851.shtml\" target=\"_blank\">调查称中国网骗高知人群受害多 仅2成辟谣行骗信息</a></p>','调查称中国网骗高知人群受害多 仅2成辟谣行骗信息','调查称中国网骗高知人群受害多 仅2成辟谣行骗信息',1,1,'2016-01-21 22:04:02',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',29,0,0,0),(66,1,'《山东中小企业之声》（最新）','','2016-01-21 22:14:13','<p>《山东中小企业之声》（最新）</p>','《山东中小企业之声》（最新）','《山东中小企业之声》（最新）',1,1,'2016-01-21 22:13:48',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(67,1,'聊城市中小企业简报','','2016-01-21 22:15:22','<p>聊城市中小企业简报</p>','聊城市中小企业简报','聊城市中小企业简报',1,1,'2016-01-21 22:14:14',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(68,1,'聊城市中小企业公共服务平台','','2016-01-21 22:15:54','<p>聊城市中小企业公共服务平台</p>','聊城市中小企业公共服务平台','聊城市中小企业公共服务平台',1,1,'2016-01-21 22:15:23',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(69,1,'中小企业信用担保业务','','2016-01-21 22:16:26','<p>中小企业信用担保业务</p>','中小企业信用担保业务','中小企业信用担保业务',1,1,'2016-01-21 22:15:56',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(70,1,'中小企业信用担保机构免征','','2016-01-21 22:17:03','<p>中小企业信用担保机构免征</p>','中小企业信用担保机构免征','中小企业信用担保机构免征',1,1,'2016-01-21 22:16:28',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(71,1,'聊城市中小企业服务机构认定','','2016-01-21 22:17:49','<p>聊城市中小企业服务机构认定</p>','聊城市中小企业服务机构认定','聊城市中小企业服务机构认定',1,1,'2016-01-21 22:17:05',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(72,1,'全国中小企业生产经营运行','','2016-01-21 22:18:31','<p>全国中小企业生产经营运行</p>','全国中小企业生产经营运行','全国中小企业生产经营运行',1,1,'2016-01-21 22:17:50',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(73,1,'习近平会见伊朗最高领袖哈梅内伊','','2016-01-24 17:07:46','<p><strong><a href=\"http://www.cankaoxiaoxi.com/roll/roll10/2016/0124/1061544.shtml\" target=\"_blank\" class=\"a3\">习近平会见伊朗最高领袖哈梅内伊</a></strong></p>','习近平会见伊朗最高领袖哈梅内伊','习近平会见伊朗最高领袖哈梅内伊',1,1,'2016-01-24 17:07:01',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',2,0,0,0),(74,1,'李克强减税降费 助千百万市场主体轻装上阵','','2016-01-24 17:08:12','<p><strong><a href=\"http://news.youth.cn/sz/201601/t20160124_7561589.htm\" target=\"_blank\" class=\"a3\">李克强减税降费 助千百万市场主体轻装上阵</a></strong></p>','李克强减税降费 助千百万市场主体轻装上阵','李克强减税降费 助千百万市场主体轻装上阵',1,1,'2016-01-24 17:07:51',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',9,0,0,0),(75,1,'AR/VR从理论转向现实的困难窘境','AR/VR从理论转向现实的困难窘境','2016-01-24 17:08:32','<p>一元复始，岁序更新，<a href=\"http://country.huanqiu.com/china\" class=\"linkAbout\" target=\"_blank\" title=\"中国\">中国</a>特色大国外交又一次扬帆起航，满载而归。2016年1月19日至23日，中国国家主席习近平对<a href=\"http://country.huanqiu.com/saudi_arabia\" class=\"linkAbout\" target=\"_blank\" title=\"沙特\">沙特</a>、<a href=\"http://country.huanqiu.com/egypt\" class=\"linkAbout\" target=\"_blank\" title=\"埃及\">埃及</a>、<a href=\"http://country.huanqiu.com/iran\" class=\"linkAbout\" target=\"_blank\" title=\"伊朗\">伊朗</a>的国事访问取得圆满成功。此次中东之行是习近平2016年首次出访，也标志着党的十八大以来习近平出访足迹实现全球覆盖。</p><p style=\"font-size: 14px;\">　　面对纷繁复杂的国际形势、加速演变的世界格局，以习近平同志为总书记的党中央大手笔布局，全方位推进中国特色大国外交，一个承前启后的外交新格局全面展开——中国的全球伙伴关系网络日益成形，中国加快走向世界舞台中心。</p><p style=\"font-size: 14px;\">　　“蹄疾而步稳”。3年多来，跟着习近平的出访足迹，中国外交布局清晰可见。出访20次，累计138天，行程近40万公里，相当于绕地球飞行近10圈，足迹遍布各大洲。同时，各国元首、政府首脑和国际组织代表纷纷来华访问，握手中南海。</p><p style=\"font-size: 14px;\">　　大国是关键，推动构建新型大国关系；周边是首要，推动构建“亚洲命运共同体”；发展中国家\r\n是基础，加强与发展中国家团结合作；多边是重要舞台，积极参与多边事务。中国外交延续着基本的布局框架，同时不断开拓创新，在处理同外部世界关系中所展现\r\n的中国特色、中国风格、中国气派，将传承与超越、战略与策略、历史与现实、中国与世界有机统一，开局、布局，呈现负责任的大智慧。</p><p style=\"font-size: 14px;\">　　有步骤，有章法；有高瞻远瞩的战略布局，有以简驭繁的策略运筹；捍卫利益正气凛\r\n然，对待朋友情深义重；该担责任坚决担当，外交风云舍我其谁。和平、发展、合作、共赢，一路走来，始终秉持。国际舆论借拿破仑“沉睡的狮子”断言：中国已\r\n经醒了，而习近平正肩负着带领全面苏醒的中国走向伟大民族复兴的历史使命。</p><p style=\"font-size: 14px;\">　　<strong>合作共赢</strong></p><p style=\"font-size: 14px;\">　　<strong>“世界上本无‘修昔底德陷阱’”</strong></p><p style=\"font-size: 14px;\">　　大国是关键。</p><p style=\"font-size: 14px;\">　　<a href=\"http://country.huanqiu.com/russia\" class=\"linkAbout\" target=\"_blank\" title=\"俄罗斯\">俄罗斯</a>是大国，又是中国最大的邻国。</p><p style=\"font-size: 14px;\">　　2013年3月，习近平主席展开他履新后的首次出访，对俄罗斯进行国事访问，十八大以来的中国外交布局从此拉开序幕。中国外交顶层设计层层铺展，令世人耳目一新、刮目相看。</p><p style=\"font-size: 14px;\">　　抵达莫斯科首日，俄罗斯总统普京全程陪同，历时8小时。2014年2月，新春佳节\r\n之际，习近平不远万里前往俄罗斯出席索契冬奥会开幕式。“邻居家办喜事，我当然要来道贺，同俄罗斯人民分享喜悦。”一语道出中俄全面战略协作伙伴关系的高\r\n水平、特殊性。2015年5月，习近平再次来到莫斯科。红场大阅兵，普京在庆典上讲话，称赞中国人民抗日战争为世界反法西斯战争胜利作出巨大贡献。</p><p style=\"font-size: 14px;\">　　3年多来，俄罗斯是习近平留下出访足迹最多的国家。两个携手走向伟大复兴的大国，迎来了两国关系的历史最好时期，走出了一条结伴而不结盟、共同繁荣的新路。</p><p style=\"font-size: 14px;\">　　<a href=\"http://country.huanqiu.com/america\" class=\"linkAbout\" target=\"_blank\" title=\"美国\">美国</a>是大国，中国如何与之相处？</p><p style=\"font-size: 14px;\">　　历史曾经一再重复大国崛起的怪圈，古<a href=\"http://country.huanqiu.com/greece\" class=\"linkAbout\" target=\"_blank\" title=\"希腊\">希腊</a>学者断言的“修昔底德陷阱”被视为国际关系的“铁律”。<a href=\"http://country.huanqiu.com/germany\" class=\"linkAbout\" target=\"_blank\" title=\"德国\">德国</a>学者沃尔夫冈·希恩甚至在专著中预言，随着中国日益崛起，中美可能滑向一场“新冷战”。</p><p style=\"font-size: 14px;\">　　然而，中国领导人就中美关系展开的高瞻远瞩的思考，中美在应对气候变化、伊朗核问题等诸多重大领域合作的事实及其所彰显的引领作用，有力地驳斥了所谓的“修昔底德陷阱”论调。</p><p style=\"font-size: 14px;\">　　“宽广的太平洋有足够空间容纳中美两个大国”“中美拥有广泛而重要的共同利益，中\r\n美合则两利，斗则俱伤”“世界上本无‘修昔底德陷阱’”“中国梦要实现国家富强、民族复兴、人民幸福，是和平、发展、合作、共赢的梦，与包括美国梦在内的\r\n世界各国人民的美好梦想相通”。习近平关于中美关系的一系列重要论述，显示了对构建新型大国关系这一历史使命的担当。</p><p style=\"font-size: 14px;\">　　2013年，庄园会晤。两国元首以政治担当和智慧，达成共同构建中美新型大国关系\r\n的共识。2014年，瀛台夜话。习近平放眼长远：“我们不能让它停留在概念上，也不能满足于早期收获，还要继续向前走。”2015年，白宫秋叙。双方重申\r\n继续构建基于相互尊重、合作共赢的中美新型大国关系。当然，这一进程不可能一帆风顺。习近平以蕴含中国智慧的哲学思维看待分歧：“要看大局，正所谓‘得其\r\n大者可以兼其小’。”</p><p style=\"font-size: 14px;\">　　习近平主席提出中美新型大国关系，这是一种富有智慧的政治远见。美国前国务卿基辛格如是表示。著名国际关系学者、哈佛大学教授约瑟夫·奈认为，美中加强各层面交往，客观理性看待对方，完全可以避免“修昔底德陷阱”。</p>','AR/VR从理论转向现实的困难窘境','AR/VR从理论转向现实的困难窘境',1,1,'2016-01-24 17:08:14',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',213,0,0,0),(76,1,'2016年春运启动 或发送旅客近30亿人次','','2016-01-24 17:09:17','<p><a href=\"http://www.cankaoxiaoxi.com/roll/roll10/2016/0124/1061311.shtml\" target=\"_blank\">2016年春运启动 或发送旅客近30亿人次</a></p>','2016年春运启动 或发送旅客近30亿人次','2016年春运启动 或发送旅客近30亿人次',1,1,'2016-01-24 17:08:33',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',1,0,0,0),(77,1,' 中国人在澳买房7成用现金','','2016-01-24 17:09:50','<ul class=\"ulist focuslistnews list-paddingleft-2\"><li><p><a href=\"http://www.cankaoxiaoxi.com/world/20160124/1060759.shtml\" target=\"_blank\">中国人在澳买房7成用现金 澳或收紧法律防洗钱</a></p></li></ul><p><br/></p>',' 中国人在澳买房7成用现金 澳或收紧法律防洗钱','中国人在澳买房7成用现金 澳或收紧法律防洗钱',1,1,'2016-01-24 17:09:19',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',7,0,0,0),(78,1,'周星驰做广东政协委员4年无1提案 不迟到就早退','','2016-01-24 17:11:09','<p><a href=\"http://www.taiwan.cn/xwzx/PoliticsNews/201601/t20160124_11372441.htm\" target=\"_blank\">周星驰做广东政协委员4年无1提案 不迟到就早退</a></p>','周星驰做广东政协委员4年无1提案 不迟到就早退','周星驰做广东政协委员4年无1提案 不迟到就早退',1,1,'2016-01-24 17:09:52',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(79,1,'总回应“高铁不卖方便面”：动车组密封性好','','2016-01-24 17:11:28','<p><a href=\"http://www.vistastory.com/a/201601/45764.html\" target=\"_blank\">总回应“高铁不卖方便面”：动车组密封性好</a></p>','总回应“高铁不卖方便面”：动车组密封性好','总回应“高铁不卖方便面”：动车组密封性好',1,1,'2016-01-24 17:11:10',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(80,1,'十八大以来10名省部级干部遭“断崖式”降级','','2016-01-24 17:11:45','<p><a href=\"http://d.youth.cn/shrgch/201601/t20160124_7560488.htm\" target=\"_blank\">十八大以来10名省部级干部遭“断崖式”降级</a></p>','十八大以来10名省部级干部遭“断崖式”降级','十八大以来10名省部级干部遭“断崖式”降级',1,1,'2016-01-24 17:11:29',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',3,0,0,0),(81,1,'',NULL,'2016-01-24 17:29:41','','iiii','',0,1,'2016-01-24 17:29:30',NULL,0,2,'',0,'{\"template\":\"index1\",\"thumb\":\"\"}',0,0,0,0),(82,1,'',NULL,'2016-01-25 12:01:36','','法律服务','',0,1,'2016-01-25 12:01:17',NULL,0,2,'',0,'{\"template\":\"zindex\",\"thumb\":\"\"}',0,0,0,0),(89,1,'  习近平治国理政四大特征','百度新闻','2016-01-28 10:49:23','<p>　习近平总书记指出的“不能脚踩西瓜皮，滑到哪里算哪里”，直接道出了治国理政必须遵循规律、不能违背规律的真谛。</p><p style=\"font-size: 14px;\">　　在这三年治国理政实践中，习近平总书记带领新一届党中央，不断深化对共产党执政规律、社会主义建设规律、人类社会发展规律的认识，并在此基础上不断进行大胆探索实践。</p><p style=\"font-size: 14px;\">　　<strong>1遵循共产党执政规律(四个坚持)</strong></p><p style=\"font-size: 14px;\">　　遵循共产党执政规律，主要体现在“四个坚持”上：</p><p style=\"font-size: 14px;\">　　一是坚持党政军民学、东西南北中，党的领导覆盖一切。</p><p style=\"font-size: 14px;\">　　二是坚持推进任何改革发展事业必须以加强党的领导为前提。</p><p style=\"font-size: 14px;\">　　三是坚持不断提高党的执政能力和执政水平，提升人民群众对党执政的信任度和支持度，不断增强党执政的合法性。</p><p style=\"font-size: 14px;\">　　四是坚持加强党的自身建设，保持执政党的先进性、纯洁性，不断增强自身的凝聚力、战斗力、号召力。</p><p style=\"font-size: 14px;\">　　<strong>2遵循社会主义建设规律(四个坚信)</strong></p><p style=\"font-size: 14px;\">　　遵循社会主义建设规律，主要体现在“四个坚信”上：</p><p style=\"font-size: 14px;\">　　一是坚信社会主义制度比资本主义制度更优越，社会主义能够救中国，同样能发展中国，更能壮大中国、成就中国。</p><p style=\"font-size: 14px;\">　　二是坚信任何时候都要坚持道路自信、理论自信、制度自信，这是历史的选择、人民的选择、实践的明证。</p><p style=\"font-size: 14px;\">　　三是坚信党有能力最大限度发挥社会主义制度优越性，必须坚持开放、包容、吸收、借鉴一切文明成果，扬长避短，完善自己、强大自己。</p><p style=\"font-size: 14px;\">　　四是坚信中国道路本质是社会主义，中国特色必须服从、服务于社会主义本质，理念可以创新，但本质不能改变。同时，绝不能只走老路，而要勇闯新路，坚决不走邪路。</p><p style=\"font-size: 14px;\">　　<strong>3遵循人类社会发展规律(四个坚持)</strong></p><p style=\"font-size: 14px;\">　　遵循人类社会发展规律，主要体现在“四个坚持”上：</p><p style=\"font-size: 14px;\">　　一是坚持把本国、本民族发展这条“河流”融入全球发展的历史长河中，既遵循人类社会发展大规律，又大胆探索，向世界提供富有创造力的“中国智慧”“中国经验”“中国方案”，使中国发展和世界发展紧密相连相融。</p><p style=\"font-size: 14px;\">　　二是坚持把发展生产力和理顺生产关系同步协调，通过深化改革解放生产力，通过体制创新优化生产关系，最大限度化解二者之间不相适应的矛盾。</p><p style=\"font-size: 14px;\">　　三是坚持以创新理念为发展“指挥棒”，践行创新、协调、绿色、开放、共享新理念，实施创新发展、开放发展、和谐发展、竞合发展、共赢发展，解决人类社会发展持续驱动力问题。</p><p style=\"font-size: 14px;\">　　四是坚持以人为本推动包容性发展。强调包括弱势群体在内的所有人民群众的实际需求，让国家\r\n经济发展的成果惠及全体人民，让人民共同承担发展责任、拥有发展机会、分享发展红利，形成最大公约数，增强发展的持续性和内生动力，从而形成良好的政治生\r\n态。同时，处处体现以人为本思想，时时维护社会公平正义，促进人与社会、人与自然的和谐发展。</p>','  习近平治国理政四大特征','习近平治国理政四大特征',1,1,'2016-01-28 10:48:14',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',247,0,0,0),(83,1,'国民党前副主席郝龙斌宣布参选国民党主席','','2016-01-26 16:10:49','<p>国民党前副主席郝龙斌宣布参选国民党主席</p>','国民党前副主席郝龙斌宣布参选国民党主席','国民党前副主席郝龙斌宣布参选国民党主席',1,1,'2016-01-26 16:10:38',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(84,1,'微博效放开140字数限制 段子手、明星、红人占领难社交','','2016-01-26 16:11:24','<p>微博效放开140字数限制 段子手、明星、红人占领难社交</p>','微博效放开140字数限制 段子手、明星、红人占领难社交','微博效放开140字数限制 段子手、明星、红人占领难社交',1,1,'2016-01-26 16:11:14',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',0,0,0,0),(85,1,'融资33亿“新美大”仍存盈利压力 王兴内部讲话谈创新','','2016-01-26 16:31:50','<p>融资33亿“新美大”仍存盈利压力 王兴内部讲话谈创新</p>','融资33亿“新美大”仍存盈利压力 王兴内部讲话谈创新','融资33亿“新美大”仍存盈利压力 王兴内部讲话谈创新',1,1,'2016-01-26 16:31:39',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',3,0,0,0),(86,1,'中国二次元市场产业链残缺 国产作品全线折戟于日漫','','2016-01-26 16:32:20','<p>中国二次元市场产业链残缺 国产作品全线折戟于日漫</p>','中国二次元市场产业链残缺 国产作品全线折戟于日漫','中国二次元市场产业链残缺 国产作品全线折戟于日漫',1,1,'2016-01-26 16:32:11',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',4,0,0,0),(87,1,'',NULL,'2016-01-27 09:52:18','','政策文件','',0,1,'2016-01-27 09:51:50',NULL,0,2,'',0,'{\"template\":\"userlist\",\"thumb\":\"\"}',0,0,0,0),(88,1,'',NULL,'2016-01-27 17:49:12','','assa','',0,1,'2016-01-27 17:49:01',NULL,0,2,'',0,'{\"template\":\"index\",\"thumb\":\"\"}',0,0,0,0),(90,1,'中共中央政治局召开会议 习近平主持','百度新闻','2016-01-30 11:45:09','<p>　一周时间，读懂三年。</p><p>　　这是一次，不虚此行的思想之旅。</p><p>　　读懂这三年，需读懂一党；读懂一党，需读懂一人；读懂一人，需读懂他的治国理政新思想、新理念、新战略、新境界。</p><p>　　他就是习近平。</p><p>　　本周一到周五，学习小组（微信号：xuexixiaozu）尝试和组员一起，读懂习近平这三年，乃至中国的这三年。此前，从周一到周四，我们分别推送了周新民谈“习近平治国理政秘笈”中的四大贡献、四大支柱、四大特征、四大核心能力。</p><p>　　今天，学习小组（微信号xuexixiaozu）集合而成全文版，含4部分：四大贡献、四大支柱、四大特征、四大核心能力。因单篇微信字数限定2万字，本文有删节。完整的内容，大家往前翻看。本次推荐，到此完成。祝大家周末愉快。</p><p>　　今天，习总主持政治局会议。会议强调，只有增强政治意识、大局意识、核心意识、看齐意识，自觉在思想上政治上行动上同以习近平同志为总书记的党中央保持高度一致，才能使我们党更加团结统一、坚强有力，始终成为中国特色社会主义事业的坚强领导核心。</p><p>　　大家请留意4个意识。尤其要向以习近平同志为总书记的党中央看齐。</p><p>　　【独家】习近平治国理政秘笈（全文版）</p><p>　　（1）这三年，习近平治国理政的四大贡献</p><p>　　周新民</p><p>　　习近平总书记履新三年。这三年产生的新理念、新思想、新战略，不仅功在当代，而且利在千秋。可以预见，这三年已经践行、正在践行的思想路线和政策方略，必将对未来中国产生持续而深远的影响。</p><p>　　有理由相信，这三年不断积累的宝贵经验和升华形成的思想成果、理论成果，必将为在全新起点上开创更高的治国理政境界发挥不可估量的作用，必将有力指导、引领和推动治国理政的伟大实践不断向纵深推进。</p><p>　　根据这三年治国理政呈现的特点和取得的巨大成就，可以把习近平总书记治国理政的贡献归结为四个方面。就是：</p><p>　　（1）全面重塑了党在人民群众心中的良好形象；</p><p>　　（2）形成了“中国梦”引领下的治国理政思想体系；</p><p>　　（3）构建了执政党治理、国家治理、全球治理“三合一”的治理格局；</p><p>　　（4）巩固了符合中国政治体制特点的高效领导模式。</p><p>　　贡献一：</p><p>　　全面重塑党在人民群众心中的良好形象</p><p>　　领导我们事业的核心是中国共产党。历史经验表明，党在人民群众心中的形象越好，事业就越兴旺，前景就越光明。但必须正视，脱离群众的危险不以人\r\n的意志为转移，尖锐地摆到了党和国家的面前。事实上，一个时期以来，党在人民群众心目中的形象较过去相比，不是变高了，而是变低了、变小了、变差了，主要\r\n是一些贪官污吏损害了党的形象，败坏了党的名声，伤害了人民群众对党的感情。</p><p>　　十八大以来，党中央以清醒的认知，看到了人民群众对党的向心力在变弱的杀伤力和危害性。在凝聚党心的同时，迈开了凝聚民心的新步伐，以自信的态\r\n度、果敢的勇气、坚定的意志、正义的情怀，坚定不移执行“八项规定”，反对“四风”，深层发力破除潜规则，重拳出击打击腐败，积极构建清正廉明的政治生\r\n态，维护社会公平正义，重塑党在人民群众心中的形象，取得了超出预期的成效，党在短时间内重塑形象，赢取人民群众的信任，为开创治国理政新局面夯实了坚实\r\n的人心根基。</p><p>　　1</p><p>　　政治局带头执行“八项规定”，让人民群众领略了党的鲜明姿态。</p><p>　　重塑党的形象，坚持从党中央做起，响亮喊出了“向中央看齐”的口号。无论“八项规定”，还是“群众路线教育实践活动”、“三严三实专题教育”，\r\n党中央高层以上率下反四风、转作风、树新风，让人民群众眼前为之一亮，心头为之一热，看到了党中央与人民群众一条心的自觉姿态。习总书记到地方调研，吃自\r\n助餐，一顿饭限定6个菜。</p>','中共中央政治局召开会议 习近平主持','中共中央政治局召开会议 习近平主持',1,1,'2016-01-30 11:43:56',NULL,0,NULL,'',0,'{\"thumb\":\"\",\"photo\":[{\"url\":\"20160130\\/56ac31c287ee5.png\",\"alt\":\"1\"}]}',9,0,0,0),(91,1,' 李克强:决不让留守儿童成社会之殇  经济指标 ','百度新闻','2016-01-30 11:48:36','<p><strong><a href=\"http://china.huanqiu.com/article/2016-01/8475361.html?from=bdwz\" target=\"_blank\" class=\"a3\">李克强:决不让留守儿童成社会之殇</a>&nbsp;<a href=\"http://china.huanqiu.com/article/2016-01/8475372.html?from=bdwz\" target=\"_blank\" class=\"a3\">经济指标</a></strong></p>',' 李克强:决不让留守儿童成社会之殇  经济指标 ',' 李克强:决不让留守儿童成社会之殇  经济指标 ',1,1,'2016-01-30 11:48:08',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',2,0,0,0),(92,1,'小米面临中年危机 国产手机急需维护品牌形象','百度新闻','2016-01-30 11:49:40','<p><strong><a href=\"http://jiangbojing.baijia.baidu.com/article/313160\" target=\"_blank\" class=\"a3\">小米面临中年危机 &nbsp;<strong><a href=\"http://jiangbojing.baijia.baidu.com/article/313160\" target=\"_blank\" class=\"a3\">小米面临中年危机 &nbsp;国产手机急需维护品牌形象</a></strong>国产手机急需维护品牌形象</a></strong></p>','小米面临中年危机 国产手机急需维护品牌形象','小米面临中年危机 国产手机急需维护品牌形象',1,1,'2016-01-30 11:49:07',NULL,0,NULL,'',0,'{\"thumb\":\"\"}',2,0,0,0);

/*Table structure for table `cmf_role` */

DROP TABLE IF EXISTS `cmf_role`;

CREATE TABLE `cmf_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `cmf_role` */

insert  into `cmf_role`(`id`,`name`,`pid`,`status`,`remark`,`create_time`,`update_time`,`listorder`) values (1,'超级管理员',0,1,'拥有网站最高管理员权限！',1329633709,1329633709,0);

/*Table structure for table `cmf_role_user` */

DROP TABLE IF EXISTS `cmf_role_user`;

CREATE TABLE `cmf_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

/*Data for the table `cmf_role_user` */

/*Table structure for table `cmf_route` */

DROP TABLE IF EXISTS `cmf_route`;

CREATE TABLE `cmf_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';

/*Data for the table `cmf_route` */

/*Table structure for table `cmf_slide` */

DROP TABLE IF EXISTS `cmf_slide`;

CREATE TABLE `cmf_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

/*Data for the table `cmf_slide` */

insert  into `cmf_slide`(`slide_id`,`slide_cid`,`slide_name`,`slide_pic`,`slide_url`,`slide_des`,`slide_content`,`slide_status`,`listorder`) values (1,2,'1','/cmf/data/upload/20160121/56a0eb52cf0b8.png','#','','',1,0),(2,2,'2','/cmf/data/upload/20160121/56a0ec0adedaa.png','#','','',1,0),(3,2,'3','/cmf/data/upload/20160121/56a0ec2bd8079.png','#','','',1,0),(4,2,'4','/cmf/data/upload/20160121/56a0ec483e3b1.png','#','','',1,0),(5,2,'5','/cmf/data/upload/20160121/56a0ec60dcee3.png','#','','',0,0);

/*Table structure for table `cmf_slide_cat` */

DROP TABLE IF EXISTS `cmf_slide_cat`;

CREATE TABLE `cmf_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';

/*Data for the table `cmf_slide_cat` */

insert  into `cmf_slide_cat`(`cid`,`cat_name`,`cat_idname`,`cat_remark`,`cat_status`) values (2,'顶级幻灯片','slide_top','',1);

/*Table structure for table `cmf_study` */

DROP TABLE IF EXISTS `cmf_study`;

CREATE TABLE `cmf_study` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xm` varchar(45) DEFAULT NULL,
  `nl` int(11) DEFAULT NULL,
  `xx` varchar(100) DEFAULT NULL,
  `jj` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `cmf_study` */

insert  into `cmf_study`(`id`,`xm`,`nl`,`xx`,`jj`) values (1,'李云',27,'中国石油大学胜利学院','中国石油大学胜利学院'),(2,'  李浩强',2,'中国石油大学胜利学院','啦啦啦');

/*Table structure for table `cmf_study1` */

DROP TABLE IF EXISTS `cmf_study1`;

CREATE TABLE `cmf_study1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xm` varchar(45) DEFAULT NULL,
  `nl` int(11) DEFAULT NULL,
  `xx` varchar(100) DEFAULT NULL,
  `jj` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `cmf_study1` */

insert  into `cmf_study1`(`id`,`xm`,`nl`,`xx`,`jj`) values (1,'啦',23,'啦啦','啦啦\r\n'),(2,'胡海',23,'','');

/*Table structure for table `cmf_term_relationships` */

DROP TABLE IF EXISTS `cmf_term_relationships`;

CREATE TABLE `cmf_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';

/*Data for the table `cmf_term_relationships` */

insert  into `cmf_term_relationships`(`tid`,`object_id`,`term_id`,`listorder`,`status`) values (2,1,3,0,0),(3,2,9,0,0),(4,3,5,0,1),(5,4,5,0,1),(6,5,6,0,1),(7,6,6,0,1),(8,7,18,0,0),(9,8,18,0,0),(10,9,18,0,1),(11,10,18,0,1),(12,11,17,0,1),(13,12,17,0,1),(14,13,19,0,1),(15,14,19,0,1),(16,15,19,0,1),(17,16,19,0,1),(18,17,20,0,1),(19,18,20,0,1),(20,19,20,0,1),(21,20,20,0,1),(22,21,20,0,1),(23,22,20,0,1),(24,23,20,0,1),(25,24,20,0,1),(26,25,21,0,1),(27,26,21,0,1),(28,27,22,0,1),(29,28,22,0,1),(30,29,4,0,0),(31,30,23,0,1),(32,31,23,0,1),(33,32,23,0,1),(34,33,23,0,1),(35,34,23,0,1),(36,35,23,0,1),(37,36,23,0,1),(38,37,23,0,1),(39,38,24,0,1),(40,39,24,0,1),(41,40,24,0,1),(42,41,24,0,1),(43,42,24,0,1),(44,43,24,0,1),(45,44,24,0,1),(46,45,24,0,0),(47,46,25,0,1),(48,47,25,0,1),(49,48,25,0,1),(50,49,25,0,1),(51,50,25,0,1),(52,51,25,0,1),(53,52,25,0,1),(54,53,25,0,1),(55,54,25,0,1),(56,55,25,0,1),(57,56,25,0,1),(58,57,26,0,1),(59,58,26,0,1),(60,59,26,0,1),(61,60,26,0,1),(62,61,27,0,1),(63,62,27,0,1),(64,63,27,0,1),(65,64,27,0,1),(66,65,27,0,1),(67,66,28,0,1),(68,67,28,0,1),(69,68,28,0,1),(70,69,28,0,1),(71,70,28,0,1),(72,71,28,0,1),(73,72,28,0,1),(74,73,19,0,1),(75,74,19,0,1),(76,75,19,0,1),(77,76,20,0,1),(78,77,20,0,1),(79,78,26,0,1),(80,79,26,0,1),(81,80,26,0,1),(82,83,4,0,1),(83,84,4,0,1),(84,85,4,0,1),(85,86,4,0,1),(86,89,18,0,1),(87,90,29,0,1),(88,91,30,0,1),(89,92,31,0,1);

/*Table structure for table `cmf_terms` */

DROP TABLE IF EXISTS `cmf_terms`;

CREATE TABLE `cmf_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';

/*Data for the table `cmf_terms` */

insert  into `cmf_terms`(`term_id`,`name`,`slug`,`taxonomy`,`description`,`parent`,`count`,`path`,`seo_title`,`seo_keywords`,`seo_description`,`list_tpl`,`one_tpl`,`listorder`,`status`) values (2,'瀑布流','','article','',0,0,'0-2','','','','list_masonry','article',0,1),(3,'首页','','article','关键字',0,0,'0-3','','','','index','neirongxiangqing',0,1),(29,'焦点新闻','','article','',3,0,'0-3-29','','','','userlist','neirongxiangqing',0,1),(4,'重要新闻','','article','',3,0,'0-3-4','','','','userlist','neirongxiangqing',0,1),(5,'国家','','article','',11,0,'0-3-11-12','','','','list','article',0,1),(6,'省内','','article','',11,0,'0-3-11-13','','','','list','article',0,1),(7,'省局','','article','',11,0,'0-3-11-14','','','','list','article',0,1),(8,'市县','','article','',11,0,'0-3-11-15','','','','list','article',0,1),(18,'国家','','article','',4,0,'0-3-4-18','','','','userlist','neirongxiangqing',0,1),(17,'省内','','article','',4,0,'0-3-4-17','','','','userlist','neirongxiangqing',0,1),(19,'通知公告','','article','',3,0,'0-3-19','','','','userlist','neirongxiangqing',0,1),(20,'专题活动','','article','',3,0,'0-3-20','','','','userlist','neirongxiangqing',0,1),(21,'省局','','article','',4,0,'0-3-4-21','','','','userlist','neirongxiangqing',0,1),(22,'市县','','article','',4,0,'0-3-4-22','','','','userlist','neirongxiangqing',0,1),(23,'人才服务','','article','',3,0,'0-3-23','','','','userlist','neirongxiangqing',0,1),(24,'融资服务','','article','',3,0,'0-3-24','','','','userlist','neirongxiangqing',0,1),(25,'机构设置','','article','',3,0,'0-3-25','','','','userlist','neirongxiangqing',0,1),(26,'领导讲话','','article','',3,0,'0-3-26','','','','userlist','neirongxiangqing',0,1),(27,'政策文件','','article','',3,0,'0-3-27','','','','userlist','neirongxiangqing',0,1),(28,'按钮','','article','',3,0,'0-3-28','','','','list','article',0,1),(30,'政策法规','','article','',3,0,'0-3-30','','','','userlist','neirongxiangqing',0,1),(31,'区域动态','','article','',3,0,'0-3-31','','','','userlist','neirongxiangqing',0,1);

/*Table structure for table `cmf_user_favorites` */

DROP TABLE IF EXISTS `cmf_user_favorites`;

CREATE TABLE `cmf_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

/*Data for the table `cmf_user_favorites` */

/*Table structure for table `cmf_users` */

DROP TABLE IF EXISTS `cmf_users`;

CREATE TABLE `cmf_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `cmf_users` */

insert  into `cmf_users`(`id`,`user_login`,`user_pass`,`user_nicename`,`user_email`,`user_url`,`avatar`,`sex`,`birthday`,`signature`,`last_login_ip`,`last_login_time`,`create_time`,`user_activation_key`,`user_status`,`score`,`user_type`,`coin`,`mobile`) values 

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

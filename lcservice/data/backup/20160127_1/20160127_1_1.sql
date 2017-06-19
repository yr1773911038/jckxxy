-- ThinkCMF SQL Dump Program
-- 
-- DATE : 2016-01-27 14:37:42
-- Vol : 1
DROP TABLE IF EXISTS `cmf_ad`;
CREATE TABLE `cmf_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_ad ( `ad_id`, `ad_name`, `ad_content`, `status` ) VALUES  ('1','第一张','&lt;img src=&quot;thinkcmf_1/themes/simplebootx/Public/images&quot; class=&quot;img-responsive&quot; alt=&quot;第一张&quot;&gt;','1');
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_auth_access`;
CREATE TABLE `cmf_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('1','Admin','admin_url','admin/content/default','','内容管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('2','Api','admin_url','api/guestbookadmin/index','','所有留言','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('3','Api','admin_url','api/guestbookadmin/delete','','删除网站留言','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('4','Comment','admin_url','comment/commentadmin/index','','评论管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('5','Comment','admin_url','comment/commentadmin/delete','','删除评论','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('6','Comment','admin_url','comment/commentadmin/check','','评论审核','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('7','Portal','admin_url','portal/adminpost/index','','文章管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('8','Portal','admin_url','portal/adminpost/listorders','','文章排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('9','Portal','admin_url','portal/adminpost/top','','文章置顶','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('10','Portal','admin_url','portal/adminpost/recommend','','文章推荐','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('11','Portal','admin_url','portal/adminpost/move','','批量移动','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('12','Portal','admin_url','portal/adminpost/check','','文章审核','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('13','Portal','admin_url','portal/adminpost/delete','','删除文章','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('14','Portal','admin_url','portal/adminpost/edit','','编辑文章','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('15','Portal','admin_url','portal/adminpost/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('16','Portal','admin_url','portal/adminpost/add','','添加文章','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('17','Portal','admin_url','portal/adminpost/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('18','Portal','admin_url','portal/adminterm/index','','分类管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('19','Portal','admin_url','portal/adminterm/listorders','','文章分类排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('20','Portal','admin_url','portal/adminterm/delete','','删除分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('21','Portal','admin_url','portal/adminterm/edit','','编辑分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('22','Portal','admin_url','portal/adminterm/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('23','Portal','admin_url','portal/adminterm/add','','添加分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('24','Portal','admin_url','portal/adminterm/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('25','Portal','admin_url','portal/adminpage/index','','页面管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('26','Portal','admin_url','portal/adminpage/listorders','','页面排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('27','Portal','admin_url','portal/adminpage/delete','','删除页面','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('28','Portal','admin_url','portal/adminpage/edit','','编辑页面','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('29','Portal','admin_url','portal/adminpage/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('30','Portal','admin_url','portal/adminpage/add','','添加页面','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('31','Portal','admin_url','portal/adminpage/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('32','Admin','admin_url','admin/recycle/default','','回收站','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('33','Portal','admin_url','portal/adminpost/recyclebin','','文章回收','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('34','Portal','admin_url','portal/adminpost/restore','','文章还原','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('35','Portal','admin_url','portal/adminpost/clean','','彻底删除','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('36','Portal','admin_url','portal/adminpage/recyclebin','','页面回收','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('37','Portal','admin_url','portal/adminpage/clean','','彻底删除','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('38','Portal','admin_url','portal/adminpage/restore','','页面还原','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('39','Admin','admin_url','admin/extension/default','','扩展工具','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('40','Admin','admin_url','admin/backup/default','','备份管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('41','Admin','admin_url','admin/backup/restore','','数据还原','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('42','Admin','admin_url','admin/backup/index','','数据备份','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('43','Admin','admin_url','admin/backup/index_post','','提交数据备份','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('44','Admin','admin_url','admin/backup/download','','下载备份','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('45','Admin','admin_url','admin/backup/del_backup','','删除备份','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('46','Admin','admin_url','admin/backup/import','','数据备份导入','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('47','Admin','admin_url','admin/plugin/index','','插件管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('48','Admin','admin_url','admin/plugin/toggle','','插件启用切换','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('49','Admin','admin_url','admin/plugin/setting','','插件设置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('50','Admin','admin_url','admin/plugin/setting_post','','插件设置提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('51','Admin','admin_url','admin/plugin/install','','插件安装','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('52','Admin','admin_url','admin/plugin/uninstall','','插件卸载','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('53','Admin','admin_url','admin/slide/default','','幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('54','Admin','admin_url','admin/slide/index','','幻灯片管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('55','Admin','admin_url','admin/slide/listorders','','幻灯片排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('56','Admin','admin_url','admin/slide/toggle','','幻灯片显示切换','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('57','Admin','admin_url','admin/slide/delete','','删除幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('58','Admin','admin_url','admin/slide/edit','','编辑幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('59','Admin','admin_url','admin/slide/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('60','Admin','admin_url','admin/slide/add','','添加幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('61','Admin','admin_url','admin/slide/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('62','Admin','admin_url','admin/slidecat/index','','幻灯片分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('63','Admin','admin_url','admin/slidecat/delete','','删除分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('64','Admin','admin_url','admin/slidecat/edit','','编辑分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('65','Admin','admin_url','admin/slidecat/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('66','Admin','admin_url','admin/slidecat/add','','添加分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('67','Admin','admin_url','admin/slidecat/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('68','Admin','admin_url','admin/ad/index','','网站广告','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('69','Admin','admin_url','admin/ad/toggle','','广告显示切换','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('70','Admin','admin_url','admin/ad/delete','','删除广告','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('71','Admin','admin_url','admin/ad/edit','','编辑广告','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('72','Admin','admin_url','admin/ad/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('73','Admin','admin_url','admin/ad/add','','添加广告','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('74','Admin','admin_url','admin/ad/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('75','Admin','admin_url','admin/link/index','','友情链接','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('76','Admin','admin_url','admin/link/listorders','','友情链接排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('77','Admin','admin_url','admin/link/toggle','','友链显示切换','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('78','Admin','admin_url','admin/link/delete','','删除友情链接','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('79','Admin','admin_url','admin/link/edit','','编辑友情链接','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('80','Admin','admin_url','admin/link/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('81','Admin','admin_url','admin/link/add','','添加友情链接','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('82','Admin','admin_url','admin/link/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('83','Api','admin_url','api/oauthadmin/setting','','第三方登陆','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('84','Api','admin_url','api/oauthadmin/setting_post','','提交设置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('85','Admin','admin_url','admin/menu/default','','菜单管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('86','Admin','admin_url','admin/navcat/default1','','前台菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('87','Admin','admin_url','admin/nav/index','','菜单管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('88','Admin','admin_url','admin/nav/listorders','','前台导航排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('89','Admin','admin_url','admin/nav/delete','','删除菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('90','Admin','admin_url','admin/nav/edit','','编辑菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('91','Admin','admin_url','admin/nav/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('92','Admin','admin_url','admin/nav/add','','添加菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('93','Admin','admin_url','admin/nav/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('94','Admin','admin_url','admin/navcat/index','','菜单分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('95','Admin','admin_url','admin/navcat/delete','','删除分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('96','Admin','admin_url','admin/navcat/edit','','编辑分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('97','Admin','admin_url','admin/navcat/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('98','Admin','admin_url','admin/navcat/add','','添加分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('99','Admin','admin_url','admin/navcat/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('100','Admin','admin_url','admin/menu/index','','后台菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('101','Admin','admin_url','admin/menu/add','','添加菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('102','Admin','admin_url','admin/menu/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('103','Admin','admin_url','admin/menu/listorders','','后台菜单排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('104','Admin','admin_url','admin/menu/export_menu','','菜单备份','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('105','Admin','admin_url','admin/menu/edit','','编辑菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('106','Admin','admin_url','admin/menu/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('107','Admin','admin_url','admin/menu/delete','','删除菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('108','Admin','admin_url','admin/menu/lists','','所有菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('109','Admin','admin_url','admin/setting/default','','设置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('110','Admin','admin_url','admin/setting/userdefault','','个人信息','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('111','Admin','admin_url','admin/user/userinfo','','修改信息','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('112','Admin','admin_url','admin/user/userinfo_post','','修改信息提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('113','Admin','admin_url','admin/setting/password','','修改密码','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('114','Admin','admin_url','admin/setting/password_post','','提交修改','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('115','Admin','admin_url','admin/setting/site','','网站信息','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('116','Admin','admin_url','admin/setting/site_post','','提交修改','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('117','Admin','admin_url','admin/route/index','','路由列表','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('118','Admin','admin_url','admin/route/add','','路由添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('119','Admin','admin_url','admin/route/add_post','','路由添加提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('120','Admin','admin_url','admin/route/edit','','路由编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('121','Admin','admin_url','admin/route/edit_post','','路由编辑提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('122','Admin','admin_url','admin/route/delete','','路由删除','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('123','Admin','admin_url','admin/route/ban','','路由禁止','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('124','Admin','admin_url','admin/route/open','','路由启用','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('125','Admin','admin_url','admin/route/listorders','','路由排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('126','Admin','admin_url','admin/mailer/default','','邮箱配置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('127','Admin','admin_url','admin/mailer/index','','SMTP配置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('128','Admin','admin_url','admin/mailer/index_post','','提交配置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('129','Admin','admin_url','admin/mailer/active','','邮件模板','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('130','Admin','admin_url','admin/mailer/active_post','','提交模板','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('131','Admin','admin_url','admin/setting/clearcache','','清除缓存','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('132','User','admin_url','user/indexadmin/default','','用户管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('133','User','admin_url','user/indexadmin/default1','','用户组','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('134','User','admin_url','user/indexadmin/index','','本站用户','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('135','User','admin_url','user/indexadmin/ban','','拉黑会员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('136','User','admin_url','user/indexadmin/cancelban','','启用会员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('137','User','admin_url','user/oauthadmin/index','','第三方用户','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('138','User','admin_url','user/oauthadmin/delete','','第三方用户解绑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('139','User','admin_url','user/indexadmin/default3','','管理组','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('140','Admin','admin_url','admin/rbac/index','','角色管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('141','Admin','admin_url','admin/rbac/member','','成员管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('142','Admin','admin_url','admin/rbac/authorize','','权限设置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('143','Admin','admin_url','admin/rbac/authorize_post','','提交设置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('144','Admin','admin_url','admin/rbac/roleedit','','编辑角色','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('145','Admin','admin_url','admin/rbac/roleedit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('146','Admin','admin_url','admin/rbac/roledelete','','删除角色','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('147','Admin','admin_url','admin/rbac/roleadd','','添加角色','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('148','Admin','admin_url','admin/rbac/roleadd_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('149','Admin','admin_url','admin/user/index','','管理员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('150','Admin','admin_url','admin/user/delete','','删除管理员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('151','Admin','admin_url','admin/user/edit','','管理员编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('152','Admin','admin_url','admin/user/edit_post','','编辑提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('153','Admin','admin_url','admin/user/add','','管理员添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('154','Admin','admin_url','admin/user/add_post','','添加提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('155','Admin','admin_url','admin/plugin/update','','插件更新','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('156','Admin','admin_url','admin/storage/index','','文件存储','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('157','Admin','admin_url','admin/storage/setting_post','','文件存储设置提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('158','Admin','admin_url','admin/slide/ban','','禁用幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('159','Admin','admin_url','admin/slide/cancelban','','启用幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('160','Admin','admin_url','admin/user/ban','','禁用管理员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('161','Admin','admin_url','admin/user/cancelban','','启用管理员','1','');
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_links ( `link_id`, `link_url`, `link_name`, `link_image`, `link_target`, `link_description`, `link_status`, `link_rating`, `link_rel`, `listorder` ) VALUES  ('1','http://www.thinkcmf.com','ThinkCMF','','_blank','','1','0','','0');
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('1','0','Admin','Content','default','','0','1','内容管理','th','','30');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('2','1','Api','Guestbookadmin','index','','1','1','所有留言','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('3','2','Api','Guestbookadmin','delete','','1','0','删除网站留言','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('4','1','Comment','Commentadmin','index','','1','1','评论管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('5','4','Comment','Commentadmin','delete','','1','0','删除评论','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('6','4','Comment','Commentadmin','check','','1','0','评论审核','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('7','1','Portal','AdminPost','index','','1','1','文章管理','','','1');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('8','7','Portal','AdminPost','listorders','','1','0','文章排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('9','7','Portal','AdminPost','top','','1','0','文章置顶','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('10','7','Portal','AdminPost','recommend','','1','0','文章推荐','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('11','7','Portal','AdminPost','move','','1','0','批量移动','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('12','7','Portal','AdminPost','check','','1','0','文章审核','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('13','7','Portal','AdminPost','delete','','1','0','删除文章','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('14','7','Portal','AdminPost','edit','','1','0','编辑文章','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('15','14','Portal','AdminPost','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('16','7','Portal','AdminPost','add','','1','0','添加文章','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('17','16','Portal','AdminPost','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('18','1','Portal','AdminTerm','index','','0','1','分类管理','','','2');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('19','18','Portal','AdminTerm','listorders','','1','0','文章分类排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('20','18','Portal','AdminTerm','delete','','1','0','删除分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('21','18','Portal','AdminTerm','edit','','1','0','编辑分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('22','21','Portal','AdminTerm','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('23','18','Portal','AdminTerm','add','','1','0','添加分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('24','23','Portal','AdminTerm','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('25','1','Portal','AdminPage','index','','1','1','页面管理','','','3');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('26','25','Portal','AdminPage','listorders','','1','0','页面排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('27','25','Portal','AdminPage','delete','','1','0','删除页面','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('28','25','Portal','AdminPage','edit','','1','0','编辑页面','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('29','28','Portal','AdminPage','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('30','25','Portal','AdminPage','add','','1','0','添加页面','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('31','30','Portal','AdminPage','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('32','1','Admin','Recycle','default','','1','1','回收站','','','4');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('33','32','Portal','AdminPost','recyclebin','','1','1','文章回收','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('34','33','Portal','AdminPost','restore','','1','0','文章还原','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('35','33','Portal','AdminPost','clean','','1','0','彻底删除','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('36','32','Portal','AdminPage','recyclebin','','1','1','页面回收','','','1');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('37','36','Portal','AdminPage','clean','','1','0','彻底删除','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('38','36','Portal','AdminPage','restore','','1','0','页面还原','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('39','0','Admin','Extension','default','','0','1','扩展工具','cloud','','40');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('40','39','Admin','Backup','default','','1','1','备份管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('41','40','Admin','Backup','restore','','1','1','数据还原','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('42','40','Admin','Backup','index','','1','1','数据备份','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('43','42','Admin','Backup','index_post','','1','0','提交数据备份','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('44','40','Admin','Backup','download','','1','0','下载备份','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('45','40','Admin','Backup','del_backup','','1','0','删除备份','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('46','40','Admin','Backup','import','','1','0','数据备份导入','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('47','39','Admin','Plugin','index','','1','1','插件管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('48','47','Admin','Plugin','toggle','','1','0','插件启用切换','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('49','47','Admin','Plugin','setting','','1','0','插件设置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('50','49','Admin','Plugin','setting_post','','1','0','插件设置提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('51','47','Admin','Plugin','install','','1','0','插件安装','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('52','47','Admin','Plugin','uninstall','','1','0','插件卸载','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('53','39','Admin','Slide','default','','1','1','幻灯片','','','1');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('54','53','Admin','Slide','index','','1','1','幻灯片管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('55','54','Admin','Slide','listorders','','1','0','幻灯片排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('56','54','Admin','Slide','toggle','','1','0','幻灯片显示切换','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('57','54','Admin','Slide','delete','','1','0','删除幻灯片','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('58','54','Admin','Slide','edit','','1','0','编辑幻灯片','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('59','58','Admin','Slide','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('60','54','Admin','Slide','add','','1','0','添加幻灯片','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('61','60','Admin','Slide','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('62','53','Admin','Slidecat','index','','1','1','幻灯片分类','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('63','62','Admin','Slidecat','delete','','1','0','删除分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('64','62','Admin','Slidecat','edit','','1','0','编辑分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('65','64','Admin','Slidecat','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('66','62','Admin','Slidecat','add','','1','0','添加分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('67','66','Admin','Slidecat','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('68','39','Admin','Ad','index','','1','1','网站广告','','','2');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('69','68','Admin','Ad','toggle','','1','0','广告显示切换','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('70','68','Admin','Ad','delete','','1','0','删除广告','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('71','68','Admin','Ad','edit','','1','0','编辑广告','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('72','71','Admin','Ad','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('73','68','Admin','Ad','add','','1','0','添加广告','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('74','73','Admin','Ad','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('75','39','Admin','Link','index','','0','1','友情链接','','','3');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('76','75','Admin','Link','listorders','','1','0','友情链接排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('77','75','Admin','Link','toggle','','1','0','友链显示切换','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('78','75','Admin','Link','delete','','1','0','删除友情链接','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('79','75','Admin','Link','edit','','1','0','编辑友情链接','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('80','79','Admin','Link','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('81','75','Admin','Link','add','','1','0','添加友情链接','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('82','81','Admin','Link','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('83','39','Api','Oauthadmin','setting','','1','1','第三方登陆','leaf','','4');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('84','83','Api','Oauthadmin','setting_post','','1','0','提交设置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('85','0','Admin','Menu','default','','1','1','菜单管理','list','','20');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('86','85','Admin','Navcat','default1','','1','1','前台菜单','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('87','86','Admin','Nav','index','','1','1','菜单管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('88','87','Admin','Nav','listorders','','1','0','前台导航排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('89','87','Admin','Nav','delete','','1','0','删除菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('90','87','Admin','Nav','edit','','1','0','编辑菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('91','90','Admin','Nav','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('92','87','Admin','Nav','add','','1','0','添加菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('93','92','Admin','Nav','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('94','86','Admin','Navcat','index','','1','1','菜单分类','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('95','94','Admin','Navcat','delete','','1','0','删除分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('96','94','Admin','Navcat','edit','','1','0','编辑分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('97','96','Admin','Navcat','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('98','94','Admin','Navcat','add','','1','0','添加分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('99','98','Admin','Navcat','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('100','85','Admin','Menu','index','','1','1','后台菜单','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('101','100','Admin','Menu','add','','1','0','添加菜单','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('102','101','Admin','Menu','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('103','100','Admin','Menu','listorders','','1','0','后台菜单排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('104','100','Admin','Menu','export_menu','','1','0','菜单备份','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('105','100','Admin','Menu','edit','','1','0','编辑菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('106','105','Admin','Menu','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('107','100','Admin','Menu','delete','','1','0','删除菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('108','100','Admin','Menu','lists','','1','0','所有菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('109','0','Admin','Setting','default','','0','1','设置','cogs','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('110','109','Admin','Setting','userdefault','','0','1','个人信息','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('111','110','Admin','User','userinfo','','1','1','修改信息','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('112','111','Admin','User','userinfo_post','','1','0','修改信息提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('113','110','Admin','Setting','password','','1','1','修改密码','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('114','113','Admin','Setting','password_post','','1','0','提交修改','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('115','109','Admin','Setting','site','','1','1','网站信息','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('116','115','Admin','Setting','site_post','','1','0','提交修改','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('117','115','Admin','Route','index','','1','0','路由列表','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('118','115','Admin','Route','add','','1','0','路由添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('119','118','Admin','Route','add_post','','1','0','路由添加提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('120','115','Admin','Route','edit','','1','0','路由编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('121','120','Admin','Route','edit_post','','1','0','路由编辑提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('122','115','Admin','Route','delete','','1','0','路由删除','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('123','115','Admin','Route','ban','','1','0','路由禁止','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('124','115','Admin','Route','open','','1','0','路由启用','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('125','115','Admin','Route','listorders','','1','0','路由排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('126','109','Admin','Mailer','default','','1','1','邮箱配置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('127','126','Admin','Mailer','index','','1','1','SMTP配置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('128','127','Admin','Mailer','index_post','','1','0','提交配置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('129','126','Admin','Mailer','active','','1','1','邮件模板','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('130','129','Admin','Mailer','active_post','','1','0','提交模板','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('131','109','Admin','Setting','clearcache','','1','1','清除缓存','','','1');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('132','0','User','Indexadmin','default','','1','1','用户管理','group','','10');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('133','132','User','Indexadmin','default1','','1','1','用户组','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('134','133','User','Indexadmin','index','','1','1','本站用户','leaf','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('135','134','User','Indexadmin','ban','','1','0','拉黑会员','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('136','134','User','Indexadmin','cancelban','','1','0','启用会员','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('137','133','User','Oauthadmin','index','','1','1','第三方用户','leaf','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('138','137','User','Oauthadmin','delete','','1','0','第三方用户解绑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('139','132','User','Indexadmin','default3','','1','1','管理组','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('140','139','Admin','Rbac','index','','1','1','角色管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('141','140','Admin','Rbac','member','','1','0','成员管理','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('142','140','Admin','Rbac','authorize','','1','0','权限设置','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('143','142','Admin','Rbac','authorize_post','','1','0','提交设置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('144','140','Admin','Rbac','roleedit','','1','0','编辑角色','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('145','144','Admin','Rbac','roleedit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('146','140','Admin','Rbac','roledelete','','1','1','删除角色','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('147','140','Admin','Rbac','roleadd','','1','1','添加角色','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('148','147','Admin','Rbac','roleadd_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('149','139','Admin','User','index','','1','1','管理员','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('150','149','Admin','User','delete','','1','0','删除管理员','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('151','149','Admin','User','edit','','1','0','管理员编辑','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('152','151','Admin','User','edit_post','','1','0','编辑提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('153','149','Admin','User','add','','1','0','管理员添加','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('154','153','Admin','User','add_post','','1','0','添加提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('155','47','Admin','Plugin','update','','1','0','插件更新','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('156','39','Admin','Storage','index','','1','1','文件存储','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('157','156','Admin','Storage','setting_post','','1','0','文件存储设置提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('158','54','Admin','Slide','ban','','1','0','禁用幻灯片','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('159','54','Admin','Slide','cancelban','','1','0','启用幻灯片','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('160','149','Admin','User','ban','','1','0','禁用管理员','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('161','149','Admin','User','cancelban','','1','0','启用管理员','','','0');
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('1','1','0','首页','_blank','home','','1','0','0-1');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('6','1','0','信息化','','home','','1','0','0-6');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('7','1','0','融资服务','','home','','1','0','0-7');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('4','1','0','服务荟萃','_blank','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"62\";}}','','1','0','0-4');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('5','1','0','电子商务','','home','','1','0','0-5');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('8','1','0','培训服务','','home','','1','0','0-8');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('9','1','0','管理咨询','_blank','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"71\";}}','','1','0','0-9');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('10','1','0','法律服务','_blank','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"74\";}}','','1','0','0-10');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('11','1','0','技术创新','_blank','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"72\";}}','','1','0','0-11');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('12','1','0','担保服务','_blank','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"73\";}}','','1','0','0-12');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('16','3','0','技术创新','','home','','1','0','0-16');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('15','3','0','全部服务','','home','','1','0','0-15');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('17','3','0','人才培训','','home','','1','0','0-17');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('18','3','0','市场开拓','','home','','1','0','0-18');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('19','3','0','管理咨询','','home','','1','0','0-19');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('20','3','0','融资担保','','home','','1','0','0-20');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('21','3','0','法律服务','','home','','1','0','0-21');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('22','3','0','信息服务','','home','','1','0','0-22');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('23','3','0','创业服务','','home','','1','0','0-23');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('24','3','0','其他服务','','home','','1','0','0-24');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('25','4','0','融资服务','','home','','1','0','0-25');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('26','4','0','电子商务','','home','','1','0','0-26');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('27','4','0','信息服务','','home','','1','0','0-27');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('28','4','0','管理咨询','','home','','1','0','0-28');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('29','4','0','法律服务','','home','','1','0','0-29');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('30','5','0','首页','','home','','1','0','0-30');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('31','5','0','政策服务','','home','','1','0','0-31');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('32','5','0','技术创新','','home','','1','0','0-32');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('33','5','0','项目专家','','home','','1','0','0-33');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('34','5','0','科技服务','','home','','1','0','0-34');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('35','5','0','服务资源','','home','','1','0','0-35');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('36','5','0','科技金融','','home','','1','0','0-36');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('37','5','0','军民融合','','home','','1','0','0-37');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('38','5','0','关于我们','','home','','1','0','0-38');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('39','6','0','首页','','home','','1','0','0-39');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('40','6','0','通知公告','','home','','1','0','0-40');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('41','6','0','协会概况','','home','','1','0','0-41');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('42','6','0','行业信息','','home','','1','0','0-42');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('43','6','0','协会动态','','home','','1','0','0-43');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('44','6','0','信用建设','','home','','1','0','0-44');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('45','6','0','政策法规','','home','','1','0','0-45');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('46','6','0','担保研究','','home','','1','0','0-46');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('47','6','0','会员风采','','home','','1','0','0-47');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('48','6','0','入会申请','','home','','1','0','0-48');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('49','7','0','平台首页','','home','','1','0','0-49');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('50','7','0','通知公告','','home','','1','0','0-50');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('51','7','0','新闻中心','','home','','1','0','0-51');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('52','7','0','关于协会','','home','','1','0','0-52');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('53','7','0','会员掠影','','home','','1','0','0-53');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('54','7','0','专家团队','','home','','1','0','0-54');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('55','7','0','供需信息','','home','','1','0','0-55');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('56','7','0','资源中心','','home','','1','0','0-56');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('57','7','0','联系我们','','home','','1','0','0-57');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('58','7','0','入会申请','','home','','1','0','0-58');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('67','9','0','首页','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"21\";}}','','1','0','0-67');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('59','8','0','首页','','home','','1','0','0-59');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('60','8','0','法界热点','','home','','1','0','0-60');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('61','8','0','惠企咨讯','','home','','1','0','0-61');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('62','8','0','公司法务','','home','','1','0','0-62');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('63','8','0','法律机构','','home','','1','0','0-63');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('64','8','0','合同管理','','home','','1','0','0-64');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('65','8','0','律师讲堂','','home','','1','0','0-65');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('66','8','0','在线咨询','','home','','1','0','0-66');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('68','9','0','服务荟萃','','home','','1','0','0-68');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('69','9','0','电子商务','','home','','1','0','0-69');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('70','9','0','信息化','','home','','1','0','0-70');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('71','9','0','融资服务','','home','','1','0','0-71');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('72','9','0','培训服务','','home','','1','0','0-72');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('73','9','0','管理咨询','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"71\";}}','','1','0','0-73');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('74','9','0','法律服务','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"74\";}}','','1','0','0-74');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('75','9','0','技术创新','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"72\";}}','','1','0','0-75');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('76','9','0','担保服务','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"73\";}}','','1','0','0-76');
DROP TABLE IF EXISTS `cmf_nav_cat`;
CREATE TABLE `cmf_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否显示，1显示，0不显示',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_nav_cat ( `navcid`, `name`, `active`, `remark` ) VALUES  ('1','主导航','1','');
INSERT INTO cmf_nav_cat ( `navcid`, `name`, `active`, `remark` ) VALUES  ('3','server_nav','0','server_nav');
INSERT INTO cmf_nav_cat ( `navcid`, `name`, `active`, `remark` ) VALUES  ('4','rongzi_nav','0','rongzi_nav');
INSERT INTO cmf_nav_cat ( `navcid`, `name`, `active`, `remark` ) VALUES  ('5','二级页面技术创新','0','二级页面技术创新');
INSERT INTO cmf_nav_cat ( `navcid`, `name`, `active`, `remark` ) VALUES  ('6','二级页面担保服务','0','二级页面担保服务');
INSERT INTO cmf_nav_cat ( `navcid`, `name`, `active`, `remark` ) VALUES  ('7','二级页面咨询管理','0','二级页面咨询管理');
INSERT INTO cmf_nav_cat ( `navcid`, `name`, `active`, `remark` ) VALUES  ('8','二级页面法律服务','0','二级页面法律服务');
INSERT INTO cmf_nav_cat ( `navcid`, `name`, `active`, `remark` ) VALUES  ('9','二级页面服务荟萃','0','二级页面服务荟萃');
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_options`;
CREATE TABLE `cmf_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('1','member_email_active','{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}','1');
INSERT INTO cmf_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('2','site_options','            {
            		\"site_name\":\"ThinkCMF内容管理框架\",
            		\"site_host\":\"http://localhost/\",
            		\"site_root\":\"\",
            		\"site_icp\":\"\",
            		\"site_admin_email\":\"1773911038@qq.com\",
            		\"site_tongji\":\"\",
            		\"site_copyright\":\"\",
            		\"site_seo_title\":\"ThinkCMF内容管理框架\",
            		\"site_seo_keywords\":\"ThinkCMF,php,内容管理框架,cmf,cms,简约风, simplewind,framework\",
            		\"site_seo_description\":\"ThinkCMF是简约风网络科技发布的一款用于快速开发的内容管理框架\"
        }','1');
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('1','1','','','2016-01-20 11:09:20','','index','','1','1','2016-01-20 11:09:12','','0','2','','0','{\"template\":\"index\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('2','1','index_1','','2016-01-20 11:17:57','<p>index_1</p>','index_1','index_1','0','1','2016-01-20 11:17:44','','0','2','','0','{\"template\":\"index_1\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('3','1','测试','','2016-01-20 11:21:29','<p>测试</p>','测试','测试','0','1','2016-01-20 11:21:06','','0','2','','0','{\"template\":\"index_1\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('4','1','index_2','','2016-01-20 11:37:46','<p>index_2</p>','index_2','index_2','0','1','2016-01-20 11:37:32','','0','2','','0','{\"template\":\"index\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('5','1','fdsf','','2016-01-20 15:32:34','<p>fsds<br/></p>','asd','fdsfsf','0','1','2016-01-20 15:32:19','','0','2','','0','{\"template\":\"indextab123\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('6','1','','','2016-01-20 15:55:12','<p>fdsd<br/></p>','sdfsf','dfs','1','1','2016-01-20 15:55:00','','0','2','','0','{\"template\":\"index\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('7','1','粮都宾馆前，马路边的停车位，是粮都宾馆前...','百度','2016-01-20 17:28:08','<p>，我在某年某月醒过来。我想 我等 我期待未来，却不能理智安排。阴天 傍晚 车窗外，未来有一个人在等待。向左 向右 向前看，爱要拐几个弯才来。我遇见谁 ?会有怎样的对白！我等的人 ,她在多远的未来。我听见风来自地铁和人海！我排着队， 拿着爱的号码牌。我往前飞 ,飞过一片时间海。我们也常在爱情里受伤害！我看着路， 梦的入口有点窄。我遇见你是最美的意外，终有一天 ,我的谜底会揭开--------孙燕姿</p>','粮都宾馆前，马路边的停车位，是粮都宾馆前...','听见冬天的离开','1','1','2016-01-20 17:24:52','','0','','','0','{\"thumb\":\"\"}','4','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('8','1','矿山地质环境保护与治理恢复方案审查结果公示','http://g.mlr.gov.cn/gkml_9184/201601/t20160121_1395589.htm','2016-01-20 17:29:25','<p>根据年度工作安排，按照《国土资源部办公厅关于做好矿山地质环境保护与治理恢复方案编制审查及有关工作的通知》（国土资厅发〔2009〕61
号）和《关于矿山地质环境保护与治理恢复方案有关事项的公告》（2014年第21号），我部组织专家对矿山地质环境保护与治理恢复方案（以下简称“方
案”）进行了审查。现将拟同意通过的8个“方案”及专家评审意见进行公示，公示期自发布之日起5个工作日。</p><p>　　如有异议，请在公示期内与国土资源部地质环境司监测处联系。</p><p>　　联系人及电话：李明路&nbsp;010-66558317/8316（传真）</p><p>&nbsp;&nbsp;&nbsp; 附件：<a href=\"http://download.mlr.gov.cn/xinxihua/software/tzgg/1.21zzyj.zip\">专家意见</a></p><p><br/></p>','矿山地质环境保护与治理恢复方案审查结果公示','矿山地质环境保护与治理恢复方案审查结果公示','1','1','2016-01-20 17:28:15','','0','','','0','{\"thumb\":\"\"}','3','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('9','1','国土资源部关于公布第二批国土资源高层次创新型科技人才培养工程入选人员名单的通知','http://g.mlr.gov.cn/gkml_9184/201601/t20160121_1395580.htm','2016-01-20 17:50:51','<ul class=\"change list-paddingleft-2\"><li><p><a href=\"http://localhost/thinkcmf_1/index.php?g=portal&m=page&a=index&id=5#\"></a></p>各省、自治区、直辖市国土资源主管部门，新疆生产建设兵团国土资源局，解放军土地管理局，中国地质调查局，武警黄金指挥部，部其他直属单位，各派驻地方的国家土地督察局，部机关各司局，其他有关单位：<p><a href=\"http://localhost/thinkcmf_1/index.php?g=portal&m=page&a=index&id=5#\"></a></p></li><li><p>　　为贯彻落实《国土资源中长期人才发展规划（2010-2020年）》和《国土资源“十二五”科学和技术发展规划》，依据《国土资源中长期人才发展规划（2010-2020年）重点人才工程和计划实施方案》和《国土资源部高层次创新型科技人才培养工程遴选和培养暂行办法》，部组织了国土资源高层次创新型科技人才培养工程第二批遴选工作，确定刘顺喜等30名同志入选第二批国土资源科技领军人才开发和培养计划，王建雄等49名同志入选第二批国土资源杰出青年科技人才培养计划，农用地质量与监控创新团队入选国土资源科技创新团队培育计划，现予以公布。</p></li><li><p>　　人才是创新的根基，是科技创新的核心要素。各级国土资源主管部门、各直属单位要认真贯彻落实好中央关于 人才的各项政策，下大力气支持入选人员开展科技创新工作，在完善政策环境、落实经费支持、参与科技决策、推进国际合作、搭建交流平台、促进成果转化、加大 宣传评估等方面出实招，创新科技人才培养模式，优化科技人才发展环境，激发科技人才的创新热情和创造活力。入选人员要进一步增强国土资源科技创新的使命感和责任感，加强学习、勤奋工作、不断创新、奋发进取，为国土资源事业发展做出更大的贡献。</p></li><li><p>　　附件：1.第二批国土资源科技领军人才开发和培养计划名单</p></li><li><p>　　&nbsp;2.第二批国土资源杰出青年科技人才培养计划名单</p></li><li><p>　　3．第二批国土资源科技创新团队培育计划名单</p></li><li><p>　　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2015年9月21日</p></li><li><table cellpadding=\"0\" cellspacing=\"0\" width=\"96%\"><tbody><tr class=\"firstRow\"><td><span style=\"color:#CC3300\"><strong><span style=\"color:#000099\">附件：</span></strong></span></td></tr><tr><td height=\"25\"><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><a href=\"http://g.mlr.gov.cn/gkml_9184/201601/P020160121523212329580.doc\" target=\"_blank\">第二批国土资源科技领军人才开发和培养计划名单</a><br/><a href=\"http://g.mlr.gov.cn/gkml_9184/201601/P020160121523212741117.doc\" target=\"_blank\">第二批国土资源杰出青年科技人才培养计划名单</a><br/><a href=\"http://g.mlr.gov.cn/gkml_9184/201601/P020160121523213078931.doc\" target=\"_blank\">第二批国土资源科技创新团队培育计划名单</a></ul></td></tr></tbody></table></li></ul><p><br/></p>','国土资源部关于公布第二批国土资源高层次创新型科技人才培养工程入选人员名单的通知','国土资源部关于公布第二批国土资源高层次创新型科技人才培养工程入选人员名单的通知','1','1','2016-01-20 17:50:12','','0','','','0','{\"thumb\":\"\"}','1','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('10','1','中共国土资源部党组关于高利民等3名同志职务任免的通知','http://g.mlr.gov.cn/gkml_9184/201601/t20160118_1395125.htm','2016-01-20 17:51:50','<p>各省、自治区、直辖市及副省级城市国土资源主管部门，新疆生产建设兵团国土资源局，解放军土地管理局，国家海洋局、国家测绘地理信息局，中国地质调查局，武警黄金部队，部其他直属单位，各派驻地方的国家土地督察局，部机关各司局：</p><p style=\"overflow-x: hidden\">　　部党组2015年12月17日决定：</p><p style=\"overflow-x: hidden\">　　高利民试用期满正式任矿产资源储量评审中心副主任，任职时间从2014年8月起算。</p><p style=\"overflow-x: hidden\">　　免去金愉中矿产开发管理司副巡视员职务，退休；</p><p style=\"overflow-x: hidden\">　　免去陈有华广州督察局副巡视员职务，退休。</p><p style=\"overflow-x: hidden\">　　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 中共国土资源部党组</p><p style=\"overflow-x: hidden\">　　2015年12月28日</p><p><br/></p>','中共国土资源部党组关于高利民等3名同志职务任免的通知','中共国土资源部党组关于高利民等3名同志职务任免的通知','1','1','2016-01-20 17:51:11','','0','','','0','{\"thumb\":\"\"}','6','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('11','1','粮都宾馆前，马路边的停车位粮都宾','','2016-01-20 20:43:58','<p>粮都宾馆前，马路边的停车位粮都宾粮都宾馆前，马路边的停车位粮都宾粮都宾馆前，马路边的停车位粮都宾粮都宾馆前，马路边的停车位粮都宾</p>','粮都宾馆前，马路边的停车位粮都宾','粮都宾馆前，马路边的停车位粮都宾','1','1','2016-01-20 20:43:40','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('12','1','粮都宾馆前，马路边的停车位粮都宾','','2016-01-20 20:44:18','','粮都宾馆前，马路边的停车位粮都宾222222222','粮都宾馆前，马路边的停车位粮都宾','1','1','2016-01-20 20:44:00','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('13','1','粮都宾馆前，马路边的停车位粮都宾','','2016-01-20 20:44:50','<p>粮都宾馆前，马路边的停车位粮都宾</p>','粮都宾馆前，马路边的停车位粮都宾3333333','粮都宾馆前，马路边的停车位粮都宾','1','1','2016-01-20 20:44:24','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('14','1','粮都宾馆前，马路边的停车位粮都宾4444','','2016-01-20 20:45:11','<p>粮都宾馆前，马路边的停车位粮都宾4444</p>','粮都宾馆前，马路边的停车位粮都宾4444','粮都宾馆前，马路边的停车位粮都宾4444','1','1','2016-01-20 20:44:56','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('15','1','粮都宾馆前，马路边的停车位粮都宾44445555','粮都宾馆前，马路边的停车位粮都宾44445555','2016-01-20 20:45:29','<p>粮都宾馆前，马路边的停车位粮都宾44445555</p>','粮都宾馆前，马路边的停车位粮都宾44445555','粮都宾馆前，马路边的停车位粮都宾44445555','1','1','2016-01-20 20:45:13','','0','','','0','{\"thumb\":\"\"}','2','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('16','1','粮都宾馆前，马路边的停车位粮都宾44445555666','粮都宾馆前，马路边的停车位粮都宾44445555666','2016-01-20 20:45:51','<p>粮都宾馆前，马路边的停车位粮都宾44445555666</p>','粮都宾馆前，马路边的停车位粮都宾44445555666','粮都宾馆前，马路边的停车位粮都宾44445555666','1','1','2016-01-20 20:45:30','','0','','','0','{\"thumb\":\"\"}','2','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('17','1','专案代理的内容','山东舜翔（聊城）律师事务所','2016-01-21 09:12:19','<p>提供民商事仲裁、诉讼等专案代理服务还要有其他的哦</p>','专案代理的内容','专案代理的内容','1','1','2016-01-21 09:09:26','','0','','','0','{\"thumb\":\"\"}','9','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('18','1','法律服务的内容','山东舜翔（聊城）律师事务所','2016-01-21 09:13:25','<p>提供民商事仲裁、诉讼等专案代理服务，山东舜翔（聊城）律师事务所以及其他</p>','法律服务的内容','山东舜翔','1','1','2016-01-21 09:12:21','','0','','','0','{\"thumb\":\"\"}','10','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('19','1','法律咨询的内容','法律咨询的内容','2016-01-21 09:14:09','<p>提供民商事仲裁、诉讼等专案代理服提供民商事仲裁、诉讼等专案代理服务务</p>','法律咨询的内容','法律咨询的内容','1','1','2016-01-21 09:13:27','','0','','','0','{\"thumb\":\"\"}','11','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('20','1','山东舜翔（聊城）律师事务所','专案代理的内容','2016-01-21 09:15:02','<p>提供民商事仲裁、诉讼等专案代理服务提供民商事仲裁、诉讼等专案代理服务</p>','专案代理的内容','专案代理的内容2','1','1','2016-01-21 09:14:10','','0','','','0','{\"thumb\":\"\"}','25','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('21','1','','','2016-01-21 09:21:31','','index1234','','1','1','2016-01-21 09:21:21','','0','2','','0','{\"template\":\"indextab1234\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('22','1','','','2016-01-21 15:09:09','','index_top','','1','1','2016-01-21 15:08:57','','0','2','','0','{\"template\":\"index_top\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('23','1','','','2016-01-21 20:33:17','','list','','1','1','2016-01-21 20:33:09','','0','2','','0','{\"template\":\"list\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('24','1','2016年度国家科技奖推荐项目公示','http://g.mlr.gov.cn/gkml_9184/201512/t20151225_1392990.htm','2016-01-21 20:49:36','<p>按照《国家科学技术奖励工作办公室关于2016年度国家科学技术奖励推荐工作的通知》的要求，在各省（区、市）国土资源主管部门、国土资源部直属单位推荐基础上，经专家遴选，确定了国土资源部拟推荐2016年度国家科技奖项目。现将拟推荐项目的名称、推荐意见、简介、客观评价、推广应用情况、主要完成单位、主要完成人及创新推广贡献等进行公示，公示期为：2015年12月25日-2016年1月3日。在公示期内，对上述内容有异议的，可向国土资源部科技与国际合作司提出。提出异议者，必须采取书面形式，写明提出异议的事实依据、个人真实姓名、工作单位、地址邮编和联系方式等。凡匿名异议、超出期限异议和对推荐结果有异议的不予受理。&nbsp;</p><p>　　　　联系人：徐浩&nbsp;&nbsp;010-66558427&nbsp;</p><p>　　　　传真：010-66127247&nbsp;</p><p style=\"text-align: right\">　　2015年12月25日</p><table cellpadding=\"0\" cellspacing=\"0\" width=\"96%\"><tbody><tr class=\"firstRow\"><td><span style=\"color:#CC3300\"><strong><span style=\"color:#000099\">附件：</span></strong></span></td></tr><tr><td height=\"25\"><ol class=\" list-paddingleft-2\"><a href=\"http://g.mlr.gov.cn/gkml_9184/201512/P020151225577960096911.doc\" target=\"_blank\">1.国家科学技术进步奖推荐项目一.doc</a><br/><a href=\"http://g.mlr.gov.cn/gkml_9184/201512/P020151225577960258069.doc\" target=\"_blank\">2.国家科学技术进步奖推荐项目二.doc</a><br/><a href=\"http://g.mlr.gov.cn/gkml_9184/201512/P020151225577960398401.doc\" target=\"_blank\">3.国家科学技术进步奖推荐项目三.doc</a><br/><a href=\"http://g.mlr.gov.cn/gkml_9184/201512/P020151225577960536506.doc\" target=\"_blank\">4.国家科学技术进步奖推荐项目四.doc</a><br/><a href=\"http://g.mlr.gov.cn/gkml_9184/201512/P020151225607309901624.doc\" target=\"_blank\">5.国家科学技术进步奖推荐项目五.doc</a><br/><a href=\"http://g.mlr.gov.cn/gkml_9184/201512/P020151225577960802195.doc\" target=\"_blank\">6.国家自然科学奖推荐项目.doc</a></ol></td></tr></tbody></table><p><br/></p>','2016年度国家科技奖推荐项目公示','2016年度国家科技奖推荐项目公示','1','1','2016-01-21 20:48:57','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('25','1','关于加大采煤塌陷地治理力度的建议复文摘要','','2016-01-21 20:50:25','<p>&nbsp;一、你们提出的建议十分重要　　</p><p>　　安徽省淮北市作为资源型城市，为国家经济发展做出突出贡献，也形成了众多的采煤塌陷区，付出了沉重代价，城市可持续发展确实面临严重挑战。　　</p><p>　　二、关于灾毁土地依法核减等问题　　</p><p>　　历史上形成的采煤塌陷，严重威胁着塌陷区域城乡居民的生命和财产安全。对确实难以恢复耕种条件的，可以依法按照土地变更调查的有关程序和要求，经批准对这部分耕地按现状变更为未利用地。　　</p><p>　　三、关于建立采煤塌陷区综合治理基金问题　　</p><p>　　采煤沉陷区综合治理是一项复杂的系统工程，统筹推进治理工作，必须首先明确煤炭企业矿山地质环境治理恢复的主体责任，按照“谁引发、谁治理”的
原则，督促有关企业切实履行治理责任，加快解决避险安置等危害较大、情况紧急的问题。同时，对历史遗留或责任主体灭失的采煤沉陷区治理问题按照事权划分原
则研究相应治理措施。中央财政通过分成的矿产资源专项收入安排专项资金，对各地开展历史遗留的矿山地质环境治理给予了大力支持，其中采煤沉陷区是支持重
点，已累计安排资金近300亿元。中央财政还通过中央基建投资安排了采煤沉陷区治理专项资金，支持地方开展原国有重点煤矿采煤沉陷区治理工作。目前，政府
性基金项目过多，容易固化预算支持结构，消弱财政宏观调控能力。十二届全国人大一次会议通过的《国务院机构改革和职能转变方案》和新一届国务院第一次常务
会议明确提出，要取消一批行政事业性收费和政府性基金项目。鉴于以上情况，可考虑充分利用现有资金和政策开展矿山地质环境治理。</p><p>　　四、关于国家出台支持煤炭资源企业转型发展的政策</p><p>　　为支持煤炭企业转产转型发展，近年来国家出台了一系列政策措施。《国务院关于促进煤炭工业健康发展的若干意见》（国发〔2015〕18号）、
《煤炭产业政策》、《煤炭工业发展“十二五”规划》均提出，鼓励和支持大型煤炭企业到异地开办煤矿，煤炭资源优先向资源枯竭的大型煤炭企业配置，鼓励煤炭
企业发展矿区循环经济，支持符合条件的煤炭企业上市或通过发行债券、股权转让等方式筹集转产转型发展资金。　　</p><p>　　五、下一步工作　　</p><p>　　今后，中央财政将进一步完善政策，加大投入，持续支持矿山地质环境治理工作。有关部门也将统筹研究促进煤炭企业转产转型发展的政策措施，积极支持煤炭企业可持续发展。　　</p><p>　　同时，我部也积极谋划，将资源枯竭型城市矿区历史遗留损毁土地列为“十三五”土地整治工作重点区域，组织实施土地复垦重大工程，促进资源枯竭型
城市经济社会可持续发展。调整耕地保有量和基本农田保护任务，综合考虑因采矿塌陷难以恢复、不宜农作的基本农田等因素，实事求是合理确定各地的耕地保有量
和基本农田保护任务。</p><p><br/></p>','关于加大采煤塌陷地治理力度的建议复文摘要','关于加大采煤塌陷地治理力度的建议复文摘要','1','1','2016-01-21 20:49:41','','0','','','0','{\"thumb\":\"\"}','1','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('26','1','国土资源部关于开展2015年度土地矿产卫片执法监督检查工作的通知','','2016-01-21 20:51:08','<p style=\"overflow-x: hidden\">各省、自治区、直辖市国土资源主管部门，新疆生产建设兵团国土资源局，解放军土地管理局，中国地质调查局及部有关直属单位，各派驻地方的国家土地督察局，部机关有关司局：</p><p style=\"overflow-x: hidden\">　　为进一步推动各地落实国土资源监管责任，持续加强对土地矿产开发利用情况的全面监管，促进国土资源有效保护和合理利用，尽职尽责保护国土资源、节约集约利用国土资源、尽心尽力维护群众权益，全面推进法治国土建设，部决定在全国统一部署开展2015年度土地矿产卫片执法监督检查工作（以下简称卫片执法）。现将有关事项通知如下：</p><p style=\"overflow-x: hidden\">　　<strong>一、主要任务</strong></p><p style=\"overflow-x: hidden\">　　通过开展卫片执法，督促严格规范公正文明查处整改国土资源违法行为，维护国土资源管理秩序；监督检查国土资源监管责任落实情况，评估一个地区年度国土资源管理秩序；检验一个地区国土资源日常执法监管情况，推动执法方式向“发现在初始、解决在萌芽”转变。</p><p style=\"overflow-x: hidden\">　<strong>　二、检查对象</strong></p><p style=\"overflow-x: hidden\">　　2015年度土地卫片执法的工作对象为部下发的2015年度土地变更调查遥感监测图斑经合法性判定后，涉及违法用地的图斑。</p><p style=\"overflow-x: hidden\">　　2015年度矿产卫片执法的工作对象为部下发的矿产疑似违法图斑。</p><p style=\"overflow-x: hidden\">　　<strong>三、工作安排</strong></p><p style=\"overflow-x: hidden\">　　2015年11月，部下发通知，部署开展2015年度卫片执法工作，与2015年度土地变更调查同步下发遥感监测图斑数据，同时组织下发2015年度重点矿区矿产疑似违法图斑数据。</p><p style=\"overflow-x: hidden\">　　2016年4月，部下发2015年度重点矿区以外的矿产疑似违法图斑数据。</p><p style=\"overflow-x: hidden\">　　2016年6月30日前，市级国土资源主管部门完成对县级实地已拆除图斑情况的验收，并通过卫片执法信息系统，向省级国土资源主管部门上报卫片执法结果。省级国土资源主管部门可以依此结果开展约谈工作。</p><p style=\"overflow-x: hidden\">　　2016年7月31日前，省级国土资源主管部门完成2015年度卫片执法省级验收等工作；在考虑违法行为查处整改结果的基础上，启动问责工作，并向部报送工作报告和检查结果。期间其他具体工作，由省级国土资源主管部门自行安排。</p><p style=\"overflow-x: hidden\">　　部适时组织对下发的遥感监测图斑和矿产疑似违法图斑开展随机抽查、重点核查。在省级卫片执法工作完成后，部将组织对省级卫片执法工作进行抽查，重点抽查国土资源违法案件查处及整改落实情况，推动地方各级国土资源主管部门依法依规履职尽责。</p><p style=\"overflow-x: hidden\">　　<strong>四、工作方式</strong></p><p style=\"overflow-x: hidden\">　<strong>　（一）与土地变更调查工作协同推进。</strong></p><p style=\"overflow-x: hidden\">　　县级国土资源主管执法监察部门要结合日常执法监管，在2015年度土地变更调查阶段，与相关业务部门共同完成对遥感监测图斑的合法性判定；对其中尚未查处的违法用地，要立即组织查处。部、省、市三级国土资源主管部门结合土地变更调查抽查、评价，共同完成对土地遥感监测图斑合法性判定真实性、准确性评估工作。</p><p style=\"overflow-x: hidden\">　　截至2015年12月31日，凡2015年度部下发遥感监测图斑涉及的违法用地、违法勘查开采矿产资源行为，均纳入2015年度卫片执法查处整改范围，并通过卫片执法信息系统上报。对违法用地所涉及的图斑，要及时提交给地籍部门，按土地变更调查工作的要求进行变更。对未能及时在2015年度土地变更调查中变更为新增建设用地的，要在卫片执法信息系统中予以标注；在卫片执法中已经整改恢复土地原貌的，纳入下一年度遥感监测范围持续监管，其中已经变更为新增建设用地的，要在下一年度土地变更调查时退回原地类。对2015年度土地变更调查中的“往年批准本年建设”（“PJ”）图斑，填报相应其实际占用的耕地面积，并计入2015年度实际建设占用的新增建设用地占用耕地总面积。其他遥感监测图斑，不再在卫片执法信息系统中填报。</p><p style=\"overflow-x: hidden\">　　<strong>（二）与土地例行督察工作相衔接。</strong></p><p style=\"overflow-x: hidden\">　　例行督察地区在上报2015年度土地卫片执法结果前，相关数据必须经相关派驻地方的国家土地督察局审核同意。土地卫片执法的新增建设用地面积及违法占用耕地面积比例，按照全国土地卫片执法统一的政策标准认定和统计。受国家土地总督察委托，派驻地方的国家土地督察局参加督察区域内组织的土地卫片执法约谈会。</p><p style=\"overflow-x: hidden\">　　<strong>五、工作要求</strong></p><p style=\"overflow-x: hidden\">　　<strong>（一）明确职责任务分工，切实抓好工作落实。</strong></p><p style=\"overflow-x: hidden\">　　部进行总体工作部署，明确要求，组织开展培训、调研、督导、通报情况、解疑释惑等，指导推动工作。开展随机抽查和重点抽查。选取重大典型案件，进行挂牌督办、公开通报。对全国查处整改情况、约谈和问责情况，予以通报。对省级卫片执法工作进行抽查。</p><p style=\"overflow-x: hidden\">　　省级国土资源主管部门要主动向省级人 民政府汇报，将卫片执法作为省级人民政府落实耕地和基本农田保护责任的重要手段，以省级人民政府办公厅名义，或报请省级人民政府同意后，发文部署，组织所 辖市（地、州、盟，以下简称市）、县（市、区、旗，以下简称县）级人民政府，开展本地区2015年度卫片执法工作，落实人员、经费等必要的保障。要以 规范查处违法行为和推动查处整改落实到位为重点，督促市、县级人民政府积极采取措施，消除国土资源违法状态。要选取卫片执法中发现的重大、典型案件，进行 挂牌督办、公开通报，并将挂牌督办、公开通报情况及时报部。要认真开展数据审核、实地验收和提出约谈建议、启动问责工作。</p><p style=\"overflow-x: hidden\">　　市级国土资源主管部门要指导、督促所辖县做好卫片执法工作，对卫片执法中发现的典型违法案件要直接查处，并对本地区的卫片数据审核、直接查处的案件、实地验收等工作负责。对县级国土资源主管部门填报为实地已经拆除、恢复土地原貌的地块，要实地逐宗核实，出具验收意见。</p><p style=\"overflow-x: hidden\">　　县级承担整改主体责任，并对查、报数据真实性、准确性负直接责任。涉及遥感监测图斑分割、合并的，要按要求填报地块所涉及的遥感监测图斑编号，并详细注明地块四至；有条件的地区，可上传表示地块实际范围边界的坐标文件。</p><p style=\"overflow-x: hidden\">　　国土资源各业务部门要按照分工协作、各司其职的原则组织开展工作，切实负起责任，抓好落实，确保按时保质完成卫片执法各项任务。地籍部门要对2015年度新增建设用地成果负责，并及时提供给执法监察部门；审批部门要提供相关审批卷宗材料，对用地合法性和勘查、开采矿产资源行为的合法性进行认定；规划部门要对规划符合性进行认定；执法监察部门要对违法案件查处工作负责，并填报相关核查结果。</p><p style=\"overflow-x: hidden\">　　对《中央编办关于印发开展综合行政执法体制改革试点工作意见的通知》（中央编办发〔2015〕15号）确定的138个试点地区，省、市级国土资源主管部门要提请相关地区人民政府，加强国土资源与综合行政执法等部门的衔接配合，确保卫片执法工作有序推进。</p><p style=\"overflow-x: hidden\">　　<strong>（二）严格规范公正文明执法，严肃查处国土资源违法行为。</strong></p><p style=\"overflow-x: hidden\">　　地方各级国土资源主管部门要坚决贯彻落实《中共国土资源部党组关于全面推进法治国土建设的意见》和《国土资源部办公厅关于依法履职严格规范公正执法的通知》（国土资厅发〔2015〕34号）的 有关要求，履职尽责。对部下发的图斑中涉及违法用地、违法勘查开采矿产资源行为，依据土地管理、矿产资源法律法规立案查处的，要按照国家有关法律法规和 《国土资源行政处罚办法》、《国土资源违法行为查处工作规程》等规定，依法依规依程序进行查处，查处情况须纳入违法案件查处台账和年度违法数据统计；日常 执法工作中已经查处但尚未结案的，要依法依规继续推进；由地方政府组织或政府其他部门依据相关法律法规查处整改的违法行为，要在职责范围内予以配合。</p><p style=\"overflow-x: hidden\">　　地方各级国土资源主管部门在依法履行对违法行为的发现、制止和查处职责的前提下，对于制止无效、查处无法实施的违法行为和案件，要按照《国土资源违法行为查处工作规程》、《进一步加强和规范对违反国土资源管理法律法规行为报告工作的意见》（国土资厅发〔2010〕58号）的有关要求，进行专项报告；可以根据情况将涉嫌违法的事实及制止违法行为的情况抄告发展改革、规划、建设等相关部门，提请相关部门按照共同责任机制的要求履行部门职责，采取措施共同制止违法行为；必要时，可以将有关情况向社会通报。</p><p style=\"overflow-x: hidden\">　　地方各级国土资源主管部门要把国土资 源违法行为查处整改情况作为衡量卫片执法工作成效的第一标准。上一级国土资源主管部门要对下一级地区卫片执法中发现的国土资源违法违规行为查处整改情况进 行考核。对查处整改均已落实到位的地区，予以表扬；对查处整改不主动、不积极的，予以通报批评。查处整改落实不到位情况突出的，不得通过验收。</p><p style=\"overflow-x: hidden\">　　<strong>（三）改进约谈问责方式，增强约谈问责的严肃性。</strong></p><p style=\"overflow-x: hidden\">　　地方各级国土资源主管部门在确定约谈、问责地区时，要全面理解《违反土地管理规定行为处分办法》（监察部、人力资源和社会保障部、国土资源部令第15号，以下简称15号令）第三条的有关规定，避免出现“唯15%比例论”的倾向。对土地管理秩序混乱、违法占用耕地面积比例虽未达到15%以上但造成恶劣影响或者其他严重后果的地区，要纳入约谈、问责范围；对违法违规比例虽然不高或数量不大，但不认真组织查处整改、得过且过的，也要纳入约谈范围，推动查处整改。</p><p style=\"overflow-x: hidden\">　　对经查处整改后，国土资源违法仍然严 重的市、县，由省级人民政府负责人约谈市、县政府的主要领导。在约谈土地违法严重地区的同时，要兼顾矿产违法严重地区。确定约谈地区时，要突出地方政府主 导因素和监管责任。要以约谈促进查处整改落实。开展约谈时，可邀请主流媒体参加，加大对外宣传和公开曝光力度。</p><p style=\"overflow-x: hidden\">　　对违法数量较大、违法占用耕地面积比例达到15% 以上的地区，但在向省级国土资源主管部门上报卫片执法结果前，地方政府通过主动采取有效措施，查处整改落实到位，已经消除违法状态，没有造成恶劣影响或者 其他严重后果的，可不纳入约谈范围；在省级国土资源主管部门完成验收向部上报检查结果前，已经消除违法状态，没有造成恶劣影响或者其他严重后果的，可不纳 入问责范围。</p><p style=\"overflow-x: hidden\">　　省级国土资源主管部门要在完成省级验收、确认有关事实后，对土地管理秩序仍然混乱，符合15号令相关规定的地区，立即启动问责。省级应问责而没有问责的，部将启动问责。</p><p style=\"overflow-x: hidden\">　　省级国土资源主管部门要加强对被约谈、问责地区的后续监管，督促其将国土资源违法行为查处整改落实到位。各地可以探索利用全天候遥感监测成果，加强对被约谈、问责地区的监测监管。</p><p style=\"overflow-x: hidden\">　　<strong>（四）评估检验日常执法监管，努力实现监管方式转变。</strong></p><p style=\"overflow-x: hidden\">　　省级国土资源主管部门要建立健全日常执法工作成效与年度卫片执法结果相挂钩的奖惩机制，结合报部的违法统计数据、违法案件查处台账、日常巡查报告情况、12336国土资源违法线索举报核实结果和日常案件查处情况等，与卫 片执法中违法用地、违法勘查、开采矿产资源的相关情况进行比对，分析评估一个地区日常执法工作情况，进一步规范检验考核机制。对日常执法工作到位、卫片执 法工作成效明显的地区和个人，要予以通报表扬和奖励；对日常执法工作履职不到位情况比较突出的地区和个人，要通报批评；造成严重后果或恶劣影响的，要倒查 责任，严肃处理。</p><p style=\"overflow-x: hidden\">　　市、县国土资源主管部门要进一步加大日常执法力度，认真履行职责。在卫片执法工作中，要如实填报国土资源违法案件在日常执法中发现、制止、报告、查处的情况，并作出分析和说明，查找工作薄弱环节，努力实现监管方式向“发现在初始，制止在萌芽”转变。</p><p style=\"overflow-x: hidden\">　　<strong>（五）推行执法信息公示制度，探索卫片执法情况网上公开。</strong></p><p style=\"overflow-x: hidden\">　　地方各级国土资源主管部门要积极推行 卫片执法信息公示制度。要在风险评估的基础上，从卫片执法结果公示着手，逐步扩大卫片执法信息公开的内容。有条件的地区，可以探索将遥感监测图斑信息、卫 片执法发现的违法案件线索、查处整改进展情况等执法内容向社会公开，接受社会监督。</p><p style=\"overflow-x: hidden\">　　部将对地方各级国土资源主管部门在2015年度卫片执法工作中立案查处的国土资源违法案件的查处整改及落实情况进行统计汇总，并以适当形式在部门户网站上进行公示。</p><p style=\"overflow-x: hidden\">　　<strong>六、信息和成果上报</strong></p><p style=\"overflow-x: hidden\">　　<strong>（一）报部备案的材料。</strong></p><p style=\"overflow-x: hidden\">　　1.通知和工作方案。在部部署开展2015年度卫片执法工作1个月内，省级国土资源主管部门要将本地区开展2015年度卫片执法工作的通知、工作方案报部备案。</p><p style=\"overflow-x: hidden\">　　2.数据审核及验收的方案、标准。2016年5月30日前，要将省级数据审核工作方案、验收方案和验收标准报部。</p><p style=\"overflow-x: hidden\">　　3.其他。省级国土资源主管部门制定的政策性文件，地方探索加强国土资源执法监察工作并取得突出成效的好经验、好做法等材料。</p><p style=\"overflow-x: hidden\">　　<strong>（二）工作进展情况月报。</strong></p><p style=\"overflow-x: hidden\">　　省级国土资源主管部门在本通知下发后的每月30日前以电子件向部报送卫片执法工作进展情况月报。遇到亟待解决的重大问题，可即时向部专门报告。</p><p style=\"overflow-x: hidden\">　　<strong>（三）数据成果及报告。</strong></p><p style=\"overflow-x: hidden\">　　1.最终数据成果及报告。2016年7月31日前，省 级国土资源主管部门要通过卫片执法信息系统将卫片执法的各类具体数据成果（军用土地除外）报部。同时，要将本地区卫片执法工作情况的报告及有关统计汇总表 （表格内容及具体样式以卫片执法信息系统为准）报部。报告中的数据汇总结果要与通过卫片执法信息系统报部的最终数据汇总结果保持一致。</p><p style=\"overflow-x: hidden\">　　2.挂牌督办、公开通报情况。在挂牌督办、公开通报3个工作日内，省级国土资源主管部门要将挂牌督办、公开通报有关情况报部。</p><p style=\"overflow-x: hidden\">　　3.约谈情况报告。在开展约谈后的3个工作日内，省级国土资源主管部门要将约谈情况，开展警示约谈工作的通知、方案以及有关领导在约谈会上的讲话、媒体宣传报道等材料一并报部。</p><p style=\"overflow-x: hidden\">　　4.问责情况报告。在启动问责程序后的3个工作日内，省级国土资源主管部门要将启动问责情况报部。省级国土资源主管部门要及时了解问责落实情况，并将问责结果及时报部。</p><p style=\"overflow-x: hidden\">　　以上信息和成果均同时以纸质和电子件形式上报(纸质件一式两份，电子件发至部执法监察局邮箱并通过电子政务办公系统报部)。《军用土地登记表》以机要件单独上报，由部移交解放军土地管理局。</p><p style=\"overflow-x: hidden\">　　<strong>七、其他</strong></p><p style=\"overflow-x: hidden\">　　省级国土资源主管部门在工作中遇到问题要及时与部联系。属于土地利用变化遥感监测方面的问题，与中国土地勘测规划院联系，联系人：辛丽璇，电话：（010）66503970。属于矿产资源遥感监测工作方面的，与中国地质调查局联系，联系人：杨金中、万建华，电话：（010）62060309、58584688。属于土地矿产卫片执法信息系统使用方面的，与部信息中心联系，联系人：李磊，电话：（010）66558656。其他方面的问题，与部执法监察局联系，土地卫片执法联系人：宾洪超，电话：（010）66558332；矿产卫片执法联系人：潘辉，电话：（010）66558327。</p><p style=\"overflow-x: hidden\">　　部执法监察局邮箱：<a href=\"mailto:zfjzdc@mail.mlr.gov.cn\">zfjzdc@mail.mlr.gov.cn</a></p><p><br/></p>','国土资源部关于开展2015年度土地矿产卫片执法监督检查工作的通知','国土资源部关于开展2015年度土地矿产卫片执法监督检查工作的通知','1','1','2016-01-21 20:50:31','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('27','1','国土资源部关于山东中矿集团有限公司玲南金矿矿山地质环境保护与恢复治理等16个方案通过审查的公告','','2016-01-21 20:51:53','<p>根据《矿山地质环境保护规定》（国土资源部令第44号），山东中矿集团有限公司玲南金矿矿山地质环境保护与恢复治理等16个方案通过审查，现予公告。</p><p style=\"overflow-x: hidden\">2016年1月8日&nbsp;</p><table cellpadding=\"0\" cellspacing=\"0\" width=\"96%\"><tbody><tr class=\"firstRow\"><td><span style=\"color:#CC3300\"><strong><span style=\"color:#000099\">附件：</span></strong></span></td></tr><tr><td height=\"25\"><ol class=\" list-paddingleft-2\"><a href=\"http://g.mlr.gov.cn/gkml_9184/201601/P020160113394148812637.doc\" target=\"_blank\">16个通过审查的矿山地质环境保护与治理恢复.doc</a></ol></td></tr></tbody></table><p><br/></p>','国土资源部关于山东中矿集团有限公司玲南金矿矿山地质环境保护与恢复治理等16个方案通过审查的公告','国土资源部关于山东中矿集团有限公司玲南金矿矿山地质环境保护与恢复治理等16个方案通过审查的公告','1','1','2016-01-21 20:51:33','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('28','1','国土资源部关于聘任国家特邀国土资源监察专员的决定','','2016-01-21 20:52:37','<p class=\"Custom_UnionStyle\">各省、自治区、直辖市国土资源主管部门，解放军土地管理局，新疆生产建设兵团国土资源局，各派驻地方的国家土地督察局，中国地质调查局及部其他直属单位，部机关各司局：</p><p class=\"Custom_UnionStyle\">　　为贯彻落实《中国共产党统一战线工作条例（试行）》、《中共中央关于进一步加强中国共产
党领导的多党合作和政治协商制度建设的意见》，充分发挥各民主党派、全国工商联和无党派人士对国土资源管理工作的监督、咨询作用，促进尽职尽责保护国土资
源、节约集约利用国土资源、尽心尽力维护群众权益，经中共中央统战部推荐并商各民主党派中央、全国工商联同意，国土资源部决定：</p><p class=\"Custom_UnionStyle\">　　聘任温香彩、关平、冯仲科、陈学军、刘俊来、徐明、杨志峰、陈效逑、黄海峰、刘炳江、倪
晋仁、徐海云、王兵、高晓路、贺泓、李院生、卞曙光、郑丙辉、顾行发、高吉喜、沈仁芳、柴文忠、李兵、罗道全、张宁、郑建闽、白莲湘、沈丽霞、王权、周剑
平等30位同志为第四届国家特邀国土资源监察专员，聘期五年(2015年12月至2020年11月)。</p><p><br/></p>','国土资源部关于聘任国家特邀国土资源监察专员的决定','国土资源部关于聘任国家特邀国土资源监察专员的决定','1','1','2016-01-21 20:52:18','','0','','','0','{\"thumb\":\"\"}','1','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('29','1','国土资源部办公厅关于切实配合做好岁末年初和元旦春节期间安全生产工作的通知','','2016-01-21 20:53:14','<p style=\"overflow-x: hidden; word-break: break-all\">各省、自治区、直辖市国土资源主管部门，中国地质调查局及部其他直属单位，各派驻地方的国家土地督察局：</p><p style=\"overflow-x: hidden; word-break: break-all\">　　近期以来，部分行业领域重特大事故仍
时有发生，危害严重、影响恶劣。时值岁末年初，临近元旦、春节，安全生产工作面临新的考验。对此，党中央、国务院高度重视，李克强总理、张高丽副总理、马
凯副总理和王勇国务委员等领导同志近日专门作出重要批示，强调临近年终岁末，安全生产不能有丝毫放松；要扎实做好隐患排查，不可心存侥幸，不可等闲视之，
严防重大事故发生，保障群众生命财产安全。为认真贯彻落实党中央、国务院领导同志关于安全生产工作重要批示和《国务院安委会办公室关于切实做好岁末年初及
2016年元旦春节期间安全生产工作的通知》（安委办明电〔2015〕30号）精神，切实配合有关部门做好岁末年初及2016年元旦、春节期间安全生产工
作，有效防范和坚决遏制重特大事故，现就有关事项通知如下：</p><p style=\"overflow-x: hidden; word-break: break-all\">　　<strong>一、认真落实党中央、国务院领导同志重要批示精神，强化安全生产责任和措施落实 </strong></p><p style=\"overflow-x: hidden; word-break: break-all\">　　岁末年初历来是安全生产的关键时期。
一些生产经营活动进入旺季，交通运输繁忙；一些企业赶工期、抢任务意愿强烈；节日期间群众出行和大型文娱活动、集会等增多。同时受低温、雨雪、冰冻、寒
潮、雾霾等灾害性天气影响，事故易发多发。全国大部分地区处于非汛期，但受极端天气因素影响，局部地区强降雨时有发生，地质灾害防治形势依然严峻。要清醒
认识当前安全生产面临的严峻形势和新的考验，进一步强化安全生产红线意识和底线思维，按照“党政同责、一岗双责、失职追责”的要求，全面落实安全生产责任
和管理措施，确保岁末年初和元旦、春节期间安全平稳。</p><p style=\"overflow-x: hidden; word-break: break-all\">　　地方各级国土资源主管部门要按照地方
人民政府的统一部署，结合职能分工，深入一线，切实加强对重点地区、重点企业的检查指导，消除监管盲区、堵塞管理漏洞，强化企业安全生产主体责任落实。地
调局及部其他直属单位要对岁末年初的安全生产工作进行再动员、再部署，加强安全管理和隐患排查治理，强化干部职工风险意识和安全教育培训，严防各类事故特
别是重特大事故的发生。</p><p style=\"overflow-x: hidden; word-break: break-all\">　　<strong>二、切实抓好安全生产大检查“回头看”，深入排查治理安全隐患 </strong></p><p style=\"overflow-x: hidden; word-break: break-all\">　　地方各级国土资源主管部门要在地方人
民政府的统一领导下，积极配合有关部门切实抓好安全生产大检查“回头看”、危险化学品和易燃易爆物品安全专项整治，督促企业认真开展冬季安全检查，全面排
查整治各类事故隐患，配合有关部门抓好前期检查发现的隐患整改工作。要持续保持高压态势，强化执法监督检查，严厉打击无证勘查开采、超越批准的矿区范围采
矿等行为，严防矿产资源违法违规行为引发安全事故。要配合有关部门切实加强对已关闭矿井、技改矿井、新建矿井、停产整顿矿井的巡查监控力度，严防节日期间
非法违法突击生产。要切实抓好地质灾害隐患排查，对人员密集区、工程活动区、尾矿库、排土场、公路及河流沿线等地质灾害易发区进行全面细致的排查，落实安
全防范措施，深化隐患治理，严防自然灾害引发生产安全事故。</p><p style=\"overflow-x: hidden; word-break: break-all\">　　地调局及部其他直属单位要按照安全生
产大检查“回头看”部署，着力抓好前期检查发现的隐患整改工作，对重大隐患要盯紧看牢、逐一复查，确保整改到位。一时不能完成整改的重大隐患，要进行严密
监控并落实好安全措施。对整改责任不落实、整改不到位的，要依法依规严肃问责。地调局等单位要加大对重点单位隐患排查整改情况监督检查力度，推动安全生产
大检查“回头看”取得实效。</p><p><br/></p>','国土资源部办公厅关于切实配合做好岁末年初和元旦春节期间安全生产工作的通知','国土资源部办公厅关于切实配合做好岁末年初和元旦春节期间安全生产工作的通知','1','1','2016-01-21 20:52:51','','0','','','0','{\"thumb\":\"\"}','1','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('30','1','国土资源部关于同意命名广西浦北五皇山国家地质公园的批复','','2016-01-21 20:53:46','<p>广西壮族自治区国土资源厅：</p><p>　　《关于广西浦北五皇山地质公园申请最终验收和命名国家地质公园的请示》（桂国土资报〔2015〕212号）收悉。部组织专家组对浦北五皇山地质公园建设进行了实地验收，依据部相关规定及专家组验收意见，批复如下：</p><p>　　一、同意命名广西浦北五皇山国家地质公园。</p><p>　　二、广西浦北五皇山国家地质公园要遵循“在保护中开发，在开发中保护”的原则，做好园区 内花岗岩、流水、中小型构造等地质遗迹资源的保护和开发利用，开展公众地学科普教育和科学研究，并按照国土资源部相关规定和国家地质公园建设指南要求，加 强国家地质公园管理，完善国家地质公园建设，促进地方资源、环境和经济的协调发展，为生态文明建设做出贡献。</p><p>　　三、你厅要加强对广西浦北五皇山国家地质公园建设的指导，监督和检查地质公园及其主管部门按照国家相关法律规范开展各项活动。</p><p>　　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</p><p>　　附件：广西浦北五皇山国家地质公园边界拐点坐标（不公开）</p><p>2015年12月28日</p><p><br/></p>','国土资源部关于同意命名广西浦北五皇山国家地质公园的批复','国土资源部关于同意命名广西浦北五皇山国家地质公园的批复','1','1','2016-01-21 20:53:29','','0','','','0','{\"thumb\":\"\"}','2','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('31','1','国土资源部 住房和城乡建设部 国家旅游局关于支持旅游业发展用地政策的意见','国土资源部 住房和城乡建设部 国家旅游局关于支持旅游业发展用地政策的意见','2016-01-21 20:54:22','<p>各省、自治区、直辖市和新疆生产建设兵团国土资源、住房和城乡建设、旅游主管部门：</p><p>　　为贯彻党的十八届五中全会精神，落实《国务院关于促进旅游业改革发展的若干意见》（国发〔2014〕31号）、《国务院办公厅关于进一步促进旅
游投资和消费的若干意见》（国办发〔2015〕62号）相关部署，促进稳增长、调结构、扩就业，提高旅游业用地市场化配置和节约集约利用水平，现就相关用
地问题提出以下意见。</p><p>　　一、积极保障旅游业发展用地供应</p><p>　　（一）有效落实旅游重点项目新增建设用地。按照资源和生态保护、文物安全、节约集约用地原则，在与土地利用总体规划、城乡规划、风景名胜区规
划、环境保护规划等相关规划衔接的基础上，加快编制旅游发展规划。对符合相关规划的旅游项目，各地应按照项目建设时序，及时安排新增建设用地计划指标，依
法办理土地转用、征收或收回手续，积极组织实施土地供应。加大旅游扶贫用地保障。</p><p>　　（二）支持使用未利用地、废弃地、边远海岛等土地建设旅游项目。在符合生态环境保护要求和相关规划的前提下，对使用荒山、荒地、荒滩及石漠化、
边远海岛土地建设的旅游项目，优先安排新增建设用地计划指标，出让底价可按不低于土地取得成本、土地前期开发成本和按规定应收取相关费用之和的原则确定。
对复垦利用垃圾场、废弃矿山等历史遗留损毁土地建设的旅游项目，各地可按照“谁投资、谁受益”的原则，制定支持政策，吸引社会投资，鼓励土地权利人自行复
垦。政府收回和征收的历史遗留损毁土地用于旅游项目建设的，可合并开展确定复垦投资主体和土地供应工作，但应通过招标拍卖挂牌方式进行。</p><p>　　（三）依法实行用地分类管理制度。旅游项目中，属于永久性设施建设用地的，依法按建设用地管理；属于自然景观用地及农牧渔业种植、养殖用地的，不征收（收回）、不转用，按现用途管理，由景区管理机构和经营主体与土地权利人依法协调种植、养殖、管护与旅游经营关系。</p><p>　　（四）多方式供应建设用地。旅游相关建设项目用地中，用途单一且符合法定划拨范围的，可以划拨方式供应；用途混合且包括经营性用途的，应当采取
招标拍卖挂牌方式供应，其中影视城、仿古城等人造景观用地按《城市用地分类与规划建设用地标准》的“娱乐康体用地”办理规划手续，土地供应方式、价格、使
用年限依法按旅游用地确定。景区内建设亭、台、栈道、厕所、步道、索道缆车等设施用地，可按《城市用地分类与规划建设用地标准》“其他建设用地”办理规划
手续，参照公园用途办理土地供应手续。风景名胜区的规划、建设和管理，应当遵守有关法律、行政法规和国务院规定。鼓励以长期租赁、先租后让、租让结合方式
供应旅游项目建设用地。</p><p>　　（五）加大旅游厕所用地保障力度。要高度重视旅游厕所在旅游业发展中的文明窗口地位和基本公共服务作用。新建、改建旅游厕所及相关粪便无害化处
理设施需使用新增建设用地的，可在2018年前由旅游厕所建设单位集中申请，按照法定报批程序集中统一办理用地手续，各地专项安排新增建设用地计划指标。
符合《划拨用地目录》的粪便处理设施，可以划拨方式供应。支持在其他项目中配套建设旅游厕所，可在供应其他项目建设用地时，将配建要求纳入土地使用条件，
土地供应后，由相关权利人依法明确旅游厕所产权关系。</p><p>　　二、明确旅游新业态用地政策</p><p>　　（六）引导乡村旅游规范发展。在符合土地利用总体规划、县域乡村建设规划、乡和村庄规划、风景名胜区规划等相关规划的前提下，农村集体经济组织
可以依法使用建设用地自办或以土地使用权入股、联营等方式与其他单位和个人共同举办住宿、餐饮、停车场等旅游接待服务企业。依据各省、自治区、直辖市制定
的管理办法，城镇和乡村居民可以利用自有住宅或者其他条件依法从事旅游经营。农村集体经济组织以外的单位和个人，可依法通过承包经营流转的方式，使用农民
集体所有的农用地、未利用地，从事与旅游相关的种植业、林业、畜牧业和渔业生产。支持通过开展城乡建设用地增减挂钩试点，优化农村建设用地布局，建设旅游
设施。</p><p>　　（七）促进自驾车、房车营地旅游有序发展。按照“市场导向、科学布局、合理开发、绿色运营”原则，加快制定自驾车房车营地建设规划和建设标准。
新建自驾车房车营地项目用地，应当满足符合相关规划、垃圾污水处理设施完备、建筑材料环保、建筑风格色彩与当地自然人文环境协调等条件。自驾车房车营地项
目土地用途按旅馆用地管理，按旅游用地确定供应底价、供应方式和使用年限。</p><p>　　（八）支持邮轮、游艇旅游优化发展。新建邮轮、游艇码头用地实行有偿使用。有偿使用的邮轮、游艇码头用地可采取协议方式供应。现有码头增设邮
轮、游艇停泊功能的，可保持现有土地权利类型不变；利用现有码头设施用地、房产增设住宿、餐饮、娱乐等商业服务设施的，经批准可以协议方式办理用地手续。</p><p>　　（九）促进文化、研学旅游发展。利用现有文化遗产、大型公共设施、知名院校、科研机构、工矿企业、大型农场开展文化、研学旅游活动，在符合规
划、不改变土地用途的前提下，上述机构土地权利人利用现有房产兴办住宿、餐饮等旅游接待设施的，可保持原土地用途、权利类型不变；土地权利人申请办理用地
手续的，经批准可以协议方式办理。历史文化街区建设控制地带内的新建建筑物、构筑物，应当符合保护规划确定的建设控制要求。</p><p>　　三、加强旅游业用地服务监管</p><p>　　（十）做好确权登记服务。各地要依据《不动产登记暂行条例》等法律法规规定，按照不动产统一登记制度体系要求，不断增强服务意识，坚持方便企
业、方便群众，减少办证环节，提高办事效率，改进服务质量，积极做好旅游业发展用地等不动产登记发证工作，依法明晰产权、保护权益，为旅游业发展提供必要
的产权保障和融资条件。</p><p>　　（十一）建立部门共同监管机制。风景名胜区、自然保护区、国家公园等旅游资源开发，建设项目用地供应和使用管理应同时符合土地利用总体规划、城
乡规划、风景名胜区规划及其他相关区域保护发展建设等规划，不符合的，不得批准用地和供地。新供旅游项目用地，将环保设施建设、建筑材料使用、建筑风格协
调等要求纳入土地供应前置条件的，提出条件的政府部门应与土地使用权取得者签订相关建设活动协议书，并依法履行监管职责。要及时总结旅游产业用地利用实践
情况，积极开展旅游产业用地重大问题研究和探索创新。</p><p>　　（十二）严格旅游业用地供应和利用监管。严格旅游相关农用地、未利用地用途管制，未经依法批准，擅自改为建设用地的，依法追究责任。严禁以任何
名义和方式出让或变相出让风景名胜区资源及其景区土地。规范土地供应行为,以协议方式供应土地的，出让金不得低于按国家规定所确定的最低价。严格旅游项目
配套商品住宅管理，因旅游项目配套安排商品住宅要求修改土地利用总体规划、城乡规划的，不得批准。严格相关旅游设施用地改变用途管理，土地供应合同中应明
确约定，整宗或部分改变用途，用于商品住宅等其他经营项目的，应由政府收回，重新依法供应。</p><p>　　本文件自下发之日起执行，有效期五年。</p><p style=\"text-align:right;\">　　2015年11月25日</p><p><br/></p>','国土资源部 住房和城乡建设部 国家旅游局关于支持旅游业发展用地政策的意见','国土资源部 住房和城乡建设部 国家旅游局关于支持旅游业发展用地政策的意见','1','1','2016-01-21 20:54:04','','0','','','0','{\"thumb\":\"\"}','14','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('32','1','最新加入企业','','2016-01-21 20:57:02','<p>广州市兴强电线电缆实业有限公司 ，主营 网络线、电视天线、控制缆等弱电产品 等。公司秉承“顾客至上，锐意进取”的经营理念，坚持“客户第一”的原则为广大客户提供优质的服务。欢迎惠顾！</p>','广州市兴强电线电缆实业有限公司','广州市兴强电线电缆实业有限公司','1','1','2016-01-21 20:55:52','','0','','','0','{\"thumb\":\"\"}','1','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('33','1','安平县越天五金丝网制造有限公司','','2016-01-21 20:58:35','<h1 title=\"安平县越天五金丝网制造有限公司\">安平县越天五金丝网制造有限公司</h1><p>&nbsp; 安
平县越天五金丝网制造有限公司本公司位于河北衡水市安平县。主营钢板网冲孔网建筑网片、镀锌丝 荷兰网 轧花网、电焊网 不锈钢网、刺绳 
刀片刺绳、脚踏网 勾花网 烧烤网、钢格板 铁丝网 
等、石笼网、护栏等丝网产品。在金属丝网行业获得广大客户的认可。公司秉承“保证一流质量，保持一级信誉”的经营理念，坚持“客户第一”“价格低廉，质量
满意”的原则为广大客户提供优质的服务。现有备有大量现货！可开票！欢迎来电洽谈业务欢迎来电咨询 &nbsp;厂：0318-7979335 &nbsp;
13653187111 &nbsp;梁经理！<br/></p>','安平县越天五金丝网制造有限公司','徐','1','1','2016-01-21 20:58:02','','0','','','0','{\"thumb\":\"\"}','1','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('34','1','最新加入企业','','2016-01-21 20:59:37','<h1 title=\"安平县华海金属网厂\">安平县华海金属网厂</h1><p>安平县华海金属网厂位于全国著名的&quot;丝网之乡&quot;－安平。地处京、津、石交通线交差口，距天津港250公里，交通十分便利。我公司始建于1990年，于
2004年正式成立公司。目前拥有国内最先进的织机设备及大型焊接设备，技术力量雄厚，质量检测体系完善，采用优质原材料，严把质量关。并于2005年
12月通过了ISO9001、2000国际质量管理体系认证。<br/>　　 我厂主要生产设计研发各种护栏网、隔离栅、刺网、刀片刺绳。产品广泛用于高速公路、铁路、机场、体育场、学校、小区、园林防护、冶金机械防护等领域。<br/> 多年来，我公司坚持“以质量求生存，以信誉谋发展”的原则。 凭借过硬的质量、良好的信誉、优质的服务、合理的价格为契机不断拓展市场。目前，本公司生产经营的护栏网系列产品，畅销全国30多个省、市、自治区。　 <br/>　　 丝牵四海心，网织五洲情。让您用最优惠的价格、最快捷的方式买到最放心的产品。我公司竭愿以丝为媒，以网交友，欢迎各界朋友光临，与四海宾朋、五洲商贾携手共创美好明天！<br/></p>','安平县华海金属网厂','安平县华海金属网厂','1','1','2016-01-21 20:58:51','','0','','','0','{\"thumb\":\"\"}','13','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('35','1','','','2016-01-21 23:15:52','','最后','','0','1','2016-01-21 23:15:41','','0','2','','0','{\"template\":\"index_last\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('36','1','中国对阿拉伯国家政策文件','百度','2016-01-22 17:56:34','<p style=\"text-indent: 2em; font-size: 14px;\"><strong><a href=\"http://country.huanqiu.com/china\" class=\"linkAbout\" target=\"_blank\" title=\"中国\">中国</a>对阿拉伯国家政策文件</strong> </p><p style=\"text-indent: 2em; font-size: 14px;\"><strong>二0一六年一月</strong> </p><p style=\"text-indent: 2em; font-size: 14px;\"><strong>前言</strong> </p><p style=\"text-indent: 2em; font-size: 14px;\">中国同阿拉伯国家友谊源远流长。2000多年以来，陆上、海上丝绸之路一直把中阿两大民族连接在一起。在漫长的历史长河中，和平合作、开放包容、互学互鉴、互利共赢始终是中阿交往的主旋律。</p><p style=\"text-indent: 2em; font-size: 14px;\">新中国成立和阿拉伯国家相继独立，开创了中阿友好交往的
新纪元。1956年至1990年，中国同全部22个阿拉伯国家建立外交关系。中国坚定支持阿拉伯民族解放运动，坚定支持阿拉伯国家捍卫国家主权和领土完
整、争取和维护民族权益、反对外来干涉和侵略的斗争，坚定支持阿拉伯国家发展民族经济、建设国家的事业。阿拉伯国家在恢复中国在<a href=\"http://country.huanqiu.com/un\" class=\"linkAbout\" target=\"_blank\" title=\"联合国\">联合国</a>合法席位、台湾等问题上给予中方有力支持。</p><p style=\"text-indent: 2em; font-size: 14px;\">冷战结束后，中阿双方顺应要和平、谋发展、促合作的世界潮流，相互尊重，平等相待，致力于深化传统友好，积极发展双边关系，政治、经贸、科技、文教、军事、卫生、体育、新闻等领域合作成果显著，构建起面向新世纪的友好合作关系。</p><p style=\"text-indent: 2em; font-size: 14px;\">2004年，中国-阿拉伯国家合作论坛成立，并发展成为
涵盖众多领域、建有10余项机制的集体合作平台。2010年中国和阿拉伯国家建立全面合作、共同发展的战略合作关系，中阿集体合作进入全面提质升级的新阶
段。习近平主席在2014年中阿合作论坛第六届部长级会议开幕式上发表重要讲话，指明了中阿集体合作的重点领域和优先方向，为中阿关系发展和论坛建设确定
了行动指南。</p><p style=\"text-indent: 2em; font-size: 14px;\">中国开启同阿拉伯国家外交关系已走过60年历
程，各领域合作不断深化。中国同8个阿拉伯国家建有全面战略伙伴关系、战略伙伴关系或战略合作关系，同海湾阿拉伯国家合作委员会建立中海战略对话机制。阿
拉伯国家已成为中国第一大原油供应方和第七大贸易伙伴。中国提出的中阿共建丝绸之路经济带和21世纪海上丝绸之路、构建以能源合作为主轴，以基础设施建设
和贸易投资便利化为两翼，以核能、航天卫星、新能源三大高新领域为突破口的“1+2+3”合作格局、加强产能合作等倡议得到阿拉伯国家积极响应。双方在维
护国家主权和领土完整、捍卫民族尊严、政治解决热点问题、促进中东和平与稳定等方面有广泛共识，在联合国改革、气候变化、多哈回合谈判等问题上立场相近，
保持着良好协调与配合。双方人文交流日益频繁，民间交往更加密切，增进了双方人民的相互了解和友谊。</p><p style=\"text-indent: 2em; font-size: 14px;\">60年来，中阿友好合作在广度和深度上都实现了
历史性跨越，成为南南合作典范，积累了成功的经验：双方坚持相互尊重、平等相待，无论国际风云如何变幻，都始终互为兄弟、朋友和伙伴；双方坚持互利共赢、
共同发展，无论各自经历了什么发展变化，都始终追求共同利益、可持续发展；双方努力促进对话交流、文明互鉴，无论在意识形态上有何差异，都始终尊重对方的
社会制度和发展道路。</p><p style=\"text-indent: 2em; font-size: 14px;\">中国政府制订首份对阿拉伯国家政策文件，在回顾和总结中阿关系发展经验的基础上，阐述发展中阿关系指导原则，规划中阿互利合作蓝图，重申致力于中东和平稳定的政治意愿，推动中阿关系迈向更高水平。</p><p><br/></p>','中国对阿拉伯国家政策文件（全文）','中国对阿拉伯国家政策文件','1','1','2016-01-22 17:54:59','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('37','1','通知','百度一下你就知道','2016-01-22 17:58:07','<h1>湖北鄂州市教育局关于调整信息化工作领导小组成员及职责的通知</h1><p><br/></p>','湖北鄂州市教育局关于调整信息化工作领导小组成员及职责的通知','湖北鄂州市教育局关于调整信息化工作领导小组成员及职责的通知','1','1','2016-01-22 17:56:39','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('38','1','教育部关于印发刘延东副总理通知','百度','2016-01-22 17:59:22','<p style=\"text-align: center;\"><strong>教育部关于印发刘延东副总理在第二次全国</strong></p><p style=\"text-align: center;\"><strong>教育信息化工作电视电话会议上讲话的通知</strong></p><p>各省、自治区、直辖市教育厅(教委)，各计划单列市教育局，新疆生产建设兵团教育局，部属各高等学校：</p><p>　　2015年11月19日，国家教育体制改革领导小组召开了第二次全国教育信息化工作电视电话会议，中共中央政治局委员、国务院副总理、国家教育
体制改革领导小组组长刘延东出席会议并发表了题为《巩固成果 开拓创新 
以教育信息化全面推动教育现代化》的重要讲话。刘延东副总理的讲话对做好“十三五”期间教育信息化工作、加快全国教育信息化进程，具有重要的指导意义。现
将刘延东副总理的讲话印发给你们，请认真组织学习，并结合实际贯彻落实讲话精神。</p><p style=\"text-align: right;\">教育部</p><p style=\"text-align: right;\">2015年12月28日</p><p><br/></p>','教育部关于印发刘延东副总理在第二次全国教育信息化工作电视电话会议上讲话的通知','关于印发刘延东副总理在第二次全国教育信息化工作电视电话会议上讲话的通知','1','1','2016-01-22 17:58:09','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('39','1','发展目标','百度','2016-01-22 18:00:22','<p>同志们：</p><p>&nbsp;</p><p>　　上午好!</p><p>&nbsp;</p><p>　　每年召开一次全国电教馆长会议，很有必要，大家也很有收获。今年的形势、任务都很紧，召开这次会议非常重要。刚才有6位同志作了交流发言，总的来说都很好，取得的成绩、一些很好的做法很有启发。</p><p>&nbsp;</p><p>　　下面，我讲几点意见。</p><p>&nbsp;</p><p><strong>　　一、全国教育信息化工作取得重大进展</strong></p><p>&nbsp;</p><p>　　2012年全国教育信息化工作会议以来，教育系统按照刘延东副总理的重要讲话精神，通过各方面的共同努力，以“三通两平台”为核心目标和标志性工程，教育信息化工作全面取得进展，突出体现在以下方面：</p><p><br/></p>','全面深化应用 全面实现“十二五”教育信息化发展目标','全面深化应用 全面实现“十二五”教育信息化发展目标','1','1','2016-01-22 17:59:23','','0','','','0','{\"thumb\":\"\"}','73','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('40','1','福建省','百度','2016-01-22 18:01:32','<p>各有关高等学校，各有关中职学校：</p><p>　　根据教育部科技司《关于请配合做好全国教育信息化调研的函》(教技司〔2015〕372号)有关要求，为配合做好全国教育信息化发展状况调研工
作，根据教育部教育信息化战略研究基地(华中)及全国教育信息化发展报告编制组的具体布置，现将我省有关调研工作要求通知如下：</p><p><strong>　　一、调研范围</strong></p><p>　　本次调研范围包括设区市教育行政主管部门、县(市、区)教育行政主管部门、中小学、中等职业学校、高等职业院校、本科高校(具体名单见附件1)。县(市、区)及中小学请福州市、泉州市、宁德市、厦门市、南平市各自选一个县(市、区)及所辖所有中小学参与调研工作。</p><p><strong>　　二、调研内容</strong></p><p>　　(一)中小学填写《2015中小学教育信息化发展状况调研问卷》(附件2)。</p><p>　　(二)中等职业学校和高等职业院校填写《2015职业学校教育信息化发展状况调研问卷》(附件3)。</p><p>　　(三)本科高校填写《2015普通高校教育信息化发展状况调研问卷》(附件4)。</p><p>　　(四)设区市教育局及县(市、区)教育局填写《2015教育管理信息化发展状况调研问卷》(附件5)。</p><p>　　以上调查问卷在教育部教育信息化战略研究基地(华中)网站上均可下载，网址http://eisr.ccnu.edu.cn/2015。</p><p><strong>　　三.调研时限及要求</strong></p><p>　　本次调研采取EXCEL电子问卷形式，直接点击问卷中的括号或下划线区域，输入内容后保存即可，完成后请将问卷重命名为“单位名称+问卷填写联
系人手机号码.xls”。请各有关设区市教育局负责组织本辖区内教育行政部门及所辖中小学的调研工作，将《2015中小学教育信息化发展状况调研问卷》、
《2015教育管理信息化发展状况调研问卷》收集完整。各有关高校、中职学校负责填写本校的调研表格。以上电子表格请于2016年1月31日前发送至我厅
科技处，邮箱jytkjc@fjedu.gov.cn，联系人：刘心悦，联系电话：0591-87091208。</p><p>　　附件：1.福建省参加全国教育信息化调研单位名单</p><p>　　2.《2015中小学教育信息化发展状况调研问卷》</p><p>　　3.《2015职业学校教育信息化发展状况调研问卷》</p><p>　　4.《2015普通高校教育信息化发展状况调研问卷》</p><p>　　5.《2015教育管理信息化发展状况调研问卷》</p><p style=\"text-align: right\">　　福建省教育厅办公室</p><p style=\"text-align: right\">　　2016年1月12日</p><p><br/></p>','福建省：关于配合开展全国教育信息化调研工作的通知','福建省：关于配合开展全国教育信息化调研工作的通知','1','1','2016-01-22 18:00:24','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('41','1','自治区教育厅办公室  ','度娘','2016-01-22 18:03:06','<p>各市、县(区)教育局，宁东管委会社会事务局：</p><p>　　为贯彻落实第二次全国教育信息化电视电话会议精神，大力推动我区中小学教育信息化应用工作，以经验促发展，以典型带应用。经研究,决定召开全区中小学教育信息化工作会议，现将有关事宜通知如下。</p><p>　　一、 会议内容</p><p>　　(一)学习参观自治区教育信息化示范校。</p><p>　　(二)学习传达第二次全国教育信息化工作电视电话会议精神。</p><p>　　(三)总结我区中小学教育信息化应用工作。</p><p>　　(四) 安排部署下一阶段全区中小学教育信息化工作。</p><p>　　二、 参会人员</p><p>　　各市、县(区)教育局分管领导和信息化工作负责人;2014及2015年教育信息化示范学校、教育厅直属中小学校校长;自治区教育信息化专家委员会成员;教育厅机关各处室、信息化管理中心、教研室、电教馆、教科所等单位和部门的主要负责人参会。</p><p>　　三、 会议时间和地点</p><p>　　时间：2015年12月17日下午14:00～18:00报到，12月18日开会，会期一天。</p><p>　　地点：银川国贸中心假日酒店(银川市兴庆区解放西街141号)</p><p>　　四、 其他事项</p><p>　　(一)请于12月16日前将会议回执电子版发送至自治区教育信息化管理中心联系人信箱。</p><p>　　(二)参会人员往返交通、住宿费自理。</p><p>　　(三)联系方式</p><p>　　联系人：自治区教育信息化管理中心 梁辉</p><p><br/></p>','宁夏：关于召开全区中小学教育信息化工作会议的通知','关于召开全区中小学教育信息化工作会议的通知','1','1','2016-01-22 18:01:33','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('42','1','江西省吉安市','','2016-01-22 18:08:54','<p>井开区社会事业局，各县(市、区)教育局，直属学校：</p><p>　　大力推进教育信息化,对深化教育领域综合改革,提高教育质量,促进教育公平,提升教育管理的科学化、精准化等具有十分重要的作用。为进一步提升教育信息化水平，经研究，决定召开教育信息化推进工作座谈会，有关事项如下：</p><p>　　一、会议时间和地点：2015年12月17日，会期一天。上午9:00前到海联国际饭店报到，9:00—12:00在海联国际饭店二楼会议室开会。下午3:00到吉安职业技术学院会堂观看第八届中小学(幼儿园)艺术节汇报演出。</p><p>　　二、会议内容：听取教育信息化专家讲座;交流推进教育信息化经验。</p><p>　　三、参会人员：井开区社会事业局，各县(市、区)教育局局长、电教馆馆长，市直学校校长，吉州区15所城区学校校长，青原区5所城区学校校长。</p><p style=\"text-align: right;\">吉安市教育局</p><p><br/></p>','江西省吉安市关于召开教育信息化推进工作座谈会的通知','江西省吉安市关于召开教育信息化推进工作座谈会的通知','1','1','2016-01-22 18:03:07','','0','','','0','{\"thumb\":\"\",\"photo\":[{\"url\":\"http:\\/\\/baike.baidu.com\\/pic\\/%E4%B8%AD%E5%9B%BD%E6%95%99%E8%82%B2%E6%94%BF%E7%AD%96%E7%A0%94%E7%A9%B6%E9%99%A2\\/2962563\\/0\\/fd428c45e576527c869473e6?fr=lemma&ct=single#aid=0&pic=fd428c45e576527c869473e6\",\"alt\":\"\"}]}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('43','1','黑龙江省教育厅关于印发黑龙江省','','2016-01-22 18:11:44','<h1>黑龙江省教育厅关于印发黑龙江省“互联网+教育”行动计划（2016-2020年）的通知</h1><p><br/></p>','黑龙江省教育厅关于印发黑龙江省“互联网+教育”行动计划（2016-2020年）的通知','关于印发黑龙江省“互联网+教育”行动计划（2016-2020年）的通知','1','1','2016-01-22 18:10:30','','0','','','0','{\"thumb\":\"\",\"photo\":[{\"url\":\"http:\\/\\/www.ict.edu.cn\\/uploadfile\\/2015\\/1202\\/20151202100016588.jpg\",\"alt\":\"\"}]}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('44','1','证监会','','2016-01-22 18:20:58','<p>中国证券网讯（记者 
李丹丹）证监会新闻发言人张晓军22日在例行发布会上强调，新三板是挂牌公司股票公开转让的唯一合法平台，这里面的公开转让包含发布挂牌股票买卖的意向信
息，其他任何市场机构不得组织该类交易平台。他提醒投资者，应该通过新三板进行股票公开买卖，不能通过任何场外机构和互联网公司开展的股票挂牌公开转让平
台进行买卖行为，防止自身的权益受到损失。</p><p>他指出，新三板挂牌公司应该严格遵守法律法规，公开披露的信息应该通过股转系统指定的平台发布，不能通过任何场外平台公开发布披露信息。</p><p>为了更好满足投资者的转让需求，降低转让意向信息的搜寻成本，张晓军透露，股转系统正在建设挂牌公司转让的意向平台。这个平台可以为交易用户提供意向信息的修改、发布、查询服务，目前已经完成设计开发和性能测试，预计在今年2月正式上线运行。</p><p style=\"text-align: center; text-indent: 0;\"></p><p><br/></p>','证监会：新三板是挂牌公司股票公开转让唯一合法平台','新三板是挂牌公司股票公开转让唯一合法平台','1','1','2016-01-22 18:19:50','','0','','','0','{\"thumb\":\"\"}','3','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('45','1','高空作业平台最新动态 ','','2016-01-22 20:17:42','<p style=\"font-size:13.3333px;\">
	<span style=\"font-size:16px;\">河北三力升降机设备有限公司与大家分享</span><span style=\"font-size:16px;\">高空作业平台最新动态</span></p><p style=\"font-size:13.3333px;\">
	<span style=\"font-size:16px;\">当高空作业升降平台车最大作业高度大于20m时，通常升降平台装有防碰撞装置，以防止升
降平台与建筑物等物体在空中相碰。我公司从1986年研制GKZ一32型高空作业升降平台车的升降平台防碰撞装置雏型至今，经过多次改进，升降平台防碰撞
装置的性能、质量得到逐步提高。由于这种装置的实用性，有的用户在最大作业高度为20m以下的高空作业升降平台车上也要求增加升降平台防碰撞装置。笔者经
归纳整理后，将几次典型的改进介绍给读者。</span></p><p><span style=\"font-size:16px;\">1 最初的升降平台防碰撞装置</span><br/><span style=\"font-size:16px;\">这种防碰撞装置是直接利用触角式行程开关组成的。将2个3SE3—120R型触角式行程开
关固定在升降平台左右两侧下沿的外端拐角处，开关的触角方向与垂直方向、车辆的横向和纵向分别向外为45°夹角，如图1a所示。它的保护范围仅限于平台外
侧下沿的两端角处周围，范围较小。由于开关壳体外露，为防止开关被撞坏，在开关的安装板与升降平台之间加有缓冲弹簧，如图1b所示。即使这样开关也经常损
坏，可见这种防碰撞装置的不足。</span><br/><span style=\"font-size:16px;\">触角式行程开关属于机械式触点开关，当其触角与物体相碰时开关动作，开关的动作与碰物的方
向无关。由于升降平台与高处物体相碰的方位与方向是随机的，当发生碰撞时，应使全车的所有动作停止，而复位时则所有动作均应被恢复。因此，电路应具备自保
功能，只要有一个防碰撞开关动作(包括瞬间动作，下同)，保护电路便接通，使电磁阀(常闭式)得电，液压系统卸荷，动作停止。</span><br/><span style=\"font-size:16px;\">2 第一次改进</span><br/><span style=\"font-size:16px;\">为了增加防碰撞装置的保护范围，在升降平台的下面增加了防碰框，如图2a所示。防碰框是用
圆管焊接而成的矩形平面框架，其保护范围为整个升降平台下面的4个边缘，不论升降平台从哪个方位碰物，都能起到保护作用。防碰框与升降平台由钢丝绳连接，
钢丝绳的作用是碰物时的缓冲及恢复时防碰框的复位。由于钢丝绳弯曲时的弹性较差，防碰框的复位性不好。为了避免钢丝绳与防碰框连接的夹板凸出，可将防碰框
外沿内凹，防碰框的拐角处采用圆弧过渡，如图2b所示。当升降平台发生碰物时，通过防碰框使触角式行程开关动作，它们的位置关系如图2c所示。行程开关通
常用2个，布置在升降平台底面对角线上，如图2d所示。</span><br/><span style=\"font-size:16px;\">3 
第二次改进针对钢丝绳复位性差的弊端，参照芬兰勃朗涛(BRONTO)消防车升降平台防碰框的连接方式，将钢丝绳改为弹簧组件，如图3a所示。弹簧垂直布
置，其复位效果几乎达到完全复位。弹簧组件如图3b所示，根据升降平台的大小可选用3～4个弹簧组件将防碰框连接。在未发生碰物时，弹簧为自由状态，防碰
框由弹簧圈内的拉链与升降平台相连发生碰物时使弹簧变形。弹簧的刚度应适中并满足2项要求：</span><br/><span style=\"font-size:16px;\">(1)运动惯性的影响不应使防碰物装置动作；(2)碰物时防碰框与物体的接触力不能过大。</span><br/></p><p style=\"font-size:13.3333px;\">
	<span style=\"font-size:16px;\">为了提高防碰撞开关的可靠性，将2个行程开关改为一个电感式接近开关，接近开关固定于升
降平台底面下(见图3c)，当防碰框位移时，经传动杆带动传感圆盘，使其离开接近开关感应面，开关动作。传动杆与防碰框之间为销轴连接，在扭簧的作用下，
使传动杆保持向上，而传感圆盘经万向节连接，不管防碰框如何位移，传感圆盘始终贴在有机玻璃上位移，并与接近开关感应面的垂直间隙保持不变。</span></p><p><br/></p>','高空作业平台最新动态 ','高空作业平台最新动态 ','1','1','2016-01-22 18:21:00','','0','','','0','{\"thumb\":\"\",\"photo\":[{\"url\":\"20160122\\/56a21de362c01.jpg\",\"alt\":\"1\"}]}','3','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('46','1','问政','','2016-01-22 20:21:56','<p>　请拨打6666669，告知话务员您要找问政平台反映问题，你的声音会立刻被问政平台听到！</p><p>　　温馨提示：</p><p>　　1.请具体说明您所在位置属于哪个县区及哪个小区；　2.请向话务员留下您的有效联系方式，以便与您取得联系。</p><p><br/></p>','电话问政','如果您有需要解决的烦恼事，如果您有想让社会热点难点问题得到有关部门关注，请您拨打6666669电话问政。','1','1','2016-01-22 20:20:28','','0','','','0','{\"thumb\":\"\"}','1','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('47','1','网络问政平台成网民诉求主渠道 万余条留言99%有答复 ','','2016-01-22 20:22:57','<p>&nbsp; 大庆网讯（新闻中心记者 谢鹏 
周雪莹）随着我市网络问政的普及和发展，大庆网问政平台已成网民反映诉求的主渠道。12月8日，市委、市政府专门组织召开网民意见建议办理答复工作推进
会，通报前一时期网民意见建议办理答复情况，部署今后工作任务。市委常委、常务副市长于洪涛出席并讲话，市委常委、宣传部长徐向国主持。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;据了解，截至12月7日，今年以来“百湖民声”网络问政平台共收到本地网友问政留言12000多条，比去年同期增长42%，61家上线单位
答政率为99%。网民关注的热点问题主要集中在公交车、房产证、供暖、学区划分、驾驶证、烧烤摊扰民、天然气供应等与市民生活切身利益息息相关的问题。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;于洪涛指出，市委、市政府对网络问政平台建设高度关注并寄予厚望，高质量地办好网络问政平台是民生所需、责任所系。他要求，各答政单位要进
一步明确责任，思想认识要到位，答政态度要积极，答政人员要配齐，回复方法要得当，网民反映的意见建议要尽快落实，办理不及时的单位要严肃问责。同时，尽
快落实问政平台的运行机制、成果考评机制和协作机制，做到问政于民，问计于民，问需于民。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;徐向国要求，各答政单位要站在讲政治、讲大局、讲责任的高度，进一步明确答政工作的程序、分工和责任，要站在百姓的角度想问题，用真情实感
去抓落实，认真抓好梳理、整合、反馈、履行、处置、督办等各个环节，做到用权为民干实事，掌权为民干好事。要以督办问责的机制抓好落实，把网络问政平台打
造成畅通民意的窗口</p><p><br/></p>','网络问政平台成网民诉求主渠道 万余条留言99%有答复 ','网络问政平台成网民诉求主渠道 万余条留言99%有答复 ','1','1','2016-01-22 20:21:58','','0','','','0','{\"thumb\":\"\"}','5','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('48','1','01.22 涨停敢死队火线抢入6只强势股','','2016-01-22 20:24:57','<p><span style=\"color:#000000\"><br/>　　事件:公司去 年底发布定增方案,募集资金不超过18.2亿,其中近10亿用于“收购5家太阳能光伏电站项目公司100%股权并增资”, 
其他募集资金用于“4000吨/年邻对位衍生产品技改项目投资、年产16万吨多品种脂肪醇(酸)产品项目、烟气超低排放改造项目及补充流动资金”。近日,
公司又发布公告进一步补充说明定增情况。<br/><br/>　　点评:<br/>　　光伏行业快速增长,进军光伏电站。2015年是光伏装机规模化元年,光伏行业将进入装机规模化“新常态”,光伏行业发展进入快车道。本次定增收购和静
金太阳、吉木乃海锦、托克逊县金太阳、铁门关市利能、龙井中机5家20MW光伏电站项目公司100%股权,项目规模100MW。目前已经陆续并网过程当
中。预计达产后,年均贡献净利润4000万元。<br/><br/>　　光伏行业盈利中枢下移,电站收益最为丰厚。从光伏行业全产业链角度看,光伏上中游毛利一般在15-20%左右,而光伏电站运营毛利一般在50%以上,因此,公司切入光伏电站运营有助于将来进军电站后市场,为能源金融和能源互联网做好准备,打开想象空间。<br/><br/>　　巩固主业,实现“化工+新能源”双轮驱动。“4000吨/年邻对位衍生产品技改项目”,预计全部达产后每年营业收入为23931.62万元(不含增值
税),新增净利润为2001.11万元,税后内部收益率为21.31%,投资回收期为5.75年(所得税后,含建设期);“年产16万吨多品种脂肪醇
(酸)产品项目”,预计全部达产后每年营业收入为102126.65万元(不含增值税),新增净利润3182.13万元,税后内部收益率为28.02%,
投资回收期为4.86年(所得税后,含建设期)。两个项目定增是公司循环经济产业链的重要延伸,有利于拓宽相关产业链,丰富主业相关产品系列,进一步巩固
和提升公司的竞争力。<br/><br/>　　盈利预测与投资建议:<br/>　　预计公司15-17年净利润分别为6.4,7.94和10.09亿元,EPS分别为0.48, 0.62和0.78元,对应PE分别为16X,12X和9.6X,我们看好公司“化工+新能源”双轮驱动未来发展空间,给予“买入”评级。<br/><br/>　　风险提示<br/>　　公司光伏电站并网速度不达预期,新能源政策有所变化。(<span style=\"color:#3333ff\">太平洋</span>证券张学)<br/><br/><br/><br/></span></p>','01.22 涨停敢死队火线抢入6只强势股','01.22 涨停敢死队火线抢入6只强势股','1','1','2016-01-22 20:23:39','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('49','1','　洪城水业:成长性资产注入,PPP扩张可期 ','','2016-01-22 20:25:46','<p><span style=\"color:#000000\"><br/>　　南昌市公用事业平台,供水污水双核驱动。<br/><br/>　　公司是南昌市唯一的公用事业平台,当前拥有自来水运营规模143.5万吨/日,在建规模30万吨/日,投产后提升21%;南昌市自来水价格相比全国主
要城市,仍有较大的上涨空间,自来水业务有望实现量价齐升。污水处理规模125.80万m3/日,在建规模59.8万m3/日,建成后公司污水处理能力将
提升47%;南昌水业集团旗下尚有污水处理资产规模超20万吨日,存注入预期。<br/><br/>　　注入优质资产,成长性凸显。<br/><br/>　　公司拟购买南昌燃气、二次供水和公用新能源,根据业绩承诺/预测,标的资产对应15年PE分别11.12倍10.26倍和8.20倍。其中二次供水存
量改造市场大,收取二次供水服务费的转变提升盈利能力;南昌燃气和公用新能源在南昌具有垄断地位,随着南昌新天然气管线建设投运及加气站的新建投运,公司
燃气和车用天然气售气量有较大提升空间,成长性凸显。<br/><br/>　　江西省唯一公共事业上市平台,PPP助力成长。<br/><br/>　　作为江西省唯一国有公共事业上市平台,此次注入燃气、二次供水和新能源等优质资产,已彰显市政公用集团将上市公司公用事业平台做大做强的决心。江西省
公布首批总投资1065.17亿元的PPP项目中,生态环保类项目12个,投资总额148.35亿,而公司作为江西省国有公共事业平台公司,将在江西
PPP大潮中占据优势地位。<br/><br/>　　注入成长性资产,PPP扩张可期。<br/><br/>　　公司原有污水和供水业务稳定增长;本次集团注入的二次供水、南昌燃气、公用新能源等具有成长性的资产,为公司业绩提供较大弹性;公司为江西省唯一国有
上市公共事业平台,或将通过PPP项目实现快速扩张,预计2015-17年EPS分别为0.64元、0.68元和0.75元,给予“买入”评级。<br/><br/>　　风险提示:重组整合不及预期;外埠拓</span></p>','　洪城水业:成长性资产注入,PPP扩张可期 ','　洪城水业:成长性资产注入,PPP扩张可期 ','1','1','2016-01-22 20:24:58','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('50','1','科大智能:工业4.0新星','','2016-01-22 20:26:27','<p><span style=\"color:#000000\">平安观点:<br/>　　拟收购冠致自动化、华晓精密,扩张工业<span style=\"color:#3333ff\">机器人</span>版图:此次公司拟增发近1.1亿股,收购上
海冠致工业自动化有限公司及华晓精密工业(苏州)有限公司100%的股权,同时配套募资7.9亿元。冠致自动化是目前国内汽车智能焊装生产线领域的领军企
业,能够提供柔性生产线综合解决方案,作为上海大众的A级供应商,在上海大众生产<a href=\"http://www.guhai.com.cn/html/zgzl/sj/\" title=\"主力资金\" target=\"_blank\">主力</a>车型的多个制造厂均有其承建的柔性焊装生产线;华晓精密专注于AGV(自动导引轮式物流输送<span style=\"color:#3333ff\">机器人</span>)领域,已成为东风日产和东风雷诺的战略合作供应商。2014年,<span style=\"color:#3333ff\">科大智能</span>通过收购永乾机电正式进军工业生产智能化领域,涉足智能移载、智能搬运、智能输送和智能仓储业务,此次交易将进一步健全公司智能制造业务体系,实现从“智能移载机械臂(手)--AGV(脚)--柔性生产线(身)”于一体的完整产业链布局。<br/><br/>　　战略卡位精准,能源+制造双轮智能驱动:上市之初,公司的主业为中压配电载波通信系统,及配用电自动化终端;2015年,公司实现了对正信电气的100%控股,强化了在智能配用电领域的业务布局,未来有望加大在智能一次设备、新能源充电装置、电力巡检和作业<span style=\"color:#3333ff\">机器人</span>等产品的研发开拓。我们认为,工业4.0的要旨在于提升制造的智能化,这其中能源供给的智能化(电气化率的提升)、制造链条的智能化(自动化率的提升)、需求响应的智能化(信息化率的提升)将是企业竞逐的高地,看好<span style=\"color:#3333ff\">科大智能</span>战略卡位的精准度,以及其能源+制造双轮智能驱动的成长性。<br/><br/>　　盈利预测与投资建议:暂不考虑此次收购,预计15~17年公司EPS为0.22、0.28和0.37元,对应1月21日收盘价PE分别为85.3、65.9和50.3倍,首次覆盖,给予“推荐”评级。<br/><br/>　　风险提示:宏观经济下滑的风险;收购企业整合不利的风险。(平安证券余兵 )</span></p>','科大智能:工业4.0新星','科大智能:工业4.0新星','1','1','2016-01-22 20:25:49','','0','','','0','{\"thumb\":\"\"}','3','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('51','1','当需要使用最高级别的超级计算进行处理大量数据要求时，HPE Apollo 便可满足您的需求。该高密度服务器系列可提供高','','2016-01-22 20:29:39','<p>
		</p><p><span style=\"text-indent: 2em;\">当需要使用最高级别的超级计算进行处理大量数据要求时，HPE Apollo 便可满足您的需求。该高密度服务器系列可提供高效的机架级计算、存储、网络、电力和散热功能，能够满足最严苛的 HPC、大量数据分析和对象存储工作负载的需求。</span></p><p>HP Apollo 4200 Gen9 服务器是迈向密度优化的专用基础设施的理想企业桥梁，每台服务器容量高达 224 TB。同时无需特殊的机架，Apollo 4200 可以轻松放入深度为每台服务器 31.5 英寸的标准机架。</p><p><br/></p>','当需要使用最高级别的超级计算进行处理大量数据要求时，HPE Apollo 便可满足您的需求。该高密度服务器系列可提供高','HPE Apollo 便可满足您的需求。该高密度服务器系列可提供高','1','1','2016-01-22 20:27:52','','0','','','0','{\"thumb\":\"\",\"photo\":[{\"url\":\"20160122\\/56a220afbee87.jpg\",\"alt\":\"3\"}]}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('52','1','企业创新与转型(模块制) ','','2016-01-22 20:31:25','<p>传统家居企业纯粹依靠线下生产+销售的固有模式，正在被互联网思维模式所取代。</p><p>2016年1月17日，继12月刚刚开幕的上海淮海店之后，美克美家巨匠之作北四环店正式开业启幕。在这个颇具奢侈品、时尚和艺术氛围的开业典礼上，还出现了IBM的身影。</p><p>美克家居作为一家23年以制造为基础的企业，一直在不断的进行创新和探索。去年7月美克家居和IBM签订战略合作协议，开始为家居行业插上互联网翅
膀。而此次北四环店开业，美克美家更是强化了科技+艺术的美克精神，和IBM、Apple共同推出基于面向iOS的MobileFirst解决方案的
apps，其中包括帮助设计顾问更好为消费者服务的Sales Consult、设计一体化呈现的Home Visit、实现定制化推荐的Dynamic
 
Buy等。通过这些apps带来的科技化体验，可以实现家居购物可视化、家居布置方案场景化、家居设计简单化、家居购物过程趣味化等四大方面的体验跃升，
将大大简化购买家具的过程。</p><p>在客户选型过程中，利用大数据分析匹配的结果，为消费者进行个性化推荐，让购买过程不再盲目，更加具有针对性；在产品展示过程中，不再是完全靠凭空
想象，而是借由设计顾问手上的移动终端将3D效果进行现场展示；甚至还可以输入自己的房型信息，现场了解空间设计效果，降低了消费者置家方案设计时间，各
种不同场景下的全新沟通方式，全面提升消费者“互联网+”时代下的个性化家居生活体验。</p><p><br/></p>','企业创新与转型(模块制) ','美克美家巨匠之作北四环店正式开业启幕。在这个颇具奢侈品、时尚和艺术氛围的开业典礼上，还出现了IBM的身影。
','1','1','2016-01-22 20:29:44','','0','','','0','{\"thumb\":\"\"}','5','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('53','1','人才培训','人才培训','2016-01-22 20:35:59','<p>培养具有良好人文、科学素质和社会责任感，学科基础扎实，具有自我学习能
力、创新精神和创新能力的一流人才。具体包含以下几个方面：得到基础研究和应用研究的训练，具有扎实的基础理论知识和实验技能，动手能力强、综合素质好；
掌握科学的思维方法，具备较强的获取知识能力，具有探索精神、<a target=\"_blank\" href=\"http://baike.baidu.com/view/301641.htm\">创新能力</a>和优秀的科学品质。</p><p><a name=\"2\"></a><a name=\"sub992314_2\"></a><a name=\"培养形式\"></a></p><h2 class=\"para-title level-2\"><span class=\"title-text\">培养形式</span><a style=\"display: block;\" class=\"edit-icon j-edit-link\" data-edit-dl=\"2\"><em class=\"cmn-icon wiki-lemma-icons wiki-lemma-icons_edit-lemma\"></em>编辑</a></h2><p>培养人才的形式有多种，除了在各级各类学校中进行系统教育的进修外，还可采取业余教育，脱产或不脱产的培训班、研讨班等形式，充分利用成人教育、业余教育、电化教育等条件，提倡并鼓励自学成材。人才培养的具体要求，各行各业都有所不同，但总的目标是达到<a target=\"_blank\" href=\"http://baike.baidu.com/view/188023.htm\">德</a>、智、体全面发展。对于企业来说，人才培养是多层次的，包括高级经营人才的培养；职能管理人才的培养和基层管理人才的培养，等等之类。</p><p><a name=\"3\"></a><a name=\"sub992314_3\"></a><a name=\"模式改革\"></a></p><h2 class=\"para-title level-2\"><span class=\"title-text\">模式改革</span><a style=\"display: block;\" class=\"edit-icon j-edit-link\" data-edit-dl=\"3\"><em class=\"cmn-icon wiki-lemma-icons wiki-lemma-icons_edit-lemma\"></em>编辑</a></h2><p>教育教学改革的根本目的是提高人才培养质量。人才培养质量，有两种评价尺
度。一种是学校内部的评价尺度，另一种是学校外部的评价尺度，即社会的评价尺度。社会对高等学校人才培养质量的评价，主要是以高等教育的外显质量特征即高
等学校毕业生的质量作为评价依据，而对高等学校内部的教育教学活动不太关注；社会对毕业生质量的整体评价，主要是评价毕业生群体能否很好地适应国家、社
会、市场的需求。学校对人才培养质量的评价，主要是以高等教育的内部质量特征作为评价依据，即评价学校培养出来的学生，在整体上是否达到学校规定的专业培
养目标的要求，学校人才培养质量与培养目标的是否相符。因此，高等学校提高人才培养质量，就是提高人才培养对社会的适应程度，提高人才培养与培养目标的符
合程度。</p><p>人才培养质量，既要接受学校自身对高等教育内部质量特征的评价，又要接受社会对高等教育外显质量特征的评价，因此，以提高人才培养质量为核心的高等学校人才培养模式改革，必须遵循教育的外部关系规律与教育的内部关系规律。</p><p><br/></p>','人才培训','人才培训','1','1','2016-01-22 20:34:39','','0','','','0','{\"thumb\":\"\"}','2','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('54','1','市场开拓关键字','','2016-01-22 20:37:08','<p>内容简介</p><p>市场开拓是市场营销管理中的重要环节，几乎涵盖了</p><p>市场营销的所有内容。市场开拓是一门实践性很强的学</p><p>问，它机动、灵活，基于一定的理论，而又不拘泥于纯粹的理</p><p>论。本着这样的原则，本书系统阐述了关于市场开拓的核</p><p>心理论，同时涉及了市场开拓的许多实务问题，结合大量生</p><p>动、翔实的案例帮助读者更深入地理解市场开拓的思路与</p><p>精髓。</p><p>全书共分四篇：</p><p>第一篇提纲挈领，以<a target=\"_blank\" href=\"http://baike.baidu.com/subview/4884491/4885252.htm\">需求链</a>理论导出市场开拓的基本</p><p>步骤与规律，介绍了<a target=\"_blank\" href=\"http://baike.baidu.com/subview/673490/673490.htm\">市场机会</a>的分析与评价、目标市场选</p><p>择、<a target=\"_blank\" href=\"http://baike.baidu.com/subview/24278/24278.htm\">市场细分</a>、<a target=\"_blank\" href=\"http://baike.baidu.com/subview/281861/281861.htm\">产品定位</a>与决策等市场开拓一般步骤。</p><p>第二篇、第三篇分别从新产品和老产品的市场开拓两</p><p>个方面具体展开，介绍了各自市场开拓的实施规划、思路、</p><p>方法、策略。</p><p>第四篇则是将市场开拓的基本理论与实践相结合，一</p><p>方面介绍了一些最新的市场开拓思维，另一方面通过大量</p><p>中外案例，突出表现了市场开拓的灵活性、竞争性和实践</p><p>性。</p><p>全书内容丰富，新颖具体，具有一定的深度与广度，并</p><p>具有较强的理论指导意义和实践运用价值，可供广大的企</p><p>业界人士、市场营销经理以及营销爱好者阅读。</p><p><a name=\"2\"></a><a name=\"sub11345061_2\"></a><a name=\"作品目录\"></a></p><h2 class=\"para-title level-2\"><span class=\"title-text\">作品目录</span><a style=\"display: block;\" class=\"edit-icon j-edit-link\" data-edit-dl=\"2\"><em class=\"cmn-icon wiki-lemma-icons wiki-lemma-icons_edit-lemma\"></em>编辑</a></h2><p>目录<br/>　　第一篇 建立市场开拓体系<br/>　　第1章 <a target=\"_blank\" href=\"http://baike.baidu.com/subview/4884491/4885252.htm\">需求链</a>系统――市场开拓新思路<br/>　　1.1可危的传统市场开拓方式<br/>　　1.2定义需求链</p><p><br/></p>','市场开拓内容','市场开拓摘要','1','1','2016-01-22 20:36:05','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('55','1','管理咨询关键字','','2016-01-22 20:38:20','<p>企业管理咨询</p><p>1.<a target=\"_blank\" href=\"http://baike.baidu.com/view/861767.htm\">企业管理咨询</a>。企业管理咨询属于战略性咨询。导向性咨询，它类似于中医，主要是通过“望，闻，问，切”等手段，从定性的角度出发，运用专家的综合知识，分析.研究并解决<a target=\"_blank\" href=\"http://baike.baidu.com/view/3328854.htm\">企业经营管理</a>中存在的问题。</p><p>2.<a target=\"_blank\" href=\"http://baike.baidu.com/view/2241608.htm\">企业经营分析</a>。企业经营分析属于战略性咨询。问题性咨询，与企业管理咨询相比，它更类似于西医，是以“化验单，心电图，脑电图，CT”等企业的各项管理数据和财务指标为基础，通过对管理数据.财务数据的分析，判断企业的经营现状以及找出企业存在的问题。</p><p>管理咨询从应用的角度，可分为以下多种业务：</p><p>1. 经营战略咨询</p><p><br/></p>','管理咨询标题','管理咨询摘要','1','1','2016-01-22 20:37:13','','0','','','0','{\"thumb\":\"\"}','1','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('56','1','融资担保关键字','','2016-01-22 20:39:25','<p>内涵：金融性与中介性的双重属性</p><p>特征：金融性、多样性、履约责任刚性、责任比例分担</p><p>融资担保是担保业务中最主要的品种之一，是随着商业信用、金融信用的发展
需要和担保对象的融资需求而产生的的一种信用中介行为。信用担保机构通过介入包括银行在内的金融机构、企业或个人这些资金出借方与主要为企业和个人的资金
需求方之间，作为第三方保证人为债务方向债权方提供信用担保——担保债务方履行合同或其他类资金约定的责任和义务。</p><p>在其业务性质上，融资担保具有金融性和中介性双重属性，属于一种特殊的金融中介服务。</p><p>它通过利用自身的第三方信用为资金供给和资金需求方双方提供融资担保服
务，以此促进双方交易的完成。在开展融资担保业务过程中，信用担保机构要完成两方面的工作：一方面，是对资金需求方的信用评估；另一方面是向资金供给方提
供自身资信证明，取得其对自身信用保证资格和履约能力的认可。</p><p><a name=\"1_1\"></a><a name=\"sub392333_1_1\"></a><a name=\"物权担保\"></a></p><h3 class=\"para-title level-3\"><span class=\"title-text\">物权担保</span></h3><p><br/></p>','融资担保标题','融资担保摘要','1','1','2016-01-22 20:38:24','','0','','','0','{\"thumb\":\"\"}','1','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('57','1','法律服务关键字','法律服务来源','2016-01-22 20:41:00','<p>法律服务的内容包括诉讼业务服务和非诉讼业务服务：</p><p><a name=\"2_1\"></a><a name=\"sub3237873_2_1\"></a><a name=\"诉讼业务服务\"></a></p><h3 class=\"para-title level-3\"><span class=\"title-text\">诉讼业务服务</span></h3><p>各种经济、民事、行政案件的<a target=\"_blank\" href=\"http://baike.baidu.com/view/2956020.htm\">诉讼代理</a>和仲裁代理（详细参考百度百科诉讼业务词条）。</p><p><a name=\"2_2\"></a><a name=\"sub3237873_2_2\"></a><a name=\"非诉讼业务服务\"></a></p><h3 class=\"para-title level-3\"><span class=\"title-text\">非诉讼业务服务</span></h3><p>（一）咨询及文书服务</p><p>1、法律咨询及代写诉讼文书。代书包括：诉讼文书，包括起诉状、答辩状、上诉状、申诉状等；有关法律事务文书，包括委托书、遗嘱等；非法律事务文书。</p><p>2、出具<a target=\"_blank\" href=\"http://baike.baidu.com/view/819500.htm\">法律意见书</a>。法律意见书是指律师应当事人之委托，根据委托人所提供的事实材料，正确运用法律进行分析和阐述，对相关事实及行为提出的书面法律意见。</p><p>（二）专项法律服务</p><p>1、公司专项法律服务</p><p>包括企业的设立和解散的相关事务，公司日常经营管理中的一般法律事务，投资及项目开发、金融融资、公司证券业务、收购与兼并、企业的租赁、承包、托管、知识产权、劳动人事等特别法律事务。</p><p>2、建筑与房地产专项法律服务</p><p><br/></p>','法律服务标题','法律服务摘要','1','1','2016-01-22 20:39:27','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('58','1','信息服务关键字','','2016-01-22 20:41:56','<p><strong>信息服务的内涵</strong></p><p>信息服务的领域：包括科技、经济、政策法规、文化、市场、金融、投资、证券、旅游、娱乐、影视、生活等方面。</p><p>信息服务的形式：主动与被动，多向与单向。</p><p>信息服务的载体：文献型、电子型、网络型。</p><p>信息提供的渠道：正规与非正规，传统与现代。</p><p>信息提供主体：专职与非专职。</p><p>服务的层次和深度：零次、一次、二次、三次、知识型服务。</p><p><a name=\"4\"></a><a name=\"sub188053_4\"></a><a name=\"服务原则\"></a></p><h2 class=\"para-title level-2\"><span class=\"title-text\">服务原则</span><a style=\"display: block;\" class=\"edit-icon j-edit-link\" data-edit-dl=\"4\"><em class=\"cmn-icon wiki-lemma-icons wiki-lemma-icons_edit-lemma\"></em>编辑</a></h2><p>针对性原则、<a target=\"_blank\" href=\"http://baike.baidu.com/subview/597194/597194.htm\">及时性原则</a> 、易用性原则 、成本/效益原则。及时解决问题</p><p><a name=\"5\"></a><a name=\"sub188053_5\"></a><a name=\"主要方式\"></a></p><h2 class=\"para-title level-2\"><span class=\"title-text\">主要方式</span><a style=\"display: block;\" class=\"edit-icon j-edit-link\" data-edit-dl=\"5\"><em class=\"cmn-icon wiki-lemma-icons wiki-lemma-icons_edit-lemma\"></em>编辑</a></h2><p>(1)信息检索服务：根据用户的需求或提问从各类不同</p><p><br/></p>','信息服务标题','信息服务摘要','1','1','2016-01-22 20:41:04','','0','','','0','{\"thumb\":\"\"}','1','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('59','1','创业服务关键字','','2016-01-22 20:43:16','<p><a target=\"_blank\" href=\"http://baike.baidu.com/view/3755048.htm\">创业服务</a>是一种爱，需要传递。</p><p>每个人都可以享受到创业服务，每个创业者都可以提供创业服务。如果你曾经
成功过，或者现在已经有点功成名就了，你也许会很怀念你的创业时期，你所经历的一切。你寻找资金，人员以及市场的艰难，你觉得你受的苦使你成长了，更多的
是在你艰难的时候有人帮助到你。但有一点，你虽然成功了，但你的梦想还没有实现，因为你只是收获了金钱，并没有收获到梦想成功的喜悦。如果有和你曾经一样
有<a target=\"_blank\" href=\"http://baike.baidu.com/subview/16172/6317493.htm\">梦想</a>的
人，你希望他们成功吗，帮助你实现你的梦想，你愿意帮助他们吗？　如果你是一个失败的创业者，你希望看到后面的人仍然前赴后继的踏上这个雷区吗？也许他们
不理解你，也许他们已经踏上了一只脚。你愿意看他们陷入泥沼吗？那个是你曾经的死亡之旅，你是否愿意在他的脚将要踏入前大喊一声，我来了。然后你将他扶起
来，然后帮助他脱离陷阱。就像当初别人帮助你一样。如果你不伸手，那人真的就会没人泥潭。</p><p>如果你有梦想，却没有技术；如果你有技术，却没有团队；如果你有资金，却没有好的项目；如果你有团队，其他什么都没有；如果你什么都有，就是没有行动；那么创业服务可以实现你的梦想。</p><p>创业服务存在的问题和解决方案：</p><p>创业服务绝 不是送钱给服务者,而是提供<a target=\"_blank\" href=\"http://baike.baidu.com/subview/1505828/18204961.htm\">创业管理</a>和创业</p><p><br/></p>','创业服务标题','创业服务摘要','1','1','2016-01-22 20:42:03','','0','','','0','{\"thumb\":\"\"}','2','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('60','1','加强文艺人才培训','　建设德艺双馨文艺队伍 ','2016-01-22 21:38:21','<p>新华社北京１月２２日电　根据中宣部等六部门制定的《２０１６—２０１７年全国文艺业务骨干和管理干部培训工作规划》，今明两年将有约１３万文艺骨干接受培训。</p><p>　　根据这一规划，培训以中央宣传文化部门组织为主，紧密结合文艺工作者的思想和工作实际，坚持“二为”方向、“双百”方针，以强素质、出人才、出
精品为着力点，采取统一组织、统一安排、分类指导、分类实施的办法，利用２０１６年至２０１７年两年的时间，对文化部和国家新闻出版广电总局文艺业务骨
干、管理干部以及其他文艺人才，对中国文联各全国性文艺家协会和中国作协会员、国有民营文艺机构、新的文艺组织和新的文艺群体代表，进行培训，努力建设一
支德艺双馨的宏大文艺队伍，为社会主义文艺事业繁荣发展提供有力人才支撑。</p><p>　　培训的内容是学习党的十八大和十八届三中、四中、五中全会精神，学习习近平总书记系列重要讲话精神特别是在文艺工作座谈会上的重要讲话精神，学
习党的一系列文艺方针政策，学习《中共中央关于繁荣发展社会主义文艺的意见》，学习党中央、国务院关于繁荣发展社会主义文艺的重大工作部署，学习革命文艺
和社会主义文艺优良传统，学习文艺界先进典型的崇高精神和职业道德。</p><p><br/></p>','加强文艺人才培训　建设德艺双馨文艺队伍 ','加强文艺人才培训　建设德艺双馨文艺队伍 ','1','1','2016-01-22 21:36:25','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('61','1','培训教学统一教材和授课提纲','','2016-01-22 21:39:17','<p>培训的内容是学习党的十八大和十八届三中、四中、五中全会精神，学习习近平总书记系列重要讲话精神特别是在文艺工作座谈会上的重要讲话精神，学习党
的一系列文艺方针政策，学习《中共中央关于繁荣发展社会主义文艺的意见》，学习党中央、国务院关于繁荣发展社会主义文艺的重大工作部署，学习革命文艺和社
会主义文艺优良传统，学习文艺界先进典型的崇高精神和职业道德。</p><p>　　培训教学统一教材和授课提纲，采取课堂教学、研讨交流等多种方式，紧密结合文艺创作生产实际，创新方法手段，增强针对性、实效性。</p><p>　　培训工作规划要求，通过扎实深入的学习教育培训，使广大文艺工作者在学习贯彻习近平总书记系列重要讲话精神的自觉性、坚定性上取得新提高，在树
立马克思主义唯物史观和文艺观、牢牢把握文艺正确方向上取得新提高，在提升职业精神和思想境界上取得新提高，保持奋发有为、昂扬向上的精神状态，为繁荣社
会主义文艺建功立业。</p><p><br/></p>','培训教学统一教材和授课提纲','培训教学统一教材和授课提纲，','1','1','2016-01-22 21:38:23','','0','','','0','{\"thumb\":\"\"}','3','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('62','1','','','2016-01-24 15:22:47','','二级服务荟萃','','1','1','2016-01-24 15:22:29','','0','2','','0','{\"template\":\"server_list\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('63','1','','','2016-01-24 16:32:16','','lihaoqiang','','1','1','2016-01-24 16:32:00','','0','2','','0','{\"template\":\"zindex\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('64','1','技术','技术','2016-01-24 16:43:35','<p>ThinkCMF一直秉承ThinkPHP大道至简的理念，坚持做最简约的ThinkPHP开源软件！</p><p>您的每一份帮助都将支持ThinkCMF做的更好，走的更远！</p><p>我们一直在坚持不懈地努力，并坚持让ThinkCMF完全开源免费，您的帮助将使我们更有动力和信心^_^！</p><p>支付宝捐赠：(用手机支付宝扫描二维码支付)</p><p><br/></p>','技术','技术','1','1','2016-01-24 16:43:02','','0','','','0','{\"thumb\":\"\"}','1','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('65','1','','','2016-01-24 21:24:28','','userlist','','1','1','2016-01-24 21:24:15','','0','2','','0','{\"template\":\"userlist\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('66','1','','','2016-01-24 21:31:26','','通知公告','','1','1','2016-01-24 21:31:08','','0','2','','0','{\"template\":\"tongzhi\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('67','1','','','2016-01-24 21:48:35','','政策文件','','1','1','2016-01-24 21:48:18','','0','2','','0','{\"template\":\"zhengce\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('68','1','','','2016-01-24 22:00:47','','平台动态','','1','1','2016-01-24 22:00:34','','0','2','','0','{\"template\":\"pingtai\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('69','1','','','2016-01-24 22:02:25','','统计总量','','1','1','2016-01-24 22:02:15','','0','2','','0','{\"template\":\"tongji\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('70','1','','','2016-01-25 09:46:53','','内容详情','','1','1','2016-01-25 09:46:38','','0','2','','0','{\"template\":\"neirongxiangqing\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('71','1','','','2016-01-25 11:57:50','','二级标签管理咨询','','1','1','2016-01-25 11:56:51','','0','2','','0','{\"template\":\"sub_zixun\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('72','1','','','2016-01-25 11:58:25','','二级标签技术创新','','1','1','2016-01-25 11:57:52','','0','2','','0','{\"template\":\"sub_chuangxin\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('73','1','','','2016-01-25 11:58:45','','二级担保服务','','1','1','2016-01-25 11:58:28','','0','2','','0','{\"template\":\"sub_danbao\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('74','1','','','2016-01-25 11:59:24','','二级法律服务','','1','1','2016-01-25 11:59:12','','0','2','','0','{\"template\":\"sub_law\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('75','1','','','2016-01-25 13:44:19','','李晋晋','','1','1','2016-01-25 13:44:06','','0','2','','0','{\"template\":\"ljinjin\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('76','1','','','2016-01-25 14:46:08','','list测试','','1','1','2016-01-25 14:45:53','','0','2','','0','{\"template\":\"list_masonry\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('77','1','','','2016-01-25 14:47:49','','page','','1','1','2016-01-25 14:47:34','','0','2','','0','{\"template\":\"page\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('78','1','','','2016-01-26 16:06:27','','textssssssssss','','1','1','2016-01-26 16:06:10','','0','2','','0','{\"template\":\"textssssssssssssssssssssssssssssss\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('79','1','','','2016-01-26 16:18:32','','aaaa','aaaa','1','1','2016-01-26 16:18:22','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('84','1','服务公告的关键字','服务公告','2016-01-27 13:15:32','<p>服务公告的内容</p>','服务公告的标题','服务公告的摘要','1','1','2016-01-27 13:14:44','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('80','1','法界热点的内容1','法界热点的内容1','2016-01-26 23:04:53','<p>法界热点的内容1</p>','法界热点的内容1','法界热点的内容1','1','1','2016-01-26 23:04:01','','0','','','0','{\"thumb\":\"\"}','1','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('81','1','法界热点的内容1法界热点的内容1法界热点的内容1法界热点的内容1','法界热点的内容1法界热点的内容1法界热点的内容1','2016-01-26 23:05:24','<p>法界热点的内容1法界热点的内容1法界热点的内容1法界热点的内容1法界热点的内容1</p>','法界付五法界热点的内容1法界热点的内容1法界热点的内容1','法界热点的内容1法界热点的内容1法界热点的内容1法界热点的内容1','1','1','2016-01-26 23:04:55','','0','','','0','{\"thumb\":\"\"}','5','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('82','1','','','2016-01-27 10:43:50','','gai','','1','1','2016-01-27 10:43:38','','0','2','','0','{\"template\":\"sub_law_ch\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('83','1','','','2016-01-27 11:33:09','','测试','','1','1','2016-01-27 11:32:58','','0','2','','0','{\"template\":\"a01\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('85','1','服务公告的第二项关键字','服务公告的第二项','2016-01-27 13:16:17','<p>服务公告的第二项内容</p>','服务公告的第二项标题','服务公告的第二项摘要','1','1','2016-01-27 13:15:33','','0','','','0','{\"thumb\":\"\"}','1','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('86','1','服务公告的第三项服务公告的第三项','服务公告的第三项','2016-01-27 13:24:14','<p>服务公告的第三项服务公告的第三项服务公告的第三项服务公告的第三项</p>','服务公告的第三项','服务公告的第三项服务公告的第三项','1','1','2016-01-27 13:23:44','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('87','1','服务公告的第四项服务公告的第四项','服务公告的第四项服务公告的第四项','2016-01-27 13:24:41','<p>服务公告的第四项服务公告的第四项服务公告的第四项服务公告的第四项服务公告的第四项服务公告的第四项</p>','服务公告的第四项服务公告的第四项','服务公告的第四项服务公告的第四项','1','1','2016-01-27 13:24:16','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('88','1','服务公共的第五项服务公共的第五项服务公共的第五项服务公共的第五项','服务公共的第五项服务公共的第五项服务公共的第五项','2016-01-27 13:25:12','<p>服务公共的第五项服务公共的第五项服务公共的第五项服务公共的第五项服务公共的第五项</p>','服务公共的第五项服务公共的第五项','服务公共的第五项服务公共的第五项服务公共的第五项','1','1','2016-01-27 13:24:45','','0','','','0','{\"thumb\":\"\"}','1','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('89','1','服务公共的第六项服务公共的第六项服务公共的第六项','服务公共的第六项服务公共的第六项服务公共的第六项','2016-01-27 13:25:42','<p>服务公共的第六项服务公共的第六项服务公共的第六项服务公共的第六项服务公共的第六项</p>','服务公共的第六项','服务公共的第六项服务公共的第六项服务公共的第六项','1','1','2016-01-27 13:25:14','','0','','','0','{\"thumb\":\"\"}','0','0','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('90','1','服务公共的第七项服务公共的第七项服务公共的第七项','服务公共的第七项服务公共的第七项服务公共的第七项','2016-01-27 13:26:15','<p>服务公共的第七项服务公共的第七项服务公共的第七项服务公共的第七项服务公共的第七项服务公共的第七项服务公共的第七项服务公共的第七项服务公共的第七项服务公共的第七项服务公共的第七项服务公共的第七项</p>','服务公共的第七项服务公共的第七项','服务公共的第七项服务公共的第七项服务公共的第七项','1','1','2016-01-27 13:25:46','','0','','','0','{\"thumb\":\"\"}','2','0','0','0');
DROP TABLE IF EXISTS `cmf_qyxxb`;
CREATE TABLE `cmf_qyxxb` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `qymc` varchar(255) DEFAULT NULL COMMENT '企业名称',
  `qylx` varchar(255) DEFAULT NULL COMMENT '企业类型id，来源于企业类型信息表中cmf_qylxxxb',
  `qydh` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_qyxxb ( `id`, `qymc`, `qylx`, `qydh` ) VALUES  ('1','山东云大','有限责任','0546-888888');
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_role ( `id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder` ) VALUES  ('1','超级管理员','0','1','拥有网站最高管理员权限！','1329633709','1329633709','0');
DROP TABLE IF EXISTS `cmf_role_user`;
CREATE TABLE `cmf_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_route`;
CREATE TABLE `cmf_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('6','1','第四章','/thinkcmf_1/data/upload/20160121/56a0ba657755b.jpg','','','','1','0');
INSERT INTO cmf_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('7','1','第五种','/thinkcmf_1/data/upload/20160121/56a0bbe823e27.jpg','','','','1','0');
INSERT INTO cmf_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('1','1','第一张幻灯片','/thinkcmf_1/data/upload/20160120/569f32b056797.png','#','第一张幻灯片','第一张幻灯片','1','0');
INSERT INTO cmf_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('4','1','第二张幻灯片','/thinkcmf_1/data/upload/20160120/569f32ca6ba84.jpg','#','第二张幻灯片','第二张幻灯片','1','1');
INSERT INTO cmf_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('5','1','第三张幻灯片','/thinkcmf_1/data/upload/20160120/569f32e68ee78.png','#','第三张幻灯片','第三张幻灯片','1','2');
DROP TABLE IF EXISTS `cmf_slide_cat`;
CREATE TABLE `cmf_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('1','主页面幻灯片','slide_top','主页面幻灯片','1');
INSERT INTO cmf_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('2','管理咨询幻灯片','glzx_lunbo','管理咨询幻灯片','1');
INSERT INTO cmf_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('3','法律服务幻灯片','flfw_lunbo','法律服务幻灯片','1');
INSERT INTO cmf_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('4','担保服务幻灯片','dbfw_lunbo','担保服务幻灯片','1');
INSERT INTO cmf_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('5','技术创新幻灯片','jscx_lunbo','技术创新幻灯片','1');
DROP TABLE IF EXISTS `cmf_term_relationships`;
CREATE TABLE `cmf_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('1','7','3','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('2','8','3','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('3','9','3','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('4','10','3','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('5','11','7','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('6','12','7','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('7','13','7','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('8','14','7','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('9','15','7','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('10','16','7','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('18','17','9','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('17','18','9','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('15','19','9','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('16','20','9','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('19','24','3','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('20','25','3','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('21','26','3','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('22','27','3','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('23','28','3','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('24','29','3','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('25','30','3','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('26','31','3','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('27','32','7','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('28','33','7','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('29','34','7','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('30','36','4','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('31','37','4','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('32','38','4','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('33','39','3','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('34','40','4','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('35','41','4','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('36','42','4','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('37','43','4','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('38','44','4','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('39','45','5','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('40','46','6','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('41','47','6','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('42','48','8','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('43','49','8','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('44','50','8','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('45','51','10','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('46','52','10','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('47','53','11','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('48','54','12','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('49','55','13','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('50','56','14','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('51','57','15','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('52','58','16','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('53','59','17','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('54','60','11','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('55','61','11','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('56','64','10','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('57','79','19','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('58','80','30','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('59','81','30','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('60','84','31','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('61','85','31','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('62','86','31','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('63','87','31','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('64','88','31','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('65','89','31','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('66','90','31','0','1');
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('7','最新加入的企业','','article','最新加入的企业','23','0','0-23-7','','','','userlist','neirongxiangqing','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('3','通知公告','','article','通知公告','23','0','0-23-3','','','','userlist','neirongxiangqing','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('4','政策文件','','article','政策文件','23','0','0-23-4','','','','userlist','neirongxiangqing','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('5','平台动态','','article','平台动态','23','0','0-23-5','','','','userlist','neirongxiangqing','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('6','统计总量','','article','统计总量','23','0','0-23-6','','','','userlist','neirongxiangqing','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('8','最新加入的机构','','article','最新加入的机构','23','0','0-23-8','','','','userlist','neirongxiangqing','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('9','全部服务','','article','全部服务','23','0','0-23-9','','','','userlist','neirongxiangqing','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('10','技术创新','','article','技术创新','40','0','0-23-40-10','','','','userlist','neirongxiangqing','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('11','人才培训','','article','人才培训','40','0','0-23-40-11','','','','userlist','neirongxiangqing','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('12','市场开拓','','article','市场开拓','40','0','0-23-40-12','','','','userlist','neirongxiangqing','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('13','管理咨询','','article','管理咨询','40','0','0-23-40-13','','','','userlist','neirongxiangqing','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('14','融资担保','','article','融资担保','40','0','0-23-40-14','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('15','法律服务','','article','法律服务','40','0','0-23-40-15','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('16','信息服务','','article','信息服务','40','0','0-23-40-16','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('17','创业服务','','article','创业服务','40','0','0-23-40-17','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('18','其他服务','','article','其他服务','40','0','0-23-40-18','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('19','专案代理','','article','专案代理','9','0','0-23-9-19','','','','userlist','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('20','法律服务','','article','法律服务','9','0','0-23-9-20','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('21','法律咨询','','article','法律咨询','9','0','0-23-9-21','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('22','专案代理','','article','专案代理','9','0','0-23-9-22','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('23','服务平台首页顶级分类','','article','服务平台首页顶级分类','0','0','0-23','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('24','管理咨询顶级分类','','article','管理咨询顶级分类','0','0','0-24','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('25','技术创新顶级分类','','article','技术创新顶级分类','0','0','0-25','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('26','担保服务顶级分类','','article','担保服务顶级分类','0','0','0-26','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('27','法律服务顶级分类','','article','法律服务顶级分类','0','0','0-27','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('28','法律服务右侧内容','','article','法律服务右侧内容','27','0','0-27-28','','','','userlist','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('29','法律服务内容分类','','article','法律服务内容分类','27','0','0-27-29','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('30','法界热点','','article','法界热点内容列表','28','0','0-27-28-30','','','','userlist','neirongxiangqing','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('31','服务公告','','article','服务公告列表内容','29','0','0-27-29-31','','','','userlist','neirongxiangqing','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('32','扶持政策','','article','扶持政策列表内容','29','0','0-27-29-32','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('33','制度范本','','article','制度范本列表内容','29','0','0-27-29-33','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('34','法律文书','','article','法律文书列表内容','29','0','0-27-29-34','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('35','风险防控','','article','风险防控列表内容','29','0','0-27-29-35','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('36','股权纠纷','','article','股权纠纷列表内容','29','0','0-27-29-36','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('37','法律讲座','','article','法律讲座列表内容','29','0','0-27-29-37','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('38','案例分析','','article','案例分析列表内容','29','0','0-27-29-38','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('39','法制动态','','article','法制动态列表内容','29','0','0-27-29-39','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('40','聊城服务商推荐','','article','','23','0','0-23-40','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('41','担保服务右侧分类','','article','担保服务右侧分类','26','0','0-26-41','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('42','担保服务内容列表','','article','担保服务内容列表','26','0','0-26-42','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('43','通知公告','','article','通知公告','41','0','0-26-41-43','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('44','行业信息','','article','行业信息','42','0','0-26-42-44','','','','list','article','0','1');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('45','协会简介','','article','协会简介','42','0','0-26-42-45','','','','list','article','0','1');
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('1','admin','###c47717d1f886381c71c973a83bcf77ff','admin','1773911038@qq.com','','','0','','','0.0.0.0','2016-01-27 10:43:33','2016-01-20 10:57:01','','1','0','1','0','');

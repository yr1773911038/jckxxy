/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50540
Source Host           : 127.0.0.1:3306
Source Database       : jckxdb

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-06-19 10:24:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for associator
-- ----------------------------
DROP TABLE IF EXISTS `associator`;
CREATE TABLE `associator` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `torwards` int(11) DEFAULT NULL,
  `startTime` date DEFAULT NULL,
  `endTime` date DEFAULT NULL,
  `pic` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of associator
-- ----------------------------
INSERT INTO `associator` VALUES ('1', '张三', '', '1', '2014-05-07', '2017-06-07', 'images/associate/20170524094311.jpg');
INSERT INTO `associator` VALUES ('2', '李四', '', '1', '2015-05-06', '2017-07-01', 'images/associate/20170524094311.jpg');
INSERT INTO `associator` VALUES ('3', '王五', '', '2', '2016-05-18', '2017-05-24', 'images/associate/20170524094311.jpg');
INSERT INTO `associator` VALUES ('4', 'xiao', '', '2', '2016-05-04', '2017-07-01', 'images/associate/20170524094311.jpg');
INSERT INTO `associator` VALUES ('5', 'zzzzz', '', '1', '2016-05-04', '2017-07-01', null);
INSERT INTO `associator` VALUES ('6', 'vvvv', '', '1', '2016-05-04', '2017-07-01', null);
INSERT INTO `associator` VALUES ('7', 'hhh', '', '2', '2017-05-25', '2018-05-03', null);
INSERT INTO `associator` VALUES ('8', 'kk', '', '1', '2017-05-24', '2017-06-14', null);
INSERT INTO `associator` VALUES ('9', 'llll', '', '2', '2017-05-24', '2018-05-16', null);
INSERT INTO `associator` VALUES ('10', 'ljjj', '', '1', '2017-05-24', '2017-06-02', null);
INSERT INTO `associator` VALUES ('11', 'ggg', '', '2', '2016-05-04', '2017-05-24', null);
INSERT INTO `associator` VALUES ('12', 'eeeee', '', '1', '2017-05-24', '2018-05-23', null);
INSERT INTO `associator` VALUES ('13', 'uuu', '', '1', '2017-05-24', '2018-05-23', null);
INSERT INTO `associator` VALUES ('14', 't', '', '1', '2017-05-24', '2018-05-23', null);
INSERT INTO `associator` VALUES ('15', 'rrr', '', '2', '2017-05-23', '2018-05-23', null);
INSERT INTO `associator` VALUES ('16', 'ddd', '', '2', '2017-05-24', '2018-05-23', null);
INSERT INTO `associator` VALUES ('17', 'ffff', '', '1', '2017-05-24', '2018-05-23', null);
INSERT INTO `associator` VALUES ('18', 'ss', '', '2', '2017-05-24', '2018-05-23', null);
INSERT INTO `associator` VALUES ('19', 'aaa', '', '2', '2017-05-24', '2018-05-23', null);
INSERT INTO `associator` VALUES ('20', 'ccc', '', '1', '2017-05-24', '2018-05-23', null);
INSERT INTO `associator` VALUES ('21', 'nnn', '', '1', '2017-05-24', '2018-05-23', null);
INSERT INTO `associator` VALUES ('22', 'pppp', '', '1', '2017-05-24', '2018-05-23', null);
INSERT INTO `associator` VALUES ('23', '张三丰', '', '1', '2017-05-31', '2018-05-23', '');
INSERT INTO `associator` VALUES ('24', 'kimi', '', '2', '2017-05-24', '2018-05-23', '');
INSERT INTO `associator` VALUES ('25', 'vici', '', '1', '2017-05-24', '2018-05-23', '');
INSERT INTO `associator` VALUES ('26', 'woshi', '', '1', '2017-05-24', '2018-05-23', '');
INSERT INTO `associator` VALUES ('27', '炸', '', '1', '2017-05-24', '2018-05-23', '');
INSERT INTO `associator` VALUES ('28', 'hhddd', '', '2', '2017-05-24', '2018-05-23', '');
INSERT INTO `associator` VALUES ('29', 'jjjjjjjjjjjj', '', '2', '2017-05-24', '2018-05-23', '');
INSERT INTO `associator` VALUES ('30', '离开', '', '2', '2017-05-24', '2018-05-23', '');
INSERT INTO `associator` VALUES ('31', '让人', '', '2', '2017-05-24', '2017-05-24', 'images/associate/20170524094311.jpg');
INSERT INTO `associator` VALUES ('32', '解决', '', '2', '2017-05-25', '2017-05-26', 'images/associate/20170525120037.jpg');
INSERT INTO `associator` VALUES ('33', 'niahishsh ', 'ffff', '1', '2017-05-26', '2017-05-26', 'images/associate/20170526024533.jpg');

-- ----------------------------
-- Table structure for ass_cod
-- ----------------------------
DROP TABLE IF EXISTS `ass_cod`;
CREATE TABLE `ass_cod` (
  `assId` bigint(20) NOT NULL,
  `codId` bigint(20) NOT NULL,
  PRIMARY KEY (`codId`,`assId`),
  KEY `FKD5FB02BAFC649A57` (`assId`),
  KEY `FKD5FB02BA211B0757` (`codId`),
  CONSTRAINT `FKD5FB02BA211B0757` FOREIGN KEY (`codId`) REFERENCES `codeworks` (`id`),
  CONSTRAINT `FKD5FB02BAFC649A57` FOREIGN KEY (`assId`) REFERENCES `associator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ass_cod
-- ----------------------------
INSERT INTO `ass_cod` VALUES ('1', '7');
INSERT INTO `ass_cod` VALUES ('1', '8');
INSERT INTO `ass_cod` VALUES ('2', '7');
INSERT INTO `ass_cod` VALUES ('2', '8');
INSERT INTO `ass_cod` VALUES ('3', '8');
INSERT INTO `ass_cod` VALUES ('4', '8');

-- ----------------------------
-- Table structure for codeworks
-- ----------------------------
DROP TABLE IF EXISTS `codeworks`;
CREATE TABLE `codeworks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `achieveTime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of codeworks
-- ----------------------------
INSERT INTO `codeworks` VALUES ('1', '作品1', '作品1', 'www.baidu.com', '2017-05-24');
INSERT INTO `codeworks` VALUES ('2', '作品2', '作品2', null, '2017-05-24');
INSERT INTO `codeworks` VALUES ('3', '作品3', '作品3', null, null);
INSERT INTO `codeworks` VALUES ('4', '作品4', '作品4', null, null);
INSERT INTO `codeworks` VALUES ('5', '作品5', null, null, null);
INSERT INTO `codeworks` VALUES ('6', '作品6', null, null, null);
INSERT INTO `codeworks` VALUES ('7', '刚刚u', '', '', '2017-05-24');
INSERT INTO `codeworks` VALUES ('8', '好好', '好', '', '2017-05-25');

-- ----------------------------
-- Table structure for nav
-- ----------------------------
DROP TABLE IF EXISTS `nav`;
CREATE TABLE `nav` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `cid` bigint(20) DEFAULT '1' COMMENT '默认都是主页导航',
  `createTime` date DEFAULT NULL,
  `updateTime` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1310327BE3119` (`pid`),
  KEY `FK1310328C23626` (`cid`),
  CONSTRAINT `FK1310327BE3119` FOREIGN KEY (`pid`) REFERENCES `nav` (`id`),
  CONSTRAINT `FK1310328C23626` FOREIGN KEY (`cid`) REFERENCES `navcat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav
-- ----------------------------
INSERT INTO `nav` VALUES ('1', '学院概况', null, null, '1', '2017-05-19', '2017-05-19');
INSERT INTO `nav` VALUES ('2', '机构设置', null, null, '1', '2017-05-19', '2017-05-19');
INSERT INTO `nav` VALUES ('3', '学院新闻', null, null, '1', '2017-05-19', '2017-05-19');
INSERT INTO `nav` VALUES ('4', '教学科研', null, null, '1', '2017-05-19', '2017-05-19');
INSERT INTO `nav` VALUES ('5', '学院简介', '1', '/qiantai/home_view.action?erName=\'学院简介\'', null, '2017-05-19', '2017-05-19');
INSERT INTO `nav` VALUES ('6', '学院领导', '1', '/qiantai/home_view.action?erName=\'学院领导\'', null, '2017-05-19', '2017-05-19');
INSERT INTO `nav` VALUES ('7', '综合办公室', '2', '/qiantai/home_view.action?erName=\'综合办公室\'', null, '2017-05-19', '2017-05-19');
INSERT INTO `nav` VALUES ('8', '学生工作处', '2', '/qiantai/home_view.action?erName=\'学生工作处\'', null, '2017-05-19', '2017-05-19');
INSERT INTO `nav` VALUES ('9', '通知公告', '3', '/qiantai/home_newsList.action?erName=\'通知公告\'', null, '2017-05-19', '2017-05-19');
INSERT INTO `nav` VALUES ('10', '新闻中心', '3', '/qiantai/home_newsList.action?erName=\'新闻中心\'', null, '2017-05-19', '2017-05-19');
INSERT INTO `nav` VALUES ('11', '学院风采', '3', '/qiantai/home_newsList.action?erName=\'学院风采\'', null, null, null);
INSERT INTO `nav` VALUES ('12', '联系方式', '1', '/qiantai/home_view.action?erName=\'联系方式\'', null, null, null);

-- ----------------------------
-- Table structure for navcat
-- ----------------------------
DROP TABLE IF EXISTS `navcat`;
CREATE TABLE `navcat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `postTime` date DEFAULT NULL,
  `updateTime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of navcat
-- ----------------------------
INSERT INTO `navcat` VALUES ('1', '首页上的导航', '1', '2017-05-19', '2017-05-19');
INSERT INTO `navcat` VALUES ('2', '二级连接下导航', '2', '2017-05-19', '2017-05-19');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `picture` varchar(255) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `nid` bigint(20) DEFAULT NULL,
  `updateTime` date DEFAULT NULL,
  `postTime` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK24FEF3DC635808` (`userId`),
  KEY `FK24FEF327BE2997` (`nid`),
  CONSTRAINT `FK24FEF327BE2997` FOREIGN KEY (`nid`) REFERENCES `nav` (`id`),
  CONSTRAINT `FK24FEF3DC635808` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '标题1', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/3753dde7-a854-48d2-9087-18c8121b03f6.jpg\" style=\"height:387px; width:567px\" />&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/be3d60cc-95ff-418a-9c40-2267ea76d635.jpg\" style=\"height:375px; width:567px\" /></p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/97c746bd-0496-493b-843d-dab213c1db61.jpg\" style=\"height:443px; width:567px\" /></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 近日，第三届全国民办高校辅导员工作高峰论坛在云南昆明落下帷幕，会议对&ldquo;2017全国民办高校优秀辅导员&rdquo;进行了评选和表彰，我院学生工作办公室主任王晶荣获此项称号。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &ldquo;全国民办高校优秀辅导员&rdquo;由全国民办高校学生工作者联席会组织评选，此次共评选出优秀辅导员114人。王晶老师此次获奖，充分展示了我院辅导员精神风貌和综合素质，凸显了我院辅导员队伍建设的新成效。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;学院近年来着重加强了辅导员队伍建设，在实践中多渠道为辅导员搭建发展平台，厚植辅导员队伍的育人能力和职业认同，促进了辅导员职业能力的提升。<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; （作者：范秀娟）&nbsp;&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/3753dde7-a854-48d2-9087-18c8121b03f6.jpg\" style=\"height:387px; width:567px\" />&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/be3d60cc-95ff-418a-9c40-2267ea76d635.jpg\" style=\"height:375px; width:567px\" /></p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/97c746bd-0496-493b-843d-dab213c1db61.jpg\" style=\"height:443px; width:567px\" /></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 近日，第三届全国民办高校辅导员工作高峰论坛在云南昆明落下帷幕，会议对&ldquo;2017全国民办高校优秀辅导员&rdquo;进行了评选和表彰，我院学生工作办公室主任王晶荣获此项称号。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &ldquo;全国民办高校优秀辅导员&rdquo;由全国民办高校学生工作者联席会组织评选，此次共评选出优秀辅导员114人。王晶老师此次获奖，充分展示了我院辅导员精神风貌和综合素质，凸显了我院辅导员队伍建设的新成效。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;学院近年来着重加强了辅导员队伍建设，在实践中多渠道为辅导员搭建发展平台，厚植辅导员队伍的育人能力和职业认同，促进了辅导员职业能力的提升。<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; （作者：范秀娟）&nbsp;&nbsp;</p>\r\n', 'admin/images/news/001.jpg', '1', '9', '2017-05-21', '2017-05-21');
INSERT INTO `news` VALUES ('2', '喝酒2', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/3753dde7-a854-48d2-9087-18c8121b03f6.jpg\" style=\"height:387px; width:567px\" />&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/be3d60cc-95ff-418a-9c40-2267ea76d635.jpg\" style=\"height:375px; width:567px\" /></p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/97c746bd-0496-493b-843d-dab213c1db61.jpg\" style=\"height:443px; width:567px\" /></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 近日，第三届全国民办高校辅导员工作高峰论坛在云南昆明落下帷幕，会议对&ldquo;2017全国民办高校优秀辅导员&rdquo;进行了评选和表彰，我院学生工作办公室主任王晶荣获此项称号。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &ldquo;全国民办高校优秀辅导员&rdquo;由全国民办高校学生工作者联席会组织评选，此次共评选出优秀辅导员114人。王晶老师此次获奖，充分展示了我院辅导员精神风貌和综合素质，凸显了我院辅导员队伍建设的新成效。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;学院近年来着重加强了辅导员队伍建设，在实践中多渠道为辅导员搭建发展平台，厚植辅导员队伍的育人能力和职业认同，促进了辅导员职业能力的提升。<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; （作者：范秀娟）&nbsp;&nbsp;</p>\r\n', 'admin/images/news/003.JPG', '2', '10', '2017-05-21', '2017-05-21');
INSERT INTO `news` VALUES ('3', '标题3', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/3753dde7-a854-48d2-9087-18c8121b03f6.jpg\" style=\"height:387px; width:567px\" />&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/be3d60cc-95ff-418a-9c40-2267ea76d635.jpg\" style=\"height:375px; width:567px\" /></p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/97c746bd-0496-493b-843d-dab213c1db61.jpg\" style=\"height:443px; width:567px\" /></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 近日，第三届全国民办高校辅导员工作高峰论坛在云南昆明落下帷幕，会议对&ldquo;2017全国民办高校优秀辅导员&rdquo;进行了评选和表彰，我院学生工作办公室主任王晶荣获此项称号。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &ldquo;全国民办高校优秀辅导员&rdquo;由全国民办高校学生工作者联席会组织评选，此次共评选出优秀辅导员114人。王晶老师此次获奖，充分展示了我院辅导员精神风貌和综合素质，凸显了我院辅导员队伍建设的新成效。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;学院近年来着重加强了辅导员队伍建设，在实践中多渠道为辅导员搭建发展平台，厚植辅导员队伍的育人能力和职业认同，促进了辅导员职业能力的提升。<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; （作者：范秀娟）&nbsp;&nbsp;</p>\r\n', 'admin/images/news/002.JPG', '2', '9', '2017-05-21', '2017-05-21');
INSERT INTO `news` VALUES ('4', '标题4', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/3753dde7-a854-48d2-9087-18c8121b03f6.jpg\" style=\"height:387px; width:567px\" />&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/be3d60cc-95ff-418a-9c40-2267ea76d635.jpg\" style=\"height:375px; width:567px\" /></p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/97c746bd-0496-493b-843d-dab213c1db61.jpg\" style=\"height:443px; width:567px\" /></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 近日，第三届全国民办高校辅导员工作高峰论坛在云南昆明落下帷幕，会议对&ldquo;2017全国民办高校优秀辅导员&rdquo;进行了评选和表彰，我院学生工作办公室主任王晶荣获此项称号。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &ldquo;全国民办高校优秀辅导员&rdquo;由全国民办高校学生工作者联席会组织评选，此次共评选出优秀辅导员114人。王晶老师此次获奖，充分展示了我院辅导员精神风貌和综合素质，凸显了我院辅导员队伍建设的新成效。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;学院近年来着重加强了辅导员队伍建设，在实践中多渠道为辅导员搭建发展平台，厚植辅导员队伍的育人能力和职业认同，促进了辅导员职业能力的提升。<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; （作者：范秀娟）&nbsp;&nbsp;</p>\r\n', 'admin/images/news/001.JPG', '1', '10', '2017-05-21', '2017-05-21');
INSERT INTO `news` VALUES ('6', 'dsdssdds', 'aaaaa', '', '2', '9', null, '2017-05-21');
INSERT INTO `news` VALUES ('7', '我在进行测试', 'aaaaa', '', '2', '9', null, '2017-05-21');
INSERT INTO `news` VALUES ('8', '的范德萨范德萨', 'aaaaa', '', '2', '9', '2017-05-21', '2017-05-21');
INSERT INTO `news` VALUES ('9', '地方vfvf', 'aaaaa', '', '2', '9', '2017-05-21', '2017-05-21');
INSERT INTO `news` VALUES ('10', 'fvfdvdf', 'aaaaa', '', '2', '9', '2017-05-21', '2017-05-21');
INSERT INTO `news` VALUES ('11', 'this  is  test', 'aaaaavfdvfdvfdvdfvfd', '', '2', '10', '2017-05-21', '2017-05-21');
INSERT INTO `news` VALUES ('12', 'dd', '<p><img alt=\"\" src=\"http://localhost:8080/jckxxy/userfiles/images/2FB41D50AF8E4354722E75E954E3712E.jpg\" /></p>\r\n', '', '2', '10', '2017-05-23', '2017-05-23');
INSERT INTO `news` VALUES ('19', 'sdds', '<ul>\r\n	<li>\r\n	<pre>\r\n             ​<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/23/6531040c-7dda-4ca8-9083-25239394d531.jpg\" style=\"height:378px; width:567px\" />              \r\n             ​<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/23/2efe5210-07c9-4a6e-9352-77c6ed9bea6d.jpg\" style=\"height:378px; width:567px\" /> \r\n&nbsp;            <img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/23/5d0a8115-6e5d-4943-8fe1-5d3594041ae3.jpg\" style=\"height:378px; width:567px\" /></pre>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 为展示我院学生的青春风采，增进思想交流，培养和提高同学们的思辨能力，发扬同学们的团队合作精神，基础科学学院于5月3日至15日举办了大学生辩论赛，本届辩论赛决赛于5月15日晚在小音乐厅落下帷幕。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 此次辩论赛分为初赛、决赛两个部分，共有四支队伍参赛。经过初赛的激烈角逐，英语专业的&ldquo;你奈我何&rdquo;队和计算机科学与技术专业的&ldquo;红凤凰粉凤凰粉红凤凰&rdquo;队凭借出色的表现成功会师决赛，就&ldquo;戏说历史是对历史的尊重还是亵渎&rdquo;这一辩题展开辩论，双方辩手你来我往、侃侃而谈，自由辩论环节将比赛气氛再次推向高潮，现场气氛迅速升温，精彩不停，掌声不断。最后，正方&ldquo;红凤凰粉凤凰粉红凤凰队&rdquo;夺得本次辩论赛的冠军，反方一辩选手肖佳乐荣获&ldquo;最佳辩手&rdquo;的称号。</p>\r\n\r\n<p>此次辩论赛不仅锻炼了同学们的辩论能力和合作能力，还提高了同学们的思维反应速度、沟通技巧，增强了学生语言组织能力和应变能力，展示了同学们的非凡风采，丰富了校园文化生活。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; （作者：蒋芝颖&nbsp;摄影：王昊）&nbsp;</p>\r\n', '', '2', '10', '2017-05-20', '2017-05-20');
INSERT INTO `news` VALUES ('20', '王晶获“2017全国民办高校优秀辅导员”称号', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/3753dde7-a854-48d2-9087-18c8121b03f6.jpg\" style=\"height:387px; width:567px\" />&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/be3d60cc-95ff-418a-9c40-2267ea76d635.jpg\" style=\"height:375px; width:567px\" /></p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/97c746bd-0496-493b-843d-dab213c1db61.jpg\" style=\"height:443px; width:567px\" /></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 近日，第三届全国民办高校辅导员工作高峰论坛在云南昆明落下帷幕，会议对&ldquo;2017全国民办高校优秀辅导员&rdquo;进行了评选和表彰，我院学生工作办公室主任王晶荣获此项称号。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &ldquo;全国民办高校优秀辅导员&rdquo;由全国民办高校学生工作者联席会组织评选，此次共评选出优秀辅导员114人。王晶老师此次获奖，充分展示了我院辅导员精神风貌和综合素质，凸显了我院辅导员队伍建设的新成效。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;学院近年来着重加强了辅导员队伍建设，在实践中多渠道为辅导员搭建发展平台，厚植辅导员队伍的育人能力和职业认同，促进了辅导员职业能力的提升。<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; （作者：范秀娟）&nbsp;&nbsp;</p>\r\n', 'admin/images/news/20170526102656.jpg', '2', '11', '2017-05-25', '2017-05-25');
INSERT INTO `news` VALUES ('21', '我院在全国大学生“互联网+”创新大赛中首创佳绩', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/3753dde7-a854-48d2-9087-18c8121b03f6.jpg\" style=\"height:387px; width:567px\" />&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/be3d60cc-95ff-418a-9c40-2267ea76d635.jpg\" style=\"height:375px; width:567px\" /></p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/97c746bd-0496-493b-843d-dab213c1db61.jpg\" style=\"height:443px; width:567px\" /></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 近日，第三届全国民办高校辅导员工作高峰论坛在云南昆明落下帷幕，会议对&ldquo;2017全国民办高校优秀辅导员&rdquo;进行了评选和表彰，我院学生工作办公室主任王晶荣获此项称号。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &ldquo;全国民办高校优秀辅导员&rdquo;由全国民办高校学生工作者联席会组织评选，此次共评选出优秀辅导员114人。王晶老师此次获奖，充分展示了我院辅导员精神风貌和综合素质，凸显了我院辅导员队伍建设的新成效。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;学院近年来着重加强了辅导员队伍建设，在实践中多渠道为辅导员搭建发展平台，厚植辅导员队伍的育人能力和职业认同，促进了辅导员职业能力的提升。<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; （作者：范秀娟）&nbsp;&nbsp;</p>\r\n', 'admin/images/news/20170526102539.jpg', '2', '11', '2017-05-25', '2017-05-25');
INSERT INTO `news` VALUES ('22', '我院师生在胜利学院第十三届田径运动会上创佳绩', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/3753dde7-a854-48d2-9087-18c8121b03f6.jpg\" style=\"height:387px; width:567px\" />&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/be3d60cc-95ff-418a-9c40-2267ea76d635.jpg\" style=\"height:375px; width:567px\" /></p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/97c746bd-0496-493b-843d-dab213c1db61.jpg\" style=\"height:443px; width:567px\" /></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 近日，第三届全国民办高校辅导员工作高峰论坛在云南昆明落下帷幕，会议对&ldquo;2017全国民办高校优秀辅导员&rdquo;进行了评选和表彰，我院学生工作办公室主任王晶荣获此项称号。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &ldquo;全国民办高校优秀辅导员&rdquo;由全国民办高校学生工作者联席会组织评选，此次共评选出优秀辅导员114人。王晶老师此次获奖，充分展示了我院辅导员精神风貌和综合素质，凸显了我院辅导员队伍建设的新成效。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;学院近年来着重加强了辅导员队伍建设，在实践中多渠道为辅导员搭建发展平台，厚植辅导员队伍的育人能力和职业认同，促进了辅导员职业能力的提升。<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; （作者：范秀娟）&nbsp;&nbsp;</p>\r\n', 'admin/images/news/20170526102557.jpg', '2', '11', '2017-05-25', '2017-05-25');
INSERT INTO `news` VALUES ('23', '我院夺得教职工乒乓球团体赛混合团体冠军', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/3753dde7-a854-48d2-9087-18c8121b03f6.jpg\" style=\"height:387px; width:567px\" />&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/be3d60cc-95ff-418a-9c40-2267ea76d635.jpg\" style=\"height:375px; width:567px\" /></p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/97c746bd-0496-493b-843d-dab213c1db61.jpg\" style=\"height:443px; width:567px\" /></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 近日，第三届全国民办高校辅导员工作高峰论坛在云南昆明落下帷幕，会议对&ldquo;2017全国民办高校优秀辅导员&rdquo;进行了评选和表彰，我院学生工作办公室主任王晶荣获此项称号。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &ldquo;全国民办高校优秀辅导员&rdquo;由全国民办高校学生工作者联席会组织评选，此次共评选出优秀辅导员114人。王晶老师此次获奖，充分展示了我院辅导员精神风貌和综合素质，凸显了我院辅导员队伍建设的新成效。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;学院近年来着重加强了辅导员队伍建设，在实践中多渠道为辅导员搭建发展平台，厚植辅导员队伍的育人能力和职业认同，促进了辅导员职业能力的提升。<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; （作者：范秀娟）&nbsp;&nbsp;</p>\r\n', 'admin/images/news/20170526102510.jpg', '2', '11', '2017-05-25', '2017-05-25');
INSERT INTO `news` VALUES ('25', '基础科学学院简介', '<p>中国石油大学胜利学院基础科学学院成立于2014年8月，是为了更好的适应学院发展的需要，由原中国石油大学胜利学院信息与计算科学系、外语系、体育系三个系以及大学物理教研室、马列教研室等基础学科组建而成。学院下设综合办公室、学生工作办公室、数学物理系、信息技术系、外语系、思想政治理论教学部和体育教学部等7个部门。</p>\r\n\r\n<p>基础科学学院承担着信息与计算科学专业、计算机科学与技术专业、软件工程专业、英语专业的专业课教学和全校的思想政治理论、大学物理、高等数学、公共体育、基础外语等公共基础课教学。学院招生包含信息与计算科学、计算机科学与技术、软件工程、计算机科学与技术专升本、英语等5个本科专业，目前共有在校学生1172人。</p>\r\n\r\n<p>基础科学学院现有教职工111人，其中教授2人，副教授43人，具有博士学位教师3人，具有硕士学位教师80人。已形成一支职称、学历、专业、学缘结构合理，富有朝气的师资队伍。</p>\r\n\r\n<p>基础科学学院全体教职工决心在油地校三方合作办学会议精神的指引下，在校党委的领导下，继续遵循&ldquo;循大河精进不息、依沧海虚怀博纳&rdquo;的校训，努力发扬&ldquo;顽强拼搏、勇于创新&rdquo;的精神，使全院各项工作再上新台阶。</p>\r\n', '', '2', '5', '2017-05-26', '2017-05-26');
INSERT INTO `news` VALUES ('26', '学院联系方式', '<p>综合办公室　　　　　　　　　　　　　　　　　　　　7396286</p>\r\n\r\n<p>学生工作办公室　　　　　　　　　　　　　　　　　　7396226</p>\r\n\r\n<p>教学秘书办公室（一）　　　　　　　　　　　　　　　7396085</p>\r\n\r\n<p>教学秘书办公室（二）　　　　　　　　　　　　　　　7396225</p>\r\n\r\n<p>辅导员办公室　　　　　　　　　　　　　　　　　　　7396596</p>\r\n\r\n<p>数学物理系办公室　　　　　　　　　　　　　　　　　7396228</p>\r\n\r\n<p>信息技术系办公室　　　　　　　　　　　　　　　　　7396079</p>\r\n\r\n<p>外语系办公室（一）　　　　　　　　　　　　　　　　7396221</p>\r\n\r\n<p>外语系办公室（二）　　　　　　　　　　　　　　　　7396087</p>\r\n\r\n<p>思想政治理论教学部办公室　　　　　　　　　　　　　7396279</p>\r\n\r\n<p>体育教学部办公室　　　　　　　　　　　　　　　　　7396259</p>\r\n\r\n<p>体育教研室（一）　　　　　　　　　　　　　　　　　7396256</p>\r\n\r\n<p>体育教研室（二）　　　　　　　　　　　　　　　　　7396257</p>\r\n', 'admin/images/news/20170601033550.jpg', '2', '12', '2017-05-26', '2017-05-26');
INSERT INTO `news` VALUES ('27', '综合办公室', '<p>&nbsp; 学院综合办公室是基础科学学院的综合办事机构，是在院长的直接领导下，负责学院日常行政管理和教学管理的部门，下设综合办公室主任、专兼职教学秘书等岗位，其主要职责是：<br />\r\n<br />\r\n一、 贯彻执行学校方针政策，及时传达上级领导的指示；<br />\r\n<br />\r\n二、 协助院长组织召集学院办公会、教务会、全院教工会，做好记录和决议决定的整理，发布相关通知通报；<br />\r\n<br />\r\n三、 负责草拟学院建设发展规划、工作计划、工作总结、请示报告等，协助院长 审核各系以学院名义拟定的各类通知；<br />\r\n<br />\r\n四、 组织建立健全各系部规章制度的制定、修订、完善，并负责检查督促执行；<br />\r\n<br />\r\n五、 负责上级文件的传达和发放工作以及相关资料和信息的收集、整理、归档、保管等工作；<br />\r\n<br />\r\n六、 负责学院的资产验收、财务统计及财务档案的管理工作；<br />\r\n<br />\r\n七、 负责学院各级各类考试的组织与考务工作；<br />\r\n<br />\r\n八、 负责学院印章的管理使用；<br />\r\n<br />\r\n九、 负责学院各类教学报表的统计汇总上报工作。<br />\r\n<br />\r\n十、 完成学院领导交办的其它工作。</p>\r\n\r\n<p>版权所有：中国石油大学胜利学院基础科学学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;设计制作：中国石油大学胜利学院</p>\r\n', 'admin/images/news/20170601033536.jpg', '2', '7', '2017-05-29', '2017-05-29');
INSERT INTO `news` VALUES ('28', '学生工作办公室简介', '<h2>&nbsp;</h2>\r\n\r\n<p>学生工作办公室负责学院学生工作的统筹与协调，下设主任、团总支书记、专职辅导员等岗位。基础科学学院学生由数学物理系、信息技术系、和外语系学生构成，目前共有四名辅导员负责全院学生的日常管理工作。</p>\r\n\r\n<p>学生工作办公室主要职责如下：</p>\r\n\r\n<p>1、传达、贯彻、执行学校的学生工作计划、安排，制定本学院学生工作的年度计划和有关专项工作计划，并具体组织实施。</p>\r\n\r\n<p>2、加强学生的思想政治教育工作，组织、指导学生开展政治理论学习，开展以爱国主义为主要内容的教育活动，培养学生良好的道德品质和思想素质。</p>\r\n\r\n<p>3、负责学生的规章制度建设，开展校纪校规教育、诚信考试教育、违纪学生纪律处分和学生的嘉奖。</p>\r\n\r\n<p>4、负责组织学生的各项评优评先工作。</p>\r\n\r\n<p>5、负责做好学生的奖助学金、助学贷款、学费减免、学生保险和勤工俭学等工作。　</p>\r\n\r\n<p>6、负责毕业生就业指导工作，制定毕业生就业工作计划，组织学生参加供需见面会，做好就业信息收集、发布，毕业生就业推荐、优秀毕业生评选，安排毕业生离校工作。</p>\r\n\r\n<p>7、组织学生开展优良学风建设，组织对学生的学风进行教育和督查。</p>\r\n\r\n<p>8、加强对学院学生会和其他学生社团组织的日常指导，指导学生积极开展第二课堂活动、科技创新和社会实践活动，丰富和繁荣校园文化，引导学生德、智、体全面发展。做好学院学生工作的对外宣传报道工作。</p>\r\n\r\n<p>9、加强学生的宿舍文化建设，负责学生公寓生活纪律、内务卫生的管理。</p>\r\n\r\n<p>10、切实做好学院共青团工作，开展青年志愿者实践活动，选拔推荐优秀共青团员入党，协助学院党委做好学生党建工作和学生入党积极分子的培养教育工作。</p>\r\n\r\n<p>11、做好学生的安全稳定工作，全面的掌握学生动态，加强学生心理健康教育、安全教育管理和突发事件的处理等工作。</p>\r\n\r\n<p>12、认真做好学校和学院其他有关部门交办的各项学生工作。</p>\r\n', 'admin/images/news/20170601033526.jpg', '2', '8', '2017-05-29', '2017-05-29');
INSERT INTO `news` VALUES ('29', '基础科学学院办公室电话', '<p>综合办公室　　　　　　　　　　　　　　　　　　　　7396286</p>\r\n\r\n<p>学生工作办公室　　　　　　　　　　　　　　　　　　7396226</p>\r\n\r\n<p>教学秘书办公室（一）　　　　　　　　　　　　　　　7396085</p>\r\n\r\n<p>教学秘书办公室（二）　　　　　　　　　　　　　　　7396225</p>\r\n\r\n<p>辅导员办公室　　　　　　　　　　　　　　　　　　　7396596</p>\r\n\r\n<p>数学物理系办公室　　　　　　　　　　　　　　　　　7396228</p>\r\n\r\n<p>信息技术系办公室　　　　　　　　　　　　　　　　　7396079</p>\r\n\r\n<p>外语系办公室（一）　　　　　　　　　　　　　　　　7396221</p>\r\n\r\n<p>外语系办公室（二）　　　　　　　　　　　　　　　　7396087</p>\r\n\r\n<p>思想政治理论教学部办公室　　　　　　　　　　　　　7396279</p>\r\n\r\n<p>体育教学部办公室　　　　　　　　　　　　　　　　　7396259</p>\r\n\r\n<p>体育教研室（一）　　　　　　　　　　　　　　　　　7396256&nbsp;</p>\r\n\r\n<p>体育教研室（二）　　　　　　　　　　　　　　　　　7396257</p>\r\n', 'admin/images/news/20170601033513.jpg', '2', '12', '2017-05-29', '2017-05-29');
INSERT INTO `news` VALUES ('30', '新闻中心1', '<p><img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/9bb25b8a-dfef-47a7-90c4-3adf79796e2c.jpg\" style=\"height:378px; width:567px\" /><img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/216d4823-b746-4f39-8f39-900cbbcf4a61.jpg\" style=\"height:370px; width:567px\" /><img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/bd761040-0483-496f-a5cd-5a136312be1f.jpg\" style=\"height:756px; width:567px\" /><img alt=\"\" src=\"http://221.2.229.26:8181/jckxxy/userfiles/image/2017/05/10/d9ce23e9-dde8-45af-a75c-ce09770f5dd3.jpg\" style=\"height:484px; width:567px\" /></p>\r\n\r\n<p>5月4日，基础科学学院学生会在小音乐厅举行了&ldquo;雅言传承文明，经典浸润人生&rdquo;为主题的书法、朗诵比赛，党总支书记祝永胜、学生工作办公室主任王晶、学生党支部书记陆玲霜出席了本次活动。</p>\r\n\r\n<p>经过初赛，共有十二组选手入围此次决赛，朗诵比赛与硬笔书法比赛同台进行。诗以言志，歌以壮行，比赛中选手们深情演绎，时而慷慨激昂、鼓舞斗志，时而深情款款、感人肺腑。有朱自清的《背影》，二号选手吴翔燕同学用温柔的声音，把父亲对儿女的爱，表达得深刻细腻，真挚感动；有李白的《临江仙&middot;将进酒》，十号选手王文钊、薛森同学一袭唐装，用激情澎湃的声音演绎了经典，将诗人的自信与失望、悲愤与抗争的情怀展现得淋漓尽致，让大家在抑扬顿挫中感受到了中国语言的魅力，并一举夺魁。同台进行书法比赛的同学们更是给现场添加了一份淡淡的笔墨香。最后祝永胜书记朗读了一篇贾平凹先生的文章《我的老师》，现场掌声热烈，将比赛推向高潮。</p>\r\n\r\n<p>此次活动的成功举办，为基础科学学院传统文化月系列活动画上了圆满的句号，也激发了我院学生学习传统文化的热情，增强了他们对经典文学和书法艺术的兴趣。</p>\r\n\r\n<p>&nbsp;（作者：魏佳&nbsp;王钰&nbsp;&nbsp;摄影：李成彬）&nbsp;</p>\r\n', 'admin/images/news/20170601033610.jpg', '2', '10', '2017-05-29', '2017-05-29');

-- ----------------------------
-- Table structure for privilege
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `createTime` date DEFAULT NULL,
  `updateTime` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK196D16914CEF2485` (`pid`),
  CONSTRAINT `FK196D16914CEF2485` FOREIGN KEY (`pid`) REFERENCES `privilege` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES ('1', '权限菜单', null, null, '2017-05-14', '2017-05-14');
INSERT INTO `privilege` VALUES ('2', '权限管理', null, '1', '2017-05-14', '2017-05-14');
INSERT INTO `privilege` VALUES ('3', '内容管理', null, '1', '2017-05-14', '2017-05-14');
INSERT INTO `privilege` VALUES ('4', '导航管理', null, '1', '2017-05-14', '2017-05-14');
INSERT INTO `privilege` VALUES ('5', '文件管理', null, '1', '2017-05-14', '2017-05-14');
INSERT INTO `privilege` VALUES ('6', '用户管理', '/user_user.action', '2', '2017-05-14', '2017-05-14');
INSERT INTO `privilege` VALUES ('7', '角色管理', '/role_role.action', '2', '2017-05-14', '2017-05-14');
INSERT INTO `privilege` VALUES ('8', '新闻管理', '/news_news.action', '3', '2017-05-14', '2017-05-14');
INSERT INTO `privilege` VALUES ('10', '一级导航管理', '/nav_nav.action', '4', '2017-05-14', '2017-05-14');
INSERT INTO `privilege` VALUES ('11', '二级导航管理', '/nav_nav.action', '4', '2017-05-14', '2017-05-14');
INSERT INTO `privilege` VALUES ('13', '菜单管理', '/auth_auth.action', '2', '2017-05-14', '2017-05-14');
INSERT INTO `privilege` VALUES ('20', '密码管理', '/miMa_miMa.action', '5', '2017-05-14', '2017-05-14');
INSERT INTO `privilege` VALUES ('22', '软件协会管理', ' ', '1', null, null);
INSERT INTO `privilege` VALUES ('23', '成员管理', '/ass_show.action', '22', null, null);
INSERT INTO `privilege` VALUES ('24', '作品管理', '/code_show.action', '22', null, null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `updateTime` date DEFAULT NULL,
  `createTime` date DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', 'yanran，xuhao', '2017-05-13', '2017-05-13', null);
INSERT INTO `role` VALUES ('2', '管理员', '负责管理部分功能', null, null, null);
INSERT INTO `role` VALUES ('3', '方法3', '方法3', null, null, null);
INSERT INTO `role` VALUES ('10', 'bb', 'bb', null, null, null);
INSERT INTO `role` VALUES ('11', 'nn', 'nnn', null, null, null);
INSERT INTO `role` VALUES ('12', 'vv', 'vvv', null, null, null);
INSERT INTO `role` VALUES ('13', 'tt', 'tt', null, null, null);
INSERT INTO `role` VALUES ('14', 'woshi', 'woshi', null, null, null);
INSERT INTO `role` VALUES ('16', 'yanran', 'yanran', null, null, null);

-- ----------------------------
-- Table structure for role_priv
-- ----------------------------
DROP TABLE IF EXISTS `role_priv`;
CREATE TABLE `role_priv` (
  `roleId` bigint(20) NOT NULL,
  `privId` bigint(20) NOT NULL,
  PRIMARY KEY (`roleId`,`privId`),
  KEY `FK1405B4D812843304` (`privId`),
  KEY `FK1405B4D8D70E029E` (`roleId`),
  CONSTRAINT `FK1405B4D812843304` FOREIGN KEY (`privId`) REFERENCES `privilege` (`id`),
  CONSTRAINT `FK1405B4D8D70E029E` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_priv
-- ----------------------------
INSERT INTO `role_priv` VALUES ('1', '1');
INSERT INTO `role_priv` VALUES ('3', '1');
INSERT INTO `role_priv` VALUES ('12', '1');
INSERT INTO `role_priv` VALUES ('14', '1');
INSERT INTO `role_priv` VALUES ('16', '1');
INSERT INTO `role_priv` VALUES ('14', '2');
INSERT INTO `role_priv` VALUES ('1', '3');
INSERT INTO `role_priv` VALUES ('14', '3');
INSERT INTO `role_priv` VALUES ('16', '3');
INSERT INTO `role_priv` VALUES ('1', '4');
INSERT INTO `role_priv` VALUES ('12', '4');
INSERT INTO `role_priv` VALUES ('14', '5');
INSERT INTO `role_priv` VALUES ('14', '8');
INSERT INTO `role_priv` VALUES ('16', '8');
INSERT INTO `role_priv` VALUES ('12', '10');
INSERT INTO `role_priv` VALUES ('12', '11');
INSERT INTO `role_priv` VALUES ('14', '13');
INSERT INTO `role_priv` VALUES ('14', '20');
INSERT INTO `role_priv` VALUES ('3', '22');
INSERT INTO `role_priv` VALUES ('3', '23');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL,
  `createTime` date DEFAULT NULL,
  `updateTime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '超级管理员', '123', 'adminyr', '2017-05-13', '2017-05-13');
INSERT INTO `user` VALUES ('2', '测试', '202cb962ac59075b964b07152d234b70', '123', null, null);
INSERT INTO `user` VALUES ('3', '测试2yyyy', '4ba731e0a0b4158a18be3f0eb9047f17', '1234', null, null);
INSERT INTO `user` VALUES ('4', 'sdsdds', '82cc921c6a5c6707e1d6e6862ba3201a', 'dssdds', null, null);
INSERT INTO `user` VALUES ('5', '4321', 'd93591bdf7860e1e4ee2fca799911215', '4321', null, null);
INSERT INTO `user` VALUES ('6', '4321', '011', '011', null, null);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `userId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`roleId`,`userId`),
  KEY `FK143BF46AD70E029E` (`roleId`),
  KEY `FK143BF46ADC635808` (`userId`),
  CONSTRAINT `FK143BF46AD70E029E` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `FK143BF46ADC635808` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1');
INSERT INTO `user_role` VALUES ('2', '1');
INSERT INTO `user_role` VALUES ('4', '1');
INSERT INTO `user_role` VALUES ('3', '3');
INSERT INTO `user_role` VALUES ('5', '16');
INSERT INTO `user_role` VALUES ('6', '16');

/*
Navicat MySQL Data Transfer

Source Server         : beiken
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : springmvc

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2016-12-27 22:10:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `menu_children`
-- ----------------------------
DROP TABLE IF EXISTS `menu_children`;
CREATE TABLE `menu_children` (
  `t_menu_id` bigint(20) NOT NULL,
  `children_id` bigint(20) NOT NULL,
  PRIMARY KEY (`t_menu_id`,`children_id`),
  UNIQUE KEY `children_id` (`children_id`),
  KEY `FK9F0514DFCBC05B97` (`t_menu_id`),
  KEY `FK9F0514DFBF1ADBC2` (`children_id`),
  CONSTRAINT `FK9F0514DFBF1ADBC2` FOREIGN KEY (`children_id`) REFERENCES `t_menu` (`id`),
  CONSTRAINT `FK9F0514DFCBC05B97` FOREIGN KEY (`t_menu_id`) REFERENCES `t_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_children
-- ----------------------------
INSERT INTO `menu_children` VALUES ('10', '11');
INSERT INTO `menu_children` VALUES ('12', '13');
INSERT INTO `menu_children` VALUES ('11', '14');

-- ----------------------------
-- Table structure for `role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `t_role_id` bigint(20) NOT NULL,
  `menus_id` bigint(20) NOT NULL,
  PRIMARY KEY (`t_role_id`,`menus_id`),
  KEY `FK14042788B39A02AD` (`menus_id`),
  KEY `FK14042788E52EF037` (`t_role_id`),
  CONSTRAINT `FK14042788B39A02AD` FOREIGN KEY (`menus_id`) REFERENCES `t_menu` (`id`),
  CONSTRAINT `FK14042788E52EF037` FOREIGN KEY (`t_role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('1', '10');
INSERT INTO `role_menu` VALUES ('1', '12');

-- ----------------------------
-- Table structure for `t_authority`
-- ----------------------------
DROP TABLE IF EXISTS `t_authority`;
CREATE TABLE `t_authority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `t_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEE482118299CFD02` (`role_id`),
  KEY `FKEE482118CEC7C0E2` (`user_id`),
  KEY `FK76D60138299CFD02` (`role_id`),
  KEY `FK76D601388A59B417` (`t_user_id`),
  CONSTRAINT `FK76D60138299CFD02` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `FK76D601388A59B417` FOREIGN KEY (`t_user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKEE482118299CFD02` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `FKEE482118CEC7C0E2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_authority
-- ----------------------------
INSERT INTO `t_authority` VALUES ('1', '1', '1', '1');

-- ----------------------------
-- Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attributes` tinyblob,
  `domId` varchar(255) DEFAULT NULL,
  `iconCls` varchar(255) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `target` tinyblob,
  `text` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('10', null, null, null, null, null, null, '1', null);
INSERT INTO `t_menu` VALUES ('11', null, null, null, null, null, null, '2', null);
INSERT INTO `t_menu` VALUES ('12', null, null, null, null, null, null, '组织机构权限', null);
INSERT INTO `t_menu` VALUES ('13', null, null, null, null, null, null, '角色管理', '/admin/role/list.do');
INSERT INTO `t_menu` VALUES ('14', 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, null, null, '11', null, 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, '新建菜单', null);

-- ----------------------------
-- Table structure for `t_org`
-- ----------------------------
DROP TABLE IF EXISTS `t_org`;
CREATE TABLE `t_org` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_org
-- ----------------------------

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCB63CCB6362F6F32` (`org_id`),
  CONSTRAINT `FKCB63CCB6362F6F32` FOREIGN KEY (`org_id`) REFERENCES `t_org` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '2', null, '123', '123', '');

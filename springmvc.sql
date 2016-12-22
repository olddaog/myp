/*
Navicat MySQL Data Transfer

Source Server         : 11121212
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : springmvc

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-12-22 20:15:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `menu_child`
-- ----------------------------
DROP TABLE IF EXISTS `menu_child`;
CREATE TABLE `menu_child` (
  `t_menu_id` bigint(20) NOT NULL,
  `children_id` bigint(20) NOT NULL,
  PRIMARY KEY (`t_menu_id`,`children_id`),
  UNIQUE KEY `children_id` (`children_id`),
  KEY `FKF9FFAA3CCBC05B97` (`t_menu_id`),
  KEY `FKF9FFAA3CBF1ADBC2` (`children_id`),
  CONSTRAINT `FKF9FFAA3CBF1ADBC2` FOREIGN KEY (`children_id`) REFERENCES `t_menu` (`id`),
  CONSTRAINT `FKF9FFAA3CCBC05B97` FOREIGN KEY (`t_menu_id`) REFERENCES `t_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menu_child
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menu_children
-- ----------------------------

-- ----------------------------
-- Table structure for `menu_role`
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role` (
  `t_menu_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  PRIMARY KEY (`t_menu_id`,`roles_id`),
  KEY `FKA4FEA756CBC05B97` (`t_menu_id`),
  KEY `FKA4FEA756C7B5755B` (`roles_id`),
  CONSTRAINT `FKA4FEA756C7B5755B` FOREIGN KEY (`roles_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `FKA4FEA756CBC05B97` FOREIGN KEY (`t_menu_id`) REFERENCES `t_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menu_role
-- ----------------------------

-- ----------------------------
-- Table structure for `t_authority`
-- ----------------------------
DROP TABLE IF EXISTS `t_authority`;
CREATE TABLE `t_authority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEE482118299CFD02` (`role_id`),
  KEY `FKEE482118CEC7C0E2` (`user_id`),
  CONSTRAINT `FKEE482118CEC7C0E2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKEE482118299CFD02` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_authority
-- ----------------------------
INSERT INTO `t_authority` VALUES ('1', '1', '1');
INSERT INTO `t_authority` VALUES ('2', '2', '2');
INSERT INTO `t_authority` VALUES ('3', '1', '3');

-- ----------------------------
-- Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attributes` tinyblob,
  `domId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iconCls` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target` tinyblob,
  `text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', null, null, null, null, null, null, '1');
INSERT INTO `t_menu` VALUES ('2', 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, null, null, '1', null, 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, '????');
INSERT INTO `t_menu` VALUES ('3', 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, null, null, '2', null, 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, '????');
INSERT INTO `t_menu` VALUES ('4', 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, null, null, '3', null, 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, '????');
INSERT INTO `t_menu` VALUES ('5', 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, null, null, '3', null, 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, '????');
INSERT INTO `t_menu` VALUES ('6', 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, null, null, '3', null, 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, '????');

-- ----------------------------
-- Table structure for `t_org`
-- ----------------------------
DROP TABLE IF EXISTS `t_org`;
CREATE TABLE `t_org` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_org
-- ----------------------------

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'ROLE_ADMIN');
INSERT INTO `t_role` VALUES ('2', 'ROLE_SUPERUSER');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCB63CCB6362F6F32` (`org_id`),
  CONSTRAINT `FKCB63CCB6362F6F32` FOREIGN KEY (`org_id`) REFERENCES `t_org` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', null, 'ZhongGang', 'ZhongGang', null, '');
INSERT INTO `t_user` VALUES ('2', null, 'GangGang', 'GangGang', null, '');
INSERT INTO `t_user` VALUES ('3', null, 'ZhongGang', 'ZhongZhong', null, '');

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `t_user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`t_user_id`,`role_id`),
  KEY `FK143BF46A8A59B417` (`t_user_id`),
  KEY `FK143BF46A299CFD02` (`role_id`),
  CONSTRAINT `FK143BF46A299CFD02` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `FK143BF46A8A59B417` FOREIGN KEY (`t_user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_role
-- ----------------------------

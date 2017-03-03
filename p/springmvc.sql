/*
Navicat MySQL Data Transfer

Source Server         : 11121212
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : springmvc

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-03-03 16:49:58
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
INSERT INTO `menu_children` VALUES ('0', '10');
INSERT INTO `menu_children` VALUES ('10', '11');
INSERT INTO `menu_children` VALUES ('0', '12');
INSERT INTO `menu_children` VALUES ('12', '13');
INSERT INTO `menu_children` VALUES ('11', '14');
INSERT INTO `menu_children` VALUES ('12', '15');
INSERT INTO `menu_children` VALUES ('12', '16');
INSERT INTO `menu_children` VALUES ('12', '17');
INSERT INTO `menu_children` VALUES ('12', '54');
INSERT INTO `menu_children` VALUES ('10', '55');
INSERT INTO `menu_children` VALUES ('11', '57');

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
-- Table structure for `org_children`
-- ----------------------------
DROP TABLE IF EXISTS `org_children`;
CREATE TABLE `org_children` (
  `t_org_id` bigint(20) NOT NULL,
  `children_id` bigint(20) NOT NULL,
  PRIMARY KEY (`t_org_id`,`children_id`),
  UNIQUE KEY `children_id` (`children_id`),
  KEY `FK55BA60FAE9A7C15D` (`t_org_id`),
  KEY `FK55BA60FA59E0A637` (`children_id`),
  CONSTRAINT `FK55BA60FA59E0A637` FOREIGN KEY (`children_id`) REFERENCES `t_org` (`id`),
  CONSTRAINT `FK55BA60FAE9A7C15D` FOREIGN KEY (`t_org_id`) REFERENCES `t_org` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of org_children
-- ----------------------------
INSERT INTO `org_children` VALUES ('1', '2');
INSERT INTO `org_children` VALUES ('1', '13');
INSERT INTO `org_children` VALUES ('1', '14');
INSERT INTO `org_children` VALUES ('2', '15');
INSERT INTO `org_children` VALUES ('2', '16');

-- ----------------------------
-- Table structure for `role_children`
-- ----------------------------
DROP TABLE IF EXISTS `role_children`;
CREATE TABLE `role_children` (
  `t_role_id` bigint(20) NOT NULL,
  `chilren_id` bigint(20) NOT NULL,
  `children_id` bigint(20) NOT NULL,
  PRIMARY KEY (`t_role_id`,`chilren_id`),
  UNIQUE KEY `chilren_id` (`chilren_id`),
  KEY `FK262433A8E52EF037` (`t_role_id`),
  KEY `FK262433A84086D505` (`chilren_id`),
  KEY `FK262433A8BF1D46D9` (`children_id`),
  CONSTRAINT `FK262433A8BF1D46D9` FOREIGN KEY (`children_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `FK262433A84086D505` FOREIGN KEY (`chilren_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `FK262433A8E52EF037` FOREIGN KEY (`t_role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_children
-- ----------------------------

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
INSERT INTO `role_menu` VALUES ('1', '0');
INSERT INTO `role_menu` VALUES ('2', '0');
INSERT INTO `role_menu` VALUES ('3', '0');
INSERT INTO `role_menu` VALUES ('1', '10');
INSERT INTO `role_menu` VALUES ('2', '10');
INSERT INTO `role_menu` VALUES ('1', '11');
INSERT INTO `role_menu` VALUES ('2', '11');
INSERT INTO `role_menu` VALUES ('1', '12');
INSERT INTO `role_menu` VALUES ('2', '12');
INSERT INTO `role_menu` VALUES ('3', '12');
INSERT INTO `role_menu` VALUES ('1', '13');
INSERT INTO `role_menu` VALUES ('2', '13');
INSERT INTO `role_menu` VALUES ('2', '14');
INSERT INTO `role_menu` VALUES ('2', '15');
INSERT INTO `role_menu` VALUES ('1', '16');
INSERT INTO `role_menu` VALUES ('3', '16');
INSERT INTO `role_menu` VALUES ('3', '17');
INSERT INTO `role_menu` VALUES ('1', '54');
INSERT INTO `role_menu` VALUES ('3', '54');
INSERT INTO `role_menu` VALUES ('1', '55');
INSERT INTO `role_menu` VALUES ('3', '57');

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
  `name` varchar(255) DEFAULT NULL,
  `checked` bit(1) NOT NULL,
  `_parentId` bigint(20) DEFAULT NULL,
  `added` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('0', null, null, null, null, null, null, '菜单', null, '菜单', '', null, null);
INSERT INTO `t_menu` VALUES ('10', null, null, null, '0', null, null, '系统设置', null, '系统设置', '', null, null);
INSERT INTO `t_menu` VALUES ('11', null, null, null, '10', null, null, '菜单管理', '/admin/menu/showMenuManager.do', '菜单管理', '', null, null);
INSERT INTO `t_menu` VALUES ('12', null, null, null, '0', null, null, '组织机构权限', null, '组织机构权限', '', null, null);
INSERT INTO `t_menu` VALUES ('13', null, null, null, '12', null, null, '角色管理', '/admin/role/list.do', '角色管理', '', null, null);
INSERT INTO `t_menu` VALUES ('14', 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, null, null, '11', null, 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, '新建菜单', null, '新建菜单', '', null, null);
INSERT INTO `t_menu` VALUES ('15', 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, null, null, '12', null, 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, '新建菜单', '/user/showUserManager.do', '新建菜单', '', null, null);
INSERT INTO `t_menu` VALUES ('16', 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, null, null, '12', null, 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, '组织管理', '/admin/org/orgManager.do', '组织管理', '', null, null);
INSERT INTO `t_menu` VALUES ('17', 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, null, null, '12', null, 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, '按角色授权', null, '按角色授权', '', null, null);
INSERT INTO `t_menu` VALUES ('54', 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, null, null, '12', null, 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, 'Bank', null, 'Bank', '', null, null);
INSERT INTO `t_menu` VALUES ('55', 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, null, null, '10', null, 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, '日志管理', null, '日志管理', '', null, null);
INSERT INTO `t_menu` VALUES ('57', 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, null, null, '11', null, 0xACED0005737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000007708000000010000000078, '8', null, '8', '', null, null);

-- ----------------------------
-- Table structure for `t_org`
-- ----------------------------
DROP TABLE IF EXISTS `t_org`;
CREATE TABLE `t_org` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_org
-- ----------------------------
INSERT INTO `t_org` VALUES ('1', '***', '0', null);
INSERT INTO `t_org` VALUES ('2', '中国', '1', null);
INSERT INTO `t_org` VALUES ('3', null, null, null);
INSERT INTO `t_org` VALUES ('4', null, null, null);
INSERT INTO `t_org` VALUES ('5', null, null, null);
INSERT INTO `t_org` VALUES ('6', null, null, null);
INSERT INTO `t_org` VALUES ('7', null, null, null);
INSERT INTO `t_org` VALUES ('8', null, '2', null);
INSERT INTO `t_org` VALUES ('9', null, '2', null);
INSERT INTO `t_org` VALUES ('10', null, '2', null);
INSERT INTO `t_org` VALUES ('11', null, '2', null);
INSERT INTO `t_org` VALUES ('12', null, '2', null);
INSERT INTO `t_org` VALUES ('13', null, '1', null);
INSERT INTO `t_org` VALUES ('14', null, '1', 'BBCX');
INSERT INTO `t_org` VALUES ('15', '', '2', '');
INSERT INTO `t_org` VALUES ('16', 'beiken_pad', '2', 'beiken_pad');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'ROLE_ADMIN', null);
INSERT INTO `t_role` VALUES ('2', 'ROLE_USER', null);
INSERT INTO `t_role` VALUES ('3', 'ROLE_SUP', null);

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
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCB63CCB6362F6F32` (`org_id`),
  CONSTRAINT `FKCB63CCB6362F6F32` FOREIGN KEY (`org_id`) REFERENCES `t_org` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '赵亮', '2', '$2a$10$hZwA77L.7I7JePsSjfpCNe1nxbTwm5dHjmjMSbwn3i4uuAf5NQzSW', '123', '', null, null, null);
INSERT INTO `t_user` VALUES ('2', '陈明', '2', '$2a$10$hZwA77L.7I7JePsSjfpCNe1nxbTwm5dHjmjMSbwn3i4uuAf5NQzSW', '321', '', null, null, null);
INSERT INTO `t_user` VALUES ('3', 'OLDDAOG', '1', '$2a$10$7jnZzZwRJvTRGzHnan1qleZq3sI5LOa.czMuBGCkJD2JOv3/NAk1W', '66', '', null, 'w', 'qw');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1');
INSERT INTO `user_role` VALUES ('2', '2');

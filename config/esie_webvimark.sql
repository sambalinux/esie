/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 127.0.0.1:3306
 Source Schema         : esie

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 23/07/2021 15:19:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment`  (
  `item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`, `user_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_assignment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `group_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `rule_name`(`rule_name`) USING BTREE,
  INDEX `idx-auth_item-type`(`type`) USING BTREE,
  INDEX `fk_auth_item_group_code`(`group_code`) USING BTREE,
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_auth_item_group_code` FOREIGN KEY (`group_code`) REFERENCES `auth_item_group` (`code`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/*', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('//*', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('//controller', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('//crud', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('//extension', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('//form', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('//index', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('//model', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('//module', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/asset/*', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/asset/compress', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/asset/template', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/cache/*', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/cache/flush', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/cache/flush-all', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/cache/flush-schema', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/cache/index', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/fixture/*', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/fixture/load', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/fixture/unload', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/gii/*', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/*', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/action', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/diff', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/index', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/preview', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/view', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/hello/*', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/hello/index', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/help/*', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/help/index', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/help/list', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/help/list-action-options', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/help/usage', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/message/*', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/message/config', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/message/config-template', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/message/extract', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/*', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/create', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/down', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/fresh', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/history', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/mark', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/new', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/redo', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/to', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/up', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/serve/*', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/serve/index', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/*', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/change-own-password', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-permission/set', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-permission/set-roles', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-activate', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-deactivate', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-delete', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/change-password', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/create', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/delete', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/grid-page-size', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/index', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/update', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/view', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('Admin', 1, 'Admin', NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('assignRolesToUsers', 2, 'Assign roles to users', NULL, NULL, 1627068548, 1627068548, 'userManagement');
INSERT INTO `auth_item` VALUES ('bindUserToIp', 2, 'Bind user to IP', NULL, NULL, 1627068548, 1627068548, 'userManagement');
INSERT INTO `auth_item` VALUES ('changeOwnPassword', 2, 'Change own password', NULL, NULL, 1627068548, 1627068548, 'userCommonPermissions');
INSERT INTO `auth_item` VALUES ('changeUserPassword', 2, 'Change user password', NULL, NULL, 1627068548, 1627068548, 'userManagement');
INSERT INTO `auth_item` VALUES ('commonPermission', 2, 'Common permission', NULL, NULL, 1627068546, 1627068546, NULL);
INSERT INTO `auth_item` VALUES ('createUsers', 2, 'Create users', NULL, NULL, 1627068548, 1627068548, 'userManagement');
INSERT INTO `auth_item` VALUES ('deleteUsers', 2, 'Delete users', NULL, NULL, 1627068548, 1627068548, 'userManagement');
INSERT INTO `auth_item` VALUES ('editUserEmail', 2, 'Edit user email', NULL, NULL, 1627068548, 1627068548, 'userManagement');
INSERT INTO `auth_item` VALUES ('editUsers', 2, 'Edit users', NULL, NULL, 1627068548, 1627068548, 'userManagement');
INSERT INTO `auth_item` VALUES ('viewRegistrationIp', 2, 'View registration IP', NULL, NULL, 1627068548, 1627068548, 'userManagement');
INSERT INTO `auth_item` VALUES ('viewUserEmail', 2, 'View user email', NULL, NULL, 1627068548, 1627068548, 'userManagement');
INSERT INTO `auth_item` VALUES ('viewUserRoles', 2, 'View user roles', NULL, NULL, 1627068548, 1627068548, 'userManagement');
INSERT INTO `auth_item` VALUES ('viewUsers', 2, 'View users', NULL, NULL, 1627068548, 1627068548, 'userManagement');
INSERT INTO `auth_item` VALUES ('viewVisitLog', 2, 'View visit log', NULL, NULL, 1627068548, 1627068548, 'userManagement');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child`  (
  `parent` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`parent`, `child`) USING BTREE,
  INDEX `child`(`child`) USING BTREE,
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('changeOwnPassword', '/user-management/auth/change-own-password');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/user-management/user-permission/set');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/user-management/user-permission/set-roles');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/bulk-activate');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/bulk-deactivate');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', '/user-management/user/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('changeUserPassword', '/user-management/user/change-password');
INSERT INTO `auth_item_child` VALUES ('createUsers', '/user-management/user/create');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', '/user-management/user/delete');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/index');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/update');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/view');
INSERT INTO `auth_item_child` VALUES ('Admin', 'assignRolesToUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'changeOwnPassword');
INSERT INTO `auth_item_child` VALUES ('Admin', 'changeUserPassword');
INSERT INTO `auth_item_child` VALUES ('Admin', 'createUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'deleteUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'editUsers');
INSERT INTO `auth_item_child` VALUES ('editUserEmail', 'viewUserEmail');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', 'viewUserRoles');
INSERT INTO `auth_item_child` VALUES ('Admin', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('changeUserPassword', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('createUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('editUsers', 'viewUsers');

-- ----------------------------
-- Table structure for auth_item_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_group`;
CREATE TABLE `auth_item_group`  (
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_item_group
-- ----------------------------
INSERT INTO `auth_item_group` VALUES ('userCommonPermissions', 'User common permission', 1627068548, 1627068548);
INSERT INTO `auth_item_group` VALUES ('userManagement', 'User management', 1627068548, 1627068548);

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration`  (
  `version` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', 1627068457);
INSERT INTO `migration` VALUES ('m140608_173539_create_user_table', 1627068545);
INSERT INTO `migration` VALUES ('m140611_133903_init_rbac', 1627068545);
INSERT INTO `migration` VALUES ('m140808_073114_create_auth_item_group_table', 1627068545);
INSERT INTO `migration` VALUES ('m140809_072112_insert_superadmin_to_user', 1627068546);
INSERT INTO `migration` VALUES ('m140809_073114_insert_common_permisison_to_auth_item', 1627068546);
INSERT INTO `migration` VALUES ('m141023_141535_create_user_visit_log', 1627068547);
INSERT INTO `migration` VALUES ('m141116_115804_add_bind_to_ip_and_registration_ip_to_user', 1627068547);
INSERT INTO `migration` VALUES ('m141121_194858_split_browser_and_os_column', 1627068547);
INSERT INTO `migration` VALUES ('m141201_220516_add_email_and_email_confirmed_to_user', 1627068547);
INSERT INTO `migration` VALUES ('m141207_001649_create_basic_user_permissions', 1627068548);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `confirmation_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `superadmin` smallint(6) DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `registration_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bind_to_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email_confirmed` smallint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'superadmin', 'ivoib0RmL4G_jTndaut_7bbuftox5DL8', '$2y$13$bKcthCvjouGRfFdK.qyp1uO21QH.poS6tUnQy4uSNSOpvcU8/ojKq', NULL, 1, 1, 1627068546, 1627068546, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for user_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `user_visit_log`;
CREATE TABLE `user_visit_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `language` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `visit_time` int(11) NOT NULL,
  `browser` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `os` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_visit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_visit_log
-- ----------------------------
INSERT INTO `user_visit_log` VALUES (1, '60fb20408169c', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1, 1627070528, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (2, '60fb227213bef', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1, 1627071090, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (3, '60fb22b71e140', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1, 1627071159, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (4, '60fb23d5830b9', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1, 1627071445, 'Chrome', 'Windows');

SET FOREIGN_KEY_CHECKS = 1;

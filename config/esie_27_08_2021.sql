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

 Date: 27/08/2021 14:31:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for archivo
-- ----------------------------
DROP TABLE IF EXISTS `archivo`;
CREATE TABLE `archivo`  (
  `IDArchivo` int(11) NOT NULL AUTO_INCREMENT,
  `fkUser` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tipo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tamano` bigint(20) DEFAULT NULL,
  `descripcion` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `titulo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ruta` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `descargas` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`IDArchivo`) USING BTREE,
  INDEX `fkUser`(`fkUser`) USING BTREE,
  CONSTRAINT `archivo_ibfk_1` FOREIGN KEY (`fkUser`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

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
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('ManualesWeb', 4, 1630091287);

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
INSERT INTO `auth_item` VALUES ('/cliente/*', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/cliente/create', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/cliente/delete', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/cliente/index', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/cliente/list', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/cliente/listar-clientes', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/cliente/update', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/cliente/view', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/debug/*', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/debug/default/*', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/debug/default/db-explain', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/debug/default/download-mail', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/debug/default/index', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/debug/default/toolbar', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/debug/default/view', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/debug/user/*', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/debug/user/reset-identity', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/debug/user/set-identity', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
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
INSERT INTO `auth_item` VALUES ('/gridview/*', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/gridview/export/*', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/gridview/export/download', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/hello/*', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/hello/index', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/help/*', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/help/index', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/help/list', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/help/list-action-options', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/help/usage', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/manual/*', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manual/create', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manual/delete', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manual/index', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manual/update', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manual/view', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualcategoria/*', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualcategoria/create', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualcategoria/delete', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualcategoria/index', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualcategoria/update', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualcategoria/view', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualdetalle/*', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualdetalle/create', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualdetalle/delete', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualdetalle/hoja', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualdetalle/index', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualdetalle/update', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualdetalle/view', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualdetalleusuario/*', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualdetalleusuario/create', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualdetalleusuario/delete', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualdetalleusuario/index', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualdetalleusuario/update', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualdetalleusuario/view', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualseccion/*', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualseccion/create', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualseccion/delete', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualseccion/index', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualseccion/update', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualseccion/view', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualsubcategoria/*', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualsubcategoria/create', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualsubcategoria/delete', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualsubcategoria/index', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualsubcategoria/update', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualsubcategoria/view', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualtipo/*', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/manualtipo/create', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/manualtipo/delete', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/manualtipo/index', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/manualtipo/update', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/manualtipo/view', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
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
INSERT INTO `auth_item` VALUES ('/site/*', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/site/about', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/site/captcha', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/site/contact', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/site/dashboard', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/site/error', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/site/features', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/site/index', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/site/login', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/site/logout', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/site/team', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/status/*', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/status/create', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/status/delete', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/status/index', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/status/update', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/status/view', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/tiposmodulo/*', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/tiposmodulo/create', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/tiposmodulo/delete', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/tiposmodulo/index', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/tiposmodulo/update', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/tiposmodulo/view', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/tipotec/*', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/tipotec/create', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/tipotec/delete', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/tipotec/index', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/tipotec/update', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/tipotec/view', 3, NULL, NULL, NULL, 1630091159, 1630091159, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/*', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/*', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/bulk-activate', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/bulk-deactivate', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/bulk-delete', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/create', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/delete', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/grid-page-size', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/grid-sort', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/index', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/toggle-attribute', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/update', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/view', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/*', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/captcha', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/change-own-password', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/confirm-email', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/confirm-email-receive', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/confirm-registration-email', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/login', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/logout', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/password-recovery', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/password-recovery-receive', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/registration', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/*', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/bulk-activate', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/bulk-deactivate', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/bulk-delete', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/create', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/delete', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/grid-page-size', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/grid-sort', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/index', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/refresh-routes', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/set-child-permissions', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/set-child-routes', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/toggle-attribute', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/update', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/view', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/*', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/bulk-activate', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/bulk-deactivate', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/bulk-delete', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/create', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/delete', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/grid-page-size', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/grid-sort', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/index', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/set-child-permissions', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/set-child-roles', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/toggle-attribute', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/update', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/view', 3, NULL, NULL, NULL, 1630091161, 1630091161, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-permission/*', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-permission/set', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-permission/set-roles', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/*', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/bulk-activate', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/bulk-deactivate', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/bulk-delete', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/create', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/delete', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/grid-page-size', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/grid-sort', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/index', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/toggle-attribute', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/update', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/view', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/*', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-activate', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-deactivate', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-delete', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/change-password', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/create', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/delete', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/grid-page-size', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/grid-sort', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/index', 3, NULL, NULL, NULL, 1627068548, 1627068548, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/toggle-attribute', 3, NULL, NULL, NULL, 1630091160, 1630091160, NULL);
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
INSERT INTO `auth_item` VALUES ('ManualesWeb', 1, 'ManualesWeb', NULL, NULL, 1630090410, 1630090410, NULL);
INSERT INTO `auth_item` VALUES ('verManualesWeb', 2, 'verManualesWeb', NULL, NULL, 1630091109, 1630091109, NULL);
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
INSERT INTO `auth_item_child` VALUES ('verManualesWeb', '/manualdetalle/hoja');
INSERT INTO `auth_item_child` VALUES ('changeOwnPassword', '/user-management/auth/change-own-password');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/user-management/user-permission/set');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/user-management/user-permission/set-roles');
INSERT INTO `auth_item_child` VALUES ('verManualesWeb', '/user-management/user-visit-log/update');
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
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes`  (
  `IDCliente` int(255) NOT NULL AUTO_INCREMENT,
  `CveCentroTra` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FKTipoTec` int(5) NOT NULL,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ncorto` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `activo` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_at` int(11) DEFAULT NULL,
  `update_at` int(11) DEFAULT NULL,
  `fkUser` int(11) NOT NULL,
  `update_by` int(11) NOT NULL,
  `img` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`IDCliente`) USING BTREE,
  INDEX `fkUser`(`fkUser`) USING BTREE,
  INDEX `FKTipoTec`(`FKTipoTec`) USING BTREE,
  INDEX `update_by`(`update_by`) USING BTREE,
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`fkUser`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`FKTipoTec`) REFERENCES `tipotec` (`IDTipoTec`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `clientes_ibfk_3` FOREIGN KEY (`update_by`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES (1, '01DIT0015C', 1, 'Instituto Tecnológico de Aguascalientes', 'ITAguascalientes', 'V', NULL, 1629685491, 1, 1, 'estsyz4hlAyuxwAQ1vLClA1WNqGqfoyE.png', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (2, '23DIT0002K', 1, 'Instituto Tecnológico de Cancún', 'ITCancun', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (3, '10DIT0004E', 1, 'Instituto Tecnológico de Durango', 'ITDurango', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (4, '02DIT0023K', 1, 'Instituto Tecnológico de Ensenada', 'ITEnsenada', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (5, '09DIT0004P', 1, 'Instituto Tecnológico de Gustavo A. Madero', 'ITGustavoAMadero', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (6, '27DIT0003F', 1, 'Instituto Tecnológico de La Chontalpa', 'ITLaChontalpa', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (7, '27DIT0002G', 1, 'Instituto Tecnológico de La Zona Olmeca', 'ITLaZonaOlmeca', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (8, '24DIT0018K', 1, 'Instituto Tecnológico de San Luis Potosí', 'ITSanLuisPotosi', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (9, '09DIT0008L', 1, 'Instituto Tecnológico de Tlahuac III', 'ITTlahuacIII', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (10, '05DIT0004T', 1, 'Instituto Tecnológico de Torreón', 'ITTorreón', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (11, '27DIT0001H', 1, 'Instituto Tecnológico de Villahermosa', 'ITVillahermosa', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (12, '03EIT0002W', 2, 'Instituto Tecnológico de Estudios Superiores de Los Cabos', 'ITESLosCabos', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (13, '16EIT0001A', 2, 'Instituto Tecnológico de Estudios Superiores de Zamora', 'ITESZamora', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (14, '30EIT0010B', 2, 'Instituto Tecnológico Superior de Acayucan', 'ITSAcayucan', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (15, '30EIT0014Y', 2, 'Instituto Tecnológico Superior de Alvarado', 'ITSAlvarado', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (16, '30EIT0017V', 2, 'Instituto Tecnológico Superior de Chicontepec', 'ITSChicontepec', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (17, '07EIT0001T', 2, 'Instituto Tecnológico Superior de Cintalapa', 'ITSCintalapa', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (18, '30EIT0005Q', 2, 'Instituto Tecnológico Superior de Cosamaloapan', 'ITSCosamaloapan', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (19, '25EIT0001I', 2, 'Instituto Tecnológico Superior de ElDorado', 'ITSElDorado', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (20, '30EIT0013Z', 2, 'Instituto Tecnológico Superior de Huatusco', 'ITSHuatusco', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (21, '16EIT0007V', 2, 'Instituto Tecnológico Superior de Huetamo', 'ITSHuetamo', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (22, '30EIT0018U', 2, 'Instituto Tecnológico Superior de Jesús Carranza', 'ITSJesusCarranza', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (23, '27MSU0011B', 2, 'Instituto Tecnológico Superior de La Región Sierra', 'ITSLaRegionSierra', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (24, '21EIT0011T', 2, 'Instituto Tecnológico Superior de Libres', 'ITSLibres', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (25, '27EIT0002F', 2, 'Instituto Tecnológico Superior de Los Rios', 'ITSLosRios', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (26, '30EIT0002T', 2, 'Instituto Tecnológico Superior de Misantla', 'ITSMisantla', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (27, '31EIT0003R', 2, 'Instituto Tecnológico Superior de Motul', 'ITSMotul', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (28, '30EIT0021H', 2, 'Instituto Tecnológico Superior de Naranjos', 'ITSNaranjos', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (29, '30PSU0264P', 2, 'Instituto Tecnológico Superior de Pánuco', 'ITSPanuco', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (30, '30EIT0001U ', 2, 'Instituto Tecnológico Superior de San Andrés Tuxtla', 'ITSSanAndresTuxtla', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (31, '30EIT0003S', 2, 'Instituto Tecnológico Superior de Tantoyuca', 'ITSTantoyuca', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (32, '30EIT0008N', 2, 'Instituto Tecnológico Superior de Tierra Blanca', 'ITSTierraBlanca', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (33, '31EIT0002S', 2, 'Instituto Tecnológico Superior de Valladolid', 'ITSValladolid', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (34, '21EIT0009E', 2, 'Instituto Tecnológico Superior de Zacapoaxtla', 'ITSZacapoaxtla', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (35, '30EIT0016W', 2, 'Instituto Tecnológico Superior de Zongolica', 'ITSZongolica', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (36, '31EIT0001T', 2, 'Instituto Tecnológico Superior del Sur Del Estado de Yucatán', 'ITSSurDeYucatán', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (37, '21PSU1114H', 2, 'Instituto Tecnológico Superior deTepexi', 'ITSTepexi', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (38, '31EIT0004Q', 2, 'Instituto Tecnológico Superior Progreso', 'ITSProgreso', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (39, '21PSU0097A', 3, 'Instituto Universitario Puebla', 'IUPuebla', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (40, '27EIU0001F', 4, 'Universidad Intercultural del Estado de Tabasco', 'UITabasco', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (41, '21ESU0055W', 4, 'Universidad Interserrana del Estado de Puebla-Ahuacatlán', 'UIEdoPuebla', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (42, '23EPO0001I', 5, 'Universidad Politécnica de Quintana Roo', 'UPQuintanaRoo', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (43, '30EUT0001P', 6, 'Universidad Tecnoligica del Sureste de Estado de Veracruz', 'UTSureste', 'V', NULL, NULL, 1, 1, 'itvillahermosa.jpg', 'http://villahermosa.tecnm.mx/');
INSERT INTO `clientes` VALUES (45, '23DIT0002p', 1, 'it tqacolatpa', 'ittaco', 'F', 1628962878, 1628973689, 1, 1, NULL, NULL);
INSERT INTO `clientes` VALUES (46, '23DIT0002T', 2, 'IT PRUEBA', 'ITPRUEBA', 'F', 1629648205, 1629651218, 1, 1, NULL, '');
INSERT INTO `clientes` VALUES (47, 'zea', 3, 'it tqacolatpa', 'ittaco', 'F', 1629676627, 1629676627, 1, 1, NULL, 'asdda');
INSERT INTO `clientes` VALUES (48, 'zea', 3, 'it tqacolatpa', 'ittaco', 'F', 1629676634, 1629676634, 1, 1, NULL, 'asdda');
INSERT INTO `clientes` VALUES (49, 'zea', 3, 'it tqacolatpa', 'ittaco', 'F', 1629676712, 1629676712, 1, 1, NULL, 'asdda');
INSERT INTO `clientes` VALUES (50, '23DIT0002Z', 2, 'Instituto centro frontera', 'itcentro', 'V', 1629678317, 1629678317, 1, 1, 'cio.jpg', 'http://www.centrotec.mx');

-- ----------------------------
-- Table structure for manual
-- ----------------------------
DROP TABLE IF EXISTS `manual`;
CREATE TABLE `manual`  (
  `IDManual` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `identificador` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `descripcion` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `costo` decimal(10, 0) DEFAULT 0,
  `fkCategoria` int(11) DEFAULT NULL,
  `fkSubcategoria` int(11) DEFAULT NULL,
  `fkTipo` int(11) DEFAULT NULL,
  `fkAutor` int(11) NOT NULL,
  `visitas` bigint(11) DEFAULT 0,
  `foto` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `votos` int(11) DEFAULT 0,
  `fkStatus` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `fkUser` int(11) NOT NULL,
  `like` int(11) DEFAULT 0,
  `temario` mediumtext CHARACTER SET macce COLLATE macce_general_ci,
  `fkSeccion` int(11) NOT NULL,
  PRIMARY KEY (`IDManual`) USING BTREE,
  INDEX `fkCategoria`(`fkCategoria`) USING BTREE,
  INDEX `fkSubcategoria`(`fkSubcategoria`) USING BTREE,
  INDEX `fkUser`(`fkUser`) USING BTREE,
  INDEX `fkAutor`(`fkAutor`) USING BTREE,
  INDEX `fkTipo`(`fkTipo`) USING BTREE,
  INDEX `fkSeccion`(`fkSeccion`) USING BTREE,
  INDEX `fkStatus`(`fkStatus`) USING BTREE,
  CONSTRAINT `manual_ibfk_1` FOREIGN KEY (`fkCategoria`) REFERENCES `manualcategoria` (`IDCategoria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `manual_ibfk_2` FOREIGN KEY (`fkSubcategoria`) REFERENCES `manualsubcategoria` (`IDSubCat`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `manual_ibfk_3` FOREIGN KEY (`fkUser`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `manual_ibfk_4` FOREIGN KEY (`fkAutor`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `manual_ibfk_5` FOREIGN KEY (`fkTipo`) REFERENCES `manualtipo` (`IDManualTipo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `manual_ibfk_6` FOREIGN KEY (`fkSeccion`) REFERENCES `manualseccion` (`IDSeccion`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `manual_ibfk_7` FOREIGN KEY (`fkStatus`) REFERENCES `status` (`IDStatus`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manual
-- ----------------------------
INSERT INTO `manual` VALUES (1, 'M001001', 'NUEVO INGRESO', 'M001001', 'MANUAL DE ENTRENAMIENTO DEL PROCESO DE NUEVO INGRESO DEL SIE.', NULL, NULL, 2, 1, 1, 0, '', 0, 1, 1630038723, 1630038723, 1, 0, '1.- nuevo periodo\r\n2.- cargar personal\r\n3.- conceptos\r\n4.-estructura\r\n5.- intertec', 1);

-- ----------------------------
-- Table structure for manualarchivo
-- ----------------------------
DROP TABLE IF EXISTS `manualarchivo`;
CREATE TABLE `manualarchivo`  (
  `fkManual` int(11) NOT NULL,
  `fkArchivo` int(11) NOT NULL,
  PRIMARY KEY (`fkManual`, `fkArchivo`) USING BTREE,
  INDEX `fkArchivo`(`fkArchivo`) USING BTREE,
  CONSTRAINT `manualarchivo_ibfk_1` FOREIGN KEY (`fkManual`) REFERENCES `manual` (`IDManual`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `manualarchivo_ibfk_2` FOREIGN KEY (`fkArchivo`) REFERENCES `archivo` (`IDArchivo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for manualarchivodetalle
-- ----------------------------
DROP TABLE IF EXISTS `manualarchivodetalle`;
CREATE TABLE `manualarchivodetalle`  (
  `fkArchivo` int(11) NOT NULL,
  `fkManualDetalle` int(11) NOT NULL,
  PRIMARY KEY (`fkArchivo`, `fkManualDetalle`) USING BTREE,
  INDEX `fkManualDetalle`(`fkManualDetalle`) USING BTREE,
  CONSTRAINT `manualarchivodetalle_ibfk_1` FOREIGN KEY (`fkArchivo`) REFERENCES `archivo` (`IDArchivo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `manualarchivodetalle_ibfk_2` FOREIGN KEY (`fkManualDetalle`) REFERENCES `manualdetalle` (`IDManualDetalle`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for manualcategoria
-- ----------------------------
DROP TABLE IF EXISTS `manualcategoria`;
CREATE TABLE `manualcategoria`  (
  `IDCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`IDCategoria`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manualcategoria
-- ----------------------------
INSERT INTO `manualcategoria` VALUES (1, 'USO DEL SIE');

-- ----------------------------
-- Table structure for manualdetalle
-- ----------------------------
DROP TABLE IF EXISTS `manualdetalle`;
CREATE TABLE `manualdetalle`  (
  `IDManualDetalle` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fkManual` int(11) NOT NULL,
  `numeroPaso` tinyint(9) DEFAULT NULL,
  `resumen` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `contenido` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `documento` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fkStatus` int(11) NOT NULL,
  `fkUser` int(11) NOT NULL,
  `visitas` int(11) DEFAULT NULL,
  `nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `vistoCompletamente` bigint(20) DEFAULT 0,
  `created_at` int(11) DEFAULT NULL,
  `update_at` int(11) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDManualDetalle`) USING BTREE,
  INDEX `fkManual`(`fkManual`) USING BTREE,
  INDEX `fkStatus`(`fkStatus`) USING BTREE,
  INDEX `fkUser`(`fkUser`) USING BTREE,
  INDEX `update_by`(`update_by`) USING BTREE,
  CONSTRAINT `manualdetalle_ibfk_1` FOREIGN KEY (`fkManual`) REFERENCES `manual` (`IDManual`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `manualdetalle_ibfk_2` FOREIGN KEY (`fkStatus`) REFERENCES `status` (`IDStatus`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `manualdetalle_ibfk_3` FOREIGN KEY (`fkUser`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `manualdetalle_ibfk_4` FOREIGN KEY (`update_by`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manualdetalle
-- ----------------------------
INSERT INTO `manualdetalle` VALUES (1, '419406114', 1, 1, 'En este manual aprenderás a dar de alta a estudiantes y modificar sus datos personales. Este proceso pertenece a nuevo ingreso.', 'sie22200NuevoIngreso_E_CacelarYModificar', 'sie22200NuevoIngreso_E_CacelarYModificar', 1, 1, NULL, 'Alta de nuevos estudiantes', 0, 1630039835, 1630085421, 1);

-- ----------------------------
-- Table structure for manualdetalleusuario
-- ----------------------------
DROP TABLE IF EXISTS `manualdetalleusuario`;
CREATE TABLE `manualdetalleusuario`  (
  `fkManuelDetalleUsuario` int(11) NOT NULL,
  `fkUser` int(11) NOT NULL,
  `contador` bigint(20) DEFAULT 0,
  PRIMARY KEY (`fkManuelDetalleUsuario`, `fkUser`) USING BTREE,
  INDEX `fkUser`(`fkUser`) USING BTREE,
  CONSTRAINT `manualdetalleusuario_ibfk_1` FOREIGN KEY (`fkUser`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `manualdetalleusuario_ibfk_2` FOREIGN KEY (`fkManuelDetalleUsuario`) REFERENCES `manualdetalle` (`IDManualDetalle`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for manualseccion
-- ----------------------------
DROP TABLE IF EXISTS `manualseccion`;
CREATE TABLE `manualseccion`  (
  `IDSeccion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ubicacion` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`IDSeccion`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manualseccion
-- ----------------------------
INSERT INTO `manualseccion` VALUES (1, 'PRINCIPAL', 'inicial');

-- ----------------------------
-- Table structure for manualsubcategoria
-- ----------------------------
DROP TABLE IF EXISTS `manualsubcategoria`;
CREATE TABLE `manualsubcategoria`  (
  `IDSubCat` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fkcategoria` int(11) NOT NULL,
  `fktiposmodulos` int(11) NOT NULL,
  PRIMARY KEY (`IDSubCat`) USING BTREE,
  INDEX `fkcategoria`(`fkcategoria`) USING BTREE,
  INDEX `fktiposmodulos`(`fktiposmodulos`) USING BTREE,
  CONSTRAINT `manualsubcategoria_ibfk_1` FOREIGN KEY (`fkcategoria`) REFERENCES `manualcategoria` (`IDCategoria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `manualsubcategoria_ibfk_2` FOREIGN KEY (`fktiposmodulos`) REFERENCES `tiposmodulo` (`IDTipoMod`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manualsubcategoria
-- ----------------------------
INSERT INTO `manualsubcategoria` VALUES (1, 'REINSCRIPCION', 1, 1);
INSERT INTO `manualsubcategoria` VALUES (2, 'NUEVO INGRESO', 1, 1);

-- ----------------------------
-- Table structure for manualtipo
-- ----------------------------
DROP TABLE IF EXISTS `manualtipo`;
CREATE TABLE `manualtipo`  (
  `IDManualTipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`IDManualTipo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manualtipo
-- ----------------------------
INSERT INTO `manualtipo` VALUES (1, 'EJECUTIVO');
INSERT INTO `manualtipo` VALUES (2, 'GRATIS');

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
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status`  (
  `IDStatus` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `prioridad` tinyint(2) DEFAULT 0,
  PRIMARY KEY (`IDStatus`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES (1, 'CAPTURADO', 1);
INSERT INTO `status` VALUES (2, 'PUBLICADO', 2);
INSERT INTO `status` VALUES (3, 'ARCHIVADO', 3);
INSERT INTO `status` VALUES (4, 'CANCELADO', 4);
INSERT INTO `status` VALUES (5, 'PROCESO', 5);

-- ----------------------------
-- Table structure for tiposmodulo
-- ----------------------------
DROP TABLE IF EXISTS `tiposmodulo`;
CREATE TABLE `tiposmodulo`  (
  `IDTipoMod` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`IDTipoMod`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tiposmodulo
-- ----------------------------
INSERT INTO `tiposmodulo` VALUES (1, 'MANUALES');
INSERT INTO `tiposmodulo` VALUES (2, 'CURSOS');

-- ----------------------------
-- Table structure for tipotec
-- ----------------------------
DROP TABLE IF EXISTS `tipotec`;
CREATE TABLE `tipotec`  (
  `IDTipoTec` int(255) NOT NULL AUTO_INCREMENT,
  `nomcorto` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`IDTipoTec`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tipotec
-- ----------------------------
INSERT INTO `tipotec` VALUES (1, 'IT', 'INSTITUTO TECNOLOGICO');
INSERT INTO `tipotec` VALUES (2, 'ITS', 'INSTITUTO TECNOLOGICO SUPERIOR');
INSERT INTO `tipotec` VALUES (3, 'IUP', 'INSTITUTO UNIVERSITARIO PUEBLA');
INSERT INTO `tipotec` VALUES (4, 'UI', 'UNIVERSIDAD INTERCULTURAL');
INSERT INTO `tipotec` VALUES (5, 'UP', 'UNIVERSIDAD POLITECNICA');
INSERT INTO `tipotec` VALUES (6, 'UT', 'UNIVERSIDAD TECNOLOGICA');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'superadmin', 'ivoib0RmL4G_jTndaut_7bbuftox5DL8', '$2y$13$bKcthCvjouGRfFdK.qyp1uO21QH.poS6tUnQy4uSNSOpvcU8/ojKq', NULL, 1, 1, 1627068546, 1627934035, NULL, '', 'jgomez.zea@hotmail.com', 0);
INSERT INTO `user` VALUES (3, 'zea', 'LJnSLhmXPH1NTJ9K4Yf1nTBkPQGVF8kI', '$2y$13$HUdTRMmFz1ExCYht3rAwV.btyif2tXYEXyJnP5ztFGIoJpjY3Q76q', NULL, 1, 0, 1629987486, 1629987486, '127.0.0.1', '', 'jgomez.zea@hotmail.com', 0);
INSERT INTO `user` VALUES (4, 'f4545f', 'bUJ7xy5ycYNZzZvx0aPtQgoL_jqElDoV', '$2y$13$Z71ZGkOOa00ct9rq7m9pKeZG62H8qLwIAqHND2Rjn22pq/Qf60n0.', NULL, 1, 0, 1630090325, 1630090325, '127.0.0.1', '', 'sambalinux@gmail.com', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_visit_log
-- ----------------------------
INSERT INTO `user_visit_log` VALUES (1, '60fb20408169c', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1, 1627070528, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (2, '60fb227213bef', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1, 1627071090, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (3, '60fb22b71e140', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1, 1627071159, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (4, '60fb23d5830b9', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1, 1627071445, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (5, '60fb281aa02e9', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1, 1627072538, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (6, '60fb3784d1ac8', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1, 1627076484, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (7, '60fc79b03f4a9', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1, 1627158960, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (8, '6107110683d5e', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1627853062, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (9, '6107122dd519c', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1627853357, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (10, '610713ada5c76', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1627853741, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (11, '6107198e5d7a9', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1627855246, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (12, '61074468ed3cd', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1627866216, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (13, '61074488065f7', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1627866248, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (14, '610756d55bda1', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1627870933, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (15, '610757d4614b8', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1627871188, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (16, '610758369de62', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1627871286, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (17, '610758bdaacf5', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1627871421, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (18, '6107626d91dd3', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1627873901, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (19, '610763652c17e', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1627874149, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (20, '610763a6c09b3', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1627874214, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (21, '610764919000d', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1627874449, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (22, '61084abb2f283', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1627933371, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (23, '61084cf679ea4', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1627933942, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (24, '610864d2e51ee', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1627940050, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (25, '61088468245dd', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1627948136, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (26, '6109fdae4620a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1628044718, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (27, '610abd8bc7ad7', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1628093835, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (28, '610ac6ceb038c', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1628096206, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (29, '610afbce71b4d', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 1, 1628109774, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (30, '6115794dae0a1', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1, 1628797261, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (31, '61169a09c9c9a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1, 1628871177, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (32, '6116e4f0c9647', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1, 1628890352, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (33, '6117ef42c7023', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1, 1628958530, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (34, '611822e954827', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1, 1628971753, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (35, '611946593de3f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1, 1629046361, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (36, '611bbc2342f4b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1, 1629207587, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (37, '6122668fb48de', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1, 1629644431, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (38, '6123dbf95b734', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1, 1629740025, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (39, '61244f2cc95c9', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1, 1629769516, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (40, '6125261a4e277', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1, 1629824538, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (41, '61253233deea9', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1, 1629827635, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (42, '612532870ac80', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1, 1629827719, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (43, '6127a2606d1be', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1, 1629987424, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (44, '612827c4a929b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1, 1630021572, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (45, '612874fb2c065', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1, 1630041339, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (46, '6128766800e64', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1, 1630041704, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (47, '612908cba8994', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1, 1630079179, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (48, '612920d5aa8b2', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1, 1630085333, 'Chrome', 'Windows');

SET FOREIGN_KEY_CHECKS = 1;

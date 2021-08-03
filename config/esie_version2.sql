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

 Date: 01/08/2021 22:48:39
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
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes`  (
  `IDCliente` int(255) NOT NULL AUTO_INCREMENT,
  `CveCentroTra` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tipo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ncorto` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `activo` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fechaCreacion` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `fechaActualizacion` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `fkUser` int(255) DEFAULT NULL,
  PRIMARY KEY (`IDCliente`) USING BTREE,
  INDEX `fkUser`(`fkUser`) USING BTREE,
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`fkUser`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES (1, '01DIT0015C', 'IT', 'Instituto Tecnológico de Aguascalientes', 'ITAguascalientes', 'V', '2021-08-01 22:46:50', '2021-08-01 22:46:50', 1);
INSERT INTO `clientes` VALUES (2, '23DIT0002K', 'IT', 'Instituto Tecnológico de Cancún', 'ITCancun', 'V', '2021-08-01 22:46:51', '2021-08-01 22:46:51', 1);
INSERT INTO `clientes` VALUES (3, '10DIT0004E', 'IT', 'Instituto Tecnológico de Durango', 'ITDurango', 'V', '2021-08-01 22:46:54', '2021-08-01 22:46:54', 1);
INSERT INTO `clientes` VALUES (4, '02DIT0023K', 'IT', 'Instituto Tecnológico de Ensenada', 'ITEnsenada', 'V', '2021-08-01 22:46:52', '2021-08-01 22:46:52', 1);
INSERT INTO `clientes` VALUES (5, '09DIT0004P', 'IT', 'Instituto Tecnológico de Gustavo A. Madero', 'ITGustavoAMadero', 'V', '2021-08-01 22:46:52', '2021-08-01 22:46:52', 1);
INSERT INTO `clientes` VALUES (6, '27DIT0003F', 'IT', 'Instituto Tecnológico de La Chontalpa', 'ITLaChontalpa', 'V', '2021-08-01 22:47:04', '2021-08-01 22:47:04', 1);
INSERT INTO `clientes` VALUES (7, '27DIT0002G', 'IT', 'Instituto Tecnológico de La Zona Olmeca', 'ITLaZonaOlmeca', 'V', '2021-08-01 22:46:55', '2021-08-01 22:46:55', 1);
INSERT INTO `clientes` VALUES (8, '24DIT0018K', 'IT', 'Instituto Tecnológico de San Luis Potosí', 'ITSanLuisPotosi', 'V', '2021-08-01 22:46:56', '2021-08-01 22:46:56', 1);
INSERT INTO `clientes` VALUES (9, '09DIT0008L', 'IT', 'Instituto Tecnológico de Tlahuac III', 'ITTlahuacIII', 'V', '2021-08-01 22:47:08', '2021-08-01 22:47:08', 1);
INSERT INTO `clientes` VALUES (10, '05DIT0004T', 'IT', 'Instituto Tecnológico de Torreón', 'ITTorreón', 'V', '2021-08-01 22:46:56', '2021-08-01 22:46:56', 1);
INSERT INTO `clientes` VALUES (11, '27DIT0001H', 'IT ', 'Instituto Tecnológico de Villahermosa', 'ITVillahermosa', 'V', '2021-08-01 22:47:14', '2021-08-01 22:47:14', 1);
INSERT INTO `clientes` VALUES (12, '03EIT0002W', 'ITS', 'Instituto Tecnológico de Estudios Superiores de Los Cabos', 'ITESLosCabos', 'V', '2021-08-01 22:47:15', '2021-08-01 22:47:15', 1);
INSERT INTO `clientes` VALUES (13, '16EIT0001A', 'ITS', 'Instituto Tecnológico de Estudios Superiores de Zamora', 'ITESZamora', 'V', '2021-08-01 22:47:15', '2021-08-01 22:47:15', 1);
INSERT INTO `clientes` VALUES (14, '30EIT0010B', 'ITS', 'Instituto Tecnológico Superior de Acayucan', 'ITSAcayucan', 'V', '2021-08-01 22:47:16', '2021-08-01 22:47:16', 1);
INSERT INTO `clientes` VALUES (15, '30EIT0014Y', 'ITS', 'Instituto Tecnológico Superior de Alvarado', 'ITSAlvarado', 'V', '2021-08-01 22:47:16', '2021-08-01 22:47:16', 1);
INSERT INTO `clientes` VALUES (16, '30EIT0017V', 'ITS', 'Instituto Tecnológico Superior de Chicontepec', 'ITSChicontepec', 'V', '2021-08-01 22:47:28', '2021-08-01 22:47:28', 1);
INSERT INTO `clientes` VALUES (17, '07EIT0001T', 'ITS', 'Instituto Tecnológico Superior de Cintalapa', 'ITSCintalapa', 'V', '2021-08-01 22:47:28', '2021-08-01 22:47:28', 1);
INSERT INTO `clientes` VALUES (18, '30EIT0005Q', 'ITS', 'Instituto Tecnológico Superior de Cosamaloapan', 'ITSCosamaloapan', 'V', '2021-08-01 22:47:29', '2021-08-01 22:47:29', 1);
INSERT INTO `clientes` VALUES (19, '25EIT0001I', 'ITS', 'Instituto Tecnológico Superior de ElDorado', 'ITSElDorado', 'V', '2021-08-01 22:47:30', '2021-08-01 22:47:30', 1);
INSERT INTO `clientes` VALUES (20, '30EIT0013Z', 'ITS', 'Instituto Tecnológico Superior de Huatusco', 'ITSHuatusco', 'V', '2021-08-01 22:47:31', '2021-08-01 22:47:31', 1);
INSERT INTO `clientes` VALUES (21, '16EIT0007V', 'ITS', 'Instituto Tecnológico Superior de Huetamo', 'ITSHuetamo', 'V', '2021-08-01 22:47:31', '2021-08-01 22:47:31', 1);
INSERT INTO `clientes` VALUES (22, '30EIT0018U', 'ITS', 'Instituto Tecnológico Superior de Jesús Carranza', 'ITSJesusCarranza', 'V', '2021-08-01 22:47:32', '2021-08-01 22:47:32', 1);
INSERT INTO `clientes` VALUES (23, '27MSU0011B', 'ITS', 'Instituto Tecnológico Superior de La Región Sierra', 'ITSLaRegionSierra', 'V', '2021-08-01 22:47:32', '2021-08-01 22:47:32', 1);
INSERT INTO `clientes` VALUES (24, '21EIT0011T', 'ITS', 'Instituto Tecnológico Superior de Libres', 'ITSLibres', 'V', '2021-08-01 22:47:33', '2021-08-01 22:47:33', 1);
INSERT INTO `clientes` VALUES (25, '27EIT0002F', 'ITS', 'Instituto Tecnológico Superior de Los Rios', 'ITSLosRios', 'V', '2021-08-01 22:47:33', '2021-08-01 22:47:33', 1);
INSERT INTO `clientes` VALUES (26, '30EIT0002T', 'ITS', 'Instituto Tecnológico Superior de Misantla', 'ITSMisantla', 'V', '2021-08-01 22:47:34', '2021-08-01 22:47:34', 1);
INSERT INTO `clientes` VALUES (27, '31EIT0003R', 'ITS', 'Instituto Tecnológico Superior de Motul', 'ITSMotul', 'V', '2021-08-01 22:47:35', '2021-08-01 22:47:35', 1);
INSERT INTO `clientes` VALUES (28, '30EIT0021H', 'ITS', 'Instituto Tecnológico Superior de Naranjos', 'ITSNaranjos', 'V', '2021-08-01 22:47:35', '2021-08-01 22:47:35', 1);
INSERT INTO `clientes` VALUES (29, '30PSU0264P', 'ITS', 'Instituto Tecnológico Superior de Pánuco', 'ITSPanuco', 'V', '2021-08-01 22:47:39', '2021-08-01 22:47:39', 1);
INSERT INTO `clientes` VALUES (30, '30EIT0001U ', 'ITS', 'Instituto Tecnológico Superior de San Andrés Tuxtla', 'ITSSanAndresTuxtla', 'V', '2021-08-01 22:47:39', '2021-08-01 22:47:39', 1);
INSERT INTO `clientes` VALUES (31, '30EIT0003S', 'ITS', 'Instituto Tecnológico Superior de Tantoyuca', 'ITSTantoyuca', 'V', '2021-08-01 22:47:47', '2021-08-01 22:47:47', 1);
INSERT INTO `clientes` VALUES (32, '30EIT0008N', 'ITS', 'Instituto Tecnológico Superior de Tierra Blanca', 'ITSTierraBlanca', 'V', '2021-08-01 22:47:46', '2021-08-01 22:47:46', 1);
INSERT INTO `clientes` VALUES (33, '31EIT0002S', 'ITS', 'Instituto Tecnológico Superior de Valladolid', 'ITSValladolid', 'V', '2021-08-01 22:47:46', '2021-08-01 22:47:46', 1);
INSERT INTO `clientes` VALUES (34, '21EIT0009E', 'ITS', 'Instituto Tecnológico Superior de Zacapoaxtla', 'ITSZacapoaxtla', 'V', '2021-08-01 22:47:45', '2021-08-01 22:47:45', 1);
INSERT INTO `clientes` VALUES (35, '30EIT0016W', 'ITS', 'Instituto Tecnológico Superior de Zongolica', 'ITSZongolica', 'V', '2021-08-01 22:47:44', '2021-08-01 22:47:44', 1);
INSERT INTO `clientes` VALUES (36, '31EIT0001T', 'ITS', 'Instituto Tecnológico Superior del Sur Del Estado de Yucatán', 'ITSSurDeYucatán', 'V', '2021-08-01 22:47:24', '2021-08-01 22:47:24', 1);
INSERT INTO `clientes` VALUES (37, '21PSU1114H', 'ITS', 'Instituto Tecnológico Superior deTepexi', 'ITSTepexi', 'V', '2021-08-01 22:47:21', '2021-08-01 22:47:21', 1);
INSERT INTO `clientes` VALUES (38, '31EIT0004Q', 'ITS', 'Instituto Tecnológico Superior Progreso', 'ITSProgreso', 'V', '2021-08-01 22:47:21', '2021-08-01 22:47:21', 1);
INSERT INTO `clientes` VALUES (39, '21PSU0097A', 'IUP', 'Instituto Universitario Puebla', 'IUPuebla', 'V', '2021-08-01 22:47:23', '2021-08-01 22:47:23', 1);
INSERT INTO `clientes` VALUES (40, '27EIU0001F', 'UI', 'Universidad Intercultural del Estado de Tabasco', 'UITabasco', 'V', '2021-08-01 22:47:17', '2021-08-01 22:47:17', 1);
INSERT INTO `clientes` VALUES (41, '21ESU0055W', 'UI', 'Universidad Interserrana del Estado de Puebla-Ahuacatlán', 'UIEdoPuebla', 'V', '2021-08-01 22:47:19', '2021-08-01 22:47:19', 1);
INSERT INTO `clientes` VALUES (42, '23EPO0001I', 'UP', 'Universidad Politécnica de Quintana Roo', 'UPQuintanaRoo', 'V', '2021-08-01 22:47:40', '2021-08-01 22:47:40', 1);
INSERT INTO `clientes` VALUES (43, '30EUT0001P', 'UT', 'Universidad Tecnoligica del Sureste de Estado de Veracruz', 'UTSureste', 'V', '2021-08-01 22:47:42', '2021-08-01 22:47:42', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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

SET FOREIGN_KEY_CHECKS = 1;

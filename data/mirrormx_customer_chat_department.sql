/*
 Navicat MySQL Data Transfer

 Source Server         : shangcheng
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : mirrormx_customer_chat_pro

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 03/12/2020 11:07:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mirrormx_customer_chat_department
-- ----------------------------
DROP TABLE IF EXISTS `mirrormx_customer_chat_department`;
CREATE TABLE `mirrormx_customer_chat_department`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mirrormx_customer_chat_department
-- ----------------------------
INSERT INTO `mirrormx_customer_chat_department` VALUES (1, '客服1部', '负责生产问题');
INSERT INTO `mirrormx_customer_chat_department` VALUES (2, '客服2部', '负责销售问题');
INSERT INTO `mirrormx_customer_chat_department` VALUES (3, '客服3部', '客服3部');
INSERT INTO `mirrormx_customer_chat_department` VALUES (4, '客服4部', '客服4部');
INSERT INTO `mirrormx_customer_chat_department` VALUES (5, '客服5部', '客服5部');
INSERT INTO `mirrormx_customer_chat_department` VALUES (6, '客服6部', '客服6部');
INSERT INTO `mirrormx_customer_chat_department` VALUES (7, '客服7部', '客服7部');
INSERT INTO `mirrormx_customer_chat_department` VALUES (8, '客服8部', '客服8部');
INSERT INTO `mirrormx_customer_chat_department` VALUES (9, '客服9部', '客服9部');
INSERT INTO `mirrormx_customer_chat_department` VALUES (10, '客服10部', '客服10部');
INSERT INTO `mirrormx_customer_chat_department` VALUES (11, '客服11部', '客服11部');

SET FOREIGN_KEY_CHECKS = 1;

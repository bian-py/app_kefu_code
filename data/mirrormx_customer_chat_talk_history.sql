/*
 Navicat MySQL Data Transfer

 Source Server         : shangcheng
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : chat

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 07/12/2020 02:41:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mirrormx_customer_chat_talk
-- ----------------------------
DROP TABLE IF EXISTS `mirrormx_customer_chat_talk`;
CREATE TABLE `mirrormx_customer_chat_talk`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `department_id` smallint(5) UNSIGNED DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `extra` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `talk_fk_department`(`department_id`) USING BTREE,
  INDEX `talk_owner_ix`(`owner`) USING BTREE,
  INDEX `talk_last_activity_ix`(`last_activity`) USING BTREE,
  CONSTRAINT `talk_fk_department` FOREIGN KEY (`department_id`) REFERENCES `mirrormx_customer_chat_department` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mirrormx_customer_chat_talk
-- ----------------------------
INSERT INTO `mirrormx_customer_chat_talk` VALUES (1, 'in_progress', NULL, 16, '2020-12-06 18:31:59', NULL);
INSERT INTO `mirrormx_customer_chat_talk` VALUES (2, 'in_progress', NULL, 14, '2020-12-06 18:39:23', NULL);

SET FOREIGN_KEY_CHECKS = 1;

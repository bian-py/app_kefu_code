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

 Date: 05/12/2020 22:14:49
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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mirrormx_customer_chat_talk
-- ----------------------------
INSERT INTO `mirrormx_customer_chat_talk` VALUES (1, 'closed', NULL, 1, '2020-11-30 09:07:14', NULL);
INSERT INTO `mirrormx_customer_chat_talk` VALUES (2, 'closed', NULL, NULL, '2020-12-01 12:40:39', NULL);
INSERT INTO `mirrormx_customer_chat_talk` VALUES (3, 'closed', NULL, NULL, '2020-12-01 12:40:39', NULL);
INSERT INTO `mirrormx_customer_chat_talk` VALUES (4, 'closed', NULL, 1, '2020-12-01 16:24:02', NULL);
INSERT INTO `mirrormx_customer_chat_talk` VALUES (5, 'closed', 2, NULL, '2020-12-01 06:31:34', NULL);
INSERT INTO `mirrormx_customer_chat_talk` VALUES (6, 'closed', 2, NULL, '2020-12-02 20:12:18', NULL);
INSERT INTO `mirrormx_customer_chat_talk` VALUES (7, 'closed', 1, 5, '2020-12-01 15:42:59', NULL);
INSERT INTO `mirrormx_customer_chat_talk` VALUES (8, 'closed', 1, 5, '2020-12-01 08:49:44', NULL);
INSERT INTO `mirrormx_customer_chat_talk` VALUES (9, 'closed', NULL, 5, '2020-12-01 08:52:20', NULL);
INSERT INTO `mirrormx_customer_chat_talk` VALUES (10, 'closed', 1, NULL, '2020-12-01 08:52:40', NULL);
INSERT INTO `mirrormx_customer_chat_talk` VALUES (11, 'closed', 1, 5, '2020-12-02 20:12:18', NULL);
INSERT INTO `mirrormx_customer_chat_talk` VALUES (12, 'closed', NULL, 15, '2020-12-04 02:59:26', NULL);
INSERT INTO `mirrormx_customer_chat_talk` VALUES (13, 'closed', NULL, 15, '2020-12-04 03:00:18', NULL);
INSERT INTO `mirrormx_customer_chat_talk` VALUES (14, 'in_progress', NULL, 14, '2020-12-05 10:05:20', NULL);
INSERT INTO `mirrormx_customer_chat_talk` VALUES (15, 'closed', NULL, 14, '2020-12-05 10:01:07', NULL);
INSERT INTO `mirrormx_customer_chat_talk` VALUES (16, 'in_progress', NULL, 14, '2020-12-05 10:06:10', NULL);

SET FOREIGN_KEY_CHECKS = 1;

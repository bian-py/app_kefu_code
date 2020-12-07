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

 Date: 03/12/2020 11:20:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mirrormx_customer_chat_user_department
-- ----------------------------
DROP TABLE IF EXISTS `mirrormx_customer_chat_user_department`;
CREATE TABLE `mirrormx_customer_chat_user_department`  (
  `user_id` int(11) NOT NULL,
  `department_id` smallint(5) UNSIGNED NOT NULL,
  UNIQUE INDEX `user_department_uq`(`user_id`, `department_id`) USING BTREE,
  INDEX `user_department_fk_department`(`department_id`) USING BTREE,
  CONSTRAINT `user_department_fk_department` FOREIGN KEY (`department_id`) REFERENCES `mirrormx_customer_chat_department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_department_fk_user` FOREIGN KEY (`user_id`) REFERENCES `mirrormx_customer_chat_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mirrormx_customer_chat_user_department
-- ----------------------------
INSERT INTO `mirrormx_customer_chat_user_department` VALUES (5, 1);
INSERT INTO `mirrormx_customer_chat_user_department` VALUES (6, 2);
INSERT INTO `mirrormx_customer_chat_user_department` VALUES (14, 3);
INSERT INTO `mirrormx_customer_chat_user_department` VALUES (15, 4);
INSERT INTO `mirrormx_customer_chat_user_department` VALUES (16, 5);
INSERT INTO `mirrormx_customer_chat_user_department` VALUES (17, 6);
INSERT INTO `mirrormx_customer_chat_user_department` VALUES (18, 7);
INSERT INTO `mirrormx_customer_chat_user_department` VALUES (19, 8);
INSERT INTO `mirrormx_customer_chat_user_department` VALUES (20, 9);
INSERT INTO `mirrormx_customer_chat_user_department` VALUES (21, 10);
INSERT INTO `mirrormx_customer_chat_user_department` VALUES (22, 11);

SET FOREIGN_KEY_CHECKS = 1;

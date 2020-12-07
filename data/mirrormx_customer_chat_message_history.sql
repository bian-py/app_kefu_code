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

 Date: 07/12/2020 02:40:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mirrormx_customer_chat_message
-- ----------------------------
DROP TABLE IF EXISTS `mirrormx_customer_chat_message`;
CREATE TABLE `mirrormx_customer_chat_message`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `talk_id` int(10) UNSIGNED NOT NULL,
  `extra` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_fk_talk`(`talk_id`) USING BTREE,
  INDEX `message_from_id_ix`(`from_id`) USING BTREE,
  INDEX `message_to_id_ix`(`to_id`) USING BTREE,
  INDEX `message_datetime_ix`(`datetime`) USING BTREE,
  CONSTRAINT `message_fk_talk` FOREIGN KEY (`talk_id`) REFERENCES `mirrormx_customer_chat_talk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mirrormx_customer_chat_message
-- ----------------------------
INSERT INTO `mirrormx_customer_chat_message` VALUES (1, 16, 15, '这是test05发送给test04的历史信息', '2020-12-06 18:31:17', 1, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (2, 15, -1, 'test04收到test05的历史信息', '2020-12-06 18:31:59', 1, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (3, -2, -1, '', '2020-12-06 18:32:24', 1, '{\"type\":\"user_leave\",\"id\":15,\"name\":\"test04\",\"mail\":\"test04@test.com\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (4, -2, -1, '', '2020-12-06 18:32:41', 1, '{\"type\":\"user_leave\",\"id\":16,\"name\":\"test05\",\"mail\":\"test05@test.com\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (5, 14, 15, '这是test03发给test04的历史信息', '2020-12-06 18:38:58', 2, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (6, 15, -1, 'test04收到test03发送的历史信息', '2020-12-06 18:39:23', 2, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (7, -2, -1, '', '2020-12-06 18:39:26', 2, '{\"type\":\"user_leave\",\"id\":15,\"name\":\"test04\",\"mail\":\"test04@test.com\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (8, -2, -1, '', '2020-12-06 18:39:30', 2, '{\"type\":\"user_leave\",\"id\":14,\"name\":\"test03\",\"mail\":\"test03@test.com\"}');

SET FOREIGN_KEY_CHECKS = 1;

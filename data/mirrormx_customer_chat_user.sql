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

 Date: 03/12/2020 11:16:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mirrormx_customer_chat_user
-- ----------------------------
DROP TABLE IF EXISTS `mirrormx_customer_chat_user`;
CREATE TABLE `mirrormx_customer_chat_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mail` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `info` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `roles` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_mail_ix`(`mail`) USING BTREE,
  INDEX `user_last_activity_ix`(`last_activity`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mirrormx_customer_chat_user
-- ----------------------------
INSERT INTO `mirrormx_customer_chat_user` VALUES (1, 'admin', 'admin', '10470c3b4b1fed12c3baac014be15fac67c6e815', NULL, '{\"ip\":\"::1\"}', 'ADMIN,OPERATOR', '2020-12-02 14:57:35');
INSERT INTO `mirrormx_customer_chat_user` VALUES (2, 'anonymous-1606727209', 'no@e.mail.provided', 'x', '/kefu/upload/default-avatars/a.png', '{\"ip\":\"::1\",\"referer\":\"http:\\/\\/localhost\\/111index.html\",\"userAgent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.102 Safari\\/537.36\",\"browserName\":\"chrome\",\"browserVersion\":\"85.0\",\"os\":\"windows\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"21\",\"regionName\":\"Liaoning\",\"city\":\"Dalian\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":38.9122,\"longitude\":121.6022,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2020-11-30 09:48:19');
INSERT INTO `mirrormx_customer_chat_user` VALUES (3, 'anonymous-1606730662', 'no@e.mail.provided', 'x', '/kefu/upload/default-avatars/a.png', '{\"ip\":\"::1\",\"referer\":\"http:\\/\\/localhost\\/index.php\\/Home\\/Cart\\/index.html\",\"userAgent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.102 Safari\\/537.36\",\"browserName\":\"chrome\",\"browserVersion\":\"85.0\",\"os\":\"windows\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"21\",\"regionName\":\"Liaoning\",\"city\":\"Dalian\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":38.9122,\"longitude\":121.6022,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2020-11-30 10:27:57');
INSERT INTO `mirrormx_customer_chat_user` VALUES (4, 'anonymous-1606730666', 'no@e.mail.provided', 'x', '/kefu/upload/default-avatars/a.png', '{\"ip\":\"::1\",\"referer\":\"http:\\/\\/localhost\\/index.php\\/Home\\/Cart\\/index.html\",\"userAgent\":\"Mozilla\\/5.0 (Windows NT 10.0; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/78.0.3904.108 Safari\\/537.36\",\"browserName\":\"chrome\",\"browserVersion\":\"78.0\",\"os\":\"windows\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"21\",\"regionName\":\"Liaoning\",\"city\":\"Dalian\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":38.9122,\"longitude\":121.6022,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2020-11-30 10:21:07');
INSERT INTO `mirrormx_customer_chat_user` VALUES (5, 'test01', 'test01@test.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', NULL, NULL, 'OPERATOR', '2020-12-01 09:05:54');
INSERT INTO `mirrormx_customer_chat_user` VALUES (6, 'test02', 'test02@test.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', NULL, NULL, 'OPERATOR', '2020-12-01 14:14:15');
INSERT INTO `mirrormx_customer_chat_user` VALUES (7, 'anonymous-1606804294', 'no@e.mail.provided', 'x', '/kefu/upload/default-avatars/f.png', '{\"ip\":\"192.168.1.10\",\"referer\":\"http:\\/\\/192.168.1.10\\/kefu\\/php\\/app.php?widget-mobile\",\"userAgent\":\"Mozilla\\/5.0 (Linux; Android 5.1.1; V1923A Build\\/LYZ28N; wv) AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/52.0.2743.100 Mobile Safari\\/537.36\",\"browserName\":\"android\",\"browserVersion\":\"5.1.1\",\"os\":\"android\",\"engine\":\"webkit\",\"language\":\"zh\"}', 'GUEST', '0000-00-00 00:00:00');
INSERT INTO `mirrormx_customer_chat_user` VALUES (8, 'anonymous-1606806220', 'no@e.mail.provided', 'x', '/kefu/upload/default-avatars/a.png', '{\"ip\":\"192.168.1.10\",\"referer\":\"http:\\/\\/192.168.1.10\\/kefu\\/php\\/app.php?widget-mobile\",\"userAgent\":\"Mozilla\\/5.0 (Linux; Android 5.1.1; V1923A Build\\/LYZ28N; wv) AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/52.0.2743.100 Mobile Safari\\/537.36\",\"browserName\":\"android\",\"browserVersion\":\"5.1.1\",\"os\":\"android\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"21\",\"regionName\":\"Liaoning\",\"city\":\"Dalian\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":38.9122,\"longitude\":121.6022,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2020-12-01 07:04:02');
INSERT INTO `mirrormx_customer_chat_user` VALUES (9, 'anonymous-1606807157', 'no@e.mail.provided', 'x', '/kefu/upload/default-avatars/f.png', '{\"ip\":\"192.168.1.10\",\"referer\":\"http:\\/\\/192.168.1.10\\/kefu\\/php\\/app.php?widget-mobile\",\"userAgent\":\"Mozilla\\/5.0 (Linux; Android 5.1.1; V1923A Build\\/LYZ28N; wv) AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/52.0.2743.100 Mobile Safari\\/537.36\",\"browserName\":\"android\",\"browserVersion\":\"5.1.1\",\"os\":\"android\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"21\",\"regionName\":\"Liaoning\",\"city\":\"Dalian\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":38.9122,\"longitude\":121.6022,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2020-12-01 07:22:42');
INSERT INTO `mirrormx_customer_chat_user` VALUES (10, 'anonymous-1606811448', 'no@e.mail.provided', 'x', '/kefu/upload/default-avatars/a.png', '{\"ip\":\"::1\",\"referer\":\"http:\\/\\/localhost\\/kefu\\/php\\/app.php?widget-test\",\"userAgent\":\"Mozilla\\/5.0 (Windows NT 10.0; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/78.0.3904.108 Safari\\/537.36\",\"browserName\":\"chrome\",\"browserVersion\":\"78.0\",\"os\":\"windows\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"21\",\"regionName\":\"Liaoning\",\"city\":\"Dalian\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":38.9122,\"longitude\":121.6022,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '0000-00-00 00:00:00');
INSERT INTO `mirrormx_customer_chat_user` VALUES (11, 'visitor.38858-1606812719', 'no@e.mail.provided', 'x', '/kefu/img/avatar.png', '{\"ip\":\"::1\",\"referer\":\"http:\\/\\/localhost\\/kefu\\/php\\/app.php?widget-test\",\"userAgent\":\"Mozilla\\/5.0 (Windows NT 10.0; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/78.0.3904.108 Safari\\/537.36\",\"browserName\":\"chrome\",\"browserVersion\":\"78.0\",\"os\":\"windows\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"21\",\"regionName\":\"Liaoning\",\"city\":\"Dalian\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":38.9122,\"longitude\":121.6022,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '0000-00-00 00:00:00');
INSERT INTO `mirrormx_customer_chat_user` VALUES (12, 'anonymous-1606812759', 'no@e.mail.provided', 'x', '/kefu/upload/default-avatars/a.png', '{\"ip\":\"::1\",\"referer\":\"http:\\/\\/localhost\\/kefu\\/php\\/app.php?widget-test\",\"userAgent\":\"Mozilla\\/5.0 (Windows NT 10.0; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/78.0.3904.108 Safari\\/537.36\",\"browserName\":\"chrome\",\"browserVersion\":\"78.0\",\"os\":\"windows\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"21\",\"regionName\":\"Liaoning\",\"city\":\"Dalian\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":38.9122,\"longitude\":121.6022,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '0000-00-00 00:00:00');
INSERT INTO `mirrormx_customer_chat_user` VALUES (13, 'anonymous-1606813046', 'no@e.mail.provided', 'x', '/kefu/upload/default-avatars/a.png', '{\"ip\":\"::1\",\"referer\":\"http:\\/\\/localhost\\/kefu\\/php\\/app.php?widget-test\",\"userAgent\":\"Mozilla\\/5.0 (Windows NT 10.0; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/78.0.3904.108 Safari\\/537.36\",\"browserName\":\"chrome\",\"browserVersion\":\"78.0\",\"os\":\"windows\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"21\",\"regionName\":\"Liaoning\",\"city\":\"Dalian\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":38.9122,\"longitude\":121.6022,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2020-12-01 09:05:20');
INSERT INTO `mirrormx_customer_chat_user` VALUES (14, 'test03', 'test03@test.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', NULL, NULL, 'OPERATOR', '2020-12-03 03:16:11');
INSERT INTO `mirrormx_customer_chat_user` VALUES (15, 'test04', 'test04@test.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', NULL, NULL, 'OPERATOR', '2020-12-03 11:15:40');
INSERT INTO `mirrormx_customer_chat_user` VALUES (16, 'test05', 'test05@test.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', NULL, NULL, 'OPERATOR', '2020-12-03 11:15:40');
INSERT INTO `mirrormx_customer_chat_user` VALUES (17, 'test06', 'test06@test.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', NULL, NULL, 'OPERATOR', '2020-12-03 11:15:40');
INSERT INTO `mirrormx_customer_chat_user` VALUES (18, 'test07', 'test07@test.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', NULL, NULL, 'OPERATOR', '2020-12-03 11:15:40');
INSERT INTO `mirrormx_customer_chat_user` VALUES (19, 'test08', 'test08@test.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', NULL, NULL, 'OPERATOR', '2020-12-03 11:15:40');
INSERT INTO `mirrormx_customer_chat_user` VALUES (20, 'test09', 'test09@test.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', NULL, NULL, 'OPERATOR', '2020-12-03 11:15:40');
INSERT INTO `mirrormx_customer_chat_user` VALUES (21, 'test10', 'test10@test.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', NULL, NULL, 'OPERATOR', '2020-12-03 11:15:40');
INSERT INTO `mirrormx_customer_chat_user` VALUES (22, 'test11', 'test11@test.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', NULL, NULL, 'OPERATOR', '2020-12-03 11:15:40');

SET FOREIGN_KEY_CHECKS = 1;

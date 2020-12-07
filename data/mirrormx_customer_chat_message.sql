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

 Date: 05/12/2020 22:14:31
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
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mirrormx_customer_chat_message
-- ----------------------------
INSERT INTO `mirrormx_customer_chat_message` VALUES (1, 2, -1, '', '2020-11-30 09:06:49', 1, '{\"type\":\"talk_start\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (2, 2, -1, '11', '2020-11-30 09:06:50', 1, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (3, 1, -1, '111', '2020-11-30 09:07:14', 1, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (4, -2, -1, '', '2020-11-30 09:07:14', 1, '{\"type\":\"talk_owner\",\"id\":1,\"user\":\"admin\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (5, 2, -1, '222', '2020-11-30 09:07:21', 1, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (6, -2, -1, '', '2020-11-30 09:48:29', 1, '{\"type\":\"talk_close\",\"user\":\"admin\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (7, 3, -1, '', '2020-11-30 10:04:22', 2, '{\"type\":\"talk_start\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (8, 3, -1, '111', '2020-11-30 10:04:23', 2, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (9, 4, -1, '', '2020-11-30 10:04:26', 3, '{\"type\":\"talk_start\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (10, 4, -1, '222', '2020-11-30 10:04:26', 3, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (11, 1, 5, '1231654', '2020-12-01 06:14:32', 4, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (12, 1, -1, '132313', '2020-12-01 06:14:59', 4, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (13, -2, -1, '', '2020-12-01 06:26:22', 4, '{\"type\":\"user_invite\",\"id\":\"6\",\"name\":\"test02\",\"mail\":\"test02@test.com\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (14, 7, -1, '', '2020-12-01 06:31:34', 5, '{\"type\":\"talk_start\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (15, 7, -1, '969', '2020-12-01 06:33:32', 5, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (16, -2, -1, '', '2020-12-01 06:34:00', 5, '{\"type\":\"talk_close\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (17, 1, -1, '121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121112121212112', '2020-12-01 06:45:19', 4, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (18, 1, -1, 'Android APP功能测试包含APP的安装卸载测试，界面测试，业务功能测试，APP特性测试，交叉事件测试，兼容性测试，升级更新测试，消息通知测试，功能键测试，手势测试等 1-APP的安装和卸载 1.1安装 软件在不同操作系统（Android 5.0/Android 6.0/Android 7.0/Android8.0及其他小迭代系统版本）上是否正常安装 软件在不同的品牌手机（华为/三星/OPPO/VIVO等其他品牌手机）上是否正常安装 软件在不同屏幕分辨率/屏幕大小的手机上是否正常安装 第三方平台直接安装（豌豆荚/应用商店/手机助手等），是否正常安装 安装过程中，是否可以取消，点击取消后，写入的文件是否如需求说明处理 安装过程中，提示信息中不能出现代码、符号、乱码等。 安装过程中，意外情况（如死机，重启，断电）的处理是否符合需求 安装时，是否识别有SD卡（存储卡），是否默认安装到sd卡中 安装空间不足（内存或者磁盘空间不足）时是否有相应提示 安装若需要网络验证，弱网或者断网情况下安装是否正常 安装若有具体的安装手册，依照手册安装是否正常安装 安装完成后，是否生成多余的目录结构和文件 首次安装完成后，是否正常启动APP 版本覆盖安装后，是否正常启动APP 1.2卸载 直接删除安装文件夹卸载是否有提示信息，是否正常卸载 直接卸载APP应用程序是否有提示信息，是否正常卸载 卸载过程中，出现的意外情况（如死机、断电、重启）的处理是否符合需求说明 卸载过程中，是否支持取消功能，点击取消后，APP应用程序的卸载是否停止，APP应用程序是否恢复到卸载前状态 卸载过程中，是否有卸载状态进度条提示，进度条显示的进度是否正常 卸载完成后，是否全部删除所有的安装文件夹 第三方卸载，检查是否卸载完全   2-APP的界面测试 用户界面测试英文名为User interface testing，简称UI测试，测试用户界面的功能模块的布局是否合理，整体风格是否一致和各个控件的放置位置是否符合客户使用习惯，更重要的是要符合操作便捷，导航简单易懂，界面中文字是否正确，命名是否统一，页面是否美观，文字、图片组合是否完美等等。 UI测试的内容：包括导航测试、图形测试、内容测试、表格测试、H5界面测试、整体界面测试等 导航测试：导航描述了用户在一个页面内操作的方式，在不同的用户接口控制之间，导航的方式主要有：按钮、目录、菜单、弹框、列表等； 按钮：按钮的可点击的条件，按钮按下的效果，按钮的的跳转引导等，如‘登录’按钮，输入账号和密码才会高亮显示为可点击状态 目录：很多APP会在主页的右侧显示软件内容的目录结构供用户便捷有目的的浏览，也有的软件会放在顶部区域或底部区域，测试显示布局的正确性和跳转的正确性等 菜单：右上角的‘···’一般是隐形的菜单，需要查看这些菜单是可配置的，还是固定的，已经显示文字的长短是否正常，跳转是否正确 弹框：APP包含消息弹框/确认框/信息提示框/表单提交框等等，很多类型的弹框都会引导用户去其他页面，查看弹框中信息显示是否完整，点击不同按钮，是否如需求说明一样正确跳转 列表：APP的列表分页其实不明显，一般不会明确的标示是第几页，但是在服务端是存在分页，查看是否存复用的问题 图形测试：图形包括图片、动画、边框、颜色、字体、背景、按钮等； 横向比较。各控件操作方式是否统一，页面标签风格是否统一 自适应界面设计（屏幕尺寸，屏幕分辨率），图形根据窗口大小自适应 横屏/竖屏测试：游戏/图片/视频均有横竖屏自动切换，很多手机网站也做了横竖屏自适应，观察横屏或者竖屏页面的显示效果 图片、动画、边框、颜色、字体、背景、按钮等动画效果是否符合需求设计 图片或者动画的收起效果是否符合需求设计 图片来源是用户自己上传/本地的/服务端配置的，查看图片在APP端的显示效果 内容测试：内容测试用来检验APP应用程序提供信息的正确性、准确性和相关性。信息的正确性是指信息时可靠的还是误传的。信息的相关性是指是否在当前页面可以找到与当前浏览信息相关的信息列表或入口； 页面显示文案：文案是否表意不明，是否有错别字，是否有敏感性词汇，是否布局和设计一致，是否不同的屏幕尺寸/屏幕分辨率的手机上显示完整，文案来源是本地的还是后台可以配置的，文案的长短是否有限制等 文本输入框：输入框的默认文案是否清楚正确，文字长度是否限制，输入的文字是否有敏感性词汇限制，达到最大长度是否允许继续输入，删除输入的内容是否再显示默认文案，输入过程光标是否一直显示在字的末尾等 按钮上的文案：文案是否在边框内，文案的颜色是否正常，文案在点击效果下是否正常显示，文案在不同的屏幕尺寸/屏幕分辨率的手机上显示是否正常，文案表明意思和实际的操作是否', '2020-12-01 06:45:31', 4, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (19, 1, -1, 'sc.png', '2020-12-01 06:46:59', 4, '{\"type\":\"files\",\"files\":[{\"name\":\"sc.png\",\"size\":590339,\"type\":\"image\\/png\"}]}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (20, 1, -1, ' *-D', '2020-12-01 06:47:43', 4, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (21, 1, -1, '!@#$', '2020-12-01 06:50:50', 4, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (22, 1, -1, '11', '2020-12-01 06:55:56', 4, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (23, 1, -1, '1', '2020-12-01 06:55:58', 4, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (24, 1, -1, '1', '2020-12-01 06:55:59', 4, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (25, 1, -1, '1', '2020-12-01 06:56:01', 4, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (26, 1, -1, '1', '2020-12-01 06:56:02', 4, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (27, 1, -1, 'sc.png', '2020-12-01 06:58:31', 4, '{\"type\":\"files\",\"files\":[{\"name\":\"sc.png\",\"size\":590339,\"type\":\"image\\/png\"}]}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (28, 1, -1, '1', '2020-12-01 07:02:17', 4, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (29, 1, -1, '22', '2020-12-01 07:02:44', 4, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (30, 8, -1, '', '2020-12-01 07:03:40', 6, '{\"type\":\"talk_start\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (31, -2, -1, '', '2020-12-01 07:06:29', 4, '{\"type\":\"user_leave\",\"id\":1,\"name\":\"admin\",\"mail\":\"admin\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (32, 1, -1, '11', '2020-12-01 07:08:00', 4, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (33, 9, -1, '', '2020-12-01 07:19:17', 7, '{\"type\":\"talk_start\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (34, 9, -1, '111', '2020-12-01 07:19:23', 7, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (35, -2, -1, '', '2020-12-01 07:19:48', 7, '{\"type\":\"user_invite\",\"id\":\"1\",\"name\":\"admin\",\"mail\":\"admin\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (36, 5, -1, '222', '2020-12-01 07:20:05', 7, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (37, -2, -1, '', '2020-12-01 07:20:05', 7, '{\"type\":\"talk_owner\",\"id\":5,\"user\":\"test01\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (38, 5, -1, '55993e0210c29e8b1f6c4018823e0e75.mp4', '2020-12-01 07:20:46', 7, '{\"type\":\"files\",\"files\":[{\"name\":\"55993e0210c29e8b1f6c4018823e0e75.mp4\",\"size\":7887152,\"type\":\"video\\/mp4\"}]}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (39, 5, -1, 'JPEG_20201201_152152_28349959810065055.jpg', '2020-12-01 07:21:59', 7, '{\"type\":\"files\",\"files\":[{\"name\":\"JPEG_20201201_152152_28349959810065055.jpg\",\"size\":3102666,\"type\":\"image\\/jpeg\"}]}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (40, 5, -1, '55993e0210c29e8b1f6c4018823e0e75.mp4', '2020-12-01 07:22:27', 4, '{\"type\":\"files\",\"files\":[{\"name\":\"55993e0210c29e8b1f6c4018823e0e75.mp4\",\"size\":7887152,\"type\":\"video\\/mp4\"}]}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (41, 5, -1, '11', '2020-12-01 07:23:01', 4, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (42, 5, -1, 'JPEG_20201201_152306_8838500941556089610.jpg', '2020-12-01 07:23:13', 4, '{\"type\":\"files\",\"files\":[{\"name\":\"JPEG_20201201_152306_8838500941556089610.jpg\",\"size\":2767274,\"type\":\"image\\/jpeg\"}]}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (43, 5, -1, 'mmexport1520927204572.jpg', '2020-12-01 07:23:55', 4, '{\"type\":\"files\",\"files\":[{\"name\":\"mmexport1520927204572.jpg\",\"size\":30408,\"type\":\"image\\/jpeg\"}]}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (44, 5, -1, '55993e0210c29e8b1f6c4018823e0e75.mp4', '2020-12-01 07:24:44', 4, '{\"type\":\"files\",\"files\":[{\"name\":\"55993e0210c29e8b1f6c4018823e0e75.mp4\",\"size\":7887152,\"type\":\"video\\/mp4\"}]}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (45, 5, -1, 'pt2020_10_24_18_49_51.jpg', '2020-12-01 07:25:11', 4, '{\"type\":\"files\",\"files\":[{\"name\":\"pt2020_10_24_18_49_51.jpg\",\"size\":1766206,\"type\":\"image\\/jpeg\"}]}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (46, 5, -1, '27c30c75a6634c1b6c6caa33703a52a2.mp4', '2020-12-01 07:26:20', 4, '{\"type\":\"files\",\"files\":[{\"name\":\"27c30c75a6634c1b6c6caa33703a52a2.mp4\",\"size\":23337009,\"type\":\"video\\/mp4\"}]}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (47, 5, -1, '6c5a2d954515c646199877eded3394af.mp4', '2020-12-01 07:27:55', 4, '{\"type\":\"files\",\"files\":[{\"name\":\"6c5a2d954515c646199877eded3394af.mp4\",\"size\":1548166,\"type\":\"video\\/mp4\"}]}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (48, 5, -1, '69fa7831cf6e7d1_wm.mp4', '2020-12-01 07:28:57', 4, '{\"type\":\"files\",\"files\":[{\"name\":\"69fa7831cf6e7d1_wm.mp4\",\"size\":32320808,\"type\":\"video\\/mp4\"}]}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (49, 5, -1, 'IMG_20201130_104831.jpg', '2020-12-01 07:43:14', 4, '{\"type\":\"files\",\"files\":[{\"name\":\"IMG_20201130_104831.jpg\",\"size\":4429696,\"type\":\"image\\/jpeg\"}]}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (50, 10, -1, '', '2020-12-01 08:30:48', 8, '{\"type\":\"talk_start\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (51, 10, -1, '111', '2020-12-01 08:30:56', 8, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (52, 10, -1, 'aa', '2020-12-01 08:42:28', 8, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (53, 10, -1, '啦啦啦啦啦', '2020-12-01 08:42:45', 8, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (54, 10, -1, '！@#￥￥￥  ￥', '2020-12-01 08:43:09', 8, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (55, 5, -1, 'dd', '2020-12-01 08:43:42', 8, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (56, -2, -1, '', '2020-12-01 08:43:42', 8, '{\"type\":\"talk_owner\",\"id\":5,\"user\":\"test01\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (57, 10, -1, '下载.jpg', '2020-12-01 08:46:45', 8, '{\"type\":\"files\",\"files\":[{\"name\":\"\\u4e0b\\u8f7d.jpg\",\"size\":16203,\"type\":\"image\\/jpeg\"}]}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (58, 10, -1, ';-D', '2020-12-01 08:47:14', 8, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (59, -2, -1, '', '2020-12-01 08:49:28', 8, '{\"type\":\"user_invite\",\"id\":\"1\",\"name\":\"admin\",\"mail\":\"admin\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (60, 1, -1, '2563', '2020-12-01 08:49:44', 8, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (61, -2, -1, '', '2020-12-01 08:50:10', 8, '{\"type\":\"user_leave\",\"id\":1,\"name\":\"admin\",\"mail\":\"admin\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (62, -2, -1, '', '2020-12-01 08:50:35', 8, '{\"type\":\"talk_close\",\"user\":\"test01\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (63, -2, -1, '', '2020-12-01 08:50:39', 8, '{\"type\":\"talk_close\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (64, 11, -1, '', '2020-12-01 08:52:00', 9, '{\"type\":\"talk_start\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (65, 5, -1, 'qq', '2020-12-01 08:52:20', 9, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (66, -2, -1, '', '2020-12-01 08:52:20', 9, '{\"type\":\"talk_owner\",\"id\":5,\"user\":\"test01\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (67, -2, -1, '', '2020-12-01 08:52:34', 9, '{\"type\":\"talk_close\",\"user\":\"test01\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (68, -2, -1, '', '2020-12-01 08:52:34', 9, '{\"type\":\"talk_close\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (69, 12, -1, '', '2020-12-01 08:52:40', 10, '{\"type\":\"talk_start\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (70, 12, -1, '555', '2020-12-01 08:52:43', 10, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (71, 12, -1, '654', '2020-12-01 08:54:56', 10, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (72, -2, -1, '', '2020-12-01 08:56:03', 10, '{\"type\":\"talk_close\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (73, 13, -1, '', '2020-12-01 08:57:26', 11, '{\"type\":\"talk_start\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (74, 13, -1, '999', '2020-12-01 08:57:30', 11, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (75, 5, -1, '888', '2020-12-01 08:57:41', 11, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (76, -2, -1, '', '2020-12-01 08:57:41', 11, '{\"type\":\"talk_owner\",\"id\":5,\"user\":\"test01\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (77, 13, -1, '23', '2020-12-01 09:01:52', 11, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (78, 13, -1, '66', '2020-12-01 09:01:58', 11, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (79, 13, -1, '啦啦啦', '2020-12-01 09:02:40', 11, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (80, 13, -1, '55', '2020-12-01 09:03:05', 11, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (81, 13, -1, '99', '2020-12-01 09:03:59', 11, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (82, 13, -1, '来啦', '2020-12-01 09:04:22', 11, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (83, 15, 14, '我是04发给03，测试对话1', '2020-12-03 18:43:07', 12, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (84, 14, -1, '我是03发给04，测试对话1', '2020-12-03 18:43:27', 12, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (85, 15, 16, '我是04发给05，测试对话2', '2020-12-03 18:58:38', 13, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (86, 16, -1, '我是05发给04，测试对话2', '2020-12-03 18:58:51', 13, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (87, 14, 16, '123', '2020-12-04 19:42:35', 14, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (88, 16, -1, '213', '2020-12-04 19:44:28', 14, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (89, -2, -1, '', '2020-12-04 19:54:33', 14, '{\"type\":\"user_leave\",\"id\":16,\"name\":\"test05\",\"mail\":\"test05@test.com\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (90, -2, -1, '', '2020-12-04 19:54:50', 14, '{\"type\":\"user_leave\",\"id\":14,\"name\":\"test03\",\"mail\":\"test03@test.com\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (91, 14, 16, '我是03，发给05,这是一条测试信息', '2020-12-04 20:08:34', 14, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (92, 14, -1, '我是03，发给05,这是一条测试信息', '2020-12-04 20:14:08', 14, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (93, 14, -1, '我是03，发给05,这是一条测试信息', '2020-12-04 20:16:55', 14, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (94, 14, -1, '我是03，发给05,这是一条测试信息', '2020-12-04 20:21:36', 14, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (95, 14, 15, '我是03，发给04,这是一条测试信息', '2020-12-04 20:21:43', 15, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (96, 14, -1, '我是03，发给05,这是一条测试信息', '2020-12-04 20:25:02', 14, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (97, 14, -1, '我是03，发给04,这是一条测试信息', '2020-12-04 20:25:11', 15, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (98, 14, -1, '我是03，发给05,这是一条测试信息', '2020-12-04 20:33:35', 14, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (99, 14, -1, '我是03，发给04,这是一条测试信息', '2020-12-04 20:33:43', 15, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (100, 14, -1, '我是03，发给05,这是一条测试信息', '2020-12-04 20:39:01', 14, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (101, 14, -1, '我是03，发给04,这是一条测试信息', '2020-12-04 20:39:09', 15, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (102, 14, -1, '我是03，发给05,这是一条测试信息', '2020-12-04 20:41:35', 14, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (103, 14, -1, '我是03，发给04,这是一条测试信息', '2020-12-04 20:41:44', 15, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (104, 14, -1, '我是03，发给05,这是一条测试信息', '2020-12-04 20:44:58', 14, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (105, 14, -1, '我是03，发给04,这是一条测试信息', '2020-12-04 20:45:06', 15, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (106, 15, -1, '我是04，收到03的一条测试信息', '2020-12-04 20:45:16', 15, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (107, 14, -1, '我是03，发给05,这是一条测试信息', '2020-12-04 20:48:51', 14, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (108, 14, -1, '我是03，发给04,这是一条测试信息', '2020-12-04 20:49:00', 15, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (109, 15, -1, '我是04，收到03的一条测试信息', '2020-12-04 20:49:11', 15, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (110, 14, -1, '我是03，发给05,这是一条测试信息', '2020-12-04 20:52:31', 14, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (111, 14, -1, '我是03，发给04,这是一条测试信息', '2020-12-04 20:52:40', 15, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (112, 15, -1, '我是04，收到03的一条测试信息', '2020-12-04 20:52:51', 15, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (113, 14, -1, '我是03，发给05,这是一条测试信息', '2020-12-05 09:31:19', 14, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (114, 14, -1, '我是03，发给05,这是一条测试信息', '2020-12-05 09:50:15', 14, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (115, 14, 15, '我是03，发给04,这是一条测试信息', '2020-12-05 09:50:23', 16, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (116, 15, -1, '我是04，收到03的一条测试信息', '2020-12-05 09:50:45', 15, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (117, 14, -1, '我是03，发给05,这是一条测试信息', '2020-12-05 09:53:58', 14, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (118, 14, -1, '我是03，发给04,这是一条测试信息', '2020-12-05 09:54:06', 16, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (119, 15, -1, '我是04，收到03的一条测试信息', '2020-12-05 09:54:29', 15, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (120, 14, -1, '我是03，发给05,这是一条测试信息', '2020-12-05 10:00:19', 14, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (121, 14, -1, '我是03，发给04,这是一条测试信息', '2020-12-05 10:00:28', 16, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (122, 15, -1, '我是04，收到03的一条测试信息', '2020-12-05 10:01:07', 15, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (123, -2, -1, '', '2020-12-05 10:02:08', 16, '{\"type\":\"user_leave\",\"id\":15,\"name\":\"test04\",\"mail\":\"test04@test.com\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES (124, 14, -1, '我是03，发给05,这是一条测试信息', '2020-12-05 10:05:20', 14, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (125, 14, -1, '我是03，发给04,这是一条测试信息', '2020-12-05 10:05:29', 16, NULL);
INSERT INTO `mirrormx_customer_chat_message` VALUES (126, 15, -1, '我是04，收到03的一条测试信息', '2020-12-05 10:06:09', 16, NULL);

SET FOREIGN_KEY_CHECKS = 1;

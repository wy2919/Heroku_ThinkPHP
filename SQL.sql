/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : 20210909ditanshequ

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 30/09/2021 09:25:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qx_activity
-- ----------------------------
DROP TABLE IF EXISTS `qx_activity`;
CREATE TABLE `qx_activity`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动标题',
  `img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `brief` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动简介 小标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动详情',
  `begin` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动开始时间',
  `jifen` int NULL DEFAULT 0 COMMENT '用户参与该活动获得的积分',
  `finish` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动结束时间',
  `site` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动地址',
  `linkman` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `phone` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `gmail` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人邮箱',
  `recruitment` int NULL DEFAULT 0 COMMENT '招募人数',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社区活动' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qx_activity
-- ----------------------------
INSERT INTO `qx_activity` VALUES (1, '马拉松比赛', '/uploads/20210910/b2efd37a8ffd6f57569e8b3d972ffaad.jpg', '简介简介简介', '马拉松是1999年', '1629510300', 20, '1631592000', '火炬公园', '王洋', '17440595584', '19394959559@qwe', 100, NULL, 1631770214);
INSERT INTO `qx_activity` VALUES (4, '羽毛球比赛', '/uploads/20210910/b2efd37a8ffd6f57569e8b3d972ffaad.jpg', '简介简介简介', '马拉松是1999年', '1628473500', 30, '1632542400', '火炬公园', '王洋', '17440595584', '19394959559@qwe', 100, NULL, 1631502680);

-- ----------------------------
-- Table structure for qx_answer
-- ----------------------------
DROP TABLE IF EXISTS `qx_answer`;
CREATE TABLE `qx_answer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目名称',
  `jifen` int NULL DEFAULT NULL COMMENT '答对该题目的积分',
  `difficulty` int NULL DEFAULT 3 COMMENT '难度',
  `A` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项1',
  `B` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项2',
  `C` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项3',
  `D` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项4',
  `answer` int NULL DEFAULT NULL COMMENT '答案 选项序号',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '答题题库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qx_answer
-- ----------------------------
INSERT INTO `qx_answer` VALUES (4, '测试测试', 32, 6, '选项1', '选项2', '选项3', '', 2, 1631759567, 1631759567);
INSERT INTO `qx_answer` VALUES (5, '11', 1, 1, '1', '1', '1', '1', 4, 1631763342, 1631763342);

-- ----------------------------
-- Table structure for qx_apply
-- ----------------------------
DROP TABLE IF EXISTS `qx_apply`;
CREATE TABLE `qx_apply`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int NULL DEFAULT NULL COMMENT '用户id',
  `cid` int NULL DEFAULT NULL COMMENT '比赛id',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成的二维码',
  `state` int NULL DEFAULT 1 COMMENT '1未打卡 2完成',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社区线下活动报名' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qx_apply
-- ----------------------------
INSERT INTO `qx_apply` VALUES (16, 4, 4, '/QR/0.37235900 1631515403.png', 2, 1631515403, 1631515771);
INSERT INTO `qx_apply` VALUES (22, 7, 4, '/QR/0.61705400 1631773133.png', 2, 1631773133, 1631780302);

-- ----------------------------
-- Table structure for qx_article
-- ----------------------------
DROP TABLE IF EXISTS `qx_article`;
CREATE TABLE `qx_article`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章缩略图 和 视频封面',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  `video` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频地址',
  `duration` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频时长',
  `jifen` int NULL DEFAULT 0 COMMENT '浏览此篇文章增加的积分',
  `types` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类',
  `type` int NULL DEFAULT NULL COMMENT '1文章 2视频',
  `browse` int NULL DEFAULT 0 COMMENT '浏览量',
  `praise` int NULL DEFAULT 0 COMMENT '点赞数量',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章和视频' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qx_article
-- ----------------------------
INSERT INTO `qx_article` VALUES (3, '标题', '/uploads/20210909/0d1969de2883ef7efbd9cc9208f1ff0d.jpg', '<p>内容内容内容</p>', NULL, '10.23', 0, '14', 1, 3, 4, NULL, 1632278762);
INSERT INTO `qx_article` VALUES (15, '标题', '/uploads/20210909/8a36fad32ee628e6b39f1c63efd6bef2.jpg', NULL, '/uploads/20210909/f31790e3f8c99ca0e70ca381b2590d2b.mp4', '00:01:35', 0, '11', 2, 11, 11, 1631173954, 1631177716);
INSERT INTO `qx_article` VALUES (16, '111', '/uploads/20210909/7e6574cb0c234f163c9f6368f07fe425.jpg', NULL, '/uploads/20210909/53f301125386f52b9ea08b289da41797.mp4', '00:00:10', 0, '11,14', 2, 111, 111, 1631177782, 1631177788);
INSERT INTO `qx_article` VALUES (17, '1', '', NULL, '', '0', 0, '', 2, 1, 1, 1631177794, 1631177794);
INSERT INTO `qx_article` VALUES (18, '12', '/uploads/20210909/af22fa2b371840725e81306f6705b3e7.jpg', '<p>11111</p><p><img src=\"/ueditor/php/upload/image/20210922/1632277769996105.jpg\" title=\"1632277769996105.jpg\" alt=\"hop-6327065_1920.jpg\"/></p><p>dawd</p><p>aw</p><p><br/></p><p><img src=\"/ueditor/php/upload/image/20210922/1632277732336950.jpg\" title=\"1632277732336950.jpg\" alt=\"beach-6514331_1920.jpg\"/></p>', NULL, NULL, 0, '11', 1, 12, 12, 1631178449, 1632277906);
INSERT INTO `qx_article` VALUES (20, '123', '/uploads/20210911/122f76e221e1b6a796e65b34997cd863.jpg', '<p>AWdhawndaddaa11111111111111</p>', NULL, NULL, 0, '14', 1, 112, 112, 1631324064, 1631324153);

-- ----------------------------
-- Table structure for qx_audit
-- ----------------------------
DROP TABLE IF EXISTS `qx_audit`;
CREATE TABLE `qx_audit`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题',
  `pid` int NULL DEFAULT NULL COMMENT '比赛id',
  `mid` int NULL DEFAULT NULL COMMENT '发布的用户',
  `state` int NULL DEFAULT 1 COMMENT '1待审核 2通过',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `imgs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `browse` int NULL DEFAULT 0 COMMENT '浏览量',
  `praise` int NULL DEFAULT 0 COMMENT '点赞数量',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '比赛用户发布文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qx_audit
-- ----------------------------
INSERT INTO `qx_audit` VALUES (6, '文章标题标题标题标题', '', 2, 7, 2, '内容内容内容内容', 'http://ditanshequ.com//uploads/20210922/40f4a486a65f4037505abf239c7b551d.jpg,http://ditanshequ.com//uploads/20210922/30e5c34e7294e4f312059461ca39fa2f.jpg', 1, 1, 1632271348, 1632271405);

-- ----------------------------
-- Table structure for qx_commodity
-- ----------------------------
DROP TABLE IF EXISTS `qx_commodity`;
CREATE TABLE `qx_commodity`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int NULL DEFAULT 1 COMMENT '1管理员 发布人',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `jifen` int NULL DEFAULT NULL COMMENT '所需积分',
  `state` int NULL DEFAULT 0 COMMENT '0还有库存 1无货',
  `site` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `imgs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品轮播图片',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面缩略图',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `inventory` int NULL DEFAULT 1 COMMENT '库存',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qx_commodity
-- ----------------------------
INSERT INTO `qx_commodity` VALUES (8, 1, '商品1', 6, 0, '11111', '/uploads/20210911/77bf6833e88cebc71b8cb1b34f8b8266.jpg,/uploads/20210911/6f66b8eacff0c4b7c17cb1444ad62e4e.jpg,/uploads/20210911/deb1efc0c32dfc1ba1c2c881cc399840.jpg', '/uploads/20210910/3cb06dcebe0ead569647c160c7219c54.jpg', '11', 0, 1631260623, 1631320851);
INSERT INTO `qx_commodity` VALUES (9, 1, '商品1', 5, 0, '11111', '/uploads/20210911/77bf6833e88cebc71b8cb1b34f8b8266.jpg,/uploads/20210911/6f66b8eacff0c4b7c17cb1444ad62e4e.jpg,/uploads/20210911/deb1efc0c32dfc1ba1c2c881cc399840.jpg', '/uploads/20210910/3cb06dcebe0ead569647c160c7219c54.jpg', '11', 0, 1631260623, 1631320851);
INSERT INTO `qx_commodity` VALUES (10, 1, '商品1', 4, 0, '11111', '/uploads/20210911/77bf6833e88cebc71b8cb1b34f8b8266.jpg,/uploads/20210911/6f66b8eacff0c4b7c17cb1444ad62e4e.jpg,/uploads/20210911/deb1efc0c32dfc1ba1c2c881cc399840.jpg', '/uploads/20210910/3cb06dcebe0ead569647c160c7219c54.jpg', '11', 0, 1631260623, 1631320851);
INSERT INTO `qx_commodity` VALUES (11, 1, '商品1', 3, 0, '11111', '/uploads/20210911/77bf6833e88cebc71b8cb1b34f8b8266.jpg,/uploads/20210911/6f66b8eacff0c4b7c17cb1444ad62e4e.jpg,/uploads/20210911/deb1efc0c32dfc1ba1c2c881cc399840.jpg', '/uploads/20210910/3cb06dcebe0ead569647c160c7219c54.jpg', '11', 0, 1631260623, 1631320851);
INSERT INTO `qx_commodity` VALUES (12, 1, '商品1', 2, 0, '11111', '/uploads/20210911/77bf6833e88cebc71b8cb1b34f8b8266.jpg,/uploads/20210911/6f66b8eacff0c4b7c17cb1444ad62e4e.jpg,/uploads/20210911/deb1efc0c32dfc1ba1c2c881cc399840.jpg', '/uploads/20210910/3cb06dcebe0ead569647c160c7219c54.jpg', '11', 0, 1631260623, 1631320851);
INSERT INTO `qx_commodity` VALUES (13, 1, '商品1', 1, 0, '11111', '/uploads/20210911/77bf6833e88cebc71b8cb1b34f8b8266.jpg,/uploads/20210911/6f66b8eacff0c4b7c17cb1444ad62e4e.jpg,/uploads/20210911/deb1efc0c32dfc1ba1c2c881cc399840.jpg', '/uploads/20210910/3cb06dcebe0ead569647c160c7219c54.jpg', '11', 0, 1631260623, 1631320851);
INSERT INTO `qx_commodity` VALUES (14, 1, '豆浆机', 200, 0, '11111', '/uploads/20210911/77bf6833e88cebc71b8cb1b34f8b8266.jpg,/uploads/20210911/6f66b8eacff0c4b7c17cb1444ad62e4e.jpg,/uploads/20210911/deb1efc0c32dfc1ba1c2c881cc399840.jpg', '/uploads/20210910/3cb06dcebe0ead569647c160c7219c54.jpg', '11', 0, 1631260623, 1631350847);
INSERT INTO `qx_commodity` VALUES (15, 4, '乒乓球', 15, 0, 'xxxx小区', '/uploads/20210911/77bf6833e88cebc71b8cb1b34f8b8266.jpg,/uploads/20210911/6f66b8eacff0c4b7c17cb1444ad62e4e.jpg,/uploads/20210911/deb1efc0c32dfc1ba1c2c881cc399840.jpg', '/uploads/20210910/3cb06dcebe0ead569647c160c7219c54.jpg', '商品商品商品商品商品', 9, 1631588186, 1631950222);

-- ----------------------------
-- Table structure for qx_dianzan
-- ----------------------------
DROP TABLE IF EXISTS `qx_dianzan`;
CREATE TABLE `qx_dianzan`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '点赞id',
  `mid` int NULL DEFAULT NULL COMMENT '用户id 或者评论id',
  `aid` int NULL DEFAULT NULL COMMENT '文章id',
  `type` int NULL DEFAULT NULL COMMENT '1文章点赞 2文章浏览 3评论点赞  4比赛文章点赞 5生活分享文章点赞  6比赛文章浏览  7生活分享文章点浏览 8答题 ',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 439 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qx_dianzan
-- ----------------------------
INSERT INTO `qx_dianzan` VALUES (317, 4, 3, 1, 1631524932, 1631524932);
INSERT INTO `qx_dianzan` VALUES (318, 4, 3, 2, 1631525010, 1631525010);
INSERT INTO `qx_dianzan` VALUES (340, 7, 4, 8, 1631865809, 1631865809);
INSERT INTO `qx_dianzan` VALUES (341, 7, 5, 8, 1631865824, 1631865824);
INSERT INTO `qx_dianzan` VALUES (371, 7, 4, 4, 1631952091, 1631952091);
INSERT INTO `qx_dianzan` VALUES (380, 7, 114, 3, 1631955261, 1631955261);
INSERT INTO `qx_dianzan` VALUES (384, 7, 124, 3, 1631956375, 1631956375);
INSERT INTO `qx_dianzan` VALUES (385, 7, 4, 6, 1631956544, 1631956544);
INSERT INTO `qx_dianzan` VALUES (386, 7, 1, 6, 1631956553, 1631956553);
INSERT INTO `qx_dianzan` VALUES (387, 7, 5, 4, 1631957760, 1631957760);
INSERT INTO `qx_dianzan` VALUES (388, 7, 5, 6, 1631957773, 1631957773);
INSERT INTO `qx_dianzan` VALUES (389, 7, 126, 3, 1631957784, 1631957784);
INSERT INTO `qx_dianzan` VALUES (392, 7, 127, 3, 1631957811, 1631957811);
INSERT INTO `qx_dianzan` VALUES (393, 7, 6, 4, 1632271494, 1632271494);
INSERT INTO `qx_dianzan` VALUES (394, 7, 7, 4, 1632271639, 1632271639);
INSERT INTO `qx_dianzan` VALUES (398, 7, 1, 7, 1632273747, 1632273747);
INSERT INTO `qx_dianzan` VALUES (402, 7, 116, 3, 1632274283, 1632274283);
INSERT INTO `qx_dianzan` VALUES (405, 7, 128, 3, 1632274396, 1632274396);
INSERT INTO `qx_dianzan` VALUES (406, 7, 1, 4, 1632274532, 1632274532);
INSERT INTO `qx_dianzan` VALUES (407, 7, 3, 7, 1632275121, 1632275121);
INSERT INTO `qx_dianzan` VALUES (410, 7, 3, 4, 1632275322, 1632275322);
INSERT INTO `qx_dianzan` VALUES (415, 7, 1, 5, 1632275360, 1632275360);
INSERT INTO `qx_dianzan` VALUES (426, 7, 3, 5, 1632275946, 1632275946);
INSERT INTO `qx_dianzan` VALUES (427, 7, 20, 7, 1632277387, 1632277387);
INSERT INTO `qx_dianzan` VALUES (428, 7, 18, 7, 1632277558, 1632277558);
INSERT INTO `qx_dianzan` VALUES (429, 7, 20, 2, 1632278012, 1632278012);
INSERT INTO `qx_dianzan` VALUES (430, 7, 18, 2, 1632278014, 1632278014);
INSERT INTO `qx_dianzan` VALUES (431, 7, 3, 2, 1632278030, 1632278030);
INSERT INTO `qx_dianzan` VALUES (432, 7, 18, 4, 1632278604, 1632278604);
INSERT INTO `qx_dianzan` VALUES (433, 7, 20, 4, 1632278620, 1632278620);
INSERT INTO `qx_dianzan` VALUES (434, 7, 20, 1, 1632278699, 1632278699);
INSERT INTO `qx_dianzan` VALUES (436, 7, 130, 3, 1632278740, 1632278740);
INSERT INTO `qx_dianzan` VALUES (438, 7, 18, 1, 1632279172, 1632279172);

-- ----------------------------
-- Table structure for qx_exercise
-- ----------------------------
DROP TABLE IF EXISTS `qx_exercise`;
CREATE TABLE `qx_exercise`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int NULL DEFAULT NULL COMMENT '用户',
  `num` int NULL DEFAULT 0 COMMENT '步数',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运动记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qx_exercise
-- ----------------------------
INSERT INTO `qx_exercise` VALUES (6, 7, 1007, 1631602518, 1631602518);
INSERT INTO `qx_exercise` VALUES (7, 7, 1061, 1631667676, 1631691284);
INSERT INTO `qx_exercise` VALUES (8, 7, 927, 1631752455, 1631769778);
INSERT INTO `qx_exercise` VALUES (9, 7, 1000, 1631845568, 1631869338);
INSERT INTO `qx_exercise` VALUES (10, 7, 1000, 1631930935, 1631955634);
INSERT INTO `qx_exercise` VALUES (11, 7, 0, 1632270785, 1632270785);

-- ----------------------------
-- Table structure for qx_game
-- ----------------------------
DROP TABLE IF EXISTS `qx_game`;
CREATE TABLE `qx_game`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `subheading` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类',
  `img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比赛缩略图',
  `introduce` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '比赛介绍',
  `rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '比赛规则',
  `begin` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动开始时间',
  `finish` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动结束时间',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '比赛' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qx_game
-- ----------------------------
INSERT INTO `qx_game` VALUES (1, '文章征集', '大气中', '11', '/uploads/20210910/be330c55adbc2c20724daf436e9613ba.jpg', '介绍介绍', '规则规则', '1610582400', '1632973617', NULL, 1631936822);
INSERT INTO `qx_game` VALUES (2, '111', '111', '14', '/uploads/20210910/22fcdab85fb0f8be41177c4d1a99a5d0.jpg', 'gfvx', 'awdawd', '1630468800', '1632938644', 1631253766, 1631580535);

-- ----------------------------
-- Table structure for qx_jifenlog
-- ----------------------------
DROP TABLE IF EXISTS `qx_jifenlog`;
CREATE TABLE `qx_jifenlog`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int NULL DEFAULT NULL COMMENT '用户id',
  `jifen` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分数量',
  `state` int NULL DEFAULT 1 COMMENT '1临时积分未领取 2已领取',
  `type` int NULL DEFAULT NULL COMMENT '0减 1加',
  `classify` int NULL DEFAULT NULL COMMENT '1每日一题 2社区活动 3课堂学习 4分享 5步数 6积分兑换 7发布商品',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qx_jifenlog
-- ----------------------------
INSERT INTO `qx_jifenlog` VALUES (22, 7, 15.00, 2, 1, 7, 1631698363, 1631756927);
INSERT INTO `qx_jifenlog` VALUES (23, 7, 16.00, 2, 1, 7, 1631698363, 1631756867);
INSERT INTO `qx_jifenlog` VALUES (24, 7, 17.00, 2, 1, 7, 1631698363, 1631762535);
INSERT INTO `qx_jifenlog` VALUES (25, 7, 32.00, 2, 1, 1, 1631762914, 1631762983);
INSERT INTO `qx_jifenlog` VALUES (26, 7, 32.00, 2, 1, 1, 1631763036, 1631763041);
INSERT INTO `qx_jifenlog` VALUES (27, 7, 32.00, 2, 1, 1, 1631763061, 1631763083);
INSERT INTO `qx_jifenlog` VALUES (28, 7, 1.00, 2, 1, 1, 1631763355, 1631763627);
INSERT INTO `qx_jifenlog` VALUES (29, 7, 1.00, 2, 1, 1, 1631763443, 1631763629);
INSERT INTO `qx_jifenlog` VALUES (30, 7, 1.00, 2, 1, 1, 1631763459, 1631763629);
INSERT INTO `qx_jifenlog` VALUES (31, 7, 1.00, 2, 1, 1, 1631763496, 1631763628);
INSERT INTO `qx_jifenlog` VALUES (32, 7, 1.00, 2, 1, 1, 1631763553, 1631763628);
INSERT INTO `qx_jifenlog` VALUES (33, 7, 30.00, 2, 1, 2, 1631780302, 1631780323);
INSERT INTO `qx_jifenlog` VALUES (34, 1, 200.00, 1, 1, 7, 1631864488, 1631864488);
INSERT INTO `qx_jifenlog` VALUES (35, 7, 1.01, 2, 1, 1, 1631865824, 1631950423);
INSERT INTO `qx_jifenlog` VALUES (36, 7, 0.10, 2, 1, 3, 1631951443, 1631951451);
INSERT INTO `qx_jifenlog` VALUES (37, 4, 0.50, 1, 1, 3, 1631951858, 1631951858);
INSERT INTO `qx_jifenlog` VALUES (38, 4, 0.50, 1, 1, 3, 1631951894, 1631951894);
INSERT INTO `qx_jifenlog` VALUES (39, 7, 0.10, 2, 1, 3, 1631951955, 1631951976);
INSERT INTO `qx_jifenlog` VALUES (40, 4, 0.50, 1, 1, 3, 1631951955, 1631951955);
INSERT INTO `qx_jifenlog` VALUES (41, 7, 0.10, 2, 1, 3, 1631952012, 1631952037);
INSERT INTO `qx_jifenlog` VALUES (42, 7, 0.50, 2, 1, 3, 1631952012, 1631952038);
INSERT INTO `qx_jifenlog` VALUES (43, 7, 0.10, 2, 1, 3, 1631952091, 1631952114);
INSERT INTO `qx_jifenlog` VALUES (44, 4, 0.50, 1, 1, 3, 1631952091, 1631952091);
INSERT INTO `qx_jifenlog` VALUES (45, 7, 0.10, 2, 1, 3, 1631957760, 1631957819);
INSERT INTO `qx_jifenlog` VALUES (46, 7, 0.50, 2, 1, 3, 1631957760, 1631957819);
INSERT INTO `qx_jifenlog` VALUES (47, 7, 0.10, 2, 1, 3, 1632271494, 1632271500);
INSERT INTO `qx_jifenlog` VALUES (48, 7, 0.50, 2, 1, 3, 1632271494, 1632271502);
INSERT INTO `qx_jifenlog` VALUES (49, 7, 0.10, 2, 1, 3, 1632271639, 1632271642);
INSERT INTO `qx_jifenlog` VALUES (50, 7, 0.50, 2, 1, 3, 1632271639, 1632271644);
INSERT INTO `qx_jifenlog` VALUES (51, 7, 0.10, 2, 1, 3, 1632273002, 1632273028);
INSERT INTO `qx_jifenlog` VALUES (53, 7, 0.10, 2, 1, 3, 1632275140, 1632275143);
INSERT INTO `qx_jifenlog` VALUES (55, 7, 0.10, 2, 1, 3, 1632275322, 1632275332);
INSERT INTO `qx_jifenlog` VALUES (59, 7, 0.10, 2, 1, 3, 1632275492, 1632275501);
INSERT INTO `qx_jifenlog` VALUES (61, 7, 0.10, 2, 1, 3, 1632275731, 1632275735);
INSERT INTO `qx_jifenlog` VALUES (62, 7, 0.10, 2, 1, 3, 1632275731, 1632275734);
INSERT INTO `qx_jifenlog` VALUES (63, 7, 0.10, 2, 1, 3, 1632275787, 1632275898);
INSERT INTO `qx_jifenlog` VALUES (64, 7, 0.10, 2, 1, 3, 1632275787, 1632275809);
INSERT INTO `qx_jifenlog` VALUES (65, 7, 0.10, 2, 1, 3, 1632275946, 1632275956);
INSERT INTO `qx_jifenlog` VALUES (66, 7, 0.10, 2, 1, 3, 1632275946, 1632275951);
INSERT INTO `qx_jifenlog` VALUES (67, 7, 0.10, 2, 1, 3, 1632278604, 1632278734);
INSERT INTO `qx_jifenlog` VALUES (68, NULL, 0.50, 1, 1, 3, 1632278604, 1632278604);
INSERT INTO `qx_jifenlog` VALUES (69, 7, 0.10, 2, 1, 3, 1632278620, 1632278735);
INSERT INTO `qx_jifenlog` VALUES (70, NULL, 0.50, 1, 1, 3, 1632278620, 1632278620);
INSERT INTO `qx_jifenlog` VALUES (71, 4, 15.00, 1, 1, 7, 1632279932, 1632279932);

-- ----------------------------
-- Table structure for qx_member
-- ----------------------------
DROP TABLE IF EXISTS `qx_member`;
CREATE TABLE `qx_member`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户openid',
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名昵称',
  `brithday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `invit_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `myinvit_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '我的邀请码',
  `administrator` int NULL DEFAULT 2 COMMENT '2普通用户 1管理员',
  `des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `jifen` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '积分',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  `forbidden` int NULL DEFAULT 2 COMMENT '2正常 1禁用',
  `z_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实名认证姓名',
  `z_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实名认证手机号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qx_member
-- ----------------------------
INSERT INTO `qx_member` VALUES (1, '1', '/uploads/20210911/0604d1900162a239fc85172189574920.jfif', '默认管理员', NULL, NULL, NULL, 2, NULL, 1.00, NULL, 1631323110, 2, '默认管理员', '17550498832');
INSERT INTO `qx_member` VALUES (4, 'oP6QU0WZnPzz5QwBhwqEObnJrdXQ', '/uploads/20210916/cec08f45ffe39fb674f20fe92d774cfe.jpg', '用户1', '0', NULL, NULL, 2, NULL, 140.00, 1628062493, 1631780811, 2, '姓名', '17449586653');
INSERT INTO `qx_member` VALUES (7, 'oP6QU0YHB2agZA8nEgUXlDQI8-jg', 'http://ditanshequ.com//uploads/20210922/fc66a0fc92d57e252775d1d1a9f89d01.jfif', '哈', NULL, NULL, NULL, 1, NULL, 5.22, 1631329317, 1632282471, 2, '王先生', '17888888888');

-- ----------------------------
-- Table structure for qx_order
-- ----------------------------
DROP TABLE IF EXISTS `qx_order`;
CREATE TABLE `qx_order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int NULL DEFAULT NULL COMMENT '用户id',
  `jifen` int NULL DEFAULT NULL COMMENT '积分',
  `pid` int NULL DEFAULT NULL COMMENT '商品发布人',
  `cid` int NULL DEFAULT NULL COMMENT '商品',
  `hid` int NULL DEFAULT NULL COMMENT '核销管理员',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单生成的二维码',
  `state` int NULL DEFAULT 1 COMMENT '1已兑换待取货 2完成',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单用户兑换' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qx_order
-- ----------------------------
INSERT INTO `qx_order` VALUES (8, 7, NULL, NULL, 14, NULL, '/QR/0.08442600 1631348743.png', 1, 1631348743, 1631348743);
INSERT INTO `qx_order` VALUES (12, 7, NULL, NULL, 14, NULL, '/QR/0.99442600 1631350881.png', 1, 1631350881, 1631350881);
INSERT INTO `qx_order` VALUES (13, 7, NULL, NULL, 14, NULL, '/QR/0.61032300 1631351243.png', 2, 1631351243, 1631352961);
INSERT INTO `qx_order` VALUES (14, 7, NULL, NULL, 14, NULL, '/QR/0.63791400 1631352978.png', 2, 1631352978, 1631353009);
INSERT INTO `qx_order` VALUES (15, 7, NULL, NULL, 14, NULL, '/QR/0.62711500 1631353095.png', 1, 1631353095, 1631353095);
INSERT INTO `qx_order` VALUES (16, 7, NULL, NULL, 14, NULL, '/QR/0.03659000 1631515135.png', 1, 1631515135, 1631515135);
INSERT INTO `qx_order` VALUES (17, 7, 15, 4, 15, 7, '/QR/0.19602500 1631588253.png', 2, 1631588253, 1631588378);
INSERT INTO `qx_order` VALUES (18, 7, 15, 4, 15, 7, '/QR/0.99898600 1631588690.png', 2, 1631588690, 1631698363);
INSERT INTO `qx_order` VALUES (19, 7, 2, 1, 12, NULL, '/QR/0.53427800 1631862659.png', 1, 1631862659, 1631862659);
INSERT INTO `qx_order` VALUES (20, 7, 4, 1, 10, NULL, '/QR/0.42700700 1631863146.png', 1, 1631863146, 1631863146);
INSERT INTO `qx_order` VALUES (21, 7, 5, 1, 9, NULL, '/QR/0.47859600 1631863237.png', 1, 1631863237, 1631863237);
INSERT INTO `qx_order` VALUES (22, 7, 1, 1, 13, NULL, '/QR/0.08444100 1631863253.png', 1, 1631863253, 1631863253);
INSERT INTO `qx_order` VALUES (23, 7, 200, 1, 14, NULL, '/QR/0.37304100 1631863288.png', 1, 1631863288, 1631863288);
INSERT INTO `qx_order` VALUES (24, 7, 6, 1, 8, NULL, '/QR/0.42899000 1631863729.png', 1, 1631863729, 1631863729);
INSERT INTO `qx_order` VALUES (25, 7, 3, 1, 11, NULL, '/QR/0.21309100 1631863753.png', 1, 1631863753, 1631863753);
INSERT INTO `qx_order` VALUES (26, 7, 200, 1, 14, 7, '/QR/0.23100500 1631863838.png', 2, 1631863838, 1631864488);
INSERT INTO `qx_order` VALUES (27, 7, 200, 1, 14, NULL, '/QR/0.63457400 1631870446.png', 1, 1631870446, 1631870446);
INSERT INTO `qx_order` VALUES (28, 7, 200, 1, 14, NULL, '/QR/0.85528000 1631950110.png', 1, 1631950110, 1631950110);
INSERT INTO `qx_order` VALUES (29, 7, 200, 1, 14, NULL, '/QR/0.41206400 1631950135.png', 1, 1631950135, 1631950135);
INSERT INTO `qx_order` VALUES (30, 7, 15, 4, 15, 7, '/QR/0.94256400 1631950432.png', 2, 1631950432, 1632279932);

-- ----------------------------
-- Table structure for qx_pinglun
-- ----------------------------
DROP TABLE IF EXISTS `qx_pinglun`;
CREATE TABLE `qx_pinglun`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT ' 评论id',
  `aid` int NULL DEFAULT NULL COMMENT '文章',
  `type` int NULL DEFAULT NULL COMMENT '1文章评论 2比赛文章评论 3分享文章评论',
  `mid` int NULL DEFAULT NULL COMMENT '评论用户',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qx_pinglun
-- ----------------------------
INSERT INTO `qx_pinglun` VALUES (2, 3, 1, 4, '论', 1622768184, 1622768184);
INSERT INTO `qx_pinglun` VALUES (3, 3, 1, 4, '问答内容内容', 1622768184, 1630721675);
INSERT INTO `qx_pinglun` VALUES (113, 3, 1, 4, '评论内容内容内容', 1631579998, 1631579998);
INSERT INTO `qx_pinglun` VALUES (114, 1, 2, 4, '比赛文章评论', 1631579998, 1631579998);
INSERT INTO `qx_pinglun` VALUES (115, 1, 2, 4, '哈哈哈哈哈哈', 1631583455, 1631583455);
INSERT INTO `qx_pinglun` VALUES (116, 1, 3, 4, '哈哈哈哈哈哈', 1631609824, 1631609824);
INSERT INTO `qx_pinglun` VALUES (117, 4, 2, 7, '1111', 1631955665, 1631955665);
INSERT INTO `qx_pinglun` VALUES (118, 4, 2, 7, '222', 1631955761, 1631955761);
INSERT INTO `qx_pinglun` VALUES (119, 4, 2, 7, '333', 1631955882, 1631955882);
INSERT INTO `qx_pinglun` VALUES (120, 4, 2, 7, '哈哈哈', 1631955930, 1631955930);
INSERT INTO `qx_pinglun` VALUES (121, 4, 2, 7, '呃呃呃', 1631955974, 1631955974);
INSERT INTO `qx_pinglun` VALUES (122, 4, 2, 7, '你好', 1631956028, 1631956028);
INSERT INTO `qx_pinglun` VALUES (123, 1, 2, 7, '111', 1631956263, 1631956263);
INSERT INTO `qx_pinglun` VALUES (124, 1, 2, 7, '嗡嗡嗡', 1631956374, 1631956374);
INSERT INTO `qx_pinglun` VALUES (125, 4, 2, 7, '222', 1631956667, 1631956667);
INSERT INTO `qx_pinglun` VALUES (126, 5, 2, 7, '111', 1631957782, 1631957782);
INSERT INTO `qx_pinglun` VALUES (127, 5, 2, 7, '222', 1631957803, 1631957803);
INSERT INTO `qx_pinglun` VALUES (128, 1, 3, 7, '测试', 1632274387, 1632274387);
INSERT INTO `qx_pinglun` VALUES (129, 3, 3, 7, '222', 1632275191, 1632275191);
INSERT INTO `qx_pinglun` VALUES (130, 18, 3, 7, '123', 1632278726, 1632278726);
INSERT INTO `qx_pinglun` VALUES (131, 20, 3, 7, '222', 1632278806, 1632278806);
INSERT INTO `qx_pinglun` VALUES (132, 20, 3, 7, 'www', 1632279142, 1632279142);
INSERT INTO `qx_pinglun` VALUES (133, 20, 1, 7, '222', 1632279160, 1632279160);
INSERT INTO `qx_pinglun` VALUES (134, 18, 1, 7, '122222', 1632279176, 1632279176);

-- ----------------------------
-- Table structure for qx_praiselog
-- ----------------------------
DROP TABLE IF EXISTS `qx_praiselog`;
CREATE TABLE `qx_praiselog`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int NULL DEFAULT NULL COMMENT '5生活分享文章点赞4比赛文章点赞',
  `mid` int NULL DEFAULT NULL COMMENT '用户',
  `aid` int NULL DEFAULT NULL COMMENT '文章',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '比赛文章分享文章点赞记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qx_praiselog
-- ----------------------------
INSERT INTO `qx_praiselog` VALUES (19, 5, 7, 3, 1632275946, 1632275946);
INSERT INTO `qx_praiselog` VALUES (20, 4, 7, 18, 1632278604, 1632278604);
INSERT INTO `qx_praiselog` VALUES (21, 4, 7, 20, 1632278620, 1632278620);

-- ----------------------------
-- Table structure for qx_report
-- ----------------------------
DROP TABLE IF EXISTS `qx_report`;
CREATE TABLE `qx_report`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int NULL DEFAULT NULL COMMENT '举报用户',
  `cid` int NULL DEFAULT NULL COMMENT '被举报商品',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '举报内容',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品举报' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qx_report
-- ----------------------------
INSERT INTO `qx_report` VALUES (17, 7, 10, '举报', 1631862286, 1631862286);
INSERT INTO `qx_report` VALUES (18, 7, 13, '举报', 1631862429, 1631862429);

-- ----------------------------
-- Table structure for qx_share
-- ----------------------------
DROP TABLE IF EXISTS `qx_share`;
CREATE TABLE `qx_share`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `type` varbinary(100) NULL DEFAULT NULL COMMENT '主题',
  `mid` int NULL DEFAULT NULL COMMENT '发布的用户',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `imgs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `browse` int NULL DEFAULT 0 COMMENT '浏览量',
  `praise` int NULL DEFAULT 0 COMMENT '点赞数量',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '低碳生活分享' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qx_share
-- ----------------------------

-- ----------------------------
-- Table structure for qx_system_banner
-- ----------------------------
DROP TABLE IF EXISTS `qx_system_banner`;
CREATE TABLE `qx_system_banner`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `banner_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型 首页轮播  合作伙伴 智能销售市场前景  渠道会销展示  解决方案   云服市场  支持服务  解决方案_品牌客户 公告 友情链接',
  `bannersrc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `abstract` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `isshow` int NULL DEFAULT 0 COMMENT '不显示 默认0不显示 1显示',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  `delete_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qx_system_banner
-- ----------------------------
INSERT INTO `qx_system_banner` VALUES (96, NULL, '/uploads/20210827/08d910d9c5179d6e20c5b6c2df32f1e9.jpg', '轮播图', NULL, '1', 0, 1630056430, 1630723773, NULL);
INSERT INTO `qx_system_banner` VALUES (91, NULL, '/uploads/20210827/22d604c9aa0c52295f565f80db2a1fc7.jpg', '11', 'aa', 'a', 0, NULL, 1630056678, NULL);

-- ----------------------------
-- Table structure for qx_system_config
-- ----------------------------
DROP TABLE IF EXISTS `qx_system_config`;
CREATE TABLE `qx_system_config`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `varname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '变量名',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数参说明',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '量值变',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是图片',
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片名称',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  `delete_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qx_system_config
-- ----------------------------
INSERT INTO `qx_system_config` VALUES (6, '联系电话', 'cfg_phone', '18888888888', '', '', NULL, 1631779166, NULL);
INSERT INTO `qx_system_config` VALUES (7, '网页主页连接', 'cfg_indexurl', 'http://www.baidu.com', '', '', NULL, 1622768031, NULL);
INSERT INTO `qx_system_config` VALUES (8, '网站名称', 'cfg_webname', '低碳社区', '', '', NULL, 1631150166, NULL);
INSERT INTO `qx_system_config` VALUES (9, '网站版权信息', 'cfg_powerby', '低碳社区  © Copyright 2019-2022 我问问，baidu.com', '', '', NULL, 1631150183, NULL);
INSERT INTO `qx_system_config` VALUES (10, '站点默认关键字', 'cfg_keywords', '', '', NULL, NULL, NULL, NULL);
INSERT INTO `qx_system_config` VALUES (12, '站点描述', 'cfg_description', '', '', NULL, NULL, 1605747654, NULL);
INSERT INTO `qx_system_config` VALUES (41, '比赛发布文章获赞兑换积分数量 1赞 = 0.1积分 ', 'cfg_GamePraise2', '0.5', '', '', 1631949196, 1631951829, NULL);
INSERT INTO `qx_system_config` VALUES (42, '生活分享文章用户点击获得积分数量 如点赞1文章 = 0.1积分', 'cfg_SharePraise1', '0.1', '', '', 1631949251, 1631949251, NULL);
INSERT INTO `qx_system_config` VALUES (43, '生活分享发布文章获赞兑换积分数量 1赞 = 0.1积分', 'cfg_SharePraise2', '0.1', '', '', 1631949286, 1631949286, NULL);
INSERT INTO `qx_system_config` VALUES (40, '比赛文章用户点击获得积分数量 如点赞1文章 = 0.1积分', 'cfg_GamePraise1', '0.1', '', '', 1631949093, 1631949093, NULL);
INSERT INTO `qx_system_config` VALUES (39, '步数~积分 如1步数 = 0.001积分  那么一万步就是10积分 ', 'cfg_step', '0.001', '', '', 1631600999, 1631602216, NULL);

-- ----------------------------
-- Table structure for qx_system_log
-- ----------------------------
DROP TABLE IF EXISTS `qx_system_log`;
CREATE TABLE `qx_system_log`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作内容',
  `ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  `os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  `delete_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1815 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qx_system_log
-- ----------------------------
INSERT INTO `qx_system_log` VALUES (1543, 'admin', '超级管理员(admin)修改商品：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/edit.html', 1631157888, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1544, 'admin', '超级管理员(admin)添加权限：商品管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionadd.html', 1631158016, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1545, 'admin', '超级管理员(admin)编辑权限：艾灸知识文章 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631158062, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1546, 'admin', '超级管理员(admin)编辑权限：专属管家 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631158085, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1547, 'admin', '超级管理员(admin)编辑权限：商品管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631158116, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1548, 'admin', '超级管理员(admin)编辑权限：商品管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631158135, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1549, 'admin', '超级管理员(admin)登录系统', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/serve.html', 1631158151, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1550, 'admin', '超级管理员(admin)编辑权限：商品举报 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631158471, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1551, 'admin', '超级管理员(admin)编辑权限：商品举报 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631158641, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1552, 'admin', '超级管理员(admin)编辑权限：商品举报 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631158750, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1553, 'admin', '超级管理员(admin)删除商品：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/del.html', 1631159245, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1554, 'admin', '超级管理员(admin)删除商品：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/del.html', 1631159414, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1555, 'admin', '超级管理员(admin)删除商品：违规违规违规违规违规违规违规违规违规违规违规违规违规违规违规违规违规违规 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/report/del.html', 1631165901, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1556, 'admin', '超级管理员(admin)添加商品：1111 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/add.html', 1631165947, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1557, 'admin', '超级管理员(admin)删除商品： 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/Del.html', 1631165974, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1558, 'admin', '超级管理员(admin)删除商品： 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/Del.html', 1631166021, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1559, 'admin', '超级管理员(admin)删除商品：1111 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/del.html', 1631166036, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1560, 'admin', '超级管理员(admin)添加商品：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/add.html', 1631166095, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1561, 'admin', '超级管理员(admin)删除商品：豆浆机 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/Del.html', 1631166113, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1562, 'admin', '超级管理员(admin)删除商品：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/Del.html', 1631166179, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1563, 'admin', '超级管理员(admin)删除商品：违规违规违规违规违规违规违规违规违规违规违规违规违规违规违规违规违规违规 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/report/del.html', 1631166192, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1564, 'admin', '超级管理员(admin)删除商品：违规违规违规违规违规违规违规违规违规违规违规违规违规违规违规违规违规违规 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/report/del.html', 1631166193, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1565, 'admin', '超级管理员(admin)删除分类：11 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/type/del.html', 1631167623, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1566, 'admin', '超级管理员(admin)删除分类：选项卡 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/type/del.html', 1631167624, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1567, 'admin', '超级管理员(admin)删除分类：男科 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/type/del.html', 1631167625, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1568, 'admin', '超级管理员(admin)删除分类：儿科 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/type/del.html', 1631167628, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1569, 'admin', '超级管理员(admin)删除分类：妇科 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/type/del.html', 1631167629, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1570, 'admin', '超级管理员(admin)删除分类：儿科 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/type/del.html', 1631167631, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1571, 'admin', '超级管理员(admin)编辑权限：课程文章 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631167676, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1572, 'admin', '超级管理员(admin)编辑权限：分类管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631167692, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1573, 'admin', '超级管理员(admin)添加分类：qqq 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/type/add.html', 1631167717, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1574, 'admin', '超级管理员(admin)修改分类：qqq111 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/type/edit.html', 1631167721, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1575, 'admin', '超级管理员(admin)删除分类：qqq111 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/type/del.html', 1631167726, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1576, 'admin', '超级管理员(admin)编辑权限：文章管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631168292, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1577, 'admin', '超级管理员(admin)添加分类：低碳生活 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/type/add.html', 1631169356, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1578, 'admin', '超级管理员(admin)删除权限艾灸课程 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactiondel.html', 1631169770, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1579, 'admin', '超级管理员(admin)添加分类：11 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/type/add.html', 1631170234, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1580, 'admin', '超级管理员(admin)删除分类：11 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/type/del.html', 1631170237, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1581, 'admin', '超级管理员(admin)添加分类：1111 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/type/add.html', 1631170242, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1582, 'admin', '超级管理员(admin)删除分类：1111 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/type/del.html', 1631170246, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1583, 'admin', '超级管理员(admin)删除文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/course/del.html', 1631170307, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1584, 'admin', '超级管理员(admin)添加商品：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/add.html', 1631170457, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1585, 'admin', '超级管理员(admin)删除商品：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/del.html', 1631170464, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1586, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/course/edit.html', 1631170981, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1587, 'admin', '超级管理员(admin)添加分类：分类32 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/type/add.html', 1631171003, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1588, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/course/edit.html', 1631171009, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1589, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/course/edit.html', 1631171044, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1590, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/course/edit.html', 1631171145, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1591, 'admin', '超级管理员(admin)添加文章：123 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/course/add.html', 1631171315, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1592, 'admin', '超级管理员(admin)删除文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/course/del.html', 1631171327, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1593, 'admin', '超级管理员(admin)删除文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/course/del.html', 1631171328, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1594, 'admin', '超级管理员(admin)删除文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/course/del.html', 1631171330, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1595, 'admin', '超级管理员(admin)删除文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/course/del.html', 1631171331, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1596, 'admin', '超级管理员(admin)删除文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/course/del.html', 1631171333, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1597, 'admin', '超级管理员(admin)编辑权限：视频管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631171746, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1598, 'admin', '超级管理员(admin)编辑权限：视频管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631171758, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1599, 'admin', '超级管理员(admin)添加文章：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/add.html', 1631172343, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1600, 'admin', '超级管理员(admin)修改文章：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/edit.html', 1631172363, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1601, 'admin', '超级管理员(admin)添加文章：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/add.html', 1631173731, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1602, 'admin', '超级管理员(admin)添加文章：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/add.html', 1631173781, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1603, 'admin', '超级管理员(admin)添加文章：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/add.html', 1631173831, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1604, 'admin', '超级管理员(admin)添加文章：111 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/add.html', 1631173894, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1605, 'admin', '超级管理员(admin)添加文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/add.html', 1631173954, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1606, 'admin', '超级管理员(admin)删除文章：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/del.html', 1631174613, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1607, 'admin', '超级管理员(admin)删除文章：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/del.html', 1631174615, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1608, 'admin', '超级管理员(admin)删除文章：123 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/del.html', 1631174617, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1609, 'admin', '超级管理员(admin)删除文章：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/del.html', 1631174619, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1610, 'admin', '超级管理员(admin)删除文章：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/del.html', 1631174621, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1611, 'admin', '超级管理员(admin)删除文章：111 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/del.html', 1631174622, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1612, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/edit.html', 1631175925, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1613, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/edit.html', 1631176624, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1614, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/edit.html', 1631176727, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1615, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/edit.html', 1631176776, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1616, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/edit.html', 1631176783, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1617, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/edit.html', 1631176813, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1618, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/edit.html', 1631176819, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1619, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/edit.html', 1631176835, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1620, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/edit.html', 1631176862, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1621, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/edit.html', 1631176867, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1622, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/edit.html', 1631176903, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1623, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/edit.html', 1631177620, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1624, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/edit.html', 1631177705, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1625, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/edit.html', 1631177710, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1626, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/edit.html', 1631177716, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1627, 'admin', '超级管理员(admin)添加文章：111 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/add.html', 1631177782, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1628, 'admin', '超级管理员(admin)修改文章：111 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/edit.html', 1631177788, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1629, 'admin', '超级管理员(admin)添加文章：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/video/add.html', 1631177794, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1630, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/course/edit.html', 1631178119, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1631, 'admin', '超级管理员(admin)添加文章：12 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/course/add.html', 1631178449, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1632, 'admin', '超级管理员(admin)添加文章：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/course/add.html', 1631178457, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1633, 'admin', '超级管理员(admin)修改用户：wang yang 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631178736, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1634, 'admin', '超级管理员(admin)编辑权限：社区活动 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631234917, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1635, 'admin', '超级管理员(admin)修改社区活动：马拉松比赛 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/edit.html', 1631238014, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1636, 'admin', '超级管理员(admin)修改社区活动：马拉松比赛 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/edit.html', 1631238133, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1637, 'admin', '超级管理员(admin)修改社区活动：马拉松比赛 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/edit.html', 1631238239, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1638, 'admin', '超级管理员(admin)修改社区活动：马拉松比赛 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/edit.html', 1631238268, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1639, 'admin', '超级管理员(admin)修改社区活动：马拉松比赛 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/edit.html', 1631238283, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1640, 'admin', '超级管理员(admin)修改社区活动：马拉松比赛 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/edit.html', 1631238309, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1641, 'admin', '超级管理员(admin)修改社区活动：马拉松比赛 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/edit.html', 1631238440, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1642, 'admin', '超级管理员(admin)修改社区活动：马拉松比赛 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/edit.html', 1631238648, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1643, 'admin', '超级管理员(admin)修改社区活动：马拉松比赛 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/edit.html', 1631238664, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1644, 'admin', '超级管理员(admin)修改社区活动：马拉松比赛 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/edit.html', 1631238970, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1645, 'admin', '超级管理员(admin)修改社区活动：马拉松比赛 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/edit.html', 1631239059, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1646, 'admin', '超级管理员(admin)添加社区活动：测试 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/add.html', 1631239268, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1647, 'admin', '超级管理员(admin)添加社区活动：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/add.html', 1631239357, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1648, 'admin', '超级管理员(admin)删除社区活动：测试 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/del.html', 1631239603, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1649, 'admin', '超级管理员(admin)修改社区活动：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/edit.html', 1631239736, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1650, 'admin', '超级管理员(admin)删除社区活动：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/del.html', 1631239790, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1651, 'admin', '超级管理员(admin)修改社区活动：马拉松比赛 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/edit.html', 1631240666, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1652, 'admin', '超级管理员(admin)编辑权限：低碳生活分享 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631241975, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1653, 'admin', '超级管理员(admin)修改低碳生活分享：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/share/edit.html', 1631243316, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1654, 'admin', '超级管理员(admin)修改低碳生活分享：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/share/edit.html', 1631243408, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1655, 'admin', '超级管理员(admin)修改低碳生活分享：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/share/edit.html', 1631243413, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1656, 'admin', '超级管理员(admin)修改低碳生活分享：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/share/edit.html', 1631243487, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1657, 'admin', '超级管理员(admin)修改低碳生活分享：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/share/edit.html', 1631243557, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1658, 'admin', '超级管理员(admin)修改低碳生活分享：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/share/edit.html', 1631243743, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1659, 'admin', '超级管理员(admin)修改低碳生活分享：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/share/edit.html', 1631243762, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1660, 'admin', '超级管理员(admin)修改低碳生活分享：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/share/edit.html', 1631243883, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1661, 'admin', '超级管理员(admin)修改低碳生活分享：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/share/edit.html', 1631243947, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1662, 'admin', '超级管理员(admin)修改低碳生活分享：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/share/edit.html', 1631244042, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1663, 'admin', '超级管理员(admin)修改低碳生活分享：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/share/edit.html', 1631244095, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1664, 'admin', '超级管理员(admin)删除低碳生活分享：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/share/del.html', 1631244232, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1665, 'admin', '超级管理员(admin)编辑权限：养生知识文章 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631245032, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1666, 'admin', '超级管理员(admin)删除权限养生知识文章 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactiondel.html', 1631245047, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1667, 'admin', '超级管理员(admin)添加权限：比赛管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionadd.html', 1631245068, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1668, 'admin', '超级管理员(admin)登录系统', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/serve.html', 1631245076, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1669, 'admin', '超级管理员(admin)登录系统', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/serve.html', 1631245077, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1670, 'admin', '超级管理员(admin)登录系统', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/serve.html', 1631245386, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1671, 'admin', '超级管理员(admin)删除权限商品管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactiondel.html', 1631245467, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1672, 'admin', '超级管理员(admin)编辑权限：商品管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631245488, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1673, 'admin', '超级管理员(admin)编辑权限：商品管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631245507, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1674, 'admin', '超级管理员(admin)编辑权限：商品管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631245549, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1675, 'admin', '超级管理员(admin)删除权限商品管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactiondel.html', 1631245568, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1676, 'admin', '超级管理员(admin)删除权限商品管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactiondel.html', 1631245571, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1677, 'admin', '超级管理员(admin)删除权限商品管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactiondel.html', 1631245640, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1678, 'admin', '超级管理员(admin)编辑权限：比赛管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631245803, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1679, 'admin', '超级管理员(admin)编辑权限：比赛管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631245831, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1680, 'admin', '超级管理员(admin)编辑权限：比赛管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631245870, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1681, 'admin', '超级管理员(admin)编辑权限：商品管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631251775, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1682, 'admin', '超级管理员(admin)编辑权限：比赛管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631251805, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1683, 'admin', '超级管理员(admin)登录系统', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/serve.html', 1631252501, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1684, 'admin', '超级管理员(admin)修改角色：超级管理员成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemroleedit.html', 1631252631, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1685, 'admin', '超级管理员(admin)登录系统', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/serve.html', 1631252636, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1686, 'admin', '超级管理员(admin)编辑权限：比赛管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631252659, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1687, 'admin', '超级管理员(admin)编辑权限：比赛管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631252679, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1688, 'admin', '超级管理员(admin)添加权限：比赛列表 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionadd.html', 1631252740, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1689, 'admin', '超级管理员(admin)修改角色：超级管理员成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemroleedit.html', 1631252756, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1690, 'admin', '超级管理员(admin)登录系统', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/serve.html', 1631252769, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1691, 'admin', '超级管理员(admin)添加比赛：111 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/game/add.html', 1631253766, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1692, 'admin', '超级管理员(admin)修改比赛：111 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/game/edit.html', 1631254023, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1693, 'admin', '超级管理员(admin)修改比赛：111 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/game/edit.html', 1631254028, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1694, 'admin', '超级管理员(admin)添加比赛：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/game/add.html', 1631254047, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1695, 'admin', '超级管理员(admin)删除比赛：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/game/del.html', 1631254056, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1696, 'admin', '超级管理员(admin)修改比赛审核：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/audit/edit.html', 1631255236, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1697, 'admin', '超级管理员(admin)修改比赛审核：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/audit/edit.html', 1631255241, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1698, 'admin', '超级管理员(admin)修改比赛审核：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/audit/edit.html', 1631255451, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1699, 'admin', '超级管理员(admin)修改文章审核：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/audit/edit.html', 1631255651, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1700, 'admin', '超级管理员(admin)删除文章审核：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/audit/del.html', 1631255932, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1701, 'admin', '超级管理员(admin)删除文章审核：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/audit/del.html', 1631255936, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1702, 'admin', '超级管理员(admin)修改比赛：文章征集 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/game/edit.html', 1631255989, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1703, 'admin', '超级管理员(admin)添加商品：测试 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/add.html', 1631256516, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1704, 'admin', '超级管理员(admin)修改商品：测试 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/edit.html', 1631256538, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1705, 'admin', '超级管理员(admin)添加权限：答题题库 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionadd.html', 1631257381, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1706, 'admin', '超级管理员(admin)修改角色：超级管理员成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemroleedit.html', 1631257392, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1707, 'admin', '超级管理员(admin)登录系统', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/serve.html', 1631257399, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1708, 'admin', '超级管理员(admin)添加答题题库：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/answer/add.html', 1631258216, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1709, 'admin', '超级管理员(admin)删除题目：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/answer/del.html', 1631258231, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1710, 'admin', '超级管理员(admin)登录系统', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/serve.html', 1631258902, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1711, 'admin', '超级管理员(admin)编辑权限：轮播图管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionedit.html', 1631258980, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1712, 'admin', '超级管理员(admin)添加权限：订单管理 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemactionadd.html', 1631259600, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1713, 'admin', '超级管理员(admin)修改角色：超级管理员成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemroleedit.html', 1631259609, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1714, 'admin', '超级管理员(admin)登录系统', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/serve.html', 1631259614, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1715, 'admin', '超级管理员(admin)添加商品：商品1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/add.html', 1631260623, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1716, 'admin', '超级管理员(admin)删除评论：问答下级问答下级问答下级问答下级问答下级问答下级问答下级问答下级问答下问答下级问答下级问答下级问答下级问答下级问答下级问答下级问答下级问答下级级 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/pinglun/del.html', 1631264007, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1717, 'admin', '超级管理员(admin)修改比赛：111 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/game/edit.html', 1631265276, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1718, 'admin', '超级管理员(admin)修改比赛：文章征集 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/game/edit.html', 1631265315, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1719, 'admin', '超级管理员(admin)修改用户：wang yang 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631266486, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1720, 'admin', '超级管理员(admin)修改用户：wang yang 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631266669, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1721, 'admin', '超级管理员(admin)修改商品：商品1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/edit.html', 1631320851, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1722, 'admin', '超级管理员(admin)修改用户：默认管理员 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631323102, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1723, 'admin', '超级管理员(admin)修改用户：默认管理员 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631323110, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1724, 'admin', '超级管理员(admin)删除文章：1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/course/del.html', 1631323973, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1725, 'admin', '超级管理员(admin)添加文章：123 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/course/add.html', 1631324064, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1726, 'admin', '超级管理员(admin)修改文章：123 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/course/edit.html', 1631324142, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1727, 'admin', '超级管理员(admin)修改文章：123 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/course/edit.html', 1631324153, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1728, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631329798, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1729, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631329805, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1730, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631329831, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1731, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631330310, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1732, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631330384, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1733, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631330395, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1734, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631330447, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1735, 'admin', '超级管理员(admin)删除商品：测试 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/Del.html', 1631338191, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1736, 'admin', '超级管理员(admin)删除商品：举报内容 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/report/del.html', 1631338244, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1737, 'admin', '超级管理员(admin)删除商品：举报内容 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/report/del.html', 1631338311, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1738, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631340164, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1739, 'admin', '超级管理员(admin)修改商品：豆浆机 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/edit.html', 1631340177, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1740, 'admin', '超级管理员(admin)修改商品：豆浆机 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/edit.html', 1631348737, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1741, 'admin', '超级管理员(admin)修改商品：豆浆机 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/edit.html', 1631350847, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1742, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631351603, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1743, 'admin', '超级管理员(admin)删除报名人数：4 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/apply/del.html', 1631499469, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1744, 'admin', '超级管理员(admin)删除报名人数：3 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/apply/del.html', 1631499475, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1745, 'admin', '超级管理员(admin)修改社区活动：马拉松比赛 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/edit.html', 1631500330, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1746, 'admin', '超级管理员(admin)删除报名人数：12 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/apply/del.html', 1631501859, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1747, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631502268, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1748, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631502286, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1749, 'admin', '超级管理员(admin)修改社区活动：马拉松比赛 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/edit.html', 1631502484, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1750, 'admin', '超级管理员(admin)修改社区活动：羽毛球比赛 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/edit.html', 1631502490, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1751, 'admin', '超级管理员(admin)修改社区活动：羽毛球比赛 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/edit.html', 1631502680, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1752, 'admin', '超级管理员(admin)修改社区活动：马拉松比赛 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/edit.html', 1631504437, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1753, 'admin', '超级管理员(admin)删除社区活动： 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/del.html', 1631516540, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1754, 'admin', '超级管理员(admin)删除社区活动： 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/del.html', 1631516622, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1755, 'admin', '超级管理员(admin)修改比赛：111 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/game/edit.html', 1631580535, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1756, 'admin', '超级管理员(admin)修改文章审核：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/audit/edit.html', 1631585089, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1757, 'admin', '超级管理员(admin)修改商品：乒乓球 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/edit.html', 1631588662, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1758, 'admin', '超级管理员(admin)修改题目：2 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/answer/edit.html', 1631589652, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1759, 'admin', '超级管理员(admin)修改题目：题目1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/answer/edit.html', 1631589659, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1760, 'admin', '超级管理员(admin)添加配置：步数~积分 如1步数 = 0.001积分  那么一万步就是10积分  成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemconfigadd.html', 1631600999, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1761, 'admin', '超级管理员(admin)删除配置：积分榜规则 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemconfigdel.html', 1631601016, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1762, 'admin', '超级管理员(admin)删除配置：积分榜奖励 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemconfigdel.html', 1631601018, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1763, 'admin', '超级管理员(admin)删除配置：邀请榜规则 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemconfigdel.html', 1631601020, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1764, 'admin', '超级管理员(admin)删除配置：邀请榜奖励 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemconfigdel.html', 1631601021, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1765, 'admin', '超级管理员(admin)删除配置：排行榜入口 (1开启  0隐藏) 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemconfigdel.html', 1631601034, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1766, 'admin', '超级管理员(admin)修改配置：步数~积分 如1步数 = 0.001积分  那么一万步就是10积分  成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemconfigedit.html', 1631601966, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1767, 'admin', '超级管理员(admin)登录系统', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/serve.html', 1631602080, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1768, 'admin', '超级管理员(admin)修改配置：步数~积分 如1步数 = 0.001积分  那么一万步就是10积分  成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemconfigedit.html', 1631602216, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1769, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631672022, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1770, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631672484, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1771, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631672534, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1772, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631672581, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1773, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631672745, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1774, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631672763, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1775, 'admin', '超级管理员(admin)删除商品：商品商品商品商品商品 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/report/del.html', 1631698273, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1776, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631698358, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1777, 'admin', '超级管理员(admin)修改题目：2 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/answer/edit.html', 1631759312, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1778, 'admin', '超级管理员(admin)修改题目：2 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/answer/edit.html', 1631759510, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1779, 'admin', '超级管理员(admin)添加题目：测试测试 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/answer/add.html', 1631759567, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1780, 'admin', '超级管理员(admin)删除题目：2 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/answer/del.html', 1631762959, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1781, 'admin', '超级管理员(admin)删除题目：题目1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/answer/del.html', 1631762962, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1782, 'admin', '超级管理员(admin)添加题目：11 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/answer/add.html', 1631763342, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1783, 'admin', '超级管理员(admin)修改社区活动：马拉松比赛 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/activity/edit.html', 1631770214, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1784, 'admin', '超级管理员(admin)删除报名人数：20 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/apply/del.html', 1631772883, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1785, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631774133, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1786, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631774141, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1787, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631776974, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1788, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631777023, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1789, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631777104, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1790, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631777576, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1791, 'admin', '超级管理员(admin)修改配置：联系电话 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemconfigedit.html', 1631779166, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1792, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631779316, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1793, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631779705, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1794, 'admin', '超级管理员(admin)修改用户：哈 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631780793, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1795, 'admin', '超级管理员(admin)修改用户：用户1 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.63)', 'Windows 10', 'http://ditanshequ.com/admin/member/edit.html', 1631780811, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1796, 'admin', '超级管理员(admin)删除商品：awd 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.82)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/del.html', 1631932408, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1797, 'admin', '超级管理员(admin)修改比赛：文章征集 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.82)', 'Windows 10', 'http://ditanshequ.com/admin/game/edit.html', 1631936822, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1798, 'admin', '超级管理员(admin)修改文章审核：我是标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.82)', 'Windows 10', 'http://ditanshequ.com/admin/audit/edit.html', 1631943945, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1799, 'admin', '超级管理员(admin)添加配置：比赛文章用户点击获得积分数量 如点赞1文章 = 0.1积分 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.82)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemconfigadd.html', 1631949093, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1800, 'admin', '超级管理员(admin)添加配置：比赛发布文章获赞兑换积分数量 1赞 = 0.1积分  成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.82)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemconfigadd.html', 1631949196, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1801, 'admin', '超级管理员(admin)添加配置：生活分享文章用户点击获得积分数量 如点赞1文章 = 0.1积分 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.82)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemconfigadd.html', 1631949251, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1802, 'admin', '超级管理员(admin)添加配置：生活分享发布文章获赞兑换积分数量 1赞 = 0.1积分 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.82)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemconfigadd.html', 1631949286, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1803, 'admin', '超级管理员(admin)修改商品：乒乓球 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.82)', 'Windows 10', 'http://ditanshequ.com/admin/commodity/edit.html', 1631950222, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1804, 'admin', '超级管理员(admin)修改配置：比赛发布文章获赞兑换积分数量 1赞 = 0.1积分  成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.82)', 'Windows 10', 'http://ditanshequ.com/admin/system/systemconfigedit.html', 1631951829, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1805, 'admin', '超级管理员(admin)修改文章审核：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.82)', 'Windows 10', 'http://ditanshequ.com/admin/audit/edit.html', 1631957751, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1806, 'admin', '超级管理员(admin)修改文章审核：文章标题标题标题标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.82)', 'Windows 10', 'http://ditanshequ.com/admin/audit/edit.html', 1632271405, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1807, 'admin', '超级管理员(admin)修改文章审核：a\'seasedawdwA 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.82)', 'Windows 10', 'http://ditanshequ.com/admin/audit/edit.html', 1632271624, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1808, 'admin', '超级管理员(admin)修改文章：12 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.82)', 'Windows 10', 'http://ditanshequ.com/admin/course/edit.html', 1632277734, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1809, 'admin', '超级管理员(admin)修改文章：12 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.82)', 'Windows 10', 'http://ditanshequ.com/admin/course/edit.html', 1632277771, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1810, 'admin', '超级管理员(admin)修改文章：12 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.82)', 'Windows 10', 'http://ditanshequ.com/admin/course/edit.html', 1632277906, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1811, 'admin', '超级管理员(admin)修改文章：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.82)', 'Windows 10', 'http://ditanshequ.com/admin/course/edit.html', 1632278762, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1812, 'admin', '超级管理员(admin)删除低碳生活分享：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.82)', 'Windows 10', 'http://ditanshequ.com/admin/share/del.html', 1632292464, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1813, 'admin', '超级管理员(admin)删除低碳生活分享：标题 成功', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.82)', 'Windows 10', 'http://ditanshequ.com/admin/share/del.html', 1632292467, NULL, NULL);
INSERT INTO `qx_system_log` VALUES (1814, 'admin', '超级管理员(admin)登录系统', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(93.0.4577.82)', 'Windows 10', 'http://ditanshequ.com/serve.html', 1632562768, NULL, NULL);

-- ----------------------------
-- Table structure for qx_system_method
-- ----------------------------
DROP TABLE IF EXISTS `qx_system_method`;
CREATE TABLE `qx_system_method`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '模块ID',
  `pid` int NULL DEFAULT NULL COMMENT '一级父权限id',
  `pathsort` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `module_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块名称',
  `module` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块',
  `controller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '控制器',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法名',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  `level` int NULL DEFAULT NULL COMMENT '深度等级',
  `sort` int NULL DEFAULT 1 COMMENT '排序值',
  `is_menu` int NULL DEFAULT 0 COMMENT '是否是菜单',
  `is_dev` int NULL DEFAULT NULL COMMENT '是否仅开发者模式可见',
  `des` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '模块描述',
  `status` int NULL DEFAULT NULL,
  `left_icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '左侧小图标',
  `menu_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '<a><cite>系统管理</cite></a><a><cite>日志列表</cite></a>' COMMENT '面包屑导航',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qx_system_method
-- ----------------------------
INSERT INTO `qx_system_method` VALUES (1, 0, '1', '系统管理', 'admin', '', '', '', 1, 10, 1, NULL, NULL, NULL, '&#xe6b4;', '', NULL, 1614995625);
INSERT INTO `qx_system_method` VALUES (2, 1, '1-2', '用户列表', 'admin', 'system', 'systemuser', 'admin/system/systemuser', 2, 4, 1, NULL, NULL, NULL, '&#xe723;', '<a><cite>系统管理</cite></a><a><cite>用户管理</cite></a>', NULL, 1618276285);
INSERT INTO `qx_system_method` VALUES (3, 1, '1-3', '角色管理', 'admin', 'system', 'systemrole', 'admin/system/systemrole', 2, 5, 1, NULL, NULL, NULL, '& #xe723;', '<a><cite>系统管理</cite></a><a><cite>角色管理</cite></a>', NULL, 1618276296);
INSERT INTO `qx_system_method` VALUES (4, 1, '1-4', '权限管理', 'admin', 'system', 'systemaction', 'admin/system/systemaction', 2, 6, 1, NULL, '', NULL, '& #xe723;', '<a><cite>系统管理</cite></a><a><cite>权限管理</cite></a>', NULL, 1618276342);
INSERT INTO `qx_system_method` VALUES (5, 1, '1-5', '系统日志', 'admin', 'system', 'loglist', 'admin/system/loglist', 2, 6, 1, NULL, '', NULL, '&#xe723;', '<a><cite>系统管理</cite></a><a><cite>日志列表</cite></a>', NULL, 1618276305);
INSERT INTO `qx_system_method` VALUES (6, 1, '1-6', '系统参数设置', 'admin', 'system', 'systemconfig', 'admin/system/systemconfig', 2, 7, 1, NULL, NULL, NULL, '&#xe723;', '<a><cite>系统管理</cite></a><a><cite>参数管理</cite></a>', NULL, 1618276319);
INSERT INTO `qx_system_method` VALUES (7, 6, '1-6-7', '添加系统参数', 'admin', 'system', 'systemconfigadd', '/admin/system/systemconfigadd', 3, 1, 0, NULL, NULL, NULL, NULL, '<a><cite>系统管理</cite></a><a><cite>日志列表</cite></a>', NULL, NULL);
INSERT INTO `qx_system_method` VALUES (8, 6, '1-6-8', '编辑系统参数', 'admin', 'system', 'systemconfigedit', 'admin/system/systemConfigEdit', 3, 1, 0, NULL, NULL, NULL, '&#xe723;', '<a><cite>系统管理</cite></a><a><cite>日志列表</cite></a>', NULL, NULL);
INSERT INTO `qx_system_method` VALUES (12, 6, '1-6-12', '删除系统参数', 'admin', 'system', 'systemconfigdel', 'admin/system/', 3, 1, 0, NULL, NULL, NULL, '', '<a><cite>系统管理</cite></a><a><cite>日志列表</cite></a>', 1614761897, 1614995951);
INSERT INTO `qx_system_method` VALUES (14, 4, '1-4-14', '添加权限', 'admin', 'system', 'systemactionadd', 'admin/system/systemActionAdd', 3, 1, 0, NULL, NULL, NULL, '&#xe723;', '<a><cite>系统管理</cite></a><a><cite>日志列表</cite></a>', 1614821950, 1614821950);
INSERT INTO `qx_system_method` VALUES (15, 4, '1-4-15', '编辑权限', 'admin', 'system', 'systemactionedit', 'admin/system/systemActionEdit', 3, 1, 0, NULL, NULL, NULL, '&#xe723;', '<a><cite>系统管理</cite></a><a><cite>日志列表</cite></a>', 1614822048, 1614822048);
INSERT INTO `qx_system_method` VALUES (16, 4, '1-4-16', '删除权限', 'admin', 'system', 'systemactiondel', 'admin/system/systemActionDel', 3, 1, 0, NULL, NULL, NULL, '&#xe723;', '<a><cite>系统管理</cite></a><a><cite>日志列表</cite></a>', 1614822071, 1614822071);
INSERT INTO `qx_system_method` VALUES (30, 1, '1-30', '轮播图管理', 'admin', 'system', 'bannerlist', '', 2, 3, 0, NULL, NULL, NULL, '& #xe723;', '<a><cite>系统管理</cite></a><a><cite>轮播图列表</cite></a>', 1615361234, 1631258980);
INSERT INTO `qx_system_method` VALUES (65, 3, '1-3-65', '添加角色', 'admin', 'system', 'systemroleadd', '', 3, 1, 0, NULL, NULL, NULL, '& #xe723;', '<a><cite>系统管理</cite></a><a><cite>日志列表</cite></a>', 1616577818, 1616577818);
INSERT INTO `qx_system_method` VALUES (66, 3, '1-3-66', '编辑角色', 'admin', 'system', 'systemroleedit', '', 3, 1, 0, NULL, NULL, NULL, '& #xe723;', '<a><cite>系统管理</cite></a><a><cite>日志列表</cite></a>', 1616577861, 1616577861);
INSERT INTO `qx_system_method` VALUES (67, 3, '1-3-67', '删除角色', 'admin', 'system', 'systemroledel', '', 3, 1, 0, NULL, NULL, NULL, '& #xe723;', '<a><cite>系统管理</cite></a><a><cite>日志列表</cite></a>', 1616577890, 1616577890);
INSERT INTO `qx_system_method` VALUES (68, 2, '1-2-68', '添加用户', 'admin', 'system', 'systemuseradd', '', 3, 1, 0, NULL, NULL, NULL, '& #xe723;', '<a><cite>系统管理</cite></a><a><cite>日志列表</cite></a>', 1616577950, 1616577950);
INSERT INTO `qx_system_method` VALUES (69, 2, '1-2-69', '编辑用户', 'admin', 'system', 'systemuseredit', '', 3, 1, 0, NULL, NULL, NULL, '& #xe723;', '<a><cite>系统管理</cite></a><a><cite>日志列表</cite></a>', 1616577983, 1616577983);
INSERT INTO `qx_system_method` VALUES (70, 2, '1-2-70', '删除用户', 'admin', 'system', 'systemuserdel', '', 3, 1, 0, NULL, NULL, NULL, '& #xe723;', '<a><cite>系统管理</cite></a><a><cite>日志列表</cite></a>', 1616578008, 1616578008);
INSERT INTO `qx_system_method` VALUES (71, 2, '1-2-71', '修改密码', 'admin', 'system', 'changepwd', '', 3, 1, 0, NULL, NULL, NULL, '& #xe723;', '<a><cite>系统管理</cite></a><a><cite>日志列表</cite></a>', 1616578045, 1616578045);
INSERT INTO `qx_system_method` VALUES (72, 2, '1-2-72', '限制用户登录', 'admin', 'system', 'limitlogin', '', 3, 1, 0, NULL, NULL, NULL, '& #xe723;', '<a><cite>系统管理</cite></a><a><cite>日志列表</cite></a>', 1616578075, 1616578075);
INSERT INTO `qx_system_method` VALUES (73, 30, '1-30-73', '添加轮播图', 'admin', 'system', 'banneradd', '', 3, 1, 0, NULL, NULL, NULL, '& #xe723;', '<a><cite>系统管理</cite></a><a><cite>日志列表</cite></a>', 1616578273, 1616578273);
INSERT INTO `qx_system_method` VALUES (74, 30, '1-30-74', '编辑轮播图', 'admin', 'system', 'banneredit', '', 3, 1, 0, NULL, NULL, NULL, '& #xe723;', '<a><cite>系统管理</cite></a><a><cite>日志列表</cite></a>', 1616578308, 1616578308);
INSERT INTO `qx_system_method` VALUES (75, 30, '1-30-75', '修改显示状态', 'admin', 'system', 'bannerlstatus', '', 3, 1, 0, NULL, NULL, NULL, '& #xe723;', '<a><cite>系统管理</cite></a><a><cite>日志列表</cite></a>', 1616578336, 1616578336);
INSERT INTO `qx_system_method` VALUES (76, 30, '1-30-76', '删除轮播图', 'admin', 'system', 'bannerldel', '', 3, 1, 0, NULL, NULL, NULL, '& #xe723;', '<a><cite>系统管理</cite></a><a><cite>日志列表</cite></a>', 1616578376, 1616578376);
INSERT INTO `qx_system_method` VALUES (77, 0, '-77', '用户管理', 'admin', 'member', 'list', 'admin/Member/list', 1, 1, 1, NULL, NULL, NULL, '&#xe723;', '<a><cite>用户管理</cite></a><a><cite>用户列表</cite></a>', 1627961097, 1631152191);
INSERT INTO `qx_system_method` VALUES (78, 81, '-81-78', '商品管理', 'admin', 'commodity', 'list', 'admin/commodity/list', 2, 1, 1, NULL, NULL, NULL, '&#xe723;', '<a><cite>商品管理</cite></a><a><cite>商品管理</cite></a>', 1629430111, 1631158135);
INSERT INTO `qx_system_method` VALUES (79, 0, '-79', '课程文章', '', '', '', '', 1, 1, 1, NULL, NULL, NULL, '&#xe723;', '<a><cite>课程文章</cite></a><a><cite>课程文章</cite></a>', 1629444817, 1631167676);
INSERT INTO `qx_system_method` VALUES (80, 81, '-81-80', '商品举报', 'admin', 'report', 'list', 'admin/report/list', 2, 1, 1, NULL, NULL, NULL, '&#xe723;', '<a><cite>商品举报</cite></a><a><cite>举报列表</cite></a>', 1629527650, 1631158750);
INSERT INTO `qx_system_method` VALUES (81, 0, '-81', '商品管理', '', '', '', '', 1, 1, 1, NULL, NULL, NULL, '&#xe723;', '<a><cite>专属管家</cite></a><a><cite>专属管家</cite></a>', 1629528918, 1631251775);
INSERT INTO `qx_system_method` VALUES (82, 79, '-79-82', '文章管理', 'admin', 'course', 'list', 'admin/course/list', 2, 1, 1, NULL, NULL, NULL, '&#xe723;', '<a><cite>文章管理</cite></a><a><cite>文章管理</cite></a>', 1629529476, 1631168292);
INSERT INTO `qx_system_method` VALUES (84, 79, '-79-84', '视频管理', 'admin', 'video', 'list', 'admin/video/list', 2, 1, 1, NULL, NULL, NULL, '&#xe723;', '<a><cite>视频管理</cite></a><a><cite>视频管理</cite></a>', 1629614846, 1631171758);
INSERT INTO `qx_system_method` VALUES (85, 0, '-85', '社区活动', 'admin', 'activity', 'list', 'admin/activity/list', 1, 1, 1, NULL, NULL, NULL, '&#xe723;', '<a><cite>社区活动</cite></a><a><cite>社区活动</cite></a>', 1629946062, 1631234917);
INSERT INTO `qx_system_method` VALUES (90, 0, '-90', '低碳生活分享', 'admin', 'share', 'list', 'admin/share/list', 1, 1, 1, NULL, NULL, NULL, '&#xe723;', '<a><cite>低碳生活分享</cite></a><a><cite>低碳生活分享</cite></a>', 1630048865, 1631241975);
INSERT INTO `qx_system_method` VALUES (91, 79, '-79-91', '分类管理', 'admin', 'type', 'list', 'admin/type/list', 2, 1, 1, NULL, NULL, NULL, '&#xe723;', '<a><cite>分类管理</cite></a><a><cite>分类列表</cite></a>', 1630565393, 1631167692);
INSERT INTO `qx_system_method` VALUES (96, 0, '-96', '比赛管理', 'admin', '', '', '', 1, 1, 1, NULL, NULL, NULL, '&#xe723;', '<a><cite>比赛管理</cite></a><a><cite>比赛管理</cite></a>', 1631168292, 1631252679);
INSERT INTO `qx_system_method` VALUES (98, 96, '-96-98', '比赛列表', 'admin', 'game', 'list', 'admin/game/list', 2, 1, 1, NULL, NULL, NULL, '&#xe723;', '<a><cite>比赛管理</cite></a><a><cite>比赛列表</cite></a>', 1631252740, 1631252740);
INSERT INTO `qx_system_method` VALUES (99, 0, '-99', '答题题库', 'admin', 'answer', 'list', 'admin/answer/list', 1, 1, 1, NULL, NULL, NULL, '&#xe723;', '<a><cite>答题题库</cite></a><a><cite>题库列表</cite></a>', 1631257381, 1631257381);
INSERT INTO `qx_system_method` VALUES (100, 81, '-81-100', '订单管理', 'admin', 'order', 'list', 'admin/order/list', 2, 1, 1, NULL, NULL, NULL, '&#xe723;', '<a><cite>订单管理</cite></a><a><cite>订单列表</cite></a>', 1631259600, 1631259600);

-- ----------------------------
-- Table structure for qx_system_role
-- ----------------------------
DROP TABLE IF EXISTS `qx_system_role`;
CREATE TABLE `qx_system_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_status` int NULL DEFAULT 1 COMMENT '态状 是否停用',
  `des` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明',
  `sort_num` int NULL DEFAULT NULL COMMENT '排序值 暂时没用',
  `is_system` int NOT NULL DEFAULT 2 COMMENT '是否是超级管理员 1 是 2 不是 默认2 暂时没用放到用户里面了',
  `projects` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可操作性项目',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qx_system_role
-- ----------------------------
INSERT INTO `qx_system_role` VALUES (1, '超级管理员', 1, '所有权限', 10, 1, '16,17,18,19,20', NULL, 1631259609);

-- ----------------------------
-- Table structure for qx_system_role_method
-- ----------------------------
DROP TABLE IF EXISTS `qx_system_role_method`;
CREATE TABLE `qx_system_role_method`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL DEFAULT 0 COMMENT '角色Id',
  `method_id` int NOT NULL DEFAULT 0 COMMENT '权限ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1838 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限对应表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qx_system_role_method
-- ----------------------------
INSERT INTO `qx_system_role_method` VALUES (356, 4, 22);
INSERT INTO `qx_system_role_method` VALUES (357, 4, 23);
INSERT INTO `qx_system_role_method` VALUES (358, 4, 28);
INSERT INTO `qx_system_role_method` VALUES (359, 4, 29);
INSERT INTO `qx_system_role_method` VALUES (1192, 7, 58);
INSERT INTO `qx_system_role_method` VALUES (1193, 7, 49);
INSERT INTO `qx_system_role_method` VALUES (1194, 7, 64);
INSERT INTO `qx_system_role_method` VALUES (1195, 7, 91);
INSERT INTO `qx_system_role_method` VALUES (1196, 7, 173);
INSERT INTO `qx_system_role_method` VALUES (1501, 9, 58);
INSERT INTO `qx_system_role_method` VALUES (1502, 9, 91);
INSERT INTO `qx_system_role_method` VALUES (1503, 9, 173);
INSERT INTO `qx_system_role_method` VALUES (1504, 9, 52);
INSERT INTO `qx_system_role_method` VALUES (1505, 9, 172);
INSERT INTO `qx_system_role_method` VALUES (1506, 9, 59);
INSERT INTO `qx_system_role_method` VALUES (1507, 9, 60);
INSERT INTO `qx_system_role_method` VALUES (1508, 9, 166);
INSERT INTO `qx_system_role_method` VALUES (1509, 9, 61);
INSERT INTO `qx_system_role_method` VALUES (1510, 9, 31);
INSERT INTO `qx_system_role_method` VALUES (1511, 9, 41);
INSERT INTO `qx_system_role_method` VALUES (1512, 9, 33);
INSERT INTO `qx_system_role_method` VALUES (1513, 9, 124);
INSERT INTO `qx_system_role_method` VALUES (1514, 9, 123);
INSERT INTO `qx_system_role_method` VALUES (1515, 9, 122);
INSERT INTO `qx_system_role_method` VALUES (1516, 9, 34);
INSERT INTO `qx_system_role_method` VALUES (1517, 9, 126);
INSERT INTO `qx_system_role_method` VALUES (1518, 9, 125);
INSERT INTO `qx_system_role_method` VALUES (1519, 9, 127);
INSERT INTO `qx_system_role_method` VALUES (1520, 9, 32);
INSERT INTO `qx_system_role_method` VALUES (1521, 9, 114);
INSERT INTO `qx_system_role_method` VALUES (1522, 9, 113);
INSERT INTO `qx_system_role_method` VALUES (1523, 9, 121);
INSERT INTO `qx_system_role_method` VALUES (1524, 9, 120);
INSERT INTO `qx_system_role_method` VALUES (1525, 9, 118);
INSERT INTO `qx_system_role_method` VALUES (1526, 9, 116);
INSERT INTO `qx_system_role_method` VALUES (1527, 9, 115);
INSERT INTO `qx_system_role_method` VALUES (1528, 9, 117);
INSERT INTO `qx_system_role_method` VALUES (1529, 9, 42);
INSERT INTO `qx_system_role_method` VALUES (1530, 9, 128);
INSERT INTO `qx_system_role_method` VALUES (1531, 9, 129);
INSERT INTO `qx_system_role_method` VALUES (1532, 9, 130);
INSERT INTO `qx_system_role_method` VALUES (1533, 9, 36);
INSERT INTO `qx_system_role_method` VALUES (1534, 9, 38);
INSERT INTO `qx_system_role_method` VALUES (1535, 9, 108);
INSERT INTO `qx_system_role_method` VALUES (1536, 9, 107);
INSERT INTO `qx_system_role_method` VALUES (1537, 9, 40);
INSERT INTO `qx_system_role_method` VALUES (1538, 9, 106);
INSERT INTO `qx_system_role_method` VALUES (1539, 9, 104);
INSERT INTO `qx_system_role_method` VALUES (1540, 9, 105);
INSERT INTO `qx_system_role_method` VALUES (1541, 9, 103);
INSERT INTO `qx_system_role_method` VALUES (1542, 9, 102);
INSERT INTO `qx_system_role_method` VALUES (1543, 9, 69);
INSERT INTO `qx_system_role_method` VALUES (1544, 8, 58);
INSERT INTO `qx_system_role_method` VALUES (1545, 8, 49);
INSERT INTO `qx_system_role_method` VALUES (1546, 8, 64);
INSERT INTO `qx_system_role_method` VALUES (1547, 8, 91);
INSERT INTO `qx_system_role_method` VALUES (1548, 8, 173);
INSERT INTO `qx_system_role_method` VALUES (1549, 8, 52);
INSERT INTO `qx_system_role_method` VALUES (1550, 8, 172);
INSERT INTO `qx_system_role_method` VALUES (1551, 8, 59);
INSERT INTO `qx_system_role_method` VALUES (1552, 8, 60);
INSERT INTO `qx_system_role_method` VALUES (1553, 8, 167);
INSERT INTO `qx_system_role_method` VALUES (1554, 8, 166);
INSERT INTO `qx_system_role_method` VALUES (1555, 8, 1);
INSERT INTO `qx_system_role_method` VALUES (1556, 8, 2);
INSERT INTO `qx_system_role_method` VALUES (1557, 8, 69);
INSERT INTO `qx_system_role_method` VALUES (1609, 10, 58);
INSERT INTO `qx_system_role_method` VALUES (1610, 10, 90);
INSERT INTO `qx_system_role_method` VALUES (1611, 10, 152);
INSERT INTO `qx_system_role_method` VALUES (1612, 10, 150);
INSERT INTO `qx_system_role_method` VALUES (1613, 10, 151);
INSERT INTO `qx_system_role_method` VALUES (1614, 10, 153);
INSERT INTO `qx_system_role_method` VALUES (1615, 10, 49);
INSERT INTO `qx_system_role_method` VALUES (1616, 10, 53);
INSERT INTO `qx_system_role_method` VALUES (1617, 10, 156);
INSERT INTO `qx_system_role_method` VALUES (1618, 10, 155);
INSERT INTO `qx_system_role_method` VALUES (1619, 10, 157);
INSERT INTO `qx_system_role_method` VALUES (1620, 10, 64);
INSERT INTO `qx_system_role_method` VALUES (1621, 10, 154);
INSERT INTO `qx_system_role_method` VALUES (1622, 10, 50);
INSERT INTO `qx_system_role_method` VALUES (1623, 10, 161);
INSERT INTO `qx_system_role_method` VALUES (1624, 10, 162);
INSERT INTO `qx_system_role_method` VALUES (1625, 10, 51);
INSERT INTO `qx_system_role_method` VALUES (1626, 10, 158);
INSERT INTO `qx_system_role_method` VALUES (1627, 10, 160);
INSERT INTO `qx_system_role_method` VALUES (1628, 10, 159);
INSERT INTO `qx_system_role_method` VALUES (1629, 10, 54);
INSERT INTO `qx_system_role_method` VALUES (1630, 10, 55);
INSERT INTO `qx_system_role_method` VALUES (1631, 10, 56);
INSERT INTO `qx_system_role_method` VALUES (1632, 10, 91);
INSERT INTO `qx_system_role_method` VALUES (1633, 10, 173);
INSERT INTO `qx_system_role_method` VALUES (1634, 10, 52);
INSERT INTO `qx_system_role_method` VALUES (1635, 10, 172);
INSERT INTO `qx_system_role_method` VALUES (1636, 10, 57);
INSERT INTO `qx_system_role_method` VALUES (1637, 10, 59);
INSERT INTO `qx_system_role_method` VALUES (1638, 10, 60);
INSERT INTO `qx_system_role_method` VALUES (1639, 10, 168);
INSERT INTO `qx_system_role_method` VALUES (1640, 10, 167);
INSERT INTO `qx_system_role_method` VALUES (1641, 10, 166);
INSERT INTO `qx_system_role_method` VALUES (1642, 10, 61);
INSERT INTO `qx_system_role_method` VALUES (1643, 10, 164);
INSERT INTO `qx_system_role_method` VALUES (1644, 10, 165);
INSERT INTO `qx_system_role_method` VALUES (1645, 10, 163);
INSERT INTO `qx_system_role_method` VALUES (1646, 10, 43);
INSERT INTO `qx_system_role_method` VALUES (1647, 10, 47);
INSERT INTO `qx_system_role_method` VALUES (1648, 10, 142);
INSERT INTO `qx_system_role_method` VALUES (1649, 10, 44);
INSERT INTO `qx_system_role_method` VALUES (1650, 10, 132);
INSERT INTO `qx_system_role_method` VALUES (1651, 10, 133);
INSERT INTO `qx_system_role_method` VALUES (1652, 10, 134);
INSERT INTO `qx_system_role_method` VALUES (1800, 1, 79);
INSERT INTO `qx_system_role_method` VALUES (1801, 1, 82);
INSERT INTO `qx_system_role_method` VALUES (1802, 1, 84);
INSERT INTO `qx_system_role_method` VALUES (1803, 1, 91);
INSERT INTO `qx_system_role_method` VALUES (1804, 1, 77);
INSERT INTO `qx_system_role_method` VALUES (1805, 1, 99);
INSERT INTO `qx_system_role_method` VALUES (1806, 1, 96);
INSERT INTO `qx_system_role_method` VALUES (1807, 1, 98);
INSERT INTO `qx_system_role_method` VALUES (1808, 1, 90);
INSERT INTO `qx_system_role_method` VALUES (1809, 1, 85);
INSERT INTO `qx_system_role_method` VALUES (1810, 1, 81);
INSERT INTO `qx_system_role_method` VALUES (1811, 1, 78);
INSERT INTO `qx_system_role_method` VALUES (1812, 1, 80);
INSERT INTO `qx_system_role_method` VALUES (1813, 1, 100);
INSERT INTO `qx_system_role_method` VALUES (1814, 1, 1);
INSERT INTO `qx_system_role_method` VALUES (1815, 1, 30);
INSERT INTO `qx_system_role_method` VALUES (1816, 1, 73);
INSERT INTO `qx_system_role_method` VALUES (1817, 1, 74);
INSERT INTO `qx_system_role_method` VALUES (1818, 1, 75);
INSERT INTO `qx_system_role_method` VALUES (1819, 1, 76);
INSERT INTO `qx_system_role_method` VALUES (1820, 1, 2);
INSERT INTO `qx_system_role_method` VALUES (1821, 1, 71);
INSERT INTO `qx_system_role_method` VALUES (1822, 1, 72);
INSERT INTO `qx_system_role_method` VALUES (1823, 1, 68);
INSERT INTO `qx_system_role_method` VALUES (1824, 1, 69);
INSERT INTO `qx_system_role_method` VALUES (1825, 1, 70);
INSERT INTO `qx_system_role_method` VALUES (1826, 1, 3);
INSERT INTO `qx_system_role_method` VALUES (1827, 1, 67);
INSERT INTO `qx_system_role_method` VALUES (1828, 1, 66);
INSERT INTO `qx_system_role_method` VALUES (1829, 1, 65);
INSERT INTO `qx_system_role_method` VALUES (1830, 1, 4);
INSERT INTO `qx_system_role_method` VALUES (1831, 1, 16);
INSERT INTO `qx_system_role_method` VALUES (1832, 1, 15);
INSERT INTO `qx_system_role_method` VALUES (1833, 1, 14);
INSERT INTO `qx_system_role_method` VALUES (1834, 1, 5);
INSERT INTO `qx_system_role_method` VALUES (1835, 1, 6);
INSERT INTO `qx_system_role_method` VALUES (1836, 1, 7);
INSERT INTO `qx_system_role_method` VALUES (1837, 1, 8);
INSERT INTO `qx_system_role_method` VALUES (1838, 1, 12);

-- ----------------------------
-- Table structure for qx_system_user
-- ----------------------------
DROP TABLE IF EXISTS `qx_system_user`;
CREATE TABLE `qx_system_user`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '用户账号',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `idd` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `user_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '$2y$10$hDXqb3SbYzOJWBOuBQ2r2uib1HAltkb7IR6NLZzId0fzT24RT2/c.' COMMENT '用户密码',
  `user_headimg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `user_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '箱邮',
  `user_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `user_qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '该用户的私有信息',
  `user_status` int NULL DEFAULT 1 COMMENT '态状 登录限制登录',
  `user_sex` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '男' COMMENT '性别（男，女）',
  `user_birthday` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `user_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地',
  `depart_id` int NULL DEFAULT NULL COMMENT '部门id',
  `qianming` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名图片路径',
  `shouyin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手印图片路径',
  `des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `is_system` int NULL DEFAULT 2 COMMENT '是否是系统后台用户 1是 2不是',
  `wx_unionid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信unionid',
  `wx_openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信用户openid',
  `wx_is_sub` int NULL DEFAULT NULL COMMENT '微信用户是否关注',
  `wx_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信用户信息',
  `current_login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前登录ip',
  `current_login_time` int NULL DEFAULT NULL COMMENT '当前登录时间',
  `current_login_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前登录的操作终端类型',
  `last_login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次登录ip',
  `last_login_time` int NULL DEFAULT NULL COMMENT '上次登录时间',
  `last_login_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次登录的操作终端类型',
  `login_num` int NULL DEFAULT NULL COMMENT '录登次数',
  `create_time` int NULL DEFAULT NULL COMMENT '注册时间',
  `update_time` int NULL DEFAULT NULL,
  `delete_time` int NULL DEFAULT NULL,
  `degnji` int NULL DEFAULT 1 COMMENT '等级',
  `jifen` int NULL DEFAULT 0 COMMENT '积分',
  `invit_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `myinvit_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '我的邀请码',
  PRIMARY KEY (`idd`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qx_system_user
-- ----------------------------
INSERT INTO `qx_system_user` VALUES ('admin', '', 1, '超级管理员', '$2y$10$Z5on7uxnHBCAM4DYT0dP0O4JMWG7j02NS1noTbJOIE0hj4xf5pu4C', 'http://aijiu.com/uploads/20210827/f4a96133f1b2dd8eb0e949eb81034d26.jfif', '123@qq.com', '13288888888', '1', '1', NULL, 1, '男', NULL, NULL, 1, '/uploads/20210326/d9967f37fc673b4f5e7c7c8efab9b0ec.png', '1', '1', 1, NULL, NULL, NULL, NULL, '127.0.0.1', 1632562768, 'Windows 10', '127.0.0.1', 1631602080, 'Windows 10', 9, 1561520463, 1622768184, NULL, 1, 0, NULL, NULL);
INSERT INTO `qx_system_user` VALUES ('123', NULL, 91, '123', '$2y$10$hDXqb3SbYzOJWBOuBQ2r2uib1HAltkb7IR6NLZzId0fzT24RT2/c.', NULL, NULL, '17550696665', '17550696665', NULL, NULL, 1, '男', NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, NULL, '127.0.0.1', 1631149366, 'Windows 10', NULL, NULL, NULL, NULL, 1631149315, 1631149383, NULL, 1, 0, NULL, NULL);

-- ----------------------------
-- Table structure for qx_system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `qx_system_user_role`;
CREATE TABLE `qx_system_user_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '用户id',
  `role_id` int NOT NULL DEFAULT 0 COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色对应关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qx_system_user_role
-- ----------------------------
INSERT INTO `qx_system_user_role` VALUES (42, 'admin', 1);
INSERT INTO `qx_system_user_role` VALUES (43, '123', 1);

-- ----------------------------
-- Table structure for qx_type
-- ----------------------------
DROP TABLE IF EXISTS `qx_type`;
CREATE TABLE `qx_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `create_time` int NULL DEFAULT NULL,
  `update_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章和视频的分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qx_type
-- ----------------------------
INSERT INTO `qx_type` VALUES (11, '低碳生活', 1631169356, 1631169356);
INSERT INTO `qx_type` VALUES (14, '分类32', 1631171003, 1631171003);

SET FOREIGN_KEY_CHECKS = 1;

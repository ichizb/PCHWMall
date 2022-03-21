/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : pchardware_mall

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 14/03/2022 13:49:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_newbee_mall_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_admin_user`;
CREATE TABLE `tb_newbee_mall_admin_user`  (
  `admin_user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `login_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员登陆名称',
  `login_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员登陆密码',
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员显示昵称',
  `locked` tinyint(4) NULL DEFAULT 0 COMMENT '是否锁定 0未锁定 1已锁定无法登陆',
  PRIMARY KEY (`admin_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_newbee_mall_admin_user
-- ----------------------------
INSERT INTO `tb_newbee_mall_admin_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 0);
INSERT INTO `tb_newbee_mall_admin_user` VALUES (2, 'newbee-admin1', 'e10adc3949ba59abbe56e057f20f883e', '新蜂01', 0);
INSERT INTO `tb_newbee_mall_admin_user` VALUES (3, 'newbee-admin2', 'e10adc3949ba59abbe56e057f20f883e', '新蜂02', 0);
INSERT INTO `tb_newbee_mall_admin_user` VALUES (4, 'ichi', 'e10adc3949ba59abbe56e057f20f883e', 'ichi', 0);

-- ----------------------------
-- Table structure for tb_newbee_mall_admin_user_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_admin_user_token`;
CREATE TABLE `tb_newbee_mall_admin_user_token`  (
  `admin_user_id` bigint(20) NOT NULL COMMENT '用户主键id',
  `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'token值(32位字符串)',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `expire_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'token过期时间',
  PRIMARY KEY (`admin_user_id`) USING BTREE,
  UNIQUE INDEX `uq_token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_newbee_mall_admin_user_token
-- ----------------------------
INSERT INTO `tb_newbee_mall_admin_user_token` VALUES (1, '89c13e5116a8fd65c3c7b495d6fc7ba3', '2022-02-25 13:10:30', '2022-02-27 13:10:30');
INSERT INTO `tb_newbee_mall_admin_user_token` VALUES (4, 'b8fe9848250cefed38e43f76c155fb30', '2022-01-18 23:10:10', '2022-01-20 23:10:10');

-- ----------------------------
-- Table structure for tb_newbee_mall_carousel
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_carousel`;
CREATE TABLE `tb_newbee_mall_carousel`  (
  `carousel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '首页轮播图主键id',
  `carousel_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '轮播图',
  `redirect_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '\'##\'' COMMENT '点击后的跳转地址(默认不跳转)',
  `carousel_rank` int(11) NOT NULL DEFAULT 0 COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` int(11) NOT NULL DEFAULT 0 COMMENT '创建者id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` int(11) NOT NULL DEFAULT 0 COMMENT '修改者id',
  PRIMARY KEY (`carousel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_newbee_mall_carousel
-- ----------------------------
INSERT INTO `tb_newbee_mall_carousel` VALUES (1, 'https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/banner2.jpg', '##', 200, 1, '2019-08-23 17:50:45', 0, '2019-11-10 00:23:01', 0);
INSERT INTO `tb_newbee_mall_carousel` VALUES (2, 'https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/banner1.png', 'https://juejin.im/book/5da2f9d4f265da5b81794d48/section/5da2f9d6f265da5b794f2189', 13, 1, '2019-11-29 00:00:00', 0, '2022-02-25 09:17:08', 0);
INSERT INTO `tb_newbee_mall_carousel` VALUES (3, 'https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/banner3.jpg', '##', 0, 1, '2019-09-18 18:26:38', 0, '2019-11-10 00:23:01', 0);
INSERT INTO `tb_newbee_mall_carousel` VALUES (5, 'https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/banner2.png', 'https://juejin.im/book/5da2f9d4f265da5b81794d48/section/5da2f9d6f265da5b794f2189', 0, 1, '2019-11-29 00:00:00', 0, '2022-02-25 09:17:11', 0);
INSERT INTO `tb_newbee_mall_carousel` VALUES (6, 'https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/banner1.png', '##', 101, 1, '2019-09-19 23:37:40', 0, '2019-11-07 00:15:52', 0);
INSERT INTO `tb_newbee_mall_carousel` VALUES (7, 'https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/banner2.png', '##', 99, 1, '2019-09-19 23:37:58', 0, '2019-10-22 00:15:01', 0);
INSERT INTO `tb_newbee_mall_carousel` VALUES (8, 'http://localhost:28019/upload/20220221_17400699.png', '1', 123, 1, '2022-02-21 17:40:12', 0, '2022-02-22 18:17:55', 0);
INSERT INTO `tb_newbee_mall_carousel` VALUES (9, 'http://localhost:28019/upload/20220222_1909244.png', '##', 1, 1, '2022-02-22 19:09:34', 0, '2022-02-22 19:09:38', 0);
INSERT INTO `tb_newbee_mall_carousel` VALUES (10, 'http://localhost:28019/upload/20220225_09182965.png', '#/product/10915', 1, 0, '2022-02-25 09:18:57', 0, '2022-02-25 09:27:35', 0);
INSERT INTO `tb_newbee_mall_carousel` VALUES (11, 'http://localhost:28019/upload/20220225_09195638.png', '#/product/10910', 1, 0, '2022-02-25 09:20:11', 0, '2022-02-25 09:26:59', 0);

-- ----------------------------
-- Table structure for tb_newbee_mall_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_goods_category`;
CREATE TABLE `tb_newbee_mall_goods_category`  (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `category_level` tinyint(4) NOT NULL DEFAULT 0 COMMENT '分类级别(1-一级分类 2-二级分类 3-三级分类)',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '父分类id',
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `category_rank` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` int(11) NOT NULL DEFAULT 0 COMMENT '创建者id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` int(11) NULL DEFAULT 0 COMMENT '修改者id',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 208 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_newbee_mall_goods_category
-- ----------------------------
INSERT INTO `tb_newbee_mall_goods_category` VALUES (15, 1, 0, '主板', 1, 0, '2019-09-11 18:45:40', 0, '2022-01-19 00:11:31', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (16, 1, 0, '处理器', 1, 0, '2019-09-11 18:46:07', 0, '2022-01-19 00:11:37', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (17, 1, 0, '内存', 1, 0, '2019-09-12 00:09:27', 0, '2022-01-19 00:11:51', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (18, 1, 0, '硬盘', 1, 0, '2019-09-12 00:08:46', 0, '2022-01-19 00:11:57', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (19, 1, 0, '电源', 1, 0, '2019-09-12 00:09:00', 0, '2022-01-19 00:12:01', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (20, 1, 0, '机箱', 1, 0, '2022-02-22 16:59:40', 0, '2022-02-22 16:59:40', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (21, 1, 0, '其他', 1, 0, '2019-09-12 00:09:51', 0, '2022-01-19 00:12:27', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (60, 2, 15, 'AMD-MB', 1, 0, '2019-09-11 18:46:32', 0, '2022-01-19 00:12:45', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (61, 2, 15, 'INTEL-MB', 1, 0, '2019-09-11 18:46:43', 0, '2022-01-19 00:12:52', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (117, 3, 123, 'Zen+', 1, 0, '2022-02-19 20:22:49', 0, '2022-02-19 20:22:49', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (118, 3, 123, 'Zen2', 1, 0, '2022-02-19 20:23:43', 0, '2022-02-19 20:23:43', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (119, 3, 123, 'Zen3', 1, 0, '2022-02-19 20:24:08', 0, '2022-02-22 17:59:53', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (120, 3, 124, '十代', 1, 0, '2022-02-19 21:02:12', 0, '2022-02-19 21:02:12', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (121, 3, 124, '十一代', 1, 0, '2022-02-19 21:02:16', 0, '2022-02-19 21:02:16', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (122, 3, 124, '十二代', 1, 0, '2022-02-19 21:02:22', 0, '2022-02-19 21:02:22', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (123, 2, 16, 'AMD-U', 1, 0, '2022-02-19 21:03:28', 0, '2022-02-19 21:03:28', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (124, 2, 16, 'INTEL-U', 1, 0, '2022-02-19 21:03:37', 0, '2022-02-19 21:03:37', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (145, 3, 142, 'USCORSAIR', 1, 0, '2022-02-19 21:27:48', 0, '2022-02-19 21:29:34', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (147, 3, 143, 'GALAX', 1, 0, '2022-02-19 21:29:50', 0, '2022-02-19 21:29:50', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (148, 3, 144, 'ADATA', 1, 0, '2022-02-19 21:30:29', 0, '2022-02-19 21:30:29', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (149, 2, 18, '西数', 1, 0, '2022-02-19 21:31:48', 0, '2022-02-19 21:31:48', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (150, 2, 18, '希捷', 1, 0, '2022-02-19 21:31:52', 0, '2022-02-19 21:31:52', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (151, 2, 18, '东芝/凯侠', 1, 0, '2022-02-19 21:32:16', 0, '2022-02-23 18:45:40', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (152, 2, 18, '三星', 1, 0, '2022-02-19 21:32:21', 0, '2022-02-19 21:32:21', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (155, 3, 149, 'WD', 1, 0, '2022-02-19 21:33:53', 0, '2022-02-19 21:33:53', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (156, 3, 150, 'Seagate', 1, 0, '2022-02-19 21:34:20', 0, '2022-02-19 21:34:27', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (157, 3, 151, 'toshiba/kioxia', 1, 0, '2022-02-19 21:34:48', 0, '2022-02-23 18:46:03', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (158, 3, 152, 'Samsuug', 1, 0, '2022-02-19 21:35:25', 0, '2022-02-21 16:58:18', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (159, 2, 19, '海韵', 1, 0, '2022-02-21 18:15:02', 0, '2022-02-21 18:15:02', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (164, 3, 142, 'DDR5', 1, 0, '2022-02-22 17:30:48', 0, '2022-02-22 17:30:48', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (167, 3, 60, '3系', 1, 0, '2022-02-22 17:48:56', 0, '2022-02-22 17:48:56', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (168, 3, 60, '4系', 1, 0, '2022-02-22 17:49:04', 0, '2022-02-22 18:01:41', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (169, 3, 60, '5系', 1, 0, '2022-02-22 17:49:11', 0, '2022-02-22 17:49:11', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (170, 3, 61, '十代', 1, 0, '2022-02-22 17:49:26', 0, '2022-02-22 17:49:26', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (171, 3, 61, '十一代', 1, 0, '2022-02-22 17:49:38', 0, '2022-02-22 17:49:38', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (177, 3, 61, '十二代', 1, 0, '2022-02-22 18:00:45', 0, '2022-02-22 18:00:45', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (179, 2, 17, 'DDR4', 1, 0, '2022-02-22 18:02:31', 0, '2022-02-22 18:02:31', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (180, 2, 17, 'DDR5', 1, 0, '2022-02-22 18:02:36', 0, '2022-02-22 18:02:36', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (181, 3, 179, '美商海盗船', 1, 0, '2022-02-22 18:02:48', 0, '2022-02-22 18:02:48', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (182, 3, 179, '影驰', 1, 0, '2022-02-22 18:02:56', 0, '2022-02-22 18:02:56', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (183, 3, 179, '威刚', 1, 0, '2022-02-22 18:03:10', 0, '2022-02-22 18:03:10', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (184, 3, 180, '美商海盗船', 1, 0, '2022-02-22 18:04:21', 0, '2022-02-22 18:04:21', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (185, 3, 180, '威刚', 1, 0, '2022-02-22 18:04:26', 0, '2022-02-22 18:04:26', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (186, 3, 180, '影驰', 1, 1, '2022-02-22 18:04:41', 0, '2022-02-22 18:04:41', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (187, 2, 19, '振华', 1, 0, '2022-02-22 18:06:14', 0, '2022-02-22 18:06:14', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (188, 2, 19, '美商海盗船', 1, 0, '2022-02-22 18:06:21', 0, '2022-02-22 18:06:21', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (189, 3, 188, 'USCORSAIR', 1, 0, '2022-02-22 18:06:41', 0, '2022-02-22 18:06:41', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (190, 3, 187, 'SUPER FLOWER', 1, 0, '2022-02-22 18:07:00', 0, '2022-02-22 18:07:00', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (191, 3, 159, 'SEASONIC', 1, 0, '2022-02-22 18:07:16', 0, '2022-02-22 18:07:16', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (192, 2, 20, '追风者', 1, 0, '2022-02-22 18:08:56', 0, '2022-02-22 18:08:56', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (193, 2, 20, '恩杰', 1, 0, '2022-02-22 18:09:01', 0, '2022-02-22 18:09:01', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (194, 2, 20, '乔思伯', 1, 0, '2022-02-22 18:09:11', 0, '2022-02-22 18:09:11', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (195, 3, 192, 'PHANTEKS', 1, 0, '2022-02-22 18:09:27', 0, '2022-02-22 18:09:27', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (196, 3, 193, 'NZXT', 1, 0, '2022-02-22 18:09:47', 0, '2022-02-22 18:09:47', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (197, 3, 194, 'JONSBO', 1, 0, '2022-02-22 18:10:01', 0, '2022-02-22 18:10:01', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (198, 2, 21, '散热器', 1, 0, '2022-02-22 18:10:13', 0, '2022-02-22 18:10:13', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (199, 2, 21, '软件服务', 1, 0, '2022-02-22 18:10:21', 0, '2022-02-22 18:10:21', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (200, 2, 21, '硬件服务', 1, 0, '2022-02-22 18:10:34', 0, '2022-02-22 18:10:34', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (201, 3, 199, '系统安装', 1, 0, '2022-02-22 18:10:44', 0, '2022-02-22 18:10:44', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (202, 3, 199, '软件安装', 1, 0, '2022-02-22 18:10:50', 0, '2022-02-22 18:10:50', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (203, 3, 200, '装机服务', 1, 0, '2022-02-22 18:11:04', 0, '2022-02-22 18:11:04', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (204, 3, 200, '延保服务', 1, 0, '2022-02-22 18:11:13', 0, '2022-02-22 18:11:13', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (205, 3, 198, '猫头鹰', 1, 0, '2022-02-22 18:11:42', 0, '2022-02-22 18:11:42', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (206, 3, 198, '利民', 1, 0, '2022-02-22 18:12:22', 0, '2022-02-22 18:12:22', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (207, 3, 198, '乔思伯', 1, 0, '2022-02-22 18:12:33', 0, '2022-02-22 18:12:33', 0);

-- ----------------------------
-- Table structure for tb_newbee_mall_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_goods_info`;
CREATE TABLE `tb_newbee_mall_goods_info`  (
  `goods_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品表主键id',
  `goods_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名',
  `goods_intro` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商品简介',
  `goods_category_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联分类id',
  `goods_cover_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/admin/dist/img/no-img.png' COMMENT '商品主图',
  `goods_carousel` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/admin/dist/img/no-img.png' COMMENT '商品轮播图',
  `goods_detail_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品详情',
  `original_price` int(11) NOT NULL DEFAULT 1 COMMENT '商品价格',
  `selling_price` int(11) NOT NULL DEFAULT 1 COMMENT '商品实际售价',
  `stock_num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品库存数量',
  `tag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商品标签',
  `goods_sell_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '商品上架状态 1-下架 0-上架',
  `create_user` int(11) NOT NULL DEFAULT 0 COMMENT '添加者主键id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商品添加时间',
  `update_user` int(11) NOT NULL DEFAULT 0 COMMENT '修改者主键id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商品修改时间',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10942 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_newbee_mall_goods_info
-- ----------------------------
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10904, 'MSI/微星B350 TOMAHAWK 主板 战斧导弹M.2 支持锐龙R7 1800X', 'MSI/微星B350 TOMAHAWK', 167, 'http://localhost:28019/upload/20220222_20034079.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220222_2005320.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 599, 499, 122, 'Zen,DDR4', 0, 0, '2022-02-22 20:06:20', 0, '2022-02-22 20:06:20');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10905, 'AMD 锐龙主板 微星X470 GAMING PLUS MAX', '微星X470 GAMING PLUS MAX', 168, 'http://localhost:28019/upload/20220222_20400046.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220222_20413114.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 649, 549, 333, 'Zen,DDR4', 0, 0, '2022-02-22 20:41:54', 0, '2022-02-22 20:41:54');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10906, '微星（MSI） X570系列台式电脑AM4电竞游戏主板 RGB灯效AMD大板 X570-A PRO商用板', 'X570-A PRO', 169, 'http://localhost:28019/upload/20220222_20450083.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220222_20455425.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><img src=\"http://localhost:28019/upload/20220222_2045598.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 1499, 1249, 222, 'Zen,DDR4', 0, 0, '2022-02-22 20:46:03', 0, '2022-02-22 20:46:03');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10907, 'MSI/微星Z490 台式机电脑电竞游戏主板 支持10700K/10900K 11700 11900 【战无不胜WIFI6】Z490战神版', 'MSI/微星Z490', 170, 'http://localhost:28019/upload/20220223_17242271.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_17260048.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_17260577.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 1699, 1499, 111, '10,11,DDR4', 0, 0, '2022-02-23 17:26:09', 0, '2022-02-23 17:26:09');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10908, '华硕（ASUS）TUF GAMING B560M-PLUS WIFI 重炮手主板 支持 CPU 11700/11400F（Intel B560/LGA 1200）', '华硕（ASUS）B560M-PLUS WIFI', 171, 'http://localhost:28019/upload/20220223_17320435.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_17321072.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_17321545.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 899, 879, 110, '11,DDR4', 0, 0, '2022-02-23 17:32:30', 0, '2022-02-23 17:32:30');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10909, ' 微星(MSI)MAG B660M MORTAR DDR4 迫击炮电脑主板 支持CPU 12400 /12400F/12700/G7400(INTEL B660/LGA 1700)', '微星(MSI)MAG B660M MORTAR', 177, 'http://localhost:28019/upload/20220223_17414338.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_1741544.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_17415484.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_17415460.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_17415497.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 999, 999, 123, '12,DDR4', 0, 0, '2022-02-23 17:42:14', 0, '2022-02-23 17:42:14');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10910, '微星(MSI)PRO Z690-A DDR5电脑主板 支持CPU12700KF/12700K/12600K/12600KF（INTEL Z690 /LGA 1700）', '微星(MSI)PRO Z690-A DDR5', 177, 'http://localhost:28019/upload/20220223_1745306.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_17461977.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_17453845.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_17453821.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_17453850.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 1699, 1649, 111, '12,DDR5', 0, 0, '2022-02-23 17:46:21', 0, '2022-02-23 17:46:21');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10911, 'AMD Zen2 锐龙R5 3600 处理器 R5 3600 CPU', '锐龙R5 3600', 118, 'http://localhost:28019/upload/20220223_17532770.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_1753321.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_17533299.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 1499, 1299, 111, 'AM4,DDR4', 0, 0, '2022-02-23 17:53:34', 0, '2022-02-23 17:53:34');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10912, 'AMD Zen3 锐龙7 5700G处理器(r7)7nm 搭载Radeon Vega Graphic 8核16线程 3.8GHz 65W AM4接口 盒装CPU', 'AMD 锐龙7 5700G', 119, 'http://localhost:28019/upload/20220223_17581963.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_17582699.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_17582698.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_17582610.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 2499, 2299, 111, 'AM4', 0, 0, '2022-02-23 17:58:32', 0, '2022-02-23 17:58:32');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10913, 'INTEL 十代 盒装CPU I5 10500 CPU处理器', ' I5 10500', 120, 'http://localhost:28019/upload/20220223_1802522.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_18062878.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_1807076.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 1299, 1099, 111, '10', 0, 0, '2022-02-23 18:07:09', 0, '2022-02-23 18:07:09');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10914, ' 第11代英特尔酷睿 Intel i7-11700F 盒装CPU处理器 8核16线程 单核睿频至高可达4.9Ghz', 'Intel i7-11700F ', 121, 'http://localhost:28019/upload/20220223_18103491.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_18114835.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_18114894.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_18114874.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 2299, 2099, 111, '11', 0, 0, '2022-02-23 18:11:49', 0, '2022-02-23 18:11:49');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10915, '英特尔(Intel)12代酷睿 i9-12900 台式机CPU处理器 16核24线程 单核睿频至高可达5.1Ghz 30M三级缓存', 'INTEL i9-12900 ', 122, 'http://localhost:28019/upload/20220223_18150075.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_18150577.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_18150599.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_18150510.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 4899, 4899, 111, '12', 0, 0, '2022-02-23 18:15:07', 0, '2022-02-23 18:15:07');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10916, '美商海盗船（USCORSAIR）16GB(8Gx2)套装 DDR4 3600 台式机内存条 复仇者LPX系列 游戏型', '美商海盗船（USCORSAIR）16GB(8Gx2)', 181, 'http://localhost:28019/upload/20220223_18164287.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_18192053.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_18192019.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 499, 479, 111, 'DDR4', 0, 0, '2022-02-23 18:19:45', 0, '2022-02-23 18:25:49');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10917, '影驰（Galaxy）16GB(8Gx2) RGB DDR4 3600 台式机内存条 名人堂HOF Pro系列', '影驰（Galaxy）16GB(8Gx2) ', 182, 'http://localhost:28019/upload/20220223_18240277.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_18250057.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_18250045.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 899, 849, 111, 'DDR4', 0, 0, '2022-02-23 18:25:13', 0, '2022-02-23 18:25:13');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10918, '威刚XPG龙耀D50 DDR4超频RGB灯条3200 3600 16/32G台式机ROG吹雪内存 龙耀D50 8G*2 3600（釉白）', '威刚XPG龙耀D50 8G*2 ', 183, 'http://localhost:28019/upload/20220223_18275274.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_18305830.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_18311239.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 699, 649, 111, 'DDR4', 0, 0, '2022-02-23 18:31:13', 0, '2022-02-23 18:31:13');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10919, '威刚（ADATA）XPG 龙耀 LANCER DDR5 16G*2 RGB灯条 龙耀LANCER 5200 16G*2 RGB', 'DDR5 16G*2 RGB灯条', 185, 'http://localhost:28019/upload/20220223_18330964.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_18332097.png\"/><br/><img src=\"http://localhost:28019/upload/20220223_18332097.png\"/><br/><img src=\"http://localhost:28019/upload/20220223_18332097.png\"/><br/><img src=\"http://localhost:28019/upload/20220223_18334885.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_18332042.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/></p>', 3099, 2999, 11, 'DDR5', 0, 0, '2022-02-23 18:33:50', 0, '2022-02-23 18:34:17');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10920, '美商海盗船（USCORSAIR） 32GB(16Gx2)套装 DDR5 5600 台式机内存条 统治者铂金 RGB灯条 高端游戏型', '美商海盗船（USCORSAIR） 32GB(16Gx2)套装 DDR5 5600', 184, 'http://localhost:28019/upload/20220223_18354714.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_18361110.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_1836245.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 3599, 3399, 11, 'DDR5', 0, 0, '2022-02-23 18:36:25', 0, '2022-02-23 18:36:25');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10921, '西部数据(WD)蓝盘 1TB SATA6Gb/s 7200转64MB 台式机械硬盘(WD10EZEX)', '西部数据(WD)蓝盘 1TB', 155, 'http://localhost:28019/upload/20220223_18393796.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_18381384.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_18382551.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 289, 269, 11, 'SATA', 0, 0, '2022-02-23 18:39:39', 0, '2022-02-23 18:39:39');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10922, '西部数据（Western Digital）1TB SSD固态硬盘 M.2接口（NVMe协议） WD Blue SN570 四通道PCIe 高速', '西部数据（Western Digital）1TB SSD固态', 156, 'http://localhost:28019/upload/20220223_18415166.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_1842167.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_1842369.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 749, 699, 111, 'NVME', 0, 0, '2022-02-23 18:42:37', 0, '2022-02-23 18:42:37');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10923, '希捷(Seagate)2TB 256MB 7200RPM 台式机机械硬盘 SATA接口 希捷酷鱼BarraCuda系列(ST2000DM008)', '希捷(Seagate)2TB 256MB', 156, 'http://localhost:28019/upload/20220223_18433825.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_18441443.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_18443878.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_1844514.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 379, 359, 111, 'SATA', 0, 0, '2022-02-23 18:44:52', 0, '2022-02-23 18:44:52');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10924, '铠侠 ssd固态硬盘m.2（原东芝）铠侠 rc20 台式机/笔记本硬盘NVME协议 RC20 1TB', '铠侠rc20', 157, 'http://localhost:28019/upload/20220223_18473570.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_18475585.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_18480719.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 599, 589, 11, 'NVME', 0, 0, '2022-02-23 18:48:09', 0, '2022-02-23 18:48:09');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10925, '三星（SAMSUNG）1TB SSD固态硬盘 M.2接口(NVMe协议) 980（MZ-V8V1T0BW）', '三星（SAMSUNG）1TB SSD 980', 158, 'http://localhost:28019/upload/20220223_18492192.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_18494457.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_18500168.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 849, 839, 11, 'NVME', 0, 0, '2022-02-23 18:50:09', 0, '2022-02-23 18:50:09');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10926, '海韵 (SEASONIC)FOCUS GX850 850W电源 80PLUS金牌全模 10年质保 全日系电容 14cm小身形 智能温控风扇启停', '海韵 (SEASONIC)FOCUS GX850', 191, 'http://localhost:28019/upload/20220223_18530923.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_18532371.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_18533548.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 1099, 1049, 123, '850w', 0, 0, '2022-02-23 18:53:38', 0, '2022-02-23 18:53:38');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10927, '振华（SUPER FLOWER）额定650W LEADEX G 650 电源 (80PLUS金牌/全模组/ 十年保固）', '振华（SUPER FLOWER）额定650W', 190, 'http://localhost:28019/upload/20220223_18545465.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_18550995.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_18552326.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 769, 739, 111, '650w', 0, 0, '2022-02-23 18:55:24', 0, '2022-02-23 18:55:24');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10928, '美商海盗船 (USCORSAIR) RM750x 2021款 750W电源 金牌认证/全模组/风扇启停/超长质保', '美商海盗船 (USCORSAIR) RM750x ', 189, 'http://localhost:28019/upload/20220223_18571243.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_18572483.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_18573761.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 849, 799, 111, '750w', 0, 0, '2022-02-23 18:57:40', 0, '2022-02-23 18:57:40');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10929, '追风者(PHANTEKS) 416PC主动降音版 台式全金属水冷电脑机箱(支持360水冷/8硬盘位/独立电源仓)', '追风者(PHANTEKS) 416PC', 195, 'http://localhost:28019/upload/20220223_18585459.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_18595352.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_1859431.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 299, 269, 111, '机箱', 0, 0, '2022-02-23 18:59:54', 0, '2022-02-23 18:59:54');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10930, '恩杰 NZXT H510 白色 DIY中塔ATX机箱（前置USB-C/280水冷支持/钢化玻璃侧透）', '恩杰 NZXT H510 白色 ', 196, 'http://localhost:28019/upload/20220223_19005220.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_19010780.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_19011785.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_19013035.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 499, 459, 123, '机箱', 0, 0, '2022-02-23 19:01:31', 0, '2022-02-23 19:01:31');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10931, '乔思伯(JONSBO) D40 银色 ATX机箱(支持ATX主板/铝制外壳/ATX电源/240冷排位/长显卡支持)', '乔思伯(JONSBO) D40 银色', 197, 'http://localhost:28019/upload/20220223_2019154.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_20193819.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_20200361.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_2020211.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 399, 389, 111, '机箱', 0, 0, '2022-02-23 20:20:23', 0, '2022-02-23 20:20:23');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10932, '猫头鹰（NOCTUA）NH-D15 CPU散热器 （多平台1151/2011/AMD/双风扇A15PWM）', '猫头鹰（NOCTUA）NH-D15 ', 205, 'http://localhost:28019/upload/20220223_20222071.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_20223858.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_20224935.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_20230396.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_20231910.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 699, 699, 111, '散热器', 0, 0, '2022-02-23 20:23:20', 0, '2022-02-23 20:23:20');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10933, '利民（Thermalright） FS140 霜灵 AGHP热管 双塔散热器全电镀 回流焊8mm 热管 S-FDB轴承 风扇 TF7 硅脂', '利民（Thermalright） FS140', 206, 'http://localhost:28019/upload/20220223_20255452.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_20260991.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_20262869.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_20264256.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 299, 259, 111, '散热器', 0, 0, '2022-02-23 20:26:44', 0, '2022-02-23 20:26:44');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10934, '乔思伯（JONSBO）CR-2000GT 塔式CPU散热器（双塔双风扇/主板5VARGB同步/6热管/多平台/附硅脂）', '乔思伯（JONSBO）CR-2000GT', 207, 'http://localhost:28019/upload/20220223_20280849.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:28019/upload/20220223_20282479.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:28019/upload/20220223_20283984.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 259, 239, 111, '散热器', 0, 0, '2022-02-23 20:28:41', 0, '2022-02-23 20:28:41');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10935, '系统安装 WIN7/10/11 LINUX安装 ', '系统安装', 201, 'http://localhost:28019/upload/20220223_20303472.png', '/admin/dist/img/no-img.png', '<p>购买硬盘可享受低价安装系统</p>', 79, 10, 999, '系统安装', 0, 0, '2022-02-23 20:30:59', 0, '2022-02-23 20:30:59');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10936, '软件安装 OFFICE ADOBE CAD 各类办公软件安装', '软件安装', 202, 'http://localhost:28019/upload/20220223_20330073.png', '/admin/dist/img/no-img.png', '<p>各类办公软件下载安装</p>', 99, 88, 9999, '软件安装', 0, 0, '2022-02-23 20:33:20', 0, '2022-02-23 20:33:20');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10937, '整机延保一年 单拍不发货', '整机延保', 204, 'http://localhost:28019/upload/20220223_20344999.png', '/admin/dist/img/no-img.png', '<p>整机延保一年，只需整机5%费用，请自行添加</p>', 1, 1, 9993, '1', 0, 0, '2022-02-23 20:35:55', 0, '2022-02-23 20:47:03');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10938, '整机延保一年 单拍不发货10', '整机延保', 204, 'http://localhost:28019/upload/20220223_2046355.png', '/admin/dist/img/no-img.png', '<p>整机延保一年，只需整机5%费用，请自行添加</p>', 10, 10, 9999, '整机延保', 0, 0, '2022-02-23 20:46:52', 0, '2022-02-23 20:47:07');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10939, '整机延保一年 单拍不发货100', '整机延保', 204, 'http://localhost:28019/upload/20220223_20475153.png', '/admin/dist/img/no-img.png', '<p>整机延保一年，只需整机5%费用，请自行添加<br/></p>', 100, 100, 9999, '整机延保', 0, 0, '2022-02-23 20:48:18', 0, '2022-02-23 20:49:02');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10940, '整机延保一年 单拍不发货1000', '整机延保', 204, 'http://localhost:28019/upload/20220223_20482979.png', '/admin/dist/img/no-img.png', '<p>整机延保一年，只需整机5%费用，请自行添加<br/></p>', 1000, 1000, 9999, '整机延保', 0, 0, '2022-02-23 20:48:50', 0, '2022-02-23 20:49:18');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10941, '装机服务', '装机服务', 203, 'http://localhost:28019/upload/20220225_10165752.png', '/admin/dist/img/no-img.png', '<p>装机服务</p>', 100, 100, 9999, '装机服务', 0, 0, '2022-02-25 10:17:04', 0, '2022-02-25 10:17:04');

-- ----------------------------
-- Table structure for tb_newbee_mall_index_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_index_config`;
CREATE TABLE `tb_newbee_mall_index_config`  (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '首页配置项主键id',
  `config_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '显示字符(配置搜索时不可为空，其他可为空)',
  `config_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1-搜索框热搜 2-搜索下拉框热搜 3-(首页)热销商品 4-(首页)新品上线 5-(首页)为你推荐',
  `goods_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '商品id 默认为0',
  `redirect_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '##' COMMENT '点击后的跳转地址(默认不跳转)',
  `config_rank` int(11) NOT NULL DEFAULT 0 COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` int(11) NOT NULL DEFAULT 0 COMMENT '创建者id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
  `update_user` int(11) NULL DEFAULT 0 COMMENT '修改者id',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_newbee_mall_index_config
-- ----------------------------
INSERT INTO `tb_newbee_mall_index_config` VALUES (32, 'B350', 3, 10904, '##', 1, 1, '2022-02-22 20:25:47', 0, '2022-02-24 00:21:06', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (33, 'B350', 4, 10904, '##', 1, 1, '2022-02-22 20:25:59', 0, '2022-02-24 00:22:31', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (34, 'B450', 5, 10904, '##', 1, 0, '2022-02-22 20:26:08', 0, '2022-02-22 20:26:08', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (35, '微星X470 GAMING PLUS MAX', 3, 10905, '##', 1, 0, '2022-02-24 00:22:08', 0, '2022-02-24 00:22:08', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (36, 'X570-A PRO', 4, 10906, '##', 1, 0, '2022-02-24 00:23:04', 0, '2022-02-24 00:23:04', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (37, '锐龙R5 3600', 3, 10911, '##', 1, 0, '2022-02-24 00:23:30', 0, '2022-02-24 00:23:30', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (38, 'I5 10500', 3, 10913, '##', 1, 0, '2022-02-24 00:23:46', 0, '2022-02-24 00:23:46', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (39, '美商海盗船（USCORSAIR）16GB(8Gx2)', 3, 10916, '##', 1, 0, '2022-02-24 00:25:30', 0, '2022-02-24 00:25:30', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (40, '微星(MSI)PRO Z690-A DDR5', 4, 10910, '##', 1, 0, '2022-02-24 00:26:08', 0, '2022-02-24 00:26:08', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (41, 'INTEL i9-12900 ', 4, 10915, '##', 1, 0, '2022-02-24 00:26:30', 0, '2022-02-24 00:26:30', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (42, 'ADATA DDR5 16G*2 RGB灯条', 4, 10919, '##', 1, 0, '2022-02-24 00:27:02', 0, '2022-02-24 00:27:02', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (43, 'AMD 锐龙7 5700G', 5, 10912, '##', 1, 0, '2022-02-24 00:27:22', 0, '2022-02-24 00:27:22', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (44, '威刚XPG龙耀D50 8G*2', 5, 10918, '##', 1, 0, '2022-02-24 00:27:45', 0, '2022-02-24 00:27:45', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (45, '铠侠rc20', 5, 10924, '##', 1, 0, '2022-02-24 00:27:58', 0, '2022-02-24 00:27:58', 0);

-- ----------------------------
-- Table structure for tb_newbee_mall_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_order`;
CREATE TABLE `tb_newbee_mall_order`  (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单表主键id',
  `order_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户主键id',
  `total_price` int(11) NOT NULL DEFAULT 1 COMMENT '订单总价',
  `pay_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '支付状态:0.未支付,1.支付成功,-1:支付失败',
  `pay_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0.无 1.支付宝支付 2.微信支付',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `order_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '订单状态:0.待支付 1.已支付 2.配货完成 3:出库成功 4.交易成功 -1.手动关闭 -2.超时关闭 -3.商家关闭',
  `extra_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单body',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_newbee_mall_order
-- ----------------------------
INSERT INTO `tb_newbee_mall_order` VALUES (1, '16455326373161307', 7, 499, 1, 1, '2022-02-22 20:23:58', 4, '', 0, '2022-02-22 20:23:57', '2022-02-24 00:48:15');
INSERT INTO `tb_newbee_mall_order` VALUES (2, '16457159511449596', 7, 885, 1, 1, '2022-02-24 23:19:13', 4, '', 0, '2022-02-24 23:19:11', '2022-02-25 02:01:37');

-- ----------------------------
-- Table structure for tb_newbee_mall_order_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_order_address`;
CREATE TABLE `tb_newbee_mall_order_address`  (
  `order_id` bigint(20) NOT NULL,
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `user_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人手机号',
  `province_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '省',
  `city_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '城',
  `region_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '区',
  `detail_address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收件详细地址(街道/楼宇/单元)',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单收货地址关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_newbee_mall_order_address
-- ----------------------------
INSERT INTO `tb_newbee_mall_order_address` VALUES (1, '黄振斌', '13048069825', '广东省', '广州市', '海珠区', '海印桥南');
INSERT INTO `tb_newbee_mall_order_address` VALUES (2, '黄振斌', '13048069825', '广东省', '广州市', '海珠区', '海印桥南');

-- ----------------------------
-- Table structure for tb_newbee_mall_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_order_item`;
CREATE TABLE `tb_newbee_mall_order_item`  (
  `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单关联购物项主键id',
  `order_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '订单主键id',
  `goods_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联商品id',
  `goods_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '下单时商品的名称(订单快照)',
  `goods_cover_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '下单时商品的主图(订单快照)',
  `selling_price` int(11) NOT NULL DEFAULT 1 COMMENT '下单时商品的价格(订单快照)',
  `goods_count` int(11) NOT NULL DEFAULT 1 COMMENT '数量(订单快照)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`order_item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_newbee_mall_order_item
-- ----------------------------
INSERT INTO `tb_newbee_mall_order_item` VALUES (1, 1, 10904, 'MSI/微星B350 TOMAHAWK 主板 战斧导弹M...', 'http://localhost:28019/upload/20220222_20034079.png', 499, 1, '2022-02-22 20:23:57');
INSERT INTO `tb_newbee_mall_order_item` VALUES (2, 2, 10908, '华硕（ASUS）TUF GAMING B560M-PLU...', 'http://localhost:28019/upload/20220223_17320435.png', 879, 1, '2022-02-24 23:19:11');
INSERT INTO `tb_newbee_mall_order_item` VALUES (3, 2, 10937, '整机延保一年 单拍不发货', 'http://localhost:28019/upload/20220223_20344999.png', 1, 6, '2022-02-24 23:19:11');

-- ----------------------------
-- Table structure for tb_newbee_mall_shopping_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_shopping_cart_item`;
CREATE TABLE `tb_newbee_mall_shopping_cart_item`  (
  `cart_item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物项主键id',
  `user_id` bigint(20) NOT NULL COMMENT '用户主键id',
  `goods_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联商品id',
  `goods_count` int(11) NOT NULL DEFAULT 1 COMMENT '数量(最大为5)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
  PRIMARY KEY (`cart_item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_newbee_mall_shopping_cart_item
-- ----------------------------
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (1, 7, 10893, 1, 0, '2022-02-19 21:24:52', '2022-02-19 21:24:52');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (2, 7, 10904, 1, 1, '2022-02-22 20:23:06', '2022-02-22 20:23:06');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (3, 7, 10908, 1, 1, '2022-02-23 17:33:36', '2022-02-23 17:33:36');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (4, 7, 10937, 6, 1, '2022-02-23 20:36:02', '2022-02-23 21:58:56');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (5, 7, 10910, 1, 1, '2022-02-25 09:28:40', '2022-02-25 09:28:40');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (6, 7, 10919, 1, 1, '2022-02-25 09:28:52', '2022-02-25 09:28:52');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (7, 7, 10941, 1, 1, '2022-02-25 10:20:47', '2022-02-25 10:20:47');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (8, 7, 10941, 1, 1, '2022-02-25 10:23:11', '2022-02-25 10:23:11');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (9, 7, 10941, 1, 1, '2022-02-25 10:23:49', '2022-02-25 10:23:49');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (10, 7, 10941, 1, 1, '2022-02-25 10:24:02', '2022-02-25 10:24:02');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (11, 7, 10910, 1, 0, '2022-02-25 11:51:29', '2022-02-25 11:51:29');

-- ----------------------------
-- Table structure for tb_newbee_mall_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_user`;
CREATE TABLE `tb_newbee_mall_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户主键id',
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `login_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登陆名称(默认为手机号)',
  `password_md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'MD5加密后的密码',
  `introduce_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '个性签名',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '注销标识字段(0-正常 1-已注销)',
  `locked_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '锁定标识字段(0-未锁定 1-已锁定)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_newbee_mall_user
-- ----------------------------
INSERT INTO `tb_newbee_mall_user` VALUES (7, 'ichi', '13048069825', 'e10adc3949ba59abbe56e057f20f883e', 'HZB', 0, 0, '2022-01-17 23:03:43');
INSERT INTO `tb_newbee_mall_user` VALUES (8, '13048069820', '13048069820', 'e10adc3949ba59abbe56e057f20f883e', '随新所欲，蜂富多彩', 0, 1, '2022-01-17 23:23:40');

-- ----------------------------
-- Table structure for tb_newbee_mall_user_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_user_address`;
CREATE TABLE `tb_newbee_mall_user_address`  (
  `address_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户主键id',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `user_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人手机号',
  `default_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否为默认 0-非默认 1-是默认',
  `province_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '省',
  `city_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '城',
  `region_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '区',
  `detail_address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收件详细地址(街道/楼宇/单元)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收货地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_newbee_mall_user_address
-- ----------------------------
INSERT INTO `tb_newbee_mall_user_address` VALUES (1, 7, '黄振斌', '13048069825', 0, '广东省', '广州市', '海珠区', '海印桥南', 0, '2022-02-22 20:23:52', '2022-02-25 12:50:44');
INSERT INTO `tb_newbee_mall_user_address` VALUES (2, 7, '黄振斌', '13048069825', 1, '北京', '北京市', '西城区', '1', 0, '2022-02-25 12:50:27', '2022-02-25 12:50:44');

-- ----------------------------
-- Table structure for tb_newbee_mall_user_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_user_token`;
CREATE TABLE `tb_newbee_mall_user_token`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户主键id',
  `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'token值(32位字符串)',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `expire_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'token过期时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `uq_token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_newbee_mall_user_token
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

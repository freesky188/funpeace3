
CREATE DATABASE `fundb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


use fundb;
/*
 Navicat Premium Data Transfer

 Source Server         : macMysql
 Source Server Type    : MySQL
 Source Server Version : 50712
 Source Host           : localhost
 Source Database       : fundb

 Target Server Type    : MySQL
 Target Server Version : 50712
 File Encoding         : utf-8

 Date: 11/13/2017 23:16:28 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id号',
  `account` varchar(20) DEFAULT '' COMMENT '账号',
  `password` varchar(120) DEFAULT '' COMMENT '密码',
  `password_salt` varchar(60) DEFAULT '' COMMENT '密码盐，密码变时要重新生成',
  `name` varchar(20) DEFAULT '' COMMENT '姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_ip` varchar(120) DEFAULT NULL COMMENT '创建ip',
  `last_login_time` datetime DEFAULT NULL COMMENT '最近登录时间',
  `last_login_ip` varchar(120) DEFAULT NULL COMMENT '最近登陆ip',
  `login_count` int(11) DEFAULT '0' COMMENT '登陆次数',
  `state` int(1) DEFAULT '0' COMMENT '状态,1可用,0不可用',
  `session_id` varchar(255) DEFAULT NULL,
  `error_time` datetime DEFAULT NULL COMMENT '登陆错误时间',
  `error_ip` varchar(120) DEFAULT NULL COMMENT '登陆错误ip',
  `error_count` int(11) DEFAULT '0' COMMENT '登陆错误数量',
  `login_ip` varchar(120) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `admin`
-- ----------------------------
BEGIN;
INSERT INTO `admin` VALUES ('1', 'admin', '380c0166c1ac26c03aaabc828041bfd630d90654da9ae9ec63979e206fb7594c', 'x39842zjmu48', '管理员', '2017-10-07 21:24:56', '127.0.0.1', '2017-11-13 17:46:52', '127.0.0.1', '170', '1', '2C870674B89A6E2B2A14C3D47D883061', '2017-10-19 11:15:14', '127.0.0.1', '0', '127.0.0.1', '2017-11-13 17:53:36');
COMMIT;

-- ----------------------------
--  Table structure for `admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `category` int(11) NOT NULL COMMENT '日志类型',
  `log_time` datetime NOT NULL COMMENT '日志时间',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL地址',
  `title` varchar(255) DEFAULT NULL COMMENT '日志标题',
  `content` varchar(255) DEFAULT NULL COMMENT '日志内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8mb4 COMMENT='管理员日志表';

-- ----------------------------
--  Table structure for `demand`
-- ----------------------------
DROP TABLE IF EXISTS `demand`;
CREATE TABLE `demand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) DEFAULT NULL COMMENT '年龄',
  `description` varchar(12000) DEFAULT '0' COMMENT '姓别,1女,2男,0未知',
  `price` int(11) DEFAULT NULL COMMENT '价格',
  `city` varchar(120) DEFAULT NULL,
  `status` int(1) DEFAULT '0' COMMENT '0待接受,1进行中,2已完成,3已关闭',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `end_time` datetime DEFAULT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT '0',
  `order_start_time` datetime DEFAULT NULL,
  `order_finish_time` datetime DEFAULT NULL,
  `pay_type` int(1) DEFAULT '0' COMMENT '0当面支付,1支付宝支付,2微信支付',
  `pay_status` int(1) DEFAULT '0' COMMENT '0未支付,1已支付',
  `pay_time` datetime DEFAULT NULL,
  `pay_no` varchar(120) DEFAULT NULL COMMENT '支付成功返回编号',
  `from_mobile` varchar(20) DEFAULT NULL,
  `to_mobile` varchar(20) DEFAULT NULL,
  `location` varchar(600) DEFAULT NULL COMMENT '具体位置信息',
  `longitude` varchar(20) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(20) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `feedback`
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(12000) DEFAULT NULL COMMENT '内容',
  `status` int(1) DEFAULT '0' COMMENT '状态,1已处理,0未处理',
  `create_time` datetime DEFAULT NULL COMMENT '提交时间',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `handle_admin_id` int(11) DEFAULT NULL COMMENT '处理人',
  `handle_content` varchar(1200) DEFAULT NULL COMMENT '处理意见',
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(120) DEFAULT NULL,
  `user_mobile` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `sms_code`
-- ----------------------------
DROP TABLE IF EXISTS `sms_code`;
CREATE TABLE `sms_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id号',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `code` varchar(20) DEFAULT NULL COMMENT '验证码',
  `device_type` int(1) DEFAULT '0' COMMENT '设备类型,1ios,0android',
  `device_id` varchar(120) DEFAULT '' COMMENT '设备id号',
  `device_name` varchar(120) DEFAULT '' COMMENT '设备名称',
  `ip` varchar(120) DEFAULT '' COMMENT 'ip地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id号',
  `name` varchar(200) DEFAULT '' COMMENT '用户昵称',
  `icon` varchar(200) DEFAULT '' COMMENT '头像图标路径',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号',
  `gender` int(1) DEFAULT '0' COMMENT '姓别,1女,2男,0未知',
  `city` varchar(120) DEFAULT '' COMMENT '城市',
  `country` varchar(120) DEFAULT NULL COMMENT '所属国家',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `access_token` varchar(120) DEFAULT '' COMMENT '登录token',
  `sign_token` varchar(120) DEFAULT NULL COMMENT '签名token',
  `token_status` int(1) DEFAULT '1' COMMENT '状态,0正常退出,1正在使用',
  `login_time` datetime DEFAULT NULL,
  `device_id` varchar(120) DEFAULT NULL,
  `device_type` int(1) DEFAULT NULL,
  `device_name` varchar(120) DEFAULT NULL,
  `push_token` varchar(120) DEFAULT NULL COMMENT '第三方推送所用',
  `password` varchar(120) DEFAULT NULL,
  `password_salt` varchar(120) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `ip` varchar(120) DEFAULT NULL,
  `open_type` int(11) DEFAULT NULL COMMENT '第三方登录方式,1facebook,2google',
  `open_id` varchar(120) DEFAULT NULL COMMENT '第三方登录id',
  `open_token` varchar(120) DEFAULT NULL COMMENT '第三方登录token',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user_access`
-- ----------------------------
DROP TABLE IF EXISTS `user_access`;
CREATE TABLE `user_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `country` varchar(120) NOT NULL COMMENT '所在国家',
  `city` varchar(120) DEFAULT NULL,
  `device_id` varchar(120) DEFAULT NULL,
  `device_name` varchar(600) DEFAULT NULL,
  `device_type` int(1) DEFAULT NULL,
  `app_version` varchar(120) DEFAULT NULL,
  `ip` varchar(120) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `video`
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id号',
  `title` varchar(120) DEFAULT NULL COMMENT '视频标题',
  `thumbnail` varchar(360) DEFAULT NULL COMMENT '视频截图',
  `status` int(1) DEFAULT '0' COMMENT '视频状态0: 审核中 1: 审核通过 2: 审核未通过',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `release_time` datetime DEFAULT NULL COMMENT '发布时间',
  `description` varchar(1200) DEFAULT NULL COMMENT '视频简要描述',
  `author` varchar(60) DEFAULT NULL COMMENT '作者',
  `source` varchar(120) DEFAULT NULL COMMENT '来源',
  `plays` int(11) DEFAULT '0' COMMENT '总播放数',
  `plays_day` int(11) DEFAULT '0' COMMENT '日播放数',
  `plays_week` int(11) DEFAULT '0' COMMENT '周播放数',
  `plays_month` int(11) DEFAULT '0' COMMENT '月播放数',
  `plays_last_day` int(11) DEFAULT '0' COMMENT '日播放数',
  `plays_last_week` int(11) DEFAULT '0' COMMENT '周播放数',
  `plays_last_month` int(11) DEFAULT '0' COMMENT '月播放数',
  `favorites` int(11) DEFAULT '0' COMMENT '总收藏数',
  `favorites_day` int(11) DEFAULT '0' COMMENT '日收藏数',
  `favorites_week` int(11) DEFAULT '0' COMMENT '周收藏数',
  `favorites_month` int(11) DEFAULT '0' COMMENT '月收藏数',
  `favorites_last_day` int(11) DEFAULT '0' COMMENT '日收藏数',
  `favorites_last_week` int(11) DEFAULT '0' COMMENT '周收藏数',
  `favorites_last_month` int(11) DEFAULT '0' COMMENT '月收藏数',
  `comments` int(11) DEFAULT '0' COMMENT '总评论数',
  `comments_day` int(11) DEFAULT '0' COMMENT '日评论数',
  `comments_week` int(11) DEFAULT '0' COMMENT '周评论数',
  `comments_month` int(11) DEFAULT '0' COMMENT '月评论数',
  `comments_last_day` int(11) DEFAULT '0' COMMENT '日评论数',
  `comments_last_week` int(11) DEFAULT '0' COMMENT '周评论数',
  `comments_last_month` int(11) DEFAULT '0' COMMENT '月评论数',
  `shares` int(11) DEFAULT '0' COMMENT '总分享数',
  `shares_day` int(11) DEFAULT '0' COMMENT '日分享数',
  `shares_week` int(11) DEFAULT '0' COMMENT '周分享数',
  `shares_month` int(11) DEFAULT '0' COMMENT '月分享数',
  `shares_last_day` int(11) DEFAULT '0' COMMENT '日分享数',
  `shares_last_week` int(11) DEFAULT '0' COMMENT '周分享数',
  `shares_last_month` int(11) DEFAULT '0' COMMENT '月分享数',
  `admin_id` int(11) DEFAULT '0' COMMENT '后台上传管理员id',
  `is_recommend` int(1) DEFAULT '0' COMMENT '是否推荐,0不推荐,1推荐',
  `recommend_level` int(11) DEFAULT '0' COMMENT '推荐级别',
  `recommend_date` date DEFAULT NULL COMMENT '置顶到期时间',
  `is_delete` int(1) DEFAULT '0' COMMENT '是否删除,1已删除,0未删除',
  `check_reason` varchar(600) DEFAULT NULL COMMENT '审核未通过原因',
  `hd_path` varchar(360) DEFAULT NULL,
  `sd_path` varchar(360) DEFAULT NULL,
  `fhd_path` varchar(360) DEFAULT NULL,
  `hd_size` int(11) DEFAULT NULL,
  `sd_size` int(11) DEFAULT NULL,
  `fhd_size` int(11) DEFAULT NULL,
  `hd_duration` int(11) DEFAULT NULL,
  `sd_duration` int(11) DEFAULT NULL,
  `fhd_duration` int(11) DEFAULT NULL,
  `sd_plays` int(11) DEFAULT '0' COMMENT 'sd总播放数',
  `hd_plays` int(11) DEFAULT '0' COMMENT 'hd总播放数',
  `fhd_plays` int(11) DEFAULT '0' COMMENT 'fhd总播放数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `video_comment`
-- ----------------------------
DROP TABLE IF EXISTS `video_comment`;
CREATE TABLE `video_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `user_icon` varchar(120) DEFAULT NULL,
  `time` datetime NOT NULL COMMENT '评论时间',
  `ip` varchar(150) NOT NULL COMMENT '评论IP',
  `content` varchar(1200) NOT NULL COMMENT '评论内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='评论记录';

-- ----------------------------
--  Table structure for `video_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `video_favorite`;
CREATE TABLE `video_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `user_icon` varchar(120) DEFAULT NULL,
  `time` datetime NOT NULL COMMENT '时间',
  `ip` varchar(150) NOT NULL COMMENT 'IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收藏记录';

-- ----------------------------
--  Table structure for `video_share`
-- ----------------------------
DROP TABLE IF EXISTS `video_share`;
CREATE TABLE `video_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `user_icon` varchar(120) DEFAULT NULL,
  `time` datetime NOT NULL COMMENT '时间',
  `ip` varchar(150) NOT NULL COMMENT 'IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分享记录';

-- ----------------------------
--  Table structure for `withdraw_cash`
-- ----------------------------
DROP TABLE IF EXISTS `withdraw_cash`;
CREATE TABLE `withdraw_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` int(11) DEFAULT NULL COMMENT '金额',
  `status` int(1) DEFAULT '0' COMMENT '状态,1已处理,0未处理',
  `create_time` datetime DEFAULT NULL COMMENT '提交时间',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `handle_admin_id` int(11) DEFAULT NULL COMMENT '处理人',
  `remark` varchar(1200) DEFAULT NULL COMMENT '备注',
  `type` int(1) DEFAULT NULL COMMENT '提现类型，1支付宝,2微信',
  `account` varchar(120) DEFAULT NULL COMMENT '提现账号',
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(120) DEFAULT NULL,
  `user_mobile` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;

/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : agency

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2018-02-24 20:15:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `AdminId` int(11) NOT NULL auto_increment,
  `A_Account` varchar(255) default NULL,
  `A_PSW` varchar(255) default NULL,
  PRIMARY KEY  (`AdminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '123', '1');

-- ----------------------------
-- Table structure for adver
-- ----------------------------
DROP TABLE IF EXISTS `adver`;
CREATE TABLE `adver` (
  `AdverId` int(11) NOT NULL auto_increment,
  `A_Title` varchar(255) default NULL,
  `A_Content` varchar(255) default NULL,
  `A_Status` varchar(255) default NULL,
  `IS_Delete` varchar(255) default NULL,
  PRIMARY KEY  (`AdverId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adver
-- ----------------------------

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `HouseId` int(11) NOT NULL auto_increment,
  `H_Area` varchar(255) default NULL,
  `H_Addre` varchar(255) default NULL,
  `H_Price` varchar(255) default NULL,
  `H_Type` varchar(255) default NULL,
  `IS_Delete` varchar(255) default NULL,
  `H_Name` varchar(255) default NULL,
  `IS_Rent` varchar(255) default NULL,
  `IS_Good` varchar(255) default NULL,
  `UserId` int(11) default NULL,
  PRIMARY KEY  (`HouseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES ('10', '1', '河大', '100', '三室一厅', '否', '紫', '否', '否', '2');
INSERT INTO `house` VALUES ('11', '11', '11', '11', '11', '否', '00000', '否', '否', '2');
INSERT INTO `house` VALUES ('12', '1', '11', '11', '11', '否', '1', '否', '否', '2');
INSERT INTO `house` VALUES ('13', '1', '11', '11', '11', '否', '1', '否', '否', '2');
INSERT INTO `house` VALUES ('14', '100', '河大', '100', '三室一厅', '否', '紫园小区', '否', '否', '2');
INSERT INTO `house` VALUES ('15', '100', '河大', '100', '三室一厅', '否', '紫园小区', '否', '否', '2');
INSERT INTO `house` VALUES ('16', '1', '11', '11', '1', '否', '1', '否', '否', '2');
INSERT INTO `house` VALUES ('17', '100', '你好', '100', '你好', '否', '你好', '否', '否', '2');
INSERT INTO `house` VALUES ('18', '00', '0', '0', '0', '否', '0', '否', '否', '2');
INSERT INTO `house` VALUES ('19', '0', '0', '00', '0', '否', '.', '否', '否', '2');
INSERT INTO `house` VALUES ('20', '0', '0', '0', '0', '否', '101', '否', '否', '2');
INSERT INTO `house` VALUES ('21', '00', '0', '0', '0', '否', '0', '否', '否', '2');

-- ----------------------------
-- Table structure for hy
-- ----------------------------
DROP TABLE IF EXISTS `hy`;
CREATE TABLE `hy` (
  `UserId` int(11) NOT NULL auto_increment,
  `U_Name` varchar(255) default NULL,
  `U_PSW` varchar(255) default NULL,
  `U_Phone` varchar(255) default NULL,
  `U_Exmail` varchar(255) default NULL,
  `U_Status` varchar(255) default NULL,
  PRIMARY KEY  (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy
-- ----------------------------
INSERT INTO `hy` VALUES ('2', '杨楷烜0', '1', '17093196510', '2418606562@qq.com', '正常');

-- ----------------------------
-- Table structure for new
-- ----------------------------
DROP TABLE IF EXISTS `new`;
CREATE TABLE `new` (
  `NewId` int(11) NOT NULL auto_increment,
  `N_Type` varchar(255) default NULL,
  `N_Title` varchar(255) default NULL,
  `N_Content` varchar(255) default NULL,
  `N_Status` varchar(255) default NULL,
  `IS_Delete` varchar(255) default NULL,
  PRIMARY KEY  (`NewId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of new
-- ----------------------------
INSERT INTO `new` VALUES ('1', '11', '666', 'q', '是', '是');
INSERT INTO `new` VALUES ('2', '2', '2', '111', '是', '否');
INSERT INTO `new` VALUES ('3', '3', '3', '33', '否', '否');
INSERT INTO `new` VALUES ('4', '11', '0000000000000', 'q', '否', '否');
INSERT INTO `new` VALUES ('5', '11', '99', 'q', '是', '否');
INSERT INTO `new` VALUES ('6', '11', '88', 'q', '是', '否');

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `PId` int(11) NOT NULL auto_increment,
  `P_Url` varchar(255) default NULL,
  `H_Id` int(11) default NULL,
  `N_Id` int(11) default NULL,
  `A_Id` int(11) default NULL,
  PRIMARY KEY  (`PId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photo
-- ----------------------------
INSERT INTO `photo` VALUES ('1', 'UploadImg/Product/20180204201752841/20180204201752841.jpg', '2', null, null);
INSERT INTO `photo` VALUES ('2', 'UploadImg/Product/20180204204034556/20180204204039556.jpg', '8', null, null);
INSERT INTO `photo` VALUES ('3', 'UploadImg/Product/20180204204114708/20180204204114708.jpg', '9', null, null);
INSERT INTO `photo` VALUES ('9', 'UploadImg/Product/20180210121425429/20180210121425429.jpg', '12', null, null);
INSERT INTO `photo` VALUES ('10', 'UploadImg/House/20180210124737154/20180210124737154.jpg', '17', null, null);
INSERT INTO `photo` VALUES ('15', 'UploadImg/House/20180224135448825/20180224135448825.jpg', '11', null, null);
INSERT INTO `photo` VALUES ('33', 'UploadImg/New/20180224162057881/20180224162057881.jpg', null, '1', null);
INSERT INTO `photo` VALUES ('34', 'UploadImg/House/20180224171707513/20180224171707513.jpg', '18', null, null);
INSERT INTO `photo` VALUES ('35', 'UploadImg/House/20180224171718693/20180224171718693.jpg', '19', null, null);
INSERT INTO `photo` VALUES ('36', 'UploadImg/House/20180224171728568/20180224171728568.jpg', '20', null, null);
INSERT INTO `photo` VALUES ('39', 'UploadImg/House/20180224190728435/20180224190728435.jpg', '14', null, null);
INSERT INTO `photo` VALUES ('40', 'UploadImg/House/20180224190734856/20180224190734856.jpg', '15', null, null);
INSERT INTO `photo` VALUES ('42', 'UploadImg/New/20180224190821219/20180224190821219.jpg', null, '3', null);
INSERT INTO `photo` VALUES ('43', 'UploadImg/New/20180224190827122/20180224190827122.jpg', null, '4', null);
INSERT INTO `photo` VALUES ('44', 'UploadImg/New/20180224190913139/20180224190913139.jpg', null, '5', null);
INSERT INTO `photo` VALUES ('45', 'UploadImg/New/20180224190920757/20180224190920757.jpg', null, '6', null);
INSERT INTO `photo` VALUES ('48', 'UploadImg/House/20180224192724895/20180224192724895.jpg', '13', null, null);
INSERT INTO `photo` VALUES ('49', 'UploadImg/House/20180224194054287/20180224194054287.jpg', '21', null, null);
INSERT INTO `photo` VALUES ('62', 'UploadImg/House/20180224201220843/20180224201220843.jpg', '10', null, null);
INSERT INTO `photo` VALUES ('64', 'UploadImg/New/20180224201358798/20180224201358798.jpg', null, '2', null);

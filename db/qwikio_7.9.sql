/*
 Navicat Premium Data Transfer

 Source Server         : ThisMySQL
 Source Server Type    : MySQL
 Source Server Version : 100413
 Source Host           : localhost:3306
 Source Schema         : wooberly_v_1_8

 Target Server Type    : MySQL
 Target Server Version : 100413
 File Encoding         : 65001

 Date: 09/07/2021 21:41:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adminprivileges
-- ----------------------------
DROP TABLE IF EXISTS `adminprivileges`;
CREATE TABLE `adminprivileges`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `roleId` int NOT NULL,
  `previlegeId` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `adminprivileges_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `adminroles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adminprivileges
-- ----------------------------

-- ----------------------------
-- Table structure for adminroles
-- ----------------------------
DROP TABLE IF EXISTS `adminroles`;
CREATE TABLE `adminroles`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adminroles
-- ----------------------------

-- ----------------------------
-- Table structure for adminuser
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser`  (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `isSuperAdmin` tinyint(1) NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_user_email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adminuser
-- ----------------------------
INSERT INTO `adminuser` VALUES ('', 'sss', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL);
INSERT INTO `adminuser` VALUES ('cd1cc030-1bdc-11ea-9e8f-179abe411c92', 'admin@radicalstart.com', '$2b$08$JygwCxbWP/Q7jkfqwtsXcOFiyuCVi1/yubJH/nvmHLfCQv04CTLNO', 1, '2019-12-11 06:09:33', '2020-03-04 09:31:35', NULL);

-- ----------------------------
-- Table structure for booking
-- ----------------------------
DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `riderLocation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `riderLocationLat` float NOT NULL,
  `riderLocationLng` float NOT NULL,
  `pickUpLocation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pickUpLat` float NOT NULL,
  `pickUpLng` float NOT NULL,
  `dropOffLocation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dropOffLat` float NOT NULL,
  `dropOffLng` float NOT NULL,
  `riderId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `driverId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tripStatus` enum('created','approved','declined','started','cancelledByRider','cancelledByDriver','completed','expired','scheduled') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `vehicleType` int NOT NULL,
  `totalRideDistance` float NOT NULL,
  `baseFare` float NOT NULL,
  `baseUnit` float NOT NULL,
  `riderServiceFee` float NOT NULL,
  `driverServiceFee` float NOT NULL,
  `estimatedTotalFare` float NULL DEFAULT NULL,
  `totalFare` float NULL DEFAULT NULL,
  `totalDuration` float NULL DEFAULT NULL,
  `paymentType` int NULL DEFAULT NULL,
  `paymentStatus` enum('pending','completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transactionId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `startDate` date NOT NULL,
  `startTime` datetime NOT NULL,
  `endDate` date NOT NULL,
  `endTime` datetime NOT NULL,
  `tripStart` datetime NULL DEFAULT NULL,
  `tripEnd` datetime NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'USD',
  `riderTotalFare` float NULL DEFAULT 0,
  `driverTotalFare` float NULL DEFAULT 0,
  `notes` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `baseMinute` float NULL DEFAULT 0,
  `vehicleId` int NULL DEFAULT NULL,
  `vehicleNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `promoCodeId` int NULL DEFAULT NULL,
  `isSpecialTrip` tinyint(1) NULL DEFAULT 0,
  `specialTripPrice` float NULL DEFAULT 0,
  `specialTripTotalFare` float NULL DEFAULT 0,
  `isTipGiven` tinyint(1) NULL DEFAULT 0,
  `tipsAmount` float NULL DEFAULT 0,
  `tipsTotalFare` float NULL DEFAULT 0,
  `tipsDriverTotalFare` float NULL DEFAULT 0,
  `tollFee` float NULL DEFAULT 0,
  `isPayoutPaid` tinyint(1) NULL DEFAULT 0,
  `userBanStatus` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'inactive',
  `isBanStatus` tinyint(1) NULL DEFAULT 0,
  `pricingId` int NULL DEFAULT NULL,
  `riderPayableFare` float NULL DEFAULT NULL,
  `bookingType` tinyint NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of booking
-- ----------------------------
INSERT INTO `booking` VALUES (44, 'Mountain View, California, Santa Clara County, 1600, Amphitheatre Parkway', 37.422, -122.084, 'J Wethington Rd, Kentucky 42728, USA', 37.2763, -85.1209, 'Webster City, IA 50595, USA', 42.4694, -93.8159, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 'expired', 3, 732.635, 15, 4, 563.45, 563.45, 5634.54, 5634.54, 676, 1, 'pending', NULL, '2021-06-23', '2021-06-23 10:00:42', '2021-06-23', '2021-06-23 10:00:42', '2021-06-23 10:00:42', '2021-06-23 10:00:42', '2021-06-23 10:00:42', '2021-06-23 10:01:43', 'USD', 6197.99, 5071.09, 'Decline - No drivers found.', 4, 2, '23456', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'inactive', 0, 3, 6197.99, 1);
INSERT INTO `booking` VALUES (45, 'Mountain View, California, Santa Clara County, 1600, Amphitheatre Parkway', 37.422, -122.084, 'J Wethington Rd, Kentucky 42728, USA', 37.2763, -85.1209, 'Webster City, IA 50595, USA', 42.4694, -93.8159, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 'completed', 3, 1884.09, 15, 4, 753.98, 753.98, 5634.54, 7539.76, 0.84905, 1, 'completed', NULL, '2021-06-23', '2021-06-23 14:00:03', '2021-06-23', '2021-06-23 14:03:54', '2021-06-23 14:03:04', '2021-06-23 14:03:54', '2021-06-23 14:00:03', '2021-06-23 14:03:54', 'USD', 8793.73, 7285.78, NULL, 4, 2, '23456', 1, 1, 787.9, 8005.83, 0, 0, 0, 0, 500, 0, 'inactive', 0, 3, 8005.83, 1);
INSERT INTO `booking` VALUES (46, 'Mountain View, California, Santa Clara County, 1600, Amphitheatre Parkway', 37.422, -122.084, 'J Wethington Rd, Kentucky 42728, USA', 37.2763, -85.1209, 'Webster City, IA 50595, USA', 42.4694, -93.8159, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 'completed', 3, 1884.09, 15, 4, 762.79, 762.79, 5634.54, 7627.89, 22.8815, 1, 'completed', NULL, '2021-06-23', '2021-06-23 14:22:57', '2021-06-23', '2021-06-23 14:47:27', '2021-06-23 14:24:35', '2021-06-23 14:47:27', '2021-06-23 14:22:57', '2021-06-23 14:47:27', 'USD', 8390.67, 6865.1, NULL, 4, 2, '23456', 1, 1, 7551.61, 839.07, 0, 0, 0, 0, 0, 0, 'inactive', 0, 3, 839.068, 1);
INSERT INTO `booking` VALUES (68, 'Saratoga, California, Santa Clara County, Kevin Moran Park, Scully Avenue', 37.2878, -122.019, '2702 Low Court, Fairfield, CA, USA', 38.2367, -122.086, 'Webster City, IA 50595, USA', 42.4694, -93.8159, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 'completed', 3, 1884.09, 15, 4, 753.89, 753.89, 3339.22, 7538.91, 0.63655, 2, 'completed', 'pi_1J8PExBgfVkHvPrJTQKjZ5fe', '2021-07-01', '2021-07-01 12:41:26', '2021-07-01', '2021-07-01 12:42:42', '2021-07-01 12:42:02', '2021-07-01 12:42:42', '2021-07-01 12:41:26', '2021-07-01 12:42:42', 'USD', 8792.8, 7285.02, NULL, 4, 2, '23456', NULL, 0, 0, 0, 0, 0, 0, 0, 500, 0, 'inactive', 0, 3, 8792.8, 1);
INSERT INTO `booking` VALUES (69, 'Saratoga, California, Santa Clara County, Kevin Moran Park, Scully Avenue', 37.2878, -122.019, '2702 Low Court, Fairfield, CA, USA', 38.2367, -122.086, 'Webster City, IA 50595, USA', 42.4694, -93.8159, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 'completed', 3, 1884.09, 15, 4, 753.79, 753.79, 3339.22, 7537.9, 0.384383, 2, 'completed', 'pi_1J8PW6BgfVkHvPrJYm2iO3wL', '2021-07-01', '2021-07-01 12:59:32', '2021-07-01', '2021-07-01 13:00:25', '2021-07-01 13:00:00', '2021-07-01 13:00:25', '2021-07-01 12:59:32', '2021-07-01 13:00:25', 'USD', 8791.69, 7284.11, NULL, 4, 2, '23456', NULL, 0, 0, 0, 0, 0, 0, 0, 500, 0, 'inactive', 0, 3, 8791.69, 1);

-- ----------------------------
-- Table structure for bookingcancelreason
-- ----------------------------
DROP TABLE IF EXISTS `bookingcancelreason`;
CREATE TABLE `bookingcancelreason`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookingId` int NOT NULL,
  `riderId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `driverId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `cancelStatus` enum('cancelledByDriver','cancelledByRider') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookingcancelreason
-- ----------------------------

-- ----------------------------
-- Table structure for bookinghistory
-- ----------------------------
DROP TABLE IF EXISTS `bookinghistory`;
CREATE TABLE `bookinghistory`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookingId` int NOT NULL,
  `riderId` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `driverId` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `status` int NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookinghistory
-- ----------------------------
INSERT INTO `bookinghistory` VALUES (40, 43, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 0, '2021-06-23 09:58:00', '2021-06-23 09:58:00');
INSERT INTO `bookinghistory` VALUES (41, 44, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 2, '2021-06-23 10:00:42', '2021-06-23 10:01:43');
INSERT INTO `bookinghistory` VALUES (42, 45, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 3, '2021-06-23 14:00:03', '2021-06-23 14:03:55');
INSERT INTO `bookinghistory` VALUES (43, 46, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 3, '2021-06-23 14:22:57', '2021-06-23 14:47:27');
INSERT INTO `bookinghistory` VALUES (44, 56, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 0, '2021-07-01 03:10:37', '2021-07-01 03:10:37');
INSERT INTO `bookinghistory` VALUES (45, 57, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 3, '2021-07-01 03:14:53', '2021-07-01 03:16:03');
INSERT INTO `bookinghistory` VALUES (46, 58, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 1, '2021-07-01 03:27:22', '2021-07-01 03:27:47');
INSERT INTO `bookinghistory` VALUES (47, 59, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 3, '2021-07-01 03:44:44', '2021-07-01 08:32:10');
INSERT INTO `bookinghistory` VALUES (48, 60, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 3, '2021-07-01 08:52:46', '2021-07-01 08:55:15');
INSERT INTO `bookinghistory` VALUES (49, 61, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 1, '2021-07-01 09:56:42', '2021-07-01 09:57:14');
INSERT INTO `bookinghistory` VALUES (50, 62, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 1, '2021-07-01 10:06:07', '2021-07-01 10:06:36');
INSERT INTO `bookinghistory` VALUES (51, 63, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 1, '2021-07-01 10:35:36', '2021-07-01 10:35:44');
INSERT INTO `bookinghistory` VALUES (52, 64, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 1, '2021-07-01 12:03:02', '2021-07-01 12:04:32');
INSERT INTO `bookinghistory` VALUES (53, 65, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 3, '2021-07-01 12:12:09', '2021-07-01 12:15:58');
INSERT INTO `bookinghistory` VALUES (54, 66, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 3, '2021-07-01 12:19:05', '2021-07-01 12:20:55');
INSERT INTO `bookinghistory` VALUES (55, 67, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 1, '2021-07-01 12:35:03', '2021-07-01 12:35:41');
INSERT INTO `bookinghistory` VALUES (56, 68, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 3, '2021-07-01 12:41:27', '2021-07-01 12:42:42');
INSERT INTO `bookinghistory` VALUES (57, 69, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 3, '2021-07-01 12:59:32', '2021-07-01 13:00:26');

-- ----------------------------
-- Table structure for bookingpromocode
-- ----------------------------
DROP TABLE IF EXISTS `bookingpromocode`;
CREATE TABLE `bookingpromocode`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `promoId` int NULL DEFAULT NULL,
  `bookingId` int NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` tinyint NULL DEFAULT 1,
  `promoValue` float NOT NULL DEFAULT 0,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `expiryDate` datetime NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookingpromocode
-- ----------------------------
INSERT INTO `bookingpromocode` VALUES (1, 1, 45, '1st', 'abcdefg', 1, 9.5, 'usd', '2021-06-29 15:00:00', '2021-06-23 14:00:03', '2021-06-23 14:00:03');
INSERT INTO `bookingpromocode` VALUES (2, 1, 46, '1st', 'abcdefg', 1, 90, 'usd', '2021-06-29 15:00:00', '2021-06-23 14:22:57', '2021-06-23 14:22:57');

-- ----------------------------
-- Table structure for bookingtips
-- ----------------------------
DROP TABLE IF EXISTS `bookingtips`;
CREATE TABLE `bookingtips`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookingId` int NOT NULL,
  `riderId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `driverId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `paymentType` int NULL DEFAULT NULL,
  `amount` float NOT NULL,
  `riderCurrency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `driverCurrency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transactionId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookingtips
-- ----------------------------

-- ----------------------------
-- Table structure for cancelreason
-- ----------------------------
DROP TABLE IF EXISTS `cancelreason`;
CREATE TABLE `cancelreason`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userType` int NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isActive` tinyint(1) NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cancelreason
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `categoryImage` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `categoryMarkerImage` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `unitPrice` float NULL DEFAULT 0,
  `basePrice` float NULL DEFAULT 0,
  `isActive` tinyint(1) NULL DEFAULT 1,
  `currency` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'USD',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `riderFeeType` enum('fixed','percentage') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `riderFeeValue` float NULL DEFAULT NULL,
  `driverFeeType` enum('fixed','percentage') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `driverFeeValue` float NULL DEFAULT NULL,
  `minutePrice` float NULL DEFAULT 0,
  `capacity` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'qwikio', 'ff67623b9992cf3eb34842593ad990a1.png', '2e749762203d8547e9fbc4761ce55891.png', 1, 5, 1, 'PLN', '2019-09-21 12:31:25', '2020-05-09 15:54:26', 'percentage', 10, 'percentage', 80, 0.5, 3);
INSERT INTO `category` VALUES (2, 'qwikio green', 'b08fb699f68fa6a4613c15bdeaee019b.png', 'f99ff35b770abe435a01eef7411cde1b.png', 60, 123, 1, 'USD', '2019-09-21 12:31:27', '2021-02-12 12:06:53', 'percentage', 90, 'percentage', 70, 30, 4);
INSERT INTO `category` VALUES (3, 'qwikio premium', '15cfda5e9500b2dab412bee6388dcee4.png', '5385fa00f25741380974aa93d81e987d.png', 10, 20, 1, 'USD', '2019-09-21 12:31:27', '2020-05-09 15:53:58', 'percentage', 5, 'percentage', 10, 5, 5);
INSERT INTO `category` VALUES (4, 'qwikio plus+', 'b2bda05908bf1c337884fc3009ae6744.png', '366c947fdb7f15300779fe215fb8ca08.png', 20, 50, 1, 'USD', '2019-09-21 12:31:27', '2020-05-09 15:54:05', 'percentage', 5, 'percentage', 10, 10, 8);

-- ----------------------------
-- Table structure for contentpagedetails
-- ----------------------------
DROP TABLE IF EXISTS `contentpagedetails`;
CREATE TABLE `contentpagedetails`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pageTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `metaTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `metaDescription` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pageUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isEnable` tinyint(1) NOT NULL DEFAULT 1,
  `pageBanner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contentpagedetails
-- ----------------------------
INSERT INTO `contentpagedetails` VALUES (1, 'Lorum Ipsum Team', 'Lorum Ipsum Team', 'Lorum Ipsum Team', 'lorum-ipsum-team', '<p>Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 1, '8f5cd5ec1cf9735a2ea94c7ae295797c.jpeg', '2020-05-09 16:11:28', '2020-05-09 16:11:28');

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `countryCode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `countryName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `isEnable` tinyint(1) NOT NULL DEFAULT 1,
  `dialCode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 242 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES (1, 'AF', 'Afghanistan', 1, '+93', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (2, 'AL', 'Albania', 1, '+355', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (3, 'DZ', 'Algeria', 1, '+213', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (4, 'AS', 'AmericanSamoa', 1, '+1 684', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (5, 'AD', 'Andorra', 1, '+376', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (6, 'AO', 'Angola', 1, '+244', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (7, 'AI', 'Anguilla', 1, '+1 264', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (8, 'AQ', 'Antarctica', 1, '+672', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (9, 'AG', 'Antigua and Barbuda', 1, '+1268', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (10, 'AR', 'Argentina', 1, '+54', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (11, 'AM', 'Armenia', 1, '+374', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (12, 'AW', 'Aruba', 1, '+297', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (13, 'AU', 'Australia', 1, '+61', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (14, 'AT', 'Austria', 1, '+43', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (15, 'AZ', 'Azerbaijan', 1, '+994', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (16, 'BS', 'Bahamas', 1, '+1 242', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (17, 'BH', 'Bahrain', 1, '+973', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (18, 'BD', 'Bangladesh', 1, '+880', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (19, 'BB', 'Barbados', 1, '+1 246', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (20, 'BY', 'Belarus', 1, '+375', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (21, 'BE', 'Belgium', 1, '+32', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (22, 'BZ', 'Belize', 1, '+501', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (23, 'BJ', 'Benin', 1, '+229', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (24, 'BM', 'Bermuda', 1, '+1 441', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (25, 'BT', 'Bhutan', 1, '+975', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (26, 'BO', 'Bolivia, Plurinational State of', 1, '+591', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (27, 'BA', 'Bosnia and Herzegovina', 1, '+387', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (28, 'BW', 'Botswana', 1, '+267', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (29, 'BR', 'Brazil', 1, '+55', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (30, 'IO', 'British Indian Ocean Territory', 1, '+246', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (31, 'BN', 'Brunei Darussalam', 1, '+673', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (32, 'BG', 'Bulgaria', 1, '+359', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (33, 'BF', 'Burkina Faso', 1, '+226', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (34, 'BI', 'Burundi', 1, '+257', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (35, 'KH', 'Cambodia', 1, '+855', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (36, 'CM', 'Cameroon', 1, '+237', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (37, 'CA', 'Canada', 1, '+1', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (38, 'CV', 'Cape Verde', 1, '+238', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (39, 'KY', 'Cayman Islands', 1, '+ 345', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (40, 'CF', 'Central African Republic', 1, '+236', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (41, 'TD', 'Chad', 1, '+235', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (42, 'CL', 'Chile', 1, '+56', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (43, 'CN', 'China', 1, '+86', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (44, 'CX', 'Christmas Island', 1, '+61', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (45, 'CC', 'Cocos (Keeling) Islands', 1, '+61', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (46, 'CO', 'Colombia', 1, '+57', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (47, 'KM', 'Comoros', 1, '+269', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (48, 'CG', 'Congo', 1, '+242', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (49, 'CD', 'Congo, The Democratic Republic of the', 1, '+243', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (50, 'CK', 'Cook Islands', 1, '+682', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (51, 'CR', 'Costa Rica', 1, '+506', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (52, 'CI', 'Cote d\'Ivoire', 1, '+225', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (53, 'HR', 'Croatia', 1, '+385', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (54, 'CU', 'Cuba', 1, '+53', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (55, 'CY', 'Cyprus', 1, '+537', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (56, 'CZ', 'Czech Republic', 1, '+420', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (57, 'DK', 'Denmark', 1, '+45', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (58, 'DJ', 'Djibouti', 1, '+253', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (59, 'DM', 'Dominica', 1, '+1 767', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (60, 'DO', 'Dominican Republic', 1, '+1 849', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (61, 'EC', 'Ecuador', 1, '+593', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (62, 'EG', 'Egypt', 1, '+20', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (63, 'SV', 'El Salvador', 1, '+503', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (64, 'GQ', 'Equatorial Guinea', 1, '+240', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (65, 'ER', 'Eritrea', 1, '+291', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (66, 'EE', 'Estonia', 1, '+372', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (67, 'ET', 'Ethiopia', 1, '+251', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (68, 'FK', 'Falkland Islands (Malvinas)', 1, '+500', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (69, 'FO', 'Faroe Islands', 1, '+298', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (70, 'FJ', 'Fiji', 1, '+679', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (71, 'FI', 'Finland', 1, '+358', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (72, 'FR', 'France', 1, '+33', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (73, 'GF', 'French Guiana', 1, '+594', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (74, 'PF', 'French Polynesia', 1, '+689', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (75, 'GA', 'Gabon', 1, '+241', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (76, 'GM', 'Gambia', 1, '+220', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (77, 'GE', 'Georgia', 1, '+995', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (78, 'DE', 'Germany', 1, '+49', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (79, 'GH', 'Ghana', 1, '+233', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (80, 'GI', 'Gibraltar', 1, '+350', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (81, 'GR', 'Greece', 1, '+30', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (82, 'GL', 'Greenland', 1, '+299', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (83, 'GD', 'Grenada', 1, '+1 473', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (84, 'GP', 'Guadeloupe', 1, '+590', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (85, 'GU', 'Guam', 1, '+1 671', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (86, 'GT', 'Guatemala', 1, '+502', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (87, 'GG', 'Guernsey', 1, '+44', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (88, 'GN', 'Guinea', 1, '+224', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (89, 'GW', 'Guinea-Bissau', 1, '+245', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (90, 'GY', 'Guyana', 1, '+595', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (91, 'HT', 'Haiti', 1, '+509', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (92, 'VA', 'Holy See (Vatican City State)', 1, '+379', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (93, 'HN', 'Honduras', 1, '+504', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (94, 'HK', 'Hong Kong', 1, '+852', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (95, 'HU', 'Hungary', 1, '+36', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (96, 'IS', 'Iceland', 1, '+354', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (97, 'IN', 'India', 1, '+91', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (98, 'ID', 'Indonesia', 1, '+62', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (99, 'IR', 'Iran, Islamic Republic of', 1, '+98', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (100, 'IQ', 'Iraq', 1, '+964', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (101, 'IE', 'Ireland', 1, '+353', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (102, 'IM', 'Isle of Man', 1, '+44', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (103, 'IL', 'Israel', 1, '+972', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (104, 'IT', 'Italy', 1, '+39', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (105, 'JM', 'Jamaica', 1, '+1 876', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (106, 'JP', 'Japan', 1, '+81', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (107, 'JE', 'Jersey', 1, '+44', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (108, 'JO', 'Jordan', 1, '+962', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (109, 'KZ', 'Kazakhstan', 1, '+7 7', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (110, 'KE', 'Kenya', 1, '+254', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (111, 'KI', 'Kiribati', 1, '+686', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (112, 'KP', 'Korea, Democratic People\'s Republic of', 1, '+850', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (113, 'KR', 'Korea, Republic of', 1, '+82', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (114, 'KW', 'Kuwait', 1, '+965', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (115, 'KG', 'Kyrgyzstan', 1, '+996', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (116, 'LA', 'Lao People\'s Democratic Republic', 1, '+856', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (117, 'LV', 'Latvia', 1, '+371', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (118, 'LB', 'Lebanon', 1, '+961', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (119, 'LS', 'Lesotho', 1, '+266', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (120, 'LR', 'Liberia', 1, '+231', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (121, 'LY', 'Libyan Arab Jamahiriya', 1, '+218', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (122, 'LI', 'Liechtenstein', 1, '+423', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (123, 'LT', 'Lithuania', 1, '+370', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (124, 'LU', 'Luxembourg', 1, '+352', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (125, 'MO', 'Macao', 1, '+853', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (126, 'MK', 'Macedonia, The Former Yugoslav Republic of', 1, '+389', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (127, 'MG', 'Madagascar', 1, '+261', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (128, 'MW', 'Malawi', 1, '+265', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (129, 'MY', 'Malaysia', 1, '+60', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (130, 'MV', 'Maldives', 1, '+960', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (131, 'ML', 'Mali', 1, '+223', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (132, 'MT', 'Malta', 1, '+356', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (133, 'MH', 'Marshall Islands', 1, '+692', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (134, 'MQ', 'Martinique', 1, '+596', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (135, 'MR', 'Mauritania', 1, '+222', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (136, 'MU', 'Mauritius', 1, '+230', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (137, 'YT', 'Mayotte', 1, '+262', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (138, 'MX', 'Mexico', 1, '+52', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (139, 'FM', 'Micronesia, Federated States of', 1, '+691', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (140, 'MD', 'Moldova, Republic of', 1, '+373', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (141, 'MC', 'Monaco', 1, '+377', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (142, 'MN', 'Mongolia', 1, '+976', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (143, 'ME', 'Montenegro', 1, '+382', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (144, 'MS', 'Montserrat', 1, '+1664', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (145, 'MA', 'Morocco', 1, '+212', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (146, 'MZ', 'Mozambique', 1, '+258', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (147, 'MM', 'Myanmar', 1, '+95', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (148, 'NA', 'Namibia', 1, '+264', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (149, 'NR', 'Nauru', 1, '+674', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (150, 'NP', 'Nepal', 1, '+977', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (151, 'NL', 'Netherlands', 1, '+31', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (152, 'AN', 'Netherlands Antilles', 1, '+599', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (153, 'NC', 'New Caledonia', 1, '+687', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (154, 'NZ', 'New Zealand', 1, '+64', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (155, 'NI', 'Nicaragua', 1, '+505', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (156, 'NE', 'Niger', 1, '+227', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (157, 'NG', 'Nigeria', 1, '+234', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (158, 'NU', 'Niue', 1, '+683', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (159, 'NF', 'Norfolk Island', 1, '+672', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (160, 'NO', 'Norway', 1, '+47', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (161, 'OM', 'Oman', 1, '+968', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (162, 'MP', 'Northern Mariana Islands', 1, '+1 670', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (163, 'PK', 'Pakistan', 1, '+92', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (164, 'PW', 'Palau', 1, '+680', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (165, 'PS', 'Palestinian Territory, Occupied', 1, '+970', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (166, 'PA', 'Panama', 1, '+507', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (167, 'PG', 'Papua New Guinea', 1, '+675', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (168, 'PY', 'Paraguay', 1, '+595', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (169, 'PE', 'Peru', 1, '+51', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (170, 'PH', 'Philippines', 1, '+63', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (171, 'PN', 'Pitcairn', 1, '+872', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (172, 'PL', 'Poland', 1, '+48', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (173, 'PT', 'Portugal', 1, '+351', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (174, 'PR', 'Puerto Rico', 1, '+1 939', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (175, 'QA', 'Qatar', 1, '+974', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (176, 'RO', 'Romania', 1, '+40', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (177, 'RU', 'Russia', 1, '+7', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (178, 'RW', 'Rwanda', 1, '+250', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (179, 'RE', 'Réunion', 1, '+262', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (180, 'BL', 'Saint Barthélemy', 1, '+590', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (181, 'SH', 'Saint Helena, Ascension and Tristan Da Cunha', 1, '+290', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (182, 'KN', 'Saint Kitts and Nevis', 1, '+1 869', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (183, 'LC', 'Saint Lucia', 1, '+1 758', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (184, 'MF', 'Saint Martin', 1, '+590', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (185, 'PM', 'Saint Pierre and Miquelon', 1, '+508', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (186, 'VC', 'Saint Vincent and the Grenadines', 1, '+1 784', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (187, 'WS', 'Samoa', 1, '+685', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (188, 'SM', 'San Marino', 1, '+378', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (189, 'ST', 'Sao Tome and Principe', 1, '+239', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (190, 'SA', 'Saudi Arabia', 1, '+966', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (191, 'SN', 'Senegal', 1, '+221', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (192, 'RS', 'Serbia', 1, '+381', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (193, 'SC', 'Seychelles', 1, '+248', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (194, 'SL', 'Sierra Leone', 1, '+232', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (195, 'SG', 'Singapore', 1, '+65', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (196, 'SK', 'Slovakia', 1, '+421', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (197, 'SI', 'Slovenia', 1, '+386', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (198, 'SB', 'Solomon Islands', 1, '+677', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (199, 'SO', 'Somalia', 1, '+252', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (200, 'ZA', 'South Africa', 1, '+27', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (201, 'GS', 'South Georgia and the South Sandwich Islands', 1, '+500', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (202, 'ES', 'Spain', 1, '+34', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (203, 'LK', 'Sri Lanka', 1, '+94', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (204, 'SD', 'Sudan', 1, '+249', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (205, 'SR', 'Suriname', 1, '+597', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (206, 'SJ', 'Svalbard and Jan Mayen', 1, '+47', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (207, 'SZ', 'Swaziland', 1, '+268', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (208, 'SE', 'Sweden', 1, '+46', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (209, 'CH', 'Switzerland', 1, '+41', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (210, 'SY', 'Syrian Arab Republic', 1, '+963', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (211, 'TW', 'Taiwan, Province of China', 1, '+886', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (212, 'TJ', 'Tajikistan', 1, '+992', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (213, 'TZ', 'Tanzania, United Republic of', 1, '+255', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (214, 'TH', 'Thailand', 1, '+66', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (215, 'TL', 'Timor-Leste', 1, '+670', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (216, 'TG', 'Togo', 1, '+228', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (217, 'TK', 'Tokelau', 1, '+690', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (218, 'TO', 'Tonga', 1, '+676', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (219, 'TT', 'Trinidad and Tobago', 1, '+1 868', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (220, 'TN', 'Tunisia', 1, '+216', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (221, 'TR', 'Turkey', 1, '+90', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (222, 'TM', 'Turkmenistan', 1, '+993', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (223, 'TC', 'Turks and Caicos Islands', 1, '+1 649', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (224, 'TV', 'Tuvalu', 1, '+688', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (225, 'UG', 'Uganda', 1, '+256', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (226, 'UA', 'Ukraine', 1, '+380', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (227, 'AE', 'United Arab Emirates', 1, '+971', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (228, 'GB', 'United Kingdom', 1, '+44', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (229, 'US', 'United States', 1, '+1', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (230, 'UY', 'Uruguay', 1, '+598', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (231, 'UZ', 'Uzbekistan', 1, '+998', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (232, 'VU', 'Vanuatu', 1, '+678', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (233, 'VE', 'Venezuela, Bolivarian Republic of', 1, '+58', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (234, 'VN', 'Viet Nam', 1, '+84', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (235, 'VG', 'Virgin Islands, British', 1, '+1 284', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (236, 'VI', 'Virgin Islands, U.S.', 1, '+1 340', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (237, 'WF', 'Wallis and Futuna', 1, '+681', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (238, 'YE', 'Yemen', 1, '+967', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (239, 'ZM', 'Zambia', 1, '+260', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (240, 'ZW', 'Zimbabwe', 1, '+263', '2019-10-08 10:01:44', '2019-10-08 10:01:44');
INSERT INTO `country` VALUES (241, 'AX', 'Åland Islands', 1, '+358', '2019-10-08 10:01:44', '2019-10-08 10:01:44');

-- ----------------------------
-- Table structure for currencies
-- ----------------------------
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `symbol` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `isEnable` tinyint(1) NOT NULL DEFAULT 1,
  `isBaseCurrency` tinyint(1) NOT NULL DEFAULT 0,
  `isPayment` tinyint(1) NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of currencies
-- ----------------------------
INSERT INTO `currencies` VALUES (1, 'BRL', 1, 0, 1, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (2, 'AUD', 1, 0, 1, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (3, 'CAD', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (4, 'BGN', 1, 0, 1, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (5, 'CHF', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (6, 'CNY', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (7, 'CZK', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (8, 'DKK', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (9, 'EUR', 1, 0, 1, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (10, 'GBP', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (11, 'HKD', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (12, 'HRK', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (13, 'HUF', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (14, 'IDR', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (15, 'ILS', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (16, 'INR', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (17, 'JPY', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (18, 'KRW', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (19, 'MXN', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (20, 'MYR', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (21, 'NOK', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (22, 'NZD', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (23, 'PHP', 1, 0, 1, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (24, 'PLN', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (25, 'RON', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (26, 'RUB', 1, 0, 1, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (27, 'SEK', 1, 0, 0, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (28, 'SGD', 1, 0, 1, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (29, 'THB', 1, 0, 1, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (30, 'TRY', 1, 0, 1, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (31, 'USD', 1, 1, 1, '2019-10-08 10:01:44', '2020-03-05 10:14:48');
INSERT INTO `currencies` VALUES (32, 'ZAR', 1, 0, 1, '2019-10-08 10:01:44', '2020-03-05 10:14:48');

-- ----------------------------
-- Table structure for currencyrates
-- ----------------------------
DROP TABLE IF EXISTS `currencyrates`;
CREATE TABLE `currencyrates`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `currencyCode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rate` float NOT NULL,
  `isBase` tinyint(1) NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 228 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of currencyrates
-- ----------------------------
INSERT INTO `currencyrates` VALUES (1, 'AED', 3.673, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (2, 'AFN', 77.3, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (3, 'ALL', 101.2, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (4, 'AMD', 521.606, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (5, 'ANG', 1.79542, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (6, 'AOA', 654.274, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (7, 'ARS', 93.9229, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (8, 'AUD', 1.27539, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (9, 'AWG', 1.80025, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (10, 'AZN', 1.7008, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (11, 'BAM', 1.60821, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (12, 'BBD', 2, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (13, 'BDT', 84.8152, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (14, 'BGN', 1.6089, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (15, 'BHD', 0.376997, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (16, 'BIF', 1969, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (17, 'BMD', 1, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (18, 'BND', 1.32451, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (19, 'BOB', 6.90663, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (20, 'BRL', 5.2397, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (21, 'BSD', 1, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (22, 'BTN', 73.32, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (23, 'BWP', 10.7207, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (24, 'BYN', 2.52946, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (25, 'BYR', 25294.6, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (26, 'BZD', 2.0162, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (27, 'CAD', 1.20984, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (28, 'CDF', 2000, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (29, 'CHF', 0.900614, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (30, 'CLF', 0.025231, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (31, 'CLP', 696.5, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (32, 'CNY', 6.4165, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (33, 'COP', 3755.76, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (34, 'CRC', 616.865, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (35, 'CUC', 1, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (36, 'CVE', 91.15, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (37, 'CZK', 21.054, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (38, 'DJF', 178.033, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (39, 'DKK', 6.12257, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (40, 'DOP', 56.95, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (41, 'DZD', 133.429, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (42, 'EGP', 15.6714, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (43, 'ERN', 15.002, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (44, 'ETB', 42.26, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (45, 'EUR', 0.823376, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (46, 'FJD', 2.0398, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (47, 'FKP', 0.707561, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (48, 'GBP', 0.707561, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (49, 'GEL', 3.425, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (50, 'GHS', 5.765, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (51, 'GIP', 0.707561, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (52, 'GMD', 51.225, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (53, 'GNF', 9895, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (54, 'GTQ', 7.71936, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (55, 'GYD', 209.152, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (56, 'HKD', 7.76535, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (57, 'HNL', 24.125, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (58, 'HRK', 6.2103, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (59, 'HTG', 87.3955, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (60, 'HUF', 294.57, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (61, 'IDR', 14180.5, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (62, 'ILS', 3.25335, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (63, 'INR', 73.4815, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (64, 'IQD', 1461.5, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (65, 'ISK', 124.21, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (66, 'JMD', 151.546, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (67, 'JOD', 0.709, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (68, 'JPY', 108.801, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (69, 'KES', 106.5, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (70, 'KGS', 84.7862, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (71, 'KHR', 4060, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (72, 'KMF', 405.225, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (73, 'KRW', 1115.77, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (74, 'KWD', 0.301066, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (75, 'KYD', 0.833614, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (76, 'KZT', 426.735, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (77, 'LAK', 9425, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (78, 'LBP', 1520.87, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (79, 'LKR', 197.047, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (80, 'LRD', 171.875, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (81, 'LSL', 14.01, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (82, 'LYD', 4.465, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (83, 'MAD', 8.8405, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (84, 'MDL', 17.74, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (85, 'MGA', 3755, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (86, 'MKD', 50.6267, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (87, 'MMK', 1557.97, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (88, 'MNT', 2850.83, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (89, 'MOP', 8.00168, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (90, 'MRO', 357, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (91, 'MUR', 40.3, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (92, 'MVR', 15.4998, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (93, 'MWK', 795, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (94, 'MXN', 19.9364, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (95, 'MYR', 4.1075, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (96, 'MZN', 58.3, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (97, 'NAD', 14.01, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (98, 'NGN', 380, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (99, 'NIO', 35.18, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (100, 'NOK', 8.26448, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (101, 'NPR', 117.312, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (102, 'NZD', 1.37513, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (103, 'OMR', 0.384987, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (104, 'PAB', 1, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (105, 'PEN', 3.734, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (106, 'PGK', 3.53, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (107, 'PHP', 47.8161, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (108, 'PKR', 152.25, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (109, 'PLN', 3.75638, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (110, 'PYG', 6778.83, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (111, 'QAR', 3.641, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (112, 'RON', 4.0562, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (113, 'RSD', 96.7049, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (114, 'RUB', 74.3015, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (115, 'RWF', 983.75, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (116, 'SAR', 3.75027, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (117, 'SBD', 7.98406, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (118, 'SCR', 15.3409, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (119, 'SEK', 8.33448, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (120, 'SHP', 0.707561, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (121, 'SLL', 10223.8, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (122, 'SOS', 585, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (123, 'SRD', 14.154, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (124, 'SSP', 130.26, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (125, 'STD', 20738.1, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (126, 'SVC', 8.75221, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (127, 'SZL', 14.01, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (128, 'THB', 31.0985, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (129, 'TJS', 11.4085, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (130, 'TMT', 3.51, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (131, 'TND', 2.726, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (132, 'TOP', 2.24854, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (133, 'TRY', 8.279, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (134, 'TTD', 6.79415, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (135, 'TWD', 27.758, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (136, 'TZS', 2319.36, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (137, 'UAH', 27.7559, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (138, 'UGX', 3556.02, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (139, 'UYU', 43.8654, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (140, 'UZS', 10530, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (141, 'VES', 2591300, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (142, 'VND', 23096.7, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (143, 'VUV', 109.544, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (144, 'WST', 2.53186, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (145, 'XAF', 540.099, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (146, 'XAG', 0.0366641, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (147, 'XAU', 0.00054478, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (148, 'XCD', 2.70255, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (149, 'XDR', 0.692814, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (150, 'XOF', 540.099, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (151, 'XPD', 0.00033649, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (152, 'XPF', 98.2548, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (153, 'XPT', 0.00079833, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (154, 'YER', 250.45, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (155, 'ZAR', 14.0595, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (156, 'ZMW', 22.3818, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (157, 'JEP', 0.707561, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (158, 'GGP', 0.707561, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (159, 'IMP', 0.707561, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (160, 'GBX', 11.0479, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (161, 'CNH', 6.41938, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (162, 'MTL', 0.230214, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (163, 'ZWL', 322, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (164, 'SGD', 1.32592, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (165, 'USD', 1, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (166, 'BTC', 0.0000176684, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (167, 'BCH', 0.000705759, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (168, 'BSV', 0.00263625, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (169, 'ETH', 0.000242122, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (170, 'ETH2', 0.000242122, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (171, 'ETC', 0.00883388, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (172, 'LTC', 0.00261832, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (173, 'ZRX', 0.545627, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (174, 'USDC', 1, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (175, 'BAT', 0.727478, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (176, 'MANA', 0.731881, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (177, 'KNC', 0.278489, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (178, 'LINK', 0.0206782, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (179, 'DNT', 3.37707, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (180, 'MKR', 0.00019277, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (181, 'CVC', 1.86389, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (182, 'OMG', 0.0939651, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (183, 'DAI', 0.998626, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (184, 'ZEC', 0.00327606, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (185, 'REP', 0.0231992, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (186, 'XLM', 1.40399, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (187, 'EOS', 0.101061, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (188, 'XTZ', 0.151274, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (189, 'ALGO', 0.696282, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (190, 'DASH', 0.00255089, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (191, 'ATOM', 0.0375185, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (192, 'OXT', 1.60128, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (193, 'COMP', 0.00128162, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (194, 'ENJ', 0.427991, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (195, 'BAND', 0.0586221, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (196, 'NMR', 0.015691, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (197, 'CGLD', 0.19749, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (198, 'UMA', 0.0403836, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (199, 'LRC', 1.876, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (200, 'YFI', 0.0000184291, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (201, 'UNI', 0.0261313, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (202, 'BAL', 0.0150946, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (203, 'REN', 1.09141, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (204, 'WBTC', 0.0000176404, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (205, 'NU', 2.25505, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (206, 'FIL', 0.00721475, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (207, 'AAVE', 0.00218479, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (208, 'BNT', 0.127563, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (209, 'GRT', 0.682268, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (210, 'SNX', 0.0587228, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (211, 'STORJ', 0.5101, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (212, 'SUSHI', 0.0678449, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (213, 'MATIC', 1.08643, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (214, 'SKL', 1.75131, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (215, 'ADA', 0.580552, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (216, 'ANKR', 6.61682, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (217, 'CRV', 0.310598, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (218, 'NKN', 1.60102, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (219, 'OGN', 0.685636, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (220, '1INCH', 0.154476, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (221, 'USDT', 0.998951, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (222, 'FORTH', 0.0289792, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (223, 'CTSI', 0.849639, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (224, 'TRB', 0.00741131, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (225, 'MIR', 0.102182, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (226, 'RLC', 0.0728226, 0, '2021-05-10 19:00:05', '2021-05-10 19:00:05');
INSERT INTO `currencyrates` VALUES (227, 'USD', 1, 1, '2021-05-10 19:00:05', '2021-05-10 19:00:05');

-- ----------------------------
-- Table structure for donation
-- ----------------------------
DROP TABLE IF EXISTS `donation`;
CREATE TABLE `donation`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `donator` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `amount` float NOT NULL,
  `used` tinyint NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donation
-- ----------------------------
INSERT INTO `donation` VALUES (7, 'abcdef', 100, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for emailtoken
-- ----------------------------
DROP TABLE IF EXISTS `emailtoken`;
CREATE TABLE `emailtoken`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `EmailToken_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of emailtoken
-- ----------------------------
INSERT INTO `emailtoken` VALUES (2, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'normaluser@test.com', '1620916995837', '2021-05-13 14:43:16', '2021-05-13 14:43:16');
INSERT INTO `emailtoken` VALUES (3, 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 'driver@test.com', '1620917041916', '2021-05-13 14:44:01', '2021-05-13 14:44:01');
INSERT INTO `emailtoken` VALUES (5, '74264f50-c469-11eb-913d-d7e9d04f0e28', 'friend@test.com', '1622724276418', '2021-06-03 12:44:36', '2021-06-03 12:44:36');
INSERT INTO `emailtoken` VALUES (7, '2c8dc340-ca4e-11eb-a440-addeb05593b1', 'friend1@test.com', '1623372266829', '2021-06-11 00:44:26', '2021-06-11 00:44:26');
INSERT INTO `emailtoken` VALUES (8, 'a984f2c0-ca57-11eb-a440-addeb05593b1', 'brown@gmail.com', '1623376341995', '2021-06-11 01:52:22', '2021-06-11 01:52:22');
INSERT INTO `emailtoken` VALUES (9, 'cfcaecf0-cb10-11eb-b3c9-59d16dc10d5c', 'john@gmail.com', '1623455863083', '2021-06-11 23:57:43', '2021-06-11 23:57:43');

-- ----------------------------
-- Table structure for emergencycontact
-- ----------------------------
DROP TABLE IF EXISTS `emergencycontact`;
CREATE TABLE `emergencycontact`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `phoneNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contactName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of emergencycontact
-- ----------------------------

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NULL DEFAULT NULL,
  `code` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES (7, 'Party', 'This is party ', '2021-05-25', 'abcdef', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for failedtransactionhistory
-- ----------------------------
DROP TABLE IF EXISTS `failedtransactionhistory`;
CREATE TABLE `failedtransactionhistory`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookingId` int NOT NULL,
  `driverId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `riderId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `amount` float NOT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failedtransactionhistory
-- ----------------------------

-- ----------------------------
-- Table structure for favoritedriver
-- ----------------------------
DROP TABLE IF EXISTS `favoritedriver`;
CREATE TABLE `favoritedriver`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `driverId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favoritedriver
-- ----------------------------
INSERT INTO `favoritedriver` VALUES (3, '74264f50-c469-11eb-913d-d7e9d04f0e28', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `favoritedriver` VALUES (9, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', '2021-07-01 13:01:07', '2021-07-01 13:01:07');

-- ----------------------------
-- Table structure for fly
-- ----------------------------
DROP TABLE IF EXISTS `fly`;
CREATE TABLE `fly`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `depature_from` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `arrival_at` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `depature_date` date NOT NULL,
  `passengers` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `class` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fly
-- ----------------------------
INSERT INTO `fly` VALUES (7, 'Russia Moscow', 'USA New York', '2021-05-26', '{\"adult\":3, \"child\":2}', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for forgotpassword
-- ----------------------------
DROP TABLE IF EXISTS `forgotpassword`;
CREATE TABLE `forgotpassword`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forgotpassword
-- ----------------------------
INSERT INTO `forgotpassword` VALUES (10, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'rider@test.com', '1623212353670', '2021-06-09 04:19:13', '2021-06-09 04:19:13');

-- ----------------------------
-- Table structure for giftride
-- ----------------------------
DROP TABLE IF EXISTS `giftride`;
CREATE TABLE `giftride`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiver_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of giftride
-- ----------------------------

-- ----------------------------
-- Table structure for homepage
-- ----------------------------
DROP TABLE IF EXISTS `homepage`;
CREATE TABLE `homepage`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of homepage
-- ----------------------------
INSERT INTO `homepage` VALUES (1, 'Home Section Image 1', 'homeSectionImage1', '1fe9b385f87a9289bcce197fdd124fe0.png', '2020-03-05 04:45:25', '2021-02-12 12:37:48');
INSERT INTO `homepage` VALUES (2, 'Home Section Image 2', 'homeSectionImage2', '6924c7787b71b3c47fac257eea7ce8c6.png', '2020-03-05 04:45:25', '2021-02-12 12:37:48');
INSERT INTO `homepage` VALUES (3, 'Home Section Image 5', 'homeSectionImage5', '0e5a205bc1716e222c8312eb00c170a8.png', '2020-03-05 04:45:25', '2021-02-12 12:37:48');
INSERT INTO `homepage` VALUES (4, 'Home Section Button 1', 'homeSectionButton1', 'GET IT', '2020-03-05 04:45:25', '2021-02-12 12:37:48');
INSERT INTO `homepage` VALUES (5, 'Home Section Image 3', 'homeSectionImage3', 'b34c1c1d07fc110a364dfe1c6dc3aac7.png', '2020-03-05 04:45:25', '2021-02-12 12:37:48');
INSERT INTO `homepage` VALUES (6, 'Home Section Image 4', 'homeSectionImage4', 'bbb6b6c816732c74088a248faf992533.png', '2020-03-05 04:45:25', '2021-02-12 12:37:48');
INSERT INTO `homepage` VALUES (7, 'Home Section Image 6', 'homeSectionImage6', '6256d4bfafae04465cc0446a2973ae98.png', '2020-03-05 04:45:25', '2021-02-12 12:37:48');
INSERT INTO `homepage` VALUES (8, 'City Section Title 1', 'citySectionTitle1', 'Lorem Ipsum  ', '2020-03-05 04:45:25', '2020-03-05 06:45:33');
INSERT INTO `homepage` VALUES (9, 'Home Section Title 1', 'homeSectionTitle1', 'Start Riding With Your Site', '2020-03-05 04:45:25', '2021-02-12 12:37:48');
INSERT INTO `homepage` VALUES (10, 'About Grid Image 1', 'aboutGridImage1', '8814a348c03269b2e335da57a18418c5.png', '2020-03-05 04:45:25', '2020-05-09 15:39:58');
INSERT INTO `homepage` VALUES (11, 'City Section Content 1', 'citySectionContent1', 'Percipit repudiandae an eum, enim case eos no. Percipit tractatos pertinacia cum id, ad eos facete malorum recusabo, vis insolens perpetua definitionem ex.Percipit', '2020-03-05 04:45:25', '2020-03-05 06:45:33');
INSERT INTO `homepage` VALUES (12, 'About Grid Image 2', 'aboutGridImage2', 'f7593d69084b8bb4e1cafbd9270e2b32.png', '2020-03-05 04:45:25', '2020-05-09 15:39:58');
INSERT INTO `homepage` VALUES (13, 'About Grid Title 1', 'aboutGridTitle1', ' Lorem Ipsum', '2020-03-05 04:45:25', '2020-05-09 15:39:58');
INSERT INTO `homepage` VALUES (14, 'About Grid Title 2', 'aboutGridTitle2', ' Lorem Ipsum', '2020-03-05 04:45:25', '2020-05-09 15:39:58');
INSERT INTO `homepage` VALUES (15, 'About Grid Title 3', 'aboutGridTitle3', ' Lorem Ipsum', '2020-03-05 04:45:25', '2020-05-09 15:39:59');
INSERT INTO `homepage` VALUES (16, 'About Grid Title 4', 'aboutGridTitle4', ' Lorem Ipsum', '2020-03-05 04:45:25', '2020-05-09 15:39:59');
INSERT INTO `homepage` VALUES (17, 'About Grid Title 5', 'aboutGridTitle5', ' Lorem Ipsum', '2020-03-05 04:45:25', '2020-05-09 15:39:59');
INSERT INTO `homepage` VALUES (18, 'About Grid Title 6', 'aboutGridTitle6', ' Lorem Ipsum', '2020-03-05 04:45:25', '2020-05-09 15:39:59');
INSERT INTO `homepage` VALUES (19, 'About Grid Content 1', 'aboutGridContent1', '  Id per gloriatur tincidunt. Vim odio unum atomorum at. Ut essent dicunt dolorum mei.', '2020-03-05 04:45:25', '2020-05-09 15:39:59');
INSERT INTO `homepage` VALUES (20, 'About Grid Content 3', 'aboutGridContent3', '  Id per gloriatur tincidunt. Vim odio unum atomorum at. Ut essent dicunt dolorum mei.', '2020-03-05 04:45:25', '2020-05-09 15:39:59');
INSERT INTO `homepage` VALUES (21, 'About Grid Content 2', 'aboutGridContent2', '  Id per gloriatur tincidunt. Vim odio unum atomorum at. Ut essent dicunt dolorum mei.', '2020-03-05 04:45:25', '2020-05-09 15:39:59');
INSERT INTO `homepage` VALUES (22, 'About Grid Content 4', 'aboutGridContent4', '  Id per gloriatur tincidunt. Vim odio unum atomorum at. Ut essent dicunt dolorum mei.', '2020-03-05 04:45:25', '2020-05-09 15:40:00');
INSERT INTO `homepage` VALUES (23, 'About Grid Content 6', 'aboutGridContent6', '  Id per gloriatur tincidunt. Vim odio unum atomorum at. Ut essent dicunt dolorum mei.', '2020-03-05 04:45:25', '2020-05-09 15:40:00');
INSERT INTO `homepage` VALUES (24, 'About Grid Content 5', 'aboutGridContent5', '  Id per gloriatur tincidunt. Vim odio unum atomorum at. Ut essent dicunt dolorum mei.', '2020-03-05 04:45:25', '2020-05-09 15:40:00');
INSERT INTO `homepage` VALUES (25, 'Safety Grid Title 1', 'safetyGridTitle1', 'Download The Rider App', '2020-03-05 04:45:25', '2021-02-12 12:37:59');
INSERT INTO `homepage` VALUES (26, 'Safety Grid Content 1', 'safetyGridContent1', 'Delectus scaevola elaboraret vel ad, vis no noster vocent prodesset, nec ei omittantur dissentiet. Nobis postea ei est.', '2020-03-05 04:45:25', '2021-02-12 12:37:59');
INSERT INTO `homepage` VALUES (27, 'Safety Grid Image 1', 'safetyGridImage1', 'cb32ffbe4cedbe62179c8880ac173552.png', '2020-03-05 04:45:25', '2021-02-12 12:37:59');
INSERT INTO `homepage` VALUES (28, 'Safety Grid Image 2', 'safetyGridImage2', '5c4716ae4ee24bc9673b2fa9ec26f36e.png', '2020-03-05 04:45:25', '2021-02-12 12:37:59');
INSERT INTO `homepage` VALUES (29, 'Safety Grid Image 3', 'safetyGridImage3', '84f2709ba5f38c685841a61bac400814.png', '2020-03-05 04:45:25', '2021-02-12 12:37:59');
INSERT INTO `homepage` VALUES (30, 'Signup Grid Image 1', 'signupGridImage1', '4532f511e069786cbad7f72dbcc1435b.png', '2020-03-05 04:45:25', '2021-02-12 12:38:08');
INSERT INTO `homepage` VALUES (31, 'Signup Grid Image 2', 'signupGridImage2', '4a76a5b890bed022bc6042722f7e53c4.png', '2020-03-05 04:45:25', '2021-02-12 12:38:08');
INSERT INTO `homepage` VALUES (32, 'Signup Grid Image 3', 'signupGridImage3', 'fc2237b6834ab5e1680dadee95b4731f.png', '2020-03-05 04:45:25', '2021-02-12 12:38:08');
INSERT INTO `homepage` VALUES (33, 'Signup Grid Title 1', 'signupGridTitle1', 'Download The Driver App', '2020-03-05 04:45:25', '2021-02-12 12:38:08');
INSERT INTO `homepage` VALUES (34, 'Signup Grid Content 1', 'signupGridContent1', 'Delectus scaevola elaboraret vel ad, vis no noster vocent prodesset, nec ei omittantur dissentiet. Nobis postea ei est.', '2020-03-05 04:45:25', '2021-02-12 12:38:08');
INSERT INTO `homepage` VALUES (35, 'Footer Title 1', 'footerTitle1', 'About Us', '2020-03-05 04:45:25', '2021-02-12 11:52:38');
INSERT INTO `homepage` VALUES (36, 'Footer Content 1', 'footerContent1', 'An cum maiorum repudiandae, cu eam dolore bonorum probatus. Et legere sanctus cum, quot nostrud postulant ex mei. Ad ullum audire admodum eos. Ne eam quod habeo aeque, ad decoreos.', '2020-03-05 04:45:25', '2021-02-12 11:52:38');
INSERT INTO `homepage` VALUES (37, 'Footer Logo 1', 'footerLogo1', '06ccc93c0028f8c4fb125f28775ed0e7.png', '2020-03-05 04:45:25', '2021-02-12 11:52:38');
INSERT INTO `homepage` VALUES (38, 'Footer Logo 2', 'footerLogo2', '7f73a1336d36592e6d45ca02926fb686.png', '2020-03-05 04:45:25', '2021-02-12 11:52:38');
INSERT INTO `homepage` VALUES (39, 'Footer Logo 3', 'footerLogo3', 'bf81d7b7bb7c2710c4ccedef876fbdba.png', '2020-03-05 04:45:25', '2021-02-12 11:52:38');
INSERT INTO `homepage` VALUES (40, 'Footer Logo 4', 'footerLogo4', 'c0d0058403b540f405fae3b7aa236c81.png', '2020-03-05 04:45:25', '2021-02-12 11:52:38');
INSERT INTO `homepage` VALUES (41, 'Footer Link 1', 'footerLink1', 'https://yourwebsite.com/1', '2020-03-05 04:45:25', '2021-02-12 11:52:38');
INSERT INTO `homepage` VALUES (42, 'Footer Link 2', 'footerLink2', 'https://yourwebsite.com/2', '2020-03-05 04:45:25', '2021-02-12 11:52:38');
INSERT INTO `homepage` VALUES (43, 'Footer Link 3', 'footerLink3', 'https://yourwebsite.com/3', '2020-03-05 04:45:25', '2021-02-12 11:52:38');
INSERT INTO `homepage` VALUES (44, 'Footer Link 4', 'footerLink4', 'https://yourwebsite.com/4', '2020-03-05 04:45:25', '2021-02-12 11:52:38');
INSERT INTO `homepage` VALUES (45, 'Safety Grid Link 1', 'safetyGridLink1', 'https://play.google.com', '2020-03-05 04:45:25', '2021-02-12 12:37:59');
INSERT INTO `homepage` VALUES (46, 'Safety Grid Link 2', 'safetyGridLink2', 'https://apps.apple.com', '2020-03-05 04:45:25', '2021-02-12 12:37:59');
INSERT INTO `homepage` VALUES (47, 'Signup Grid Link 1', 'signupGridLink1', 'https://play.google.com', '2020-03-05 04:45:25', '2021-02-12 12:38:08');
INSERT INTO `homepage` VALUES (48, 'Signup Grid Link 2', 'signupGridLink2', 'https://apps.apple.com', '2020-03-05 04:45:25', '2021-02-12 12:38:08');
INSERT INTO `homepage` VALUES (49, 'Footer Link Name 1', 'footerLinkName1', 'Start Riding', '2020-03-05 04:45:25', '2021-02-12 11:52:38');
INSERT INTO `homepage` VALUES (50, 'Footer Link Name 2', 'footerLinkName2', 'Start Driving', '2020-03-05 04:45:25', '2021-02-12 11:52:38');
INSERT INTO `homepage` VALUES (51, 'Footer Link Name 3', 'footerLinkName3', 'Contact Us', '2020-03-05 04:45:25', '2021-02-12 11:52:38');
INSERT INTO `homepage` VALUES (52, 'Footer Link Name 4', 'footerLinkName4', 'Privacy Policy', '2020-03-05 04:45:25', '2021-02-12 11:52:38');
INSERT INTO `homepage` VALUES (53, 'Footer Link Title', 'footerLinkTitle', 'Useful Links', '2020-03-05 04:45:25', '2021-02-12 11:52:38');
INSERT INTO `homepage` VALUES (54, 'Footer Bottom', 'footerBottom', 'Your Site 2021. All Rights Reserved', '2020-03-05 04:45:25', '2021-02-12 11:52:38');
INSERT INTO `homepage` VALUES (55, 'Home Section Image 7', 'homeSectionImage7', '5c5f2b0a270e4bd3eb9302c63ca51c12.png', '2020-06-30 15:34:06', '2021-02-12 12:37:48');
INSERT INTO `homepage` VALUES (56, 'Home Section Image 8', 'homeSectionImage8', 'b59a9ddf3d36a1d81de58c9c1859dc1a.png', '2020-06-30 15:34:06', '2021-02-12 12:37:48');

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `locationName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `coordinates` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isActive` tinyint(1) NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `geometryCoordinates` polygon NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES (1, 'World', '[{\"lat\":81.74296351581049,\"lng\":-159.82291229369366},{\"lat\":83.99366845200866,\"lng\":-19.90103729369372},{\"lat\":82.23282724897581,\"lng\":101.03646270630622},{\"lat\":77.49584183279016,\"lng\":156.58333770630622},{\"lat\":70.88975190540886,\"lng\":167.83333770630622},{\"lat\":52.56646117787263,\"lng\":166.42708770630622},{\"lat\":38.92966499328289,\"lng\":157.98958770630622},{\"lat\":1.5436013294439104,\"lng\":160.09896270630622},{\"lat\":-32.43080032523527,\"lng\":167.13021270630622},{\"lat\":-46.4642054470642,\"lng\":108.77083770630622},{\"lat\":-48.8320440546434,\"lng\":33.536462706306224},{\"lat\":-52.39893978609436,\"lng\":-26.93228729369372},{\"lat\":-57.63058726111004,\"lng\":-76.15103729369372},{\"lat\":-33.02230669073638,\"lng\":-114.82291229369372},{\"lat\":20.76144584973123,\"lng\":-138.02603729369372},{\"lat\":47.1338300060915,\"lng\":-159.11978729369366},{\"lat\":62.00358151553921,\"lng\":-166.15103729369366},{\"lat\":66.56801413212942,\"lng\":-167.55728729369366},{\"lat\":71.34483751494282,\"lng\":-166.85416229369366},{\"lat\":77.03083845194367,\"lng\":-166.15103729369366}]', 'Covered all the countries in the world! ', 1, '2020-03-09 06:32:24', '2021-02-12 12:10:00', ST_GeomFromText('POLYGON((81.7429635158105 -159.822912293694, 83.9936684520087 -19.9010372936937, 82.2328272489758 101.036462706306, 77.4958418327902 156.583337706306, 70.8897519054089 167.833337706306, 52.5664611778726 166.427087706306, 38.9296649932829 157.989587706306, 1.54360132944391 160.098962706306, -32.4308003252353 167.130212706306, -46.4642054470642 108.770837706306, -48.8320440546434 33.5364627063062, -52.3989397860944 -26.9322872936937, -57.63058726111 -76.1510372936937, -33.0223066907364 -114.822912293694, 20.7614458497312 -138.026037293694, 47.1338300060915 -159.119787293694, 62.0035815155392 -166.151037293694, 66.5680141321294 -167.557287293694, 71.3448375149428 -166.854162293694, 77.0308384519437 -166.151037293694, 81.7429635158105 -159.822912293694))'));

-- ----------------------------
-- Table structure for paymentmethods
-- ----------------------------
DROP TABLE IF EXISTS `paymentmethods`;
CREATE TABLE `paymentmethods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `processedIn` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fees` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `details` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `isEnable` tinyint(1) NOT NULL DEFAULT 1,
  `paymentType` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paymentmethods
-- ----------------------------
INSERT INTO `paymentmethods` VALUES (1, 'XX', NULL, NULL, NULL, NULL, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for payout
-- ----------------------------
DROP TABLE IF EXISTS `payout`;
CREATE TABLE `payout`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `methodId` int NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `payEmail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address1` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `address2` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `zipcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `last4Digits` int NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `isVerified` tinyint(1) NULL DEFAULT 0,
  `firstName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lastName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `Payout_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payout
-- ----------------------------
INSERT INTO `payout` VALUES (1, 1, 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 'test@test.com', 'ADD 111', 'ADD 222', 'BIG CITY', '1234', 'Small State', 'RandCountry', 'USD', 1, NULL, '2021-06-16 14:46:17', '2021-06-16 15:00:56', 1, 'Jhone', 'Doe');
INSERT INTO `payout` VALUES (3, 1, 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 'test@test.com', 'ADD 111', 'ADD 222', 'BIG CITY', '1234', 'Small State', 'RandCountry', 'USD', 0, NULL, '2021-06-16 15:00:48', '2021-06-16 15:00:56', 1, 'Jhone', 'Doe');
INSERT INTO `payout` VALUES (4, 1, 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 'test@test.com', 'ADD 111', 'ADD 222', 'BIG CITY', '1234', 'Small State', 'RandCountry', 'USD', 0, NULL, '2021-06-16 15:01:05', '2021-06-16 15:01:05', 1, 'Jhone', 'Doe');
INSERT INTO `payout` VALUES (5, 1, 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 'test@test.com', 'ADD 111', 'ADD 222', 'BIG CITY', '1234', 'Small State', 'RandCountry', 'USD', 0, NULL, '2021-06-18 14:37:32', '2021-06-18 14:37:32', 1, 'Jhone', 'Doe');
INSERT INTO `payout` VALUES (6, 1, 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 'rider@test.com', 'ADD 111', 'ADD 222', 'BIG CITY', '1234', 'Small State', 'RandCountry', 'USD', 0, NULL, '2021-06-18 14:37:49', '2021-06-18 14:37:49', 1, 'Jhone', 'Doe');
INSERT INTO `payout` VALUES (7, 1, 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 'rider@test.com', 'ADD 111', 'ADD 222', 'BIG CITY', '1234', 'Small State', 'RandCountry', 'USD', 0, NULL, '2021-06-18 14:38:16', '2021-06-18 14:38:16', 1, 'Jhone', 'Doe');
INSERT INTO `payout` VALUES (8, 1, 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 'rider@test.com', 'ADD 111', 'ADD 222', 'BIG CITY', '1234', 'Small State', 'RandCountry', 'USD', 0, NULL, '2021-06-18 14:38:48', '2021-06-18 14:38:48', 1, 'Jhone', 'Doe');
INSERT INTO `payout` VALUES (9, 1, 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 'rider@test.com', 'ADD 111', 'ADD 222', 'BIG CITY', '1234', 'Small State', 'RandCountry', 'USD', 0, NULL, '2021-06-18 14:40:10', '2021-06-18 14:40:10', 1, 'Jhone', 'Doe');

-- ----------------------------
-- Table structure for place
-- ----------------------------
DROP TABLE IF EXISTS `place`;
CREATE TABLE `place`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of place
-- ----------------------------
INSERT INTO `place` VALUES (7, 'Russia Moscow', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for precautionnotification
-- ----------------------------
DROP TABLE IF EXISTS `precautionnotification`;
CREATE TABLE `precautionnotification`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isEnabled` tinyint(1) NOT NULL DEFAULT 1,
  `imageName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of precautionnotification
-- ----------------------------
INSERT INTO `precautionnotification` VALUES (1, 'Wear a mask! Save lives! Fight against COVID-19!', '<p>Please ensure you follow the below steps for every ride, to keep you and your driver safe.</p><ul><li>Wear a face cover</li><li>Wash your hands</li><li>Keep a safe distance</li></ul>', 1, 'b8d80479a4500d505b7a201efd26f5e4.png', '2021-02-12 11:54:18', '2021-02-12 11:54:18');

-- ----------------------------
-- Table structure for pricing
-- ----------------------------
DROP TABLE IF EXISTS `pricing`;
CREATE TABLE `pricing`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoryId` int NULL DEFAULT NULL,
  `locationId` int NULL DEFAULT NULL,
  `unitPrice` float NULL DEFAULT 0,
  `minutePrice` float NULL DEFAULT 0,
  `basePrice` float NULL DEFAULT 0,
  `currency` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'USD',
  `riderFeeType` enum('fixed','percentage') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'percentage',
  `riderFeeValue` float NOT NULL,
  `driverFeeType` enum('fixed','percentage') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'percentage',
  `driverFeeValue` float NOT NULL,
  `isActive` tinyint(1) NULL DEFAULT 1,
  `isSurgePrice` tinyint(1) NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pricing
-- ----------------------------
INSERT INTO `pricing` VALUES (1, 1, 1, 2, 2, 10, 'USD', 'percentage', 10, 'percentage', 10, 1, 0, '2020-05-09 15:54:52', '2021-02-12 12:06:42');
INSERT INTO `pricing` VALUES (2, 2, 1, 3, 3, 12, 'USD', 'percentage', 10, 'percentage', 10, 1, 0, '2020-05-09 15:55:21', '2020-05-09 15:55:21');
INSERT INTO `pricing` VALUES (3, 3, 1, 4, 4, 15, 'USD', 'percentage', 10, 'percentage', 10, 1, 0, '2020-05-09 15:55:42', '2020-05-09 15:55:42');
INSERT INTO `pricing` VALUES (4, 5, 1, 5, 5, 20, 'USD', 'percentage', 10, 'percentage', 10, 1, 0, '2020-05-09 15:56:06', '2020-05-09 15:56:06');
INSERT INTO `pricing` VALUES (5, 4, 1, 10, 2, 25, 'USD', 'percentage', 10, 'percentage', 10, 1, 0, '2020-05-09 15:56:31', '2020-05-09 15:56:31');

-- ----------------------------
-- Table structure for promocode
-- ----------------------------
DROP TABLE IF EXISTS `promocode`;
CREATE TABLE `promocode`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` tinyint NULL DEFAULT 1,
  `promoValue` float NOT NULL DEFAULT 0,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `expiryDate` datetime NULL DEFAULT NULL,
  `isEnable` tinyint(1) NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promocode
-- ----------------------------
INSERT INTO `promocode` VALUES (1, '1st', 'This is 1st promocode', 'abcdefg', 1, 90, 'usd', '2021-06-29 15:00:00', 1, '2021-06-23 13:19:27', '2021-06-23 13:19:27');
INSERT INTO `promocode` VALUES (2, '1st', 'This is 1st promocode', '123456', 1, 90, 'usd', '2021-06-29 15:00:00', 1, '2021-06-23 13:19:27', '2021-06-23 13:19:27');

-- ----------------------------
-- Table structure for rent
-- ----------------------------
DROP TABLE IF EXISTS `rent`;
CREATE TABLE `rent`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` float NOT NULL,
  `speed` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rent
-- ----------------------------
INSERT INTO `rent` VALUES (7, 'Lexus', '2021 XYZ', 12.3, 72.1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bookingId` int NOT NULL,
  `authorId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ratings` float NULL DEFAULT NULL,
  `reviewContent` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reviews
-- ----------------------------
INSERT INTO `reviews` VALUES (26, 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 68, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 4, 'hjfhjfgjfgj\n', '2021-07-01 12:44:08', '2021-07-01 12:44:08');
INSERT INTO `reviews` VALUES (27, 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 69, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 4.5, 'He is good driver.', '2021-07-01 13:01:07', '2021-07-01 13:01:07');

-- ----------------------------
-- Table structure for savedlocations
-- ----------------------------
DROP TABLE IF EXISTS `savedlocations`;
CREATE TABLE `savedlocations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lat` float NULL DEFAULT NULL,
  `lng` float NULL DEFAULT NULL,
  `locationType` enum('home','friends','hospital','gym','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `locationName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for schedulebooking
-- ----------------------------
DROP TABLE IF EXISTS `schedulebooking`;
CREATE TABLE `schedulebooking`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `riderId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `bookingId` int NOT NULL,
  `tripStatus` enum('scheduled','completed','failed') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scheduleFrom` datetime NULL DEFAULT NULL,
  `scheduleTo` datetime NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedulebooking
-- ----------------------------
INSERT INTO `schedulebooking` VALUES (12, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 54, 'scheduled', '2021-06-28 18:30:00', '2021-06-28 18:40:00', '2021-06-28 15:21:46', '2021-06-28 15:21:46');
INSERT INTO `schedulebooking` VALUES (13, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 55, 'scheduled', '2021-07-03 15:04:00', '2021-07-03 15:14:00', '2021-06-28 15:53:43', '2021-06-28 15:53:43');

-- ----------------------------
-- Table structure for schedulebookinghistory
-- ----------------------------
DROP TABLE IF EXISTS `schedulebookinghistory`;
CREATE TABLE `schedulebookinghistory`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookingId` int NULL DEFAULT NULL,
  `scheduleId` int NULL DEFAULT NULL,
  `tripStatus` enum('scheduled','completed','failed','updated') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scheduleFrom` datetime NULL DEFAULT NULL,
  `scheduleTo` datetime NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedulebookinghistory
-- ----------------------------
INSERT INTO `schedulebookinghistory` VALUES (36, 54, 12, 'scheduled', '2021-06-28 18:30:00', '2021-06-28 18:40:00', '2021-06-28 15:21:46', '2021-06-28 15:21:46');
INSERT INTO `schedulebookinghistory` VALUES (37, 55, 13, 'scheduled', '2021-07-03 15:04:00', '2021-07-03 15:14:00', '2021-06-28 15:53:43', '2021-06-28 15:53:43');

-- ----------------------------
-- Table structure for sequelizemeta
-- ----------------------------
DROP TABLE IF EXISTS `sequelizemeta`;
CREATE TABLE `sequelizemeta`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sequelizemeta
-- ----------------------------
INSERT INTO `sequelizemeta` VALUES ('20190926052943-addStripeFieldToProfile.js');
INSERT INTO `sequelizemeta` VALUES ('20190927072518-addServiceFeeSettings.js');
INSERT INTO `sequelizemeta` VALUES ('20191008070900-addCountriesTable.js');
INSERT INTO `sequelizemeta` VALUES ('20191008073524-addCurrenciesTable.js');
INSERT INTO `sequelizemeta` VALUES ('20191017094012-addactiveStatusFieldtoUser.js');
INSERT INTO `sequelizemeta` VALUES ('20191029065327-updateBookingDatesFieldTypes.js');
INSERT INTO `sequelizemeta` VALUES ('20191030065343-addCurrencyToBookingTable.js');
INSERT INTO `sequelizemeta` VALUES ('20191030071733-addOverallRatingToUserTable.js');
INSERT INTO `sequelizemeta` VALUES ('20191030074152-allowNullForTransactionIdToBookingTable.js');
INSERT INTO `sequelizemeta` VALUES ('20191107055240-addRiderDriverTotalFareToBooking.js');
INSERT INTO `sequelizemeta` VALUES ('20191114073847-addNotesColumnToBooking.js');
INSERT INTO `sequelizemeta` VALUES ('20191202162352-addMinutePriceOnCategory.js');
INSERT INTO `sequelizemeta` VALUES ('20191202170507-addMinutePriceToBooking.js');
INSERT INTO `sequelizemeta` VALUES ('20191207141027-addVehicleIdToBooking.js');
INSERT INTO `sequelizemeta` VALUES ('20191218055441-addCapacityColumn.js');
INSERT INTO `sequelizemeta` VALUES ('20191227055513-addPhoneCountryCode.js');
INSERT INTO `sequelizemeta` VALUES ('20200110151340-addRoleIdToAdminUser.js');
INSERT INTO `sequelizemeta` VALUES ('20200113092830-deletedAtUser.js');
INSERT INTO `sequelizemeta` VALUES ('20200116084426-deletedAtColumnAddedToUser.js');
INSERT INTO `sequelizemeta` VALUES ('20200116122021-addWalletColumnsToUserProfile.js');
INSERT INTO `sequelizemeta` VALUES ('20200122104428-addPromoCodeFieldsToBooking.js');
INSERT INTO `sequelizemeta` VALUES ('20200203043316-addColumnsTips.js');
INSERT INTO `sequelizemeta` VALUES ('20200204091208-addColumnsDriverTotalTips.js');
INSERT INTO `sequelizemeta` VALUES ('20200205131034-paymentIntentColumns.js');
INSERT INTO `sequelizemeta` VALUES ('20200207125112-removeUnwantedStripePaymentIntentColumns.js');
INSERT INTO `sequelizemeta` VALUES ('20200208115100-addColumnIsActiveAtCancelReason.js');
INSERT INTO `sequelizemeta` VALUES ('20200213080259-addColumnstollFee.js');
INSERT INTO `sequelizemeta` VALUES ('20200219073437-addColumnLocation.js');
INSERT INTO `sequelizemeta` VALUES ('20200219074738-addHomePageSettings.js');
INSERT INTO `sequelizemeta` VALUES ('20200220064353-addColumnBooking.js');
INSERT INTO `sequelizemeta` VALUES ('20200220080129-addPayoutColumn.js');
INSERT INTO `sequelizemeta` VALUES ('20200224073822-addHomePageSettingExtraValues.js');
INSERT INTO `sequelizemeta` VALUES ('20200305060009-isVerifiedAtPayoutTable.js');
INSERT INTO `sequelizemeta` VALUES ('20200306064335-changeColumnReasonAtFailedTransactionHistory.js');
INSERT INTO `sequelizemeta` VALUES ('20200309132008-changeIsVerifiedAtPayout.js');
INSERT INTO `sequelizemeta` VALUES ('20200312105450-addPayoutHolderNames.js');
INSERT INTO `sequelizemeta` VALUES ('20200313071146-insertStaticPageSupport.js');
INSERT INTO `sequelizemeta` VALUES ('20200316115834-pageBannerAtStaticPage.js');
INSERT INTO `sequelizemeta` VALUES ('20200316120223-insertStaticPageRiderAndDriver.js');
INSERT INTO `sequelizemeta` VALUES ('20200406073458-changeCategoryColumnsAcceptNull.js');
INSERT INTO `sequelizemeta` VALUES ('20200407045029-addPageBanner.js');
INSERT INTO `sequelizemeta` VALUES ('20200407121624-changeVehicleStatus.js');
INSERT INTO `sequelizemeta` VALUES ('20200407144649-changeVehicleStatus.js');
INSERT INTO `sequelizemeta` VALUES ('20200409104455-changeCharacterSetContentPage.js');
INSERT INTO `sequelizemeta` VALUES ('20200422091657-addPolygonColumnToLocation.js');
INSERT INTO `sequelizemeta` VALUES ('20200429145337-addPricingIdToBooking.js');
INSERT INTO `sequelizemeta` VALUES ('20200529054910-addExtraHomepageSettings.js');
INSERT INTO `sequelizemeta` VALUES ('20201126073032-addVoipIdToModels.js');
INSERT INTO `sequelizemeta` VALUES ('20201210051721-androidAndIosVersion.js');
INSERT INTO `sequelizemeta` VALUES ('20201228070317-addRiderPayableFareInBooking.js');
INSERT INTO `sequelizemeta` VALUES ('20201228071503-alterBookingTableDriverIdToNull.js');
INSERT INTO `sequelizemeta` VALUES ('20201229094606-addNewEnumInBookingTable.js');
INSERT INTO `sequelizemeta` VALUES ('20201230095552-addColumnBookingTypeInBooking.js');
INSERT INTO `sequelizemeta` VALUES ('20210109101511-removeUnwatedVoipDeviceId.js');
INSERT INTO `sequelizemeta` VALUES ('20210112074659-addRiderIdToScheduleBooking.js');
INSERT INTO `sequelizemeta` VALUES ('20210121071549-addDriverPrivacyPolicyPage.js');
INSERT INTO `sequelizemeta` VALUES ('20210201135022-changeDescriptionDataType.js');
INSERT INTO `sequelizemeta` VALUES ('20210202084509-updateBookingTripStatusColumn.js');

-- ----------------------------
-- Table structure for sitesettings
-- ----------------------------
DROP TABLE IF EXISTS `sitesettings`;
CREATE TABLE `sitesettings`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sitesettings
-- ----------------------------
INSERT INTO `sitesettings` VALUES (1, 'Site Name', 'siteName', 'Your Site', NULL, '2020-02-10 13:05:03', '2021-02-12 11:52:26');
INSERT INTO `sitesettings` VALUES (2, 'Logo Height', 'logoHeight', '34', NULL, '2020-02-10 13:05:03', '2021-02-12 11:52:26');
INSERT INTO `sitesettings` VALUES (3, 'Logo Width', 'logoWidth', '140', NULL, '2020-02-10 13:05:03', '2021-02-12 11:52:26');
INSERT INTO `sitesettings` VALUES (4, 'Site Title', 'siteTitle', 'Your Site Title', NULL, '2020-02-10 13:05:03', '2021-02-12 11:52:26');
INSERT INTO `sitesettings` VALUES (5, 'Meta Description', 'metaDescription', 'Your Site Meta Description', NULL, '2020-02-10 13:05:03', '2021-02-12 11:52:26');
INSERT INTO `sitesettings` VALUES (6, 'Facebook Link', 'facebookLink', 'https://www.facebook.com/yoursite', NULL, '2020-02-10 13:05:03', '2021-02-12 11:52:26');
INSERT INTO `sitesettings` VALUES (7, 'Twitter Link', 'twitterLink', 'https://twitter.com/yoursite', NULL, '2020-02-10 13:05:03', '2021-02-12 11:52:26');
INSERT INTO `sitesettings` VALUES (8, 'Youtube Link', 'youtubeLink', 'https://www.youtube.com/yoursite', NULL, '2020-02-10 13:05:03', '2021-02-12 11:52:26');
INSERT INTO `sitesettings` VALUES (9, 'Instagram Link', 'instagramLink', 'https://www.instagram.com/yoursite', NULL, '2020-02-10 13:05:03', '2021-02-12 11:52:26');
INSERT INTO `sitesettings` VALUES (10, 'Meta Keyword', 'metaKeyword', 'Your Site Meta Keyword', NULL, '2020-02-10 13:05:03', '2021-02-12 11:52:26');
INSERT INTO `sitesettings` VALUES (11, 'Home Logo', 'homeLogo', '3ae636aa7d8f90db5a176099461d7dda.png', NULL, '2020-02-10 13:05:03', '2021-02-12 11:52:26');
INSERT INTO `sitesettings` VALUES (12, 'App Force Update', 'appForceUpdate', 'true', 'appSettings', '2021-01-11 07:22:55', '2021-02-12 11:52:26');
INSERT INTO `sitesettings` VALUES (13, 'Rider Android Version', 'riderAndroidVersion', '1.0', 'appSettings', '2021-01-11 07:22:55', '2021-02-12 11:52:26');
INSERT INTO `sitesettings` VALUES (14, 'Rider iOS Version', 'riderIosVersion', '1.0', 'appSettings', '2021-01-11 07:22:55', '2021-02-12 11:52:26');
INSERT INTO `sitesettings` VALUES (15, 'Driver Android Version', 'driverAndroidVersion', '1.0', 'appSettings', '2021-01-11 07:22:55', '2021-02-12 11:52:26');
INSERT INTO `sitesettings` VALUES (16, 'Driver iOS Version', 'driverIosVersion', '1.0', 'appSettings', '2021-01-11 07:22:55', '2021-02-12 11:52:26');

-- ----------------------------
-- Table structure for smsverification
-- ----------------------------
DROP TABLE IF EXISTS `smsverification`;
CREATE TABLE `smsverification`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `phoneNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phoneDialCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deviceId` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `deviceType` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `otp` int NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smsverification
-- ----------------------------
INSERT INTO `smsverification` VALUES (1, '555', '5', NULL, NULL, NULL, 1234, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `smsverification` VALUES (2, '111', '1', NULL, 'eD7Br9hyRwCF0szjQ9S4PQ:APA91bGLo5RdjaVkx-BEIgvenTedAaWi1ZTk0cntPXVD1TzqXRYGChq3bey33cjaFRFDSparEFHcre2H3dvr8vfuJwS4TWC12-pkvir3KxsD9it9nAx8Z4pmfE8sKc37NIvWDem8RlJn', 'android', 1234, '2021-06-10 16:50:35', '2021-06-11 01:52:09');
INSERT INTO `smsverification` VALUES (3, '112', '1', NULL, 'dn1BN9x0TTmWYkl4avUS2V:APA91bHzhbnm6qjZgKRCRf0l9uSzga5R9GNysQHUwj19SBqiLV_D-l4eC0OgyzXkFD8FS8O522oQMsp0UKWHr9bXjG3YdHQXrbc24OOdp0GXS4HW4YY69lK9H6uHhTbFJfmv4AeRIQWR', 'android', 1234, '2021-06-11 23:57:30', '2021-06-12 00:03:29');

-- ----------------------------
-- Table structure for staffpool
-- ----------------------------
DROP TABLE IF EXISTS `staffpool`;
CREATE TABLE `staffpool`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT NULL,
  `createdAt` datetime(6) NULL DEFAULT NULL,
  `updatedAt` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staffpool
-- ----------------------------
INSERT INTO `staffpool` VALUES (1, 'Company A', 'ABCD', 1, NULL, NULL);
INSERT INTO `staffpool` VALUES (2, 'Company B', 'GFHE', 2, NULL, NULL);

-- ----------------------------
-- Table structure for staticpage
-- ----------------------------
DROP TABLE IF EXISTS `staticpage`;
CREATE TABLE `staticpage`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pageName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `content` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `metaTitle` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `metaDescription` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pageBanner` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staticpage
-- ----------------------------
INSERT INTO `staticpage` VALUES (1, 'Support', '<p>Email: support@yourdomain.com</p><p>Phone Number: +0 000 0000 000</p>', 'Support', 'Support', NULL, '2020-03-25 13:52:13', '2020-03-25 13:55:28');
INSERT INTO `staticpage` VALUES (2, 'Rider', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>', 'Rider', 'Rider', '09068a14be5623a95877e3527cba3948.png', '2020-03-25 13:52:37', '2020-03-25 13:56:32');
INSERT INTO `staticpage` VALUES (3, 'Driver', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.&nbsp;</p>', 'Driver', 'Driver', 'c26b9c70074fae38a6103283e5f038f5.png', '2020-03-25 13:52:37', '2020-03-25 13:57:02');
INSERT INTO `staticpage` VALUES (4, 'Driver Privacy Policy', '<p><strong>Privacy Policy</strong></p><p>This Privacy Policy describes how your personal information is collected, used, and shared when you use our &lt;YOUR PROJECT&gt; application.</p><p>&lt;YOUR COMPANY&gt; built the &lt;YOUR PROJECT&gt;  app as a Free app. This SERVICE is provided by &lt;YOUR COMPANY&gt; at no cost and is intended for use as is.</p><p>This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.</p><p>If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.</p><p><br></p><p><strong>Information Collection and Use</strong></p><p>For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to Users(Driver Partners) live location, email address, and phone number. The information that we request will be retained by us and used as described in this privacy policy.</p><p>This app collects location data to enable \"live location tracking\" and \"receive ride requests\" even when the app is closed or not in use.&nbsp;We collect your live location for better communication with the rider.</p><p>The app does use third-party services that may collect information used to identify you.</p><p>Link to the privacy policy of third party service providers used by the app</p><ul><li><a href=\"https://www.google.com/policies/privacy/\" rel=\"noopener noreferrer\" target=\"_blank\">Google Play Services</a></li></ul><p><br></p><p><strong>Log Data</strong></p><p>We want to inform you that whenever you use our Service, in case of an error in the app we collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.</p><p><br></p><p><strong>Cookies</strong></p><p>Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device\'s internal memory.</p><p>This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.</p><p><br></p><p><strong>Service Providers</strong></p><p>We may employ third-party companies and individuals due to the following reasons:</p><ul><li>To facilitate our Service;</li><li>To provide the Service on our behalf;</li><li>To perform Service-related services; or</li></ul><p>To assist us in analyzing how our Service is used.</p><p>We want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.</p><p><br></p><p><strong>Security</strong></p><p>We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.</p><p><br></p><p><strong>Changes to This Privacy Policy</strong></p><p>We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.</p><p><br></p><p><strong>Contact Us</strong></p><p>If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at &lt;SUPPORT EMAIL ADDRESS&gt;.</p>', 'Privacy Policy', 'Privacy Policy', NULL, '2021-02-01 08:40:12', '2021-02-01 09:36:19');

-- ----------------------------
-- Table structure for stay
-- ----------------------------
DROP TABLE IF EXISTS `stay`;
CREATE TABLE `stay`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `capacity` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stay
-- ----------------------------
INSERT INTO `stay` VALUES (5, 'A Hotel', 'Good. nice', 9, '0000-00-00 00:00:00', '2021-05-13 19:38:24');
INSERT INTO `stay` VALUES (6, 'wwef', '23234', 12, '0000-00-00 00:00:00', '2021-06-11 15:29:13');

-- ----------------------------
-- Table structure for tempimages
-- ----------------------------
DROP TABLE IF EXISTS `tempimages`;
CREATE TABLE `tempimages`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tableName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fieldName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fileName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tempimages
-- ----------------------------
INSERT INTO `tempimages` VALUES (1, 'SiteSettings', 'siteLogo', NULL, '2020-05-09 15:31:19', '2021-02-12 11:52:26');
INSERT INTO `tempimages` VALUES (2, 'Homepage', 'aboutGridImage2', NULL, '2020-05-09 15:39:50', '2020-05-09 15:40:00');
INSERT INTO `tempimages` VALUES (3, 'Homepage', 'aboutGridImage1', NULL, '2020-05-09 15:39:55', '2020-05-09 15:40:00');
INSERT INTO `tempimages` VALUES (4, 'Homepage', 'signupGridImage2', NULL, '2020-05-09 16:00:18', '2021-02-12 12:38:08');
INSERT INTO `tempimages` VALUES (5, 'Homepage', 'signupGridImage1', NULL, '2020-05-09 16:00:21', '2021-02-12 12:38:08');
INSERT INTO `tempimages` VALUES (6, 'Homepage', 'signupGridImage3', NULL, '2020-05-09 16:01:20', '2021-02-12 12:38:08');
INSERT INTO `tempimages` VALUES (7, 'Homepage', 'safetyGridImage2', NULL, '2020-05-09 16:01:34', '2021-02-12 12:37:59');
INSERT INTO `tempimages` VALUES (8, 'Homepage', 'safetyGridImage1', NULL, '2020-05-09 16:01:37', '2021-02-12 12:37:59');
INSERT INTO `tempimages` VALUES (9, 'Homepage', 'safetyGridImage3', NULL, '2020-05-09 16:01:41', '2021-02-12 12:37:59');
INSERT INTO `tempimages` VALUES (10, 'Homepage', 'homeSectionImage1', NULL, '2020-05-09 16:02:37', '2021-02-12 12:37:48');
INSERT INTO `tempimages` VALUES (11, 'Homepage', 'homeSectionImage2', NULL, '2020-05-09 16:02:45', '2021-02-12 12:37:48');
INSERT INTO `tempimages` VALUES (12, 'Homepage', 'homeSectionImage3', NULL, '2020-05-09 16:02:52', '2021-02-12 12:37:48');
INSERT INTO `tempimages` VALUES (13, 'Homepage', 'homeSectionImage4', NULL, '2020-05-09 16:02:59', '2021-02-12 12:37:48');
INSERT INTO `tempimages` VALUES (14, 'Homepage', 'homeSectionImage5', NULL, '2020-05-09 16:03:08', '2021-02-12 12:37:48');
INSERT INTO `tempimages` VALUES (15, 'Homepage', 'homeSectionImage6', NULL, '2020-05-09 16:03:19', '2021-02-12 12:37:48');
INSERT INTO `tempimages` VALUES (16, 'ContentPage', 'pageBanner', NULL, '2020-05-09 16:10:37', '2020-05-09 16:11:28');
INSERT INTO `tempimages` VALUES (17, 'Homepage', 'homeSectionImage7', NULL, '2020-06-30 17:46:15', '2021-02-12 12:37:48');
INSERT INTO `tempimages` VALUES (18, 'Homepage', 'homeSectionImage8', NULL, '2020-06-30 17:46:25', '2021-02-12 12:37:48');
INSERT INTO `tempimages` VALUES (19, 'PrecautionNotification', 'imageName', NULL, '2021-02-12 11:54:16', '2021-02-12 11:54:18');

-- ----------------------------
-- Table structure for threaditems
-- ----------------------------
DROP TABLE IF EXISTS `threaditems`;
CREATE TABLE `threaditems`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `threadId` int NOT NULL,
  `bookingId` int NOT NULL,
  `sentBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sendTo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `isRead` tinyint(1) NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `threadId`(`threadId`) USING BTREE,
  CONSTRAINT `threaditems_ibfk_1` FOREIGN KEY (`threadId`) REFERENCES `threads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of threaditems
-- ----------------------------

-- ----------------------------
-- Table structure for threads
-- ----------------------------
DROP TABLE IF EXISTS `threads`;
CREATE TABLE `threads`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookingId` int NOT NULL,
  `riderId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `driverId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `messageUpdatedDate` datetime NULL DEFAULT NULL,
  `riderUnreadCount` int NULL DEFAULT 0,
  `driverUnreadCount` int NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of threads
-- ----------------------------

-- ----------------------------
-- Table structure for transactionhistory
-- ----------------------------
DROP TABLE IF EXISTS `transactionhistory`;
CREATE TABLE `transactionhistory`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookingId` int NOT NULL,
  `driverId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `riderId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `amount` float NOT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transactionId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transactionhistory
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phoneNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phoneDialCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lat` float NULL DEFAULT NULL,
  `lng` float NULL DEFAULT NULL,
  `userStatus` enum('pending','active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'pending',
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `isBan` tinyint(1) NOT NULL DEFAULT 0,
  `userType` tinyint(1) NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `activeStatus` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'active',
  `overallRating` float NULL DEFAULT 0,
  `phoneCountryCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deletedAt` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2c8dc340-ca4e-11eb-a440-addeb05593b1', 'friend1@test.com', '$2b$08$Xuoje.w5I.ciyeCLTJv7IuIGWKQpES0wzLi7fK.sPrjQKdBmv8gEG', '5551', '5', NULL, NULL, 'active', 0, 0, 1, '2021-06-11 00:44:26', '2021-06-11 00:44:26', 'active', 0, '1', NULL);
INSERT INTO `user` VALUES ('74264f50-c469-11eb-913d-d7e9d04f0e28', 'friend@test.com', '$2b$08$KvvYS5cSoUnwbaStRC8/s.Q/FoIizsoMU4lfaLoRCC4zaQFRArvUy', '555', '5', NULL, NULL, 'active', 0, 0, 1, '2021-06-03 12:44:36', '2021-06-09 03:19:41', 'inactive', 0, '1', NULL);
INSERT INTO `user` VALUES ('8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'rider@test.com', '$2b$08$LGFvmu6o10cHOhnj9fF/4ug8vOtkcj4oDf7JE.hl6YA7sKa/EMOe.', '111', '+1', 32.5764, 86.0971, 'active', 0, 0, 1, '2021-05-13 14:43:15', '2021-07-06 07:59:23', 'inactive', 3.9, '1', NULL);
INSERT INTO `user` VALUES ('a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 'driver@test.com', '$2b$08$fcWFdkat7R335CKDQchw6.X7/Y9ZjwYzcNMSQuv.MiF/rzDS6DSQu', '222', '222', 38.2367, -122.086, 'active', 1, 0, 2, '2021-05-13 14:44:01', '2021-07-01 13:01:07', 'active', 4.25, '1', NULL);
INSERT INTO `user` VALUES ('a984f2c0-ca57-11eb-a440-addeb05593b1', 'brown@gmail.com', '$2b$08$m1VQO/NoPzbXgWhRJ1MnduqKTOOSUk/8JAS81DUArSaGmx3j7qzMO', '111', '1', NULL, NULL, 'active', 0, 0, 1, '2021-06-11 01:52:21', '2021-06-11 01:52:21', 'active', 0, 'US', NULL);
INSERT INTO `user` VALUES ('cfcaecf0-cb10-11eb-b3c9-59d16dc10d5c', 'john@gmail.com', '$2b$08$07AJjkAExbuDRWEZp2iipu3yzR3SjSL60pSo4ZN067VNgdGGqyCeW', '112', '1', 37.422, -122.084, 'active', 1, 0, 2, '2021-06-11 23:57:43', '2021-06-14 01:17:16', 'active', 0, 'US', NULL);

-- ----------------------------
-- Table structure for userlogin
-- ----------------------------
DROP TABLE IF EXISTS `userlogin`;
CREATE TABLE `userlogin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deviceType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deviceDetail` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `deviceId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `UserLogin_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userlogin
-- ----------------------------
INSERT INTO `userlogin` VALUES (8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjZmE4OGYwLWIzZjktMTFlYi1hYmIxLTZmMjc0YWU4ZDM3YyIsImVtYWlsIjoibm9ybWFsdXNlckB0ZXN0LmNvbSIsImlhdCI6MTYyMTQxMjcyMSwiZXhwIjoxNjM2OTY0NzIxfQ.juuq4OhnEH4jQDwKewGgCWTF97y1RyHExCOkacUY4ao', '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'android', NULL, 'f6-FMCXSQDu3J20FDwB8Fe:APA91bE6Xwv-zQ7oWuTB_m-Uee8c_YxOT89Yw2CuQmcXQcwZBNe7MqVDHybQhSkecov0341lMHmXGO_12leBGx67tiRxsEZUCV-YE9_52mRusPwvQwv-pqZCYrCCCuv9m77WUqzyr7y-', '2021-05-19 08:25:21', '2021-05-19 08:25:21');
INSERT INTO `userlogin` VALUES (9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE4NzE3YWQwLWIzZjktMTFlYi1hYmIxLTZmMjc0YWU4ZDM3YyIsImVtYWlsIjoiZHJpdmVyQHRlc3QuY29tIiwiaWF0IjoxNjIxNzczOTEyLCJleHAiOjE2MzczMjU5MTJ9.UshDEQlUiNJrzZltr1h6mrn0USWRxrc_dYVtODx9mNk', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 'android', NULL, 'dxcZ5P76S_SQV1G4jgN_fS:APA91bFrC9-gtnb7Tdi2EYJ7stxEiZY26b2H3csSFZEomwUjCbI9qVWKeZmlSzc-_V0qPIAzw1UKh_V9J_d54SoDZJUrsbWzzNZJ_e-pNxyExNwcZVaLf5CPZPg_ov7WiKOCOd3_TZAU', '2021-05-23 12:45:12', '2021-05-23 12:45:12');
INSERT INTO `userlogin` VALUES (10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjZmE4OGYwLWIzZjktMTFlYi1hYmIxLTZmMjc0YWU4ZDM3YyIsImVtYWlsIjoicmlkZXJAdGVzdC5jb20iLCJpYXQiOjE2MjE3NzgwNjMsImV4cCI6MTYzNzMzMDA2M30.hR4YnA0LnEky6p_nmXilndYRUYU3plBSPFCPpmcCK6g', '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'android', NULL, 'cMQpiyh9Qd-rvFjpre50z4:APA91bFuvrF4CaeizEX7Su0VlPuTEtq5UGgIIqM2hm8cvNHRHpoakt_WK9AaUAyXCesivYQKY2r6Q3OZv_xPNy6Gk-aOmaVy0eFqxydqZpbL2a2HMy5vdnCdI5mVn9K16raT0f-DnI7V', '2021-05-23 13:54:23', '2021-05-23 13:54:23');
INSERT INTO `userlogin` VALUES (12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjZmE4OGYwLWIzZjktMTFlYi1hYmIxLTZmMjc0YWU4ZDM3YyIsImVtYWlsIjoicmlkZXJAdGVzdC5jb20iLCJpYXQiOjE2MjE4MzE0MjIsImV4cCI6MTYzNzM4MzQyMn0.p3Wdm3hnnt9iQf4bTv0rOXF_VkuEXatvHbIAsFQaRkY', '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'android', NULL, 'eS58aHYITxabnjh6p7G0mW:APA91bFpz35wP3XLo8diGEp41SQqkaxQau1-ItzKIIRLxCxGLzOM-j1VrIbegrddWe1_7HLD4A6FgYQD2zbTsAB6h9W9uL3qc7Dqtz9QJ0PM_sSvZl0pNDV2S0ZchSgvjqOJo33PpQ9K', '2021-05-24 04:43:42', '2021-05-24 04:43:42');
INSERT INTO `userlogin` VALUES (13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjZmE4OGYwLWIzZjktMTFlYi1hYmIxLTZmMjc0YWU4ZDM3YyIsImVtYWlsIjoicmlkZXJAdGVzdC5jb20iLCJpYXQiOjE2MjE5MzAzNjgsImV4cCI6MTYzNzQ4MjM2OH0.RBiItz55SweK1d3mOmXYVxOnamoqg8j3O_tZANkc9Ag', '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'X5', NULL, 'newdeviceid', '2021-05-25 03:09:11', '2021-05-25 08:12:48');
INSERT INTO `userlogin` VALUES (14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjZmE4OGYwLWIzZjktMTFlYi1hYmIxLTZmMjc0YWU4ZDM3YyIsImVtYWlsIjoicmlkZXJAdGVzdC5jb20iLCJpYXQiOjE2MjIwNDQ4MTgsImV4cCI6MTYzNzU5NjgxOH0.XCHTt74eDCGRRCNUHcblSVSMN7MZKTpnWgTfaWAevMU', '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'android', NULL, 'fdIC1Q9nS_eorYQpTQatlQ:APA91bG-QvXAYsmWhhyl1YFKxviw_omAfFpa8utTlm093hdnxRAza-_UZ1jsfB-gqqJ5KP9Xb71EruZVw34njYzoN7QPoXjFdaaZrMgNjOtHUJr1-1jLfOu5Rs2vR4AXk9t5uPYU2Rb3', '2021-05-26 16:00:19', '2021-05-26 16:00:19');
INSERT INTO `userlogin` VALUES (15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE4NzE3YWQwLWIzZjktMTFlYi1hYmIxLTZmMjc0YWU4ZDM3YyIsImVtYWlsIjoiZHJpdmVyQHRlc3QuY29tIiwiaWF0IjoxNjIyMDQ3MDkxLCJleHAiOjE2Mzc1OTkwOTF9.Q3BYUupoMEDbXqUZ9ycqh1_AJDWpLsHeF9f3U6FssPY', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 'android', NULL, 'fEMZrFoKSd6-sD2_G-AFqC:APA91bG82Qjj-Ht6a5nTlosvIa0Fd9S7YUE4hfJfOa3fxakWm2ZaDh7p9Y2NXNb5zRQ8nItPWwi-I6C4GUbgxL8UyPdHMStePgWozis2ccGMIN5YIEnisHmUkcu1fB9h7znX7fqSpYbv', '2021-05-26 16:38:11', '2021-05-26 16:38:11');
INSERT INTO `userlogin` VALUES (16, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjZmE4OGYwLWIzZjktMTFlYi1hYmIxLTZmMjc0YWU4ZDM3YyIsImVtYWlsIjoicmlkZXJAdGVzdC5jb20iLCJpYXQiOjE2MjI0Nzc0NDMsImV4cCI6MTYzODAyOTQ0M30.DDoNLd7_Wsu_gPjnPfxPtW1qa-lp5EMF0sqlAHxxRYE', '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'android', NULL, 'fzgji8WHTQqOjDAQp6F0qc:APA91bEzPCI2AghDtAY3D49HxmWKVN-X1S-eIuYEvoYnrDA-s2EjLKRdjlPn4W8pTLIRcx4_kFVuixmG8a5enzcb5MFBlzQuLVxpkgiS7sHxsL48d0vj3xymENpa36VWyuk8gszzt0bW', '2021-05-31 16:10:43', '2021-05-31 16:10:43');
INSERT INTO `userlogin` VALUES (17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE4NzE3YWQwLWIzZjktMTFlYi1hYmIxLTZmMjc0YWU4ZDM3YyIsImVtYWlsIjoiZHJpdmVyQHRlc3QuY29tIiwiaWF0IjoxNjIyNTU4NjQxLCJleHAiOjE2MzgxMTA2NDF9.7Cl41967IU5d30opE0b6TeIsF9gvfTde46QFzunCsbw', 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 'android', NULL, 'e9jN6vNHSm-oYYmZ-AoEye:APA91bEIt-v5khDU89y6hiU3_NdulYXFg0e3jc1cRSNDRiW5l3s-M9LdWiNCwI7jHumo5aCS9dSSgMNBP6K0XU3Bqo1NrEsgf9y578UFR0I9q4wD4MFd1MhNA7uOo38szx5F2ZmAsVxJ', '2021-06-01 14:44:01', '2021-06-01 14:44:01');
INSERT INTO `userlogin` VALUES (18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjZmE4OGYwLWIzZjktMTFlYi1hYmIxLTZmMjc0YWU4ZDM3YyIsImVtYWlsIjoicmlkZXJAdGVzdC5jb20iLCJpYXQiOjE2MjI2NDA3MjcsImV4cCI6MTYzODE5MjcyN30.m9jihAU6f50o3pChPvHxrmie9Mz0CMrNchqEB8iXafg', '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'android', NULL, 'asdfasdfasdf', '2021-06-02 13:32:07', '2021-06-02 13:32:07');
INSERT INTO `userlogin` VALUES (19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Ijc0MjY0ZjUwLWM0NjktMTFlYi05MTNkLWQ3ZTlkMDRmMGUyOCIsImVtYWlsIjoiZnJpZW5kQHRlc3QuY29tIiwicGhvbmVOdW1iZXIiOiI1NTUiLCJpYXQiOjE2MjI3MjQyNzYsImV4cCI6MTYzODI3NjI3Nn0.E0DKa-5ysozMF8Ny8eWWtXCxPn5Km2_X5VtHSr8oNZk', '74264f50-c469-11eb-913d-d7e9d04f0e28', 'android', NULL, 'zxc-FMCXSQDu3J20FDwB8Fe:APA91bE6Xwv-zQ7oWuTB_m-Uee8c_YxOT89Yw2CuQmcXQcwZBNe7MqVDHybQhSkecov0341lMHmXGO_12leBGx67tiRxsEZUCV-YE9_52mRusPwvQwv-pqZCYrCCCuv9m77WUqzyr7y-', '2021-06-03 12:44:36', '2021-06-03 12:44:36');
INSERT INTO `userlogin` VALUES (22, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjZmE4OGYwLWIzZjktMTFlYi1hYmIxLTZmMjc0YWU4ZDM3YyIsImVtYWlsIjoicmlkZXJAdGVzdC5jb20iLCJpYXQiOjE2MjMwNjY2NzgsImV4cCI6MTYzODYxODY3OH0.FGH4ildJtHpBRqEvYXTKvTM8Qi9XWvU1VhNA0la9IFU', '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'android', NULL, 'eA3sQaOoRaO_0G2UXkyz1h:APA91bEszmiqblwvib0Z8DVyDdKW7RgpuunxeNbzXPVsEioyZHyg-DmHZ8Qv6lVIJvpwyd9KN3SXFWIkMktFACYLakm4DWueb4_uj2MYu9i0jrjMk7QiAdRo1zZL5mxwDgovL0gsImWz', '2021-06-07 11:51:18', '2021-06-07 11:51:18');
INSERT INTO `userlogin` VALUES (24, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJjOGRjMzQwLWNhNGUtMTFlYi1hNDQwLWFkZGViMDU1OTNiMSIsImVtYWlsIjoiZnJpZW5kMUB0ZXN0LmNvbSIsInBob25lTnVtYmVyIjoiNTU1MSIsImlhdCI6MTYyMzM3MjI2NywiZXhwIjoxNjM4OTI0MjY3fQ.Iif4AiR1M12CrcvrlS-bOJi1q_OfDf-gyRWxKr69xYY', '2c8dc340-ca4e-11eb-a440-addeb05593b1', 'android', NULL, 'zxc-FMCXSQDu3J20FDwB8Fe:APA91bE6Xwv-zQ7oWuTB_m-Uee8c_YxOT89Yw2CuQmcXQcwZBNe7MqVDHybQhSkecov0341lMHmXGO_12leBGx67tiRxsEZUCV-YE9_52mRusPwvQwv-pqZCYrCCCuv9m77WUqzyr7y1', '2021-06-11 00:44:27', '2021-06-11 00:44:27');
INSERT INTO `userlogin` VALUES (25, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE5ODRmMmMwLWNhNTctMTFlYi1hNDQwLWFkZGViMDU1OTNiMSIsImVtYWlsIjoiYnJvd25AZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIxMTEiLCJpYXQiOjE2MjMzNzYzNDIsImV4cCI6MTYzODkyODM0Mn0.xEIFBDe95nbmRJi4mo6G8oymCCaIPo3j4SctKp7kFK8', 'a984f2c0-ca57-11eb-a440-addeb05593b1', 'android', NULL, 'eD7Br9hyRwCF0szjQ9S4PQ:APA91bGLo5RdjaVkx-BEIgvenTedAaWi1ZTk0cntPXVD1TzqXRYGChq3bey33cjaFRFDSparEFHcre2H3dvr8vfuJwS4TWC12-pkvir3KxsD9it9nAx8Z4pmfE8sKc37NIvWDem8RlJn', '2021-06-11 01:52:22', '2021-06-11 01:52:22');
INSERT INTO `userlogin` VALUES (26, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNmY2FlY2YwLWNiMTAtMTFlYi1iM2M5LTU5ZDE2ZGMxMGQ1YyIsImVtYWlsIjoiam9obkBnbWFpbC5jb20iLCJpYXQiOjE2MjM0NTcwNjAsImV4cCI6MTYzOTAwOTA2MH0.tJGag513MmKR_4EVhTkQ2iCgJNvWlVZn65vBd_wOMbU', 'cfcaecf0-cb10-11eb-b3c9-59d16dc10d5c', 'android', NULL, 'dn1BN9x0TTmWYkl4avUS2V:APA91bHzhbnm6qjZgKRCRf0l9uSzga5R9GNysQHUwj19SBqiLV_D-l4eC0OgyzXkFD8FS8O522oQMsp0UKWHr9bXjG3YdHQXrbc24OOdp0GXS4HW4YY69lK9H6uHhTbFJfmv4AeRIQWR', '2021-06-11 23:57:43', '2021-06-12 00:17:40');
INSERT INTO `userlogin` VALUES (27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjZmE4OGYwLWIzZjktMTFlYi1hYmIxLTZmMjc0YWU4ZDM3YyIsImVtYWlsIjoicmlkZXJAdGVzdC5jb20iLCJpYXQiOjE2MjQzNzE2NzIsImV4cCI6MTYzOTkyMzY3Mn0.Hw3N6uwyuDiU7SLkyuHLpJna8LxA-YlcN1IaYJRTs60', '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'android', NULL, '342323wewe23', '2021-06-22 14:21:12', '2021-06-22 14:21:12');
INSERT INTO `userlogin` VALUES (28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjZmE4OGYwLWIzZjktMTFlYi1hYmIxLTZmMjc0YWU4ZDM3YyIsImVtYWlsIjoicmlkZXJAdGVzdC5jb20iLCJpYXQiOjE2MjQzNzMzMTEsImV4cCI6MTYzOTkyNTMxMX0.K-A2861hYTU9xwLuqk-Cqza2z29DVtx9HaLaE2CP8Xw', '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'android', NULL, 'dFz7BOWFRJu6jbIjRgVORc:APA91bGzr8n5YO5L9bZV9gUTmbOBqbwYc6kPyW53DJ2K6tb4of0qofc1IY1XvcFq9I715UwW7ZXcLqw-SOLRoaP-aRt1I9ZE4KAcpbyfMLKL5RtJur2hovY_SVfty0yz1GintWJcMRv2', '2021-06-22 14:48:31', '2021-06-22 14:48:31');
INSERT INTO `userlogin` VALUES (30, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjZmE4OGYwLWIzZjktMTFlYi1hYmIxLTZmMjc0YWU4ZDM3YyIsImVtYWlsIjoicmlkZXJAdGVzdC5jb20iLCJpYXQiOjE2MjU1NTg0MjYsImV4cCI6MTY0MTExMDQyNn0.KOlm1a3cAEwRE7ruBnCGhd055h7faABKQ-WxAFozO4Q', '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'android', NULL, 'eCZeFo-xQ8-Qk6zwYoJWLh:APA91bFDRwzEICtp6r8vWjfPjmiksnko76lVrC7cboULSaw43PZkzRDKDD667tPOhE_EK40cRZH_u3NHANVJeN4p32UmbnszA4Rw5GWhFh5RhXbg4BhT7k4QoVRPb8eXp9e0hHwvkGKL', '2021-07-06 08:00:26', '2021-07-06 08:00:26');

-- ----------------------------
-- Table structure for userprofile
-- ----------------------------
DROP TABLE IF EXISTS `userprofile`;
CREATE TABLE `userprofile`  (
  `profileId` int NOT NULL AUTO_INCREMENT,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `firstName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lastName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lat` float NULL DEFAULT NULL,
  `lng` float NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `zipcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `preferredCurrency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'USD',
  `preferredLanguage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'en',
  `licenceFront` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `licenceBack` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `preferredPaymentMethod` tinyint(1) NULL DEFAULT 1,
  `paymentCustomerId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `paymentMethodId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cardLastFour` int NULL DEFAULT NULL,
  `cardToken` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sourceId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `walletBalance` float NULL DEFAULT 0,
  `walletUsed` float NULL DEFAULT 0,
  PRIMARY KEY (`profileId`) USING BTREE,
  UNIQUE INDEX `profileId`(`profileId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `UserProfile_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userprofile
-- ----------------------------
INSERT INTO `userprofile` VALUES (4, '8cfa88f0-b3f9-11eb-abb1-6f274ae8d37c', 'John', 'Doe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'USD', 'en', NULL, NULL, '2021-06-16 23:13:56', '2021-07-01 13:02:12', 2, 'cus_JgMLk12NGmxwU5', 'pm_1J5CqoBgfVkHvPrJEJjkT2jK', 4242, 'tok_1J5CqoBgfVkHvPrJiHLA7Mzc', NULL, 366, 0);
INSERT INTO `userprofile` VALUES (5, 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 'Jovan', 'Eare', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'USD', 'en', NULL, NULL, '2021-06-16 23:14:07', '2021-06-16 23:14:20', 1, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `userprofile` VALUES (6, '74264f50-c469-11eb-913d-d7e9d04f0e28', 'Best', 'Buddy', NULL, 45.428, -80.086, 'Verginia', 'New York', '12345', 'US', 'USD', 'en', NULL, NULL, '2021-06-03 12:44:36', '2021-06-28 15:50:36', 1, NULL, '0', NULL, NULL, NULL, 160, 0);
INSERT INTO `userprofile` VALUES (8, '2c8dc340-ca4e-11eb-a440-addeb05593b1', 'Best1', 'Buddy1', NULL, 45.428, -80.086, 'Verginia', 'New York', '12345', 'US', 'USD', 'en', NULL, NULL, '2021-06-11 00:44:26', '2021-06-11 00:44:26', 1, NULL, '0', NULL, NULL, NULL, 0, 0);
INSERT INTO `userprofile` VALUES (9, 'a984f2c0-ca57-11eb-a440-addeb05593b1', 'Brown', 'Brian', NULL, 37.422, -122.084, '', '', '', '', 'USD', 'en', NULL, NULL, '2021-06-11 01:52:22', '2021-06-11 01:52:22', 1, NULL, '0', NULL, NULL, NULL, 0, 0);
INSERT INTO `userprofile` VALUES (10, 'cfcaecf0-cb10-11eb-b3c9-59d16dc10d5c', 'John', 'Smith', NULL, 37.422, -122.084, '', '', '', '', 'USD', 'en', NULL, NULL, '2021-06-11 23:57:43', '2021-06-11 23:57:43', 1, NULL, '0', NULL, NULL, NULL, 0, 0);

-- ----------------------------
-- Table structure for userverifiedinfo
-- ----------------------------
DROP TABLE IF EXISTS `userverifiedinfo`;
CREATE TABLE `userverifiedinfo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isEmailConfirmed` tinyint(1) NULL DEFAULT 0,
  `isLicenseFrontVerified` tinyint(1) NULL DEFAULT 0,
  `isLicenseBackVerified` tinyint(1) NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `UserVerifiedInfo_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userverifiedinfo
-- ----------------------------
INSERT INTO `userverifiedinfo` VALUES (5, '74264f50-c469-11eb-913d-d7e9d04f0e28', 0, 0, 0, '2021-06-03 12:44:36', '2021-06-03 12:44:36');
INSERT INTO `userverifiedinfo` VALUES (7, '2c8dc340-ca4e-11eb-a440-addeb05593b1', 0, 0, 0, '2021-06-11 00:44:26', '2021-06-11 00:44:26');
INSERT INTO `userverifiedinfo` VALUES (8, 'a984f2c0-ca57-11eb-a440-addeb05593b1', 0, 0, 0, '2021-06-11 01:52:22', '2021-06-11 01:52:22');
INSERT INTO `userverifiedinfo` VALUES (9, 'cfcaecf0-cb10-11eb-b3c9-59d16dc10d5c', 0, 0, 0, '2021-06-11 23:57:43', '2021-06-11 23:57:43');

-- ----------------------------
-- Table structure for vehicles
-- ----------------------------
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `vehicleName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `vehicleNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `availableSeats` int NULL DEFAULT NULL,
  `vehicleType` int NULL DEFAULT NULL,
  `vehicleStatus` enum('pending','active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
  `vehicleRC` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `vehicleInsurance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `vehicleType`(`vehicleType`) USING BTREE,
  CONSTRAINT `Vehicles_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Vehicles_ibfk_2` FOREIGN KEY (`vehicleType`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vehicles
-- ----------------------------
INSERT INTO `vehicles` VALUES (2, 'a8717ad0-b3f9-11eb-abb1-6f274ae8d37c', 'good car', '23456', 11, 3, 'active', 'x', 'y', '0000-00-00 00:00:00', '2021-06-11 16:39:50');
INSERT INTO `vehicles` VALUES (4, 'cfcaecf0-cb10-11eb-b3c9-59d16dc10d5c', 'Audi', '345876', 0, 4, 'active', '', '', '2021-06-11 23:57:44', '2021-06-14 00:50:22');

-- ----------------------------
-- Table structure for vehiclestatus
-- ----------------------------
DROP TABLE IF EXISTS `vehiclestatus`;
CREATE TABLE `vehiclestatus`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `vehicle_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `running_distance` float NOT NULL,
  `running_hours` float NOT NULL,
  `breaks` float NOT NULL,
  `fuel` float NOT NULL,
  `battery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vehiclestatus
-- ----------------------------
INSERT INTO `vehiclestatus` VALUES (7, '1', 24321, 71, 72.1, 12, 'good', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for wallethistory
-- ----------------------------
DROP TABLE IF EXISTS `wallethistory`;
CREATE TABLE `wallethistory`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transactionId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cardLast4Digits` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `customerId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'USD',
  `paidBy` tinyint NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wallethistory
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

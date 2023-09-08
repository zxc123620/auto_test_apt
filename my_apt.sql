/*
 Navicat Premium Data Transfer

 Source Server         : zxc
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : my_apt

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 04/09/2023 20:36:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `group_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(0) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$600000$o9LlNjEoPh5tE0eTzTKIUP$2872Z6tK02ssKKbLfahWc5uoxCK4idE4H/Kuf3Kn0j0=', '2023-09-03 06:27:48.501153', 1, 'admin', '', '', '', 1, 1, '2023-08-23 13:49:39.176493');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(0) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (4, '2023-08-24 06:36:44.081254', '2', 'TbOperateItem object (2)', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (5, '2023-08-24 06:36:44.083216', '1', 'TbOperateItem object (1)', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (6, '2023-08-24 06:45:16.088662', '2', 'TbOperateItem object (2)', 2, '[{\"changed\": {\"fields\": [\"Page\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (9, '2023-08-24 06:54:44.623510', '2', 'TbOperateItem object (2)', 2, '[{\"deleted\": {\"name\": \"tb operate args\", \"object\": \"\"}}, {\"deleted\": {\"name\": \"tb operate args\", \"object\": \"\"}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (10, '2023-08-24 06:55:14.444167', '6', '测试项目', 2, '[{\"changed\": {\"name\": \"tb module\", \"object\": \"\", \"fields\": [\"\\u6a21\\u5757\\u540d\\u79f0\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (11, '2023-08-24 07:01:08.329386', '3', '测试模块2', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (12, '2023-08-24 07:01:08.331666', '2', '测试模块1', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (13, '2023-08-24 07:03:06.100797', '1', 'testPageName', 2, '[{\"changed\": {\"fields\": [\"\\u6240\\u5c5e\\u6a21\\u5757\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (14, '2023-08-24 07:23:24.198090', '8', 'TbPageService object (8)', 2, '[{\"changed\": {\"fields\": [\"\\u6240\\u5c5e\\u9875\\u9762\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (15, '2023-08-24 07:23:28.163725', '5', 'TbPageService object (5)', 2, '[{\"changed\": {\"fields\": [\"\\u6240\\u5c5e\\u9875\\u9762\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (16, '2023-08-24 07:23:31.594245', '4', 'TbPageService object (4)', 2, '[{\"changed\": {\"fields\": [\"\\u6240\\u5c5e\\u9875\\u9762\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (17, '2023-08-24 07:23:34.751407', '2', 'TbPageService object (2)', 2, '[{\"changed\": {\"fields\": [\"\\u6240\\u5c5e\\u9875\\u9762\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (18, '2023-08-24 07:23:40.002914', '3', 'TbPageService object (3)', 2, '[{\"changed\": {\"fields\": [\"\\u6240\\u5c5e\\u9875\\u9762\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (19, '2023-08-24 07:23:42.624037', '1', 'TbPageService object (1)', 2, '[{\"changed\": {\"fields\": [\"\\u6240\\u5c5e\\u9875\\u9762\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (20, '2023-08-24 07:23:47.262343', '8', 'TbPageService object (8)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (21, '2023-08-24 07:23:47.268939', '5', 'TbPageService object (5)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (22, '2023-08-24 07:23:47.270905', '4', 'TbPageService object (4)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (23, '2023-08-24 07:23:47.273914', '3', 'TbPageService object (3)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (24, '2023-08-24 07:23:47.275671', '2', 'TbPageService object (2)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (25, '2023-08-24 07:23:47.278717', '1', 'TbPageService object (1)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (26, '2023-08-24 07:27:05.305301', '8', 'TbPageService object (8)', 2, '[{\"deleted\": {\"name\": \"tb service args\", \"object\": \"TbServiceArgs object (None)\"}}, {\"deleted\": {\"name\": \"tb service args\", \"object\": \"TbServiceArgs object (None)\"}}, {\"deleted\": {\"name\": \"tb service args\", \"object\": \"TbServiceArgs object (None)\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (29, '2023-08-24 12:32:04.127787', '8', 'TbPageService object (8)', 2, '[{\"added\": {\"name\": \"tb operate item\", \"object\": \"click\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (30, '2023-08-24 12:32:39.486531', '5', 'TbPageService object (5)', 2, '[{\"added\": {\"name\": \"tb operate item\", \"object\": \"TbOperateItem object (4)\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (31, '2023-08-24 12:36:30.648415', '1', 'TbPageService object (1)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (32, '2023-08-24 12:36:35.794092', '2', 'TbPageService object (2)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (33, '2023-08-24 12:36:39.032983', '3', 'TbPageService object (3)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (34, '2023-08-24 12:36:41.538553', '4', 'TbPageService object (4)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (35, '2023-08-24 12:36:44.341480', '5', 'TbPageService object (5)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (36, '2023-08-24 12:36:59.146591', '8', 'TbPageService object (8)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (37, '2023-08-24 12:37:19.109849', '9', 'TbPageService object (9)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (38, '2023-08-24 12:40:09.311705', '9', 'TbPageService object (9)', 2, '[{\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (39, '2023-08-24 12:55:24.222669', '9', 'TbPageService object (9)', 2, '[{\"added\": {\"name\": \"tb service operate args\", \"object\": \"TbServiceOperateArgs object (5)\"}}, {\"added\": {\"name\": \"tb service operate args\", \"object\": \"TbServiceOperateArgs object (6)\"}}, {\"added\": {\"name\": \"tb service operate args\", \"object\": \"TbServiceOperateArgs object (7)\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (40, '2023-08-24 13:52:32.247837', '9', 'TbPageService object (9)', 2, '[{\"added\": {\"name\": \"tb service args\", \"object\": \"TbServiceArgs object (10)\"}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"TbServiceArgs object (11)\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (41, '2023-08-28 11:58:16.231285', '9', 'TbPageService object (9)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (42, '2023-08-28 12:01:09.777042', '10', 'TbPageService object (10)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb service operate args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb service operate args\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (43, '2023-08-28 12:05:57.026562', '10', 'TbPageService object (10)', 2, '[{\"changed\": {\"name\": \"tb service operate args\", \"object\": \"\", \"fields\": [\"\\u53c2\\u6570\\u540d\"]}}, {\"changed\": {\"name\": \"tb service operate args\", \"object\": \"\", \"fields\": [\"\\u53c2\\u6570\\u540d\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (44, '2023-08-28 12:06:35.563485', '10', 'TbPageService object (10)', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (45, '2023-08-28 12:06:57.014859', '10', 'TbPageService object (10)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (46, '2023-08-28 12:07:14.968041', '11', 'TbPageService object (11)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb service operate args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb service operate args\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (47, '2023-08-28 12:08:13.769479', '11', 'TbPageService object (11)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (48, '2023-08-28 12:08:30.532155', '12', 'TbPageService object (12)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb service operate args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb service operate args\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (49, '2023-08-28 12:10:44.419540', '12', 'TbPageService object (12)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (50, '2023-08-28 12:10:59.681296', '13', 'TbPageService object (13)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb service operate args\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (51, '2023-08-28 12:12:38.887314', '13', 'TbPageService object (13)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (52, '2023-08-28 12:12:54.385717', '14', 'TbPageService object (14)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb service operate args\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (53, '2023-08-28 12:13:45.912519', '14', 'TbPageService object (14)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (54, '2023-08-28 12:14:01.419456', '15', 'TbPageService object (15)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb service operate args\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (55, '2023-08-28 12:18:01.607776', '15', 'TbPageService object (15)', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (56, '2023-08-28 12:18:13.771409', '15', 'TbPageService object (15)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (57, '2023-08-28 12:22:03.584566', '16', 'TbPageService object (16)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb service operate args\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (58, '2023-08-28 12:41:40.423868', '16', 'TbPageService object (16)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (59, '2023-08-28 12:42:08.025049', '17', 'TbPageService object (17)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (60, '2023-08-28 12:49:19.991398', '17', 'TbPageService object (17)', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (61, '2023-08-28 13:00:46.535871', '17', 'TbPageService object (17)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (62, '2023-08-28 13:10:09.385079', '18', 'TbPageService object (18)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (63, '2023-08-28 13:11:05.060415', '19', 'TbPageService object (19)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (64, '2023-08-28 13:11:33.390117', '19', 'TbPageService object (19)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (65, '2023-08-28 13:11:33.394110', '18', 'TbPageService object (18)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (66, '2023-08-28 13:12:42.323414', '20', 'TbPageService object (20)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (67, '2023-08-28 13:13:07.557504', '20', 'TbPageService object (20)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (68, '2023-08-28 13:17:06.221686', '21', 'TbPageService object (21)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (69, '2023-08-28 13:17:56.698424', '21', 'TbPageService object (21)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (70, '2023-08-28 13:18:04.108601', '22', 'TbPageService object (22)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (71, '2023-08-28 13:19:51.816606', '22', 'TbPageService object (22)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (72, '2023-08-28 13:20:00.258622', '23', 'TbPageService object (23)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (73, '2023-08-28 13:20:15.703879', '23', 'TbPageService object (23)', 2, '[{\"added\": {\"name\": \"tb service operate args\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (74, '2023-08-28 13:20:57.393931', '23', 'TbPageService object (23)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (75, '2023-08-28 13:21:21.690210', '24', 'TbPageService object (24)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (76, '2023-08-28 13:24:26.022434', '24', 'TbPageService object (24)', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (77, '2023-08-28 13:24:50.495381', '24', 'TbPageService object (24)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (78, '2023-08-28 13:24:58.018852', '25', 'TbPageService object (25)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (79, '2023-08-28 13:25:42.235366', '25', 'TbPageService object (25)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (80, '2023-08-28 13:26:17.236828', '26', 'TbPageService object (26)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (81, '2023-08-28 13:26:24.930884', '26', 'TbPageService object (26)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (82, '2023-08-28 13:29:04.800942', '27', 'TbPageService object (27)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (83, '2023-08-28 13:29:30.070963', '27', 'TbPageService object (27)', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (84, '2023-08-28 13:30:05.053627', '27', 'TbPageService object (27)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (85, '2023-08-28 13:30:47.539641', '28', 'TbPageService object (28)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (86, '2023-08-28 13:31:28.426194', '28', 'TbPageService object (28)', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (87, '2023-08-28 13:31:33.369350', '28', 'TbPageService object (28)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (88, '2023-08-28 13:31:54.838949', '29', 'TbPageService object (29)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (89, '2023-08-28 13:33:51.719263', '29', 'TbPageService object (29)', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (90, '2023-08-28 13:34:13.783901', '29', 'TbPageService object (29)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (91, '2023-08-28 13:35:28.589809', '30', 'TbPageService object (30)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (92, '2023-08-28 13:35:45.233568', '30', 'TbPageService object (30)', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (93, '2023-08-28 13:36:04.818205', '30', 'TbPageService object (30)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (94, '2023-08-28 13:48:25.476110', '31', 'TbPageService object (31)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (95, '2023-08-28 13:49:08.335853', '31', 'TbPageService object (31)', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (96, '2023-08-28 13:53:58.507985', '1', 'testPageName', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (97, '2023-08-28 13:54:33.108315', '2', '登录页面', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (98, '2023-08-28 13:56:04.614539', '2', '登录页面', 2, '[{\"added\": {\"name\": \"tb element\", \"object\": \"\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (99, '2023-08-29 13:05:10.312919', '31', 'TbPageService object (31)', 2, '[{\"changed\": {\"name\": \"tb service operate args\", \"object\": \"\", \"fields\": [\"\\u53c2\\u6570\\u503c\"]}}, {\"changed\": {\"name\": \"tb service operate args\", \"object\": \"\", \"fields\": [\"\\u53c2\\u6570\\u503c\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (100, '2023-08-29 13:05:18.854520', '31', 'TbPageService object (31)', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (101, '2023-08-29 13:07:29.205808', '31', 'TbPageService object (31)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (102, '2023-08-29 13:07:39.882478', '32', 'TbPageService object (32)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (103, '2023-08-29 13:07:42.420300', '32', 'TbPageService object (32)', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (104, '2023-08-29 13:08:34.871677', '32', 'TbPageService object (32)', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (105, '2023-08-29 13:09:14.039221', '32', 'TbPageService object (32)', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (106, '2023-08-29 13:09:41.678287', '32', 'TbPageService object (32)', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (107, '2023-08-29 13:10:53.933485', '32', 'TbPageService object (32)', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (108, '2023-08-29 13:10:59.876958', '32', 'TbPageService object (32)', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (109, '2023-08-29 13:11:03.251795', '32', 'TbPageService object (32)', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (110, '2023-08-29 13:35:44.057744', '8', 'TbPageFunction object (8)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (111, '2023-08-29 13:36:20.572396', '3', '测试模块2', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (112, '2023-08-29 13:36:20.575639', '2', '测试模块1', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (113, '2023-08-29 13:36:26.709253', '4', '登录模块', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (114, '2023-08-29 13:36:51.229038', '2', '登录页面', 2, '[{\"changed\": {\"fields\": [\"\\u6240\\u5c5e\\u6a21\\u5757\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (115, '2023-08-29 13:37:15.006777', '9', 'TbPageFunction object (9)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (116, '2023-08-29 13:42:28.633952', '33', '注册操作', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb service args\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (117, '2023-08-29 13:42:31.765652', '33', '注册操作', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (118, '2023-08-29 13:44:55.866532', '10', 'TbTestCases object (10)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb case service\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb case service\", \"object\": \"\"}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (119, '2023-08-29 13:45:06.561603', '10', 'TbTestCases object (10)', 2, '[{\"added\": {\"name\": \"tb case service\", \"object\": \"\"}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (120, '2023-08-29 13:49:10.527763', '34', '测试操作', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (121, '2023-08-29 13:49:23.875156', '34', '测试操作', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (122, '2023-08-29 13:49:54.329380', '34', '测试操作', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (123, '2023-08-29 13:50:00.302348', '35', '测试操作', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb operate item\", \"object\": \"\"}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (124, '2023-08-29 13:50:03.563126', '35', '测试操作', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (125, '2023-08-30 12:40:28.330486', '10', 'TbTestCases object (10)', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (126, '2023-08-30 12:57:23.688140', '11', 'TbTestCases object (11)', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"tb case service\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb case service\", \"object\": \"\"}}, {\"added\": {\"name\": \"tb case service\", \"object\": \"\"}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (127, '2023-08-30 12:57:35.667221', '11', 'TbTestCases object (11)', 2, '[]', 13, 1);
INSERT INTO `django_admin_log` VALUES (128, '2023-08-30 13:02:11.814158', '11', 'TbTestCases object (11)', 2, '[]', 13, 1);
INSERT INTO `django_admin_log` VALUES (129, '2023-08-30 13:02:20.271428', '11', 'TbTestCases object (11)', 2, '[]', 13, 1);
INSERT INTO `django_admin_log` VALUES (130, '2023-08-30 13:24:25.025663', '1', 'TbTask object (1)', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (131, '2023-08-30 13:24:38.500903', '1', 'TbTask object (1)', 2, '[{\"changed\": {\"fields\": [\"\\u4efb\\u52a1\\u63cf\\u8ff0\"]}}]', 14, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (10, 'basic_data', 'tbmodule');
INSERT INTO `django_content_type` VALUES (9, 'basic_data', 'tboperateitem');
INSERT INTO `django_content_type` VALUES (8, 'basic_data', 'tbpage');
INSERT INTO `django_content_type` VALUES (11, 'basic_data', 'tbpageservice');
INSERT INTO `django_content_type` VALUES (7, 'basic_data', 'tbproject');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (12, 'test_execute', 'tbpagefunction');
INSERT INTO `django_content_type` VALUES (14, 'test_execute', 'tbtask');
INSERT INTO `django_content_type` VALUES (13, 'test_execute', 'tbtestcases');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2023-07-16 08:33:34.278524');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2023-07-16 08:33:34.844422');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2023-07-16 08:33:34.964884');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2023-07-16 08:33:34.972888');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2023-07-16 08:33:34.979303');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2023-07-16 08:33:35.080100');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2023-07-16 08:33:35.130264');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2023-07-16 08:33:35.185341');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2023-07-16 08:33:35.192271');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2023-07-16 08:33:35.240405');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2023-07-16 08:33:35.243312');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2023-07-16 08:33:35.251320');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2023-07-16 08:33:35.305169');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2023-07-16 08:33:35.358939');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2023-07-16 08:33:35.411363');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2023-07-16 08:33:35.417857');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2023-07-16 08:33:35.470589');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2023-07-16 08:33:35.506510');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('4fdxclj97g4b2u63eyf33tncopcofir6', '.eJzFkk9vgkAQxb8K2bPKIgKut5omPfXoqRgzu7PqWljMLlxq_O5l1CaV1j9pm_Q0ZN6Px7wZdmwBTb1eNF67hUE2YRHrfe5JUK_akoAbsKtqoCpbOyMHhAxOqh88V6iL6Yk9M1iDX7dvZ_E4xjRKE5XyCCXHSAmeiSSRgmM61FrCUooEYhwnEhXyKJUQc4GCQzYUgkxLbRvfer3scmah1DmbBDl7aD-lbW0U1KayAVgMqFU583bo5KzXUkbRE_FL8MES-n5tdIF9KOojUFICT8i5_ZOrmq2_YEIJfV9Vq6PeuOIoh4ClsSFtIVyRQXgEAHF2mWnVEyedBlSuKeU3E_1B4H0v-FHI_ZwIbZCAiPNh12hG7Fcf9-FzZU8k31jTAfm_Ld0O191P3G1EXc8peKMWj1DDBWNlnCr09X80zxsxzkRbslRrKhIiKiOe3mHbPYc8zITtTGEtt67aaFVfvsy39J1Hujt9d22_SNw9SdJtjPZztn8HmoqiOA:1qYoM5:25NG-qmVeDVWfumRSyngqe3RTlMUbeob0lCB6WRhX48', '2023-09-06 13:57:05.790478');
INSERT INTO `django_session` VALUES ('831zk69opg17pmi04kz42dmlzpd6crx2', '.eJzFkk9vgkAQxb8K2bPKIgKut5omPfXoqRgzu7PqWljMLlxq_O5l1CaV1j9pm_Q0ZN6Px7wZdmwBTb1eNF67hUE2YRHrfe5JUK_akoAbsKtqoCpbOyMHhAxOqh88V6iL6Yk9M1iDX7dvZ_E4xjRKE5XyCCXHSAmeiSSRgmM61FrCUooEYhwnEhXyKJUQc4GCQzYUgkxLbRvfer3scmah1DmbBDl7aD-lbW0U1KayAVgMqFU583bo5KzXUkbRE_FL8MES-n5tdIF9KOojUFICT8i5_ZOrmq2_YEIJfV9Vq6PeuOIoh4ClsSFtIVyRQXgEAHF2mWnVEyedBlSuKeU3E_1B4H0v-FHI_ZwIbZCAiPNh12hG7Fcf9-FzZU8k31jTAfm_Ld0O191P3G1EXc8peKMWj1DDBWNlnCr09X80zxsxzkRbslRrKhIiKiOe3mHbPYc8zITtTGEtt67aaFVfvsy39J1Hujt9d22_SNw9SdJtjPZztn8HmoqiOA:1qYoIB:dQKb0sPIwp8D2XsTB0HCPOHOssDWf1w-VWsq8RHa3FA', '2023-09-06 13:53:03.523064');
INSERT INTO `django_session` VALUES ('g49k84x1459sorvlkdxhlg1pzcere05x', '.eJzNlktvozAQx79KxDkP8_Crx973uKelisb2kNASqDCsVqry3RcTtA9KEkKRktMIz8zfnt8Y2x_eFupqv60tltvUeE-e7y3_HVOg3zB3DvMK-a5Y6yKvylStXci689r1t8Jg9tzF_iewB7tvsnkoQsN8RjUjvlHE-FoSLilVkhgWICpIlKQQGkGV0Yb4TEFIpJEEeCClEz1gXttG68dH7OVwwNh7WsReHNeUJ9AYLiLSGEZ5a0KGblCB70xEWOwtm_i0qeCUmUC5SGCl01JneHIeXB3WuT9NEqHvJqHBSe8m2brMTr4NmEOabxTYVG8NVLCp1DvssCH1M9W4OYWDMd_HZjSxXZYqEYwu64MaLmAeSsflYi4yxxfnxtQ4r09IMKDNIPDbtVM-L_Wm03U2FngX_ACsp_Losw4HtKXg1BnOgvl3-A1b-xE4T2XR5xwNa0unxvD2A-oy57J4RV2NRd1FPwbtSUT6tGl_wB_6hUykGiOUoXPeDzSQiZMliflyVyu01RZ_oa4r7H6KpM51lRb5-eZeShrf46l0BkBPJdJvIr_aRBYwdxwKEemv067Avo2m3Abfhe5UAn26YkCb00C4iz0Rau697D41WLTjEf_JuAvnqSz6nGV_gA1MJhRErdHtLR8J3Z6wwq2A8Sj8PKd1c9p9iplZQVZdPaa6clgQ8jMFuGf7cCvdq37j3Od79zdkfLNmKPp8364W2muLP3RlcNTRmVU4EbvSxe4Csl1Z1O9XmJ1i7g5tVKF9ZEF_gBxfvONvDPSASg:1qbLlG:r0Vh9dXcsk1FVASuuvJY0FIvHe7i6J86Pu6-6WAr_5c', '2023-09-13 14:01:34.591448');
INSERT INTO `django_session` VALUES ('h51b1jqa5xio6qe3i6jphojlcnw0stfy', '.eJzNlktvozAQx79KxDkP8_Crx973uKelisb2kNASqDCsVqry3RcTtA9KEkKRktMIz8zfnt8Y2x_eFupqv60tltvUeE-e7y3_HVOg3zB3DvMK-a5Y6yKvylStXci689r1t8Jg9tzF_iewB7tvsnkoQsN8RjUjvlHE-FoSLilVkhgWICpIlKQQGkGV0Yb4TEFIpJEEeCClEz1gXttG68dH7OVwwNh7WsReHNeUJ9AYLiLSGEZ5a0KGblCB70xEWOwtm_i0qeCUmUC5SGCl01JneHIeXB3WuT9NEqHvJqHBSe8m2brMTr4NmEOabxTYVG8NVLCp1DvssCH1M9W4OYWDMd_HZjSxXZYqEYwu64MaLmAeSsflYi4yxxfnxtQ4r09IMKDNIPDbtVM-L_Wm03U2FngX_ACsp_Losw4HtKXg1BnOgvl3-A1b-xE4T2XR5xwNa0unxvD2A-oy57J4RV2NRd1FPwbtSUT6tGl_wB_6hUykGiOUoXPeDzSQiZMliflyVyu01RZ_oa4r7H6KpM51lRb5-eZeShrf46l0BkBPJdJvIr_aRBYwdxwKEemv067Avo2m3Abfhe5UAn26YkCb00C4iz0Rau697D41WLTjEf_JuAvnqSz6nGV_gA1MJhRErdHtLR8J3Z6wwq2A8Sj8PKd1c9p9iplZQVZdPaa6clgQ8jMFuGf7cCvdq37j3Od79zdkfLNmKPp8364W2muLP3RlcNTRmVU4EbvSxe4Csl1Z1O9XmJ1i7g5tVKF9ZEF_gBxfvONvDPSASg:1qciGl:KuYmOTovKrJLVFLfbvU3cL2b-zS5tGtASZDZIv4A0JQ', '2023-09-17 08:15:43.888589');
INSERT INTO `django_session` VALUES ('i1z98bt1rc1iwz22mup94pzs0m79oawh', '.eJzFkk9vgkAQxb8K2bPKIgKut5omPfXoqRgzu7PqWljMLlxq_O5l1CaV1j9pm_Q0ZN6Px7wZdmwBTb1eNF67hUE2YRHrfe5JUK_akoAbsKtqoCpbOyMHhAxOqh88V6iL6Yk9M1iDX7dvZ_E4xjRKE5XyCCXHSAmeiSSRgmM61FrCUooEYhwnEhXyKJUQc4GCQzYUgkxLbRvfer3scmah1DmbBDl7aD-lbW0U1KayAVgMqFU583bo5KzXUkbRE_FL8MES-n5tdIF9KOojUFICT8i5_ZOrmq2_YEIJfV9Vq6PeuOIoh4ClsSFtIVyRQXgEAHF2mWnVEyedBlSuKeU3E_1B4H0v-FHI_ZwIbZCAiPNh12hG7Fcf9-FzZU8k31jTAfm_Ld0O191P3G1EXc8peKMWj1DDBWNlnCr09X80zxsxzkRbslRrKhIiKiOe3mHbPYc8zITtTGEtt67aaFVfvsy39J1Hujt9d22_SNw9SdJtjPZztn8HmoqiOA:1qYoRK:XyxnwVWE-lVHarrbIAITMlvlaHbxlm6uI0-GlfByj4c', '2023-09-06 14:02:30.205554');
INSERT INTO `django_session` VALUES ('pdi0nlorozpyy92t7ovseo4hgv1ufnm1', '.eJzFkk9vgkAQxb8K2bPKIgKut5omPfXoqRgzu7PqWljMLlxq_O5l1CaV1j9pm_Q0ZN6Px7wZdmwBTb1eNF67hUE2YRHrfe5JUK_akoAbsKtqoCpbOyMHhAxOqh88V6iL6Yk9M1iDX7dvZ_E4xjRKE5XyCCXHSAmeiSSRgmM61FrCUooEYhwnEhXyKJUQc4GCQzYUgkxLbRvfer3scmah1DmbBDl7aD-lbW0U1KayAVgMqFU583bo5KzXUkbRE_FL8MES-n5tdIF9KOojUFICT8i5_ZOrmq2_YEIJfV9Vq6PeuOIoh4ClsSFtIVyRQXgEAHF2mWnVEyedBlSuKeU3E_1B4H0v-FHI_ZwIbZCAiPNh12hG7Fcf9-FzZU8k31jTAfm_Ld0O191P3G1EXc8peKMWj1DDBWNlnCr09X80zxsxzkRbslRrKhIiKiOe3mHbPYc8zITtTGEtt67aaFVfvsy39J1Hujt9d22_SNw9SdJtjPZztn8HmoqiOA:1qYoKF:l8qOpMtMtVwjfp0AkHLJcM5vRdf14UnTXB2He20iLik', '2023-09-06 13:55:11.968509');
INSERT INTO `django_session` VALUES ('wf7xq0nccf5h10o1f5ubfc35adxyzr8x', '.eJzNlU2PmzAQhv9K5HMSbMA23mPvPfZUVtHYniTe8rHio5dV_nsxILVlyS6JkDankTyv3_E8Y_AbOUDbnA9tjdXBWfJEGNn-u6bB_MLCJ-wLFKdyb8qiqZzee8l-zNb776XF7Nuo_c_gDPW52y2jJLKCCW4EZVZTy4yiUnGuFbUiRNRw1IpDZBOurbGUCQ0RVVZRkKFS3jTHoq07r59vKSkgx5Q8bVKSpi2XR-iCTGLaBcFlHyKBflED8yGmIiXbTu-6DoadR6g2R9gZV5kMh2Tu-6h9-l2RGJkvwsPB7ybbtsqGXAA2d0WgoXbmYKGBoNGvcMKO1G9nMBjkYO2PpTs67bhLVwjWVG2u5xtYh9Jlu1mLzOXZp9FZn2WUhjPeAkLWn53Ldal3k26zpcBH8QOwvpfHlHU0460SyX2QIlz_ht9wtR-B870sppzjeW_l3QTe_oP6mHNVvqBplqIe1Y9B-y4iU9p8usBmiiUa4j6Y_kuKE9N3kSQ-yDh6X7P2Neuzw8zuIGs-fSokD3uzMJJXGvBP4_xA_csZ-PT1Kf6VLB_dCk3PoFza6HQscs4LTXzlFN6k3pny9AGyU1W2r58wGzRfDm1Ro1NkyXRBXJ7J5Q_3JAnF:1qZ4Sn:WblKBQTac0D8k8T4yYTNmbrOkkPrpkAJAj32Vzwir9I', '2023-09-07 07:09:05.921882');
INSERT INTO `django_session` VALUES ('zyijyh7lrp3tc0te8sar773fdvtgrhrt', '.eJzNlU2PmzAQhv9K5HMSbMA23mPvPfZUVtHYniTe8rHio5dV_nsxILVlyS6JkDankTyv3_E8Y_AbOUDbnA9tjdXBWfJEGNn-u6bB_MLCJ-wLFKdyb8qiqZzee8l-zNb776XF7Nuo_c_gDPW52y2jJLKCCW4EZVZTy4yiUnGuFbUiRNRw1IpDZBOurbGUCQ0RVVZRkKFS3jTHoq07r59vKSkgx5Q8bVKSpi2XR-iCTGLaBcFlHyKBflED8yGmIiXbTu-6DoadR6g2R9gZV5kMh2Tu-6h9-l2RGJkvwsPB7ybbtsqGXAA2d0WgoXbmYKGBoNGvcMKO1G9nMBjkYO2PpTs67bhLVwjWVG2u5xtYh9Jlu1mLzOXZp9FZn2WUhjPeAkLWn53Ldal3k26zpcBH8QOwvpfHlHU0460SyX2QIlz_ht9wtR-B870sppzjeW_l3QTe_oP6mHNVvqBplqIe1Y9B-y4iU9p8usBmiiUa4j6Y_kuKE9N3kSQ-yDh6X7P2Neuzw8zuIGs-fSokD3uzMJJXGvBP4_xA_csZ-PT1Kf6VLB_dCk3PoFza6HQscs4LTXzlFN6k3pny9AGyU1W2r58wGzRfDm1Ro1NkyXRBXJ7J5Q_3JAnF:1qZ4Sx:gElzOSbkPQKIQGvqEtJxcOa9u8PqTXBOGBNfVWhFMZU', '2023-09-07 07:09:15.559056');

-- ----------------------------
-- Table structure for t_pub_data_option
-- ----------------------------
DROP TABLE IF EXISTS `t_pub_data_option`;
CREATE TABLE `t_pub_data_option`  (
  `optionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键ID',
  `dictionaryKey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '数据字典KEY值',
  `optionKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '选项KEY',
  `optionValue` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '选项显示值',
  `optionOrder` int(0) NULL DEFAULT 1 COMMENT '选项顺序',
  `optionDesc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '描述',
  `optionFlag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '状态（0：不可用 1：可用）',
  `optionDisabled` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '选项是否禁用（前端页面禁用扩展）',
  `optionEXT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展字段，用于扩展字典属性',
  PRIMARY KEY (`optionId`) USING BTREE,
  UNIQUE INDEX `UK_PUB_DATA_OPTION`(`dictionaryKey`, `optionKey`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据字典选项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pub_data_option
-- ----------------------------
INSERT INTO `t_pub_data_option` VALUES ('PIMS.POSITION_0', 'PIMS.POSITION', '0', '上行', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PIMS.POSITION_1', 'PIMS.POSITION', '1', '下行', 2, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PIMS.POSITION_2', 'PIMS.POSITION', '2', '双线', 3, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.BOOLEAN_0', 'PUB.BOOLEAN', 'true', '是（true）', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.BOOLEAN_1', 'PUB.BOOLEAN', 'false', '否（false）', 2, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.FILESUFFIX_1', 'PUB.FILESUFFIX', '1', 'tar.gz', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.FLAG_0', 'PUB.FLAG', '0', '停用', 2, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.FLAG_1', 'PUB.FLAG', '1', '启用', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.LINETYPE_1', 'PUB.LINETYPE', '1', '地铁线', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.LINETYPE_2', 'PUB.LINETYPE', '2', '高铁线', 2, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.LOGINSTATUS_0', 'PUB.LOGINSTATUS', '0', '登录错误', 0, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.LOGINSTATUS_1', 'PUB.LOGINSTATUS', '1', '正常登录', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.LOGINSTATUS_2', 'PUB.LOGINSTATUS', '2', '正常退出', 2, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.LOGINSTATUS_3', 'PUB.LOGINSTATUS', '3', '连接中断', 3, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.LOGINSTATUS_4', 'PUB.LOGINSTATUS', '4', '异常退出', 4, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.LOGTYPE_1', 'PUB.LOGTYPE', '1', '登录日志', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.LOGTYPE_2', 'PUB.LOGTYPE', '2', '操作日志', 2, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.MENUTYPE_1', 'PUB.MENUTYPE', '1', '菜单', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.MENUTYPE_2', 'PUB.MENUTYPE', '2', '按钮', 2, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.OPERATETYPE_1', 'PUB.OPERATETYPE', '1', '查询', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.OPERATETYPE_2', 'PUB.OPERATETYPE', '2', '添加', 2, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.OPERATETYPE_3', 'PUB.OPERATETYPE', '3', '修改', 3, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.OPERATETYPE_4', 'PUB.OPERATETYPE', '4', '删除', 4, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.OPERATETYPE_5', 'PUB.OPERATETYPE', '5', '导入', 5, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.OPERATETYPE_6', 'PUB.OPERATETYPE', '6', '导出', 6, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.PARAMTYPE_1', 'PUB.PARAMTYPE', 'select', '下拉选择', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.PARAMTYPE_2', 'PUB.PARAMTYPE', 'text', '输入', 2, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.PARAMTYPE_3', 'PUB.PARAMTYPE', 'radio', '单选', 3, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.ROLEPERMISSION_1', 'PUB.ROLEPERMISSION', 'user', '普通用户', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.ROLEPERMISSION_2', 'PUB.ROLEPERMISSION', 'admin', '管理员', 2, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.ROLESCOPE_0', 'PUB.ROLESCOPE', '0', '全部', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.SCOPETYPE_1', 'PUB.SCOPETYPE', 'LIDAR', '激光雷达 (三维)', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.SCOPETYPE_2', 'PUB.SCOPETYPE', 'AI', 'AI 智能视频', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.SCOPETYPE_3', 'PUB.SCOPETYPE', 'RADAR', '毫米波雷达', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.SCOPETYPE_4', 'PUB.SCOPETYPE', 'LIGHT', '振动光纤', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.STATIONTYPE_1', 'PUB.STATIONTYPE', '1', '线路监测', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.STATIONTYPE_2', 'PUB.STATIONTYPE', '2', '周界入侵', 2, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.STATUS_1', 'PUB.STATUS', '1', '正常', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.STATUS_2', 'PUB.STATUS', '2', '故障', 2, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.TRIGGERSTATE_1', 'PUB.TRIGGERSTATE', 'WAITING', '等待执行', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.TRIGGERSTATE_2', 'PUB.TRIGGERSTATE', 'ACQUIRED', '正常执行', 2, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.TRIGGERSTATE_3', 'PUB.TRIGGERSTATE', 'EXECUTING', '执行中', 3, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.TRIGGERSTATE_4', 'PUB.TRIGGERSTATE', 'COMPLETE', '执行完成', 4, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.TRIGGERSTATE_5', 'PUB.TRIGGERSTATE', 'BLOCKED', '阻塞', 5, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.TRIGGERSTATE_6', 'PUB.TRIGGERSTATE', 'ERROR', '错误', 6, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.TRIGGERSTATE_7', 'PUB.TRIGGERSTATE', 'PAUSED', '暂停', 7, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.UNIT_1', 'PUB.UNIT', '1', '公里（km）', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.UNIT_2', 'PUB.UNIT', '2', '米（m）', 2, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.UPDOWN_0', 'PUB.UPDOWN', '0', '上行', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.UPDOWN_1', 'PUB.UPDOWN', '1', '下行', 2, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.UPDOWN_2', 'PUB.UPDOWN', '2', '双线', 3, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.USERPASSWORDPOLICY_0', 'PUB.USERPASSWORDPOLICY', '0', '永不过期', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.USERPASSWORDPOLICY_1', 'PUB.USERPASSWORDPOLICY', '1', '1个月过期', 2, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.USERPASSWORDPOLICY_2', 'PUB.USERPASSWORDPOLICY', '3', '3个月过期', 3, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.USERPASSWORDPOLICY_3', 'PUB.USERPASSWORDPOLICY', '6', '6个月过期', 4, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.USERSEX_1', 'PUB.USERSEX', '1', '男', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.USERSEX_2', 'PUB.USERSEX', '2', '女', 2, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.VERSIONTYPE_1', 'PUB.VERSIONTYPE', '1', '道岔CS客户端', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.VERSIONTYPE_2', 'PUB.VERSIONTYPE', '2', '道岔主机端', 2, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.YESNO_0', 'PUB.YESNO', '0', '否（0）', 1, '', '1', '0', '');
INSERT INTO `t_pub_data_option` VALUES ('PUB.YESNO_1', 'PUB.YESNO', '1', '是（1）', 2, '', '1', '0', '');

-- ----------------------------
-- Table structure for tb_assert_operation
-- ----------------------------
DROP TABLE IF EXISTS `tb_assert_operation`;
CREATE TABLE `tb_assert_operation`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `operate_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_assert_operation
-- ----------------------------

-- ----------------------------
-- Table structure for tb_case_service
-- ----------------------------
DROP TABLE IF EXISTS `tb_case_service`;
CREATE TABLE `tb_case_service`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `service_id` bigint(0) NULL DEFAULT NULL,
  `case_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `case_id`(`case_id`) USING BTREE,
  INDEX `service_id`(`service_id`) USING BTREE,
  CONSTRAINT `tb_case_service_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `tb_test_cases` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tb_case_service_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `tb_page_service` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_case_service
-- ----------------------------
INSERT INTO `tb_case_service` VALUES (4, 32, 11);
INSERT INTO `tb_case_service` VALUES (5, 33, 11);
INSERT INTO `tb_case_service` VALUES (6, 35, 11);

-- ----------------------------
-- Table structure for tb_case_service_args
-- ----------------------------
DROP TABLE IF EXISTS `tb_case_service_args`;
CREATE TABLE `tb_case_service_args`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `case_service_id` int(0) NULL DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `case_service_id`(`case_service_id`) USING BTREE,
  CONSTRAINT `tb_case_service_args_ibfk_1` FOREIGN KEY (`case_service_id`) REFERENCES `tb_case_service` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_case_service_args
-- ----------------------------
INSERT INTO `tb_case_service_args` VALUES (1, 4, 'username', NULL, NULL);
INSERT INTO `tb_case_service_args` VALUES (2, 5, 'username', NULL, NULL);
INSERT INTO `tb_case_service_args` VALUES (3, 5, 'password', NULL, NULL);

-- ----------------------------
-- Table structure for tb_cases_page_services
-- ----------------------------
DROP TABLE IF EXISTS `tb_cases_page_services`;
CREATE TABLE `tb_cases_page_services`  (
  `case_id` bigint(0) NULL DEFAULT NULL,
  `page_service_id` bigint(0) NULL DEFAULT NULL,
  `service_args` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `case_id`(`case_id`) USING BTREE,
  INDEX `page_service_id`(`page_service_id`) USING BTREE,
  CONSTRAINT `tb_cases_page_services_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `tb_test_cases` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_cases_page_services_ibfk_2` FOREIGN KEY (`page_service_id`) REFERENCES `tb_page_service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_cases_page_services
-- ----------------------------

-- ----------------------------
-- Table structure for tb_element
-- ----------------------------
DROP TABLE IF EXISTS `tb_element`;
CREATE TABLE `tb_element`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `element_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `locatestyle` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `locate_value` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `page_id` bigint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `locatestyle_id`(`locatestyle`) USING BTREE,
  INDEX `page_id`(`page_id`) USING BTREE,
  CONSTRAINT `tb_element_ibfk_2` FOREIGN KEY (`page_id`) REFERENCES `tb_page` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_element
-- ----------------------------
INSERT INTO `tb_element` VALUES (1, 'aaa', 'class name', '112312', 2);

-- ----------------------------
-- Table structure for tb_expect_operate_assert
-- ----------------------------
DROP TABLE IF EXISTS `tb_expect_operate_assert`;
CREATE TABLE `tb_expect_operate_assert`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `assert_operate_id` int(0) NULL DEFAULT NULL,
  `operate_item_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `assert_operate_id`(`assert_operate_id`) USING BTREE,
  INDEX `operate_item_id`(`operate_item_id`) USING BTREE,
  CONSTRAINT `tb_expect_operate_assert_ibfk_1` FOREIGN KEY (`assert_operate_id`) REFERENCES `tb_assert_operation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_expect_operate_assert_ibfk_2` FOREIGN KEY (`operate_item_id`) REFERENCES `tb_operate_item` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_expect_operate_assert
-- ----------------------------

-- ----------------------------
-- Table structure for tb_expect_result
-- ----------------------------
DROP TABLE IF EXISTS `tb_expect_result`;
CREATE TABLE `tb_expect_result`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `assert_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `case_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `case_id`(`case_id`) USING BTREE,
  CONSTRAINT `tb_expect_result_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `tb_test_cases` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_expect_result
-- ----------------------------

-- ----------------------------
-- Table structure for tb_locatestyle
-- ----------------------------
DROP TABLE IF EXISTS `tb_locatestyle`;
CREATE TABLE `tb_locatestyle`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_locatestyle
-- ----------------------------

-- ----------------------------
-- Table structure for tb_module
-- ----------------------------
DROP TABLE IF EXISTS `tb_module`;
CREATE TABLE `tb_module`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `project_id` bigint(0) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_id`(`project_id`) USING BTREE,
  CONSTRAINT `tb_module_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `tb_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_module
-- ----------------------------
INSERT INTO `tb_module` VALUES (4, 6, '登录模块');

-- ----------------------------
-- Table structure for tb_operate_args
-- ----------------------------
DROP TABLE IF EXISTS `tb_operate_args`;
CREATE TABLE `tb_operate_args`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `operate_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属操作id值',
  `operate_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属操作argname',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_operate_id_to_id`(`operate_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_operate_args
-- ----------------------------
INSERT INTO `tb_operate_args` VALUES (1, 'click', 'element');
INSERT INTO `tb_operate_args` VALUES (2, 'send_key', 'element');
INSERT INTO `tb_operate_args` VALUES (3, 'send_key', 'text');

-- ----------------------------
-- Table structure for tb_operate_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_operate_item`;
CREATE TABLE `tb_operate_item`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `operate_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `service_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `page_id`(`service_id`) USING BTREE,
  CONSTRAINT `tb_operate_item_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `tb_page_service` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_operate_item
-- ----------------------------
INSERT INTO `tb_operate_item` VALUES (1, 'click', NULL);
INSERT INTO `tb_operate_item` VALUES (27, 'click', 32);
INSERT INTO `tb_operate_item` VALUES (28, 'click', 33);
INSERT INTO `tb_operate_item` VALUES (29, 'send_key', 33);
INSERT INTO `tb_operate_item` VALUES (31, 'send_key', 35);

-- ----------------------------
-- Table structure for tb_operate_item_element
-- ----------------------------
DROP TABLE IF EXISTS `tb_operate_item_element`;
CREATE TABLE `tb_operate_item_element`  (
  `operate_item_id` bigint(0) NULL DEFAULT NULL,
  `element_id` bigint(0) NULL DEFAULT NULL,
  INDEX `operate_item_id`(`operate_item_id`) USING BTREE,
  INDEX `element_id`(`element_id`) USING BTREE,
  CONSTRAINT `tb_operate_item_element_ibfk_1` FOREIGN KEY (`operate_item_id`) REFERENCES `tb_operate_item` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_operate_item_element_ibfk_2` FOREIGN KEY (`element_id`) REFERENCES `tb_element` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_operate_item_element
-- ----------------------------

-- ----------------------------
-- Table structure for tb_page
-- ----------------------------
DROP TABLE IF EXISTS `tb_page`;
CREATE TABLE `tb_page`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `module_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `module_id`(`module_id`) USING BTREE,
  CONSTRAINT `tb_page_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `tb_module` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_page
-- ----------------------------
INSERT INTO `tb_page` VALUES (2, '登录页面', 4);

-- ----------------------------
-- Table structure for tb_page_function
-- ----------------------------
DROP TABLE IF EXISTS `tb_page_function`;
CREATE TABLE `tb_page_function`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tb_module_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tb_module_id`(`tb_module_id`) USING BTREE,
  CONSTRAINT `tb_page_function_ibfk_1` FOREIGN KEY (`tb_module_id`) REFERENCES `tb_module` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_page_function
-- ----------------------------
INSERT INTO `tb_page_function` VALUES (9, '登录功能', 4);

-- ----------------------------
-- Table structure for tb_page_service
-- ----------------------------
DROP TABLE IF EXISTS `tb_page_service`;
CREATE TABLE `tb_page_service`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tb_page_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `page_id`(`tb_page_id`) USING BTREE,
  CONSTRAINT `tb_page_service_ibfk_1` FOREIGN KEY (`tb_page_id`) REFERENCES `tb_page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_page_service
-- ----------------------------
INSERT INTO `tb_page_service` VALUES (32, '登录操作', 2);
INSERT INTO `tb_page_service` VALUES (33, '注册操作', 2);
INSERT INTO `tb_page_service` VALUES (35, '测试操作', NULL);

-- ----------------------------
-- Table structure for tb_page_service_element_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_page_service_element_item`;
CREATE TABLE `tb_page_service_element_item`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `page_service_id` bigint(0) NULL DEFAULT NULL,
  `tb_operate_item_id` bigint(0) NULL DEFAULT NULL,
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `page_service_id`(`page_service_id`) USING BTREE,
  INDEX `tb_operate_item_id`(`tb_operate_item_id`) USING BTREE,
  CONSTRAINT `tb_page_service_element_item_ibfk_1` FOREIGN KEY (`page_service_id`) REFERENCES `tb_page_service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_page_service_element_item_ibfk_2` FOREIGN KEY (`tb_operate_item_id`) REFERENCES `tb_operate_item` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_page_service_element_item
-- ----------------------------

-- ----------------------------
-- Table structure for tb_project
-- ----------------------------
DROP TABLE IF EXISTS `tb_project`;
CREATE TABLE `tb_project`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `ip_address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目IP地址',
  `project_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目路径',
  `db_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库用户名',
  `db_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_project
-- ----------------------------
INSERT INTO `tb_project` VALUES (6, '测试项目', '127.0.0.1', 'http://127.0.0.1:6060/', 'root', 'root');

-- ----------------------------
-- Table structure for tb_service_args
-- ----------------------------
DROP TABLE IF EXISTS `tb_service_args`;
CREATE TABLE `tb_service_args`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `service_id` bigint(0) NULL DEFAULT NULL,
  `service_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `service_id`(`service_id`) USING BTREE,
  CONSTRAINT `tb_service_args_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `tb_page_service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_service_args
-- ----------------------------
INSERT INTO `tb_service_args` VALUES (36, 32, 'username');
INSERT INTO `tb_service_args` VALUES (37, 33, 'username');
INSERT INTO `tb_service_args` VALUES (38, 33, 'password');

-- ----------------------------
-- Table structure for tb_service_operate_args
-- ----------------------------
DROP TABLE IF EXISTS `tb_service_operate_args`;
CREATE TABLE `tb_service_operate_args`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `operate_id` bigint(0) NULL DEFAULT NULL COMMENT '页面操作项id',
  `operate_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'args_name',
  `operate_val` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'args_value',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `service_operate_id`(`operate_id`) USING BTREE,
  CONSTRAINT `tb_service_operate_args_ibfk_1` FOREIGN KEY (`operate_id`) REFERENCES `tb_operate_item` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_service_operate_args
-- ----------------------------
INSERT INTO `tb_service_operate_args` VALUES (35, 27, 'element', NULL);
INSERT INTO `tb_service_operate_args` VALUES (36, 28, 'element', NULL);
INSERT INTO `tb_service_operate_args` VALUES (37, 29, 'element', NULL);
INSERT INTO `tb_service_operate_args` VALUES (38, 29, 'text', NULL);
INSERT INTO `tb_service_operate_args` VALUES (41, 31, 'element', NULL);
INSERT INTO `tb_service_operate_args` VALUES (42, 31, 'text', NULL);

-- ----------------------------
-- Table structure for tb_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_task`;
CREATE TABLE `tb_task`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `project_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_id`(`project_id`) USING BTREE,
  CONSTRAINT `tb_task_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `tb_project` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_task
-- ----------------------------
INSERT INTO `tb_task` VALUES (1, '第一次执行', '测试第一次执行', 6);

-- ----------------------------
-- Table structure for tb_task_case
-- ----------------------------
DROP TABLE IF EXISTS `tb_task_case`;
CREATE TABLE `tb_task_case`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `task_id` int(0) NULL DEFAULT NULL,
  `case_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `task_id`(`task_id`) USING BTREE,
  INDEX `case_id`(`case_id`) USING BTREE,
  CONSTRAINT `tb_task_case_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tb_task` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_task_case_ibfk_2` FOREIGN KEY (`case_id`) REFERENCES `tb_test_cases` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_task_case
-- ----------------------------

-- ----------------------------
-- Table structure for tb_test_args
-- ----------------------------
DROP TABLE IF EXISTS `tb_test_args`;
CREATE TABLE `tb_test_args`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `case_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_test_args
-- ----------------------------

-- ----------------------------
-- Table structure for tb_test_cases
-- ----------------------------
DROP TABLE IF EXISTS `tb_test_cases`;
CREATE TABLE `tb_test_cases`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `case_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `case_description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `page_function_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `page_function_id`(`page_function_id`) USING BTREE,
  CONSTRAINT `tb_test_cases_ibfk_1` FOREIGN KEY (`page_function_id`) REFERENCES `tb_page_function` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_test_cases
-- ----------------------------
INSERT INTO `tb_test_cases` VALUES (11, '注册成功', '成功注册用例', 9);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id` int(0) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('admin', '123456', 1);

-- ----------------------------
-- Table structure for tb_vars
-- ----------------------------
DROP TABLE IF EXISTS `tb_vars`;
CREATE TABLE `tb_vars`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `task_id` int(0) NULL DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `task_id`(`task_id`) USING BTREE,
  CONSTRAINT `tb_vars_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tb_task` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_vars
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

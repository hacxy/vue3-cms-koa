/*
 Navicat Premium Data Transfer

 Source Server         : mihu
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : 81.71.47.33:3306
 Source Schema         : mh_cms

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 08/03/2022 09:53:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mh_blog_infos
-- ----------------------------
DROP TABLE IF EXISTS `mh_blog_infos`;
CREATE TABLE `mh_blog_infos`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `blogger_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `blogger_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `blog_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `updated` int NULL DEFAULT NULL,
  `created` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mh_blog_infos
-- ----------------------------
INSERT INTO `mh_blog_infos` VALUES (2, 'http://localhost:1118/files/blog/avatar/blogger_avatar-17da350e1fa.jpg', '迷糊', 'Mihu_Blogasd', '许多人试图追随忍者的脚步，但只有极少数人成功了asd', 1639191325, 1632811056);

-- ----------------------------
-- Table structure for mh_blog_menu
-- ----------------------------
DROP TABLE IF EXISTS `mh_blog_menu`;
CREATE TABLE `mh_blog_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `menu_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sort` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `enable` int NULL DEFAULT 1,
  `created` int NULL DEFAULT NULL,
  `updated` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mh_blog_menu
-- ----------------------------
INSERT INTO `mh_blog_menu` VALUES (1, '首页', 'mihu-home-fill', '/home', '1', 1, 1636170421, 1639791590);
INSERT INTO `mh_blog_menu` VALUES (3, '友链', 'mihu-api-fill', '/blogroll', '4', 1, 1636171852, 1637563599);
INSERT INTO `mh_blog_menu` VALUES (4, '分类', 'mihu-appstore-fill', '/category', '2', 1, 1636182282, 1637560562);
INSERT INTO `mh_blog_menu` VALUES (5, '归档', 'mihu-container-fill', '/archive', '5', 1, 1636182352, 1637563803);
INSERT INTO `mh_blog_menu` VALUES (6, '标签', 'mihu-tag-fill', '/label', '3', 1, 1636598631, 1637560591);
INSERT INTO `mh_blog_menu` VALUES (7, '留言', 'mihu-snippets-fill', '/guestbook', '3', 1, 1636610881, 1637563784);

-- ----------------------------
-- Table structure for mh_menu
-- ----------------------------
DROP TABLE IF EXISTS `mh_menu`;
CREATE TABLE `mh_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parent_id` int NULL DEFAULT NULL COMMENT '父级菜单id',
  `created` int NULL DEFAULT NULL,
  `updated` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  CONSTRAINT `mh_menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `mh_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mh_menu
-- ----------------------------
INSERT INTO `mh_menu` VALUES (25, '系统管理', 'el-icon-setting', 2, 1, '/main/system', NULL, 1629188673, 1631515873);
INSERT INTO `mh_menu` VALUES (26, '菜单管理', NULL, 0, 2, '/main/system/menu', 25, 1629189215, 1629189215);
INSERT INTO `mh_menu` VALUES (27, '用户管理', NULL, 1, 2, '/main/system/user', 25, 1629189286, 1630998885);
INSERT INTO `mh_menu` VALUES (28, '权限管理', NULL, 2, 2, '/main/system/role', 25, 1629189336, 1630999525);
INSERT INTO `mh_menu` VALUES (29, '系统总览', 'el-icon-monitor', 0, 1, '/main/analysis', NULL, 1629272896, 1631007869);
INSERT INTO `mh_menu` VALUES (30, '核心技术', NULL, 0, 2, '/main/analysis/skill', 29, 1631007849, 1631676774);
INSERT INTO `mh_menu` VALUES (31, '博客管理', 'el-icon-document', 1, 1, '/main/blog', NULL, 1631070422, 1631929451);
INSERT INTO `mh_menu` VALUES (32, '文章管理', NULL, 1, 2, '/main/blog/write', 31, 1631494836, 1639470962);
INSERT INTO `mh_menu` VALUES (83, '信息管理', NULL, 0, 2, '/main/blog/infos', 31, 1632811384, 1635934616);
INSERT INTO `mh_menu` VALUES (84, '菜单管理', NULL, 3, 2, '/main/blog/menu', 31, 1635996199, 1635996199);
INSERT INTO `mh_menu` VALUES (104, '标签管理', NULL, 4, 2, '/main/blog/tag', 31, 1639375085, 1639470942);

-- ----------------------------
-- Table structure for mh_user
-- ----------------------------
DROP TABLE IF EXISTS `mh_user`;
CREATE TABLE `mh_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `enable` int NULL DEFAULT 1,
  `role_id` int NULL DEFAULT 3 COMMENT '权限id',
  `last_login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_login_time` int NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created` int NULL DEFAULT NULL,
  `updated` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `mh_user_username`(`username`) USING BTREE,
  UNIQUE INDEX `username_2`(`username`) USING BTREE,
  UNIQUE INDEX `username_3`(`username`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `mh_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `mh_user_role` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mh_user
-- ----------------------------
INSERT INTO `mh_user` VALUES (1, 'mihu0915', 'ea4ee1d8c29d7b6cf4438644ea4d88ca', 'http://localhost:1118/files/avatar/avatar-17da2410e65.jpg', 1, 1, '192.168.10.72', 1639792174, '喝甜酒也迷糊', NULL, '2285088054', 1630508538, 1639119295);
INSERT INTO `mh_user` VALUES (41, 'test3333', '4bfe1b8f3dd03882fc394b93df365a7d', NULL, 0, 3, NULL, NULL, 'test3333', NULL, NULL, 1631257558, 1631257771);
INSERT INTO `mh_user` VALUES (44, 'test888', 'e2e31a427d2e8c4851b53f7eeb9fff95', NULL, 0, 3, NULL, NULL, 'test888', NULL, NULL, 1631257710, 1636356166);
INSERT INTO `mh_user` VALUES (45, 'test999', '93327f2856df1105a1318895ac44e684', NULL, 1, 3, NULL, NULL, 'test999', NULL, NULL, 1631257722, 1631257722);
INSERT INTO `mh_user` VALUES (47, 'test1100', 'ab9bc1e514d787624486de321c65a9a6', NULL, 0, 3, NULL, NULL, 'test1100', NULL, NULL, 1631257817, 1639121106);
INSERT INTO `mh_user` VALUES (62, 'admin123', '0192023a7bbd73250516f069df18b500', 'http://localhost:1118/files/avatar/avatar-17da852fc08.jpg', 1, 1, '192.168.10.50', 1639206701, 'admin123', NULL, NULL, 1639115759, 1639206552);
INSERT INTO `mh_user` VALUES (74, '12312312322', 'f5bb0c8de146c67b44babbf4e6584cc0', NULL, 1, 3, NULL, NULL, '12312312322', NULL, NULL, 1639137361, 1639137361);
INSERT INTO `mh_user` VALUES (75, 'hhhhhhh', '2d6529484f7c0b052ff65d8b93ca200a', 'http://localhost:1118/files/avatar/avatar-17da876aff4.png', 1, 3, NULL, NULL, 'hhhhhhh', NULL, NULL, 1639137370, 1639208893);
INSERT INTO `mh_user` VALUES (77, 'aaaaaaa', '5d793fc5b00a2348c3fb9ab59e5ca98a', 'http://localhost:1118/files/avatar/avatar-17da87532a4.png', 1, 3, NULL, NULL, 'aaaaaaa123', NULL, 'asdasd', 1639137612, 1639208952);

-- ----------------------------
-- Table structure for mh_user_operator_log
-- ----------------------------
DROP TABLE IF EXISTS `mh_user_operator_log`;
CREATE TABLE `mh_user_operator_log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `operator_id` int NULL DEFAULT NULL,
  `operator_time` int NULL DEFAULT NULL,
  `operator_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `operator_type` int NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1455 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户操作日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mh_user_operator_log
-- ----------------------------
INSERT INTO `mh_user_operator_log` VALUES (1169, 1, 1639138824, '192.168.10.72', -2, '账号：mihu0915，更新了id为80的用户信息');
INSERT INTO `mh_user_operator_log` VALUES (1170, 1, 1639138842, '192.168.10.72', -3, '账号：mihu0915，删除了用户：qweqweqwe');
INSERT INTO `mh_user_operator_log` VALUES (1171, 1, 1639187379, '192.168.10.50', -3, '账号：mihu0915，删除了权限：qweqwe，id为：15');
INSERT INTO `mh_user_operator_log` VALUES (1172, 1, 1639189438, '192.168.10.50', -3, '账号：mihu0915，删除了用户：asdasdasdqe，id为：79');
INSERT INTO `mh_user_operator_log` VALUES (1173, 1, 1639189465, '192.168.10.50', -3, '账号：mihu0915，删除了用户：asdasd，id为：78');
INSERT INTO `mh_user_operator_log` VALUES (1174, 1, 1639191288, '192.168.10.50', -2, '账号：mihu0915，更新了用户信息，id为：77');
INSERT INTO `mh_user_operator_log` VALUES (1175, 1, 1639191325, '192.168.10.50', -2, '账号：mihu0915，更新了博客配置信息，id为：2');
INSERT INTO `mh_user_operator_log` VALUES (1176, 1, 1639191364, '192.168.10.50', -1, '账号：mihu0915，添加了博客菜单：123，id为：11');
INSERT INTO `mh_user_operator_log` VALUES (1177, 1, 1639191385, '192.168.10.50', -3, '账号：mihu0915，删除了文章：《webpack相关笔记》，id为：15');
INSERT INTO `mh_user_operator_log` VALUES (1178, 1, 1639191513, '192.168.10.50', -1, '账号：mihu0915，添加了菜单：qweqwe，id为：102');
INSERT INTO `mh_user_operator_log` VALUES (1179, 1, 1639192188, '192.168.10.50', -3, '账号：mihu0915，删除了菜单：qweqwe，id为：102');
INSERT INTO `mh_user_operator_log` VALUES (1180, 1, 1639192194, '192.168.10.50', -1, '账号：mihu0915，添加了菜单：123123，id为：103');
INSERT INTO `mh_user_operator_log` VALUES (1181, 1, 1639192260, '192.168.10.50', -3, '账号：mihu0915，删除了菜单：123123，id为：103');
INSERT INTO `mh_user_operator_log` VALUES (1182, 1, 1639201673, '192.168.10.50', -3, '账号：mihu0915，删除了用户：test222211，id为：39');
INSERT INTO `mh_user_operator_log` VALUES (1183, 1, 1639206552, '192.168.10.50', -2, '账号：mihu0915，更新了用户信息，id为：62');
INSERT INTO `mh_user_operator_log` VALUES (1184, 62, 1639207669, '192.168.10.50', -3, '账号：admin123，删除了文章：《webpack相关笔记》，id为：16');
INSERT INTO `mh_user_operator_log` VALUES (1185, 62, 1639208781, '192.168.10.50', -2, '账号：admin123，更新了用户信息，id为：77');
INSERT INTO `mh_user_operator_log` VALUES (1186, 62, 1639208793, '192.168.10.50', -2, '账号：admin123，更新了用户信息，id为：77');
INSERT INTO `mh_user_operator_log` VALUES (1187, 62, 1639208806, '192.168.10.50', -2, '账号：admin123，更新了用户信息，id为：77');
INSERT INTO `mh_user_operator_log` VALUES (1188, 62, 1639208807, '192.168.10.50', -2, '账号：admin123，更新了用户信息，id为：77');
INSERT INTO `mh_user_operator_log` VALUES (1189, 62, 1639208893, '192.168.10.50', -2, '账号：admin123，更新了用户信息，id为：75');
INSERT INTO `mh_user_operator_log` VALUES (1190, 62, 1639208952, '192.168.10.50', -2, '账号：admin123，更新了用户信息，id为：77');
INSERT INTO `mh_user_operator_log` VALUES (1191, 62, 1639209063, '192.168.10.50', -3, '账号：admin123，删除了博客菜单：123，id为：11');
INSERT INTO `mh_user_operator_log` VALUES (1192, 1, 1639375085, '192.168.10.69', -1, '账号：mihu0915，添加了菜单：标签管理，id为：104');
INSERT INTO `mh_user_operator_log` VALUES (1193, 1, 1639377131, '192.168.10.69', -3, '账号：mihu0915，删除了文章：《test2222》，id为：13');
INSERT INTO `mh_user_operator_log` VALUES (1194, 1, 1639382997, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：123123，id为：1');
INSERT INTO `mh_user_operator_log` VALUES (1195, 1, 1639383007, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：123123，id为：2');
INSERT INTO `mh_user_operator_log` VALUES (1196, 1, 1639383009, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：123123，id为：3');
INSERT INTO `mh_user_operator_log` VALUES (1197, 1, 1639383680, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：asdasd，id为：4');
INSERT INTO `mh_user_operator_log` VALUES (1198, 1, 1639383680, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：asdasd，id为：5');
INSERT INTO `mh_user_operator_log` VALUES (1199, 1, 1639383685, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：asdasd，id为：6');
INSERT INTO `mh_user_operator_log` VALUES (1200, 1, 1639383685, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：asdasd，id为：7');
INSERT INTO `mh_user_operator_log` VALUES (1201, 1, 1639383694, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：asdaaaaaaa，id为：8');
INSERT INTO `mh_user_operator_log` VALUES (1202, 1, 1639383694, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：asdaaaaaaa，id为：9');
INSERT INTO `mh_user_operator_log` VALUES (1203, 1, 1639383737, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：asdasdasdasd，id为：10');
INSERT INTO `mh_user_operator_log` VALUES (1204, 1, 1639383737, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：asdasdasdasd，id为：11');
INSERT INTO `mh_user_operator_log` VALUES (1205, 1, 1639383817, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：asda123，id为：12');
INSERT INTO `mh_user_operator_log` VALUES (1206, 1, 1639383817, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：asda123，id为：13');
INSERT INTO `mh_user_operator_log` VALUES (1207, 1, 1639383822, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：123123，id为：14');
INSERT INTO `mh_user_operator_log` VALUES (1208, 1, 1639383966, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：asdasd，id为：15');
INSERT INTO `mh_user_operator_log` VALUES (1209, 1, 1639383966, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：asdasd，id为：16');
INSERT INTO `mh_user_operator_log` VALUES (1210, 1, 1639384682, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：null，id为：17');
INSERT INTO `mh_user_operator_log` VALUES (1211, 1, 1639384828, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：null，id为：18');
INSERT INTO `mh_user_operator_log` VALUES (1212, 1, 1639385483, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：null，id为：19');
INSERT INTO `mh_user_operator_log` VALUES (1213, 1, 1639385617, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：null，id为：20');
INSERT INTO `mh_user_operator_log` VALUES (1214, 1, 1639385751, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：null，id为：21');
INSERT INTO `mh_user_operator_log` VALUES (1215, 1, 1639385811, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：123，id为：22');
INSERT INTO `mh_user_operator_log` VALUES (1216, 1, 1639385850, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：null，id为：23');
INSERT INTO `mh_user_operator_log` VALUES (1217, 1, 1639385879, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：null，id为：24');
INSERT INTO `mh_user_operator_log` VALUES (1218, 1, 1639386510, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：null，id为：25');
INSERT INTO `mh_user_operator_log` VALUES (1219, 1, 1639386530, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：123123，id为：26');
INSERT INTO `mh_user_operator_log` VALUES (1220, 1, 1639386848, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：null，id为：27');
INSERT INTO `mh_user_operator_log` VALUES (1221, 1, 1639387020, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：aweqwe，id为：28');
INSERT INTO `mh_user_operator_log` VALUES (1222, 1, 1639387235, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：asdasd，id为：29');
INSERT INTO `mh_user_operator_log` VALUES (1223, 1, 1639387270, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：asdasdas，id为：30');
INSERT INTO `mh_user_operator_log` VALUES (1224, 1, 1639387340, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：asdasdas，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1225, 1, 1639387356, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：asdasd，id为：32');
INSERT INTO `mh_user_operator_log` VALUES (1226, 1, 1639388787, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：asdasdasd，id为：33');
INSERT INTO `mh_user_operator_log` VALUES (1227, 1, 1639388852, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：asdasdasd，id为：34');
INSERT INTO `mh_user_operator_log` VALUES (1228, 1, 1639389034, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：null，id为：25');
INSERT INTO `mh_user_operator_log` VALUES (1229, 1, 1639389036, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：null，id为：24');
INSERT INTO `mh_user_operator_log` VALUES (1230, 1, 1639389037, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：null，id为：23');
INSERT INTO `mh_user_operator_log` VALUES (1231, 1, 1639389039, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：123，id为：22');
INSERT INTO `mh_user_operator_log` VALUES (1232, 1, 1639389041, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：null，id为：27');
INSERT INTO `mh_user_operator_log` VALUES (1233, 1, 1639389056, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：asdasdasd，id为：34');
INSERT INTO `mh_user_operator_log` VALUES (1234, 1, 1639389060, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：asdasdasd，id为：33');
INSERT INTO `mh_user_operator_log` VALUES (1235, 1, 1639389061, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：asdasdas，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1236, 1, 1639389063, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：asdasdas，id为：30');
INSERT INTO `mh_user_operator_log` VALUES (1237, 1, 1639389065, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：asdasd，id为：32');
INSERT INTO `mh_user_operator_log` VALUES (1238, 1, 1639389066, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：asdasd，id为：29');
INSERT INTO `mh_user_operator_log` VALUES (1239, 1, 1639389068, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：aweqwe，id为：28');
INSERT INTO `mh_user_operator_log` VALUES (1240, 1, 1639389070, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：123123，id为：26');
INSERT INTO `mh_user_operator_log` VALUES (1241, 1, 1639389071, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：null，id为：21');
INSERT INTO `mh_user_operator_log` VALUES (1242, 1, 1639389073, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：null，id为：20');
INSERT INTO `mh_user_operator_log` VALUES (1243, 1, 1639389075, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：null，id为：19');
INSERT INTO `mh_user_operator_log` VALUES (1244, 1, 1639389077, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：null，id为：18');
INSERT INTO `mh_user_operator_log` VALUES (1245, 1, 1639389080, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：null，id为：17');
INSERT INTO `mh_user_operator_log` VALUES (1246, 1, 1639389083, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：123123，id为：1');
INSERT INTO `mh_user_operator_log` VALUES (1247, 1, 1639389085, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：123123，id为：2');
INSERT INTO `mh_user_operator_log` VALUES (1248, 1, 1639389087, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：123123，id为：3');
INSERT INTO `mh_user_operator_log` VALUES (1249, 1, 1639389089, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：asdasd，id为：4');
INSERT INTO `mh_user_operator_log` VALUES (1250, 1, 1639389090, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：asdasd，id为：5');
INSERT INTO `mh_user_operator_log` VALUES (1251, 1, 1639389092, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：asdasd，id为：6');
INSERT INTO `mh_user_operator_log` VALUES (1252, 1, 1639389095, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：asdasd，id为：7');
INSERT INTO `mh_user_operator_log` VALUES (1253, 1, 1639389097, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：asdaaaaaaa，id为：8');
INSERT INTO `mh_user_operator_log` VALUES (1254, 1, 1639389099, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：asdaaaaaaa，id为：9');
INSERT INTO `mh_user_operator_log` VALUES (1255, 1, 1639389101, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：asdasdasdasd，id为：10');
INSERT INTO `mh_user_operator_log` VALUES (1256, 1, 1639389103, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：asdasdasdasd，id为：11');
INSERT INTO `mh_user_operator_log` VALUES (1257, 1, 1639389104, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：asda123，id为：12');
INSERT INTO `mh_user_operator_log` VALUES (1258, 1, 1639389106, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：asda123，id为：13');
INSERT INTO `mh_user_operator_log` VALUES (1259, 1, 1639389108, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：123123，id为：14');
INSERT INTO `mh_user_operator_log` VALUES (1260, 1, 1639389110, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：asdasd，id为：15');
INSERT INTO `mh_user_operator_log` VALUES (1261, 1, 1639389112, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：asdasd，id为：16');
INSERT INTO `mh_user_operator_log` VALUES (1262, 1, 1639389115, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：nodejs，id为：35');
INSERT INTO `mh_user_operator_log` VALUES (1263, 1, 1639389122, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：javascript，id为：36');
INSERT INTO `mh_user_operator_log` VALUES (1264, 1, 1639389156, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：css，id为：37');
INSERT INTO `mh_user_operator_log` VALUES (1265, 1, 1639389161, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：html，id为：38');
INSERT INTO `mh_user_operator_log` VALUES (1266, 1, 1639389174, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：爬虫，id为：39');
INSERT INTO `mh_user_operator_log` VALUES (1267, 1, 1639389461, '192.168.10.69', -1, '账号：mihu0915，添加了文章标签：null，id为：40');
INSERT INTO `mh_user_operator_log` VALUES (1268, 1, 1639389465, '192.168.10.69', -3, '账号：mihu0915，删除了文章标签：null，id为：40');
INSERT INTO `mh_user_operator_log` VALUES (1269, 1, 1639470646, '192.168.10.83', -1, '账号：mihu0915，添加了文章标签：vue2，id为：41');
INSERT INTO `mh_user_operator_log` VALUES (1270, 1, 1639470649, '192.168.10.83', -1, '账号：mihu0915，添加了文章标签：vue3，id为：42');
INSERT INTO `mh_user_operator_log` VALUES (1271, 1, 1639470658, '192.168.10.83', -1, '账号：mihu0915，添加了文章标签：react，id为：43');
INSERT INTO `mh_user_operator_log` VALUES (1272, 1, 1639470688, '192.168.10.83', -1, '账号：mihu0915，添加了文章标签：webpack，id为：44');
INSERT INTO `mh_user_operator_log` VALUES (1273, 1, 1639470942, '192.168.10.83', -2, '账号：mihu0915，更新了菜单信息，id为：104');
INSERT INTO `mh_user_operator_log` VALUES (1274, 1, 1639470962, '192.168.10.83', -2, '账号：mihu0915，更新了菜单信息，id为：32');
INSERT INTO `mh_user_operator_log` VALUES (1275, 1, 1639476141, '192.168.10.83', -1, '账号：mihu0915，添加了权限：undefined，id为：16');
INSERT INTO `mh_user_operator_log` VALUES (1276, 1, 1639538088, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《test》，id为：18');
INSERT INTO `mh_user_operator_log` VALUES (1277, 1, 1639538997, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《asdasd》，id为：19');
INSERT INTO `mh_user_operator_log` VALUES (1278, 1, 1639539933, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《asdasd》，id为：20');
INSERT INTO `mh_user_operator_log` VALUES (1279, 1, 1639539952, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《asdasd》，id为：21');
INSERT INTO `mh_user_operator_log` VALUES (1280, 1, 1639543393, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《asdasd》，id为：22');
INSERT INTO `mh_user_operator_log` VALUES (1281, 1, 1639544080, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《qweqawe》，id为：23');
INSERT INTO `mh_user_operator_log` VALUES (1282, 1, 1639544162, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《qweqawe》，id为：24');
INSERT INTO `mh_user_operator_log` VALUES (1283, 1, 1639544387, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《qweqawe》，id为：25');
INSERT INTO `mh_user_operator_log` VALUES (1284, 1, 1639544486, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《qweqweqwe》，id为：26');
INSERT INTO `mh_user_operator_log` VALUES (1285, 1, 1639544538, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《qweqweqwe》，id为：27');
INSERT INTO `mh_user_operator_log` VALUES (1286, 1, 1639544729, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《23423423》，id为：28');
INSERT INTO `mh_user_operator_log` VALUES (1287, 1, 1639544989, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《araerarf》，id为：29');
INSERT INTO `mh_user_operator_log` VALUES (1288, 1, 1639544989, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《undefined》，id为：10');
INSERT INTO `mh_user_operator_log` VALUES (1289, 1, 1639544989, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《undefined》，id为：9');
INSERT INTO `mh_user_operator_log` VALUES (1290, 1, 1639544989, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《undefined》，id为：11');
INSERT INTO `mh_user_operator_log` VALUES (1291, 1, 1639546678, '192.168.10.83', -2, '账号：mihu0915，更新了文章信息，id为：29');
INSERT INTO `mh_user_operator_log` VALUES (1292, 1, 1639550341, '192.168.10.83', -2, '账号：mihu0915，更新了文章信息，id为：29');
INSERT INTO `mh_user_operator_log` VALUES (1293, 1, 1639551125, '192.168.10.83', -2, '账号：mihu0915，更新了文章信息，id为：29');
INSERT INTO `mh_user_operator_log` VALUES (1294, 1, 1639551125, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《undefined》，id为：12');
INSERT INTO `mh_user_operator_log` VALUES (1295, 1, 1639551131, '192.168.10.83', -2, '账号：mihu0915，更新了文章信息，id为：29');
INSERT INTO `mh_user_operator_log` VALUES (1296, 1, 1639551131, '192.168.10.83', -3, '账号：mihu0915，删除了文章：《undefined》，id为：10');
INSERT INTO `mh_user_operator_log` VALUES (1297, 1, 1639551148, '192.168.10.83', -2, '账号：mihu0915，更新了文章信息，id为：29');
INSERT INTO `mh_user_operator_log` VALUES (1298, 1, 1639551148, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《undefined》，id为：13');
INSERT INTO `mh_user_operator_log` VALUES (1299, 1, 1639551148, '192.168.10.83', -3, '账号：mihu0915，删除了文章：《undefined》，id为：9');
INSERT INTO `mh_user_operator_log` VALUES (1300, 1, 1639551365, '192.168.10.83', -2, '账号：mihu0915，更新了文章信息，id为：29');
INSERT INTO `mh_user_operator_log` VALUES (1301, 1, 1639552670, '192.168.10.83', -3, '账号：mihu0915，删除了文章：《23423423》，id为：28');
INSERT INTO `mh_user_operator_log` VALUES (1302, 1, 1639552673, '192.168.10.83', -3, '账号：mihu0915，删除了文章：《qweqweqwe》，id为：27');
INSERT INTO `mh_user_operator_log` VALUES (1303, 1, 1639552688, '192.168.10.83', -3, '账号：mihu0915，删除了文章：《qweqweqwe》，id为：26');
INSERT INTO `mh_user_operator_log` VALUES (1304, 1, 1639553670, '192.168.10.83', -3, '账号：mihu0915，删除了文章：《qweqawe》，id为：25');
INSERT INTO `mh_user_operator_log` VALUES (1305, 1, 1639553687, '192.168.10.83', -3, '账号：mihu0915，删除了文章：《123asdasd》，id为：29');
INSERT INTO `mh_user_operator_log` VALUES (1306, 1, 1639553933, '192.168.10.83', -2, '账号：mihu0915，更新了文章信息，id为：24');
INSERT INTO `mh_user_operator_log` VALUES (1307, 1, 1639553933, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《undefined》，id为：14');
INSERT INTO `mh_user_operator_log` VALUES (1308, 1, 1639553933, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《undefined》，id为：15');
INSERT INTO `mh_user_operator_log` VALUES (1309, 1, 1639553933, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《undefined》，id为：16');
INSERT INTO `mh_user_operator_log` VALUES (1310, 1, 1639553941, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《undefined》，id为：17');
INSERT INTO `mh_user_operator_log` VALUES (1311, 1, 1639553941, '192.168.10.83', -2, '账号：mihu0915，更新了文章信息，id为：23');
INSERT INTO `mh_user_operator_log` VALUES (1312, 1, 1639553947, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《undefined》，id为：18');
INSERT INTO `mh_user_operator_log` VALUES (1313, 1, 1639553947, '192.168.10.83', -2, '账号：mihu0915，更新了文章信息，id为：22');
INSERT INTO `mh_user_operator_log` VALUES (1314, 1, 1639553960, '192.168.10.83', -3, '账号：mihu0915，删除了文章：《qweqawe》，id为：24');
INSERT INTO `mh_user_operator_log` VALUES (1315, 1, 1639553960, '192.168.10.83', -3, '账号：mihu0915，删除了文章：《undefined》，id为：15');
INSERT INTO `mh_user_operator_log` VALUES (1316, 1, 1639553960, '192.168.10.83', -3, '账号：mihu0915，删除了文章：《undefined》，id为：14');
INSERT INTO `mh_user_operator_log` VALUES (1317, 1, 1639553960, '192.168.10.83', -3, '账号：mihu0915，删除了文章：《undefined》，id为：16');
INSERT INTO `mh_user_operator_log` VALUES (1318, 1, 1639554006, '192.168.10.83', -2, '账号：mihu0915，更新了文章信息，id为：19');
INSERT INTO `mh_user_operator_log` VALUES (1319, 1, 1639554006, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《undefined》，id为：19');
INSERT INTO `mh_user_operator_log` VALUES (1320, 1, 1639555154, '192.168.10.83', -3, '账号：mihu0915，删除了文章：《123123》，id为：9');
INSERT INTO `mh_user_operator_log` VALUES (1321, 1, 1639555156, '192.168.10.83', -3, '账号：mihu0915，删除了文章：《Markdown测试》，id为：11');
INSERT INTO `mh_user_operator_log` VALUES (1322, 1, 1639555158, '192.168.10.83', -3, '账号：mihu0915，删除了文章：《123》，id为：12');
INSERT INTO `mh_user_operator_log` VALUES (1323, 1, 1639555215, '192.168.10.83', -2, '账号：mihu0915，更新了文章信息，id为：23');
INSERT INTO `mh_user_operator_log` VALUES (1324, 1, 1639555215, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《undefined》，id为：20');
INSERT INTO `mh_user_operator_log` VALUES (1325, 1, 1639555215, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《undefined》，id为：21');
INSERT INTO `mh_user_operator_log` VALUES (1326, 1, 1639555215, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《undefined》，id为：22');
INSERT INTO `mh_user_operator_log` VALUES (1327, 1, 1639555215, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《undefined》，id为：23');
INSERT INTO `mh_user_operator_log` VALUES (1328, 1, 1639555215, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《undefined》，id为：24');
INSERT INTO `mh_user_operator_log` VALUES (1329, 1, 1639555769, '192.168.10.83', -3, '账号：mihu0915，删除了文章标签：爬虫，id为：39');
INSERT INTO `mh_user_operator_log` VALUES (1330, 1, 1639555821, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《test文章》，id为：30');
INSERT INTO `mh_user_operator_log` VALUES (1331, 1, 1639555821, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《undefined》，id为：26');
INSERT INTO `mh_user_operator_log` VALUES (1332, 1, 1639555821, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《undefined》，id为：25');
INSERT INTO `mh_user_operator_log` VALUES (1333, 1, 1639555834, '192.168.10.83', -1, '账号：mihu0915，添加了文章标签：爬虫，id为：45');
INSERT INTO `mh_user_operator_log` VALUES (1334, 1, 1639555852, '192.168.10.83', -1, '账号：mihu0915，添加了文章标签：axios，id为：46');
INSERT INTO `mh_user_operator_log` VALUES (1335, 1, 1639555938, '192.168.10.83', -3, '账号：mihu0915，删除了文章标签：javascript，id为：36');
INSERT INTO `mh_user_operator_log` VALUES (1336, 1, 1639555953, '192.168.10.83', -1, '账号：mihu0915，添加了文章标签：JavaScript，id为：47');
INSERT INTO `mh_user_operator_log` VALUES (1337, 1, 1639555964, '192.168.10.83', -2, '账号：mihu0915，更新了文章信息，id为：30');
INSERT INTO `mh_user_operator_log` VALUES (1338, 1, 1639555964, '192.168.10.83', -1, '账号：mihu0915，添加了文章：《undefined》，id为：27');
INSERT INTO `mh_user_operator_log` VALUES (1339, 1, 1639621534, '192.168.10.65', -1, '账号：mihu0915，添加了文章：《asdasdasd》，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1340, 1, 1639621534, '192.168.10.65', -1, '账号：mihu0915，添加了文章：《undefined》，id为：28');
INSERT INTO `mh_user_operator_log` VALUES (1341, 1, 1639621607, '192.168.10.65', -3, '账号：mihu0915，删除了文章：《qweqawe》，id为：23');
INSERT INTO `mh_user_operator_log` VALUES (1342, 1, 1639621818, '192.168.10.65', -1, '账号：mihu0915，添加了文章：《undefined》，id为：29');
INSERT INTO `mh_user_operator_log` VALUES (1343, 1, 1639621818, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1344, 1, 1639630951, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1345, 1, 1639630953, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1346, 1, 1639631010, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1347, 1, 1639631048, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1348, 1, 1639631064, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1349, 1, 1639631081, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1350, 1, 1639631083, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1351, 1, 1639631097, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1352, 1, 1639631258, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1353, 1, 1639631273, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1354, 1, 1639631289, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1355, 1, 1639631369, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1356, 1, 1639631398, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1357, 1, 1639631428, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1358, 1, 1639631431, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1359, 1, 1639631431, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1360, 1, 1639631437, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1361, 1, 1639631449, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1362, 1, 1639631850, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1363, 1, 1639631853, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1364, 1, 1639631961, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1365, 1, 1639631962, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1366, 1, 1639631963, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1367, 1, 1639631964, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1368, 1, 1639631968, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1369, 1, 1639631971, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1370, 1, 1639631971, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1371, 1, 1639632178, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1372, 1, 1639632180, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1373, 1, 1639632182, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1374, 1, 1639632274, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1375, 1, 1639632276, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1376, 1, 1639632278, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1377, 1, 1639632353, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1378, 1, 1639632369, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1379, 1, 1639632410, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1380, 1, 1639632414, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1381, 1, 1639632819, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1382, 1, 1639632827, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1383, 1, 1639632831, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1384, 1, 1639632834, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1385, 1, 1639632840, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1386, 1, 1639632845, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1387, 1, 1639632853, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1388, 1, 1639632861, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1389, 1, 1639632931, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1390, 1, 1639632944, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：30');
INSERT INTO `mh_user_operator_log` VALUES (1391, 1, 1639632947, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：30');
INSERT INTO `mh_user_operator_log` VALUES (1392, 1, 1639632957, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1393, 1, 1639632958, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1394, 1, 1639633000, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：22');
INSERT INTO `mh_user_operator_log` VALUES (1395, 1, 1639633165, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：22');
INSERT INTO `mh_user_operator_log` VALUES (1396, 1, 1639633168, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：22');
INSERT INTO `mh_user_operator_log` VALUES (1397, 1, 1639633181, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：22');
INSERT INTO `mh_user_operator_log` VALUES (1398, 1, 1639633242, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：22');
INSERT INTO `mh_user_operator_log` VALUES (1399, 1, 1639633247, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：22');
INSERT INTO `mh_user_operator_log` VALUES (1400, 1, 1639633255, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：22');
INSERT INTO `mh_user_operator_log` VALUES (1401, 1, 1639633263, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：22');
INSERT INTO `mh_user_operator_log` VALUES (1402, 1, 1639633308, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：22');
INSERT INTO `mh_user_operator_log` VALUES (1403, 1, 1639633609, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：22');
INSERT INTO `mh_user_operator_log` VALUES (1404, 1, 1639633652, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：30');
INSERT INTO `mh_user_operator_log` VALUES (1405, 1, 1639633748, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：30');
INSERT INTO `mh_user_operator_log` VALUES (1406, 1, 1639634077, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：22');
INSERT INTO `mh_user_operator_log` VALUES (1407, 1, 1639634089, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：18');
INSERT INTO `mh_user_operator_log` VALUES (1408, 1, 1639634102, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1409, 1, 1639634108, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：30');
INSERT INTO `mh_user_operator_log` VALUES (1410, 1, 1639634177, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1411, 1, 1639635493, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1412, 1, 1639635795, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1413, 1, 1639635796, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1414, 1, 1639635806, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1415, 1, 1639635807, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1416, 1, 1639635826, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1417, 1, 1639635829, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1418, 1, 1639635834, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1419, 1, 1639635835, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1420, 1, 1639635891, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1421, 1, 1639635894, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1422, 1, 1639635901, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1423, 1, 1639636054, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1424, 1, 1639636087, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1425, 1, 1639636091, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1426, 1, 1639636093, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1427, 1, 1639636148, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：30');
INSERT INTO `mh_user_operator_log` VALUES (1428, 1, 1639636342, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：14');
INSERT INTO `mh_user_operator_log` VALUES (1429, 1, 1639636355, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：14');
INSERT INTO `mh_user_operator_log` VALUES (1430, 1, 1639638230, '192.168.10.65', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1431, 1, 1639638230, '192.168.10.65', -1, '账号：mihu0915，添加了文章：《undefined》，id为：30');
INSERT INTO `mh_user_operator_log` VALUES (1432, 1, 1639638230, '192.168.10.65', -1, '账号：mihu0915，添加了文章：《undefined》，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1433, 1, 1639743909, '192.168.10.85', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1434, 1, 1639743915, '192.168.10.85', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1435, 1, 1639744286, '192.168.10.85', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1436, 1, 1639744508, '192.168.10.85', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1437, 1, 1639744510, '192.168.10.85', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1438, 1, 1639744514, '192.168.10.85', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1439, 1, 1639791589, '192.168.10.72', -2, '账号：mihu0915，更新了博客菜单信息，id为：1');
INSERT INTO `mh_user_operator_log` VALUES (1440, 1, 1639791590, '192.168.10.72', -2, '账号：mihu0915，更新了博客菜单信息，id为：1');
INSERT INTO `mh_user_operator_log` VALUES (1441, 1, 1639793354, '192.168.10.72', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1442, 1, 1639794616, '192.168.10.72', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1443, 1, 1639796285, '192.168.10.72', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1444, 1, 1639796320, '192.168.10.72', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1445, 1, 1639804179, '192.168.10.72', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1446, 1, 1639805005, '192.168.10.72', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1447, 1, 1639805070, '192.168.10.72', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1448, 1, 1639805152, '192.168.10.72', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1449, 1, 1639807670, '192.168.10.72', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1450, 1, 1639807682, '192.168.10.72', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1451, 1, 1639807688, '192.168.10.72', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1452, 1, 1639807734, '192.168.10.72', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1453, 1, 1639815790, '192.168.10.72', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1454, 1, 1639817088, '192.168.10.72', -2, '账号：mihu0915，更新了文章信息，id为：31');
INSERT INTO `mh_user_operator_log` VALUES (1455, 1, 1639817141, '192.168.10.72', -2, '账号：mihu0915，更新了文章信息，id为：31');

-- ----------------------------
-- Table structure for mh_user_role
-- ----------------------------
DROP TABLE IF EXISTS `mh_user_role`;
CREATE TABLE `mh_user_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '角色表id',
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role_intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role_menu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created` int NULL DEFAULT NULL,
  `updated` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mh_user_role
-- ----------------------------
INSERT INTO `mh_user_role` VALUES (1, '超级管理员', '所有权限', '25,29,31,26,27,28,30,32,83,84,104', NULL, 1639120248);
INSERT INTO `mh_user_role` VALUES (2, '管理员', '部分权限', '34,70,25,26,27,28,78,71,76,77,79,73,74', NULL, 1631503952);
INSERT INTO `mh_user_role` VALUES (3, '普通会员', '普通权限', '29,30', NULL, 1639122315);

-- ----------------------------
-- Table structure for mh_write
-- ----------------------------
DROP TABLE IF EXISTS `mh_write`;
CREATE TABLE `mh_write`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章封面',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章标题',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章描述',
  `status` int NULL DEFAULT NULL COMMENT '文章状态：0：未发布；1：已发布',
  `reading_count` int NULL DEFAULT 0 COMMENT '阅读数量',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文章内容',
  `created` int NULL DEFAULT NULL COMMENT '创建时间',
  `updated` int NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mh_write
-- ----------------------------
INSERT INTO `mh_write` VALUES (14, 'http://localhost:1118/files/cover/cover-17d9d9f4f9b.jpeg', 'webpack相关笔记', 'webpack相关笔记webpack相关笔记webpack相关笔记webpack相关笔记webpack相关笔记webpack相关笔记webpack相关笔记', 0, 0, '# webpack相关笔记\n\n> ### 一、webpack的配置\n>\n> 入口默认为：packageName/src/index.js\n> 出口默认为：packageName/dist/main.js\n> 如果需要修改配置则需要创建webpack.config.js文件12👀️\n\n> ### 二、loader的基本使用\n>\n> 1. 安装loader：\n>    ```npm install css-loader -D```\n> 2. 使用loader：\n>\n> * 方式一：内联方式：内联方式使用较少，因为不方便管理；\n>   在引入的样式前加上使用的loader，并使用!作为分隔符；qweasdasdasd\n> * 1231231123qweqwe1231231231231231231231231231\n>\n> ```javascript\n> import \"css-loader!../css/style.css\";\n> ```\n>\n> * 方式二：CLI方式：\n>   在webpack5的文档中已经没有了 ```--module-bind```\n>   实际应用中也比较少使用，因为不方便管理；\n> * 方式三：loader配置方式：\n>   配置方式表示的意思是在我们的webpack.config.js文件中写明配置信息：\n>\n> 1. module.rules中允许我们配置多个loader（因为我们也会继续使用其他的loader，来完成其他文件的加载）；\n> 2. 这种方式可以更好的表示loader的配置，也方便后期的维护，同时也让你对各个Loader有一个全局的概览；\n>\n> * module.rules的配置如下：\n>   rules属性对应的值是一个数组：[Rule]\n>   数组中存放的是一个个的Rule，Rule是一个对象，对象中可以设置多个属性：\n>   test属性：用于对 resource（资源）进行匹配的，通常会设置成正则表达式；\n>   use属性：对应的值是一个数组：[UseEntry]\n>   UseEntry是一个对象，可以通过对象的属性来设置一些其他属性\n>   loader：必须有一个 loader属性，对应的值是一个字符串；\n>   options：可选的属性，值是一个字符串或者对象，值会被传入到loader中；\n>   query：目前已经使用options来替代；\n>   传递字符串（如：use: [ \'style-loader\' ]）是 loader 属性的简写方式（如：use: [ { loader: \'style-loader\'} ]）；\n>   loader属性： Rule.use: [ { loader } ] 的简写。\n> * 配置示例：\n>\n> ```javascript\n>   module: {\n>    rules: [\n>      {\n>        test: /\\.css$/,\n>        use: [\n>          {loader: \"style-loader\"},\n>          {loader: \"css-loader\"},\n>        ]\n>      },\n>      {\n>        test: /\\.less$/,\n>        use: [\n>          {loader: \"style-loader\"},\n>          {loader: \"css-loader\"},\n>         {loader: \"less-loader\"}\n>        ]\n>      }\n>    ]\n> }\n> ```\n>\n> 3. 若要使样式生效则需要安装style-loader\n> 4. 使用less完成编译转换\n>    ```npm install less -D```\n>    ``` npx lessc ./src/css/title.less title.css```\n\n> ### 三、postcss-loader的使用\n>\n> postcss可以帮助我们进行一些css的转换和适配，例如浏览器前缀或者css样式重叠\n>\n> 1. 安装：postcss工具\n>    ```npm install postcss postcss-cli -D```\n> 2. 编写一个需要添加前缀的css：\n> 3. ![screenshot.jpg](http://localhost:1118/files/screenshot/screenshot-17dc1efb1c6.png)\n>\n> ```css\n> .demo{\n>   user-select:none;\n> }\n> ```\n>\n> 3. 为postcss安装插件：\n>    ```npm install autoprefixer -D```\n> 4. 直接使用：\n>    ```npx postcss --use autoprefixer -o demo.css ./src/css/style.css```\n>    执行命令后会生成新文件demo.css,其中的样式为转化后的样式\n> 5. 安装postcss-loader:\n>    ```npm install postcss-loader -D```\n> 6. 在webpack.config.js中配置：\n>\n> ```js\n>      {\n>           loader: \"postcss-loader\",\n>           options: {\n>             postcssOptions: {\n>               plugins: [\n>                 require(\'autoprefixer\')\n>               ]\n>             }\n>           }\n>      }\n> ```\n>\n> 7. 单独的配置文件：\n>    在项目根目录新建postcss.config.js文件\n>\n> ```js\n> module.exports = {\n>   plugins: [\n>     require(\'autoprefixer\')\n>   ]\n> }\n> ```\n>\n> 然后只需要在webpack.config.js文件中：\n> module.rules.use中使用{loader: \"postcss-loader\"}\n\n> ### 四、plugin的使用\n>\n> 安装插件：CleanWebpackPlugin，使每次打包都自动帮我们删除上次打包的文件夹```npm install clean-webpack-plugin -D```\n>\n> * 使用方式：\n>\n> 1. 在webpack.config.js中导入插件\n>\n> ```js\n> const {CleanWebpackPlugin} = require(\"clean-webpack-plugin\");\n> ```\n>\n> 2. 在导出的对象中通过plugins属性来使用：\n>\n> ```js\n> plugins: [\n>    new CleanWebpackPlugin()\n> ]\n> ```\n\n> ### 五、babel的使用\n>\n> babel的作用是将ES6+、TypeScript等语法转化为ES5语法，兼容各浏览器babel 本身作为一个独立的工具（和postcss一样）在webpack中我们可以安装babel-loader更方便使用\n>\n>> @babel/core：babel的核心代码，必须安装\n>> @babel/cli：可以让我们在命令行中使用babel\n>>\n>\n> * 安装命令：\n>   ```npm install @babel/cli @babel/colr -D```\n> * 使用：\n>   ```npx babel src --out-dir dist```\n>   src： 是源文件目录。\n>   --out-dir： 指定要输出的文件夹dist\n>\n>> * 安装箭头函数转换相关插件：\n>>   ```npm install @babel/plugin-transform-arrow-functions -D```\n>>   使用插件：\n>>   ```npx babel src --out-dir dist --plugins=@babel/plugin-transform-arrow-functions```\n>>\n>\n>> * 安装变量定义转换插件（const、let转换为var）：\n>>   ```npm install @babel/plugin-transform-block-scoping -D ```\n>>   使用插件：\n>>   ```npx babel src --out-dir dist --plugins=@babel/plugin-transform-block-scoping,@babel/plugin-transform-arrow-functions```\n>>\n\n> ### 六、babel-loader的使用：\n>\n> 1. 安装相关依赖：\n>    ```npm install babel-loader @babel/core```\n>    如果安装过@babel/core,则不需要再次安装\n> 2. 配置规则，在加载js文件时使用babel：\n>\n> ```js\n> module.exports = {\n>   rules: [\n>           {\n>             test: /\\.m?js$/,\n>             use: {\n>               loader: \'babel-loader\'\n>             }\n>           }\n>         ]\n> }\n> ```\n> 3. 指定使用的插件：\n>\n> ```js\n> module.exports = {\n>  rules: [\n>          {\n>            test: /\\.m?js$/,\n>            use: {\n>              loader: \'babel-loader\'，\n>              options: {\n>                  plugins: [\n>                     \'@babel/plugin-transform-block-scoping\',\n>                     \'@babel/plugin-transform-arrow-functions\'\n>                  ]\n>              }\n>            }\n>          }\n>        ]\n> }\n> ```\n> 4. 使用babel-perset：\n>    webpack提供perset会根据我们的预设来加载对应的插件列表，并且将其传递给babel\n>    常见的预设有三个：\n>\n> * env\n> * react\n> * TypeScript\n>\n> 安装perset-env:\n> ```npm install @babel/preset-e```\n> 配置文件：\n> 和之前一样，我们可以将babel的配置信息放到一个独立的文件： babel.config.js中\n>\n> ```js\n> module.exports = {\n>   presets: [\n>     [\"@babel/preset-env\"]\n>   ]\n> }\n> ```\n', 1637662105, 1639636355);
INSERT INTO `mh_write` VALUES (18, 'http://localhost:1118/files/cover/cover-17dbc15ae02.png', 'test', 'aweadsd', 0, 0, '哈哈哈哈哈\n', 1639538088, 1639634089);
INSERT INTO `mh_write` VALUES (19, 'http://localhost:1118/files/cover/cover-17dbd08ad43.png', 'asdasd', NULL, 0, 0, NULL, 1639538997, 1639554006);
INSERT INTO `mh_write` VALUES (20, 'http://localhost:1118/files/cover/cover-17dbc31eb13.png', 'asdasd', 'asdasdas', 0, 0, NULL, 1639539933, 1639539933);
INSERT INTO `mh_write` VALUES (21, 'http://localhost:1118/files/cover/cover-17dbc31eb13.png', 'asdasd', 'asdasdas', 0, 0, NULL, 1639539952, 1639539952);
INSERT INTO `mh_write` VALUES (22, 'http://localhost:1118/files/cover/cover-17dbc31eb13.png', 'asdasd', 'asdasdas', 0, 0, 'asdasdasdasd\n\n123加哈哈哈\n', 1639543393, 1639634077);
INSERT INTO `mh_write` VALUES (30, 'http://localhost:1118/files/cover/cover-17dbd24437e.png', 'test文章', '这是一次测试文章', 0, 0, 'wqeqweqwe\n\n# 哈哈哈哈哈哈哈哈\n\nqweqwe\n\n## adsadas奥术大师多hhhhhhhhhhhhh\n\n# rfsaerwsef\n\ns#\n\nasdsf\n\nasdff\n\nadfsadfsd\n\nsdg\n\nfg\n\nsdgasdasd\n\nasdasd\n\nasdasd\n\nasdasdasdasdasdasdasdasdasdasdsad\n\nasdasdasdasdasdasdasd\n', 1639555821, 1639636148);
INSERT INTO `mh_write` VALUES (31, NULL, 'asdasdasd', NULL, 0, 0, '# webpack相关笔记\n\n> ### 一、webpack的配置\n>\n> ### hahaha\n>\n> 入口默认为：packageName/src/index.js\n> 出口默认为：packageName/dist/main.js\n> 如果需要修改配置则需要创建webpack.config.js文件\n>\n> ![screenshot.jpg](http://localhost:1118/files/screenshot/screenshot-17dcc27f5b4.png)\n\n> ### 二、loader的基本使用\n>\n> 1. 安装loader：\n>    ```npm install css-loader -D```\n> 2. 使用loader：\n>\n> * 方式一：内联方式：内联方式使用较少，因为不方便管理；\n>   在引入的样式前加上使用的loader，并使用!作为分隔符；\n>\n> ```javascript\n> import \"css-loader!../css/style.css\";\n> ```\n>\n> * 方式二：CLI方式：\n>   在webpack5的文档中已经没有了 ```--module-bind```\n>   实际应用中也比较少使用，因为不方便管理；\n> * 方式三：loader配置方式：\n>   配置方式表示的意思是在我们的webpack.config.js文件中写明配置信息：\n>\n> 1. module.rules中允许我们配置多个loader（因为我们也会继续使用其他的loader，来完成其他文件的加载）；\n> 2. 这种方式可以更好的表示loader的配置，也方便后期的维护，同时也让你对各个Loader有一个全局的概览；\n>\n> * module.rules的配置如下：\n>   rules属性对应的值是一个数组：[Rule]\n>   数组中存放的是一个个的Rule，Rule是一个对象，对象中可以设置多个属性：\n>   test属性：用于对 resource（资源）进行匹配的，通常会设置成正则表达式；\n>   use属性：对应的值是一个数组：[UseEntry]\n>   UseEntry是一个对象，可以通过对象的属性来设置一些其他属性\n>   loader：必须有一个 loader属性，对应的值是一个字符串；\n>   options：可选的属性，值是一个字符串或者对象，值会被传入到loader中；\n>   query：目前已经使用options来替代；\n>   传递字符串（如：use: [ \'style-loader\' ]）是 loader 属性的简写方式（如：use: [ { loader: \'style-loader\'} ]）；\n>   loader属性： Rule.use: [ { loader } ] 的简写。\n> * 配置示例：\n>\n> ```javascript\n>   module: {\n>    rules: [\n>      {\n>        test: /\\.css$/,\n>        use: [\n>          {loader: \"style-loader\"},\n>          {loader: \"css-loader\"},\n>        ]\n>      },\n>      {\n>        test: /\\.less$/,\n>        use: [\n>          {loader: \"style-loader\"},\n>          {loader: \"css-loader\"},\n>         {loader: \"less-loader\"}\n>        ]\n>      }\n>    ]\n> }\n> ```\n>\n> 3. 若要使样式生效则需要安装style-loader\n> 4. 使用less完成编译转换\n>    ```npm install less -D```\n>    ``` npx lessc ./src/css/title.less title.css```\n\n> ### 三、postcss-loader的使用\n>\n> postcss可以帮助我们进行一些css的转换和适配，例如浏览器前缀或者css样式重叠\n>\n> 1. 安装：postcss工具\n>    ```npm install postcss postcss-cli -D```\n> 2. 编写一个需要添加前缀的css：\n>\n> ```css\n> .demo{\n>   user-select:none;\n> }\n> ```\n>\n> 3. 为postcss安装插件：\n>    ```npm install autoprefixer -D```\n> 4. 直接使用：\n>    ```npx postcss --use autoprefixer -o demo.css ./src/css/style.css```\n>    执行命令后会生成新文件demo.css,其中的样式为转化后的样式\n> 5. 安装postcss-loader:\n>    ```npm install postcss-loader -D```\n> 6. 在webpack.config.js中配置：\n>\n> ```js\n>      {\n>           loader: \"postcss-loader\",\n>           options: {\n>             postcssOptions: {\n>               plugins: [\n>                 require(\'autoprefixer\')\n>               ]\n>             }\n>           }\n>      }\n> ```\n>\n> 7. 单独的配置文件：\n>    在项目根目录新建postcss.config.js文件\n>\n> ```js\n> module.exports = {\n>   plugins: [\n>     require(\'autoprefixer\')\n>   ]\n> }\n> ```\n>\n> 然后只需要在webpack.config.js文件中：\n> module.rules.use中使用{loader: \"postcss-loader\"}\n\n> ### 四、plugin的使用\n>\n> 安装插件：CleanWebpackPlugin，使每次打包都自动帮我们删除上次打包的文件夹```npm install clean-webpack-plugin -D```\n>\n> * 使用方式：\n>\n> 1. 在webpack.config.js中导入插件\n>\n> ```js\n> const {CleanWebpackPlugin} = require(\"clean-webpack-plugin\");\n> ```\n>\n> 2. 在导出的对象中通过plugins属性来使用：\n>\n> ```js\n> plugins: [\n>    new CleanWebpackPlugin()\n> ]\n> ```\n\n> ### 五、babel的使用\n>\n> babel的作用是将ES6+、TypeScript等语法转化为ES5语法，兼容各浏览器babel 本身作为一个独立的工具（和postcss一样）在webpack中我们可以安装babel-loader更方便使用\n>\n>> @babel/core：babel的核心代码，必须安装\n>> @babel/cli：可以让我们在命令行中使用babel\n>>\n>\n> * 安装命令：\n>   ```npm install @babel/cli @babel/colr -D```\n> * 使用：\n>   ```npx babel src --out-dir dist```\n>   src： 是源文件目录。\n>   --out-dir： 指定要输出的文件夹dist\n>\n>> * 安装箭头函数转换相关插件：\n>>   ```npm install @babel/plugin-transform-arrow-functions -D```\n>>   使用插件：\n>>   ```npx babel src --out-dir dist --plugins=@babel/plugin-transform-arrow-functions```\n>>\n>\n>> * 安装变量定义转换插件（const、let转换为var）：\n>>   ```npm install @babel/plugin-transform-block-scoping -D ```\n>>   使用插件：\n>>   ```npx babel src --out-dir dist --plugins=@babel/plugin-transform-block-scoping,@babel/plugin-transform-arrow-functions```\n>>\n\n> ### 六、babel-loader的使用：\n>\n> 1. 安装相关依赖：\n>    ```npm install babel-loader @babel/core```\n>    如果安装过@babel/core,则不需要再次安装\n> 2. 配置规则，在加载js文件时使用babel：\n>\n> ```js\n> module.exports = {\n>   rules: [\n>           {\n>             test: /\\.m?js$/,\n>             use: {\n>               loader: \'babel-loader\'\n>             }\n>           }\n>         ]\n> }\n> ```\n> 3. 指定使用的插件：\n>\n> ```js\n> module.exports = {\n>  rules: [\n>          {\n>            test: /\\.m?js$/,\n>            use: {\n>              loader: \'babel-loader\'，\n>              options: {\n>                  plugins: [\n>                     \'@babel/plugin-transform-block-scoping\',\n>                     \'@babel/plugin-transform-arrow-functions\'\n>                  ]\n>              }\n>            }\n>          }\n>        ]\n> }\n> ```\n> 4. 使用babel-perset：\n>    webpack提供perset会根据我们的预设来加载对应的插件列表，并且将其传递给babel\n>    常见的预设有三个：\n>\n> * env\n> * react\n> * TypeScript\n>\n> 安装perset-env:\n> ```npm install @babel/preset-e```\n> 配置文件：\n> 和之前一样，我们可以将babel的配置信息放到一个独立的文件： babel.config.js中\n>\n> ```js\n> module.exports = {\n>   presets: [\n>     [\"@babel/preset-env\"]\n>   ]\n> }\n> ```\n', 1639621534, 1639817141);

-- ----------------------------
-- Table structure for mh_write_moment
-- ----------------------------
DROP TABLE IF EXISTS `mh_write_moment`;
CREATE TABLE `mh_write_moment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '动态id',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `write_id` int NULL DEFAULT NULL COMMENT '文章id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '发表的内容',
  `created` int NULL DEFAULT NULL,
  `updated` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mh_write_moment
-- ----------------------------
INSERT INTO `mh_write_moment` VALUES (1, NULL, 19, 'php是世界上最好的语言~', 1628591017, 1628591017);
INSERT INTO `mh_write_moment` VALUES (2, NULL, 19, 'hello world~', 1628644563, 1628644563);
INSERT INTO `mh_write_moment` VALUES (3, NULL, 19, 'hello world~', 1628645085, 1628645085);

-- ----------------------------
-- Table structure for mh_write_relate_tag
-- ----------------------------
DROP TABLE IF EXISTS `mh_write_relate_tag`;
CREATE TABLE `mh_write_relate_tag`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_id` int NULL DEFAULT NULL,
  `write_id` int NULL DEFAULT NULL,
  `created` int NULL DEFAULT NULL,
  `updated` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mh_write_relate_tag
-- ----------------------------
INSERT INTO `mh_write_relate_tag` VALUES (19, 43, 19, 1639554006, 1639554006);
INSERT INTO `mh_write_relate_tag` VALUES (25, 41, 30, 1639555821, 1639555821);
INSERT INTO `mh_write_relate_tag` VALUES (26, 42, 30, 1639555821, 1639555821);
INSERT INTO `mh_write_relate_tag` VALUES (27, 47, 30, 1639555964, 1639555964);
INSERT INTO `mh_write_relate_tag` VALUES (28, 35, 31, 1639621534, 1639621534);
INSERT INTO `mh_write_relate_tag` VALUES (29, 37, 31, 1639621818, 1639621818);
INSERT INTO `mh_write_relate_tag` VALUES (30, 38, 31, 1639638230, 1639638230);
INSERT INTO `mh_write_relate_tag` VALUES (31, 41, 31, 1639638230, 1639638230);

-- ----------------------------
-- Table structure for mh_write_tag
-- ----------------------------
DROP TABLE IF EXISTS `mh_write_tag`;
CREATE TABLE `mh_write_tag`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created` int NULL DEFAULT NULL,
  `updated` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mh_write_tag
-- ----------------------------
INSERT INTO `mh_write_tag` VALUES (35, 'nodejs', 1639389115, 1639389115);
INSERT INTO `mh_write_tag` VALUES (37, 'css', 1639389156, 1639389156);
INSERT INTO `mh_write_tag` VALUES (38, 'html', 1639389161, 1639389161);
INSERT INTO `mh_write_tag` VALUES (41, 'vue2', 1639470646, 1639470646);
INSERT INTO `mh_write_tag` VALUES (42, 'vue3', 1639470649, 1639470649);
INSERT INTO `mh_write_tag` VALUES (43, 'react', 1639470658, 1639470658);
INSERT INTO `mh_write_tag` VALUES (44, 'webpack', 1639470688, 1639470688);
INSERT INTO `mh_write_tag` VALUES (45, '爬虫', 1639555834, 1639555834);
INSERT INTO `mh_write_tag` VALUES (46, 'axios', 1639555852, 1639555852);
INSERT INTO `mh_write_tag` VALUES (47, 'JavaScript', 1639555953, 1639555953);

SET FOREIGN_KEY_CHECKS = 1;

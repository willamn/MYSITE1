-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: truck_website
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add 资讯',7,'add_news'),(26,'Can change 资讯',7,'change_news'),(27,'Can delete 资讯',7,'delete_news'),(28,'Can view 资讯',7,'view_news'),(29,'Can add 产品',8,'add_truck'),(30,'Can change 产品',8,'change_truck'),(31,'Can delete 产品',8,'delete_truck'),(32,'Can view 产品',8,'view_truck'),(33,'Can add 产品类型',9,'add_category'),(34,'Can change 产品类型',9,'change_category'),(35,'Can delete 产品类型',9,'delete_category'),(36,'Can view 产品类型',9,'view_category'),(37,'Can add 论坛帖子',10,'add_post'),(38,'Can change 论坛帖子',10,'change_post'),(39,'Can delete 论坛帖子',10,'delete_post'),(40,'Can view 论坛帖子',10,'view_post'),(41,'Can add category',11,'add_category'),(42,'Can change category',11,'change_category'),(43,'Can delete category',11,'delete_category'),(44,'Can view category',11,'view_category'),(45,'Can add comment',12,'add_comment'),(46,'Can change comment',12,'change_comment'),(47,'Can delete comment',12,'delete_comment'),(48,'Can view comment',12,'view_comment'),(49,'Can add post',13,'add_post'),(50,'Can change post',13,'change_post'),(51,'Can delete post',13,'delete_post'),(52,'Can view post',13,'view_post'),(53,'Can add 点赞',14,'add_like'),(54,'Can change 点赞',14,'change_like'),(55,'Can delete 点赞',14,'delete_like'),(56,'Can view 点赞',14,'view_like'),(57,'Can add 收藏',15,'add_collect'),(58,'Can change 收藏',15,'change_collect'),(59,'Can delete 收藏',15,'delete_collect'),(60,'Can view 收藏',15,'view_collect'),(61,'Can add 论坛公告',16,'add_notice'),(62,'Can change 论坛公告',16,'change_notice'),(63,'Can delete 论坛公告',16,'delete_notice'),(64,'Can view 论坛公告',16,'view_notice'),(65,'Can add 发帖须知',17,'add_postrule'),(66,'Can change 发帖须知',17,'change_postrule'),(67,'Can delete 发帖须知',17,'delete_postrule'),(68,'Can view 发帖须知',17,'view_postrule'),(69,'Can add post image',18,'add_postimage'),(70,'Can change post image',18,'change_postimage'),(71,'Can delete post image',18,'delete_postimage'),(72,'Can view post image',18,'view_postimage'),(73,'Can add user profile',19,'add_userprofile'),(74,'Can change user profile',19,'change_userprofile'),(75,'Can delete user profile',19,'delete_userprofile'),(76,'Can view user profile',19,'view_userprofile'),(77,'Can add 用户会员信息',20,'add_usermember'),(78,'Can change 用户会员信息',20,'change_usermember'),(79,'Can delete 用户会员信息',20,'delete_usermember'),(80,'Can view 用户会员信息',20,'view_usermember'),(81,'Can add user profile',21,'add_userprofile'),(82,'Can change user profile',21,'change_userprofile'),(83,'Can delete user profile',21,'delete_userprofile'),(84,'Can view user profile',21,'view_userprofile'),(85,'Can add 功能权限',22,'add_permission'),(86,'Can change 功能权限',22,'change_permission'),(87,'Can delete 功能权限',22,'delete_permission'),(88,'Can view 功能权限',22,'view_permission'),(89,'Can add 用户会员资料',23,'add_userinfo'),(90,'Can change 用户会员资料',23,'change_userinfo'),(91,'Can delete 用户会员资料',23,'delete_userinfo'),(92,'Can view 用户会员资料',23,'view_userinfo'),(93,'Can add 系统角色',24,'add_role'),(94,'Can change 系统角色',24,'change_role'),(95,'Can delete 系统角色',24,'delete_role'),(96,'Can view 系统角色',24,'view_role'),(97,'Can add 角色绑定权限',25,'add_roleperm'),(98,'Can change 角色绑定权限',25,'change_roleperm'),(99,'Can delete 角色绑定权限',25,'delete_roleperm'),(100,'Can view 角色绑定权限',25,'view_roleperm'),(101,'Can add 用户绑定角色',26,'add_userrole'),(102,'Can change 用户绑定角色',26,'change_userrole'),(103,'Can delete 用户绑定角色',26,'delete_userrole'),(104,'Can view 用户绑定角色',26,'view_userrole'),(105,'Can add 合作开发计划',27,'add_cooperateinfo'),(106,'Can change 合作开发计划',27,'change_cooperateinfo'),(107,'Can delete 合作开发计划',27,'delete_cooperateinfo'),(108,'Can view 合作开发计划',27,'view_cooperateinfo'),(109,'Can add 开发者文档',28,'add_devdocument'),(110,'Can change 开发者文档',28,'change_devdocument'),(111,'Can delete 开发者文档',28,'delete_devdocument'),(112,'Can view 开发者文档',28,'view_devdocument'),(113,'Can add 开发工具包',29,'add_devtools'),(114,'Can change 开发工具包',29,'change_devtools'),(115,'Can delete 开发工具包',29,'delete_devtools'),(116,'Can view 开发工具包',29,'view_devtools');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$b5s0532J5Re9c7VdzJI3yh$66PfwGDQqw8/UQ8jhho/PoVSH+MqdAsPoTmh841Z4E8=','2026-05-24 16:02:42.791371',1,'admin','','','',1,1,'2026-04-23 05:59:42.264988'),(2,'pbkdf2_sha256$600000$SDEWcEDgQz6P5VlnaBUkJH$3CGv25XAAiqWpEM9yQYh9nN6ilPK4PRz9910vCPWIr0=','2026-05-24 11:38:02.034056',0,'17685161106','1111','','',0,1,'2026-05-10 12:09:00.000000'),(3,'pbkdf2_sha256$600000$VYW7A3SQ5qQDl8GVJXlOgs$KQmg0/vviAa2GejJq36OzfBUSeeXorr2AgtR5ZpO+1I=','2026-05-24 10:59:34.694664',0,'15121691232','2222','','',0,1,'2026-05-14 08:53:00.000000'),(4,'pbkdf2_sha256$600000$d0MrZGyUhwgRghNntOQuuo$wjZ56xDGxWWREMIwjS/dqmc/Yu2qMuoxUd2I/i4AZ6w=','2026-05-24 16:02:27.972534',0,'18722959236','3333','','',0,1,'2026-05-18 15:32:00.000000'),(5,'pbkdf2_sha256$600000$CYj6qUl7PqKUvXxwwwqgYr$z5ojmz2cHVS6KCMdIdfZFSSM8Na/BgbZdCyYuhdF160=','2026-05-19 10:44:50.040298',0,'19185068163','4444','','',0,1,'2026-05-19 09:06:19.055049');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-04-23 06:11:35.461562','1','重型牵引卡车',1,'[{\"added\": {}}]',9,1),(2,'2026-04-23 06:20:58.537788','2','工程作业专用车',1,'[{\"added\": {}}]',9,1),(3,'2026-04-23 06:24:14.104637','1','重型牵引卡车',1,'[{\"added\": {}}]',9,1),(4,'2026-04-23 06:24:17.017740','1','长途干线重载牵引车',1,'[{\"added\": {}}]',8,1),(5,'2026-04-23 06:24:27.298039','2','重型牵引卡车',1,'[{\"added\": {}}]',9,1),(6,'2026-04-23 06:24:46.810295','2','重型牵引卡车',3,'',9,1),(7,'2026-04-23 06:24:53.086961','1','重型牵引卡车',2,'[]',9,1),(8,'2026-04-23 06:25:58.254433','2','标载高效物流牵引车',1,'[{\"added\": {}}]',8,1),(9,'2026-04-23 06:26:30.394204','3','山区爬坡专用牵引车',1,'[{\"added\": {}}]',8,1),(10,'2026-04-23 06:27:07.122314','4','轻量化干线牵引车',1,'[{\"added\": {}}]',8,1),(11,'2026-04-23 06:27:40.401418','5','长途旗舰舒适牵引车',1,'[{\"added\": {}}]',8,1),(12,'2026-04-23 06:28:16.850596','6','港口专用倒短牵引车',1,'[{\"added\": {}}]',8,1),(13,'2026-04-23 06:28:31.361203','3','工程作业专用车',1,'[{\"added\": {}}]',9,1),(14,'2026-04-23 06:28:46.102742','4','城市配送轻卡',1,'[{\"added\": {}}]',9,1),(15,'2026-04-23 06:28:50.471930','5','特种专用作业车',1,'[{\"added\": {}}]',9,1),(16,'2026-04-23 06:28:57.186506','6','车载配套零配件',1,'[{\"added\": {}}]',9,1),(17,'2026-04-23 06:29:02.712674','7','智能新能源车型',1,'[{\"added\": {}}]',9,1),(18,'2026-04-23 06:29:48.540994','7','大型工程自卸车',1,'[{\"added\": {}}]',8,1),(19,'2026-04-23 06:30:21.702018','8','混凝土搅拌运输车',1,'[{\"added\": {}}]',8,1),(20,'2026-04-23 06:31:01.640182','9','随车起重工程车',1,'[{\"added\": {}}]',8,1),(21,'2026-04-23 06:31:38.558254','10','大型吊车底盘车',1,'[{\"added\": {}}]',8,1),(22,'2026-04-23 06:33:00.790316','11','挖掘运输一体工程车',1,'[{\"added\": {}}]',8,1),(23,'2026-04-23 06:33:31.117473','12','公路养护作业车',1,'[{\"added\": {}}]',8,1),(24,'2026-04-23 06:34:08.166434','13','城配标准厢式轻卡',1,'[{\"added\": {}}]',8,1),(25,'2026-04-23 06:34:51.331967','14','冷藏保鲜配送轻卡',1,'[{\"added\": {}}]',8,1),(26,'2026-04-23 06:35:20.860474','15','平板短途运输轻卡',1,'[{\"added\": {}}]',8,1),(27,'2026-04-23 06:35:54.065937','16','高栏载重载货轻卡',1,'[{\"added\": {}}]',8,1),(28,'2026-04-23 06:36:21.753866','17','窄体巷运小微轻卡',1,'[{\"added\": {}}]',8,1),(29,'2026-04-23 06:36:44.280558','18','仓栅式城市轻卡',1,'[{\"added\": {}}]',8,1),(30,'2026-04-23 06:37:10.039737','19','大型高空作业车',1,'[{\"added\": {}}]',8,1),(31,'2026-04-23 06:38:01.913109','20','应急抢险救援车',1,'[{\"added\": {}}]',8,1),(32,'2026-04-23 06:38:31.781086','21','消防专用水罐车',1,'[{\"added\": {}}]',8,1),(33,'2026-04-23 06:39:05.188773','22','环卫洗扫一体车',1,'[{\"added\": {}}]',8,1),(34,'2026-04-23 06:39:55.737246','23','危化品专用运输车',1,'[{\"added\": {}}]',8,1),(35,'2026-04-23 06:40:30.873367','24','清障救援拖车',1,'[{\"added\": {}}]',8,1),(36,'2026-04-23 06:41:00.946953','25','重载专用原厂轮胎',1,'[{\"added\": {}}]',8,1),(37,'2026-04-23 06:41:28.370121','26','高性能柴油发动机总成',1,'[{\"added\": {}}]',8,1),(38,'2026-04-23 06:41:52.496834','27','车载智能导航车机',1,'[{\"added\": {}}]',8,1),(39,'2026-04-23 06:42:18.544101','28','加厚耐磨钢板弹簧',1,'[{\"added\": {}}]',8,1),(40,'2026-04-23 06:42:41.298925','29','专用车载驻车空调',1,'[{\"added\": {}}]',8,1),(41,'2026-04-23 06:43:03.259028','30','原厂专用变速箱配件',1,'[{\"added\": {}}]',8,1),(42,'2026-04-23 06:43:27.925309','31','纯电干线重卡牵引车',1,'[{\"added\": {}}]',8,1),(43,'2026-04-23 06:44:14.034692','32','混动节能工程重卡',1,'[{\"added\": {}}]',8,1),(44,'2026-04-23 06:44:43.159981','33','纯电城市配送轻卡',1,'[{\"added\": {}}]',8,1),(45,'2026-04-23 06:45:15.737223','34','氢燃料智能牵引车',1,'[{\"added\": {}}]',8,1),(46,'2026-04-23 06:45:43.465167','35','新能源冷藏配送车',1,'[{\"added\": {}}]',8,1),(47,'2026-04-23 06:46:17.311956','36','智能自动驾驶物流车',1,'[{\"added\": {}}]',8,1),(48,'2026-04-23 07:35:13.614037','34','氢燃料智能牵引车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u7c7b\\u578b\"]}}]',8,1),(49,'2026-04-23 09:03:46.786827','1','史上最强改装方案',1,'[{\"added\": {}}]',10,1),(50,'2026-04-23 09:09:52.511466','1','史上最强改装方案',2,'[]',10,1),(51,'2026-04-23 09:12:10.807232','1','史上最强改装方案',2,'[]',10,1),(52,'2026-04-23 09:54:10.056848','1','史上最强改装方案',1,'[{\"added\": {}}]',13,1),(53,'2026-04-23 10:13:06.768116','1','整车改装专区',1,'[{\"added\": {}}]',11,1),(54,'2026-04-23 10:13:17.226422','2','技术经验交流',1,'[{\"added\": {}}]',11,1),(55,'2026-04-23 10:13:25.617458','3','维修保养求助',1,'[{\"added\": {}}]',11,1),(56,'2026-04-23 10:13:32.046246','4','行业资讯动态',1,'[{\"added\": {}}]',11,1),(57,'2026-04-23 10:13:38.518610','5','新车测评分享',1,'[{\"added\": {}}]',11,1),(58,'2026-04-23 10:13:44.661089','6','闲聊灌水杂谈',1,'[{\"added\": {}}]',11,1),(59,'2026-04-23 10:14:05.112336','1','史上最强改装方案',2,'[{\"changed\": {\"fields\": [\"\\u6240\\u5c5e\\u5206\\u7c7b\"]}}]',13,1),(60,'2026-04-24 05:36:12.312071','1','长途干线重载牵引车',2,'[{\"changed\": {\"fields\": [\"\\u56fe\\u7247\\u94fe\\u63a5\"]}}]',8,1),(61,'2026-04-24 05:43:23.407487','1','长途干线重载牵引车',2,'[{\"changed\": {\"fields\": [\"\\u56fe\\u7247\\u94fe\\u63a5\"]}}]',8,1),(62,'2026-04-24 05:43:47.928771','1','长途干线重载牵引车',2,'[{\"changed\": {\"fields\": [\"\\u56fe\\u7247\\u94fe\\u63a5\"]}}]',8,1),(63,'2026-04-24 06:11:40.629910','1','长途干线重载牵引车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(64,'2026-04-24 06:12:09.432100','1','长途干线重载牵引车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(65,'2026-04-24 06:12:58.334285','1','长途干线重载牵引车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(66,'2026-04-24 06:13:10.889692','1','长途干线重载牵引车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(67,'2026-04-24 06:13:43.783979','1','长途干线重载牵引车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(68,'2026-04-24 06:20:17.596615','2','标载高效物流牵引车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(69,'2026-04-24 06:28:36.175424','2','标载高效物流牵引车',2,'[]',8,1),(70,'2026-04-24 06:28:42.106236','2','标载高效物流牵引车',2,'[]',8,1),(71,'2026-04-24 06:48:56.782113','3','山区爬坡专用牵引车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(72,'2026-04-24 06:49:07.688440','4','轻量化干线牵引车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(73,'2026-04-24 06:49:16.897613','5','长途旗舰舒适牵引车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(74,'2026-04-24 06:49:26.184277','6','港口专用倒短牵引车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(75,'2026-04-24 06:49:37.499827','7','大型工程自卸车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(76,'2026-04-24 06:50:02.483028','8','混凝土搅拌运输车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(77,'2026-04-24 06:50:13.434305','9','随车起重工程车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(78,'2026-04-24 06:50:26.636704','10','大型吊车底盘车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(79,'2026-04-24 06:50:47.097907','10','大型吊车底盘车',2,'[]',8,1),(80,'2026-04-24 06:50:58.956651','11','挖掘运输一体工程车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(81,'2026-04-24 06:51:17.487040','12','公路养护作业车',2,'[]',8,1),(82,'2026-04-24 06:51:29.768375','7','大型工程自卸车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(83,'2026-04-24 06:51:48.398046','8','混凝土搅拌运输车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(84,'2026-04-24 06:52:04.111083','9','随车起重工程车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(85,'2026-04-24 06:52:10.840779','10','大型吊车底盘车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(86,'2026-04-24 06:52:20.066328','11','挖掘运输一体工程车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(87,'2026-04-24 06:52:32.963601','12','公路养护作业车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(88,'2026-04-24 06:53:15.190551','13','城配标准厢式轻卡',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(89,'2026-04-24 06:53:24.506649','14','冷藏保鲜配送轻卡',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(90,'2026-04-24 06:53:34.860385','15','平板短途运输轻卡',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(91,'2026-04-24 06:53:45.648176','16','高栏载重载货轻卡',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(92,'2026-04-24 06:53:55.489243','17','窄体巷运小微轻卡',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(93,'2026-04-24 06:54:03.440361','18','仓栅式城市轻卡',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(94,'2026-04-24 06:54:16.337414','19','大型高空作业车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(95,'2026-04-24 06:54:23.833814','20','应急抢险救援车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(96,'2026-04-24 06:54:31.797451','21','消防专用水罐车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(97,'2026-04-24 06:54:38.273889','22','环卫洗扫一体车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(98,'2026-04-24 06:54:44.085546','23','危化品专用运输车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(99,'2026-04-24 06:55:12.832983','24','清障救援拖车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(100,'2026-04-24 06:55:30.762869','25','重载专用原厂轮胎',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(101,'2026-04-24 06:55:40.782474','26','高性能柴油发动机总成',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(102,'2026-04-24 06:55:50.545043','27','车载智能导航车机',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(103,'2026-04-24 06:55:58.208196','28','加厚耐磨钢板弹簧',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(104,'2026-04-24 06:56:05.576355','29','专用车载驻车空调',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(105,'2026-04-24 06:56:12.357104','30','原厂专用变速箱配件',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(106,'2026-04-24 06:56:19.891926','30','原厂专用变速箱配件',2,'[]',8,1),(107,'2026-04-24 06:56:26.369889','29','专用车载驻车空调',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(108,'2026-04-24 06:56:32.670811','30','原厂专用变速箱配件',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(109,'2026-04-24 06:56:55.472638','31','纯电干线重卡牵引车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(110,'2026-04-24 06:57:03.671547','32','混动节能工程重卡',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(111,'2026-04-24 06:57:09.184288','33','纯电城市配送轻卡',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(112,'2026-04-24 06:57:16.484392','34','氢燃料智能牵引车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(113,'2026-04-24 06:57:21.633385','35','新能源冷藏配送车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(114,'2026-04-24 06:57:28.998255','36','智能自动驾驶物流车',2,'[{\"changed\": {\"fields\": [\"\\u4ea7\\u54c1\\u4e0a\\u4f20\\u56fe\\u7247\"]}}]',8,1),(115,'2026-04-24 14:10:04.028787','34','氢燃料智能牵引车',2,'[]',8,1),(116,'2026-04-24 15:02:47.260325','1','智能重载机器人卡车正式落地工业物流场景，开启无人运输新时代',1,'[{\"added\": {}}]',7,1),(117,'2026-04-24 15:08:21.749563','2','突破技术壁垒！国产智能卡车实现复杂地形自适应稳定行驶',1,'[{\"added\": {}}]',7,1),(118,'2026-04-24 15:08:56.788692','3','绿色智造赋能未来，智能新能源机器人卡车正式批量交付',1,'[{\"added\": {}}]',7,1),(119,'2026-04-24 15:30:17.558981','1','智能重载机器人卡车正式落地工业物流场景，开启无人运输新时代',2,'[{\"changed\": {\"fields\": [\"\\u8d44\\u8baf\\u5c01\\u9762\\u56fe\\u7247\"]}}]',7,1),(120,'2026-04-24 15:30:25.473276','2','突破技术壁垒！国产智能卡车实现复杂地形自适应稳定行驶',2,'[{\"changed\": {\"fields\": [\"\\u8d44\\u8baf\\u5c01\\u9762\\u56fe\\u7247\"]}}]',7,1),(121,'2026-04-24 15:30:31.419672','3','绿色智造赋能未来，智能新能源机器人卡车正式批量交付',2,'[{\"changed\": {\"fields\": [\"\\u8d44\\u8baf\\u5c01\\u9762\\u56fe\\u7247\"]}}]',7,1),(122,'2026-04-24 15:44:52.981962','4','新一代智能机器人卡车完成极端低温测试，性能稳定可靠',1,'[{\"added\": {}}]',7,1),(123,'2026-04-24 15:45:29.952534','5','智能机器人卡车实现多车协同编队，运输效率大幅提升',1,'[{\"added\": {}}]',7,1),(124,'2026-04-24 15:45:57.672148','6','机器人卡车智能防撞系统升级，安全性再上新台阶',1,'[{\"added\": {}}]',7,1),(125,'2026-04-24 15:46:31.217185','7','全国首条机器人卡车无人运输专线正式投入运营',1,'[{\"added\": {}}]',7,1),(126,'2026-04-24 15:51:41.979647','4','新一代智能机器人卡车完成极端低温测试，性能稳定可靠',2,'[{\"changed\": {\"fields\": [\"\\u8d44\\u8baf\\u5c01\\u9762\\u56fe\\u7247\"]}}]',7,1),(127,'2026-04-24 15:51:49.919948','5','智能机器人卡车实现多车协同编队，运输效率大幅提升',2,'[{\"changed\": {\"fields\": [\"\\u8d44\\u8baf\\u5c01\\u9762\\u56fe\\u7247\"]}}]',7,1),(128,'2026-04-24 15:51:57.416693','6','机器人卡车智能防撞系统升级，安全性再上新台阶',2,'[{\"changed\": {\"fields\": [\"\\u8d44\\u8baf\\u5c01\\u9762\\u56fe\\u7247\"]}}]',7,1),(129,'2026-04-24 15:52:04.991975','7','全国首条机器人卡车无人运输专线正式投入运营',2,'[{\"changed\": {\"fields\": [\"\\u8d44\\u8baf\\u5c01\\u9762\\u56fe\\u7247\"]}}]',7,1),(130,'2026-05-12 08:33:47.213683','2','刚入坑智能机器人卡车，新手入门求带！',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(131,'2026-05-12 08:35:54.903697','2','刚入坑智能机器人卡车，新手入门求带！',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(132,'2026-05-12 10:05:47.636127','1','刚入坑智能机器人卡车，新手入门求带！',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(133,'2026-05-12 10:14:54.684257','1','刚入坑智能机器人卡车，新手入门求带！',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(134,'2026-05-14 07:14:21.443291','1','【社区公告】论坛交流规范正式发布，请所有用户遵守',1,'[{\"added\": {}}]',16,1),(135,'2026-05-14 09:37:33.977113','2','【开箱测评】入门款智能机器人卡车开箱 + 首次上手体验',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(136,'2026-05-14 09:53:58.168945','3','【对比测评】两款热门入门智能机器人卡车怎么选？帮你避坑！',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(137,'2026-05-14 10:07:35.114108','1','刚入坑智能机器人卡车，新手入门求带！',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u5185\\u5bb9\", \"\\u53d1\\u5e03\\u8005\"]}}]',13,1),(138,'2026-05-14 10:19:53.594385','7','【长期测评】我的智能机器人卡车用了 3 个月，真实使用感受',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(139,'2026-05-14 10:20:19.946998','6','【长期测评】我的智能机器人卡车用了 3 个月，真实使用感受',3,'',13,1),(140,'2026-05-14 10:20:25.024188','5','【长期测评】我的智能机器人卡车用了 3 个月，真实使用感受',3,'',13,1),(141,'2026-05-14 10:20:31.329846','4','【长期测评】我的智能机器人卡车用了 3 个月，真实使用感受',3,'',13,1),(142,'2026-05-14 10:22:03.951888','8','【对比测评】两款热门入门智能机器人卡车怎么选？帮你避坑！',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(143,'2026-05-14 10:22:27.078274','3','【对比测评】两款热门入门智能机器人卡车怎么选？帮你避坑！',3,'',13,1),(144,'2026-05-14 10:32:37.957701','9','【新品测评】刚发布的新款智能机器人卡车，上手体验 + 功能详解',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(145,'2026-05-14 10:47:48.004249','13','【保养教程】智能机器人卡车日常维护清单，新手也能做',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(146,'2026-05-14 10:47:48.005613','12','【维修分享】自己动手修好机器人卡车的轮胎卡顿问题，附教程',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(147,'2026-05-14 10:47:48.006532','11','【故障求助】我的机器人卡车传感器失灵了，怎么办？',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(148,'2026-05-14 10:47:48.008252','10','【保养心得】智能机器人卡车电池保养技巧，延长续航和寿命',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(149,'2026-05-15 15:40:36.795612','14','【改装分享】给我的机器人卡车加装了机械臂，实现抓取功能！',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(150,'2026-05-15 15:40:44.978356','17','【外观改装】给我的机器人卡车做了个 “机甲风” 外壳，附过程',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(151,'2026-05-15 15:40:44.979396','16','【改装教程】低成本给机器人卡车升级摄像头，实现高清视频回传',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(152,'2026-05-15 15:40:44.980245','15','【改装求助】想给机器人卡车加个电池扩容，有没有靠谱的方案？',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(153,'2026-05-15 15:41:26.546099','17','【外观改装】给我的机器人卡车做了个 “机甲风” 外壳，附过程',3,'',13,1),(154,'2026-05-15 15:42:12.987448','18','【外观改装】给我的机器人卡车做了个 “机甲风” 外壳，附过程',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(155,'2026-05-15 15:45:57.773020','21','【求助】新手想入手智能机器人卡车，求推荐入门款！',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(156,'2026-05-15 15:45:57.774132','20','【日常分享】周末带着我的机器人卡车去户外跑了一圈，太爽了！',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(157,'2026-05-15 15:45:57.775010','19','【闲聊】大家都是怎么接触到智能机器人卡车的？来聊聊！',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(158,'2026-05-15 15:46:50.331557','1','[新手入坑]刚入坑智能机器人卡车，新手入门求带！',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u6807\\u9898\"]}}]',13,1),(159,'2026-05-15 15:47:09.542754','1','【新手入坑】刚入坑智能机器人卡车，新手入门求带！',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u6807\\u9898\"]}}]',13,1),(160,'2026-05-15 15:50:04.939982','25','【求助】ROS 环境下机器人卡车的底盘控制代码报错，怎么解决？',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(161,'2026-05-15 15:50:04.941052','24','【求助】给机器人卡车加装了摄像头，无法实时传输画面怎么办？',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(162,'2026-05-15 15:50:04.941946','23','【求助】机器人卡车跑路径规划算法时老是跑偏怎么办？',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(163,'2026-05-15 15:50:04.942837','22','【求助】Django 对接机器人卡车的 API，老是连不上怎么办？',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(164,'2026-05-15 15:52:38.557066','29','【技术讨论】智能机器人卡车的避障方案，大家都是用哪种？',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(165,'2026-05-15 15:52:38.558216','28','【经验交流】给智能机器人卡车做 SLAM 建图的踩坑记录',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(166,'2026-05-15 15:52:38.559145','27','【项目分享】用智能机器人卡车做的园区巡检系统，附完整方案',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(167,'2026-05-15 15:52:38.560026','26','【技术分享】智能机器人卡车的基础路径规划算法入门教程',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(168,'2026-05-15 17:30:32.754493','29','【技术讨论】智能机器人卡车的避障方案，大家都是用哪种？',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u5185\\u5bb9\", \"\\u53d1\\u5e03\\u8005\"]}}]',13,1),(169,'2026-05-17 15:38:28.362415','3','15121691232',2,'[{\"changed\": {\"fields\": [\"Last login\"]}}, {\"added\": {\"name\": \"\\u7528\\u6237\\u4f1a\\u5458\\u4fe1\\u606f\", \"object\": \"15121691232-\\u666e\\u901a\\u4f1a\\u5458\"}}]',4,1),(170,'2026-05-18 08:09:31.573893','3','15121691232',2,'[{\"changed\": {\"fields\": [\"Last login\"]}}, {\"added\": {\"name\": \"\\u7528\\u6237\\u4f1a\\u5458\\u4fe1\\u606f\", \"object\": \"15121691232-\\u666e\\u901a\\u4f1a\\u5458\"}}]',4,1),(171,'2026-05-18 09:09:01.313604','3','15121691232',2,'[{\"changed\": {\"fields\": [\"Last login\"]}}]',4,1),(172,'2026-05-18 09:25:50.208293','3','15121691232',2,'[]',4,1),(173,'2026-05-18 15:20:30.128096','3','15121691232',2,'[{\"changed\": {\"fields\": [\"Last login\"]}}]',4,1),(174,'2026-05-18 15:20:43.644773','2','17685161106',2,'[{\"changed\": {\"fields\": [\"Last login\"]}}, {\"added\": {\"name\": \"\\u7528\\u6237\\u4f1a\\u5458\\u4fe1\\u606f\", \"object\": \"17685161106-\\u666e\\u901a\\u4f1a\\u5458\"}}]',4,1),(175,'2026-05-18 16:10:42.154458','3','15121691232',2,'[{\"changed\": {\"fields\": [\"Last login\"]}}, {\"changed\": {\"name\": \"\\u7528\\u6237\\u4f1a\\u5458\\u4fe1\\u606f\", \"object\": \"15121691232-\\u8d85\\u7ea7\\u4f1a\\u5458\", \"fields\": [\"\\u4f1a\\u5458\\u7b49\\u7ea7\"]}}]',4,1),(176,'2026-05-18 16:10:49.463666','2','17685161106',2,'[{\"changed\": {\"fields\": [\"Last login\"]}}]',4,1),(177,'2026-05-18 16:10:59.503016','4','18722959236',2,'[{\"changed\": {\"fields\": [\"Last login\"]}}, {\"changed\": {\"name\": \"\\u7528\\u6237\\u4f1a\\u5458\\u4fe1\\u606f\", \"object\": \"18722959236-\\u81f3\\u5c0a\\u4f1a\\u5458\", \"fields\": [\"\\u4f1a\\u5458\\u7b49\\u7ea7\"]}}]',4,1),(178,'2026-05-18 16:11:09.868052','3','15121691232',2,'[]',4,1),(179,'2026-05-18 16:11:39.249591','2','17685161106',2,'[{\"changed\": {\"fields\": [\"Last login\"]}}]',4,1),(180,'2026-05-18 17:12:53.064470','4','18722959236',2,'[{\"changed\": {\"fields\": [\"Last login\"]}}]',4,1),(181,'2026-05-19 04:17:35.553913','2','17685161106',2,'[{\"changed\": {\"fields\": [\"Last login\"]}}, {\"changed\": {\"name\": \"\\u7528\\u6237\\u4f1a\\u5458\\u4fe1\\u606f\", \"object\": \"17685161106-\\u8d85\\u7ea7\\u4f1a\\u5458\", \"fields\": [\"\\u4f1a\\u5458\\u7b49\\u7ea7\"]}}]',4,1),(182,'2026-05-19 04:17:41.483148','4','18722959236',2,'[{\"changed\": {\"fields\": [\"Last login\"]}}]',4,1),(183,'2026-05-19 04:27:53.997411','4','18722959236',2,'[{\"changed\": {\"fields\": [\"\\u4f1a\\u5458\\u7b49\\u7ea7\"]}}]',21,1),(184,'2026-05-19 04:28:19.172353','2','17685161106',2,'[{\"changed\": {\"fields\": [\"\\u4f1a\\u5458\\u7b49\\u7ea7\"]}}]',21,1),(185,'2026-05-19 04:29:09.231098','3','15121691232',2,'[{\"changed\": {\"fields\": [\"\\u4f1a\\u5458\\u7b49\\u7ea7\"]}}]',21,1),(186,'2026-05-19 04:29:21.795507','4','18722959236',2,'[{\"changed\": {\"fields\": [\"\\u4f1a\\u5458\\u7b49\\u7ea7\"]}}]',21,1),(187,'2026-05-19 04:29:28.170955','1','admin',2,'[]',21,1),(188,'2026-05-19 04:29:39.379828','4','18722959236',2,'[]',21,1),(189,'2026-05-19 04:29:44.592503','2','17685161106',2,'[{\"changed\": {\"fields\": [\"\\u4f1a\\u5458\\u7b49\\u7ea7\"]}}]',21,1),(190,'2026-05-19 04:29:51.229148','3','15121691232',2,'[{\"changed\": {\"fields\": [\"\\u4f1a\\u5458\\u7b49\\u7ea7\"]}}]',21,1),(191,'2026-05-19 04:29:55.836295','4','18722959236',2,'[]',21,1),(192,'2026-05-19 08:51:37.489444','1','游客',1,'[{\"added\": {}}]',24,1),(193,'2026-05-19 08:51:48.700967','2','普通用户',1,'[{\"added\": {}}]',24,1),(194,'2026-05-19 08:51:56.081075','3','普通会员',1,'[{\"added\": {}}]',24,1),(195,'2026-05-19 08:52:04.891726','4','超级会员',1,'[{\"added\": {}}]',24,1),(196,'2026-05-19 08:52:11.731582','5','至尊会员',1,'[{\"added\": {}}]',24,1),(197,'2026-05-19 08:52:58.490443','1','浏览内容',1,'[{\"added\": {}}]',22,1),(198,'2026-05-19 08:53:09.364779','2','发帖',1,'[{\"added\": {}}]',22,1),(199,'2026-05-19 08:53:25.226562','3','点赞评论',1,'[{\"added\": {}}]',22,1),(200,'2026-05-19 08:53:36.708835','4','每日下载 5 次',1,'[{\"added\": {}}]',22,1),(201,'2026-05-19 08:53:47.688860','5','每日下载 10 次',1,'[{\"added\": {}}]',22,1),(202,'2026-05-19 08:53:59.322399','6','无限下载',1,'[{\"added\": {}}]',22,1),(203,'2026-05-19 08:54:09.441443','7','发帖免审核',1,'[{\"added\": {}}]',22,1),(204,'2026-05-19 08:54:39.285024','1','RolePerm object (1)',1,'[{\"added\": {}}]',25,1),(205,'2026-05-19 08:56:03.617554','2','RolePerm object (2)',1,'[{\"added\": {}}]',25,1),(206,'2026-05-19 08:56:07.796082','3','RolePerm object (3)',1,'[{\"added\": {}}]',25,1),(207,'2026-05-19 08:56:20.492968','3','RolePerm object (3)',2,'[]',25,1),(208,'2026-05-19 08:57:03.964835','4','RolePerm object (4)',1,'[{\"added\": {}}]',25,1),(209,'2026-05-19 08:57:14.121965','5','RolePerm object (5)',1,'[{\"added\": {}}]',25,1),(210,'2026-05-19 08:57:22.389903','6','RolePerm object (6)',1,'[{\"added\": {}}]',25,1),(211,'2026-05-19 08:57:27.857302','7','RolePerm object (7)',1,'[{\"added\": {}}]',25,1),(212,'2026-05-19 08:57:33.162045','6','RolePerm object (6)',2,'[]',25,1),(213,'2026-05-19 08:57:43.207910','7','RolePerm object (7)',2,'[]',25,1),(214,'2026-05-19 08:57:50.404634','8','RolePerm object (8)',1,'[{\"added\": {}}]',25,1),(215,'2026-05-19 08:57:58.309118','9','RolePerm object (9)',1,'[{\"added\": {}}]',25,1),(216,'2026-05-19 08:58:06.864775','10','RolePerm object (10)',1,'[{\"added\": {}}]',25,1),(217,'2026-05-19 08:58:19.547518','11','RolePerm object (11)',1,'[{\"added\": {}}]',25,1),(218,'2026-05-19 08:58:26.101943','12','RolePerm object (12)',1,'[{\"added\": {}}]',25,1),(219,'2026-05-19 08:58:32.201160','13','RolePerm object (13)',1,'[{\"added\": {}}]',25,1),(220,'2026-05-19 08:58:37.877102','14','RolePerm object (14)',1,'[{\"added\": {}}]',25,1),(221,'2026-05-19 08:58:43.698054','15','RolePerm object (15)',1,'[{\"added\": {}}]',25,1),(222,'2026-05-19 08:58:51.933647','16','RolePerm object (16)',1,'[{\"added\": {}}]',25,1),(223,'2026-05-19 08:58:57.485032','17','RolePerm object (17)',1,'[{\"added\": {}}]',25,1),(224,'2026-05-19 09:04:45.377688','1','UserRole object (1)',1,'[{\"added\": {}}]',26,1),(225,'2026-05-19 09:21:31.699338','1','19185068163',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u7b49\\u7ea7\"]}}]',23,1),(226,'2026-05-19 09:22:33.213878','30','11',3,'',13,1),(227,'2026-05-19 09:42:56.757244','3','17685161106',2,'[]',23,1),(228,'2026-05-19 09:43:02.903844','4','15121691232',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u7b49\\u7ea7\"]}}]',23,1),(229,'2026-05-19 09:43:12.714629','5','18722959236',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u7b49\\u7ea7\"]}}]',23,1),(230,'2026-05-19 09:43:17.087319','1','19185068163',2,'[]',23,1),(231,'2026-05-19 09:53:17.807687','8','【对比测评】两款热门入门智能机器人卡车怎么选？帮你避坑！',2,'[{\"changed\": {\"fields\": [\"\\u53d1\\u5e03\\u8005\"]}}]',13,1),(232,'2026-05-19 10:14:36.697906','2','admin',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u7b49\\u7ea7\"]}}]',23,1),(233,'2026-05-19 10:33:50.963674','1','19185068163',2,'[]',23,1),(234,'2026-05-19 11:43:23.328019','1','UserRole object (1)',2,'[]',26,1),(235,'2026-05-19 11:43:32.005244','1','UserRole object (1)',2,'[]',26,1),(236,'2026-05-19 11:43:43.208674','1','UserRole object (1)',2,'[]',26,1),(237,'2026-05-19 11:43:51.119925','2','UserRole object (2)',1,'[{\"added\": {}}]',26,1),(238,'2026-05-19 11:44:02.938545','3','UserRole object (3)',1,'[{\"added\": {}}]',26,1),(239,'2026-05-19 11:45:25.226965','29','【技术讨论】智能机器人卡车的避障方案，大家都是用哪种？',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(240,'2026-05-19 11:45:25.228506','28','【经验交流】给智能机器人卡车做 SLAM 建图的踩坑记录',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(241,'2026-05-19 11:45:25.229893','27','【项目分享】用智能机器人卡车做的园区巡检系统，附完整方案',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(242,'2026-05-19 11:45:25.231113','26','【技术分享】智能机器人卡车的基础路径规划算法入门教程',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(243,'2026-05-19 11:45:25.232230','25','【求助】ROS 环境下机器人卡车的底盘控制代码报错，怎么解决？',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(244,'2026-05-19 11:45:25.233341','24','【求助】给机器人卡车加装了摄像头，无法实时传输画面怎么办？',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(245,'2026-05-19 11:45:25.234609','23','【求助】机器人卡车跑路径规划算法时老是跑偏怎么办？',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(246,'2026-05-19 11:45:25.235921','22','【求助】Django 对接机器人卡车的 API，老是连不上怎么办？',2,'[{\"changed\": {\"fields\": [\"\\u5e16\\u5b50\\u72b6\\u6001\"]}}]',13,1),(247,'2026-05-19 11:46:37.392914','28','【经验交流】给智能机器人卡车做 SLAM 建图的踩坑记录',2,'[{\"changed\": {\"fields\": [\"\\u53d1\\u5e03\\u8005\"]}}]',13,1),(248,'2026-05-19 11:46:47.062798','27','【项目分享】用智能机器人卡车做的园区巡检系统，附完整方案',2,'[{\"changed\": {\"fields\": [\"\\u53d1\\u5e03\\u8005\"]}}]',13,1),(249,'2026-05-19 11:46:53.351881','26','【技术分享】智能机器人卡车的基础路径规划算法入门教程',2,'[{\"changed\": {\"fields\": [\"\\u53d1\\u5e03\\u8005\"]}}]',13,1),(250,'2026-05-19 11:47:26.458177','19','【闲聊】大家都是怎么接触到智能机器人卡车的？来聊聊！',2,'[{\"changed\": {\"fields\": [\"\\u53d1\\u5e03\\u8005\"]}}]',13,1),(251,'2026-05-19 11:47:34.303017','21','【求助】新手想入手智能机器人卡车，求推荐入门款！',2,'[{\"changed\": {\"fields\": [\"\\u53d1\\u5e03\\u8005\"]}}]',13,1),(252,'2026-05-19 11:47:43.832913','20','【日常分享】周末带着我的机器人卡车去户外跑了一圈，太爽了！',2,'[{\"changed\": {\"fields\": [\"\\u53d1\\u5e03\\u8005\"]}}]',13,1),(253,'2026-05-20 10:55:07.687085','1','校企联合研发与人才培养合作计划',1,'[{\"added\": {}}]',27,1),(254,'2026-05-20 11:01:20.819877','1','校企联合研发与人才培养合作计划',2,'[{\"changed\": {\"fields\": [\"\\u8be6\\u7ec6\\u56fe\\u6587\\u5185\\u5bb9\"]}}]',27,1),(255,'2026-05-20 11:03:02.820096','2','产业生态伙伴合作计划',1,'[{\"added\": {}}]',27,1),(256,'2026-05-20 11:04:06.056369','2','产业生态伙伴合作计划',2,'[{\"changed\": {\"fields\": [\"\\u8be6\\u7ec6\\u56fe\\u6587\\u5185\\u5bb9\"]}}]',27,1),(257,'2026-05-20 11:11:14.940066','2','产业生态伙伴合作计划',2,'[]',27,1),(258,'2026-05-20 11:11:23.447551','2','产业生态伙伴合作计划',2,'[]',27,1),(259,'2026-05-20 11:11:27.315516','1','校企联合研发与人才培养合作计划',2,'[]',27,1),(260,'2026-05-20 11:11:41.671731','2','产业生态伙伴合作计划',2,'[{\"changed\": {\"fields\": [\"\\u8be6\\u7ec6\\u56fe\\u6587\\u5185\\u5bb9\"]}}]',27,1),(261,'2026-05-20 11:16:08.097111','3','开源社区开发者合作计划',1,'[{\"added\": {}}]',27,1),(262,'2026-05-20 11:19:22.391792','4','区域场景落地共建合作计划',1,'[{\"added\": {}}]',27,1),(263,'2026-05-20 11:19:48.764428','4','区域场景落地共建合作计划',2,'[{\"changed\": {\"fields\": [\"\\u8be6\\u7ec6\\u56fe\\u6587\\u5185\\u5bb9\"]}}]',27,1),(264,'2026-05-20 11:23:20.818030','1','校企联合研发与人才培养合作计划',2,'[{\"changed\": {\"fields\": [\"\\u8be6\\u7ec6\\u56fe\\u6587\\u5185\\u5bb9\"]}}]',27,1),(265,'2026-05-20 11:36:58.327795','1','机器人卡车系统总体架构设计文档',1,'[{\"added\": {}}]',28,1),(266,'2026-05-20 11:42:42.692642','2','机器人卡车硬件开发与电气接口手册',1,'[{\"added\": {}}]',28,1),(267,'2026-05-20 11:43:02.327252','3','机器人卡车自动驾驶软件算法开发文档',1,'[{\"added\": {}}]',28,1),(268,'2026-05-20 11:43:20.268171','4','机器人卡车测试调试与运维部署文档',1,'[{\"added\": {}}]',28,1),(269,'2026-05-24 10:57:40.745353','4','UserRole object (4)',1,'[{\"added\": {}}]',26,1),(270,'2026-05-24 10:57:56.204766','4','UserRole object (4)',2,'[]',26,1),(271,'2026-05-24 10:58:14.775259','4','UserRole object (4)',2,'[]',26,1),(272,'2026-05-24 11:33:22.452663','4','UserRole object (4)',2,'[]',26,1),(273,'2026-05-24 11:35:24.559822','3','UserRole object (3)',3,'',26,1),(274,'2026-05-24 11:35:28.680794','2','UserRole object (2)',3,'',26,1),(275,'2026-05-24 11:35:32.074637','1','UserRole object (1)',3,'',26,1),(276,'2026-05-24 11:35:35.077260','4','UserRole object (4)',2,'[]',26,1),(277,'2026-05-24 11:35:45.275786','5','UserRole object (5)',1,'[{\"added\": {}}]',26,1),(278,'2026-05-24 11:35:52.970024','6','UserRole object (6)',1,'[{\"added\": {}}]',26,1),(279,'2026-05-24 11:35:58.911972','7','UserRole object (7)',1,'[{\"added\": {}}]',26,1),(280,'2026-05-24 11:36:08.168009','8','UserRole object (8)',1,'[{\"added\": {}}]',26,1),(281,'2026-05-24 11:36:33.708880','4','UserRole object (4)',2,'[]',26,1),(282,'2026-05-24 11:37:09.322205','5','UserRole object (5)',2,'[{\"changed\": {\"fields\": [\"\\u89d2\\u8272\"]}}]',26,1),(283,'2026-05-24 11:37:14.888822','6','UserRole object (6)',2,'[{\"changed\": {\"fields\": [\"\\u89d2\\u8272\"]}}]',26,1),(284,'2026-05-24 11:37:18.997061','7','UserRole object (7)',2,'[{\"changed\": {\"fields\": [\"\\u89d2\\u8272\"]}}]',26,1),(285,'2026-05-24 11:37:23.526025','8','UserRole object (8)',2,'[{\"changed\": {\"fields\": [\"\\u89d2\\u8272\"]}}]',26,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(11,'forum','category'),(15,'forum','collect'),(12,'forum','comment'),(14,'forum','like'),(16,'forum','notice'),(13,'forum','post'),(18,'forum','postimage'),(17,'forum','postrule'),(21,'forum','userprofile'),(20,'member','usermember'),(22,'rbac','permission'),(24,'rbac','role'),(25,'rbac','roleperm'),(23,'rbac','userinfo'),(26,'rbac','userrole'),(6,'sessions','session'),(9,'trucks','category'),(27,'trucks','cooperateinfo'),(28,'trucks','devdocument'),(29,'trucks','devtools'),(7,'trucks','news'),(10,'trucks','post'),(8,'trucks','truck'),(19,'trucks','userprofile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-04-22 12:49:31.004345'),(2,'auth','0001_initial','2026-04-22 12:49:31.290869'),(3,'admin','0001_initial','2026-04-22 12:49:31.367236'),(4,'admin','0002_logentry_remove_auto_add','2026-04-22 12:49:31.373521'),(5,'admin','0003_logentry_add_action_flag_choices','2026-04-22 12:49:31.379023'),(6,'contenttypes','0002_remove_content_type_name','2026-04-22 12:49:31.429575'),(7,'auth','0002_alter_permission_name_max_length','2026-04-22 12:49:31.463415'),(8,'auth','0003_alter_user_email_max_length','2026-04-22 12:49:31.482858'),(9,'auth','0004_alter_user_username_opts','2026-04-22 12:49:31.491144'),(10,'auth','0005_alter_user_last_login_null','2026-04-22 12:49:31.524112'),(11,'auth','0006_require_contenttypes_0002','2026-04-22 12:49:31.527240'),(12,'auth','0007_alter_validators_add_error_messages','2026-04-22 12:49:31.533703'),(13,'auth','0008_alter_user_username_max_length','2026-04-22 12:49:31.574787'),(14,'auth','0009_alter_user_last_name_max_length','2026-04-22 12:49:31.611872'),(15,'auth','0010_alter_group_name_max_length','2026-04-22 12:49:31.628861'),(16,'auth','0011_update_proxy_permissions','2026-04-22 12:49:31.635161'),(17,'auth','0012_alter_user_first_name_max_length','2026-04-22 12:49:31.672834'),(21,'sessions','0001_initial','2026-04-22 13:01:34.187419'),(22,'trucks','0001_initial','2026-04-23 06:23:44.779975'),(23,'trucks','0002_category_post_alter_news_options_and_more','2026-04-23 06:23:44.891247'),(28,'trucks','0003_delete_post_truck_image','2026-04-24 06:01:32.766892'),(29,'trucks','0004_remove_truck_image_alter_truck_img_url','2026-04-24 06:06:20.226011'),(30,'trucks','0005_alter_truck_img_url','2026-04-24 06:28:18.159054'),(31,'trucks','0006_alter_news_options_news_img_news_is_top_news_and_more','2026-04-24 14:57:40.500714'),(32,'trucks','0007_news_views','2026-05-11 07:39:21.270043'),(36,'forum','0001_initial','2026-05-12 10:01:55.614979'),(37,'forum','0002_post_image','2026-05-14 09:06:05.966774'),(38,'forum','0003_postimage','2026-05-14 09:57:23.836408'),(39,'trucks','0008_userprofile','2026-05-15 17:10:00.592877'),(41,'forum','0004_userprofile','2026-05-17 15:33:23.586928'),(42,'forum','0005_userprofile_avatar_userprofile_today_download_count_and_more','2026-05-17 15:54:59.487984'),(43,'member','0002_alter_usermember_user','2026-05-18 07:52:47.826140'),(45,'forum','0002_delete_userprofile','2026-05-19 08:32:39.065274'),(46,'rbac','0001_initial','2026-05-19 08:47:42.108680'),(47,'forum','0003_post_is_audited','2026-05-19 09:14:54.266594'),(48,'rbac','0002_userinfo_nickname','2026-05-19 10:10:09.516225'),(49,'forum','0004_post_is_top','2026-05-19 11:32:57.074375'),(50,'trucks','0009_cooperateinfo_devdocument_devtools','2026-05-20 09:53:37.538007'),(51,'rbac','0003_userinfo_total_activity','2026-05-24 10:32:53.583328');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2s524vw5wtckoml0pkdqhzssltw1ib9b','e30:1wOsLQ:dDdh5Zoa3HzohcO2YJVg2R9aB2bBf3k8MHotMRd3Efw','2026-06-01 07:24:56.176286'),('5iut17ghl3msvj67b34hpjt1u8j6bmim','e30:1wOsSm:Rfq9NeyWu5bG3kLRXiT4OHhiSENa8k87Uuklxhs4bNc','2026-06-01 07:32:32.643180'),('dok5g2at2ym2rjozp9jm3iwib66mi3h1','e30:1wOsPo:IO4Fo7tIIOStt9qSwtl7q0ptgfXvVa1ERmLqP2Y2mYc','2026-06-01 07:29:28.801276'),('e75so0zgmon1gg63w2nrn10wfte8me3u','e30:1wOsQU:JaQjdUoLrWKzhNxN8kTYC15w1l61RdEMcE31XVd7qes','2026-06-01 07:30:10.315081'),('qtfvuxdtq4diehly3euos45qu8gvlfwb','.eJxVjcEOwiAQRP-Fs2kwbRfo0bvfQBZ2sagBU1qrMf67bfRgr_PezLyExWns7VR4sJFEJ_Zi95859BdOK6AzplOufE7jEF21KtWPluqYia-Hn7sZ6LH0SxsJQRGGVgVjgmvAM2ivAElp7-u21gqCIicbZGp1MCBdg1pLKRmCaZfRe-SZySaei1WiG4eJl6fCpcScLD9ucXiKrgYpty583fcHX4hPnw:1wMLVA:dQ5aFfaQPYZSIBV6Zpq8SzBM87_AZJZ7nBCDC7RWgh4','2026-05-11 08:56:32.776727'),('u4o272dct444n5zg9j7n4babpv3qoh9a','.eJxVjEEOwiAQRe_C2hBMywy4dO8ZyMAwUjWQlHbVeHdt0oVu_3vvbyrQupSw9jyHidVFndXpd4uUnrnugB9U702nVpd5inpX9EG7vjXOr-vh_h0U6uVbExMgk1gU7yWOkDK4hECMLqXBDg5BkKMZKbN14sHEkZwzxmQQb9X7AxD7OIo:1wRBHm:XQTQ-2V0oQvxJNis8mXE1f8Weuas4LmIZ3HQojdxIM8','2026-06-07 16:02:42.795168');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_collect`
--

DROP TABLE IF EXISTS `forum_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_collect` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `post_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `forum_collect_user_id_post_id_90e0bf59_uniq` (`user_id`,`post_id`),
  KEY `forum_collect_post_id_17943a0a_fk_forum_post_id` (`post_id`),
  CONSTRAINT `forum_collect_post_id_17943a0a_fk_forum_post_id` FOREIGN KEY (`post_id`) REFERENCES `forum_post` (`id`),
  CONSTRAINT `forum_collect_user_id_92fe5c98_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_collect`
--

LOCK TABLES `forum_collect` WRITE;
/*!40000 ALTER TABLE `forum_collect` DISABLE KEYS */;
INSERT INTO `forum_collect` VALUES (1,'2026-05-12 10:05:58.436199',1,1);
/*!40000 ALTER TABLE `forum_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_comment`
--

DROP TABLE IF EXISTS `forum_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `post_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_comment_post_id_eb329692_fk_forum_post_id` (`post_id`),
  KEY `forum_comment_user_id_ee1c4b93_fk_auth_user_id` (`user_id`),
  CONSTRAINT `forum_comment_post_id_eb329692_fk_forum_post_id` FOREIGN KEY (`post_id`) REFERENCES `forum_post` (`id`),
  CONSTRAINT `forum_comment_user_id_ee1c4b93_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_comment`
--

LOCK TABLES `forum_comment` WRITE;
/*!40000 ALTER TABLE `forum_comment` DISABLE KEYS */;
INSERT INTO `forum_comment` VALUES (1,'可以的\r\n','2026-05-12 10:06:05.817993',1,1),(2,'666','2026-05-12 10:15:24.241808',1,2),(3,'加油\r\n','2026-05-19 10:45:04.960773',21,5);
/*!40000 ALTER TABLE `forum_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_like`
--

DROP TABLE IF EXISTS `forum_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_like` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `post_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `forum_like_user_id_post_id_c605c7a2_uniq` (`user_id`,`post_id`),
  KEY `forum_like_post_id_6a83dbbe_fk_forum_post_id` (`post_id`),
  CONSTRAINT `forum_like_post_id_6a83dbbe_fk_forum_post_id` FOREIGN KEY (`post_id`) REFERENCES `forum_post` (`id`),
  CONSTRAINT `forum_like_user_id_4638b7e9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_like`
--

LOCK TABLES `forum_like` WRITE;
/*!40000 ALTER TABLE `forum_like` DISABLE KEYS */;
INSERT INTO `forum_like` VALUES (1,'2026-05-12 10:05:57.521211',1,1);
/*!40000 ALTER TABLE `forum_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_notice`
--

DROP TABLE IF EXISTS `forum_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_notice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_top` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_notice`
--

LOCK TABLES `forum_notice` WRITE;
/*!40000 ALTER TABLE `forum_notice` DISABLE KEYS */;
INSERT INTO `forum_notice` VALUES (1,'【社区公告】论坛交流规范正式发布，请所有用户遵守','各位用户：\r\n为维护良好的交流环境，保障社区正常运营，现发布本论坛社区规范，请所有用户共同遵守：\r\n1.禁止发布广告、低俗、违规内容，禁止恶意灌水、重复发帖；\r\n2.文明发言，理性友好交流，禁止人身攻击、引战言论；\r\n3.技术求助帖请清晰描述问题场景、报错信息，便于他人协助解答；\r\n4.分享类帖子请确保内容原创或注明来源，尊重他人劳动成果；\r\n违反以上规则的帖子将被删除，多次违规账号将被禁言 / 封禁处理。\r\n感谢大家的理解与配合，让我们一起打造优质的智能机器人卡车交流社区！\r\n—— 论坛运营团队',1,'2026-05-14 07:14:21.442674');
/*!40000 ALTER TABLE `forum_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_post`
--

DROP TABLE IF EXISTS `forum_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `author_id` int NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_audited` tinyint(1) NOT NULL,
  `is_top` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_post_author_id_609b7963_fk_auth_user_id` (`author_id`),
  CONSTRAINT `forum_post_author_id_609b7963_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_post`
--

LOCK TABLES `forum_post` WRITE;
/*!40000 ALTER TABLE `forum_post` DISABLE KEYS */;
INSERT INTO `forum_post` VALUES (1,'【新手入坑】刚入坑智能机器人卡车，新手入门求带！','大家好！最近对智能机器人卡车特别感兴趣，想入坑试试，但是完全是新手小白，想问问大家几个问题：\r\n1.入门的话，先从哪个型号或者基础套件入手比较合适？\r\n2.有没有适合零基础的学习资料或者教程推荐？\r\n3.新手做小项目的话，优先练哪些功能比较好？\r\n第一次接触这类设备，好多地方都不懂，求大佬们指点一下，感谢！','chat',2,'2026-05-12 10:05:38.996627',2,'',0,0),(2,'【开箱测评】入门款智能机器人卡车开箱 + 首次上手体验','大家好！终于入手了心心念念的入门款智能机器人卡车，来给大家做个开箱测评～\r\n开箱整体：包装严实，配件齐全，底盘、主控板、传感器、电池都有，说明书也很详细，新手友好度拉满。\r\n上手体验：按教程搭好后，基础巡线和避障功能一次就跑通了，响应速度比预想的快很多，传感器识别也很准。\r\n不足：入门款续航一般，连续跑大概只能撑 2 小时，后续打算自己加电池扩容。\r\n整体来说新手入门很合适，性价比很高，后续会继续分享使用心得！','new_car',1,'2026-05-14 09:37:14.225702',3,'forum/posts/2026/05/1.jpg',0,0),(7,'【长期测评】我的智能机器人卡车用了 3 个月，真实使用感受','来分享一下我的卡车用了 3 个月的真实体验！\r\n优点：\r\n① 稳定性很强，户外跑也没出过故障；\r\n② 社区教程很多，遇到问题基本都能找到解决方法；\r\n③ 扩展性真的香，现在已经加了摄像头和语音模块，玩出花了。\r\n缺点：\r\n① 户外强光下摄像头识别会受影响，得加个遮光罩；\r\n② 原装电池衰减有点快，现在续航比刚买的时候降了约 15%。\r\n整体很满意，打算后续升级主控模块，跑更复杂的算法。','new_car',1,'2026-05-14 10:19:33.305255',1,'',0,0),(8,'【对比测评】两款热门入门智能机器人卡车怎么选？帮你避坑！','最近很多朋友问我入门选哪款，我整理了两款热门型号的对比，给大家参考：\r\n型号 A：价格稍低，配件基础，适合纯新手练手，扩展性一般；\r\n型号 B：价格稍高，自带更多传感器，支持扩展模块，后续改装空间大。\r\n总结：只想体验基础功能选 A 就够了；想长期玩、做项目建议直接上 B，省得后期再换。\r\n有纠结的朋友可以留言说下你的需求，帮你一起选～','new_car',2,'2026-05-14 10:21:53.359925',5,'',0,0),(9,'【新品测评】刚发布的新款智能机器人卡车，上手体验 + 功能详解','蹲了好久的新款终于到手了！来做个首发测评～\r\n升级亮点：\r\n✅ 主控性能提升，跑路径规划算法比老款流畅很多；\r\n✅ 新增高清摄像头 + 雷达模块，避障和导航精度提升明显；\r\n✅ 续航直接翻倍，户外跑一下午完全没问题；\r\n✅ 开发环境优化，新手搭建环境的门槛低了不少。\r\n上手跑了几个复杂场景，表现都很稳，就是价格比老款高一点，预算够的朋友可以冲！','new_car',1,'2026-05-14 10:32:21.537066',1,'',0,0),(10,'【保养心得】智能机器人卡车电池保养技巧，延长续航和寿命','很多朋友问我卡车电池怎么保养，分享一下我用了大半年的心得：\r\n不要等电完全耗光再充，剩 20% 左右就充，避免深度放电；\r\n长期不用的话，充到 50% 左右存放，每个月补一次电；\r\n充电时尽量不要边充边跑，对电池损耗很大；\r\n避免在高温 / 低温环境下充电，很伤电池。\r\n按这个方法用了快一年，电池健康度还是 90% 以上，大家可以试试～','maintain',1,'2026-05-14 10:39:08.046872',1,'',0,0),(11,'【故障求助】我的机器人卡车传感器失灵了，怎么办？','各位大佬求助！我的卡车最近传感器老是失灵，避障功能有时候会失效，明明离障碍物很近也不反应，想问问大家有没有遇到过这种情况？\r\n已经试过的方法：\r\n1.检查了传感器接线，没有松动；\r\n2.擦干净了传感器镜头，没有灰尘遮挡；\r\n3.重启了主控板，还是没改善。\r\n有没有懂的朋友能指点一下，可能是什么问题？万分感谢！','maintain',1,'2026-05-14 10:45:20.131251',1,'',0,0),(12,'【维修分享】自己动手修好机器人卡车的轮胎卡顿问题，附教程','分享一下我自己修好轮胎卡顿的过程，给遇到同样问题的朋友参考！\r\n问题表现：卡车跑起来时，有一个轮胎明显卡顿，转速不均匀，有时候还会打滑。\r\n排查过程：\r\n1.拆开轮胎检查，发现轴承里进了灰尘，润滑油干了；\r\n2.清理轴承灰尘，重新上专用润滑油；\r\n3.调整轮胎和电机的连接，避免卡顿。\r\n现在跑起来很顺畅，新手也可以自己动手排查，不用急着送修～','maintain',1,'2026-05-14 10:47:04.695043',1,'',0,0),(13,'【保养教程】智能机器人卡车日常维护清单，新手也能做','给大家整理了一份日常维护清单，定期做一做，能延长设备使用寿命：\r\n✅ 每次使用后：擦干净传感器镜头和轮胎上的灰尘、杂物；\r\n✅ 每周：检查所有接线是否松动，测试传感器和电机是否正常；\r\n✅ 每月：给轮胎轴承上润滑油，检查电池健康度，清理主控板灰尘；\r\n✅ 每季度：更新主控系统固件，校准一次传感器和陀螺仪。\r\n按这个清单维护，设备基本不会出大问题，大家可以收藏起来！','maintain',1,'2026-05-14 10:47:29.034764',1,'',0,0),(14,'【改装分享】给我的机器人卡车加装了机械臂，实现抓取功能！','终于给我的卡车加装了机械臂，现在能实现简单的抓取功能了，来分享一下改装过程～\r\n改装配件：6 自由度机械臂 + 舵机控制板，成本不算高，新手也能上手。\r\n改装难点：\r\n1.机械臂的安装位置要选好，不然会影响卡车重心；\r\n2.控制代码要和卡车主控板对接，调试花了点时间。\r\n现在已经能实现定点抓取、搬运小物件了，后续打算优化控制精度，做个自动分拣的小项目！','modify',1,'2026-05-14 10:53:05.925451',1,'',0,0),(15,'【改装求助】想给机器人卡车加个电池扩容，有没有靠谱的方案？','各位改装大佬求助！我的卡车原装电池续航太短了，想自己扩容，有没有靠谱的方案推荐？\r\n我的需求：\r\n1.不要太复杂的改装，不想拆太多东西；\r\n2.扩容后续航能提升一倍左右；\r\n3.要安全，不能影响设备正常使用。\r\n有没有改过的朋友分享一下经验，或者推荐一下配件？万分感谢！','modify',1,'2026-05-15 15:31:58.676411',1,'',0,0),(16,'【改装教程】低成本给机器人卡车升级摄像头，实现高清视频回传','分享一个低成本升级摄像头的改装教程，不用换主控板也能实现高清视频回传！\r\n配件：百元级高清 USB 摄像头 + 免驱模块，兼容大部分入门款卡车。\r\n改装步骤：\r\n1.把摄像头固定在卡车顶部，调整好角度；\r\n2.连接到主控板的 USB 接口，安装对应驱动；\r\n3.配置视频传输代码，就能实现实时高清回传了。\r\n改装之后户外巡检时画面清晰多了，成本也很低，大家可以试试！','modify',1,'2026-05-15 15:36:17.421599',1,'',0,0),(18,'【外观改装】给我的机器人卡车做了个 “机甲风” 外壳，附过程','纯分享！给我的卡车做了个机甲风外壳，颜值直接拉满！\r\n材料：3D 打印外壳 + 喷漆，根据卡车尺寸自己建模打印的，成本很低。\r\n改装过程：\r\n1.先测量卡车尺寸，建模时预留好传感器和接口的位置；\r\n2.3D 打印出来后，打磨、喷漆，做成机甲效果；\r\n3.安装时调整了外壳固定方式，不影响散热和运行。\r\n现在我的卡车就是社区最靓的仔，跑出去回头率超高，后续打算再加点 LED 灯条！','modify',1,'2026-05-15 15:42:04.439858',1,'',0,0),(19,'【闲聊】大家都是怎么接触到智能机器人卡车的？来聊聊！','如题！突然好奇大家都是怎么接触到智能机器人卡车的？\r\n我先来：上学时参加过机器人比赛，当时就对这类移动平台特别感兴趣，毕业之后一直想自己玩一玩，最近终于入手了，感觉打开了新世界的大门！\r\n大家也来说说自己的故事，看看有没有同好～','chat',1,'2026-05-15 15:43:10.629054',2,'',0,0),(20,'【日常分享】周末带着我的机器人卡车去户外跑了一圈，太爽了！','分享一下周末带着卡车去户外的快乐！\r\n找了个空旷的园区，跑了自动导航和避障功能，户外表现比预想的稳很多，就是风大的时候摄像头有点晃，下次打算加个防抖支架。\r\n路上还有小朋友过来围观，问我这是什么机器人，成就感直接拉满！\r\n大家平时会带着自己的卡车出门玩吗？','chat',1,'2026-05-15 15:45:03.346335',5,'',0,0),(21,'【求助】新手想入手智能机器人卡车，求推荐入门款！','各位大佬，我是纯新手，想入手一台智能机器人卡车玩玩，求推荐入门款！\r\n我的需求：\r\n1.预算不高，学生党，性价比优先；\r\n2.扩展性要好一点，后续想自己改装玩玩；\r\n3.社区教程多一点，遇到问题能找到解决方法。\r\n有没有适合的型号推荐？感谢大家！','chat',1,'2026-05-15 15:45:36.553944',3,'',0,0),(22,'【求助】Django 对接机器人卡车的 API，老是连不上怎么办？','各位技术大佬求助！我在做一个项目，想把 Django 网站和我的卡车 API 对接，但是老是连不上，控制台报连接超时错误。\r\n我的配置：卡车 IP 和端口都没错，防火墙也关了，还是连不上，有没有遇到过类似问题的朋友？\r\n已经试过的方法：\r\n1.检查了卡车 API 服务是否正常启动；\r\n2.确认服务器和卡车在同一个局域网；\r\n3.换了不同的端口，还是不行。\r\n求大佬们指点一下，问题可能出在哪里？万分感谢！','tech_help',2,'2026-05-15 15:48:04.705793',1,'',0,0),(23,'【求助】机器人卡车跑路径规划算法时老是跑偏怎么办？','求助！我的卡车跑 A * 路径规划算法时老是跑偏，跑不到目标点，误差很大，想问问大家有没有遇到过这种情况？\r\n我的情况：用的是入门款卡车，带超声波传感器和陀螺仪，算法是跟着教程写的，但实际跑的时候偏差很大，尤其是转弯时。\r\n已经试过的方法：\r\n1.校准了陀螺仪和传感器；\r\n2.调整了算法参数，还是没改善；\r\n3.换了更平整的场地，偏差稍微小了一点，但还是不行。\r\n有没有懂的朋友能指点一下，可能是什么问题？','tech_help',2,'2026-05-15 15:48:41.883662',1,'',0,0),(24,'【求助】给机器人卡车加装了摄像头，无法实时传输画面怎么办？','求助！我给卡车加装了摄像头，但一直无法实现实时画面传输，用的是 Python 的 OpenCV，但是画面一直卡，甚至有时候直接断连。\r\n我的配置：主控板是树莓派，摄像头是 USB 高清摄像头，局域网环境，带宽没问题。\r\n已经试过的方法：\r\n1.降低了视频分辨率和帧率，还是卡；\r\n2.换了不同的传输协议，比如 RTSP，还是不行；\r\n3.检查了主控板性能，CPU 占用率很高，是不是性能不够？\r\n有没有遇到过同样问题的朋友，求指点！','tech_help',2,'2026-05-15 15:49:16.466475',1,'',0,0),(25,'【求助】ROS 环境下机器人卡车的底盘控制代码报错，怎么解决？','求助！我在 ROS 环境下写卡车底盘控制代码，老是报错，提示找不到对应的话题，有没有大佬能帮我看看？\r\n报错信息：ERROR: cannot launch node of type [robot_base/base_controller]: cannot locate node of type [base_controller] in package [robot_base]\r\n已经试过的方法：\r\n1.检查了包名和节点名，确认没错；\r\n2.重新编译了工作空间，source 了环境变量；\r\n3.确认了底盘驱动已经正常启动。\r\n还是找不到问题出在哪里，求大佬们指点一下，万分感谢！','tech_help',2,'2026-05-15 15:49:49.388612',1,'',0,0),(26,'【技术分享】智能机器人卡车的基础路径规划算法入门教程','本次分享的是基于栅格地图的 A * 算法，步骤如下：\r\n1.建立场地的栅格地图，标记障碍物；\r\n2.实现 A * 算法的核心逻辑，计算从起点到终点的最优路径；\r\n3.把算法和卡车底盘控制对接，实现自动导航。\r\n附了简单的代码示例，新手也能看懂，有问题可以在评论区交流～','tech_share',2,'2026-05-15 15:51:14.075537',5,'',0,0),(27,'【项目分享】用智能机器人卡车做的园区巡检系统，附完整方案','分享一下我用卡车做的园区巡检系统项目，已经在园区里跑通了，来给大家讲讲整体方案！\r\n项目目标：实现园区内的自动巡检、障碍物规避、视频回传和异常报警。\r\n用到的技术：ROS+SLAM 建图 + A * 路径规划 + 超声波避障 + 视频传输。\r\n整体流程：\r\n1.先给园区建图，生成栅格地图；\r\n2.设置巡检路线，用路径规划算法实现自动导航；\r\n3.摄像头实时回传画面，遇到障碍物自动规避；\r\n4.检测到异常情况（比如地面障碍物），自动上传报警信息。\r\n附了部分核心代码和调试心得，有做过类似项目的朋友，欢迎一起交流优化方案！','tech_share',2,'2026-05-15 15:51:43.382905',2,'',0,0),(28,'【经验交流】给智能机器人卡车做 SLAM 建图的踩坑记录','分享一下给我的卡车做 SLAM 建图的踩坑记录，给新手避避坑！\r\n踩坑 1：建图时光线变化大，地图容易飘，解决方法是用激光雷达，或在光线稳定的环境下建图；\r\n踩坑 2：建图时卡车速度太快，地图容易错位，要放慢速度，匀速移动；\r\n踩坑 3：建图后保存的地图，换个场地加载就失效了，要注意地图的坐标系校准；\r\n踩坑 4：SLAM 算法对 CPU 性能要求很高，入门款主控板容易卡顿，建议升级一下。\r\n大家做 SLAM 的时候有没有遇到过其他坑？欢迎一起交流～','tech_share',2,'2026-05-15 15:52:04.386228',4,'',0,0),(29,'【技术讨论】智能机器人卡车的避障方案，大家都是用哪种？','如题！来和大家讨论一下，卡车的避障方案，大家都是用哪种？\r\n我先来：我现在用的是超声波传感器 + 摄像头的方案，近距离用超声波避障，远距离用摄像头识别障碍物，但在复杂环境下效果一般，有时候会误判。\r\n想问问大家有没有更好的避障方案？比如用激光雷达？或者多传感器融合？欢迎分享一下自己的经验！','tech_share',2,'2026-05-15 15:52:21.433109',3,'',0,0);
/*!40000 ALTER TABLE `forum_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_postimage`
--

DROP TABLE IF EXISTS `forum_postimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_postimage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_postimage_post_id_06fd90d0_fk_forum_post_id` (`post_id`),
  CONSTRAINT `forum_postimage_post_id_06fd90d0_fk_forum_post_id` FOREIGN KEY (`post_id`) REFERENCES `forum_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_postimage`
--

LOCK TABLES `forum_postimage` WRITE;
/*!40000 ALTER TABLE `forum_postimage` DISABLE KEYS */;
INSERT INTO `forum_postimage` VALUES (4,'forum/posts/2026/05/4_zpZRD55.png',7),(5,'forum/posts/2026/05/2.png',8),(6,'forum/posts/2026/05/3.png',8),(7,'forum/posts/2026/05/5.png',9),(8,'forum/posts/2026/05/1_mWxcpq5.jpg',10),(9,'forum/posts/2026/05/2.jpg',11),(10,'forum/posts/2026/05/1_lwww5qQ.jpg',14),(11,'forum/posts/2026/05/2_UypjrEj.jpg',15),(12,'forum/posts/2026/05/3.jpg',16),(14,'forum/posts/2026/05/4_sSAObgD.jpg',18),(15,'forum/posts/2026/05/3_F9OFiNM.jpg',20);
/*!40000 ALTER TABLE `forum_postimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_postrule`
--

DROP TABLE IF EXISTS `forum_postrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_postrule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_postrule`
--

LOCK TABLES `forum_postrule` WRITE;
/*!40000 ALTER TABLE `forum_postrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_postrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_permission`
--

DROP TABLE IF EXISTS `rbac_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `perm_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perm_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `perm_code` (`perm_code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_permission`
--

LOCK TABLES `rbac_permission` WRITE;
/*!40000 ALTER TABLE `rbac_permission` DISABLE KEYS */;
INSERT INTO `rbac_permission` VALUES (1,'浏览内容','browse'),(2,'发帖','post'),(3,'点赞评论','comment_like'),(4,'每日下载 5 次','download_5'),(5,'每日下载 10 次','download_10'),(6,'无限下载','download_all'),(7,'发帖免审核','post_no_review');
/*!40000 ALTER TABLE `rbac_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_role`
--

DROP TABLE IF EXISTS `rbac_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_role`
--

LOCK TABLES `rbac_role` WRITE;
/*!40000 ALTER TABLE `rbac_role` DISABLE KEYS */;
INSERT INTO `rbac_role` VALUES (1,'游客',''),(2,'普通用户',''),(3,'普通会员',''),(4,'超级会员',''),(5,'至尊会员','');
/*!40000 ALTER TABLE `rbac_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_roleperm`
--

DROP TABLE IF EXISTS `rbac_roleperm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_roleperm` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `perm_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rbac_roleperm_role_id_perm_id_00c3bc34_uniq` (`role_id`,`perm_id`),
  KEY `rbac_roleperm_perm_id_b746b18f_fk_rbac_permission_id` (`perm_id`),
  CONSTRAINT `rbac_roleperm_perm_id_b746b18f_fk_rbac_permission_id` FOREIGN KEY (`perm_id`) REFERENCES `rbac_permission` (`id`),
  CONSTRAINT `rbac_roleperm_role_id_e67b754d_fk_rbac_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_roleperm`
--

LOCK TABLES `rbac_roleperm` WRITE;
/*!40000 ALTER TABLE `rbac_roleperm` DISABLE KEYS */;
INSERT INTO `rbac_roleperm` VALUES (1,1,1),(2,1,2),(3,2,2),(4,3,2),(5,1,3),(6,2,3),(7,3,3),(8,4,3),(9,1,4),(10,2,4),(11,3,4),(12,5,4),(13,1,5),(14,2,5),(15,3,5),(16,6,5),(17,7,5);
/*!40000 ALTER TABLE `rbac_roleperm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_userinfo`
--

DROP TABLE IF EXISTS `rbac_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_userinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `level` smallint NOT NULL,
  `avatar_frame` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_time` int NOT NULL,
  `post_num` int NOT NULL,
  `like_num` int NOT NULL,
  `comment_num` int NOT NULL,
  `last_login_time` datetime(6) NOT NULL,
  `violate_count` int NOT NULL,
  `user_id` int NOT NULL,
  `nickname` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `rbac_userinfo_user_id_037222ab_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_userinfo`
--

LOCK TABLES `rbac_userinfo` WRITE;
/*!40000 ALTER TABLE `rbac_userinfo` DISABLE KEYS */;
INSERT INTO `rbac_userinfo` VALUES (1,4,'',0,3,0,1,'2026-05-19 09:06:00.000000',0,5,NULL,1500),(2,4,'',0,14,0,1,'2026-05-19 09:11:00.000000',0,1,NULL,1500),(3,1,'',0,3,1,1,'2026-05-19 09:11:00.000000',0,2,NULL,0),(4,2,'',0,3,0,0,'2026-05-19 09:11:00.000000',0,3,NULL,300),(5,3,'',0,1,0,0,'2026-05-19 09:11:00.000000',0,4,NULL,700);
/*!40000 ALTER TABLE `rbac_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_userrole`
--

DROP TABLE IF EXISTS `rbac_userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_userrole` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rbac_userrole_user_id_role_id_680dcacd_uniq` (`user_id`,`role_id`),
  KEY `rbac_userrole_role_id_afe9516c_fk_rbac_role_id` (`role_id`),
  CONSTRAINT `rbac_userrole_role_id_afe9516c_fk_rbac_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`id`),
  CONSTRAINT `rbac_userrole_user_id_035f397b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_userrole`
--

LOCK TABLES `rbac_userrole` WRITE;
/*!40000 ALTER TABLE `rbac_userrole` DISABLE KEYS */;
INSERT INTO `rbac_userrole` VALUES (4,5,1),(5,2,2),(6,3,3),(7,4,4),(8,5,5);
/*!40000 ALTER TABLE `rbac_userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trucks_category`
--

DROP TABLE IF EXISTS `trucks_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trucks_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trucks_category`
--

LOCK TABLES `trucks_category` WRITE;
/*!40000 ALTER TABLE `trucks_category` DISABLE KEYS */;
INSERT INTO `trucks_category` VALUES (1,'重型牵引卡车'),(3,'工程作业专用车'),(4,'城市配送轻卡'),(5,'特种专用作业车'),(6,'车载配套零配件'),(7,'智能新能源车型');
/*!40000 ALTER TABLE `trucks_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trucks_cooperateinfo`
--

DROP TABLE IF EXISTS `trucks_cooperateinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trucks_cooperateinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plan_title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trucks_cooperateinfo`
--

LOCK TABLES `trucks_cooperateinfo` WRITE;
/*!40000 ALTER TABLE `trucks_cooperateinfo` DISABLE KEYS */;
INSERT INTO `trucks_cooperateinfo` VALUES (1,'校企联合研发与人才培养合作计划','<p><strong>合作背景</strong><br />\r\n&nbsp;<br />\r\n随着智能无人运输技术在矿山物流、山区配送、园区转运等场景的快速落地，高校科研成果与产业实际需求的结合成为关键趋势。本项目依托大数据分析、自动驾驶控制、智能调度等核心技术，面向无人卡车场景构建完整解决方案，现诚邀高校科研团队共建联合研发体系，推动技术攻关与人才培养双向赋能。<br />\r\n&nbsp;<br />\r\n（可在此插入：校企合作架构示意图/联合实验室场景图）<br />\r\n&nbsp;<br />\r\n<strong>核心目标</strong><br />\r\n&nbsp;<br />\r\n1.&nbsp;联合攻关无人运输场景下的环境感知、路径规划、多车协同调度等关键技术难题<br />\r\n​<br />\r\n2.&nbsp;共建智能无人运输实训基地，打造可落地的教学与科研平台<br />\r\n​<br />\r\n3.&nbsp;定向培养兼具算法开发、系统集成、场景落地能力的复合型技术人才<br />\r\n​<br />\r\n4.&nbsp;推动科研成果转化，共同申报省级/国家级产学研项目<br />\r\n&nbsp;<br />\r\n<strong>合作模式</strong><br />\r\n&nbsp;<br />\r\n- 联合课题攻关：针对特定技术难点成立联合课题组，双方共享技术资源，共同完成课题研究与专利申报<br />\r\n​<br />\r\n- 实训基地共建：依托项目搭建无人卡车模拟与测试平台，面向高校学生开放实习实训名额，提供真实场景开发环境<br />\r\n​<br />\r\n- 人才定向输送：建立高校-项目人才对接通道，优先录用合作高校的优秀毕业生，提供定制化岗位培训<br />\r\n&nbsp;<br />\r\n<strong>双方权益</strong><br />\r\n&nbsp;<br />\r\n- 高校侧：获得真实产业场景的科研验证环境，提升课题研究的落地性；学生可获得项目实践机会与技术指导<br />\r\n​<br />\r\n- 项目侧：获得高校科研团队的技术支持，加速关键技术迭代；定向培养符合项目需求的专业人才，降低用人成本<br />\r\n&nbsp;<br />\r\n<strong>合作流程</strong><br />\r\n&nbsp;<br />\r\n1.&nbsp;意向对接：双方就合作方向、课题范围、人才需求进行初步沟通<br />\r\n​<br />\r\n2.&nbsp;方案制定：共同制定合作框架、课题计划与人才培养方案<br />\r\n​<br />\r\n3.&nbsp;签约立项：签署合作协议，正式成立联合研发/实训项目组<br />\r\n​<br />\r\n4.&nbsp;执行落地：按计划推进课题攻关、实训基地建设与人才培养工作<br />\r\n​<br />\r\n5.&nbsp;成果验收：定期开展成果复盘，完成课题结题与人才输送闭环</p>','2026-05-20 11:23:20.817376'),(2,'产业生态伙伴合作计划','<p>&nbsp;<strong>合作背景</strong><br />\r\n&nbsp;<br />\r\n智能无人卡车的商业化落地，需要硬件厂商、物流企业、场景运营方的产业链协同。本项目已完成无人卡车核心控制系统、调度平台与大数据分析系统的开发，现面向行业开放合作，共建&ldquo;硬件适配+场景落地+平台服务&rdquo;的完整产业生态，推动无人运输技术从实验室走向实际应用。<br />\r\n&nbsp;<br />\r\n&nbsp;<br />\r\n<strong>核心目标</strong><br />\r\n&nbsp;<br />\r\n1.&nbsp;共建适配不同场景的无人卡车解决方案，覆盖矿区、园区、港口、山区物流等多元场景<br />\r\n​<br />\r\n2.&nbsp;推进项目技术在合作企业的场景验证与试点落地，形成可复制的运营模式<br />\r\n​<br />\r\n3.&nbsp;整合双方渠道资源，共同拓展无人运输市场，提升项目行业影响力<br />\r\n​<br />\r\n4.&nbsp;联合打造标杆示范项目，推动行业标准与应用规范的完善<br />\r\n&nbsp;<br />\r\n<strong>合作模式</strong><br />\r\n&nbsp;<br />\r\n- 联合方案开发：针对合作企业的业务场景，共同定制无人卡车硬件适配方案与调度平台功能模块<br />\r\n​<br />\r\n- 场景验证试点：合作企业提供真实运营场景，项目方提供技术支持，完成无人卡车的测试与试点运营<br />\r\n​<br />\r\n- 渠道共建推广：双方共享行业资源，联合开展市场推广活动，共同拓展客户与合作场景<br />\r\n&nbsp;<br />\r\n<strong>双方权益</strong><br />\r\n&nbsp;<br />\r\n- 合作企业侧：获得定制化无人运输解决方案，降低技术研发成本；优先落地无人卡车试点，提升业务效率与竞争力<br />\r\n​<br />\r\n- 项目侧：获得真实场景的验证数据，加速技术迭代；借助合作企业渠道拓展市场，提升项目行业认可度<br />\r\n&nbsp;<br />\r\n<strong>合作流程</strong><br />\r\n&nbsp;<br />\r\n1.&nbsp;意向对接：双方沟通业务场景与合作需求，明确合作方向与目标<br />\r\n​<br />\r\n2.&nbsp;需求评估：项目方针对合作企业的场景需求，完成技术可行性评估<br />\r\n​<br />\r\n3.&nbsp;方案共建：双方共同制定定制化解决方案与试点计划<br />\r\n​<br />\r\n4.&nbsp;试点落地：按计划推进无人卡车的部署、测试与试点运营<br />\r\n​<br />\r\n5.&nbsp;推广复制：总结试点经验，优化方案并向更多场景推广</p>','2026-05-20 11:11:41.670830'),(3,'开源社区开发者合作计划','<p><strong>合作背景</strong><br />\r\n&nbsp;<br />\r\n为推动智能无人运输技术的开放共享，本项目已开放核心调度平台、数据分析模块与控制算法的开源代码，现面向全球开发者社区开放合作，诚邀技术爱好者、独立开发者与小型技术团队共建开源生态，丰富项目功能、完善技术文档，共同推动无人运输技术的普及与创新。<br />\r\n&nbsp;<br />\r\n&nbsp;<br />\r\n<strong>核心目标</strong><br />\r\n&nbsp;<br />\r\n1.&nbsp;吸引开发者贡献代码，丰富项目的插件生态与二次开发案例<br />\r\n​<br />\r\n2.&nbsp;完善项目技术文档、API接口与开发工具包，降低开发者参与门槛<br />\r\n​<br />\r\n3.&nbsp;打造活跃的开发者社区，建立技术交流与反馈通道，快速迭代优化项目<br />\r\n​<br />\r\n4.&nbsp;孵化基于本项目的衍生应用，拓展无人运输技术的应用场景<br />\r\n&nbsp;<br />\r\n<strong>合作模式</strong><br />\r\n&nbsp;<br />\r\n- 代码贡献：开发者可通过提交Pull Request，参与项目功能开发、Bug修复与性能优化<br />\r\n​<br />\r\n- 插件开发：基于项目开放的API接口，开发适配不同场景的插件、工具包与第三方集成方案<br />\r\n​<br />\r\n- 技术共创：参与社区技术讨论，为项目功能迭代、架构优化提供建议，共同制定开源路线图<br />\r\n&nbsp;<br />\r\n<strong>双方权益</strong><br />\r\n&nbsp;<br />\r\n- 开发者侧：获得项目开源代码的使用权，可基于项目开发自己的应用；优秀贡献者可获得项目官方认证与社区推广资源<br />\r\n​<br />\r\n- 项目侧：借助开发者社区的力量，快速完善项目功能与文档，降低开发成本；孵化更多衍生应用，拓展项目影响力<br />\r\n&nbsp;<br />\r\n<strong>合作流程</strong><br />\r\n&nbsp;<br />\r\n1.&nbsp;社区注册：开发者通过项目开源仓库注册账号，获取项目代码与开发文档<br />\r\n​<br />\r\n2.&nbsp;贡献提交：开发者提交代码贡献、插件或优化建议，由项目维护团队审核<br />\r\n​<br />\r\n3.&nbsp;审核合并：项目维护团队对贡献进行审核，通过后合并至项目主分支<br />\r\n​<br />\r\n4.&nbsp;社区推广：优秀贡献者将获得社区推广资源，其开发的插件/方案将被纳入项目官方文档<br />\r\n​<br />\r\n5.&nbsp;持续共创：开发者可长期参与项目迭代，成为社区核心贡献者</p>','2026-05-20 11:16:08.096574'),(4,'区域场景落地共建合作计划','<p><br />\r\n<strong>合作背景</strong><br />\r\n&nbsp;<br />\r\n贵州本地山区物流、矿区运输、园区转运等场景，对无人卡车技术有着强烈的本地化需求&mdash;&mdash;复杂地形、恶劣环境与分散的运输节点，对无人运输的环境适应性、稳定性与调度能力提出了更高要求。本项目依托对山区场景的适配优化经验，现面向贵州本地政府、园区、企业开放合作，共建本地化无人运输示范项目，推动智能技术服务地方产业发展。<br />\r\n&nbsp;<br />\r\n&nbsp;<br />\r\n<strong>核心目标</strong><br />\r\n&nbsp;<br />\r\n1.&nbsp;针对贵州本地场景定制无人运输解决方案，优化无人卡车的地形适配与环境适应能力<br />\r\n​<br />\r\n2.&nbsp;打造贵州本地无人运输示范项目，形成可复制的场景落地模式<br />\r\n​<br />\r\n3.&nbsp;联合申报地方科技项目，争取政策支持，推动无人运输技术在本地的推广应用<br />\r\n​<br />\r\n4.&nbsp;助力本地产业数字化转型，提升物流、矿山等行业的运营效率与安全性<br />\r\n&nbsp;<br />\r\n<strong>合作模式</strong><br />\r\n&nbsp;<br />\r\n- 场景共建：合作方提供本地场景资源，项目方提供技术支持，共同推进无人卡车的测试与落地<br />\r\n​<br />\r\n- 定制开发：针对本地场景的特殊需求，定制开发功能模块，优化无人卡车的调度与控制策略<br />\r\n​<br />\r\n- 项目申报：双方联合申报地方科技项目、产业扶持项目，争取政策资金与资源支持<br />\r\n&nbsp;<br />\r\n<strong>双方权益</strong><br />\r\n&nbsp;<br />\r\n- 地方合作方侧：获得定制化无人运输解决方案，降低场景改造与技术研发成本；打造本地数字化转型标杆项目，提升行业竞争力<br />\r\n​<br />\r\n- 项目侧：获得本地场景的真实数据，优化项目的本地化适配能力；借助地方政策支持，推进项目落地与推广<br />\r\n&nbsp;<br />\r\n<strong>合作流程</strong><br />\r\n&nbsp;<br />\r\n1.&nbsp;需求调研：项目方赴合作方场景进行实地调研，明确场景需求与技术难点<br />\r\n​<br />\r\n2.&nbsp;方案定制：针对本地场景制定定制化解决方案与项目推进计划<br />\r\n​<br />\r\n3.&nbsp;试点部署：按计划推进无人卡车的部署、测试与试点运营<br />\r\n​<br />\r\n4.&nbsp;项目申报：双方联合申报地方科技项目，争取政策支持<br />\r\n​<br />\r\n5.&nbsp;推广复制：总结试点经验，优化方案并向更多本地场景推广</p>','2026-05-20 11:19:48.763260');
/*!40000 ALTER TABLE `trucks_cooperateinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trucks_devdocument`
--

DROP TABLE IF EXISTS `trucks_devdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trucks_devdocument` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `introduce` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `doc_file` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trucks_devdocument`
--

LOCK TABLES `trucks_devdocument` WRITE;
/*!40000 ALTER TABLE `trucks_devdocument` DISABLE KEYS */;
INSERT INTO `trucks_devdocument` VALUES (1,'机器人卡车系统总体架构设计文档','','file_docs/1.docx','2026-05-20 11:24:00.000000'),(2,'机器人卡车硬件开发与电气接口手册','','file_docs/2.docx','2026-05-20 11:42:00.000000'),(3,'机器人卡车自动驾驶软件算法开发文档','','file_docs/3.docx','2026-05-20 11:42:00.000000'),(4,'机器人卡车测试调试与运维部署文档','','file_docs/4.docx','2026-05-20 11:43:00.000000');
/*!40000 ALTER TABLE `trucks_devdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trucks_devtools`
--

DROP TABLE IF EXISTS `trucks_devtools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trucks_devtools` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tool_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tool_desc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `tool_zip` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `release_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trucks_devtools`
--

LOCK TABLES `trucks_devtools` WRITE;
/*!40000 ALTER TABLE `trucks_devtools` DISABLE KEYS */;
/*!40000 ALTER TABLE `trucks_devtools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trucks_news`
--

DROP TABLE IF EXISTS `trucks_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trucks_news` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `img` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_top_news` tinyint(1) NOT NULL,
  `views` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `trucks_news_chk_1` CHECK ((`views` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trucks_news`
--

LOCK TABLES `trucks_news` WRITE;
/*!40000 ALTER TABLE `trucks_news` DISABLE KEYS */;
INSERT INTO `trucks_news` VALUES (1,'智能重载机器人卡车正式落地工业物流场景，开启无人运输新时代','本次上线的新一代智能机器人牵引卡车，搭载自主导航与 AI 避障系统，可实现厂区 24 小时全自动、零人工干预重载运输，大幅提升干线物流作业效率，降低人力与运营成本。','<p>随着工业智能化、无人化转型进入快车道，智能机器人重载牵引卡车正式迎来大规模商业化落地应用。<br />\r\n本次全新迭代的智能机器人卡车，搭载自研多传感器融合定位方案 + 深度学习 AI 智能避障算法，无需改造场地磁轨，即可在复杂厂区、仓储园区、干线货场环境中，实现厘米级精准自主导航、自动规划最优行驶路线、智能避让行人与障碍物。<br />\r\n车辆支持全天候 24 小时不间断作业，单车载重能力大幅提升，完美适配长途干线重载牵引、厂区内部物料转运、大型仓库货物批量周转等高频场景。相比传统人工驾驶模式，综合运输作业效率提升 60% 以上，同时大幅降低司机用工、疲劳驾驶安全隐患与车辆运维成本。<br />\r\n目前该系列智能机器人卡车，已经在多个大型制造工厂、物流产业园、港口枢纽完成落地测试与稳定运营，标志着重载工业无人运输正式迈入成熟商用新阶段。</p>','2026-04-24 15:02:47.258158','news_cover/1.jpg',1,0),(2,'突破技术壁垒！国产智能卡车实现复杂地形自适应稳定行驶','针对山区、泥泞工地、重载坡道等复杂工况，全新智能机器人卡车完成底盘动力与智能算法双重升级，动力更强、通过性更优，全场景适配工程作业、特种运输等多元应用需求。','<p>长久以来，复杂非铺装路面、陡坡、雨雪湿滑、崎岖工地等极端工况，一直是制约智能无人卡车大规模落地的核心难题。<br />\r\n本次全新升级的智能机器人专用卡车，针对性完成了三大硬核技术突破：<br />\r\n强化重载专用底盘架构，动力扭矩大幅提升，爬坡、起步重载能力全面升级<br />\r\n搭载路面自适应 AI 控制系统，可实时识别路面摩擦力、坡度、颠簸情况，动态调整驱动力与行驶姿态<br />\r\n搭载全时稳定车身控制系统，极端路况下依然保持车身平稳，保障重载货物与行车双重安全<br />\r\n无论是山区爬坡重载、工地泥泞作业、还是恶劣雨雪天气场景，车辆均可保持稳定可靠运行，彻底打破了智能无人卡车只能在平整园区使用的局限，全面覆盖工程作业专用车、特种作业车、山地牵引等全品类细分场景，为极端工况无人运输提供了全新国产解决方案。</p>\r\n\r\n<p>&nbsp;</p>','2026-04-24 15:08:21.748857','news_cover/2.jpg',1,0),(3,'绿色智造赋能未来，智能新能源机器人卡车正式批量交付','聚焦低碳环保发展方向，公司推出全新新能源智能机器人卡车系列，零排放、低噪音、长续航，广泛适配城市配送、厂区转运、港口倒短等场景，助力行业绿色转型升级。','<p>在全球碳中和、节能减排的大趋势下，商用车新能源化、智能化已经成为行业确定的发展方向。<br />\r\n本次批量下线交付的智能新能源机器人卡车，搭载高性能动力电池与高效电控系统，在满负载工况下依旧可以实现超长续航，支持快速补能，大幅降低日常运营补能等待时长。车辆全程零尾气排放、运行噪音极低，完美满足城市市区配送、封闭厂区、室内外联动转运、港口短途倒运等场景的环保合规要求。<br />\r\n同时车辆保留了全套智能无人驾驶、自主调度、远程管控能力，可接入园区智慧物流管理平台，实现多车统一编队、任务智能分配、全程可视化监管。<br />\r\n新能源 + 机器人智能技术的深度融合，既帮助企业大幅降低燃油与运维开支，也助力整个运输行业向着低碳化、智能化、可持续化的方向全新升级，为绿色智慧物流发展树立全新标杆。</p>\r\n\r\n<p>&nbsp;</p>','2026-04-24 15:08:56.788017','news_cover/3.jpg',1,0),(4,'新一代智能机器人卡车完成极端低温测试，性能稳定可靠','本公司智能机器人卡车顺利完成 - 30℃极端低温环境测试，电池、传感器、自动驾驶系统均保持稳定运行，可适应高寒地区作业需求。','<p>为满足全国多区域作业需求，新一代智能机器人卡车近日完成了严苛的低温环境测试。在 - 30℃的模拟环境中，车辆自动驾驶系统、动力系统、传感设备均保持正常运行，未出现任何故障。<br />\r\n此次测试验证了产品在极寒环境下的可靠性，进一步拓宽了智能机器人卡车的应用场景，无论是北方冬季工地、冷链物流园区，还是高寒矿区，都能稳定作业。<br />\r\n未来，我们将继续优化产品性能，打造全气候、全场景适用的智能运输装备。</p>','2026-04-24 15:44:52.981317','news_cover/1_OBAQ0Rj.jpg',0,0),(5,'智能机器人卡车实现多车协同编队，运输效率大幅提升','通过智能调度系统，多台机器人卡车可实现编队行驶、自动避障、协同作业，大幅提升园区物流运输效率，降低管理成本。','<p>随着智能物流技术不断升级，我司成功实现多台机器人卡车协同编队作业。车辆之间可通过无线通信实时共享位置、速度、任务信息，实现自动跟随、编队行驶、智能避让。<br />\r\n在大型园区、港口、厂区场景中，编队作业可让运输效率提升 50% 以上，同时减少人工调度压力，降低安全风险。<br />\r\n该技术的成功应用，标志着我国智能无人运输正式进入多车协同时代。</p>','2026-04-24 15:45:29.952027','news_cover/2_ziAcsz0.jpg',0,0),(6,'机器人卡车智能防撞系统升级，安全性再上新台阶','全新升级 360 度全景感知与主动防撞系统，可实时识别行人、车辆、障碍物，实现毫秒级紧急制动，全方位保障作业安全。','<p>安全始终是智能运输的核心。本次升级的机器人卡车搭载新一代多传感器融合感知系统，实现 360 度无死角环境监测，能够精准识别行人、非机动车、障碍物等。<br />\r\n当系统检测到危险时，会在毫秒级内启动紧急制动，有效避免碰撞事故发生。<br />\r\n经过大量实地测试，车辆在复杂工况下的安全防护能力大幅提升，可广泛应用于人员密集的工业园区、物流中心等场所。</p>','2026-04-24 15:45:57.671516','news_cover/3_nx9SFSV.jpg',0,1),(7,'全国首条机器人卡车无人运输专线正式投入运营','由我司打造的全国首条机器人卡车无人运输专线正式启动，实现 24 小时不间断自动运输，助力企业打造智慧工厂新标杆。','<p>近日，全国首条由智能机器人卡车承担全程运输的专线正式投入运营。该专线连接工厂车间与物流仓库，全程无需人工驾驶，可 24 小时不间断自动作业。<br />\r\n运营数据显示，无人运输模式相比传统人工运输，成本降低 40%，效率提升 60%，且零事故、零违规。<br />\r\n该项目的成功落地，为智能制造、智慧物流提供了可复制、可推广的全新解决方案，引领行业向无人化、智能化加速转型。</p>','2026-04-24 15:46:31.216586','news_cover/4.jpg',0,1);
/*!40000 ALTER TABLE `trucks_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trucks_truck`
--

DROP TABLE IF EXISTS `trucks_truck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trucks_truck` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `img_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intro` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_recommend` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trucks_truck_category_id_93eaf9f4_fk_trucks_category_id` (`category_id`),
  CONSTRAINT `trucks_truck_category_id_93eaf9f4_fk_trucks_category_id` FOREIGN KEY (`category_id`) REFERENCES `trucks_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trucks_truck`
--

LOCK TABLES `trucks_truck` WRITE;
/*!40000 ALTER TABLE `trucks_truck` DISABLE KEYS */;
INSERT INTO `trucks_truck` VALUES (1,'长途干线重载牵引车','1',428000.00,86,'trucks/images/product/part1/1_mI6rXqZ.jpg','6×4 驱动顶配版本，560 马力大排量发动机，合规轻量化车身，百公里油耗低至 32L，适配全国高速长途干线物流、大宗货物跨省运输，耐久耐用，整车质保 3 年 / 100 万公里。',1,'2026-04-23 06:24:17.017098',1),(2,'标载高效物流牵引车','1',369000.00,132,'trucks/images/product/part1/2.jpg','大马力经济燃油调校，轻量化底盘设计，长续航低运营成本，主打中长途标载干线运输场景，驾乘舒适性全面升级，保养维护便捷省心。',1,'2026-04-23 06:25:58.253756',1),(3,'山区爬坡专用牵引车','1',456000.00,47,'trucks/product/3.jpg','大扭矩专属动力总成，强化爬坡变速箱与驱动桥，针对山区、陡坡、复杂路况深度调校，重载起步稳、下坡制动安全，恶劣工况稳定耐用。',0,'2026-04-23 06:26:30.393585',1),(4,'轻量化干线牵引车','1',398000.00,69,'trucks/product/4.jpg','极致降重整车设计，合规上装自重更轻，多拉货、多拉收益，动力满足标载全场景需求，长里程长保养周期，干线快递快运首选车型。',0,'2026-04-23 06:27:07.121547',1),(5,'长途旗舰舒适牵引车','1',512000.00,28,'trucks/product/5.jpg','高端豪华驾驶室配置，智能辅助驾驶加持，大空间卧铺 + 车载生活配套，主打长途长途高频出勤，大幅降低司机长途驾驶疲劳感。',0,'2026-04-23 06:27:40.400654',1),(6,'港口专用倒短牵引车','1',325000.00,95,'trucks/product/6.jpg','低速大扭矩、高频启停耐用设计，转向灵活车身紧凑，适配港口、物流园、厂区短途倒运作业，皮实耐造故障率低。',0,'2026-04-23 06:28:16.849973',1),(7,'大型工程自卸车','2',315000.00,58,'trucks/product/1_yhAwRY1.jpg','重载高强度大梁底盘，大容积合规货箱，适配矿山、基建渣土、土石方转运作业，承重强、抗冲击、工地恶劣工况稳定可靠。',1,'2026-04-23 06:29:48.540425',3),(8,'混凝土搅拌运输车','2',389000.00,41,'trucks/product/2_6EO1sgd.jpg','专用上装搅拌罐体，均匀搅拌不凝固，底盘稳定动力平顺，城市基建、工地混凝土持续输送作业专用，故障率低运维省心。',0,'2026-04-23 06:30:21.701338',3),(9,'随车起重工程车','2',446000.00,33,'trucks/product/3_fu2bFym.jpg','自带车载起重吊机，一车兼具运输 + 吊装功能，钢材、建材重型设备吊装转运，灵活高效，大幅降低单独吊车租赁成本。',0,'2026-04-23 06:31:01.639568',3),(10,'大型吊车底盘车','2',572000.00,19,'trucks/product/4_HcowzOF.jpg','专用重型工程底盘，高承载高强度结构，适配大吨位上装改装，满足大型工程起重、大型设备吊装等重型作业场景。',0,'2026-04-23 06:31:38.557623',3),(11,'挖掘运输一体工程车','2',493000.00,26,'trucks/product/5_AxzzHni.jpg','工程专属定制底盘，越野通过性拉满，可搭配多种工程属具，山地、工地、崎岖路面作业通行无压力。',0,'2026-04-23 06:33:00.789712',3),(12,'公路养护作业车','2',278000.00,72,'trucks/product/6_VDhBY87.jpg','多功能养护专属上装，可搭载清扫、洒水、修补等多种养护模块，公路、市政道路日常维护作业专用，机动灵活。',0,'2026-04-23 06:33:31.116904',3),(13,'城配标准厢式轻卡','3',129000.00,186,'trucks/product/1_upPlC2n.jpg','城市蓝牌合规车型，车身灵活好穿街巷，大容积封闭货箱，快递、商超、生鲜城市日常配送首选，进城不限行。',1,'2026-04-23 06:34:08.164393',4),(14,'冷藏保鲜配送轻卡','3',187000.00,94,'trucks/product/2_JxXVSEI.jpg','原厂低温冷藏箱体，恒温稳定控温，全程冷链不断链，生鲜果蔬、冷冻食品、医药恒温货物城市短途配送专用。',0,'2026-04-23 06:34:51.331393',4),(15,'平板短途运输轻卡','3',115000.00,157,'trucks/product/3_QnYfNXM.jpg','低栏平板装卸方便，家具、建材、零散大件城市短途拉运，皮实耐用油耗经济，城市搬家、零散货运性价比首选。',0,'2026-04-23 06:35:20.859885',4),(16,'高栏载重载货轻卡','3',136000.00,113,'trucks/product/4_qabwBdT.jpg','加高栏板防护设计，散装、袋装货物不易洒落，承重合规多拉货，城乡镇城乡结合部日用百货拉运适配性极强。',0,'2026-04-23 06:35:54.065383',4),(17,'窄体巷运小微轻卡','3',98000.00,204,'trucks/product/5_1h6Y1Pq.jpg','超窄车身极致灵活，老旧小区、狭窄巷道轻松穿行，城市末端配送、快递小件送货，停车掉头都十分方便。',0,'2026-04-23 06:36:21.753121',4),(18,'仓栅式城市轻卡','3',142000.00,121,'trucks/product/6_nZWtXKw.jpg','仓栅通透设计，透气不闷货，农副产品、鲜活货物运输不易损坏，城乡双向配送场景全能适配。',0,'2026-04-23 06:36:44.280038',4),(19,'大型高空作业车','4',685000.00,12,'trucks/product/1_xq0Ewpq.jpg','多节伸缩作业臂，举升高度高、作业范围广，市政检修、路灯维护、外墙施工等高空安全作业专用，稳定防倾覆。',0,'2026-04-23 06:37:10.039188',5),(20,'应急抢险救援车','4',753000.00,8,'trucks/product/2_Q5qZ41h.jpg','套应急救援配套设备，供电、照明、破拆等功能齐全，城市应急、道路抢险、灾害现场快速响应作业。',0,'2026-04-23 06:38:01.912521',5),(21,'消防专用水罐车','4',896000.00,6,'trucks/product/3_tHjmmeX.jpg','大容量储水罐体 + 高压喷射系统，远距离持续供水灭火，厂区、园区、乡镇基础消防作业，响应速度快。',0,'2026-04-23 06:38:31.780351',5),(22,'环卫洗扫一体车','4',467000.00,21,'trucks/product/4_8wA2gJ5.jpg','清扫、洒水、高压冲洗三合一，路面垃圾、顽固污渍一次清理，城市道路、园区厂区日常环卫清洁作业专用。',0,'2026-04-23 06:39:05.188219',5),(23,'危化品专用运输车','4',598000.00,9,'trucks/product/5_xAa34Xf.jpg','防爆阻燃专属安全设计，全套危运安全防护配置，合规运输易燃易爆、液体危化类货物，全程安全可控。',0,'2026-04-23 06:39:55.736590',5),(24,'清障救援拖车','4',374000.00,17,'trucks/product/5_UlErGQg.jpg','重型拖拽牵引能力，托举 + 拖拽双功能，道路事故、故障车辆快速清障救援，高速、城市道路清障作业高效稳定。',0,'2026-04-23 06:40:30.872703',5),(25,'重载专用原厂轮胎','5',3280.00,960,'trucks/product/1_SPnVzBZ.jpg','重载耐磨专用花纹设计，抗撕裂抗偏磨，适配长途干线复杂路况，超长使用寿命，大幅降低高速爆胎风险。',0,'2026-04-23 06:41:00.946383',6),(26,'高性能柴油发动机总成','5',46800.00,42,'trucks/product/2_UCXqBgv.jpg','原厂正品动力总成，动力强劲油耗经济，适配多款主流重卡车型，耐久可靠、维修配件通用好找。',0,'2026-04-23 06:41:28.369540',6),(27,'车载智能导航车机','5',2190.00,315,'trucks/product/3_ckWTZmr.jpg','卡车专属车载大屏，货车专用导航 + 倒车影像 + 车载影音，大车限高限重智能提醒，行车安全大幅提升。',0,'2026-04-23 06:41:52.496330',6),(28,'加厚耐磨钢板弹簧','5',1860.00,528,'trucks/product/4_jLaJxx8.jpg','高强度合金钢材制造，重载减震承重能力强，颠簸路况不易断裂变形，提升整车行驶稳定性与载重上限。',1,'2026-04-23 06:42:18.543432',6),(29,'专用车载驻车空调','5',3570.00,207,'trucks/product/5_dSbvf6t.jpg','独立驻车静音空调，停车熄火也可长时间使用，节能环保低耗电，长途司机休息驻车降温必备配件。',0,'2026-04-23 06:42:41.298356',6),(30,'原厂专用变速箱配件','5',8900.00,76,'trucks/product/6_RY22UId.jpg','原厂精密传动配件，精准匹配原车型号，换挡平顺耐用，大幅降低变速箱故障概率，延长整车使用寿命。',0,'2026-04-23 06:43:03.258498',6),(31,'纯电干线重卡牵引车','6',798000.00,16,'trucks/product/1_s4nuYAT.jpg','大容量动力电池组，长续航稳定续航里程，零排放低噪音，园区、固定干线短途往返运输，用车成本大幅降低。',1,'2026-04-23 06:43:27.924737',7),(32,'混动节能工程重卡','6',675000.00,22,'trucks/product/2_1ZWFcb3.jpg','油电混合双动力模式，重载有劲、空载省油，工地、城市工程作业场景通用，节能减排，不限通行路段。',0,'2026-04-23 06:44:14.034162',7),(33,'纯电城市配送轻卡','6',186000.00,89,'trucks/product/3_fPu0M0t.jpg','纯电零排放蓝牌车型，城市全天不限行，用电成本远低于燃油车，城配、快递、商超日常配送绝佳选择。',0,'2026-04-23 06:44:43.159421',7),(34,'氢燃料智能牵引车','6',986000.00,5,'trucks/product/4_HPyQf4h.jpg','氢能源零碳排放，加氢快续航长，适配长途干线绿色物流场景，智能辅助驾驶加持，行车更安全更省心。',0,'2026-04-23 06:45:15.736547',7),(35,'新能源冷藏配送车','6',259000.00,34,'trucks/product/5_D0R2Ick.jpg','纯电冷链专属车型，独立恒温冷机，整车能耗低，城市冷链生鲜、医药恒温物资绿色合规配送。',0,'2026-04-23 06:45:43.464632',7),(36,'智能自动驾驶物流车','6',1120000.00,3,'trucks/product/6_93gotp3.jpg','高阶智能辅助驾驶系统，车道保持、自动跟车、主动安全预警，长途驾驶大幅减轻司机疲劳，未来智能物流标杆车型。',0,'2026-04-23 06:46:17.311428',7);
/*!40000 ALTER TABLE `trucks_truck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trucks_userprofile`
--

DROP TABLE IF EXISTS `trucks_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trucks_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `trucks_userprofile_user_id_949635eb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trucks_userprofile`
--

LOCK TABLES `trucks_userprofile` WRITE;
/*!40000 ALTER TABLE `trucks_userprofile` DISABLE KEYS */;
INSERT INTO `trucks_userprofile` VALUES (1,'avatars/3.jpg',2),(2,'avatars/vision_xmxdXHo.jpg',1),(3,'avatars/industry.jpg',3),(4,'avatars/news_banner.jpg',4),(5,'avatars/4.jpg',5);
/*!40000 ALTER TABLE `trucks_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_member`
--

DROP TABLE IF EXISTS `user_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `level` smallint NOT NULL,
  `activity_score` int NOT NULL,
  `last_login_time` datetime(6) NOT NULL,
  `today_download_count` int NOT NULL,
  `download_date` date NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_member_user_id_a994aed0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_member`
--

LOCK TABLES `user_member` WRITE;
/*!40000 ALTER TABLE `user_member` DISABLE KEYS */;
INSERT INTO `user_member` VALUES (1,1,2,'2026-05-17 15:38:55.449878',0,'2026-05-17','2026-05-17 15:38:28.359296','2026-05-17 15:38:55.449893',3);
/*!40000 ALTER TABLE `user_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-25 23:11:54

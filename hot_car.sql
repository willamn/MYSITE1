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
-- Table structure for table `trucks_hotcar`
--

DROP TABLE IF EXISTS `trucks_hotcar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trucks_hotcar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `cover_image` varchar(100) NOT NULL,
  `short_desc` varchar(200) NOT NULL,
  `detail_content` text,
  `sort` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trucks_hotcar`
--

LOCK TABLES `trucks_hotcar` WRITE;
/*!40000 ALTER TABLE `trucks_hotcar` DISABLE KEYS */;
INSERT INTO `trucks_hotcar` VALUES (1,'Robotruck','hotcar_covers/图片1.png','适用于厂区/园区的短途运输与配送、巡检与客制化载具。','<p><strong>产品关键信息汇总 ：</strong></p><p>覆盖型号、运行速度、续航、载重/尺寸、导航、认证、价格、交期与售后。&nbsp;</p><figure class=\"table\"><table><tbody><tr><td>项目&nbsp;</td><td>内容&nbsp;</td></tr><tr><td>产品编号 / 型号&nbsp;</td><td>ADTC-200 / 自动驾驶转运车；&nbsp;</td></tr><tr><td>设计运行速度&nbsp;</td><td>车速范围 0-25 km/h；最高车速 50 km/h；自动导航建议 0-10 km/h（视场地限速）。&nbsp;</td></tr><tr><td>续航与充电&nbsp;</td><td>动力电池 72V 3.7kWh 三元锂；续航 50km；AC220V 充电约 8h；支持可换电池。&nbsp;</td></tr><tr><td>载重与车体尺寸&nbsp;</td><td>最大负载 300kg；外形 1550×860×495mm；尺寸/货斗/电池容量可按项目定制。</td></tr><tr><td>导航方式与硬件&nbsp;</td><td>遥控、半自动、自动导航/避障可选；基础线控底盘 + 传感器/工控机按需求配置。&nbsp;</td></tr><tr><td>电机配置&nbsp;</td><td>驱动：1000W×4 或 2000W×2；转向 720W；制动 650W；CAN 2.0b，500k/s。&nbsp;</td></tr><tr><td>应用/测试案例&nbsp;</td><td>已有样车与厂区道路测试照片；&nbsp;</td></tr></tbody></table></figure><p><strong>核心电气与线控参数&nbsp;</strong></p><p>以下参数便于工程和采购快速核对。&nbsp;</p><figure class=\"table\"><table><tbody><tr><td>系统 &nbsp;</td><td>关键参数 &nbsp;</td></tr><tr><td>动力/驱动&nbsp;</td><td>轮毂电机：1000W×4 或 2000W×2；额定电压 72V；最大电流 50A；最大转矩 130N·m×4；最大转速 570RPM；控制响应 20ms；CAN 2.0b。&nbsp;</td></tr><tr><td>转向系统&nbsp;</td><td>最大输出功率 720W；12V DC；额定转速 1050rpm；额定扭矩 3.2N·m；转向范围 -124° 至 124°；转向精度 ≤1°；响应 90ms；最大承载 800kg。&nbsp;</td></tr><tr><td>制动系统</td><td>行车制动：线控液压盘式制动；驻车制动：线控电子驻车；额定功率 650W；直流无刷；建压时间≤150ms；最大建压 10MPa；输出力矩 0-4.7N·m。</td></tr><tr><td>电源系统&nbsp;</td><td>动力电池：72V/3.7kWh 三元锂；最大输出功率 10kW；BMS 过充/过放保护；AC220V 充电，约 8h；自然风冷；控制电路使用 12V 铅酸电池。&nbsp;</td></tr><tr><td>通信与控制&nbsp;</td><td>驱动/转向/制动均支持 CAN 2.0b 标准帧；通讯速度 500k/s；适合上位机、工控机或自动驾驶控制器接入。&nbsp;</td></tr></tbody></table></figure><p><strong>导航方式与所需硬件配置&nbsp;</strong></p><p>样车可作为线控平台，按项目预算从遥控到自动导航逐步配置。&nbsp;</p><figure class=\"table\"><table><tbody><tr><td>模式&nbsp;</td><td>功能说明&nbsp;</td><td>建议硬件&nbsp;</td></tr><tr><td>遥控 / 人工接管&nbsp;</td><td>低速调试、短距离搬运、应急接管；适合样机测试和封闭场景。&nbsp;</td><td>手持遥控器或上位机、车载显示屏、急停按钮、声光报警。 &nbsp;</td></tr><tr><td>半自动</td><td>按预设线路/任务点行驶，人工确认启动与停靠；可限制速度和工作区域。&nbsp;</td><td>控底盘、路径控制器、IMU/编码器、定位标签或二维码/磁条。&nbsp;</td></tr><tr><td>自动导航&nbsp;</td><td>厂区/园区自主行驶、路径规划、定点停靠；支持地图或 GNSS/RTK 方案。&nbsp;</td><td>工控机/域控、2D/3D LiDAR、RTK-GNSS、IMU、轮速编码器、摄像头。&nbsp;</td></tr><tr><td>避障能力&nbsp;</td><td>识别前方障碍物并减速/停车；安全策略需根据场景验证。&nbsp;</td><td>激光雷达/深度相机/超声波/毫米波雷达、安全触边、急停与冗余制动。&nbsp;</td></tr></tbody></table></figure><p><strong>载重能力与车体尺寸可定制区间&nbsp;</strong></p><p>以下定制范围需通过结构、动力与制动校核后确认。&nbsp;</p><figure class=\"table\"><table><tbody><tr><td>类别&nbsp;</td><td>基准配置&nbsp;</td><td>可定制区间/选项&nbsp;</td></tr><tr><td>外形尺寸&nbsp;</td><td>1550×860×495mm；轴距 1080mm；轮距 735mm。&nbsp;</td><td>车长 1400-2200mm；车宽 750-1100mm；货斗高度/上装 500-1200mm；轴距/轮距可随上装调整。&nbsp;</td></tr><tr><td>载重能力&nbsp;</td><td>最大负载 300kg。&nbsp;</td><td>推荐 100-400kg；如需 600kg 以上，应升级车架、驱动、电池、制动与悬挂</td></tr><tr><td>电池/续航&nbsp;</td><td>72V 3.7kWh；续航 50km；可换电池。&nbsp;</td><td>可选 5-7kWh 电池包、快充或双电池方案；续航按负载/路面/速度重新标定。&nbsp;</td></tr><tr><td>轮胎/底盘&nbsp;</td><td>12英寸轮胎；前后双叉臂独立悬挂；离地 150mm（空载）。&nbsp;</td><td>可选越野胎/实心胎/防滑胎；提升离地间隙与防水防尘等级。&nbsp;</td></tr><tr><td>货斗/上装&nbsp;</td><td>开放式货斗；高强度铝合金车架。&nbsp;</td><td>可定制封闭箱、翻斗、栏板、保温箱、喷涂颜色、品牌标识、安装孔位与传感器支架。&nbsp;</td></tr></tbody></table></figure>',0,1,'2026-05-30 12:03:13.527964');
/*!40000 ALTER TABLE `trucks_hotcar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-31 11:42:11

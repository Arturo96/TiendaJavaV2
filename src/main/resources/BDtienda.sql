-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: tienda
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CLIENTE`
--

DROP TABLE IF EXISTS `CLIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENTE` (
  `id` int NOT NULL AUTO_INCREMENT,
  `documento` varchar(15) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(70) DEFAULT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `email` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documento_UNIQUE` (`documento`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTE`
--

LOCK TABLES `CLIENTE` WRITE;
/*!40000 ALTER TABLE `CLIENTE` DISABLE KEYS */;
INSERT INTO `CLIENTE` VALUES (1,'1145246812','Daniel','Tellez Vargas','3014579457','Cra 35 # 10 - 45','lagarraasecina@hotmail.com');
/*!40000 ALTER TABLE `CLIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPRA`
--

DROP TABLE IF EXISTS `COMPRA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPRA` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente` int NOT NULL,
  `empleado` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_COMPRA_CLIENTE_idx` (`cliente`),
  KEY `fk_COMPRA_EMPLEADO_idx` (`empleado`),
  CONSTRAINT `fk_COMPRA_CLIENTE` FOREIGN KEY (`cliente`) REFERENCES `CLIENTE` (`id`),
  CONSTRAINT `fk_COMPRA_EMPLEADO` FOREIGN KEY (`empleado`) REFERENCES `EMPLEADO` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPRA`
--

LOCK TABLES `COMPRA` WRITE;
/*!40000 ALTER TABLE `COMPRA` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMPRA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DETALLECOMPRA`
--

DROP TABLE IF EXISTS `DETALLECOMPRA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DETALLECOMPRA` (
  `compra` int NOT NULL,
  `producto` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`compra`,`producto`),
  KEY `fk_DETALLECOMPRA_PRODUCTO_idx` (`producto`),
  CONSTRAINT `fk_DETALLECOMPRA_COMPRA` FOREIGN KEY (`compra`) REFERENCES `COMPRA` (`id`),
  CONSTRAINT `fk_DETALLECOMPRA_PRODUCTO` FOREIGN KEY (`producto`) REFERENCES `PRODUCTO` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DETALLECOMPRA`
--

LOCK TABLES `DETALLECOMPRA` WRITE;
/*!40000 ALTER TABLE `DETALLECOMPRA` DISABLE KEYS */;
/*!40000 ALTER TABLE `DETALLECOMPRA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLEADO`
--

DROP TABLE IF EXISTS `EMPLEADO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLEADO` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLEADO`
--

LOCK TABLES `EMPLEADO` WRITE;
/*!40000 ALTER TABLE `EMPLEADO` DISABLE KEYS */;
INSERT INTO `EMPLEADO` VALUES (1,'Carlos Arturo','Vargas'),(2,'Manuel','Villegas');
/*!40000 ALTER TABLE `EMPLEADO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTO`
--

DROP TABLE IF EXISTS `PRODUCTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUCTO` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipoProducto` int NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `imagen` mediumblob,
  `marca` varchar(50) NOT NULL,
  `descripcion` mediumtext NOT NULL,
  `precio` double NOT NULL,
  `cantidadInv` int NOT NULL,
  `mesesGarantia` int NOT NULL,
  `fechaPublicacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modelo_UNIQUE` (`modelo`),
  KEY `fk_PRODUCTO_TIPOPRODUCTO_idx` (`tipoProducto`),
  CONSTRAINT `fk_PRODUCTO_TIPOPRODUCTO` FOREIGN KEY (`tipoProducto`) REFERENCES `TIPOPRODUCTO` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTO`
--

LOCK TABLES `PRODUCTO` WRITE;
/*!40000 ALTER TABLE `PRODUCTO` DISABLE KEYS */;
INSERT INTO `PRODUCTO` VALUES (1,1,'Redmi Note 5',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	( \Z%#1!&)+/.038387(-.+\n\n\n\r\Z-&%/----+/---+-.-----7-+----------+5--+6----+-.---+7-��\0\0\�\0\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0E\0\0\0\0\01!AQqr\"23a��BR������\�\�#Cb��\��4S\�s����\�\0\Z\0\0\0\0\0\0\0\0\0\0\0\0�\�\0*\0\0\0\0\0\0\01!2\"AQ�#aq���\��\�\0\0\0?\0�\\��^c�\�\r\�S⎾��&�\�s�q\�\�=�Ɛ֦8�\�ݺ\�\�[\���J�6�n�	�4\ZV,���$Hַ��l߹H\�\��\�~\�,vc@\�ŧ\rA�D\r\�a5?��\�x�j\�M��� %\�Bz-��l\��\0Λ�#�f��t߹Z\�GZ8�֍\r��l\��\0Λ�(dk?\�\����Ue��d\�4T��\�vY+@s\�$�K.K�1F�\�o8�\�UE�Yr ^s��I\�\��\�\���\\�E�$�\�9ev�����>��V\�>Ϣ��\Z��r}\�\rO��>��G;��tGB%a��9\��\�֜	n u��k>Ϣ\�l\��G���\�\�&Wq�D[\'\�\��ǻ\nдsp@]�6F=�]{\\\�Q�4\�p���\�\��[��1���d \��}7�\0�d\�\"\��\�\�#pz\�c�\�m\�ia��T��H<\�f�Z3�Q�{�7Y\�$\�\�\0\0bJlQ�\�kÚs�5\�sH\�̛��\�C$/\�%ic�c�8�rU<����\�\� 3:7�Z�9��0\�Q��5\��1\��Ǉ�\�\�9�i�9\�q���ب�$\�a�\���\�29ύ�. @�O�\Z��r}�7T?����\�#hyLs�᦭uG��^�};U~0a��湵=U\�9.2\�-\�.c�\��a�\�Ե��m$ךu��/4\�=ˢsv�{\�l+�8ҫ��\Z��ARq\\\�\�fav\�5��\�\�O�\�2kɍ��F�]��=�WkrI�\�1&õ\'\�9x?\r2�\�V\�C/;�k\�ma9�g�4�փF8�O�O�\�/�\��\�4\�\�b�7I3\�n���&��\�\�SR�)䳾\Z�\r\�Sd\�TF\'��cg�tR\�\�]$�\���F4$~�\�_o-�\�5�sk[��:\�WͲ\�-y�m�7F�c���\�0�3��\�p_K��\0j\0.�\�Z\"�P�\�E�\0\�YB�\�R\\R�/\�G\��\�\�\�ڭq\������˜\�F��ƀ�\rEU\��&\�UW:{;asc��>��2\�\�7�e�[W\��\�s��\�%{h�i�F\�c����`A�QA8���Ҷh\�M�zP��b\�;��\�\�QU\�G?\�\�ƼL\�\�\�)t�X\�C@���\\Nv֤��m�\�9K6؅\�,k\�@ �Pnj��\r)�n\�m�Z\�uKh\�\\\�\�V���XYv\"\�\��\�\�\�\�o�5�]/x��f�A-\�\�\�S��� !\n/\�q�\� /d�5�{\��5\�O�zƥ�4�Ϝ��6P8�E\"!��C\�\�_;�֪�K\�Ś�ٝ	���\�\�&�ʖ�\�C]KZ\�Γ��RZ�7�\�\�;?�ZM��v\�\�\�y�a\�L9\�_��\�\�217�\�8�~X%g\�<M\�w��K\�\�,�FС��\�z2\�杲�\�^\r`\��^X�\�\�ĠV\'\�M	c\�a%�C�\0�F��wk\�\�\�a~������I	e�a-\�5\�\'�v��an\0\�C�ki\Zūk���n�\�R{;\�B&�\�Fb\�89\�\�0\�C�>o�\�\�p�M4,��/��|�\���8i ��W@_P\��\�k�E\�\�C���\����$����=*D�n\��RUmʤ�Q\Z?n�\�Nʱ5���h%ԣK�\�(k�9�қ��f\�U��N���l��(\�c|q\�\�\r\0;9�\�5\'|\�fs�#\r�Ů�}��q�*��\�Mk�2V�Y#��gb�G8\0.�\����YB�\0�!\0!@Ck\�\�\�wqQ\�y\�v~*K_G&\�ҫ\�e�YYL\Z\�Wix��R���/4\�=\�ɲ�N\�ܙ9\�g��\�\�rQ\�\�﵁d\�0~w��]ʘj⏦!�P\�\�l�Vn�=���A�\�Ph\�c\�͑��#K���p\'=\rEjiRJسt1\����˧Vn9~\r�\0N�v7�_v��\�js��\�346�:�\�v��9w��\�PH�0\�PH���2��.\�4�\�J�s�<\�\�~2\�O�\�\�ȊbIk�u\�V��\�5�\�`Fmb�(g���\�ٸA�����U�Z*��S��\�n�\�Z+;\'����V�\�:F��&AB\0B�� !m����J�c�\�m\�}�U\�_G&\�ҩ\��\0��r~T�\�\�I��N\�ܜ�/4\�=ɓ��c\�\�-��\r.\��\��E5��\�n\����p��g\�����gī��]cZ0isEq�q,*.�BrkR�ܕBaass2B\�\�k�tji\�i��V���:I\��%B@RUiʬ�S��\�n�\�Z+;\'x���V�\�:F��&A	*��H����#N�\�	\�K`�BB_G&\�ҪY?��r~Un\�\�ɺ\�t�,��6G\�!�\�.#��Mu6^i\�{��e杇�2sv\�c\�w�廓�6\�XV\��\r|Gf����6\�Q\�ګ��`6K\�c�KםLiWOj�%^\�\�ų\�T�YjrkS�\�P�\"�\"UeVJ�*T\�K\'����V�\�\��&\�U��Α����2�q8\�\�I0���ʑ\�(\�\�R��O�&k�\Z\�\�u�$֗���7�\�\�Q��\�\�2\�^� c��Ē�Y-r�ΒWin�uPP\n%�\��\�_\���ϫ>��2\�-\�d���i���G�~#��gp�G�DƴyO\�i\����R\�%\\\�\�\'�\�:�e��6c@n�s\�t�\�R\�\�r����G\����Y:\�\�mO\�f\��P7/\�,ǕvVj?�X�)\�cm\0��\��\�X\���-�\\���bя��<\�\�O\�\\y]�\����E\��\�7d\��2\�^D\�T�\�&_��OQ\�b\�=\�G� �fv�\�\�ˏ<;�\Z1ˏ�o�\��W^���I\�_G&\�ҫ\�e�iYL����\\�O����M\�{�S��\0q6\�>��S�$\�y�a\�NM��v\�\�\�\�эl�V\�O\�۱`\�q�q�\�[\�?�n\�=���\��\Z\�\�(\Z^\�5\0�|I�\�ړ����\�\�R��*芕\"\"�\"UeVJ�*T\�O\'x���U��i\�b�[�\�\Z\\@\�h1>a�̫\�\�t��\�\�\�1\�k\��Z\�8\�3�4��u��o.�ڃ�s�g�.q�])\�\�禊\�6=�张d�\�05��`Ķ\�]��s^_�\�ڗ]sIWM3��X2$��2�R�\�\\p>�j�\�\�l���:Y\�\�E\�\r\�G�\0;�/[e��+;Z\�q��1w�\�]K�\�\�A�p\�9�\�i\\���\�4ڹv\�%\����	\�\���6�\�Г\�����\���\"c��?\�ߖ��pI\�j�<�h{�\�Ez��t\�\���H\� \�+\�\�]OUt����\�\�\��=\�\�팇n��뿕^w/\��2�+\��\�g��\��7əi\�3�6�M\�\�Qm�1���\�?H4\���\\�R�����e��\�B�\�4rCO��y�\�r�w4\�<�ٽ\�\���-\\.7l_?\��ڛ\��\�\�\�\\!�1\�\�q\�L\�]r�\�\�sq�9��r�i�\�gϫ\0v�N\��Xm�\�\�4^\�A�X���3\�\�qeyxg\'\��ҵ�rn�\�*++#�\�!�\'�=�ҥ��rn�\�)�^t����5�\�y�a\�NM��v\�Û��r��\�u;B\�\��v,K_��\�\��F݊8{U���9p\�I��KIp\�I��DJ?�S���&59tEBD *J�\0VUd�VT�ƦN�7ʴVvN�7ʴV�\�B��~OH��\�c����D-�Y)5/fj\�Ƥ��ϧ49���z\'1�\Z����W�\�s�2\�|LWA�\�\�<\�ctyϺV�<\�Z\�^Y��\�\�\�O*\�=���\�f9�\�\\ů�\Zю1�Z\�\�i\n\�}�wH�\�cs҃\�՗&\03\��\��\�\�ү�<㺌�\0IǗ\�\�\�5�\'[c\�V�C\�Q?�x��|�l�;��\�[;\�vjq��h.�#�F���|��Q��)\�4���\�L�i��I\�<\�$i\�A\�m�7$\�q��\�s�o<7s�\��\�Hֺ\"-\Z\��)#k��z\�|�Zf.\nhɪ\�\�\�Y�\�?ao��\�\�~�^f�W;K|d�\�[�\�5\�Fp5էKJ\�ɹi�sb�Bo�0%�\��\0�ӫ>\�X�\�ϋ\�\��\�\�\��9g�\�E�2��Z\�}�sh	�\�\�\�8\�+���ټ6\�˃\�t�儖��H\�.>a�6�d�V���f�icx֍W�\�\�\�!��@�\�\�:V\�ɟ$\�G$\�Y�^\�\�ɺ\�\�f\�I\���\��97]\�\�7:N\�\�l�9e6Ni\�{��e杇�0\�mx3q\�\�m\�����\�\�wq[�?�n\�=�\��\�\�v��G$�,\�v��G$�F�\�t�ԩ�*duQT�ES�*�\0�ҫ�ҥN5�w\�\��h�\��{�\�Z+T\�!{\��n7\':��y�y��B\\Gl|as\�n�F\��z\��c���=���6\�\�T��h+��?\0�\Z˓w�L/9\�I�r�Z�\�WݣNb*<�\0\�\�\�m�ln{	\�W783S�\Zz�\'ߪݿ�q�km��[�Ӏ..a\�	\n{%��rݢ���\���\�\�\�szG>\��р�\06�u�f\�Ӝ\��2y��x}\�׫SLN\�ԩ\���8\�h�^~N[g�w\��\�\�̋Ô\��P\�y\�rǛ$\�X~͌�F0d\��\�\�]Ol&K#_9{\�\\\�8�ՠ%��\���\�\��Gk��\�<n�V\�\�\�%\�8��f�p%��\��c�\�\�sI�WW��x�Z��W\Z�3\0\0\�NF8\�Y]���rn�\�)�nt���}���u\�\�Qٹ\�v~)\�ZM��v\�\�\�y�a\�L9\�^\�wq[�?�nŇj���\�+s\'�mأ��[?XÛԟ�\�͇ؒjO\�rlj�s���4%]R���P�	�*���*���q���\�p��Egd\�\�?*\�Z\�Q\�Y| \�\�h�\�c7\�4�i\�\"�еWR\�\�\�RY��d1?���&��-}yM:�G�u�.p��7\\~\�\��?�^�\�\r�\�y\�\r�\�I#G0\��]\�\��\�S�6�\�]\�i,�O���N��u�^_��nx��{x�̼\�\�O�t������\�]�Zt\rZ6{oŒ��wr\�k3��KS\ZD��{�\��^\0\�g\��.\r`ofx\�=�\��\�\rY-Dq��r��q���\�z���rz\�\\�?�T�\�\�ɶF�\"`�\�\�ִ\r\0\n\0�!	��!\r���u\�\�Qٹ\�v~*K_G&\�ҙf\�I\���B\�l�Ӱ�\'&\�\�;ra\�Z�f㻊\�\��v,;V\�wq[�?�n\�=�\��\��v��G&Ɲ>�?Qɑ�^\�Γ���*`�Sj�2B�[ ��17]tm4����\�KNъ�-���T�5<��k\�wڦ�;��֮s�bpH\�ZE`�ҔQY;\��ʴVvN��\���u\�aBd� 4j	P�\0�!\0!@Ck\�\�\�w�S,\�\�;?�_G&\�ҙf\�?��J��\�y�a\�NL��v\�Ý�`\�\�w���6\�Xv��\�\�2F݊8{U���)�\�I��Q�I>�?Q\�&(^\�Γ�*hJ�9MEPBDU\0ZE`�\�%Cs\'}\�\��V�\�\�\�w�~U��c\�g��!	�B�� !B_G&\�ҙf\�?��O��rn�\�)�~s�?�YM��v\�\�\�y�a\�L9\�^\�ws�\�O\�۱aڰf㻜�2F݊8{U���F�?Q\�&)mv��G(XT/n\�I\�T�S��T$�Z�	*���ȧ%W�\�w&�\�\��V�̰\Z�\�tm �Oɖ\�%t��\�4^\�掵��5\�!2HU\�䠬W6\0R��oF� 4��c�A\�v��ZV�\�H\�k\�)\�\"�\�)�\r��U���8\�\�\�\nV�\�\\?�P,�!m}���Je���\�\�Q�e	%l���-�P\�R���\�r̓17�\�\��~)P��/4\�=\�ɒ�N\�ܘs����\�2F݋Ճ7�-̟ѷb�\�l�c��\�\�\�4�\0\�<T8�V�<\�u�*3V}���K-\�dcK\�\�\�h\�yC_^\�N0pջ\�s;�Y��]U1�ŶJt�l5�)D�Y��M�7\�o����\�\�C\�Z\��\�T�۬��\���\0#=`�1�\�g�\�\ZZ�\�g\�T_n�ꏪ�\�3\�g�\�3����7F�KƳ\�U�\ZϠ}Sx\����Q=\��\�\��$L%�T3��G$\�\�j�pkw��\0�\�2e�(A�3�f5�\���fϔ\�U�k�\\\�\�V�2�F|�\\\Z\�\�ꋃ[�w�T~\�h����\�%��޻���5�\�\�3\�\Z�j6\�Ʒz\����\Z\�\�\�\�\rG�5\�\Z\�\�ꋃ[�w�S<!�����}��޻���5�\�\�3�jGZ�3�\0\�Hږ��X\�0$���Y2{1\�ez���\�Y�R)]\�\���i\��\�\�\�ځ\�ZvK8`4.%Φ�>���\�\�I\�e杇�96A�\�=ˢs>���\�=yZ?\�\�ɵ\�\�P\�\\ޅ\�O��{�\�ѳ`*<~\�nOX�R�s���z�\�وJ�\Z��$B�\\� \"*�!B��^B��P� �J� �\"Am\�!w%�a\\B�=\'{*\n�&m���-�.1\�˨�\�','Xiaomi','Especificaciones: El Xiaomi Redmi Note 5 es uno de los celulares con mejor relación calidad-precio dentro de su gama. Sus especificaciones son las siguientes:<br><br>Procesador: Qualcomm Snapdragon 636<br>Memoria RAM: 4 GB<br>Almacenamiento: 64 GB<br>Colores: Negro / Blanco<br>Pantalla: IPS de 5.99\'',440000,6,6,'2020-03-25 19:22:04');
/*!40000 ALTER TABLE `PRODUCTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROL`
--

DROP TABLE IF EXISTS `ROL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROL` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROL`
--

LOCK TABLES `ROL` WRITE;
/*!40000 ALTER TABLE `ROL` DISABLE KEYS */;
INSERT INTO `ROL` VALUES (1,'Admin'),(3,'Auditor'),(4,'Cliente'),(2,'Vendedor');
/*!40000 ALTER TABLE `ROL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPOPRODUCTO`
--

DROP TABLE IF EXISTS `TIPOPRODUCTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TIPOPRODUCTO` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPOPRODUCTO`
--

LOCK TABLES `TIPOPRODUCTO` WRITE;
/*!40000 ALTER TABLE `TIPOPRODUCTO` DISABLE KEYS */;
INSERT INTO `TIPOPRODUCTO` VALUES (1,'Celulares'),(2,'Auriculares'),(3,'Portatiles'),(4,'Pendrives'),(5,'Micro SD'),(6,'Altavoces');
/*!40000 ALTER TABLE `TIPOPRODUCTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO`
--

DROP TABLE IF EXISTS `USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USUARIO` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `password` varchar(30) NOT NULL,
  `rol` int NOT NULL,
  `cliente` int DEFAULT NULL,
  `empleado` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `cliente_UNIQUE` (`cliente`),
  UNIQUE KEY `empleado_UNIQUE` (`empleado`),
  KEY `FK_USUARIO_ROL_idx` (`rol`),
  CONSTRAINT `FK_USUARIO_CLI` FOREIGN KEY (`cliente`) REFERENCES `CLIENTE` (`id`),
  CONSTRAINT `FK_USUARIO_EMP` FOREIGN KEY (`empleado`) REFERENCES `EMPLEADO` (`id`),
  CONSTRAINT `FK_USUARIO_ROL` FOREIGN KEY (`rol`) REFERENCES `ROL` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO`
--

LOCK TABLES `USUARIO` WRITE;
/*!40000 ALTER TABLE `USUARIO` DISABLE KEYS */;
INSERT INTO `USUARIO` VALUES (1,'pacho','pacho',4,1,NULL),(2,'arturo96','admin',1,NULL,1),(3,'tandu','tandu',2,NULL,2);
/*!40000 ALTER TABLE `USUARIO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-25 16:10:41

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
INSERT INTO `PRODUCTO` VALUES (1,1,'Redmi Note 5',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	( \Z%#1!&)+/.038387(-.+\n\n\n\r\Z-&%/----+/---+-.-----7-+----------+5--+6----+-.---+7-ÿÀ\0\0\á\0\à\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0E\0\0\0\0\01!AQqr\"23a‚±BR‘’¡²Á\Â\Ñ#Cb“³\Òğ4S\ás¢ƒñÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0*\0\0\0\0\0\0\01!2\"AQğ#aq¡Á\áÿ\Ú\0\0\0?\0õ\\¯”^cŒ\İ\r\ç¿Sâ¾½‹&ı\îs¤q\×\Æ=¾ÆÖ¦8¹\Äİº\ç¼\é½[\ÔøƒJ¸6õn‡	¦4\ZV,­µ§$HÖ·ñşlß¹H\Ï\Çù\Ó~\å,vc@\ìÅ§\rAó©D\r\Åa5?ó¦ı\Éx¶j\çMû• %\âBz-ªñl\Ôÿ\0Î›÷#Šf§ştß¹Z\âGZ8‘Ö\rªñl\Ôÿ\0Î›÷(dk?\æ\Íû•óUe‰±d\î4T¬©\ÍvY+@s\ç$­K.K1Fƒ\Öo8“\ëUE‘Yr ^s’òI\ë\İ‚\Ğ\ã§ş\\ŸE£$›\Ò9evÁ›¬û>ˆğV\ë>Ï¢“Œ\ZŸùr}\Æ\rOü¹>‹½G;ª­tGB%a™ 9\Ñ°\ÈÖœ	n u©¼k>Ï¢\çl\Ü³G””\Ã\í&Wq„D[\'\×\ÈÀÇ»\nĞ´sp@] 6F=]{\\\ÇQ“4\İp¡¡ \Ğ\â¨[¥ğ1ø¿d \ëö}7ÿ\0ƒd\ï\"\×ù\Ö\Å#pz\Éc\Ém\Îia¾ûTºH<\×f­Z3ıQ¨{­7Y\Ú$\Ğ\ä’\0\0bJlQ±\íkÃšs‡5\ÍsH\ÖÌ›”¬\ì´C$/\ã%ic‹c8¤rU<Ÿ‘¡‚\È\ë 3:7‰Z÷9’0\êQ´Š5\êô1\ÆğÇ‡´\à\æ9®i¦9\Âq²ƒ¯Ø¨ğ$\Åaˆ\Å•Á\Ï29Ïõ. @OŒ\ZŸùr}¨7T?üó„‘\É#hyLs˜á¦­uG¢‹^…};U~0aœ…æ¹µ=U\Ô9.2\Ù-\Å.c›\Õöa§\ÚÔµ®‡m$×šuœ›/4\ì=Ë¢sv‹{\Îl+˜8Ò«¡²\Z±§ARq\\\Ô\ì¡fav\ë‰5««\Ê\ÑOŠ\è2kÉµ¥F£]š…=ıWkrIô\Í1&Ãµ\'\ê9x?\r2³\íV\ëC/;Šk\Ìma9ˆg”4ŠÖƒF8’O¼O\Û/¾\åóª\Í4\Ö\éb‚7I3\Şn±‚®&—‰\ê\ÍSR)ä³¾\Zü\r\ËSd\ëTF\'‘cg„tR\Æ\ç]$·\ÊƒF4$~±\È_o-º\ç5®sk[¤´:\èWÍ²\Ù-y¢m¢7Fòc‘¡ô\å0»3ˆ\Ìp_K±´\0j\0.¹\àZ\"‰P¦\ì”E¡\0\ÒYB¶\åR\\R¢/\ØG\Ô†\Ú\Ü\â­Ú­q\Ä‘Á ›­Ëœ\êFÆ€š\rEU\Éş&\ë¾UW:{;asc–“>üŒ2\Ç\Å7‹eÀ[W\í¡¨¥\ÒsŠ´\è%{hÁiF\ßcƒ™Ÿ”`A¡QAÂŠ8²ŒÒ¶h\ÌM½zPöñb\ï;•…\Ì\ÉQU\ÓG?\Ú\ËÆ¼L\æµ\Â\Ï)t‘X\êC@Œ±·\\NvÖ¤š¨m¡\Æ9K6Ø…\é,k\Ò@ PnjŠš\r)“n\ÉmZ\ÜuKh\Ò\\\Ú\áV¯µXYv\"\æ\Îø\Ş\æ\È\áo†5’]/xºúf¥A-\Ã\Æ\ÕS¨€„ !\n/\Éq—\Ë /d“5¬{\Ø÷5\ÔO’zÆ¥™4±Ïœ·ˆ6P8ùE\"! ‘C\Ï\ä_;ùÖªşK\àÅšÀÙ	œ—´\Ç\Ú&œÊ–\ãC]KZ\ËÎ“³ñRZú7î»¸¨\ì¼\é;?¨ZM—šv\ä\ä\Ùy§a\îL9\Û_‰¸\î\â´217¥\Ô8ª~X%g\Û<M\Çw§’K\ç\Ê,öFĞ¡‡º\Ùz2\çæ²û\î^\r`\á²^Xš\Ò\ØÄ V\'\ÆM	c\ãa%§C\0úFšwk\ï\Æ\×a~ó©ªó‰ø¯œøI	e¾a-\æ5\â\'“v®ºan\0\âCki\ZÅ«kœúnğµ\ÙR{;\ÌB&À\ÑFb\ç89\Ô\Ì0\éCŸ>o¡\×\Ëp´M4,‰—/˜˜|¼\Ğ¾§8i »¨W@_P\Äû\Ík¨E\à\ÓC˜ŠŠ\Ğõ®ù$š°»=*Dªn\Â„RUmÊ¤©Q\Z?n»\åNÊ±5Á¡öh%Ô£Kš\à(k§9¨Ò›“ñf\ë¾U¢´N’½²l¶(\Ùc|q\×\Ä\r\0;9 \ë5\'|\èfs›#\rÅ®¿}®¹qõ*¢•\ÛMk¡2V°Y#‰¿gb½G8\0. \ç‰¥™YB„\0„!\0!@Ck\è\ä\İwqQ\Ùy\Òv~*K_G&\ë½Ò«\ÙeûYYL\Z\ÇWix§ıR¦¼›/4\ì=\ÉÉ²óN\ÃÜ™9\Ûg‰¸\î\âµrQ\Ì\áªïµd\Û0~w¡‘]Ê˜jâ¦!ôP\Ã\İl½Vn†=Ÿ±øAÀ\ëPh\ãc\à¹Í‘·›#K±£šp\'=\rEjiRJØ³t1\ìø«©Ë§Vn9~\rÿ\0N¬v7ñ€_vª¹\Äjs‰¥\Ü346¸: \Ñv‰9w½¹\ÑPH§0\ÏPH¡¶š2º£.\Ü4»\ÍJ¤s¤<\Ğ\Ê~2\àO˜\ß\ÌÈŠbIk›u\àV•¼\Ò5´\é`Fmb³(g¸õ‚\ãÙ¸Aö–¢„…U•Z*¤©SŸ\ân»\åZ+;\'ø›®ùVŠ\Ó:Fö„&AB\0B€„ !m›®÷J§cş\âm\È}ùU\Ë_G&\ë½Ò©\Øÿ\0¸›r~T¯\à\ÚI²óN\ÃÜœ›/4\ì=É“›¶c\ã½\×-œ—\r.\Òğ\ÚöE5³÷\î¹n\äş»pö«g\ëõ›¡gÄ«¨®]cZ0isEq q,*.–BrkR®Ü•Baass2B\Ö\èkštji\Ìi¶ªV¶™ñ:I\Çı%B@RUiÊ¬©SŸ\ân»\åZ+;\'x›®ùVŠ\Ó:Fö„&A	*¼Hô „Á#N‘\é	\ÕK`¨BB_G&\ë½ÒªY?¸›r~Un\×\ÑÉº\ït¨,±6G\é!\ê .#¼¥Mu6^i\Ø{““eæ‡¹2sv\Üc\Üwºå»“ú6\ìXV\Æó\r|Gfó»“ú6\ìQ\ÃÚ«Ÿ¬`6K\Ìc©K×LiWOjš%^\Ï\ĞÅ³\âTğ¨»YjrkS‚\ì‚P‘\"¡\"UeVJ«*T\ãK\'ø›®ùVŠ\Ï\Éş&\ë¾U ´Î‘½…•2ôq8\Ä\ÚI0‹±·Ê‘\Ş(\ï\ÑR³øO–&kü\Z\Ï\ÈuÁ$Ö—³‚7ó\Í\×Q¾œ\Ë\Ë2\î^ cŠ¦Ä’óY-rŒÎ’WinŠuPP\n%\Ôñ\Û_\ÇøòÏ«>š2\Ø-\ãd’‘i¥ŸñG¤~#ş…gp’GšDÆ´yO\å¿i\Ğ³„R\Í%\\\â\ç\'\Ü:—eÁş6c@n°s\Şt¿\àR\Ã\âròù´¾G\ÉøüıY:\Ç\ÚmO\æf\ÊğP7/\Û,Ç•vVj?™X“)\Ãcm\0«ô\éœ\èX\Î¥¬-ò\\¯°bÑôû<\í\çO\ë\\y]\ïüöE\á¬\Í7d\Ó³2\Ù^D\ËT\æ&_‡’OQ\ëb\ë¸=\ÂG‚ µfv\à\í¨Ë<;ó\Z1Ë–o\ÅıW^„€¥I\Ê_G&\ë½Ò«\ÙeûiYLÁ±º»\\ñOú«¾M\×{¥S±ÿ\0q6\ä>ü©S$\Ùy§a\îNM—šv\ä\É\Í\ÛÑlºV\îO\èÛ±`\Ûqqş\é[\Ù?£n\Å=ª¹ú\Æ˜\Z\Ğ\Ğ(\Z^\Ğ5\0ò|I²\áÚ“õ‹¿\Â\ËR¦µ*èŠ•\"\"¡\"UeVJ«*T\ãO\'x›®ùUŒ¥i\âb’[¥\×\Z\\@\Îh1>aŸÌ«\ä\ïtüŠ\í¢\È\×1\ík\ØğZ\æ8\×3‚4…¦uü¼o.ğ˜Úƒˆs›g©.q«])\Ô\Úç¦Š\Ó6=–å¼ d‘\Ç05£´`Ä¶\ë]£Œs^_œ\ÂÚ—]sIWM3Š”X2$ò’÷2€R\Ú\\p>jó‹\Ï\ílù­ñ:Y\à\ìE\Ï\r\çGÿ\0;ö/[e¥–+;Z\Úq‡¢1w›\×]K’\à\ÆAğp\é¤9À\Ìi\\úúõ\í4Ú¹v\×%\ç…Œº	\Ù\éÁ›6œ\ëĞ“\ìğùŸ™\Éü¿\"c•ñ?\æ–ß–‰®pI\Òj¹<§h{\àEz¾¡t\Ù\ÍôµH\é \Ö+\Ç\Ì]OUtŸø½‘\â\ë\Şö=\Ü\ËíŒ‡n½¦ë¿•^w/\Èú2ó+\ßø\ßg„²\Ïô7É™i\Ã36¯M\à\ÎQmª1†®§\Ù?H4\Ãùô\\¶RşŸ¼¼ˆe†¸\ÒBø\Í4rCO²¸y–\×r¶w4\Ë<’Ù½\Î\Î¦Š-\\.7l_?\éøÚ›\Õü\ã¾\à\Æ\\!ş1\åŒ\Ìq\ÓL\Ô]rñ\Û\Äsq‘9·™ri¥\àgÏ«\0v¯N\àXm¶\Ë\Ã4^\ÛAõXù°ú3\×\â¶qeyxg\'\çòÒµôrn»\İ*++#©\Ê!­\'¨=§Ò¥µôrn»\İ)–^tŸŠ5”\Ùy§a\îNM—šv\äÃ›µ´r›\Òu;B\İ\Éıv,K_‰¸\î\â¶òFİŠ8{U³õŒ9p\íIúKIp\íIúDJ?—S¥–§&59tEBD *J¡\0VUd•VT©Æ¦Nñ7Ê´VvNñ7Ê´V©\ÔBöò~OH´º\×cŒ¹³ûD-¥Y)5/fj\ÑÆ¤Ï§49‚ö‡z\'1£\Z´´¤’W®\Ñsœ2\Ê|LWA¥\à\ç<\êctyÏºV<\îZ\Ç^Y¹­\ã\Æ\å¿O*\å=‘¢ø\Öf9õ\ê\\Å¯‡\ZÑ1œZ\æ\Şi\n\Æ}®wHü\â´csÒƒ\àÕ—&\03\ãš\Ïú\Ğ\×Ò¯—<ãºŒÿ\0IÇ—\ï\ä\í5«\'[c\àVŒC\ÙQ?ˆx©ö|±l°;Š¶\Ò[;\évjq‘¸h.¦#¯F±Š‚|…‡Q¦—)\è4öŠ«\ÖL™i…·I\à<\è$i\ëA\ëm—7$\Öq¯‹\ãsüo<7sõ\êµø\çHÖº\"-\Z\Âù)#k‚z\â|—Zf.\nhÉª\Ò\×\ÌY™\Ì?ao‹©\Í\Í~^fœW;K|d›\î“[ö\Î5\ÄFp5Õ§KJ\ÖÉ¹isb¶Bo³0%“\Çÿ\0˜Ó«>\èX³\áÏ‹\î\ã¾¯\Ï\ã\æû9gŸ\ÕE”2¶Z\Û}¿sh	¾\Ğ\Ë\î8\â+¿şÙ¼6\ØËƒ\ßt¹å„–²˜H\É.>aµ6ÁdŠV‹³²fŒicxÖW‚\Ü\È\Ö!œ‘@–\Ç\è©:V\ÍÉŸ$\ÛG$\â˜Y‹^\×\ÑÉº\î\â™f\çI\Ùø§\Úú97]\î”\Ë7:N\Ï\Ål¯9e6Ni\Ø{““eæ‡¹0\çmx3q\İ\Åm\äş»¯\Ä\Üwq[™?£n\Å=ª\Ùú\Æ\Øv¤ıG$‰,\Øv¤ıG$‰Fö\êt°Ô©¡*duQT•ESª*‘\0ªÒ«ªÒ¥N5²w\İ\î‘h¬\ì÷{‡\äZ+T\ê!{\Ï©n7\':£ˆy‰yú¯B\\Gl|as\Ín·F\ãğz\Ññ®³cù“ü=ş¬¯6\à\äT¡¥h+¶µ?\0½\ZË“wL/9\ÇI¦rZ\äWİ£Nb*<ÿ\0\Ë\Ë\Ñm³ln{	\æW783S¬\Zz¹\'ßªİ¿³q™km[˜Ó€..a\Ø	\n{%€rİ¢‘›\â¸—¾\Ñ\Å\ŞszG>\áº÷Ñ€\06€uf\ÊÓœ\Íû2y¥x}\ê×«SLN\ÃÔ©\ÍÁ8\ïhü^~N[gw\Ï÷\å\ê–Ì‹Ã”\ÌşP\Äy\ÇrÇ›$\ÛX~ÍŒ¶F0d\à\Ôï¨\ê]Ol&K#_9{\Ş\\\ê8½Õ %ºó\ç§\Ä\ÆùGkœ³\ë<n¥V\å\Ç\É%\Ê8ü‰f–p%ƒÁ\Èñ‰c˜\Ş\ĞsIõWW’òx€Z“‰W\ZÀ3\0\0\êNF8\ÈY]¡µôrn»\İ)–ntŸŠ}¯£“u\Ş\éQÙ¹\Òv~)\ÒZM—šv\ä\ä\Ùy§a\îL9\Ë^\Üwq[™?£nÅ‡jÁ›\î+s\'ômØ£‡µ[?XÃ›ÔŸ¨\äØ’Í‡jO\Ôrlj·s¥€•4%]R¦¥ªP‘	*´ªÁ*´«šq±“¾\ïpü‹Egd\ï»\Ü?*\ÑZ\çQ\ØY| \É\æh¹\ãc7\ã®4¡i\ê\"£ĞµWR\ê\í\ÎRYªğ¬½d1?Œ&¢”-}yM:G¤u­.p‰¬7\\~\Í\Øõ?^ƒ\Â\r¶\Ñy\ì\r¾\áI#G0\ëò]\×\éÀ\æ™S6ˆ\Ü]\æi,˜Oı«NŒøu•^_§’nx©ü{x¾Ì¼\Ï\ÃO„t…¶›¨ö\æ]¥Zt\rZ6{oÅ’ò¾wr\ì¶k3šKS\ZD´®{­\Â÷^\0\çg\äˆò¬.\r`ofx\Ü=§\Ìô\î\rY-Dq¶·r©öqÁ¿‰\İz‚‡órz\é\\¾?¿T¿\ì\×É¶FÁ\"`º\È\ÚÖ´\r\0\n\0­!	€„!\r¯£“u\Ş\éQÙ¹\Òv~*K_G&\ë½Ò™f\çI\Ùø¥B\Êl¼Ó°÷\'&\Ë\Í;ra\ÎZğfã»Š\Ü\Éıv,;V\Üwq[™?£n\Å=ª\Ùú\Æøv¤ıG&Æ>©?QÉ‘¨^\İÎ“„©¡*`©Sj•2Bû[ “›17]tm4¢•´\ĞKNÑŠ­-’·¹T½5<¦´k\ÑwÚ¦Š;·³Ö®sµbpH\ÒZE`ªÒ”QY;\î÷Ê´VvNû½\Ãò­®u\ïaBd„ 4j	P„\0„!\0!@Ck\è\ä\İwºS,\Ü\é;?û_G&\ë½Ò™f\ç?³ñJ…”\Ùy§a\îNL—šv\äÃµ`\Í\Çw¹“ú6\ìXv¬¸\î\â·2FİŠ8{U³õŒ)ğ\íIúQ±I>©?Q\Ê&(^\İÎ“µ*hJ˜9MEPBDU\0ZE`ª\Ò%Cs\'}\Ş\áùVŠ\Î\É\ßw¸~U¢¶c\Ôg½„!	B€„ !B_G&\ë½Ò™f\ç?³ñOµôrn»\İ)–~sû?¨YM—šv\ä\ä\Ùy§a\îL9\Ë^\Üws–\æO\èÛ±aÚ°fã»œ·2FİŠ8{U³õŒF©?Q\Ê&)mv¤ıG(XT/n\çI\ÂTÀSª€T$ªZ 	*Š «È§%W‘\ãw&ı\Ş\áùVŠÌ°\Zº\Ûtm OÉ–\é%tñ\Ü4^\ßæµ³£5\í „!2HU\Ûä ¬W6\0R´®oFš 4©›c«A\ëvö»ZV˜\èH\ëk\è)\É\"´\Ì)Ÿ\r¨¨U¬ö—8\Ğ\Æ\æ\nV®\×\\?ŸP, !m}›®÷JeŸœş\Ï\ÅQ³e	%l¡ñù-¹P\áRú‹¹\ÆrÍƒ17¬\Ü\çö~)P²›/4\ì=\ÉÉ’óN\ÃÜ˜s¶¬¸ş\â·2Fİ‹Õƒ7ó-ÌŸÑ·b\Õlıc›´\È\à\ç4´\0\×<T8—Vñ<\Úu*3V}¹¾«K-\ØdcK\Ú\ì\ïh\çyC_^\ÏN0pÕ»\ís;ÀY³–]U1²Å¶JtŠl5ø)DƒYôµM²7\Ëo¬„Œò\Ù\ëC\ÔZ\ã³\èT·Û¬ú£\êªñŒÿ\0#=`1Ÿ\äg¬\İ\ZZ¾\İg\ÕT_n³êª«\Æ3\Ëg¬\Æ3üŒõ‚7F–KÆ³\èU\ZÏ }Sx\Æ‘°Q=\Íò\Û\ëƒ$L%ˆT3´ŒG$\İ\ïj½pkw®ÿ\0ª\ç2e¾(Aš3—f5¸\á§ù·fÏ”\âU¯k·\\\Ó\ì­V¼2–F|ñ²­\\\Z\İ\ë¿ê‹ƒ[½wıT~\İhğ†®ö\á%Á­Ş»ş¨¸5»\×\Õ3\Â\Zj6\âÆ·z\ïú£‹\Z\İ\ë¿\ê™\á\rG„5\Ü\Z\İ\ë¿ê‹ƒ[½wıS<!¨ğ†§°}Á­Ş»ş¨¸5»\×\Õ3jGZ˜3’\0\ÖHÚ–ÁüX\Ç0$—°œY2{ï˜1\Ìezø°ó\ï…Y¹R)]\Å\Äğ÷i\âş\Ò\î\ÒÚ\éZvK8`4.%Î¦—>À–÷\Ñ\ëI\Óeæ‡¹96A˜\ì=Ë¢s>·‹¯\×=yZ?\Ú\ßÉµ\â\ÛP\Ã\\Ş…\ÎO›£{ó®\ÇÑ³`*<~\ÕnOX•R´s„ùz‰\ãÙˆJ…\Z¡„$B€\\„ \"*¤!Bº^Bª™P„ ÀJ„ ¡\"Am\æ!w%ôa\\B®=\'{*\nº&m§¤ô-„.1\îºË¨ÿ\Ù','Xiaomi','Especificaciones: El Xiaomi Redmi Note 5 es uno de los celulares con mejor relaciÃ³n calidad-precio dentro de su gama. Sus especificaciones son las siguientes:<br><br>Procesador: Qualcomm Snapdragon 636<br>Memoria RAM: 4 GB<br>Almacenamiento: 64 GB<br>Colores: Negro / Blanco<br>Pantalla: IPS de 5.99\'',440000,6,6,'2020-03-25 19:22:04');
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

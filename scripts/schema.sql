DROP DATABASE IF EXISTS amaralguincho;

CREATE DATABASE amaralguincho;

USE amaralguincho;

-- MySQL dump 10.13  Distrib 5.7.15, for osx10.12 (x86_64)
--
-- Host: amaralguincho.mysql.uhserver.com    Database: amaralguincho
-- ------------------------------------------------------
-- Server version	5.6.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `id_cargo` BIGINT NOT NULL AUTO_INCREMENT,
  `cargo` TEXT  NOT NULL,
  `salario` TEXT NOT NULL,
  PRIMARY KEY (`id_cargo`),
  UNIQUE KEY `uq_cargo` (`cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Administrador',100000),(2,'Secretaria',1000),(3,'Motorista',800),(4,'outro',900);
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cli` BIGINT NOT NULL AUTO_INCREMENT,
  `nome_cli` TEXT  NOT NULL,
  `sobrenome_cli` TEXT  DEFAULT NULL,
  `cpf_cli` TEXT  DEFAULT NULL,
  `email_cli` TEXT  DEFAULT NULL,
  `sx_cli` TEXT DEFAULT NULL,
  `telefone_cli` TEXT  DEFAULT NULL,
  `dtnasc_cli`  DEFAULT NULL,
  `cep_cli` TEXT  DEFAULT NULL,
  `bairro_cli` TEXT  DEFAULT NULL,
  `cid_cli` TEXT  DEFAULT NULL,
  `uf_cli` TEXT DEFAULT NULL,
  `endereco_cli` TEXT  DEFAULT NULL,
  `img_cli` text,
  PRIMARY KEY (`id_cli`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frota`
--

DROP TABLE IF EXISTS `frota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frota` (
  `id_frota` BIGINT NOT NULL AUTO_INCREMENT,
  `nome_frota` TEXT  DEFAULT NULL,
  `modelo_frota` TEXT  DEFAULT NULL,
  `ano_frota` TEXT DEFAULT NULL,
  `fabricante_frota` TEXT  DEFAULT NULL,
  `tipo_frota` TEXT  NOT NULL,
  `placa_frota` TEXT NOT NULL,
  `cor_frota` TEXT  DEFAULT NULL,
  `img_frota` text,
  PRIMARY KEY (`id_frota`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frota`
--

LOCK TABLES `frota` WRITE;
/*!40000 ALTER TABLE `frota` DISABLE KEYS */;
/*!40000 ALTER TABLE `frota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `id_func` BIGINT NOT NULL AUTO_INCREMENT,
  `id_cargo` BIGINT NOT NULL,
  `nome_func` TEXT  NOT NULL,
  `sobrenome_func` TEXT  DEFAULT NULL,
  `dtnasc_func` TEXT DEFAULT NULL,
  `cep_func` TEXT  DEFAULT NULL,
  `cpf_func` TEXT  DEFAULT NULL,
  `dtcont_func` TEXT DEFAULT NULL,
  `sx_func` TEXT DEFAULT NULL,
  `tel_func` TEXT  DEFAULT NULL,
  `email_func` text,
  `residencia_func` TEXT  DEFAULT NULL,
  `bairro_func` TEXT  DEFAULT NULL,
  `uf_func` TEXT DEFAULT NULL,
  `cid_func` TEXT  DEFAULT NULL,
  `img_func` text,
  PRIMARY KEY (`id_func`),
  KEY `id_cargo` (`id_cargo`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,1,'root',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'root@ag.com',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`amaralwebmaster`@`%`*/ /*!50003 TRIGGER defaultLogin
  AFTER INSERT ON funcionario
FOR EACH ROW
BEGIN
  INSERT INTO login VALUES(0,NEW.email_func,"0000",new.id_func);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `id_login` BIGINT NOT NULL AUTO_INCREMENT,
  `username_login` TEXT  NOT NULL,
  `password_login` TEXT  NOT NULL,
  `id_func` BIGINT NOT NULL,
  PRIMARY KEY (`id_login`),
  KEY `id_func` (`id_func`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`id_func`) REFERENCES `funcionario` (`id_func`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'root@ag','senha',1);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motorista`
--

DROP TABLE IF EXISTS `motorista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motorista` (
  `id_mot` BIGINT NOT NULL AUTO_INCREMENT,
  `id_func` BIGINT NOT NULL,
  `nome_hab` TEXT  NOT NULL,
  `idhab_hab` TEXT  NOT NULL,
  `nregistro_hab` TEXT  NOT NULL,
  `validade_hab` TEXT NOT NULL,
  `local_hab` TEXT  NOT NULL,
  `dtemissao_hab` TEXT NOT NULL,
  PRIMARY KEY (`id_mot`),
  KEY `id_func` (`id_func`),
  CONSTRAINT `motorista_ibfk_1` FOREIGN KEY (`id_func`) REFERENCES `funcionario` (`id_func`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motorista`
--

LOCK TABLES `motorista` WRITE;
/*!40000 ALTER TABLE `motorista` DISABLE KEYS */;
/*!40000 ALTER TABLE `motorista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `motoristaOnly`
--

DROP TABLE IF EXISTS `motoristaOnly`;
/*!50001 DROP VIEW IF EXISTS `motoristaOnly`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `motoristaOnly` AS SELECT
 1 AS `id_func`,
 1 AS `nome_func`,
 1 AS `sobrenome_func`,
 1 AS `img_func`,
 1 AS `tel_func`,
 1 AS `id_mot`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ordem_de_servico`
--

DROP TABLE IF EXISTS `ordem_de_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem_de_servico` (
  `id_os` BIGINT NOT NULL AUTO_INCREMENT,
  `id_func` BIGINT NOT NULL,
  `id_veiculo` BIGINT NOT NULL,
  `dtab_os` TEXT NOT NULL,
  `agendamento_os` TEXT DEFAULT NULL,
  `status_os` TEXT  NOT NULL,
  PRIMARY KEY (`id_os`),
  KEY `id_func` (`id_func`),
  KEY `id_veiculo` (`id_veiculo`),
  CONSTRAINT `ordem_de_servico_ibfk_1` FOREIGN KEY (`id_func`) REFERENCES `funcionario` (`id_func`),
  CONSTRAINT `ordem_de_servico_ibfk_2` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo` (`id_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_de_servico`
--

LOCK TABLES `ordem_de_servico` WRITE;
/*!40000 ALTER TABLE `ordem_de_servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordem_de_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguro`
--

DROP TABLE IF EXISTS `seguro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seguro` (
  `id_seguro` BIGINT NOT NULL AUTO_INCREMENT,
  `nome_seguro` TEXT  DEFAULT NULL,
  `nome_amigavel` TEXT  DEFAULT NULL,
  `codigo_prestador` TEXT  DEFAULT NULL,
  `cgc` BIGINT DEFAULT NULL,
  `endereco` TEXT  DEFAULT NULL,
  `cordenador_regiao` TEXT  DEFAULT NULL,
  `email_representante` text,
  `setor_cadastro_tel` TEXT  DEFAULT NULL,
  `setor_pagamento_tel` TEXT  DEFAULT NULL,
  `fechamento_servicos_tel` TEXT  DEFAULT NULL,
  `casos_andamento_tel` TEXT  DEFAULT NULL,
  `passeio_40km` TEXT DEFAULT NULL,
  `passeio_maior40km` TEXT DEFAULT NULL,
  `passeio_hora_trabalhada` TEXT DEFAULT NULL,
  `passeio_hora_parada` TEXT DEFAULT NULL,
  `ull_40km` TEXT DEFAULT NULL,
  `ull_maior40km` TEXT DEFAULT NULL,
  `ull_hora_trabalhada` TEXT DEFAULT NULL,
  `ull_hora_parada` TEXT DEFAULT NULL,
  `moto_40km` TEXT DEFAULT NULL,
  `moto_maior40km` TEXT DEFAULT NULL,
  `moto_hora_trabalhada` TEXT DEFAULT NULL,
  `moto_hora_parada` TEXT DEFAULT NULL,
  `garagem_40km` TEXT DEFAULT NULL,
  `garagem_maior40km` TEXT DEFAULT NULL,
  `garagem_hora_trabalhada` TEXT DEFAULT NULL,
  `garagem_hora_parada` TEXT DEFAULT NULL,
  `re_40km` TEXT DEFAULT NULL,
  `re_maior40km` TEXT DEFAULT NULL,
  `re_hora_trabalhada` TEXT DEFAULT NULL,
  `re_hora_parada` TEXT DEFAULT NULL,
  `patins_40km` TEXT DEFAULT NULL,
  `patins_maior40km` TEXT DEFAULT NULL,
  `patins_hora_trabalhada` TEXT DEFAULT NULL,
  `patins_hora_parada` TEXT DEFAULT NULL,
  `cl_40km` TEXT DEFAULT NULL,
  `cl_maior40km` TEXT DEFAULT NULL,
  `cl_hora_trabalhada` TEXT DEFAULT NULL,
  `cl_hora_parada` TEXT DEFAULT NULL,
  `sospsd_40km` TEXT DEFAULT NULL,
  `sospsd_maior40km` TEXT DEFAULT NULL,
  `sospsd_hora_trabalhada` TEXT DEFAULT NULL,
  `sospsd_hora_parada` TEXT DEFAULT NULL,
  `xtrpsd_40km` TEXT DEFAULT NULL,
  `xtrpsd_maior40km` TEXT DEFAULT NULL,
  `xtrpsd_hora_trabalhada` TEXT DEFAULT NULL,
  `xtrpsd_hora_parada` TEXT DEFAULT NULL,
  `scrmec_40km` TEXT DEFAULT NULL,
  `scrmec_mais40km` TEXT DEFAULT NULL,
  `km_rodado` TEXT DEFAULT NULL,
  `km_parado` TEXT DEFAULT NULL,
  `saida_nacional_40km` TEXT DEFAULT NULL,
  `saida_nacional_mais40km` TEXT DEFAULT NULL,
  `saida_importado_40km` TEXT DEFAULT NULL,
  `saida_importado_mais40km` TEXT DEFAULT NULL,
  `saida_confeccao_40km` TEXT DEFAULT NULL,
  `saida_confeccao_mais40km` TEXT DEFAULT NULL,
  `saida_40km` TEXT DEFAULT NULL,
  `saida_mais40km` TEXT DEFAULT NULL,
  `saida_hora_trabalhada` TEXT DEFAULT NULL,
  `vigilante_40km` TEXT DEFAULT NULL,
  `vigilante_mais40km` TEXT DEFAULT NULL,
  `vigilante_hora_trabalhada` TEXT DEFAULT NULL,
  PRIMARY KEY (`id_seguro`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguro`
--

LOCK TABLES `seguro` WRITE;
/*!40000 ALTER TABLE `seguro` DISABLE KEYS */;
INSERT INTO `seguro` VALUES (1,'Seguradora',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `seguro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servico` (
  `id_servico` BIGINT NOT NULL AUTO_INCREMENT,
  `tipo_servico` TEXT  NOT NULL,
  `precoR_servico` TEXT NOT NULL,
  `precoC_servico` TEXT NOT NULL,
  PRIMARY KEY (`id_servico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico_os`
--

DROP TABLE IF EXISTS `servico_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servico_os` (
  `id_os` BIGINT NOT NULL,
  `id_servico` BIGINT NOT NULL,
  `id_sinistro` BIGINT NOT NULL,
  `id_seguro` BIGINT NOT NULL,
  PRIMARY KEY (`id_os`,`id_servico`,`id_sinistro`,`id_seguro`),
  KEY `id_servico` (`id_servico`),
  KEY `id_sinistro` (`id_sinistro`),
  KEY `id_seguro` (`id_seguro`),
  CONSTRAINT `servico_os_ibfk_1` FOREIGN KEY (`id_os`) REFERENCES `ordem_de_servico` (`id_os`),
  CONSTRAINT `servico_os_ibfk_2` FOREIGN KEY (`id_servico`) REFERENCES `servico` (`id_servico`),
  CONSTRAINT `servico_os_ibfk_3` FOREIGN KEY (`id_sinistro`) REFERENCES `sinistro` (`id_sinistro`),
  CONSTRAINT `servico_os_ibfk_4` FOREIGN KEY (`id_seguro`) REFERENCES `seguro` (`id_seguro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico_os`
--

LOCK TABLES `servico_os` WRITE;
/*!40000 ALTER TABLE `servico_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `servico_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinistro`
--

DROP TABLE IF EXISTS `sinistro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sinistro` (
  `id_sinistro` BIGINT NOT NULL AUTO_INCREMENT,
  `sinistro` TEXT  NOT NULL,
  `id_cli` BIGINT DEFAULT NULL,
  `id_seguro` BIGINT DEFAULT NULL,
  `tipo_seguro` TEXT  DEFAULT NULL,
  PRIMARY KEY (`id_sinistro`),
  KEY `id_cli` (`id_cli`),
  KEY `id_seguro` (`id_seguro`),
  CONSTRAINT `sinistro_ibfk_1` FOREIGN KEY (`id_cli`) REFERENCES `cliente` (`id_cli`),
  CONSTRAINT `sinistro_ibfk_2` FOREIGN KEY (`id_seguro`) REFERENCES `seguro` (`id_seguro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinistro`
--

LOCK TABLES `sinistro` WRITE;
/*!40000 ALTER TABLE `sinistro` DISABLE KEYS */;
/*!40000 ALTER TABLE `sinistro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veiculo` (
  `id_veiculo` BIGINT NOT NULL AUTO_INCREMENT,
  `id_cli` BIGINT NOT NULL,
  `fabricante_veiculo` TEXT  DEFAULT NULL,
  `modelo_veiculo` TEXT  DEFAULT NULL,
  `ano_veiculo` TEXT DEFAULT NULL,
  `placa_veiculo` TEXT DEFAULT NULL,
  `cor_veiculo` TEXT  DEFAULT NULL,
  PRIMARY KEY (`id_veiculo`),
  KEY `id_cli` (`id_cli`),
  CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`id_cli`) REFERENCES `cliente` (`id_cli`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viagem`
--

DROP TABLE IF EXISTS `viagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viagem` (
  `id_viagem` BIGINT NOT NULL AUTO_INCREMENT,
  `id_mot` BIGINT NOT NULL,
  `id_frota` BIGINT NOT NULL,
  `bairro_destino_viagem` TEXT  DEFAULT NULL,
  `bairro_partida_viagem` TEXT  DEFAULT NULL,
  `endereco_destino_viagem` TEXT  DEFAULT NULL,
  `endereco_partida_viagem` TEXT  DEFAULT NULL,
  `cidade_destino_viagem` TEXT  DEFAULT NULL,
  `cidade_partida_viagem` TEXT  DEFAULT NULL,
  `uf_destino_viagem` TEXT DEFAULT NULL,
  `uf_partida_viagem` TEXT DEFAULT NULL,
  `obs_viagem` text,
  PRIMARY KEY (`id_viagem`),
  KEY `id_mot` (`id_mot`),
  KEY `id_frota` (`id_frota`),
  CONSTRAINT `viagem_ibfk_1` FOREIGN KEY (`id_mot`) REFERENCES `motorista` (`id_mot`),
  CONSTRAINT `viagem_ibfk_2` FOREIGN KEY (`id_frota`) REFERENCES `frota` (`id_frota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viagem`
--

LOCK TABLES `viagem` WRITE;
/*!40000 ALTER TABLE `viagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `viagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viagem_servico`
--

DROP TABLE IF EXISTS `viagem_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viagem_servico` (
  `id_viagem` BIGINT NOT NULL AUTO_INCREMENT,
  `id_os` BIGINT NOT NULL,
  PRIMARY KEY (`id_viagem`,`id_os`),
  KEY `id_os` (`id_os`),
  CONSTRAINT `viagem_servico_ibfk_1` FOREIGN KEY (`id_viagem`) REFERENCES `viagem` (`id_viagem`),
  CONSTRAINT `viagem_servico_ibfk_2` FOREIGN KEY (`id_os`) REFERENCES `ordem_de_servico` (`id_os`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viagem_servico`
--

LOCK TABLES `viagem_servico` WRITE;
/*!40000 ALTER TABLE `viagem_servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `viagem_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `motoristaOnly`
--

/*!50001 DROP VIEW IF EXISTS `motoristaOnly`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`amaralwebmaster`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `motoristaOnly` AS select `func`.`id_func` AS `id_func`,`func`.`nome_func` AS `nome_func`,`func`.`sobrenome_func` AS `sobrenome_func`,`func`.`img_func` AS `img_func`,`func`.`tel_func` AS `tel_func`,`mot`.`id_mot` AS `id_mot` from (`funcionario` `func` join `motorista` `mot` on((`func`.`id_func` = `mot`.`id_func`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-28 18:05:41

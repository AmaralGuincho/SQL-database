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
DROP DATABASE IF EXISTS agencrypted;
CREATE DATABASE agencrypted;
use agencrypted;

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
`id_cargo` bigint NOT NULL AUTO_INCREMENT,
`cargo` text NULL,
`salario` text NOT NULL,
PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--


--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
`id_cli` bigint NOT NULL AUTO_INCREMENT,
`nome_cli` text NULL,
`sobrenome_cli` text NULL,
`cpf_cli` text NULL,
`email_cli` text NULL,
`sx_cli` text DEFAULT NULL,
`telefone_cli` text NULL,
`dtnasc_cli` text NULL,
`cep_cli` text NULL,
`bairro_cli` text NULL,
`cid_cli` text NULL,
`uf_cli` text NULL,
`endereco_cli` text NULL,
`img_cli` text,
PRIMARY KEY (`id_cli`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frota`
--

DROP TABLE IF EXISTS `frota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frota` (
`id_frota` bigint NOT NULL AUTO_INCREMENT,
`nome_frota` text NULL,
`modelo_frota` text NULL,
`ano_frota` text NULL,
`fabricante_frota` text NULL,
`tipo_frota` text NULL,
`placa_frota` text NOT NULL,
`cor_frota` text NULL,
`img_frota` text,
PRIMARY KEY (`id_frota`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
`id_func` bigint NOT NULL AUTO_INCREMENT,
`id_cargo` bigint NOT NULL,
`nome_func` text NULL,
`sobrenome_func` text NULL,
`dtnasc_func` text NULL,
`cep_func` text NULL,
`cpf_func` text NULL,
`dtcont_func` text NULL,
`sx_func` text NULL,
`tel_func` text NULL,
`email_func` text,
`residencia_func` text NULL,
`bairro_func` text NULL,
`uf_func` text NULL,
`cid_func` text NULL,
`img_func` text,
PRIMARY KEY (`id_func`),
KEY `id_cargo` (`id_cargo`),
CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 TRIGGER defaultLogin
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
`id_login` bigint NOT NULL AUTO_INCREMENT,
`username_login` text NULL,
`password_login` text NULL,
`id_func` bigint NOT NULL,
PRIMARY KEY (`id_login`),
KEY `id_func` (`id_func`),
CONSTRAINT `login_ibfk_1` FOREIGN KEY (`id_func`) REFERENCES `funcionario` (`id_func`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `motorista`
--

DROP TABLE IF EXISTS `motorista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motorista` (
`id_mot` bigint NOT NULL AUTO_INCREMENT,
`id_func` bigint NOT NULL,
`nome_hab` text NULL,
`idhab_hab` text NULL,
`nregistro_hab` text NULL,
`validade_hab` text NOT NULL,
`local_hab` text NULL,
`dtemissao_hab` text NOT NULL,
PRIMARY KEY (`id_mot`),
KEY `id_func` (`id_func`),
CONSTRAINT `motorista_ibfk_1` FOREIGN KEY (`id_func`) REFERENCES `funcionario` (`id_func`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
--
-- Table structure for table `seguro`
--

DROP TABLE IF EXISTS `seguro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seguro` (
`id_seguro` bigint NOT NULL AUTO_INCREMENT,
`nome_seguro` text NULL,
`nome_amigavel` text NULL,
`codigo_prestador` text NULL,
`cgc` text DEFAULT NULL,
`endereco` text NULL,
`cordenador_regiao` text NULL,
`email_representante` text,
`setor_cadastro_tel` text NULL,
`setor_pagamento_tel` text NULL,
`fechamento_servicos_tel` text NULL,
`casos_andamento_tel` text NULL,
`passeio_40km` text NULL,
`passeio_maior40km` text NULL,
`passeio_hora_trabalhada` text NULL,
`passeio_hora_parada` text NULL,
`ull_40km` text NULL,
`ull_maior40km` text NULL,
`ull_hora_trabalhada` text NULL,
`ull_hora_parada` text NULL,
`moto_40km` text NULL,
`moto_maior40km` text NULL,
`moto_hora_trabalhada` text NULL,
`moto_hora_parada` text NULL,
`garagem_40km` text NULL,
`garagem_maior40km` text NULL,
`garagem_hora_trabalhada` text NULL,
`garagem_hora_parada` text NULL,
`re_40km` text NULL,
`re_maior40km` text NULL,
`re_hora_trabalhada` text NULL,
`re_hora_parada` text NULL,
`patins_40km` text NULL,
`patins_maior40km` text NULL,
`patins_hora_trabalhada` text NULL,
`patins_hora_parada` text NULL,
`cl_40km` text NULL,
`cl_maior40km` text NULL,
`cl_hora_trabalhada` text NULL,
`cl_hora_parada` text NULL,
`sospsd_40km` text NULL,
`sospsd_maior40km` text NULL,
`sospsd_hora_trabalhada` text NULL,
`sospsd_hora_parada` text NULL,
`xtrpsd_40km` text NULL,
`xtrpsd_maior40km` text NULL,
`xtrpsd_hora_trabalhada` text NULL,
`xtrpsd_hora_parada` text NULL,
`scrmec_40km` text NULL,
`scrmec_mais40km` text NULL,
`km_rodado` text NULL,
`km_parado` text NULL,
`saida_nacional_40km` text NULL,
`saida_nacional_mais40km` text NULL,
`saida_importado_40km` text NULL,
`saida_importado_mais40km` text NULL,
`saida_confeccao_40km` text NULL,
`saida_confeccao_mais40km` text NULL,
`saida_40km` text NULL,
`saida_mais40km` text NULL,
`saida_hora_trabalhada` text NULL,
`vigilante_40km` text NULL,
`vigilante_mais40km` text NULL,
`vigilante_hora_trabalhada` text NULL,
PRIMARY KEY (`id_seguro`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servico` (
`id_servico` bigint NOT NULL AUTO_INCREMENT,
`tipo_servico` text NULL,
`precoR_servico` text NOT NULL,
`precoC_servico` text NOT NULL,
PRIMARY KEY (`id_servico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servico_os`
--

DROP TABLE IF EXISTS `servico_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servico_os` (
`id_os` bigint NOT NULL,
`id_servico` bigint NOT NULL,
`id_sinistro` bigint NOT NULL,
`id_seguro` bigint NOT NULL,
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
-- Table structure for table `sinistro`
--

DROP TABLE IF EXISTS `sinistro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sinistro` (
`id_sinistro` bigint NOT NULL AUTO_INCREMENT,
`sinistro` text NULL,
`id_cli` bigint DEFAULT NULL,
`id_seguro` bigint DEFAULT NULL,
`tipo_seguro` text NULL,
PRIMARY KEY (`id_sinistro`),
KEY `id_cli` (`id_cli`),
KEY `id_seguro` (`id_seguro`),
CONSTRAINT `sinistro_ibfk_1` FOREIGN KEY (`id_cli`) REFERENCES `cliente` (`id_cli`),
CONSTRAINT `sinistro_ibfk_2` FOREIGN KEY (`id_seguro`) REFERENCES `seguro` (`id_seguro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veiculo` (
`id_veiculo` bigint NOT NULL AUTO_INCREMENT,
`id_cli` bigint NOT NULL,
`fabricante_veiculo` text NULL,
`modelo_veiculo` text NULL,
`ano_veiculo` text NULL,
`placa_veiculo` text NULL,
`cor_veiculo` text NULL,
PRIMARY KEY (`id_veiculo`),
KEY `id_cli` (`id_cli`),
CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`id_cli`) REFERENCES `cliente` (`id_cli`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viagem`
--

DROP TABLE IF EXISTS `viagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viagem` (
`id_viagem` bigint NOT NULL AUTO_INCREMENT,
`id_mot` bigint NOT NULL,
`id_frota` bigint NOT NULL,
`bairro_destino_viagem` text NULL,
`bairro_partida_viagem` text NULL,
`endereco_destino_viagem` text NULL,
`endereco_partida_viagem` text NULL,
`cidade_destino_viagem` text NULL,
`cidade_partida_viagem` text NULL,
`uf_destino_viagem` text NULL,
`uf_partida_viagem` text NULL,
`obs_viagem` text,
PRIMARY KEY (`id_viagem`),
KEY `id_mot` (`id_mot`),
KEY `id_frota` (`id_frota`),
CONSTRAINT `viagem_ibfk_1` FOREIGN KEY (`id_mot`) REFERENCES `motorista` (`id_mot`),
CONSTRAINT `viagem_ibfk_2` FOREIGN KEY (`id_frota`) REFERENCES `frota` (`id_frota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ordem_de_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem_de_servico` (
`id_os` bigint NOT NULL AUTO_INCREMENT,
`id_func` bigint NOT NULL,
`id_veiculo` bigint NOT NULL,
`dtab_os` text NOT NULL,
`agendamento_os` text DEFAULT NULL,
`status_os` text NULL,
PRIMARY KEY (`id_os`),
KEY `id_func` (`id_func`),
KEY `id_veiculo` (`id_veiculo`),
CONSTRAINT `ordem_de_servico_ibfk_1` FOREIGN KEY (`id_func`) REFERENCES `funcionario` (`id_func`),
CONSTRAINT `ordem_de_servico_ibfk_2` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo` (`id_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viagem_servico`
--

DROP TABLE IF EXISTS `viagem_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viagem_servico` (
`id_viagem` bigint NOT NULL AUTO_INCREMENT,
`id_os` bigint NOT NULL,
PRIMARY KEY (`id_viagem`,`id_os`),
KEY `id_os` (`id_os`),
CONSTRAINT `viagem_servico_ibfk_1` FOREIGN KEY (`id_viagem`) REFERENCES `viagem` (`id_viagem`),
CONSTRAINT `viagem_servico_ibfk_2` FOREIGN KEY (`id_os`) REFERENCES `ordem_de_servico` (`id_os`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE TABLE `userlog`(
  `logId` bigint NOT NULL AUTO_INCREMENT,
  `funcinario` bigint NOT NULL,
  `acao` TEXT NULL,
  `hora` TEXT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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

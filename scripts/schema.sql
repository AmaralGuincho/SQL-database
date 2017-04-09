-------------------------------------
 -- Amaral Guincho Database 3 Schema
-------------------------------------

DROP DATABASE IF EXISTS amaralguincho;
CREATE DATABASE amaralguincho;
USE amaralguincho;

CREATE TABLE `occupation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` text NULL,
  `salary` text NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `employee`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `occupation` bigint NOT NULL,
  `name` text NULL,
  `lastname` text NULL,
  `dob` text NULL,
  `cpf` text NULL,
  `rg` text NULL,
  `sex` text NULL,
  `email` text NOT NULL,
  `cep` text NULL,
  `address` text NULL,
  `img` text NULL,
  PRIMARY KEY(`id`),
  CONSTRAINT `occupationID_employee` FOREIGN KEY (`occupation`) REFERENCES `occupation` (`id`)
);

CREATE TABLE `users`(
  `employee` bigint NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY(`employee`),
  CONSTRAINT `employeeID_user` FOREIGN KEY(`employee`) REFERENCES `employee` (`id`)
);

CREATE TABLE `driver`(
  `employee` bigint NOT NULL,
  `license_number` text NULL,
  `register_number` text NULL,
  `expiration_date` text NULL,
  `creation_date` text NULL,
  `location` text NULL,
  PRIMARY KEY(`employee`),
  CONSTRAINT `employeeID_driver` FOREIGN KEY(`employee`) REFERENCES `employee` (`id`)
);

CREATE TABLE `vehicle_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` text NOT NULL,
  PRIMARY KEY(`id`)
);

CREATE TABLE `business_vehicle` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` bigint NOT NULL,
  `nick` text NULL,
  `plate` text NULL,
  `manufacture_date` text NULL,
  `color` text NULL,
  `img` text NULL,
  `model` text NULL,
  PRIMARY KEY(`id`),
  CONSTRAINT `vehicle_typeID` FOREIGN KEY(`type`) REFERENCES `vehicle_type` (`id`)
);

CREATE TABLE `displacement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `vehicle` bigint NOT NULL,
  `time_left` text NULL,
  `time_arrived` text NULL,
  `from` text NOT NULL,
  `to` text NOT NULL,
  `distance` text NOT NULL,
  PRIMARY KEY(`id`),
  CONSTRAINT `employeeID_displacement` FOREIGN KEY(`employee`) REFERENCES `employee` (`id`),
  CONSTRAINT `vehicleID_displacement` FOREIGN KEY(`vehicle`) REFERENCES `business_vehicle` (`id`)
);

CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` text NULL,
  `lastname` text NULL,
  `phone` text NULL,
  `email` text NULL,
  PRIMARY KEY(`id`)
);

CREATE TABLE `vehicle` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customer` bigint NOT NULL,
  `plate` text NULL,
  `manufacture_date` text NULL,
  `color` text NULL,
  `model` text NULL,
  PRIMARY KEY(`id`),
  CONSTRAINT `customer_vehicle` FOREIGN KEY(`customer`) REFERENCES `customer` (`id`)
);

CREATE TABLE `insurance` (
`id` bigint NOT NULL AUTO_INCREMENT,
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
PRIMARY KEY (`id`)
);

CREATE TABLE `service_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` text NULL,
  `cost` text NULL,
  PRIMARY KEY(`id`)
);

CREATE TABLE `service` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` bigint NOT NULL,
  `vehicle` bigint NOT NULL,
  `status` text NULL,
  `issue_date` text NULL,
  `insurance` bigint NOT NULL,
  `issue_number` bigint NOT NULL,
  PRIMARY KEY(`id`),
  CONSTRAINT `type_serviceID` FOREIGN KEY(`type`) REFERENCES `service_type` (`id`),
  CONSTRAINT `vehicle_serviceID` FOREIGN KEY(`vehicle`) REFERENCES `vehicle` (`id`),
  CONSTRAINT `insurance_serviceID` FOREIGN KEY(`insurance`) REFERENCES `insurance` (`id`)
);

CREATE TABLE `travel` (
  `service` bigint NOT NULL,
  `displacement` bigint NOT NULL,
  CONSTRAINT `serviceID` FOREIGN KEY(`service`) REFERENCES `service` (`id`),
  CONSTRAINT `displacementID` FOREIGN KEY(`displacement`) REFERENCES `displacement` (`id`)
);

-- -----------------------------------
--  Amaral Guincho Database 3 Schema
-- -----------------------------------

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

CREATE TABLE `user`(
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
`organization_name` text NULL,
`organization_nickname` text NULL,
`businessman_code` text NULL,
`cgc` text DEFAULT NULL,
`address` text NULL,
`region_manager` text NULL,
`businessperson_email` text,
`registration_unit_phone` text NULL,
`payment_unit_phone` text NULL,
`services_closer_phone` text NULL,
`current_cases_phone` text NULL,
PRIMARY KEY (`id`)
);

CREATE TABLE `insurance_service` (
  `insurance` bigint NOT NULL,
  `type` text NOT NULL,
  `to_40km` text NULL,
  `more_than_40km` text NULL,
  `working_hours` text NULL,
  `watting_hours` text NULL,
  KEY `insurance` (`insurance`),
  CONSTRAINT FOREIGN KEY(`insurance`) REFERENCES `insurance`(`id`)
);

CREATE TABLE `service_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` text NULL,
  `internal_cost` text NULL,
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

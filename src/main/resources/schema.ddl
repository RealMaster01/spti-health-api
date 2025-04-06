DROP SCHEMA IF EXISTS `hospital`;
CREATE SCHEMA `hospital`;
USE `hospital`;

CREATE TABLE `branch` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NULL,
  `address` VARCHAR(128) NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `login` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(30) DEFAULT NULL,
  `password` VARCHAR(25) DEFAULT NULL,
  `role` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `patients` (
  `patient_id` INT AUTO_INCREMENT PRIMARY KEY,
  `first_name` VARCHAR(50),
  `last_name` VARCHAR(50),
  `gender` VARCHAR(8),
  `address` VARCHAR(255),
  `age` INT,
  `phone_number` VARCHAR(15),
  `email` VARCHAR(100),
  `branch` INT NOT NULL,
  FOREIGN KEY (`branch`) REFERENCES `branch`(`id`)
);

CREATE TABLE `diagnosis` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `diagnosis` VARCHAR(255),
  PRIMARY KEY (`id`)
);

CREATE TABLE `patients_opd_history` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `seen_by_doctor` VARCHAR(255),
  `diagnosis_id` BIGINT,
  `treatment` VARCHAR(500),
  `bill` VARCHAR(255),
  `pending_amount` VARCHAR(45),
  `bill_status` VARCHAR(255),
  `treatment_Date` DATE NULL,
  `date_of_treatment` TIMESTAMP,
  `payment_type` VARCHAR(45),
  `patient_id` INT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`patient_id`) REFERENCES `patients`(`patient_id`),
  FOREIGN KEY (`diagnosis_id`) REFERENCES `diagnosis`(`id`)
);

CREATE TABLE `admit_patient` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `admit_Date` TIMESTAMP NULL DEFAULT NULL,
  `Admit_And_Discharge_Status` VARCHAR(45) NOT NULL,
  `patient_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `fk_admit_patient_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)
);

CREATE TABLE `discharge_patient` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mLC_No` INT NOT NULL,
  `IPD_No` INT NOT NULL,
  `consultatnt` VARCHAR(45) NOT NULL,
  `diagnosis` VARCHAR(45) NOT NULL,
  `clinical_History` VARCHAR(45) NOT NULL,
  `admit_Patient_id` INT NOT NULL,
  `patient_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`patient_id`) REFERENCES `patients`(`patient_id`),
  FOREIGN KEY (`admit_Patient_id`) REFERENCES `admit_patient`(`id`)
);

CREATE TABLE `treatment_details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `admittance_id` INT DEFAULT NULL,
  `medicine_name` VARCHAR(32) DEFAULT NULL,
  `medicine_time` VARCHAR(128) DEFAULT NULL,
  `treatment_date` DATE DEFAULT NULL,
  `bill` INT DEFAULT NULL,
  `bill_paid` VARCHAR(32) DEFAULT NULL,
  `payment_mode` VARCHAR(32) DEFAULT NULL,
  `created_by` VARCHAR(32) DEFAULT NULL,
  `created_at` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`)
);

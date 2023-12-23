-- MySQL Script generated by MySQL Workbench
-- Fri Dec 22 17:12:57 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Classroon_Equipment_Booking_System
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Classroon_Equipment_Booking_System` ;

-- -----------------------------------------------------
-- Schema Classroon_Equipment_Booking_System
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Classroon_Equipment_Booking_System` DEFAULT CHARACTER SET utf8 ;
USE `Classroon_Equipment_Booking_System` ;

-- -----------------------------------------------------
-- Table `Classroon_Equipment_Booking_System`.`Member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Classroon_Equipment_Booking_System`.`Member` ;

CREATE TABLE IF NOT EXISTS `Classroon_Equipment_Booking_System`.`Member` (
                                                                             `id_member` INT NOT NULL,
                                                                             `name` VARCHAR(45) NULL,
    `email` VARCHAR(45) NULL,
    `identity` VARCHAR(45) NULL,
    `password` VARCHAR(128) NULL,
    `salt` BINARY(16) NULL,
    PRIMARY KEY (`id_member`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Classroon_Equipment_Booking_System`.`Borrow`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Classroon_Equipment_Booking_System`.`Borrow` ;

CREATE TABLE IF NOT EXISTS `Classroon_Equipment_Booking_System`.`Borrow` (
                                                                             `id_borrow` INT NOT NULL,
                                                                             `timestamp` TIMESTAMP(6) NULL,
    `name` VARCHAR(45) NULL,
    `identity` VARCHAR(45) NULL,
    `department_grade` VARCHAR(45) NULL,
    `phone` VARCHAR(45) NULL,
    `identitycard` VARCHAR(45) NULL,
    `status` VARCHAR(45) NULL,
    PRIMARY KEY (`id_borrow`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Classroon_Equipment_Booking_System`.`Classroom`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Classroon_Equipment_Booking_System`.`Classroom` ;

CREATE TABLE IF NOT EXISTS `Classroon_Equipment_Booking_System`.`Classroom` (
                                                                                `id_classroom` INT NOT NULL,
                                                                                `name` VARCHAR(45) NULL,
    `description` VARCHAR(45) NULL,
    `image` BLOB NULL,
    PRIMARY KEY (`id_classroom`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Classroon_Equipment_Booking_System`.`Booking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Classroon_Equipment_Booking_System`.`Booking` ;

CREATE TABLE IF NOT EXISTS `Classroon_Equipment_Booking_System`.`Booking` (
                                                                              `id_booking` INT NOT NULL,
                                                                              `id_borrow` INT NULL,
                                                                              `id_classroom` INT NULL,
                                                                              `name` VARCHAR(45) NULL,
    `identity` VARCHAR(45) NULL,
    `idStudent` VARCHAR(45) NULL,
    `email` VARCHAR(45) NULL,
    `phone` VARCHAR(45) NULL,
    `bookingReason` VARCHAR(45) NULL,
    `bookingDate` DATE NULL,
    `startTime` DATETIME NULL,
    `endTime` DATETIME NULL,
    `status` VARCHAR(45) NULL,
    PRIMARY KEY (`id_booking`),
    INDEX `id_borrow_idx` (`id_borrow` ASC),
    INDEX `id_Classroom_idx` (`id_classroom` ASC),
    CONSTRAINT `id_booking_borrow`
    FOREIGN KEY (`id_borrow`)
    REFERENCES `Classroon_Equipment_Booking_System`.`Borrow` (`id_borrow`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `id_booking_classroom`
    FOREIGN KEY (`id_classroom`)
    REFERENCES `Classroon_Equipment_Booking_System`.`Classroom` (`id_classroom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Classroon_Equipment_Booking_System`.`Borrow_Classroom`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Classroon_Equipment_Booking_System`.`Borrow_Classroom` ;

CREATE TABLE IF NOT EXISTS `Classroon_Equipment_Booking_System`.`Borrow_Classroom` (
                                                                                       `id_borrowclassroom` INT NOT NULL,
                                                                                       `id_borrow` INT NULL,
                                                                                       `id_classroom` INT NULL,
                                                                                       `timestamp` TIMESTAMP(6) NULL,
    `teacher` VARCHAR(45) NULL,
    `purpose` VARCHAR(45) NULL,
    `note` VARCHAR(45) NULL,
    PRIMARY KEY (`id_borrowclassroom`),
    INDEX `idBorrow_idx` (`id_borrow` ASC),
    INDEX `idClassroom_idx` (`id_classroom` ASC),
    CONSTRAINT `id_Borrow`
    FOREIGN KEY (`id_borrow`)
    REFERENCES `Classroon_Equipment_Booking_System`.`Borrow` (`id_borrow`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `id_Classroom`
    FOREIGN KEY (`id_classroom`)
    REFERENCES `Classroon_Equipment_Booking_System`.`Classroom` (`id_classroom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Classroon_Equipment_Booking_System`.`Equipment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Classroon_Equipment_Booking_System`.`Equipment` ;

CREATE TABLE IF NOT EXISTS `Classroon_Equipment_Booking_System`.`Equipment` (
                                                                                `id_equipment` INT NOT NULL,
                                                                                `category` VARCHAR(45) NULL,
    `description` VARCHAR(45) NULL,
    `label` VARCHAR(45) NULL,
    PRIMARY KEY (`id_equipment`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Classroon_Equipment_Booking_System`.`Borrow_Equipment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Classroon_Equipment_Booking_System`.`Borrow_Equipment` ;

CREATE TABLE IF NOT EXISTS `Classroon_Equipment_Booking_System`.`Borrow_Equipment` (
                                                                                       `id_borrow_equipment` INT NOT NULL,
                                                                                       `id_borrow` INT NULL,
                                                                                       `id_equipment` INT NULL,
                                                                                       `id_lendby` INT NULL,
                                                                                       `id_returnby` INT NULL,
                                                                                       `timestamp` TIMESTAMP(6) NULL,
    `returnTime` DATE NULL,
    `teacher` VARCHAR(45) NULL,
    `status` VARCHAR(45) NULL,
    `purpose` VARCHAR(45) NULL,
    `note` VARCHAR(45) NULL,
    PRIMARY KEY (`id_borrow_equipment`),
    INDEX `idBorrow_idx` (`id_borrow` ASC),
    INDEX `idEquipment_idx` (`id_equipment` ASC),
    INDEX `idLendBy_idx` (`id_lendby` ASC),
    INDEX `idReturnBy_idx` (`id_returnby` ASC),
    CONSTRAINT `idBorrow`
    FOREIGN KEY (`id_borrow`)
    REFERENCES `Classroon_Equipment_Booking_System`.`Borrow` (`id_borrow`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `idEquipment`
    FOREIGN KEY (`id_equipment`)
    REFERENCES `Classroon_Equipment_Booking_System`.`Equipment` (`id_equipment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `idLendBy`
    FOREIGN KEY (`id_lendby`)
    REFERENCES `Classroon_Equipment_Booking_System`.`Member` (`id_member`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `idReturnBy`
    FOREIGN KEY (`id_returnby`)
    REFERENCES `Classroon_Equipment_Booking_System`.`Member` (`id_member`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

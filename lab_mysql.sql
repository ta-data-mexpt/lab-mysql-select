-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`CARS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CARS` (
  `Color` VARCHAR(55) NOT NULL,
  `Model` VARCHAR(100) NOT NULL,
  `Manufacturer` TEXT(100) NOT NULL,
  `Year` VARCHAR(12) NOT NULL,
  `Vehicle Id Number (VIN)` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`Vehicle Id Number (VIN)`));


-- -----------------------------------------------------
-- Table `mydb`.`CUSTOMERS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMERS` (
  `Full name` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `Phone number` VARCHAR(45) NOT NULL,
  `Customer ID` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(500) NOT NULL,
  `City` VARCHAR(100) NOT NULL,
  `State/Province` VARCHAR(100) NOT NULL,
  `Country` VARCHAR(100) NOT NULL,
  `Zip/Postal code` VARCHAR(45) NOT NULL,
  `Vehicle Id Number (VIN)` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Customer ID`),
  INDEX `Vehicle Id Number (VIN)_idx` (`Vehicle Id Number (VIN)` ASC) VISIBLE,
  CONSTRAINT `Vehicle Id Number (VIN)`
    FOREIGN KEY (`Vehicle Id Number (VIN)`)
    REFERENCES `mydb`.`CARS` (`Vehicle Id Number (VIN)`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Salespersons` (
  `Staff_id` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(255) NOT NULL,
  `Store number` VARCHAR(45) NULL,
  PRIMARY KEY (`Staff_id`));


-- -----------------------------------------------------
-- Table `mydb`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Invoices` (
  `Invoice number` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `Date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `Customer ID` VARCHAR(45) NOT NULL,
  `Vehicle Id Number` VARCHAR(45) NOT NULL,
  `Staff_id` VARCHAR(45) NOT NULL,
  INDEX `Customer ID_idx` (`Customer ID` ASC) VISIBLE,
  INDEX `Vehicle Id Number_idx` (`Vehicle Id Number` ASC) VISIBLE,
  INDEX `Staff_id_idx` (`Staff_id` ASC) VISIBLE,
  CONSTRAINT `Customer ID`
    FOREIGN KEY (`Customer ID`)
    REFERENCES `mydb`.`CUSTOMERS` (`Customer ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Vehicle Id Number`
    FOREIGN KEY (`Vehicle Id Number`)
    REFERENCES `mydb`.`CARS` (`Vehicle Id Number (VIN)`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Staff_id`
    FOREIGN KEY (`Staff_id`)
    REFERENCES `mydb`.`Salespersons` (`Staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

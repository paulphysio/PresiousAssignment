-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pollution_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pollution_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pollution_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `pollution_db` ;

-- -----------------------------------------------------
-- Table `pollution_db`.`clean`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pollution_db`.`clean` (
  `ID` INT NOT NULL,
  `Date Time` DATETIME NULL DEFAULT NULL,
  `NOx` DOUBLE NULL DEFAULT NULL,
  `NO2` DOUBLE NULL DEFAULT NULL,
  `NO` DOUBLE NULL DEFAULT NULL,
  `SiteID` INT NULL DEFAULT NULL,
  `PM10` DOUBLE NULL DEFAULT NULL,
  `NVPM10` TEXT NULL DEFAULT NULL,
  `VPM10` TEXT NULL DEFAULT NULL,
  `NVPM2.5` TEXT NULL DEFAULT NULL,
  `PM2.5` TEXT NULL DEFAULT NULL,
  `VPM2.5` TEXT NULL DEFAULT NULL,
  `CO` TEXT NULL DEFAULT NULL,
  `O3` TEXT NULL DEFAULT NULL,
  `SO2` TEXT NULL DEFAULT NULL,
  `Temperature` TEXT NULL DEFAULT NULL,
  `RH` TEXT NULL DEFAULT NULL,
  `Air Pressure` TEXT NULL DEFAULT NULL,
  `Location_ID` INT NULL DEFAULT NULL,
  `DateStart` TEXT NULL DEFAULT NULL,
  `DateEnd` TEXT NULL DEFAULT NULL,
  `Current` TEXT NULL DEFAULT NULL,
  `Instrument Type,` TEXT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pollution_db`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pollution_db`.`location` (
  `id` INT NOT NULL,
  `Location` TEXT NULL DEFAULT NULL,
  `geopointX` DECIMAL NULL,
  `geopointY` DECIMAL NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_location_clean`
    FOREIGN KEY (`id`)
    REFERENCES `pollution_db`.`clean` (`Location_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pollution_db`.`newdate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pollution_db`.`newdate` (
  `Date Time` DATETIME NULL DEFAULT NULL,
  `PM2.5` TEXT NULL DEFAULT NULL,
  `VPM2.5` TEXT NULL DEFAULT NULL,
  `location` TEXT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pollution_db`.`pollution_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pollution_db`.`pollution_table` (
  `Date Time` TEXT NULL DEFAULT NULL,
  `NOx` DOUBLE NULL DEFAULT NULL,
  `NO2` DOUBLE NULL DEFAULT NULL,
  `NO` DOUBLE NULL DEFAULT NULL,
  `SiteID` INT NULL DEFAULT NULL,
  `PM10` DOUBLE NULL DEFAULT NULL,
  `NVPM10` TEXT NULL DEFAULT NULL,
  `VPM10` TEXT NULL DEFAULT NULL,
  `NVPM2.5` TEXT NULL DEFAULT NULL,
  `PM2.5` TEXT NULL DEFAULT NULL,
  `VPM2.5` TEXT NULL DEFAULT NULL,
  `CO` TEXT NULL DEFAULT NULL,
  `O3` TEXT NULL DEFAULT NULL,
  `SO2` TEXT NULL DEFAULT NULL,
  `Temperature` TEXT NULL DEFAULT NULL,
  `RH` TEXT NULL DEFAULT NULL,
  `Air Pressure` TEXT NULL DEFAULT NULL,
  `Location` TEXT NULL DEFAULT NULL,
  `geo_point_2d` TEXT NULL DEFAULT NULL,
  `DateStart` TEXT NULL DEFAULT NULL,
  `DateEnd` TEXT NULL DEFAULT NULL,
  `Current` TEXT NULL DEFAULT NULL,
  `Instrument Type,` TEXT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

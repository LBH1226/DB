-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema test2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema test2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `test2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `test2` ;

-- -----------------------------------------------------
-- Table `test2`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test2`.`customer` (
  `customer_id` VARCHAR(50) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `customer_name` INT NOT NULL,
  `rating` VARCHAR(20) NOT NULL,
  `occupation` VARCHAR(20) NULL,
  `reserves` INT NULL DEFAULT 0,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test2`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test2`.`product` (
  `product_number` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(100) NULL,
  `inventory` INT NULL,
  `price` INT NULL,
  `manufacturer` VARCHAR(100) NULL,
  PRIMARY KEY (`product_number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test2`.`customer_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test2`.`customer_product` (
  `order_number` INT NOT NULL AUTO_INCREMENT,
  `quantity` INT NOT NULL,
  `order_date` DATETIME NOT NULL DEFAULT now(),
  `customer_id` VARCHAR(50) NOT NULL,
  `product_number` INT NOT NULL,
  PRIMARY KEY (`order_number`),
  INDEX `fk_customer_product_customer_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_customer_product_product1_idx` (`product_number` ASC) VISIBLE,
  CONSTRAINT `fk_customer_product_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `test2`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_product_product1`
    FOREIGN KEY (`product_number`)
    REFERENCES `test2`.`product` (`product_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

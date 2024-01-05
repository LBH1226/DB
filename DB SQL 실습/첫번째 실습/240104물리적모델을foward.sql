-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema temp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema temp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `temp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `temp` ;

-- -----------------------------------------------------
-- Table `temp`.`t_region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `temp`.`t_region` (
  `region_code` VARCHAR(3) NOT NULL,
  `region_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`region_code`),
  UNIQUE INDEX `region_name_UNIQUE` (`region_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `temp`.`t_customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `temp`.`t_customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `regist_date` DATETIME NULL DEFAULT now(),
  `region_code` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_t_customer_t_region_idx` (`region_code` ASC) VISIBLE,
  CONSTRAINT `fk_t_customer_t_region`
    FOREIGN KEY (`region_code`)
    REFERENCES `temp`.`t_region` (`region_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `temp`.`t_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `temp`.`t_product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_code` VARCHAR(45) NOT NULL,
  `product_name` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `product_code_UNIQUE` (`product_code` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `temp`.`t_sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `temp`.`t_sales` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `qty` INT NOT NULL,
  ` sales_date` DATETIME NULL DEFAULT now(),
  `t_customer_id` INT NOT NULL,
  `t_product_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_t_sales_t_customer1_idx` (`t_customer_id` ASC) VISIBLE,
  INDEX `fk_t_sales_t_product1_idx` (`t_product_id` ASC) VISIBLE,
  CONSTRAINT `fk_t_sales_t_customer1`
    FOREIGN KEY (`t_customer_id`)
    REFERENCES `temp`.`t_customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_sales_t_product1`
    FOREIGN KEY (`t_product_id`)
    REFERENCES `temp`.`t_product` (`product_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO department (department_name) VALUES
('컴퓨터공학과'),
('국어국문학과'),
('정보통신과'),
('전자공학과');

-- 학생-- Insert data into Student table
 INSERT INTO Student (student_name, student_height, department_code) VALUES
 ('가길동', 170.5, 1),
 ('나길동', 165.2, 1),
 ('다길동', 180.0, 2),
 ('라길동', 175.8, 3),
 ('마길동', 160.7, 4),
 ('바길동', 168.3, 1),
 ('사길동', 172.1, 2),
 ('아길동', 175.0, 1);
 
 







 

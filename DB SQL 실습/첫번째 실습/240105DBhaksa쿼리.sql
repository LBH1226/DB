-- MySQL Script generated by MySQL Workbench
-- Fri Jan  5 15:59:14 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema haksa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema haksa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `haksa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `haksa` ;

-- -----------------------------------------------------
-- Table `haksa`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `haksa`.`department` (
  `department_code` INT NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`department_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `haksa`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `haksa`.`student` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `student_name` VARCHAR(50) NOT NULL,
  `student_height` DECIMAL(5,2) NULL,
  `department_code` INT NOT NULL,
  PRIMARY KEY (`student_id`),
  INDEX `fk_student_department_idx` (`department_code` ASC) VISIBLE,
  CONSTRAINT `fk_student_department`
    FOREIGN KEY (`department_code`)
    REFERENCES `haksa`.`department` (`department_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `haksa`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `haksa`.`professor` (
  `professor_code` INT NOT NULL AUTO_INCREMENT,
  `professor_name` VARCHAR(50) NOT NULL,
  `department_code` INT NOT NULL,
  PRIMARY KEY (`professor_code`),
  INDEX `fk_professor_department1_idx` (`department_code` ASC) VISIBLE,
  CONSTRAINT `fk_professor_department1`
    FOREIGN KEY (`department_code`)
    REFERENCES `haksa`.`department` (`department_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `haksa`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `haksa`.`course` (
  `course_code` INT NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(50) NOT NULL,
  `start_date` DATETIME NOT NULL,
  `professor_code` INT NOT NULL,
  PRIMARY KEY (`course_code`),
  INDEX `fk_course_professor1_idx` (`professor_code` ASC) VISIBLE,
  CONSTRAINT `fk_course_professor1`
    FOREIGN KEY (`professor_code`)
    REFERENCES `haksa`.`professor` (`professor_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `haksa`.`student_course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `haksa`.`student_course` (
  `id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `course_code` INT NOT NULL,
  INDEX `fk_student_course_student1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_student_course_course1_idx` (`course_code` ASC) VISIBLE,
  PRIMARY KEY (`student_id`, `course_code`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_student_course_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `haksa`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_course_course1`
    FOREIGN KEY (`course_code`)
    REFERENCES `haksa`.`course` (`course_code`)
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
 
 INSERT INTO Professor (professor_name, department_code) VALUES
 ('가 교수', 1),
 ('나 교수', 1),
 ('다 교수', 2),
 ('빌 게이츠', 3),
 ('스티브 잡스', 4);
 
 INSERT INTO Course (course_name, professor_code, start_date, 
end_date) VALUES
 ('교양 영어', 1, '2023-07-01', '2023-08-15'),
 ('데이터베이스입문', 2, '2023-07-01', '2023-08-31'),
 ('회로이론', 3, '2023-07-15', '2023-09-15'),
 ('공학수학', 4, '2023-07-15', '2023-09-30'),
 ('객체지향프로그래밍', 5, '2023-07-01', '2023-08-31');
 
 select *from course;

 INSERT INTO Student_Course (id, student_id, course_code) VALUES
 (1, 1, 1),
 (2, 2, 1),
 (3, 3, 2),
 (4, 4, 3),
 (5, 5, 4),
 (6, 6, 5),
 (7, 7, 5);
 


 

 
 

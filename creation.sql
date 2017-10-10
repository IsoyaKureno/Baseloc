-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`organization`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`organization` (
  `name` VARCHAR(45) NOT NULL,
  `website_url` VARCHAR(45) NULL,
  `user_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`name`),
  INDEX `fk_organization_user1_idx` (`user_name` ASC),
  CONSTRAINT `fk_organization_user1`
    FOREIGN KEY (`user_name`)
    REFERENCES `mydb`.`user` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tweet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tweet` (
  `content` VARCHAR(45) NOT NULL,
  `user_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`content`),
  INDEX `fk_tweet_user_idx` (`user_name` ASC),
  CONSTRAINT `fk_tweet_user`
    FOREIGN KEY (`user_name`)
    REFERENCES `mydb`.`user` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

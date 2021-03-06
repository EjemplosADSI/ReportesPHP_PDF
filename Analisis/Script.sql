-- MySQL Script generated by MySQL Workbench
-- Thu Mar 14 14:13:26 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema libros
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema libros
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `libros` DEFAULT CHARACTER SET utf8 ;
USE `libros` ;

-- -----------------------------------------------------
-- Table `libros`.`li_libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libros`.`li_libros` (
  `id_li_libros` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `clave` VARCHAR(10) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `titulo` VARCHAR(200) NOT NULL,
  `subtitulo` VARCHAR(200) NOT NULL,
  `target` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_li_libros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libros`.`li_capitulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libros`.`li_capitulos` (
  `id_li_capitulos` INT NOT NULL,
  `libro` INT UNSIGNED NOT NULL,
  `numero` INT NOT NULL,
  `titulo` VARCHAR(100) NOT NULL,
  `introduccion` TEXT NOT NULL,
  PRIMARY KEY (`id_li_capitulos`),
  INDEX `fk_li_capitulos_li_libros_idx` (`libro` ASC) VISIBLE,
  CONSTRAINT `fk_li_capitulos_li_libros`
    FOREIGN KEY (`libro`)
    REFERENCES `libros`.`li_libros` (`id_li_libros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libros`.`li_clases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libros`.`li_clases` (
  `id_li_clases` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `capitulo` INT NOT NULL,
  `clase` INT NOT NULL,
  `indice` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(300) NOT NULL,
  `texto` TEXT NOT NULL,
  `video` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_li_clases`),
  INDEX `fk_li_clases_li_capitulos1_idx` (`capitulo` ASC) VISIBLE,
  CONSTRAINT `fk_li_clases_li_capitulos1`
    FOREIGN KEY (`capitulo`)
    REFERENCES `libros`.`li_capitulos` (`id_li_capitulos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

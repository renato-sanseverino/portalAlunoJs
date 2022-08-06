-- MySQL Script generated by MySQL Workbench
-- Thu Aug  4 20:27:46 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema portal_aluno
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portal_aluno
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portal_aluno` DEFAULT CHARACTER SET utf8 ;
USE `portal_aluno` ;

-- -----------------------------------------------------
-- Table `portal_aluno`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portal_aluno`.`aluno` (
  `rg` VARCHAR(30) NOT NULL,
  `nome` VARCHAR(150) NOT NULL,
  `serie` VARCHAR(30) NOT NULL,
  `classe` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`rg`),
  UNIQUE INDEX `rg_UNIQUE` (`rg` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portal_aluno`.`materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portal_aluno`.`materia` (
  `codigo` INT NOT NULL,
  `nome` VARCHAR(120) NOT NULL,
  `descrição` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `codigoMateria_UNIQUE` (`codigo` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portal_aluno`.`nota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portal_aluno`.`nota` (
  `materia` INT NOT NULL,
  `aluno` VARCHAR(30) NOT NULL,
  `bimestre` INT NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portal_aluno`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portal_aluno`.`professor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(150) NOT NULL,
  `email` VARCHAR(120) NOT NULL,
  `foto` LONGTEXT NOT NULL,
  `formatoImagem` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `portal_aluno`.`aluno`
-- -----------------------------------------------------
START TRANSACTION;
USE `portal_aluno`;
INSERT INTO `portal_aluno`.`aluno` (`rg`, `nome`, `serie`, `classe`) VALUES ('1111', 'Gabrielle Lins da Costa', '8', '2 B');
INSERT INTO `portal_aluno`.`aluno` (`rg`, `nome`, `serie`, `classe`) VALUES ('2222', 'Joao Carlos Cardoso', '8', '2 B');
INSERT INTO `portal_aluno`.`aluno` (`rg`, `nome`, `serie`, `classe`) VALUES ('3333', 'Vicente Santos da Silva', '5', '3 C');
INSERT INTO `portal_aluno`.`aluno` (`rg`, `nome`, `serie`, `classe`) VALUES ('4444', 'Sarah Carvalho Mendonça', '5', '3 C');

COMMIT;


-- -----------------------------------------------------
-- Data for table `portal_aluno`.`professor`
-- -----------------------------------------------------
START TRANSACTION;
USE `portal_aluno`;
INSERT INTO `portal_aluno`.`professor` (`id`, `nome`, `email`, `foto`, `formatoImagem`) VALUES (1, 'ISABELA CRISTINA CASSIANO', 'isabela@gmail.com', '/9j/2wBDAAYEBQYFBAYGBQYHBwYIChAKCgkJ....', 'image/jpg;base64');
INSERT INTO `portal_aluno`.`professor` (`id`, `nome`, `email`, `foto`, `formatoImagem`) VALUES (2, 'CAROLINA MENEZES DA COSTA', 'carolina@terra.com.br', '/9j/2wBDAAYEBQYFBAYGBQYHBwYIChAK....', 'image/jpg;base64');
INSERT INTO `portal_aluno`.`professor` (`id`, `nome`, `email`, `foto`, `formatoImagem`) VALUES (3, 'LUIZ AUGUSTO TEIXEIRA BRANCO', 'luizaugusto@gmail.com', '/9j/2wBDAAYEBQYFBAYGBQYHBwYIC....', 'image/jpg;base64');
INSERT INTO `portal_aluno`.`professor` (`id`, `nome`, `email`, `foto`, `formatoImagem`) VALUES (4, 'CAIO BATISTA CABRAL', 'caiocabral@hotmail.com.br', 'iVBORw0KGgoAAAANSUhEUgAAALQAAADyCAIAAAB....', 'image/png;base64');
INSERT INTO `portal_aluno`.`professor` (`id`, `nome`, `email`, `foto`, `formatoImagem`) VALUES (5, 'VINICIUS RODRIGUES FEITOZA VILLACA', 'vinicius@hotmail.com', 'iVBORw0KGgoAAAANSUhEUgAAALQAA....', 'image/png;base64');
INSERT INTO `portal_aluno`.`professor` (`id`, `nome`, `email`, `foto`, `formatoImagem`) VALUES (6, 'GEILDA CAMPOS ALVARIO MARQUEZ', 'geilda33@gmail.com', 'iVBORw0KGgoAAAANSUhEUgAAALQAAADyCAIA....', 'image/png;base64');

COMMIT;


-- MySQL Script generated by MySQL Workbench
-- Thu Dec 20 14:08:26 2018
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`Proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proyecto` (
  `Nombre` VARCHAR(45) NOT NULL,
  `Codigo` INT NOT NULL,
  PRIMARY KEY (`Nombre`, `Codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Jefe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Jefe` (
  `Telefono` INT NULL,
  `Direccion` VARCHAR(45) NULL,
  `Nombre` VARCHAR(45) NULL,
  `DNI` INT NOT NULL,
  `CodigoProyecto` INT NOT NULL,
  PRIMARY KEY (`CodigoProyecto`, `DNI`),
  CONSTRAINT `fk_proyecto`
    FOREIGN KEY (`CodigoProyecto`)
    REFERENCES `mydb`.`Proyecto` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Planos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Planos` (
  `Fechainicio` DATETIME NULL,
  `ID` INT NOT NULL,
  `CodigoProyecto` INT NOT NULL,
  PRIMARY KEY (`ID`, `CodigoProyecto`),
  INDEX `fk_proyecto_idx` (`CodigoProyecto` ASC) VISIBLE,
  CONSTRAINT `fk_proyecto`
    FOREIGN KEY (`CodigoProyecto`)
    REFERENCES `mydb`.`Proyecto` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Arquictetos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Arquictetos` (
  `DNI` INT NOT NULL,
  `ID_plano` INT NULL,
  PRIMARY KEY (`DNI`),
  INDEX `fk_plano_idx` (`ID_plano` ASC) VISIBLE,
  CONSTRAINT `fk_plano`
    FOREIGN KEY (`ID_plano`)
    REFERENCES `mydb`.`Planos` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Figuras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Figuras` (
  `nombre` VARCHAR(45) NULL,
  `Color` VARCHAR(45) NULL,
  `Perimetro` INT NULL,
  `Area` INT NULL,
  `ID` INT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lineas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lineas` (
  `ID` INT NOT NULL,
  `Origen` INT NULL,
  `Final` INT NULL,
  `Longitud` INT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Numero_lineas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Numero_lineas` (
  `id_Linea` INT NULL,
  `id_figura` INT NULL,
  INDEX `fk_linea_idx` (`id_Linea` ASC) VISIBLE,
  CONSTRAINT `fk_figura`
    FOREIGN KEY (`id_figura`)
    REFERENCES `mydb`.`Figuras` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_linea`
    FOREIGN KEY (`id_Linea`)
    REFERENCES `mydb`.`Lineas` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Numero_figuras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Numero_figuras` (
  `id_figura` INT NULL,
  `id_plano` INT NULL,
  INDEX `fk_figura_idx` (`id_figura` ASC) VISIBLE,
  CONSTRAINT `fk_plano`
    FOREIGN KEY (`id_plano`)
    REFERENCES `mydb`.`Planos` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_figura`
    FOREIGN KEY (`id_figura`)
    REFERENCES `mydb`.`Figuras` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`Proyecto`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Proyecto` (`Nombre`, `Codigo`) VALUES ('Proyecto1', 1);
INSERT INTO `mydb`.`Proyecto` (`Nombre`, `Codigo`) VALUES ('Proyecto2', 2);
INSERT INTO `mydb`.`Proyecto` (`Nombre`, `Codigo`) VALUES ('Proyecto3', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Jefe`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Jefe` (`Telefono`, `Direccion`, `Nombre`, `DNI`, `CodigoProyecto`) VALUES (111111111, 'CaminoVerde', 'Juan', 1111, 1);
INSERT INTO `mydb`.`Jefe` (`Telefono`, `Direccion`, `Nombre`, `DNI`, `CodigoProyecto`) VALUES (222222222, 'CaminoAmarillo', 'Pepe', 2222, 2);
INSERT INTO `mydb`.`Jefe` (`Telefono`, `Direccion`, `Nombre`, `DNI`, `CodigoProyecto`) VALUES (333333333, 'CaminoAzul', 'Lucia', 3333, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Planos`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Planos` (`Fechainicio`, `ID`, `CodigoProyecto`) VALUES ('11-12-13', 1, 1);
INSERT INTO `mydb`.`Planos` (`Fechainicio`, `ID`, `CodigoProyecto`) VALUES ('12-11-14', 2, 2);
INSERT INTO `mydb`.`Planos` (`Fechainicio`, `ID`, `CodigoProyecto`) VALUES ('14-12-20', 3, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Arquictetos`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Arquictetos` (`DNI`, `ID_plano`) VALUES (4444, 1);
INSERT INTO `mydb`.`Arquictetos` (`DNI`, `ID_plano`) VALUES (5555, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Figuras`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Figuras` (`nombre`, `Color`, `Perimetro`, `Area`, `ID`) VALUES ('Circulo', 'Azul', 0, 0, 1);
INSERT INTO `mydb`.`Figuras` (`nombre`, `Color`, `Perimetro`, `Area`, `ID`) VALUES ('Cuadrado', 'Amarillo', 4, 4, 2);
INSERT INTO `mydb`.`Figuras` (`nombre`, `Color`, `Perimetro`, `Area`, `ID`) VALUES ('Rectangulo', 'Verde', 4, 1, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Lineas`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Lineas` (`ID`, `Origen`, `Final`, `Longitud`) VALUES (1, 0, 1, 1);
INSERT INTO `mydb`.`Lineas` (`ID`, `Origen`, `Final`, `Longitud`) VALUES (2, 1, 2, 1);
INSERT INTO `mydb`.`Lineas` (`ID`, `Origen`, `Final`, `Longitud`) VALUES (3, 2, 3, 1);
INSERT INTO `mydb`.`Lineas` (`ID`, `Origen`, `Final`, `Longitud`) VALUES (4, 3, 0, 1);
INSERT INTO `mydb`.`Lineas` (`ID`, `Origen`, `Final`, `Longitud`) VALUES (5, 1, 3, 2);
INSERT INTO `mydb`.`Lineas` (`ID`, `Origen`, `Final`, `Longitud`) VALUES (6, 3, 4, 1);
INSERT INTO `mydb`.`Lineas` (`ID`, `Origen`, `Final`, `Longitud`) VALUES (7, 4, 0, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Numero_lineas`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Numero_lineas` (`id_Linea`, `id_figura`) VALUES (1, 2);
INSERT INTO `mydb`.`Numero_lineas` (`id_Linea`, `id_figura`) VALUES (2, 2);
INSERT INTO `mydb`.`Numero_lineas` (`id_Linea`, `id_figura`) VALUES (3, 2);
INSERT INTO `mydb`.`Numero_lineas` (`id_Linea`, `id_figura`) VALUES (4, 2);
INSERT INTO `mydb`.`Numero_lineas` (`id_Linea`, `id_figura`) VALUES (1, 3);
INSERT INTO `mydb`.`Numero_lineas` (`id_Linea`, `id_figura`) VALUES (5, 3);
INSERT INTO `mydb`.`Numero_lineas` (`id_Linea`, `id_figura`) VALUES (6, 3);
INSERT INTO `mydb`.`Numero_lineas` (`id_Linea`, `id_figura`) VALUES (7, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Numero_figuras`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Numero_figuras` (`id_figura`, `id_plano`) VALUES (1, 1);
INSERT INTO `mydb`.`Numero_figuras` (`id_figura`, `id_plano`) VALUES (2, 2);
INSERT INTO `mydb`.`Numero_figuras` (`id_figura`, `id_plano`) VALUES (1, 2);
INSERT INTO `mydb`.`Numero_figuras` (`id_figura`, `id_plano`) VALUES (1, 3);
INSERT INTO `mydb`.`Numero_figuras` (`id_figura`, `id_plano`) VALUES (2, 3);
INSERT INTO `mydb`.`Numero_figuras` (`id_figura`, `id_plano`) VALUES (3, 3);

COMMIT;

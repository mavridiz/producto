-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema producto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema producto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `producto` DEFAULT CHARACTER SET utf8 ;
USE `producto` ;

-- -----------------------------------------------------
-- Table `producto`.`tbl_proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `producto`.`tbl_proveedor` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `nomProveedor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `producto`.`tbl_marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `producto`.`tbl_marca` (
  `idMarca` INT NOT NULL AUTO_INCREMENT,
  `nomMarca` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMarca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `producto`.`tbl_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `producto`.`tbl_producto` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `nomProducto` VARCHAR(45) NOT NULL,
  `descProducto` VARCHAR(100) NOT NULL,
  `urlProducto` VARCHAR(45) NOT NULL,
  `precioPubl` INT NOT NULL,
  `costoProducto` INT NOT NULL,
  `idProveedor` INT NOT NULL,
  `idMarca` INT NOT NULL,
  PRIMARY KEY (`idProducto`),
  CONSTRAINT `fk_tbl_producto_tbl_proveedor`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `producto`.`tbl_proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_producto_tbl_marca1`
    FOREIGN KEY (`idMarca`)
    REFERENCES `producto`.`tbl_marca` (`idMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_tbl_producto_tbl_proveedor_idx` ON `producto`.`tbl_producto` (`idProveedor` ASC) VISIBLE;

CREATE INDEX `fk_tbl_producto_tbl_marca1_idx` ON `producto`.`tbl_producto` (`idMarca` ASC) VISIBLE;

CREATE UNIQUE INDEX `UX_TBL_PRODUCTO` USING BTREE ON `producto`.`tbl_producto` () VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

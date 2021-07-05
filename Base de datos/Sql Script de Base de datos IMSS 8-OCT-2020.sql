-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema IMSS_035
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema IMSS_035
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `IMSS_035` DEFAULT CHARACTER SET utf8 ;
USE `IMSS_035` ;

-- -----------------------------------------------------
-- Table `IMSS_035`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMSS_035`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre_usuario` VARCHAR(125) NOT NULL,
  `Contraseña` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMSS_035`.`Encuestador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMSS_035`.`Encuestador` (
  `idEncuestador` INT NOT NULL AUTO_INCREMENT,
  `Foto` BLOB NULL,
  `Nombre_Encuestador` VARCHAR(120) NOT NULL,
  `Empresa` VARCHAR(120) NOT NULL,
  `Direccion` VARCHAR(250) NOT NULL,
  `Colonia` VARCHAR(200) NOT NULL,
  `Ciudad` VARCHAR(200) NOT NULL,
  `Estado` VARCHAR(200) NOT NULL,
  `Telefono` VARCHAR(200) NOT NULL,
  `Fax` VARCHAR(200) NULL,
  `RFC` VARCHAR(250) NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idEncuestador`),
  INDEX `fk_Encuestador_Usuario_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Encuestador_Usuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `IMSS_035`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMSS_035`.`Encuestado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMSS_035`.`Encuestado` (
  `idEncuestado` INT NOT NULL AUTO_INCREMENT,
  `Sexo` VARCHAR(30) NULL,
  `Edad` VARCHAR(20) NULL,
  `Estado_Civil` VARCHAR(120) NULL,
  `Niveles_Estudios` VARCHAR(120) NULL,
  `Ocupacion` VARCHAR(120) NULL,
  `Departamento` VARCHAR(120) NULL,
  `Tipo_Puesto` VARCHAR(120) NULL,
  `Tipo_Personal` VARCHAR(120) NULL,
  `Tipo_Contratacion` VARCHAR(120) NULL,
  `Tipo_Jornada` VARCHAR(120) NULL,
  `Rotacion_Turnos` VARCHAR(120) NULL,
  `Experiencia_Actual` VARCHAR(120) NULL,
  `Experiencia_Laboral` VARCHAR(120) NULL,
  PRIMARY KEY (`idEncuestado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMSS_035`.`Encuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMSS_035`.`Encuesta` (
  `IdEncuesta` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Encuesta` VARCHAR(250) NULL,
  PRIMARY KEY (`IdEncuesta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMSS_035`.`Fichas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMSS_035`.`Fichas` (
  `idFichas` INT NOT NULL AUTO_INCREMENT,
  `Numero-Ficha` VARCHAR(30) NULL,
  `Fecha` DATE NULL,
  `Encuestado_idEncuestado` INT NOT NULL,
  `Encuesta_IdEncuesta` INT NOT NULL,
  PRIMARY KEY (`idFichas`),
  INDEX `fk_Fichas_Encuestado1_idx` (`Encuestado_idEncuestado` ASC) VISIBLE,
  INDEX `fk_Fichas_Encuesta1_idx` (`Encuesta_IdEncuesta` ASC) VISIBLE,
  CONSTRAINT `fk_Fichas_Encuestado1`
    FOREIGN KEY (`Encuestado_idEncuestado`)
    REFERENCES `IMSS_035`.`Encuestado` (`idEncuestado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fichas_Encuesta1`
    FOREIGN KEY (`Encuesta_IdEncuesta`)
    REFERENCES `IMSS_035`.`Encuesta` (`IdEncuesta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMSS_035`.`Grupo_Respuestas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMSS_035`.`Grupo_Respuestas` (
  `idGrupo_Respuestas` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Grupo` VARCHAR(70) NULL,
  PRIMARY KEY (`idGrupo_Respuestas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMSS_035`.`Calificacion_Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMSS_035`.`Calificacion_Categoria` (
  `idCalificacion_Categoria` INT NOT NULL AUTO_INCREMENT,
  `Descripcion_Descripcion` VARCHAR(220) NULL,
  PRIMARY KEY (`idCalificacion_Categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMSS_035`.`Calificacion_Dominio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMSS_035`.`Calificacion_Dominio` (
  `idCalificacion_Dominio` INT NOT NULL AUTO_INCREMENT,
  `Descripcion_Dominio` VARCHAR(220) NULL,
  `Calificacion_Categoria_idCalificacion_Categoria` INT NOT NULL,
  PRIMARY KEY (`idCalificacion_Dominio`),
  INDEX `fk_Calificacion_Dominio_Calificacion_Categoria1_idx` (`Calificacion_Categoria_idCalificacion_Categoria` ASC) VISIBLE,
  CONSTRAINT `fk_Calificacion_Dominio_Calificacion_Categoria1`
    FOREIGN KEY (`Calificacion_Categoria_idCalificacion_Categoria`)
    REFERENCES `IMSS_035`.`Calificacion_Categoria` (`idCalificacion_Categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMSS_035`.`Calificacion_Dimension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMSS_035`.`Calificacion_Dimension` (
  `IdCalificacion_Dimension` INT NOT NULL AUTO_INCREMENT,
  `Descripcion_Dimension` VARCHAR(220) NULL,
  `Calificacion_Dominio_idCalificacion_Dominio` INT NOT NULL,
  PRIMARY KEY (`IdCalificacion_Dimension`),
  INDEX `fk_Calificacion_Dimension_Calificacion_Dominio1_idx` (`Calificacion_Dominio_idCalificacion_Dominio` ASC) VISIBLE,
  CONSTRAINT `fk_Calificacion_Dimension_Calificacion_Dominio1`
    FOREIGN KEY (`Calificacion_Dominio_idCalificacion_Dominio`)
    REFERENCES `IMSS_035`.`Calificacion_Dominio` (`idCalificacion_Dominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMSS_035`.`Pregunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMSS_035`.`Pregunta` (
  `idPregunta` INT NOT NULL AUTO_INCREMENT,
  `Descripcion_Pregunta` VARCHAR(300) NULL,
  `Encuesta_IdEncuesta` INT NOT NULL,
  `Grupo_Respuestas_idGrupo_Respuestas` INT NOT NULL,
  `Calificacion_Dimension_IdCalificacion_Dimension` INT NOT NULL,
  PRIMARY KEY (`idPregunta`),
  INDEX `fk_Pregunta_Encuesta1_idx` (`Encuesta_IdEncuesta` ASC) VISIBLE,
  INDEX `fk_Pregunta_Grupo_Respuestas1_idx` (`Grupo_Respuestas_idGrupo_Respuestas` ASC) VISIBLE,
  INDEX `fk_Pregunta_Calificacion_Dimension1_idx` (`Calificacion_Dimension_IdCalificacion_Dimension` ASC) VISIBLE,
  CONSTRAINT `fk_Pregunta_Encuesta1`
    FOREIGN KEY (`Encuesta_IdEncuesta`)
    REFERENCES `IMSS_035`.`Encuesta` (`IdEncuesta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pregunta_Grupo_Respuestas1`
    FOREIGN KEY (`Grupo_Respuestas_idGrupo_Respuestas`)
    REFERENCES `IMSS_035`.`Grupo_Respuestas` (`idGrupo_Respuestas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pregunta_Calificacion_Dimension1`
    FOREIGN KEY (`Calificacion_Dimension_IdCalificacion_Dimension`)
    REFERENCES `IMSS_035`.`Calificacion_Dimension` (`IdCalificacion_Dimension`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMSS_035`.`Respuestas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMSS_035`.`Respuestas` (
  `idRespuestas` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(45) NULL,
  `Ponderacion` INT NULL,
  `Grupo_Respuestas_idGrupo_Respuestas` INT NOT NULL,
  PRIMARY KEY (`idRespuestas`),
  INDEX `fk_Respuestas_Grupo_Respuestas1_idx` (`Grupo_Respuestas_idGrupo_Respuestas` ASC) VISIBLE,
  CONSTRAINT `fk_Respuestas_Grupo_Respuestas1`
    FOREIGN KEY (`Grupo_Respuestas_idGrupo_Respuestas`)
    REFERENCES `IMSS_035`.`Grupo_Respuestas` (`idGrupo_Respuestas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMSS_035`.`Detalle_Fichas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMSS_035`.`Detalle_Fichas` (
  `idDetalle_Fichas` INT NOT NULL AUTO_INCREMENT,
  `Fichas_idFichas` INT NOT NULL,
  `Encuesta_IdEncuesta` INT NOT NULL,
  `Pregunta_idPregunta` INT NOT NULL,
  `Respuestas_idRespuestas` INT NOT NULL,
  PRIMARY KEY (`idDetalle_Fichas`),
  INDEX `fk_Detalle_Fichas_Fichas1_idx` (`Fichas_idFichas` ASC) VISIBLE,
  INDEX `fk_Detalle_Fichas_Encuesta1_idx` (`Encuesta_IdEncuesta` ASC) VISIBLE,
  INDEX `fk_Detalle_Fichas_Pregunta1_idx` (`Pregunta_idPregunta` ASC) VISIBLE,
  INDEX `fk_Detalle_Fichas_Respuestas1_idx` (`Respuestas_idRespuestas` ASC) VISIBLE,
  CONSTRAINT `fk_Detalle_Fichas_Fichas1`
    FOREIGN KEY (`Fichas_idFichas`)
    REFERENCES `IMSS_035`.`Fichas` (`idFichas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Fichas_Encuesta1`
    FOREIGN KEY (`Encuesta_IdEncuesta`)
    REFERENCES `IMSS_035`.`Encuesta` (`IdEncuesta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Fichas_Pregunta1`
    FOREIGN KEY (`Pregunta_idPregunta`)
    REFERENCES `IMSS_035`.`Pregunta` (`idPregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Fichas_Respuestas1`
    FOREIGN KEY (`Respuestas_idRespuestas`)
    REFERENCES `IMSS_035`.`Respuestas` (`idRespuestas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

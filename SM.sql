-- MySQL Script generated by MySQL Workbench
-- Сб 06 окт 2018 12:19:27
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Покупатель`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Покупатель` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Покупатель` (
  `idПокупатель` INT NOT NULL AUTO_INCREMENT,
  `Наименование` VARCHAR(45) NOT NULL,
  `Адрес` VARCHAR(300) NOT NULL,
  `Банковский реквизит` VARCHAR(45) NOT NULL,
  `Налоговый реквизит` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idПокупатель`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Договор`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Договор` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Договор` (
  `idДоговор` INT NOT NULL AUTO_INCREMENT,
  `Номер договора` VARCHAR(50) NOT NULL,
  `Дата начала действия` DATE NOT NULL,
  `Дата окончания действия` DATE NOT NULL,
  `Покупатель_idПокупатель` INT NOT NULL,
  PRIMARY KEY (`idДоговор`),
  UNIQUE INDEX `Номер договора_UNIQUE` (`Номер договора` ASC),
  INDEX `fk_Договор_Покупатель1_idx` (`Покупатель_idПокупатель` ASC),
  CONSTRAINT `fk_Договор_Покупатель1`
    FOREIGN KEY (`Покупатель_idПокупатель`)
    REFERENCES `mydb`.`Покупатель` (`idПокупатель`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Перевозчик`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Перевозчик` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Перевозчик` (
  `idПеревозчик` INT NOT NULL AUTO_INCREMENT,
  `Наименование` VARCHAR(45) NOT NULL,
  `Адрес` VARCHAR(300) NOT NULL,
  `Банковский реквизит` VARCHAR(45) NOT NULL,
  `Налоговый реквизит` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idПеревозчик`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Запись перевозчиков`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Запись перевозчиков` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Запись перевозчиков` (
  `Договор_idДоговор` INT NOT NULL,
  `Перевозчик_idПеревозчик` INT NOT NULL,
  PRIMARY KEY (`Договор_idДоговор`, `Перевозчик_idПеревозчик`),
  INDEX `fk_Запись перевозчиков_Договор1_idx` (`Договор_idДоговор` ASC),
  INDEX `fk_Запись перевозчиков_Перевозчи_idx` (`Перевозчик_idПеревозчик` ASC),
  CONSTRAINT `fk_Запись перевозчиков_Договор1`
    FOREIGN KEY (`Договор_idДоговор`)
    REFERENCES `mydb`.`Договор` (`idДоговор`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Запись перевозчиков_Перевозчик1`
    FOREIGN KEY (`Перевозчик_idПеревозчик`)
    REFERENCES `mydb`.`Перевозчик` (`idПеревозчик`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Нормативный документ`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Нормативный документ` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Нормативный документ` (
  `idНормативный договор` INT NOT NULL AUTO_INCREMENT,
  `Тип документа` VARCHAR(15) NOT NULL,
  `Наименование` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idНормативный договор`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Товар`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Товар` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Товар` (
  `idТовар` INT NOT NULL AUTO_INCREMENT,
  `Наименование` VARCHAR(150) NOT NULL,
  `Единица измерения` VARCHAR(10) NOT NULL,
  `Стоимость` INT UNSIGNED NOT NULL,
  `Срок изготовления` INT UNSIGNED NOT NULL,
  `Срок поставки` INT UNSIGNED NOT NULL,
  `Нормативный документ_idНормативный документ` INT NOT NULL,
  PRIMARY KEY (`idТовар`),
  INDEX `fk_Товар_Нормативный договор1_idx` (`Нормативный документ_idНормативный документ` ASC),
  CONSTRAINT `fk_Товар_Нормативный договор1`
    FOREIGN KEY (`Нормативный документ_idНормативный документ`)
    REFERENCES `mydb`.`Нормативный документ` (`idНормативный договор`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Запись товаров в договоре`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Запись товаров в договоре` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Запись товаров в договоре` (
  `Договор_idДоговор` INT NOT NULL,
  `Товар_idТовар` INT NOT NULL,
  `Кол-во товара` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Договор_idДоговор`, `Товар_idТовар`),
  INDEX `fk_Запись товаров в договоре_Това_idx` (`Товар_idТовар` ASC),
  CONSTRAINT `fk_Запись товаров в договоре_Догов1`
    FOREIGN KEY (`Договор_idДоговор`)
    REFERENCES `mydb`.`Договор` (`idДоговор`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Запись товаров в договоре_Товар1`
    FOREIGN KEY (`Товар_idТовар`)
    REFERENCES `mydb`.`Товар` (`idТовар`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Сырье`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Сырье` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Сырье` (
  `idСырье` INT NOT NULL AUTO_INCREMENT,
  `Наименование` VARCHAR(45) NOT NULL,
  `Стоимость` INT UNSIGNED NOT NULL,
  `Единица измерения` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idСырье`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Список сырья в товаре`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Список сырья в товаре` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Список сырья в товаре` (
  `Товар_idТовар` INT NOT NULL,
  `Сырье_idСырье` INT NOT NULL,
  `Кол-во единицы сырья` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Товар_idТовар`, `Сырье_idСырье`),
  INDEX `fk_Список сырья в товаре_Сырье1_idx` (`Сырье_idСырье` ASC),
  CONSTRAINT `fk_Список сырья в товаре_Товар1`
    FOREIGN KEY (`Товар_idТовар`)
    REFERENCES `mydb`.`Товар` (`idТовар`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Список сырья в товаре_Сырье1`
    FOREIGN KEY (`Сырье_idСырье`)
    REFERENCES `mydb`.`Сырье` (`idСырье`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Список сырья в документе`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Список сырья в документе` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Список сырья в документе` (
  `Нормативный документ_idНормативный документ` INT NOT NULL,
  `Сырье_idСырье` INT NOT NULL,
  PRIMARY KEY (`Нормативный документ_idНормативный документ`, `Сырье_idСырье`),
  INDEX `fk_Список сырья в документе_Сырье_idx` (`Сырье_idСырье` ASC),
  CONSTRAINT `fk_Список сырья в документе_Нормат1`
    FOREIGN KEY (`Нормативный документ_idНормативный документ`)
    REFERENCES `mydb`.`Нормативный документ` (`idНормативный договор`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Список сырья в документе_Сырье1`
    FOREIGN KEY (`Сырье_idСырье`)
    REFERENCES `mydb`.`Сырье` (`idСырье`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Отдел`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Отдел` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Отдел` (
  `idОтдел` INT NOT NULL AUTO_INCREMENT,
  `Наименование` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idОтдел`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Список товаров произв. отделом`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Список товаров произв. отделом` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Список товаров произв. отделом` (
  `Отдел_idОтдел` INT NOT NULL,
  `Товар_idТовар` INT NOT NULL,
  PRIMARY KEY (`Отдел_idОтдел`, `Товар_idТовар`),
  INDEX `fk_Список товаров в отделе_Товар1_idx` (`Товар_idТовар` ASC),
  CONSTRAINT `fk_Список товаров в отделе_Отдел1`
    FOREIGN KEY (`Отдел_idОтдел`)
    REFERENCES `mydb`.`Отдел` (`idОтдел`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Список товаров в отделе_Товар1`
    FOREIGN KEY (`Товар_idТовар`)
    REFERENCES `mydb`.`Товар` (`idТовар`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Сотрудник`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Сотрудник` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Сотрудник` (
  `idСотрудник` INT NOT NULL AUTO_INCREMENT,
  `ФИО` VARCHAR(60) NOT NULL,
  `Размер ЗП` INT UNSIGNED NOT NULL,
  `Отдел_idОтдел` INT NOT NULL,
  PRIMARY KEY (`idСотрудник`),
  INDEX `fk_Сотрудник_Отдел1_idx` (`Отдел_idОтдел` ASC),
  CONSTRAINT `fk_Сотрудник_Отдел1`
    FOREIGN KEY (`Отдел_idОтдел`)
    REFERENCES `mydb`.`Отдел` (`idОтдел`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`Покупатель`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Покупатель` (`idПокупатель`, `Наименование`, `Адрес`, `Банковский реквизит`, `Налоговый реквизит`) VALUES (1, 'ЗАО НПК \"Эталон\" ', '347360, Ростовская область, г.Волгодонск, ул.6-я Заводская, д.25', '40702810200000002805', '6143002656');
INSERT INTO `mydb`.`Покупатель` (`idПокупатель`, `Наименование`, `Адрес`, `Банковский реквизит`, `Налоговый реквизит`) VALUES (2, 'ООО \"Стоматех-Л\"', '620049, г. Екатеринбург, Комсомольская ул., 48', '40702810263598592553', '6662100294');
INSERT INTO `mydb`.`Покупатель` (`idПокупатель`, `Наименование`, `Адрес`, `Банковский реквизит`, `Налоговый реквизит`) VALUES (3, 'ООО \"Завод №423\"', '301830, Тульская обл., г. Богородицк, проезд Заводской, строение № 2Б', '40702810697001584257', '7112011490');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Договор`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Договор` (`idДоговор`, `Номер договора`, `Дата начала действия`, `Дата окончания действия`, `Покупатель_idПокупатель`) VALUES (1, '61П-17/СМ/54', '2017-01-01', '2018-12-31', 1);
INSERT INTO `mydb`.`Договор` (`idДоговор`, `Номер договора`, `Дата начала действия`, `Дата окончания действия`, `Покупатель_idПокупатель`) VALUES (2, '11П-18/СМ/22', '2018-02-01', '2019-01-02', 2);
INSERT INTO `mydb`.`Договор` (`idДоговор`, `Номер договора`, `Дата начала действия`, `Дата окончания действия`, `Покупатель_idПокупатель`) VALUES (3, '123П-17/СМ/102', '2017-12-01', '2018-12-01', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Перевозчик`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Перевозчик` (`idПеревозчик`, `Наименование`, `Адрес`, `Банковский реквизит`, `Налоговый реквизит`) VALUES (1, 'ООО \"Бринкс\"', '115054, Москва, ул. Дубининская, д.57 стр.2 оф. 2204', '40702810400001416438', '7743698003 ');
INSERT INTO `mydb`.`Перевозчик` (`idПеревозчик`, `Наименование`, `Адрес`, `Банковский реквизит`, `Налоговый реквизит`) VALUES (2, 'ФГУП ГЦСС', '129626, г. Москва, 1‑я Мытищинская ул., д. 17', '40502810738090000026', '7717043113');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Запись перевозчиков`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Запись перевозчиков` (`Договор_idДоговор`, `Перевозчик_idПеревозчик`) VALUES (1, 1);
INSERT INTO `mydb`.`Запись перевозчиков` (`Договор_idДоговор`, `Перевозчик_idПеревозчик`) VALUES (2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Нормативный документ`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Нормативный документ` (`idНормативный договор`, `Тип документа`, `Наименование`) VALUES (1, 'ТУ', 'ТУ 3591-030-17444965-2012');
INSERT INTO `mydb`.`Нормативный документ` (`idНормативный договор`, `Тип документа`, `Наименование`) VALUES (2, 'ГОСТ', 'ГОСТ 21007-2014');
INSERT INTO `mydb`.`Нормативный документ` (`idНормативный договор`, `Тип документа`, `Наименование`) VALUES (3, 'ГОСТ', 'ГОСТ 6563-2016');
INSERT INTO `mydb`.`Нормативный документ` (`idНормативный договор`, `Тип документа`, `Наименование`) VALUES (4, 'ГОСТ', 'ГОСТ 10821-2007');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Товар`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Товар` (`idТовар`, `Наименование`, `Единица измерения`, `Стоимость`, `Срок изготовления`, `Срок поставки`, `Нормативный документ_idНормативный документ`) VALUES (1, 'Провод ПЭТПл2 0,05  ТУ 3591-030-17444965-2012', 'Гр', 2750, 40, 6, 1);
INSERT INTO `mydb`.`Товар` (`idТовар`, `Наименование`, `Единица измерения`, `Стоимость`, `Срок изготовления`, `Срок поставки`, `Нормативный документ_idНормативный документ`) VALUES (2, 'Проволока Пл2-А М 0,05 ГОСТ 21007-2014', 'Гр', 2270, 40, 6, 2);
INSERT INTO `mydb`.`Товар` (`idТовар`, `Наименование`, `Единица измерения`, `Стоимость`, `Срок изготовления`, `Срок поставки`, `Нормативный документ_idНормативный документ`) VALUES (3, 'Тигель 100-10 высокий Пл 99,93 ГОСТ 6563-2016', 'Шт', 5800, 30, 6, 3);
INSERT INTO `mydb`.`Товар` (`idТовар`, `Наименование`, `Единица измерения`, `Стоимость`, `Срок изготовления`, `Срок поставки`, `Нормативный документ_idНормативный документ`) VALUES (4, 'Тигель  широкий 107-2 Пл 99,93 ГОСТ 6563-2016', 'Шт', 6100, 30, 6, 3);
INSERT INTO `mydb`.`Товар` (`idТовар`, `Наименование`, `Единица измерения`, `Стоимость`, `Срок изготовления`, `Срок поставки`, `Нормативный документ_idНормативный документ`) VALUES (5, 'Проволока ПлТ/ПР-10 д.0,3-0,5 ГОСТ 10821-2007', 'Гр', 2320, 30, 6, 4);
INSERT INTO `mydb`.`Товар` (`idТовар`, `Наименование`, `Единица измерения`, `Стоимость`, `Срок изготовления`, `Срок поставки`, `Нормативный документ_idНормативный документ`) VALUES (6, 'Проволока  ПР-6/ПР-30 д.0,3-0,5 ГОСТ 10821-2007', 'Гр', 2960, 30, 6, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Запись товаров в договоре`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Запись товаров в договоре` (`Договор_idДоговор`, `Товар_idТовар`, `Кол-во товара`) VALUES (1, 1, 150);
INSERT INTO `mydb`.`Запись товаров в договоре` (`Договор_idДоговор`, `Товар_idТовар`, `Кол-во товара`) VALUES (1, 2, 200);
INSERT INTO `mydb`.`Запись товаров в договоре` (`Договор_idДоговор`, `Товар_idТовар`, `Кол-во товара`) VALUES (2, 3, 5);
INSERT INTO `mydb`.`Запись товаров в договоре` (`Договор_idДоговор`, `Товар_idТовар`, `Кол-во товара`) VALUES (2, 4, 6);
INSERT INTO `mydb`.`Запись товаров в договоре` (`Договор_idДоговор`, `Товар_idТовар`, `Кол-во товара`) VALUES (3, 5, 150);
INSERT INTO `mydb`.`Запись товаров в договоре` (`Договор_idДоговор`, `Товар_idТовар`, `Кол-во товара`) VALUES (3, 6, 150);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Сырье`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Сырье` (`idСырье`, `Наименование`, `Стоимость`, `Единица измерения`) VALUES (1, 'Платина', 1800, 'Гр');
INSERT INTO `mydb`.`Сырье` (`idСырье`, `Наименование`, `Стоимость`, `Единица измерения`) VALUES (2, 'Родий', 5000, 'Гр');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Список сырья в товаре`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Список сырья в товаре` (`Товар_idТовар`, `Сырье_idСырье`, `Кол-во единицы сырья`) VALUES (1, 1, 1);
INSERT INTO `mydb`.`Список сырья в товаре` (`Товар_idТовар`, `Сырье_idСырье`, `Кол-во единицы сырья`) VALUES (2, 1, 1);
INSERT INTO `mydb`.`Список сырья в товаре` (`Товар_idТовар`, `Сырье_idСырье`, `Кол-во единицы сырья`) VALUES (3, 1, 44);
INSERT INTO `mydb`.`Список сырья в товаре` (`Товар_idТовар`, `Сырье_idСырье`, `Кол-во единицы сырья`) VALUES (4, 1, 20);
INSERT INTO `mydb`.`Список сырья в товаре` (`Товар_idТовар`, `Сырье_idСырье`, `Кол-во единицы сырья`) VALUES (5, 1, 0.9);
INSERT INTO `mydb`.`Список сырья в товаре` (`Товар_idТовар`, `Сырье_idСырье`, `Кол-во единицы сырья`) VALUES (5, 2, 0.1);
INSERT INTO `mydb`.`Список сырья в товаре` (`Товар_idТовар`, `Сырье_idСырье`, `Кол-во единицы сырья`) VALUES (6, 1, 0.7);
INSERT INTO `mydb`.`Список сырья в товаре` (`Товар_idТовар`, `Сырье_idСырье`, `Кол-во единицы сырья`) VALUES (6, 2, 0.3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Отдел`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Отдел` (`idОтдел`, `Наименование`) VALUES (1, 'Отдел Кадров');
INSERT INTO `mydb`.`Отдел` (`idОтдел`, `Наименование`) VALUES (2, 'Бухгалтерия');
INSERT INTO `mydb`.`Отдел` (`idОтдел`, `Наименование`) VALUES (3, 'Научно-производственное отделение');
INSERT INTO `mydb`.`Отдел` (`idОтдел`, `Наименование`) VALUES (4, 'Отделение Плавки');
INSERT INTO `mydb`.`Отдел` (`idОтдел`, `Наименование`) VALUES (5, 'Отделение прокатки и сборки');
INSERT INTO `mydb`.`Отдел` (`idОтдел`, `Наименование`) VALUES (6, 'Отдел контороля качества');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Список товаров произв. отделом`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Список товаров произв. отделом` (`Отдел_idОтдел`, `Товар_idТовар`) VALUES (4, 1);
INSERT INTO `mydb`.`Список товаров произв. отделом` (`Отдел_idОтдел`, `Товар_idТовар`) VALUES (4, 2);
INSERT INTO `mydb`.`Список товаров произв. отделом` (`Отдел_idОтдел`, `Товар_idТовар`) VALUES (5, 1);
INSERT INTO `mydb`.`Список товаров произв. отделом` (`Отдел_idОтдел`, `Товар_idТовар`) VALUES (5, 2);
INSERT INTO `mydb`.`Список товаров произв. отделом` (`Отдел_idОтдел`, `Товар_idТовар`) VALUES (5, 3);
INSERT INTO `mydb`.`Список товаров произв. отделом` (`Отдел_idОтдел`, `Товар_idТовар`) VALUES (5, 4);
INSERT INTO `mydb`.`Список товаров произв. отделом` (`Отдел_idОтдел`, `Товар_idТовар`) VALUES (4, 5);
INSERT INTO `mydb`.`Список товаров произв. отделом` (`Отдел_idОтдел`, `Товар_idТовар`) VALUES (4, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Сотрудник`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Сотрудник` (`idСотрудник`, `ФИО`, `Размер ЗП`, `Отдел_idОтдел`) VALUES (1, 'Шабунин Яков Феоктистович', 50000, 4);
INSERT INTO `mydb`.`Сотрудник` (`idСотрудник`, `ФИО`, `Размер ЗП`, `Отдел_idОтдел`) VALUES (2, 'Шишлов Владлен Филимонович', 50000, 4);
INSERT INTO `mydb`.`Сотрудник` (`idСотрудник`, `ФИО`, `Размер ЗП`, `Отдел_idОтдел`) VALUES (3, 'Старкова Жанна Потаповна', 80000, 1);
INSERT INTO `mydb`.`Сотрудник` (`idСотрудник`, `ФИО`, `Размер ЗП`, `Отдел_idОтдел`) VALUES (4, 'Артёмов Николай Кириллович', 80000, 1);
INSERT INTO `mydb`.`Сотрудник` (`idСотрудник`, `ФИО`, `Размер ЗП`, `Отдел_idОтдел`) VALUES (5, 'Сагунова Роза Мироновна', 80000, 2);
INSERT INTO `mydb`.`Сотрудник` (`idСотрудник`, `ФИО`, `Размер ЗП`, `Отдел_idОтдел`) VALUES (6, 'Крутин Артемий Трофимович', 65000, 3);
INSERT INTO `mydb`.`Сотрудник` (`idСотрудник`, `ФИО`, `Размер ЗП`, `Отдел_idОтдел`) VALUES (7, 'Кожуров Станислав Гордеевич', 65000, 3);
INSERT INTO `mydb`.`Сотрудник` (`idСотрудник`, `ФИО`, `Размер ЗП`, `Отдел_idОтдел`) VALUES (8, 'Абрамов Кирилл Кондратович', 55000, 5);
INSERT INTO `mydb`.`Сотрудник` (`idСотрудник`, `ФИО`, `Размер ЗП`, `Отдел_idОтдел`) VALUES (9, 'Кугушев Савелий Эрнстович', 55000, 5);
INSERT INTO `mydb`.`Сотрудник` (`idСотрудник`, `ФИО`, `Размер ЗП`, `Отдел_idОтдел`) VALUES (10, 'Хуторской Петр Сократович', 50000, 6);
INSERT INTO `mydb`.`Сотрудник` (`idСотрудник`, `ФИО`, `Размер ЗП`, `Отдел_idОтдел`) VALUES (11, 'Купревич Артем Аполлинариевич', 50000, 6);

COMMIT;


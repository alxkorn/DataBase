USE mydb;
-- Добавить покупателя
DROP PROCEDURE IF EXISTS `add_buyer`;
DELIMITER //
CREATE PROCEDURE `add_buyer`(IN `Наименование` VARCHAR(45),
				IN `Адрес` VARCHAR(300),
				IN `Банковский реквизит` VARCHAR(45),
                                IN `Налоговый реквизит` VARCHAR(45))
BEGIN
INSERT INTO `Покупатель` (`Наименование`,`Адрес`,`Банковский реквизит`,`Налоговый реквизит`)
VALUES(`Наименование`,`Адрес`,`Банковский реквизит`,`Налоговый реквизит`);
END//
DELIMITER ;


-- Добавить в запись перевозчиков
DROP PROCEDURE IF EXISTS `add_contract_delivery_record`;
DELIMITER //
CREATE PROCEDURE `add_contract_delivery_record`(IN `Договор_idДоговор` INT,
                                IN `Перевозчик_idПеревозчик` INT)
BEGIN
INSERT INTO `Запись перевозчиков` (`idДоговор`,`idПеревозчик`)
VALUES(`Договор_idДоговор`,`Перевозчик_idПеревозчик`);
END//
DELIMITER ;


-- Добавить товар в список товаров в договоре
DROP PROCEDURE IF EXISTS `add_contract_good_record`;
DELIMITER //
CREATE PROCEDURE `add_contract_good_record`(IN `Договор_idДоговор` INT,
					IN `Товар_idТовар` INT,
                                	IN `Кол-во товара` INT)
BEGIN
INSERT INTO `Запись товаров в договоре` (`idДоговор`,`idТовар`,`Кол-во товара`)
VALUES(`Договор_idДоговор`,`Товар_idТовар`,`Кол-во товара`);
END//
DELIMITER ;


-- Добавить договор
DROP PROCEDURE IF EXISTS `add_contract`;
DELIMITER //
CREATE PROCEDURE `add_contract`(IN `Номер договора` VARCHAR(50),
				IN `Дата начала действия` DATE,
				IN `Дата окончания действия` DATE,
                                IN `idПокупателя` INT)
BEGIN
INSERT INTO `Договор` (`Номер договора`, `Дата начала действия`, `Дата окончания действия`, `idПокупатель`)
VALUES(`Номер договора`, `Дата начала действия`, `Дата окончания действия`, `idПокупателя`);
END//
DELIMITER ;


-- Добавить перевозчика
DROP PROCEDURE IF EXISTS `add_delivery`;
DELIMITER //
CREATE PROCEDURE `add_delivery`(IN `Наименование` VARCHAR(45),
								IN `Адрес` VARCHAR(300),
								IN `Банковский реквизит` VARCHAR(45),
                                IN `Налоговый реквизит` VARCHAR(45))
BEGIN
INSERT INTO `Перевозчик` (`Наименование`,`Адрес`,`Банковский реквизит`,`Налоговый реквизит`)
VALUES(`Наименование`,`Адрес`,`Банковский реквизит`,`Налоговый реквизит`);
END//
DELIMITER ;


-- Добавить отдел
DROP PROCEDURE IF EXISTS `add_depart`;
DELIMITER //
CREATE PROCEDURE `add_depart`(IN `Наименование` VARCHAR(45))
BEGIN
INSERT INTO `Отдел` (`Наименование`)
VALUES(`Наименование`);
END//
DELIMITER ;


-- Добавить в список сырья в товаре
DROP PROCEDURE IF EXISTS `add_good_mat`;
DELIMITER //
CREATE PROCEDURE `add_good_mat`(IN `Товар_idТовар` INT,
                                IN `Сырье_idСырье` INT,
                                IN `Кол-во единицы сырья` INT)
BEGIN
INSERT INTO `Список сырья в товаре` (`idТовар`,`idСырье`,`Кол-во единицы сырья`)
VALUES(`Товар_idТовар`,`Сырье_idСырье`,`Кол-во единицы сырья`);
END//
DELIMITER ;


-- Добавить товар

DROP PROCEDURE IF EXISTS `add_good`;
DELIMITER //
CREATE PROCEDURE `add_good`(IN `Наименование` VARCHAR(150),
				IN `Единица измерения` VARCHAR(10),
                                IN `Стоимость` INT,
				IN `Срок изготовления` INT,
                                IN `Срок поставки` INT,
                                IN `Нормативный документ_idНормативный документ` INT)
BEGIN
INSERT INTO `Товар` (`Наименование`,`Единица измерения`,`Стоимость`,`Срок изготовления`,`Срок поставки`,`idНормативный документ`)
VALUES(`Наименование`,`Единица измерения`,`Стоимость`,`Срок изготовления`,`Срок поставки`,`Нормативный документ_idНормативный документ`);
END//
DELIMITER ;


-- Добавить сырье
DROP PROCEDURE IF EXISTS `add_mat`;
DELIMITER //
CREATE PROCEDURE `add_mat`(IN `Наименование` VARCHAR(45),
				IN `Стоимость` INT,
                                IN `Единица измерения` VARCHAR(10))
BEGIN
INSERT INTO `Сырье` (`Наименование`,`Стоимость`,`Единица измерения`)
VALUES(`Наименование`,`Стоимость`,`Единица измерения`);
END//
DELIMITER ;


-- Добавить нормативный документ
DROP PROCEDURE IF EXISTS `add_regul_doc`;
DELIMITER //
CREATE PROCEDURE `add_regul_doc`(IN `Тип документа` VARCHAR(15),
				IN `Наименование` VARCHAR(45))
BEGIN
INSERT INTO `Нормативный документ` (`Тип документа`,`Наименование`)
VALUES(`Тип документа`,`Наименование`);
END//
DELIMITER ;


-- Добавить в запись сырья в нормативном докумнете
DROP PROCEDURE IF EXISTS `add_regul_mat`;
DELIMITER //
CREATE PROCEDURE `add_regul_mat`(IN `Нормативный документ_idНормативный документ` INT,
                                IN `Сырье_idСырье` INT)
BEGIN
INSERT INTO `Запись сырья в документе` (`idНормативный документ`,`idСырье`)
VALUES(`Нормативный документ_idНормативный документ`,`Сырье_idСырье`);
END//
DELIMITER ;


-- Добавить работника

DROP PROCEDURE IF EXISTS `add_worker`;
DELIMITER //
CREATE PROCEDURE `add_worker`(IN `ФИО` VARCHAR(60),
				IN `Размер ЗП` INT,
                                IN `Отдел_idОтдел` INT)
BEGIN
INSERT INTO `Сотрудник` (`ФИО`,`Размер ЗП`,`idОтдел`)
VALUES(`ФИО`,`Размер ЗП`,`Отдел_idОтдел`);
END//
DELIMITER ;


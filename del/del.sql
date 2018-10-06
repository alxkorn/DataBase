use mydb;

DROP PROCEDURE IF EXISTS `del_buyer`;
DELIMITER //
CREATE PROCEDURE `del_buyer`(IN `Наименование покупателя` VARCHAR(45))
BEGIN

delete from `Покупатель` where `Наименование`=`Наименование покупателя`;

END//
DELIMITER ;


DROP PROCEDURE IF EXISTS `del_contract`;
DELIMITER //
CREATE PROCEDURE `del_contract`(IN `Номер договора удления` VARCHAR(50))
BEGIN

delete from `Договор` where `Номер договора`=`Номер договора удления`;

END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `del_deliver`;
DELIMITER //
CREATE PROCEDURE `del_deliver`(IN `Наименование перевозчика` VARCHAR(45))
BEGIN

delete from `Перевозчик` where `Наименование`=`Наименование перевозчика`;

END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `del_good`;
DELIMITER //
CREATE PROCEDURE `del_good`(IN `Наименование товара` VARCHAR(150))
BEGIN

delete from `Товар` where `Наименование`=`Наименование товара`;

END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `del_regul`;
DELIMITER //
CREATE PROCEDURE `del_regul`(IN `Наименование документа` VARCHAR(45))
BEGIN

delete from `Нормативный документ` where `Наименование`=`Наименование документа`;

END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `del_mat`;
DELIMITER //
CREATE PROCEDURE `del_mat`(IN `Наименование сырья` VARCHAR(45))
BEGIN

delete from `Сырье` where `Наименование`=`Наименование сырья`;

END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `del_depart`;
DELIMITER //
CREATE PROCEDURE `del_depart`(IN `Наименование отдела` VARCHAR(45))
BEGIN

delete from `Отдел` where `Наименование`=`Наименование отдела`;

END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `del_worker`;
DELIMITER //
CREATE PROCEDURE `del_worker`(IN `idСотрудник удалить` INT)
BEGIN

delete from `Сотрудник` where `idСотрудник`=`idСотрудник удалить`;

END//
DELIMITER ;






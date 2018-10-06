use mydb;

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


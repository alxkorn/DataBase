use mydb;
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


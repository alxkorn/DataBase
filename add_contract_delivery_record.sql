use mydb;

DROP PROCEDURE IF EXISTS `add_contract_delivery_record`;
DELIMITER //
CREATE PROCEDURE `add_contract_delivery_record`(IN `Договор_idДоговор` INT,
                                IN `Перевозчик_idПеревозчик` INT)
BEGIN
INSERT INTO `Запись перевозчиков` (`idДоговор`,`idПеревозчик`)
VALUES(`Договор_idДоговор`,`Перевозчик_idПеревозчик`);
END//
DELIMITER ;


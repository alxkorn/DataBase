use mydb;

DROP PROCEDURE IF EXISTS `add_regul_doc`;
DELIMITER //
CREATE PROCEDURE `add_regul_doc`(IN `Тип документа` VARCHAR(15),
								IN `Наименование` VARCHAR(45))
BEGIN
INSERT INTO `Нормативный документ` (`Тип документа`,`Наименование`)
VALUES(`Тип документа`,`Наименование`);
END//
DELIMITER ;


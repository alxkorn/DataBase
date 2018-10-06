use mydb;
-- Добавить отдел
DROP PROCEDURE IF EXISTS `add_depart`;
DELIMITER //
CREATE PROCEDURE `add_depart`(IN `Наименование` VARCHAR(45))
BEGIN
INSERT INTO `Отдел` (`Наименование`)
VALUES(`Наименование`);
END//
DELIMITER ;


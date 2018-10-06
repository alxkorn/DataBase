use mydb;

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


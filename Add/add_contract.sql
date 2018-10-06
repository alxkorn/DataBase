use mydb;
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


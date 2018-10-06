use mydb;
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


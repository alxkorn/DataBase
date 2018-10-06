use mydb;
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


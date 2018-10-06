use mydb;
-- Добавить в запись сырья в нормативном докумнете
DROP PROCEDURE IF EXISTS `add_regul_mat`;
DELIMITER //
CREATE PROCEDURE `add_regul_mat`(IN `Нормативный документ_idНормативный документ` INT,
                                IN `Сырье_idСырье` INT)
BEGIN
INSERT INTO `Запись сырья в документе` (`idНормативный документ`,`idСырье`)
VALUES(`Нормативный документ_idНормативный документ`,`Сырье_idСырье`);
END//
DELIMITER ;


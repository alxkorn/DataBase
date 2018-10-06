use mydb;

DROP PROCEDURE IF EXISTS `tovary_y_regul`;
DELIMITER //
CREATE PROCEDURE `tovary_y_regul`(IN `Наименование` VARCHAR(45))
BEGIN
SELECT `Наименование1`
FROM
(SELECT * from `Нормативный документ` WHERE `Нормативный документ`.`Наименование`=`Наименование`) tmp1
NATURAL JOIN
(SELECT `idНормативный документ`, `Товар`.`Наименование` AS `Наименование1` FROM `Товар`) tmp2;
END//
DELIMITER ;
-- CALL `tovary_y_regul`("ТУ 3591-030-17444965-2012");

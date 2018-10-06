use mydb;

DROP PROCEDURE IF EXISTS `summa_dogovora`;
DELIMITER //
CREATE PROCEDURE `summa_dogovora`(IN `Номер договора вход` VARCHAR(45))
BEGIN
SELECT SUM(`Стоимость` * `Кол-во товара`) FROM
`Договор` NATURAL JOIN `Запись товаров в договоре` NATURAL JOIN `Товар`
WHERE `Номер договора`=`Номер договора вход`;
END//
DELIMITER ;
-- CALL summa_dogovora("61П-17/СМ/54")
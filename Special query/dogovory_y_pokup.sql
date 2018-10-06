use mydb;

DROP PROCEDURE IF EXISTS `dogovory_y_pokup`;
DELIMITER //
CREATE PROCEDURE `dogovory_y_pokup`(IN `Наименование` VARCHAR(45))
BEGIN
select `Номер договора`
FROM
(SELECT * from `Покупатель` WHERE `Покупатель`.`Наименование`=`Наименование`) tmp1 
NATURAL JOIN 
`Договор`;
END//
DELIMITER ;
-- CALL `dogovory_y_pokup`("ЗАО НПК \"Эталон\" ");


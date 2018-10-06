use mydb;

DROP PROCEDURE IF EXISTS `tovary_y_pokup`;
DELIMITER //
CREATE PROCEDURE `tovary_y_pokup`(IN `Наименование` VARCHAR(45))
BEGIN
select `pokup_by_goods`.`Наименование_Товара`
FROM
`pokup_by_goods`  WHERE `pokup_by_goods`.`Наименование_Покупателя`=`Наименование`;
END//
DELIMITER ;
-- CALL `tovary_y_pokup`("ЗАО НПК \"Эталон\" ");


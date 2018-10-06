use mydb;

DROP PROCEDURE IF EXISTS `tovary_y_otdela`;
DELIMITER //
CREATE PROCEDURE `tovary_y_otdela`(IN `Наименование` VARCHAR(45))
BEGIN
select `depart_by_goods`.`Наименование`
FROM
`depart_by_goods` WHERE `depart_by_goods`.`Наименование1`=`Наименование`;
END//
DELIMITER ;
-- CALL `tovary_y_otdela`("Отделение Плавки");


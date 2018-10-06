use mydb;

DROP PROCEDURE IF EXISTS `dogovory_y_perev`;
DELIMITER //
CREATE PROCEDURE `dogovory_y_perev`(IN `Наименование` VARCHAR(45))
BEGIN
select `Наименование1`
FROM
`deliver_by_contracts` WHERE `deliver_by_contracts`.`Наименование1`=`Наименование`;
END//
DELIMITER ;
-- CALL `dogovory_y_perev`("ООО \"Бринкс\"");


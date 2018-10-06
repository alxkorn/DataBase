use mydb;

DROP PROCEDURE IF EXISTS `tovary_y_dogovora`;
DELIMITER //
CREATE PROCEDURE `tovary_y_dogovora`(IN `Номер договора` VARCHAR(45))
BEGIN
select `Наименование1`
FROM
`contracts_by_goods` WHERE `contracts_by_goods`.`Номер договора`=`Номер договора`;
END//
DELIMITER ;
-- CALL `tovary_y_dogovora`("61П-17/СМ/54");


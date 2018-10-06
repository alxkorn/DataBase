use mydb;

DROP PROCEDURE IF EXISTS `mat_y_regul`;
DELIMITER //
CREATE PROCEDURE `mat_y_regul`(IN `Наименование` VARCHAR(45))
BEGIN
select `Наименование1`
FROM
`regdocs_by_mat` WHERE `regdocs_by_mat`.`Наименование`=`Наименование`;
END//
DELIMITER ;
-- CALL `mat_y_regul`("ТУ 3591-030-17444965-2012");


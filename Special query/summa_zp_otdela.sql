use mydb;

DROP PROCEDURE IF EXISTS `summa_zp_otdela`;
DELIMITER //
CREATE PROCEDURE `summa_zp_otdela`(IN `Название отдела` VARCHAR(45))
BEGIN

SELECT SUM(`Размер ЗП`) FROM 
`Отдел` NATURAL JOIN `Сотрудник`
WHERE `Наименование`=`Название отдела`;
END//
DELIMITER ;
-- CALL summa_zp_otdela("Отделение Плавки")
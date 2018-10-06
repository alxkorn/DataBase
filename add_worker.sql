use mydb;

DROP PROCEDURE IF EXISTS `add_worker`;
DELIMITER //
CREATE PROCEDURE `add_worker`(IN `ФИО` VARCHAR(60),
								IN `Размер ЗП` INT,
                                IN `Отдел_idОтдел` INT)
BEGIN
INSERT INTO `Сотрудник` (`ФИО`,`Размер ЗП`,`Отдел_idОтдел`)
VALUES(`ФИО`,`Размер ЗП`,`Отдел_idОтдел`);
END//
DELIMITER ;


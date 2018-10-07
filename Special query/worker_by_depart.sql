USE mydb;

DROP PROCEDURE IF EXISTS `worker_by_depart`;
delimiter //

CREATE PROCEDURE `worker_by_depart`(IN `Наименование отдела` VARCHAR(45))
BEGIN

SET @depart_id = NULL;
select `Отдел`.`idОтдел` into @depart_id from `Отдел` where `Отдел`.`Наименование`= `Наименование отдела`;

select * from `Сотрудник` where `Сотрудник`.`idОтдел`=@depart_id;

END//
delimiter ;

-- CALL `worker_by_depart`("Отделение Плавки");
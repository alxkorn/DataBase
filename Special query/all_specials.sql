use mydb;

drop procedure if exists `buyerid_by_name`;

delimiter //

create procedure `buyerid_by_name` (in `Наименование покупателя` varchar(45))
begin

select `Покупатель`.`idПокупатель` from `Покупатель` where `Покупатель`.`Наименование`=`Наименование покупателя`;

end//
delimiter ;

DROP PROCEDURE IF EXISTS `contracts_between`;
DELIMITER //
CREATE PROCEDURE `contracts_between` (IN `StartDate` DATE,
									  IN `EndDate` DATE)
BEGIN
	SELECT contr.`Номер договора`, contr.`Дата начала действия`, contr.`Дата окончания действия`
	FROM `Договор` contr
	WHERE contr.`Дата начала действия` >= `StartDate` AND contr.`Дата окончания действия` <= `EndDate`;
END//
DELIMITER ;



drop procedure if exists `deliverid_by_name`;

delimiter //

create procedure `deliverid_by_name` (in `Наименование перевозчика` varchar(45))
begin

select `Перевозчик`.`idПеревозчик` from `Перевозчик` where `Перевозчик`.`Наименование`=`Наименование перевозчика`;

end//
delimiter ;

-- call `deliverid_by_name`("ФГУП ГЦСС");

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



DROP PROCEDURE IF EXISTS `mat_y_goods`;
DELIMITER //
CREATE PROCEDURE `mat_y_goods`(IN `Наименование` VARCHAR(150))
BEGIN
select `Наименование1`
FROM
`goods_by_mat` WHERE `goods_by_mat`.`Наименование`=`Наименование`;
END//
DELIMITER ;
-- CALL `mat_y_goods`("Провод ПЭТПл2 0,05  ТУ 3591-030-17444965-2012");



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



drop procedure if exists `productid_by_name`;

delimiter //

create procedure `productid_by_name` (in `Наименование товара` varchar(150))
begin

select `Товар`.`idТовар` from `Товар` where `Товар`.`Наименование`=`Наименование товара`;

end//
delimiter ;

-- call `productid_by_name`("Провод ПЭТПл2 0,05  ТУ 3591-030-17444965-2012");

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



DROP PROCEDURE IF EXISTS `tovary_y_regul`;
DELIMITER //
CREATE PROCEDURE `tovary_y_regul`(IN `Наименование` VARCHAR(45))
BEGIN
SELECT `Наименование1`
FROM
(SELECT * from `Нормативный документ` WHERE `Нормативный документ`.`Наименование`=`Наименование`) tmp1
NATURAL JOIN
(SELECT `idНормативный документ`, `Товар`.`Наименование` AS `Наименование1` FROM `Товар`) tmp2;
END//
DELIMITER ;
-- CALL `tovary_y_regul`("ТУ 3591-030-17444965-2012");


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

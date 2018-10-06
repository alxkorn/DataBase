USE mydb;

DROP VIEW IF EXISTS `deliver_by_contracts`;

CREATE VIEW `deliver_by_contracts` AS
	SELECT `Номер договора`, `Наименование1`
	FROM `Договор` NATURAL JOIN `Запись перевозчиков`
	NATURAL JOIN
	(SELECT `idПеревозчик`, `Наименование` AS `Наименование1`
	FROM `Перевозчик`) tmp2;
select * from `deliver_by_contracts`;



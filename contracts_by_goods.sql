USE mydb;

DROP VIEW IF EXISTS `contracts_by_goods`;

CREATE VIEW `contracts_by_goods` AS
	SELECT `Номер договора`, `Наименование1`
	FROM `Договор` NATURAL JOIN `Запись товаров в договоре`
	NATURAL JOIN
	(SELECT `idТовар`, `Наименование` AS `Наименование1`
	FROM `Товар`) tmp2;
select * from `contracts_by_goods`;



USE mydb;

DROP VIEW IF EXISTS `depart_by_goods`;

CREATE VIEW `depart_by_goods` AS
	SELECT `Наименование`, `Наименование1`
	FROM `Товар` NATURAL JOIN `Список товаров произв. отделом`
	NATURAL JOIN
	(SELECT `idОтдел`, `Наименование` AS `Наименование1`
	FROM `Отдел`) tmp2;




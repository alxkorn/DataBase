USE mydb;

DROP VIEW IF EXISTS `goods_by_mat`;

CREATE VIEW `goods_by_mat` AS
	SELECT `Наименование`, `Наименование1`
	FROM `Товар` NATURAL JOIN `Список сырья в товаре`
	NATURAL JOIN
	(SELECT `idСырье`, `Наименование` AS `Наименование1`
	FROM `Сырье`) tmp2;
select * from `goods_by_mat`;




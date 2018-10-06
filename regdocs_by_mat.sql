USE mydb;

DROP VIEW IF EXISTS `regdocs_by_mat`;

CREATE VIEW `regdocs_by_mat` AS
	SELECT `Наименование`, `Наименование1`
	FROM `Нормативный документ` NATURAL JOIN `Список сырья в документе`
	NATURAL JOIN
	(SELECT `idСырье`, `Наименование` AS `Наименование1`
	FROM `Сырье`) tmp2;
select * from `regdocs_by_mat`;



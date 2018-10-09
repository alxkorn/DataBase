USE mydb;

DROP VIEW IF EXISTS `contracts_by_goods`;

CREATE VIEW `contracts_by_goods` AS
	SELECT `Номер договора`, `Наименование1`
	FROM `Договор` NATURAL JOIN `Запись товаров в договоре`
	NATURAL JOIN
	(SELECT `idТовар`, `Наименование` AS `Наименование1`
	FROM `Товар`) tmp2;



USE mydb;

DROP VIEW IF EXISTS `deliver_by_contracts`;

CREATE VIEW `deliver_by_contracts` AS
	SELECT `Номер договора`, `Наименование1`
	FROM `Договор` NATURAL JOIN `Запись перевозчиков`
	NATURAL JOIN
	(SELECT `idПеревозчик`, `Наименование` AS `Наименование1`
	FROM `Перевозчик`) tmp2;



USE mydb;

DROP VIEW IF EXISTS `depart_by_goods`;

CREATE VIEW `depart_by_goods` AS
	SELECT `Наименование`, `Наименование1`
	FROM `Товар` NATURAL JOIN `Список товаров произв. отделом`
	NATURAL JOIN
	(SELECT `idОтдел`, `Наименование` AS `Наименование1`
	FROM `Отдел`) tmp2;



USE mydb;

DROP VIEW IF EXISTS `goods_by_mat`;

CREATE VIEW `goods_by_mat` AS
	SELECT `Наименование`, `Наименование1`
	FROM `Товар` NATURAL JOIN `Список сырья в товаре`
	NATURAL JOIN
	(SELECT `idСырье`, `Наименование` AS `Наименование1`
	FROM `Сырье`) tmp2;



USE mydb;

DROP VIEW IF EXISTS `regdocs_by_mat`;

CREATE VIEW `regdocs_by_mat` AS
	SELECT `Наименование`, `Наименование1`
	FROM `Нормативный документ` NATURAL JOIN `Список сырья в документе`
	NATURAL JOIN
	(SELECT `idСырье`, `Наименование` AS `Наименование1`
	FROM `Сырье`) tmp2;



USE mydb;

DROP VIEW IF EXISTS `pokup_by_goods`;

CREATE VIEW `pokup_by_goods` AS
	SELECT `Наименование_Покупателя`, `Наименование_Товара` FROM
	(SELECT * FROM
	(SELECT `Покупатель`.`idПокупатель`, `Покупатель`.`Наименование` AS `Наименование_Покупателя` FROM `Покупатель`) tmp1
    NATURAL JOIN 
    (SELECT `Договор`.`idДоговор`, `Договор`.`idПокупатель` FROM `Договор`) tmp2 ) tmp3
    NATURAL JOIN
    (SELECT * FROM
    (SELECT `Товар`.`idТовар`, `Товар`.`Наименование` AS `Наименование_Товара` FROM `Товар`) tmp4
    NATURAL JOIN 
    `Запись товаров в договоре`) tmp5;
    

 -- select * from `pokup_by_goods`;



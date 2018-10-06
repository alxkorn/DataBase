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



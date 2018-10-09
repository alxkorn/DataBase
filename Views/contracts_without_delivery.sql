use mydb;

DROP VIEW IF EXISTS `contacts_without_delivery`;

CREATE VIEW `contacts_without_delivery` AS
SELECT DISTINCT `Договор`.`idДоговор`
FROM `Договор` LEFT JOIN `Запись перевозчиков` ON `Договор`.`idДоговор` = `Запись перевозчиков`.`idДоговор`
WHERE `Запись перевозчиков`.`idДоговор` IS NULL;

select * from `contacts_without_delivery`;
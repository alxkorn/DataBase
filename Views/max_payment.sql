use mydb;


DROP VIEW IF EXISTS `max_payment`;

CREATE VIEW `max_payment` AS
select `ФИО`, `Размер ЗП`, `Наименование отдела` from
`Сотрудник`  natural join 
(select `idОтдел`, `Наименование` as `Наименование отдела` from `Отдел`) tmp1 
where `Размер ЗП`=(select max(`Сотрудник`.`Размер ЗП`) from `Сотрудник`);

select * from max_payment;
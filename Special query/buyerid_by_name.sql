use mydb;

drop procedure if exists `buyerid_by_name`;

delimiter //

create procedure `buyerid_by_name` (in `Наименование покупателя` varchar(45))
begin

select `Покупатель`.`idПокупатель` from `Покупатель` where `Покупатель`.`Наименование`=`Наименование покупателя`;

end//
delimiter ;

drop procedure if exists `goodid_by_name`;
delimiter //
create procedure `goodid_by_name` (in `Наименование товара` varchar(150))
begin
    select `Товар`.`idТовар` from `Товар` where `Товар`.`Наименование`=`Наименование Товара`;
end//
delimiter ;

drop procedure if exists `contractid_by_number`;
delimiter //
create procedure `contractid_by_number` (in `ContractNumber` varchar(150))
begin
    select `Договор`.`idДоговор` from `Договор` where `Договор`.`Номер договора`=`ContractNumber`;
end//
delimiter ;
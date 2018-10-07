use mydb;

drop procedure if exists `buyerid_by_name`;

delimiter //

create procedure `buyerid_by_name` (in `Наименование покупателя` varchar(45))
begin

select `Покупатель`.`idПокупатель` from `Покупатель` where `Покупатель`.`Наименование`=`Наименование покупателя`;

end//
delimiter ;
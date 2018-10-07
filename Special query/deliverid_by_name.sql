use mydb;

drop procedure if exists `deliverid_by_name`;

delimiter //

create procedure `deliverid_by_name` (in `Наименование перевозчика` varchar(45))
begin

select `Перевозчик`.`idПеревозчик` from `Перевозчик` where `Перевозчик`.`Наименование`=`Наименование перевозчика`;

end//
delimiter ;

-- call `deliverid_by_name`("ФГУП ГЦСС");
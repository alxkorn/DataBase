use mydb;

drop procedure if exists `productid_by_name`;

delimiter //

create procedure `productid_by_name` (in `Наименование товара` varchar(150))
begin

select `Товар`.`idТовар` from `Товар` where `Товар`.`Наименование`=`Наименование товара`;

end//
delimiter ;

-- call `productid_by_name`("Провод ПЭТПл2 0,05  ТУ 3591-030-17444965-2012");
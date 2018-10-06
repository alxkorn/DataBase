use mydb;

DROP PROCEDURE IF EXISTS `mat_y_goods`;
DELIMITER //
CREATE PROCEDURE `mat_y_goods`(IN `Наименование` VARCHAR(150))
BEGIN
select `Наименование1`
FROM
`goods_by_mat` WHERE `goods_by_mat`.`Наименование`=`Наименование`;
END//
DELIMITER ;
-- CALL `mat_y_goods`("Провод ПЭТПл2 0,05  ТУ 3591-030-17444965-2012");


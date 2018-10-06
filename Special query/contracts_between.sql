USE mydb;

DROP PROCEDURE IF EXISTS `contracts_between`;
DELIMITER //
CREATE PROCEDURE `contracts_between` (IN `StartDate` DATE,
									  IN `EndDate` DATE)
BEGIN
	SELECT contr.`Номер договора`, contr.`Дата начала действия`, contr.`Дата окончания действия`
	FROM `Договор` contr
	WHERE contr.`Дата начала действия` >= `StartDate` AND contr.`Дата окончания действия` <= `EndDate`;
END//
DELIMITER ;


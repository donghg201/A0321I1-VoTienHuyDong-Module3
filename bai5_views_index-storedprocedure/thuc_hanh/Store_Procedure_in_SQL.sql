use classicmodels;

-- Tạo Mysql Stored Procedure đầu tiên

DELIMITER //
CREATE PROCEDURE findAllCustomers()
BEGIN
  SELECT * FROM customers;
END 
// DELIMITER ;

-- Cách gọi procedure

call findAllCustomers();

DELIMITER //
DROP PROCEDURE IF EXISTS `findAllCustomers`//
CREATE PROCEDURE findAllCustomers()
BEGIN
   SELECT *  FROM customers where customerNumber = 175;
END;//
DELIMITER;


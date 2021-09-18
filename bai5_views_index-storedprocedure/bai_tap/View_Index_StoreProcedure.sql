create database View_Index_StoreProcedure;
use View_Index_StoreProcedure;

create table Products(
id int not null auto_increment primary key, 
productCode varchar(50) not null,
productName varchar(50) not null,
productPrice int not null,
productAmount int not null,
productDescription text not null default("No Description"), 
productStatus varchar(15) not null
);
drop table products;

insert into Products(Id,productCode,productName,productPrice,productAmount,productDescription,productStatus) 
value (1, "product01", "Iphone 6", 1500000, 10,"", "On");
insert into Products(Id,productCode,productName,productPrice,productAmount,productDescription,productStatus) 
value (2, "product02", "Iphone 7", 2000000, 10,"", "On");
insert into Products(Id,productCode,productName,productPrice,productAmount,productDescription,productStatus) 
value (3, "product03", "Iphone 8", 3500000, 10,"", "On");
insert into Products(Id,productCode,productName,productPrice,productAmount,productDescription,productStatus) 
value (4, "product04", "Iphone 10", 6000000, 10,"", "On");
insert into Products(Id,productCode,productName,productPrice,productAmount,productDescription,productStatus) 
value (5, "product05", "Iphone 11", 10000000, 10,"", "On");
insert into Products(Id,productCode,productName,productPrice,productAmount,productDescription,productStatus) 
value (6, "product06", "Iphone 12", 15000000, 10,"", "On");
insert into Products(Id,productCode,productName,productPrice,productAmount,productDescription,productStatus) 
value (7, "product07", "Iphone 13", 22000000, 10,"", "On");

select * from Products;
select * from Products;

create unique index productCode on Products(productCode);

create index productCode1 on Products(productName, productPrice);

create view product_view as
select products.productCode, products.productName, products.productPrice, products.productStatus from products;

select * from product_view;

update product_view set productname = "Iphone 10" where productCode = "product05";

drop view product_view;

DELIMITER //
create procedure findallproducts() 
begin
select * from products;
end // 
DELIMITER ;

call findallproducts();

DELIMITER //
create procedure addnewproduct(in id int , in productCode varchar(50), in productName varchar(50),in productPrice int, in productAmount int ,in productDescription text, in productStatus varchar(15)) 
begin
insert into products value (Id, productCode, productName, productPrice, productAmount, productDescription, productStatus);
end; // 
DELIMITER ;

drop procedure addnewproduct;

call addnewproduct(8,"product08", "Iphone 13 pro max", 49900000, 5,"New", "On");

DELIMITER //
create procedure updateproduct(in id int , 
in productCode varchar(50), 
in productName varchar(50),
in productPrice int, 
in productAmount int ,
in productDescription text, 
in productStatus varchar(15)) 
begin
update products 
set
`productCode` = products.productCode,
`productName` = products.productName,
`productPrice` = products.productPrice,
`productAmount` = products.productAmount,
`productDescription` = products.productDescription,
`productStatus` = products.productStatus
where `id` = products.id;
end; // 
DELIMITER ;

drop procedure updateproduct;

call updateproduct(6,"product06", "Iphone 11 pro max", 49900000, 5,"New", "On");

DELIMITER //
create procedure deleteproduct(in id int) 
begin
delete from products
where `id` = products.id;
end; // 
DELIMITER ;

drop procedure deleteproduct;

call deleteproduct(8);
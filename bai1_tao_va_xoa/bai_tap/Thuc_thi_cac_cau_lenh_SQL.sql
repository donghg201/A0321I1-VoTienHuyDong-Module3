create database classsicmodels;
create table classsicmodels.Customers(
customername varchar(255),
phone long,
city varchar(255),
country varchar(255)
);
insert into classsicmodels.Customers values ("A",100000000,"Sai Gon","Viet Nam");
insert into classsicmodels.Customers values ("B",111111111,"Ha Noi","Viet Nam");
insert into classsicmodels.Customers values ("D",222222222,"Da Nang","Viet Nam");
insert into classsicmodels.Customers values ("E",333333333,"LA","USA");
insert into classsicmodels.Customers values ("F",444444444,"California","USA");
insert into classsicmodels.Customers values ("G",555555555,"San Diego","USA");
insert into classsicmodels.Customers values ("H",666666666,"Paris","Phap");
select * from classsicmodels.Customers;
SELECT customerName, phone, city, country FROM classsicmodels.Customers where customername like "%A%"; 
SELECT * FROM classsicmodels.Customers where country in ("Viet Nam","USA"); 

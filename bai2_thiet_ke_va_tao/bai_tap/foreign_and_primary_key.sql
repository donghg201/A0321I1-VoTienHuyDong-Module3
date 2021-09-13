create database xac_dinh_khoa;
use xac_dinh_khoa;
create table customers(
customer_number varchar(50) primary key,
full_name varchar(255),
address text,
email text,
phone varchar(11),
key accounts(customer_number)
);

create table accounts(
account_number varchar(50) primary key,
account_type varchar(50),
`date` date,
balance varchar(20),
customer_number varchar(50) not null,
unique key customer_number(customer_number),
constraint customer_number_fk foreign key (account_number) references customers(customer_number)
);

create table transactions(
tran_number varchar(15) primary key,
account_number varchar(50) ,
`date1` date,
amounts varchar(15),
descriptions text,
constraint account_number_fk foreign key (account_number) references accounts(account_number)
);

drop table customers;
drop table accounts;
drop table transactions;
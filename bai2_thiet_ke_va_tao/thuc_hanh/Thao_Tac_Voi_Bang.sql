create database design_and_create;
use design_and_create;
create table contacts(
contact_id INT(11) not null auto_increment,
last_name varchar(30) not null,
first_name varchar(25),
birthday date,
constraint contacts_pk primary key (contact_id)
);
insert into contacts values(5,"vo","dong",20011022);
select * from contacts;

use design_and_create;
create table suppliers( 
supplier_id INT(11) not null auto_increment,
supplier_name varchar(50) not null,
account_rep varchar(30) not null default "TBD",
constraint suppliers_pk primary key (supplier_id)
);
select * from suppliers;

drop table contacts, suppliers;

alter table contacts add last_name1 varchar(40) not null after contact_id,
ADD first_name1 varchar(35) NULL AFTER last_name1;

alter table contacts drop column last_name1;

alter table contacts modify last_name1 varchar(50);

alter table contacts change column last_name1 last_name2 varchar(50);

alter table contacts rename to people;

select * from people;
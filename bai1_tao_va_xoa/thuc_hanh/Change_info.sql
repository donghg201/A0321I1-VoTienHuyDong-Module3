create database change_info;
use change_info;
create table hang_hoa(
ma_sp varchar(255),
ten_sp varchar(255),
so_luong int,
tong_tien int,
primary key (ma_sp)
);
insert into hang_hoa values ("SP001","Iphone 5",10,10000000);
insert into hang_hoa values ("SP002","Iphone 6",10,25000000);
insert into hang_hoa values ("SP003","Iphone 7",10,40000000);
insert into hang_hoa values ("SP004","Iphone 8",10,60000000);
insert into hang_hoa values ("SP005","Iphone X",10,70000000);
insert into hang_hoa values ("SP006","Iphone 11",10,110000000);
insert into hang_hoa values ("SP007","Iphone 12",10,200000000);
update hang_hoa set so_luong = 30 where ma_sp = 1;
alter table hang_hoa add mo_ta text;
update hang_hoa set mo_ta = "SecondHand" where ma_sp = "5";
select * from hang_hoa;
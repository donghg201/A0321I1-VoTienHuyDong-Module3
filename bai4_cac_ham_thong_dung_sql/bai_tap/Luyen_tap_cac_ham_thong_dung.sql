create database common_functions;
use common_functions;
create table thong_tin_luong(
id int not null,
ten varchar(50) not null,
tuoi int not null,
khoa_hoc varchar(15) not null,
so_tien int not null
);
drop table thong_tin_luong;

insert into thong_tin_luong values (1,"Hoang", 21, "CNTT", 400000);
insert into thong_tin_luong values (2,"Viet", 19, "DTVT", 320000);
insert into thong_tin_luong values (3,"Thanh", 18, "KTDN", 400000);
insert into thong_tin_luong values (4,"Nhan", 19, "CK", 450000);
insert into thong_tin_luong values (5,"Huong", 20, "TCNH", 500000);
insert into thong_tin_luong values (5,"Huong", 20, "TCNH", 200000);

select * from thong_tin_luong
where thong_tin_luong.ten = "Huong";

select thong_tin_luong.id,thong_tin_luong.ten,thong_tin_luong.tuoi,thong_tin_luong.khoa_hoc,sum(thong_tin_luong.so_tien) as Tong 
from thong_tin_luong
where thong_tin_luong.ten = "Huong";

select distinct thong_tin_luong.ten
from thong_tin_luong;


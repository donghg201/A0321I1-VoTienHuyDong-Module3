create database in_and_out;
use in_and_out;
create table thong_tin_nhan_vien(
	ma_nhan_vien varchar(255),
    ten_nhan_vien varchar(255),
    chuc_vu varchar(255),
    luong int,
    primary key (ma_nhan_vien)
);
insert into thong_tin_nhan_vien values ("1","Vo","Giam doc",20000000);
insert into thong_tin_nhan_vien values ("2","Tien","Pho giam doc",15000000);
insert into thong_tin_nhan_vien values ("3","Huy","Truong phong",10000000);
insert into thong_tin_nhan_vien values ("4","Dong","Nhan vien",5000000);
select * from thong_tin_nhan_vien;
-- drop table thong_tin_nhan_vien;
-- drop database in_and_out;
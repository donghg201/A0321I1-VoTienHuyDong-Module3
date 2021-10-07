create database casestudy;
use casestudy;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 1  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

create table vi_tri(
id_vi_tri int not null primary key,
ten_vi_tri varchar(45) not null
);
drop table vi_tri;

create table trinh_do(
id_trinh_do int not null primary key,
trinh_do varchar(45) not null
);
drop table trinh_do;

create table bo_phan(
id_bo_phan int not null primary key,
ten_bo_phan varchar(45)  not null
);
drop table bo_phan;

create table nhan_vien(
id_nhan_vien int not null primary key,
ho_ten varchar(45) not null,
id_vi_tri int not null,
id_trinh_do int not null,
id_bo_phan int not null,
ngay_sinh date not null,
so_cmnd varchar(45) not null,
luong varchar(45) not null,
sdt varchar(45) not null,
email varchar(45) not null,
diachi varchar(45) not null,
key id_vi_tri(id_vi_tri),
key id_trinh_do(id_trinh_do),
key id_bo_phan(id_bo_phan),
constraint id_vi_tri_fk foreign key (id_vi_tri) references vi_tri(id_vi_tri),
constraint id_trinh_do_fk foreign key (id_trinh_do) references trinh_do(id_trinh_do),
constraint id_bo_phan_fk foreign key (id_bo_phan) references bo_phan(id_bo_phan)
on update cascade
on delete cascade
);
drop table nhan_vien;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  cụm nhân viên  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 

create table loai_khach(
id_loai_khach int not null primary key,
ten_loai_khach varchar(45) not null
);
drop table loai_khach;

create table khach_hang(
id_khach_hang int not null primary key,
id_loai_khach int not null,
ho_ten varchar(45) not null,
ngay_sinh date not null,
so_cmnd  varchar(45) not null,
sdt varchar(45) not null,
email varchar(45) not null,
dia_chi varchar(45) not null,
constraint id_loai_khach_fk foreign key (id_loai_khach) references loai_khach(id_loai_khach)
on update cascade
on delete cascade
);
drop table khach_hang;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  cụm khách hàng  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 

create table dich_vu_di_kem(
id_dich_vu_di_kem int not null primary key,
ten_dich_vu_di_kem varchar(45) not null,
gia int not null,
don_vi int not null,
trang_thai_kha_dung varchar(45) not null
);
drop table dich_vu_di_kem;

create table hop_dong_chi_tiet(
id_hop_dong_chi_tiet int not null primary key,
id_hop_dong int not null,
id_dich_vu_di_kem int not null,
so_luong int not null,
key id_dich_vu_di_kem(id_dich_vu_di_kem),
key id_hop_dong(id_hop_dong),
constraint id_dich_vu_di_kem_fk foreign key (id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem),
constraint id_hop_dong_fk foreign key (id_hop_dong) references hop_dong(id_hop_dong)
on update cascade
on delete cascade
);
drop table hop_dong_chi_tiet;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  cụm hợp đồng  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 

create table kieu_thue(
id_kieu_thue int not null primary key,
ten_kieu_thue varchar(45) not null,
gia int not null
);
drop table kieu_thue;

create table loai_dich_vu(
id_loai_dich_vu int not null primary key,
ten_loai_dich_vu varchar(45) not null
);
drop table loai_dich_vu;

create table dich_vu(
id_dich_vu int not null primary key,
ten_dich_vu varchar(45) not null,
dien_tich int not null,
so_tang int not null,
so_nguoi_toi_da varchar(45) not null,
chi_phi_thue varchar(45) not null,
id_kieu_thue int not null,
id_loai_dich_vu int not null,
trang_thai varchar(45) not null,
key id_kieu_thue(id_kieu_thue),
key id_loai_dich_vu(id_loai_dich_vu),
constraint id_kieu_thue_fk foreign key (id_kieu_thue) references kieu_thue(id_kieu_thue),
constraint id_loai_dich_vu_fk foreign key (id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu)
on update cascade
on delete cascade
);
drop table dich_vu;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  cụm dịch vụ  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 

create table hop_dong(
id_hop_dong int not null primary key,
id_nhan_vien int not null,
id_khach_hang int not null,
id_dich_vu int not null, 
ngay_lam_hop_dong date not null,
ngay_ket_thuc date not null,
tien_dat_coc int not null, 
tong_tien int not null,
key id_nhan_vien(id_nhan_vien),
key id_khach_hang(id_khach_hang),
key id_dich_vu(id_dich_vu),
constraint id_nhan_vien_hop_dong_fk foreign key (id_nhan_vien) references nhan_vien(id_nhan_vien),
constraint id_khach_hang_hop_dong_fk foreign key (id_khach_hang) references khach_hang(id_khach_hang),
constraint id_dich_vu_hop_dong_fk foreign key (id_dich_vu) references dich_vu(id_dich_vu)
on update cascade
on delete cascade
);
drop table hop_dong;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  cụm chính  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

insert into vi_tri values (1,"giam doc");
insert into vi_tri values (2,"pho giam doc");
insert into vi_tri values (3,"nhan vien");

insert into trinh_do values (1,"tien si");
insert into trinh_do values (2,"thac si");
insert into trinh_do values (3,"dai hoc");

insert into bo_phan values (1,"quan ly cap cao");
insert into bo_phan values (2,"quan ly");
insert into bo_phan values (3,"nhan vien");

insert into nhan_vien values (1,"Tran Van A",1,1,1,20011021,201817054,10000000,0905730724,"aaaa@gmail.com","so 1 duong A");
insert into nhan_vien values (2,"K Van B",2,2,2,20011022,201817054,10000000,0905730724,"bbbb@gmail.com","so 1 duong B");
insert into nhan_vien values (3,"Nguyen Van C",3,3,3,20011023,201817054,10000000,0905730724,"cccc@gmail.com","so 1 duong C");
insert into nhan_vien values (4,"Le Van D",3,2,1,19911023,204817054,10000000,0906730724,"dddd@gmail.com","so 1 duong D");
insert into nhan_vien values (5,"Tran Thi E",3,2,1,19941023,204617054,10000000,0906733724,"eeee@gmail.com","so 1 duong E");

select * from vi_tri;
select * from trinh_do;
select * from bo_phan;
select * from nhan_vien;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  insert cụm nhân viên  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

insert into loai_khach values(1,"Diamond");
insert into loai_khach values(2,"Gold");
insert into loai_khach values(3,"Silver");

insert into khach_hang values(1, 1, "Le Van D", 19980822,201817053,0905123456,"dddd@gmail.com","Da Nang");
insert into khach_hang values(2, 2, "Duong Van E", 19980823,201817043,0905123457,"eeee@gmail.com","Hue");
insert into khach_hang values(3, 3, "Hoang Thi F", 19980812,201817853,0905123756,"ffff@gmail.com","Quang Tri");
insert into khach_hang values(4, 1, "Hoang Thi F", 19980922,201817843,0905423756,"gggg@gmail.com","Quang Tri");
insert into khach_hang values(5, 2, "Tran Thi G", 19930924,200817843,0903423756,"hhhh@gmail.com","Quang Ngai");
insert into khach_hang values(6, 1, "Tran Thi H", 19940924,200847843,0903473756,"iiii@gmail.com","Vinh");
insert into khach_hang values(7, 1, "Tran Thi I", 19950924,200837843,0903623756,"kkkk@gmail.com","Quang Ngai");

select * from loai_khach;
select * from khach_hang;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  insert cụm khách hàng  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

insert into kieu_thue values(1,"Theo nam",200000000);
insert into kieu_thue values(2,"Theo thang",25000000);
insert into kieu_thue values(3,"Theo ngay",1000000);

insert into loai_dich_vu values(1,"A");
insert into loai_dich_vu values(2,"B");
insert into loai_dich_vu values(3,"C");

insert into dich_vu values(1,"A",200,3,12,10000000,1,1,"con");
insert into dich_vu values(2,"B",100,2,8,5000000,2,2,"con");
insert into dich_vu values(3,"C",50,1,4,2000000,3,3,"con");

select * from kieu_thue;
select * from loai_dich_vu;
select * from dich_vu;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  insert cụm dịch vụ  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

insert into dich_vu_di_kem values(1,"A",1000000,1000000,"con");
insert into dich_vu_di_kem values(2,"B",500000,500000,"con");
insert into dich_vu_di_kem values(3,"C",200000,200000,"con");

insert into hop_dong values(1,1,1,1,20211123,20211125,1000000,1000000000);
insert into hop_dong values(2,2,2,2,20211124,20211126,1000000,500000000);
insert into hop_dong values(3,3,3,3,20211125,20211127,1000000,200000000);
insert into hop_dong values(4,1,4,3,20211126,20211128,1000000,200000000);
insert into hop_dong values(5,1,4,2,20211128,20211129,1000000,200000000);
insert into hop_dong values(10,1,2,1,20191129,20191130,1000000,200000000);
insert into hop_dong values(11,2,6,1,20191130,20191203,1000000,200000000);
insert into hop_dong values(12,3,7,2,20191201,20191205,1000000,200000000);

insert into hop_dong_chi_tiet values(1,1,1,1);
insert into hop_dong_chi_tiet values(2,2,2,2);
insert into hop_dong_chi_tiet values(3,3,3,3);
insert into hop_dong_chi_tiet values(4,10,1,5);
insert into hop_dong_chi_tiet values(5,11,2,2);
insert into hop_dong_chi_tiet values(6,12,3,4);

select * from dich_vu_di_kem;
select * from hop_dong;
select * from hop_dong_chi_tiet;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  insert cụm hợp đồng  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

select * from nhan_vien where (left(ho_ten,1) = "K" or left(ho_ten,1) = "T" or left(ho_ten,1) = "H") and (length(ho_ten) <= 15);
select * from nhan_vien where (ho_ten like "k%" or ho_ten like "T%" or ho_ten like "H%") and (length(ho_ten) <= 15);

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 2  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

select * from khach_hang where (year(current_timestamp) - year(ngay_sinh) >= 18 or year(current_timestamp) <= 50) and (dia_chi = "Da Nang" or dia_chi = "Quang Tri");

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 3  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

select hop_dong.id_hop_dong, khach_hang.ho_ten, loai_khach.ten_loai_khach, count(khach_hang.ho_ten) as Tong
from khach_hang
right join hop_dong on khach_hang.id_khach_hang = hop_dong.id_khach_hang
left join loai_khach on khach_hang.id_loai_khach = loai_khach.id_loai_khach
where ten_loai_khach = "Diamond"
group by khach_hang.ho_ten;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 4  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

select khach_hang.id_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, hop_dong.id_hop_dong, dich_vu.ten_dich_vu,
hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, dich_vu.chi_phi_thue + sum(hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia) as TongTien
from khach_hang
left join loai_khach on khach_hang.id_loai_khach = loai_khach.id_loai_khach 
left join hop_dong on khach_hang.id_khach_hang = hop_dong.id_khach_hang
left join dich_vu on dich_vu.id_dich_vu = hop_dong.id_dich_vu
left join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
left join dich_vu_di_kem on dich_vu_di_kem.id_dich_vu_di_kem = hop_dong_chi_tiet.id_dich_vu_di_kem
group by id_khach_hang;
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 5  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

select dich_vu.id_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
left join hop_dong on dich_vu.id_dich_vu = hop_dong.id_dich_vu
left join loai_dich_vu on dich_vu.id_loai_dich_vu = loai_dich_vu.id_loai_dich_vu
where not exists (select ngay_lam_hop_dong from hop_dong
where date_format(hop_dong.ngay_lam_hop_dong,"%m %Y") >= date_format("20190101","%m %Y")
and hop_dong.id_dich_vu = dich_vu.id_dich_vu);

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 6  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

select dich_vu.id_dich_vu, dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.so_nguoi_toi_da,dich_vu.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu
from dich_vu
left join hop_dong on dich_vu.id_dich_vu = hop_dong.id_dich_vu
left join loai_dich_vu on dich_vu.id_loai_dich_vu = loai_dich_vu.id_loai_dich_vu
where 
(not exists(select ngay_lam_hop_dong from hop_dong
where year(hop_dong.ngay_lam_hop_dong) = year(20190101) 
and hop_dong.id_dich_vu = dich_vu.id_dich_vu) 
and
(exists (select ngay_lam_hop_dong from hop_dong
where year(hop_dong.ngay_lam_hop_dong) = year("20180101") 
and hop_dong.id_dich_vu = dich_vu.id_dich_vu))
);

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 7  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

select distinct ho_ten from khach_hang;

select ho_ten from khach_hang
left join loai_khach on khach_hang.id_khach_hang = loai_khach.id_loai_khach
union
select ho_ten from khach_hang
right join loai_khach on khach_hang.id_khach_hang = loai_khach.id_loai_khach;

select ho_ten from khach_hang
group by khach_hang.ho_ten
having count(khach_hang.ho_ten) >= 1;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 8  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- cách 1
select date_format(ngay_lam_hop_dong, "%m") as Thang,count(hop_dong.id_hop_dong) as so_khach_hang_dang_ki, sum(hop_dong.tong_tien) as Tong_doanh_thu_thang
from hop_dong
where year(hop_dong.ngay_lam_hop_dong ) = 2019
group by month(hop_dong.ngay_lam_hop_dong);

-- cách 2	
select temp.month, count(month(hop_dong.ngay_lam_hop_dong)) as so_khach_hang_dang_ki, sum(hop_dong.tong_tien) as Tong_tien from 
(select 1 as month
union select 2 as month
union select 3 as month
union select 4 as month
union select 5 as month
union select 6 as month
union select 7 as month
union select 8 as month
union select 9 as month
union select 10 as month
union select 11 as month
union select 12 as month) as temp
left join hop_dong on month(hop_dong.ngay_lam_hop_dong) = temp.month
left join khach_hang on khach_hang.id_khach_hang = hop_dong.id_khach_hang
where year(hop_dong.ngay_lam_hop_dong) = "2019" or year(hop_dong.ngay_lam_hop_dong) is null or year(hop_dong.ngay_lam_hop_dong) is null
group by temp.month
order by temp.month;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 9  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

select hop_dong.id_hop_dong, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, hop_dong.tien_dat_coc, count(hop_dong_chi_tiet.id_hop_dong_chi_tiet) as So_luong_dich_vu_di_kem
from hop_dong
left join hop_dong_chi_tiet on hop_dong_chi_tiet.id_hop_dong = hop_dong.id_hop_dong
group by hop_dong.id_hop_dong;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 10  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

select kh.ho_ten, dvdk.id_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia, dvdk.don_vi, dvdk.trang_thai_kha_dung
from khach_hang kh 
left join loai_khach lk on kh.id_loai_khach = lk.id_loai_khach
left join hop_dong hd on kh.id_khach_hang = hd.id_khach_hang
left join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
left join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
where lk.ten_loai_khach = "Diamond" and (kh.dia_chi = "Quang Ngai" or kh.dia_chi = "Vinh");

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 11  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

select hd.id_hop_dong,hd.tong_tien, hd.tien_dat_coc, nv.ho_ten as Ho_ten_nhan_vien, kh.ho_ten as Ho_ten_khach_hang, kh.sdt, dv.ten_dich_vu,
count(hdct.id_dich_vu_di_kem) as so_luong_dich_vu_di_kem from hop_dong hd
inner join nhan_vien nv on hd.id_nhan_vien = nv.id_nhan_vien
inner join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
inner join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
inner join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
where not exists(select hd.id_hop_dong where hd.ngay_lam_hop_dong between "20190101" and "20190630")
and exists (select hd.id_hop_dong where hd.ngay_lam_hop_dong between "20191001" and "20191231");

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 12  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 

select hdct.id_hop_dong_chi_tiet, hdct.id_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, hdct.so_luong
from hop_dong_chi_tiet hdct
left join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
order by hdct.so_luong DESC;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 13  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 

select hd.id_hop_dong, dv.ten_dich_vu, dvdk.ten_dich_vu_di_kem, hdct.so_luong
from hop_dong hd
left join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
left join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
left join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
where hdct.so_luong = 1
group by dvdk.ten_dich_vu_di_kem;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 14  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 

select hd.id_nhan_vien, nv.ho_ten, td.trinh_do, bp.ten_bo_phan, nv.sdt, nv.diachi, hd.id_hop_dong
from hop_dong hd
left join nhan_vien nv on hd.id_nhan_vien = nv.id_nhan_vien
left join trinh_do td on nv.id_trinh_do = td.id_trinh_do 
left join bo_phan bp on nv.id_bo_phan = bp.id_bo_phan
group by nv.ho_ten;

select hd.id_hop_dong, nv.ho_ten,td.trinh_do, bp.ten_bo_phan, nv.sdt, nv.diachi, count(hd.id_nhan_vien) as tong_so_hop_dong from hop_dong hd
left join nhan_vien nv on hd.id_nhan_vien = nv.id_nhan_vien
left join trinh_do td on nv.id_trinh_do = td.id_trinh_do 
left join bo_phan bp on nv.id_bo_phan = bp.id_bo_phan
where year(hd.ngay_lam_hop_dong) between "2018" and "2019"
group by hd.id_nhan_vien
having count(hd.id_nhan_vien) <= 3;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 15  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 

delete from nhan_vien where not exists (select nhan_vien.id_nhan_vien 
from hop_dong where year(hop_dong.ngay_lam_hop_dong) between "2017" and "2021" 
and hop_dong.id_nhan_vien = nhan_vien.id_nhan_vien);

SET SQL_SAFE_UPDATES = 0; -- Handle Erorr 1175

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY','')); -- Handle Error 1055
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 16  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 

update khach_hang
inner join hop_dong on hop_dong.id_khach_hang = khach_hang.id_khach_hang
set khach_hang.id_loai_khach = 1
where khach_hang.id_loai_khach = 2 and year(hop_dong.ngay_lam_hop_dong) = "2019"
and exists (select sum(hop_dong.tong_tien) from hop_dong
group by hop_dong.id_khach_hang
having sum(hop_dong.tong_tien) > 10000000);

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 17  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SET FOREIGN_KEY_CHECKS=0;
delete khach_hang from khach_hang
inner join hop_dong on hop_dong.id_khach_hang = khach_hang.id_khach_hang 
where exists (select hop_dong.ngay_lam_hop_dong from hop_dong
where year(hop_dong.ngay_lam_hop_dong) <= "2016" and khach_hang.id_khach_hang = hop_dong.id_khach_hang)
and not exists (select hop_dong.ngay_lam_hop_dong from hop_dong
where year(hop_dong.ngay_lam_hop_dong) > "2016" and khach_hang.id_khach_hang = hop_dong.id_khach_hang);

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 18  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

update dich_vu_di_kem dvdk
inner join hop_dong_chi_tiet hdct on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
inner join hop_dong hd on hd.id_hop_dong = hdct.id_hop_dong
set dvdk.gia = dvdk.gia * 2
where year(hd.ngay_lam_hop_dong) = "2019" 
and exists (select count(hop_dong_chi_tiet.id_dich_vu_di_kem) from hop_dong_chi_tiet
group by hop_dong_chi_tiet.id_dich_vu_di_kem
having count(hop_dong_chi_tiet.id_dich_vu_di_kem) > 10);
 
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 19  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

select nv.id_nhan_vien, nv.ho_ten, nv.email, nv.sdt, nv.ngay_sinh, nv.diachi 
from nhan_vien nv
union
select kh.id_khach_hang, kh.ho_ten, kh.email, kh.sdt, kh.ngay_sinh, kh.dia_chi
from khach_hang kh;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 20  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

create view V_NHANVIEN
as
select nv.id_nhan_vien, nv.ho_ten, nv.id_vi_tri, nv.id_bo_phan, 
nv.ngay_sinh, nv.so_cmnd, nv.luong,nv.sdt, nv.email,nv.diachi
from nhan_vien nv
inner join hop_dong hd on nv.id_nhan_vien = hd.id_nhan_vien
where nv.diachi = "Hải Châu" and hd.ngay_lam_hop_dong = "20191212";

drop view V_NHANVIEN;

select * from V_NHANVIEN;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 21  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

update V_NHANVIEN
set diachi = "Liên Chiểu";

SET SQL_SAFE_UPDATES = 0;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 22  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SET FOREIGN_KEY_CHECKS=0; -- set foreign key = 0 for deleting key row
SET SQL_SAFE_UPDATES = 0;

delimiter //
create procedure sp_1 (in id_kh int)
begin
delete from khach_hang
where khach_hang.id_khach_hang = id_kh;
end//
delimiter ;

call sp_1(2);

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 23  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

delimiter //
create procedure sp_2 (in id_hd int,in id_nv int,in id_kh int,in id_dv int,in nlhd date, in nkt date, in tdc int, in tong int)
begin 
if(
(id_hd not in (select hop_dong.id_hop_dong from hop_dong))
and (id_nv in (select nhan_vien.id_nhan_vien from nhan_vien))
and (id_kh in (select khach_hang.id_khach_hang from khach_hang))
and (id_dv in (select dich_vu.id_dich_vu from dich_vu))
)
then insert into hop_dong value (id_hd, id_nv, id_kh, id_dv, nlhd, nkt, tdc, tong);
end if;
end //
delimiter ;

call sp_2(16,3,3,3,20140412,20140501,100000,200000000);

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 24  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

delimiter $$
create trigger tr_1 after delete on hop_dong
for each row
begin
set @a = (select count(*) from hop_dong);
end $$
delimiter ;

drop trigger tr_1;

set @a = 0;
delete from hop_dong where hop_dong.id_hop_dong = 5;
select @a as "Total amount deleted";

-- set biến trung gian để in bảng ra console bằng trigger

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 25  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

delimiter $$
create trigger tr_2 before update on hop_dong
for each row
begin
if datediff(new.ngay_lam_hop_dong, old.ngay_ket_thuc) <2
then signal sqlstate '45000' set message_text = "Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày";
end if;
end; $$
delimiter ;

drop trigger tr_2;

update `casestudy`.`hop_dong`
set `ngay_ket_thuc` = '20211128'
where (`id_hop_dong` = 5);

-- dùng signal sqlstate '45000' set message_text = ... để quăng lỗi

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 26  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

delimiter //
drop function if exists func_1 //
create function func_1() returns int
deterministic
begin
create temporary table temp 
(select count(distinct id_dich_vu) from hop_dong 
where id_dich_vu in (select distinct id_dich_vu from hop_dong)	group by id_dich_vu 
having sum(tong_tien) > 2000000);    
set @tong_so_dich_vu = (select count(*) from temp);
drop temporary table temp;
return @tong_so_dich_vu;
end;
select func_1() as "Số lượng dịch vụ có tổng tiền trên 2000000";

-- temporary table: bảng phụ

delimiter //
drop function if exists func_2 //
create function func_2( id_khach_hang int) returns int
deterministic
begin
set @time_dai_nhat = (select max(datediff(hop_dong.ngay_ket_thuc, hop_dong.ngay_lam_hop_dong)) from hop_dong
where hop_dong.id_khach_hang = id_khach_hang);
return @time_dai_nhat;
end;
select func_2(4) as "Thời gian dài nhất";

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 27  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

delimiter //
drop procedure if exists sp_3 //
create procedure sp_3()
begin
	declare dich_vu int default 0;
    declare is_done int default 0;
    declare con_tro cursor for
    select dich_vu.id_dich_vu
    from dich_vu inner join hop_dong on dich_vu.id_dich_vu = hop_dong.id_dich_vu
    inner join loai_dich_vu on dich_vu.id_loai_dich_vu = loai_dich_vu.id_loai_dich_vu
    where loai_dich_vu.ten_loai_dich_vu = "room" and year(hop_dong.ngay_lam_hop_dong) between "2015" and "2025";
    declare continue handler for not found set is_done = 1;
    open con_tro;
    get_list: loop
    fetch from con_tro into dich_vu;
    if is_done = 1 then
    leave get_list;
    end if;
    delete from hop_dong where hop_dong.id_dich_vu = dich_vu;
    delete from dich_vu where dich_vu.id_dich_vu = dich_vu;
    fetch next from con_tro into dich_vu;
    
    end loop get_list;
    close con_tro;
    end //
    
    call sp_3();

-- Bó tay.com

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 27  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

















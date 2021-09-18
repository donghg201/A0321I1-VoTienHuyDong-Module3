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
insert into hop_dong values(10,1,5,4,20211129,20211130,1000000,200000000);
insert into hop_dong values(11,2,6,1,20211130,20211203,1000000,200000000);
insert into hop_dong values(12,3,7,2,20211201,20211205,1000000,200000000);

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
hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, dich_vu.chi_phi_thue + (hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia) as TongTien
from khach_hang
left join loai_khach on khach_hang.id_loai_khach = loai_khach.id_loai_khach 
left join hop_dong on khach_hang.id_khach_hang = hop_dong.id_khach_hang
left join dich_vu on dich_vu.id_dich_vu = hop_dong.id_dich_vu
left join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
left join dich_vu_di_kem on dich_vu_di_kem.id_dich_vu_di_kem = hop_dong_chi_tiet.id_dich_vu_di_kem
group by id_khach_hang;

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

select date_format(ngay_lam_hop_dong, "%m") as Thang, sum(tong_tien) as Tong_doanh_thu_thang, ngay_lam_hop_dong
from hop_dong
group by month(ngay_lam_hop_dong)
having year(hop_dong.ngay_lam_hop_dong) = "2019";

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 9  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

select hop_dong.id_hop_dong, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, hop_dong.tien_dat_coc, count(hop_dong_chi_tiet.id_hop_dong_chi_tiet) as So_luong_dich_vu_di_kem
from hop_dong
left join hop_dong_chi_tiet on hop_dong_chi_tiet.id_hop_dong = hop_dong.id_hop_dong
group by hop_dong_chi_tiet.id_hop_dong_chi_tiet;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 10  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

select kh.ho_ten, dvdk.id_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia, dvdk.don_vi, dvdk.trang_thai_kha_dung
from khach_hang kh 
left join loai_khach lk on kh.id_loai_khach = lk.id_loai_khach
left join hop_dong hd on kh.id_khach_hang = hd.id_khach_hang
left join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
left join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
where lk.ten_loai_khach = "Diamond" and (kh.dia_chi = "Quang Ngai" or kh.dia_chi = "Vinh");

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 11  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

select hd.id_hop_dong, nv.ho_ten as Ho_ten_nhan_vien, kh.ho_ten as Ho_ten_khach_hang, kh.sdt, dv.ten_dich_vu, sum(hdct.so_luong) as So_luong_dich_vu_di_kem, hd.tien_dat_coc
from hop_dong hd
left join nhan_vien nv on hd.id_nhan_vien = nv.id_nhan_vien
left join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
left join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
left join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
group by kh.ho_ten;



where (
exists (select ngay_lam_hop_dong from hop_dong hd
where date_format(hd.ngay_lam_hop_dong, "%Y %m %d") between "20191001" and "20191231")
and not exists (select ngay_lam_hop_dong from hop_dong
where date_format(hd.ngay_lam_hop_dong, "%Y %m %d") between "20190101" and "20190630")
)







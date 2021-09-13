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
diachi varchar(45) not null,
constraint id_loai_khach_fk foreign key (id_loai_khach) references loai_khach(id_loai_khach)
);
drop table khach_hang;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  cụm khách hàng  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 

create table dich_vu_di_kem(
id_dich_vu_di_kem int not null primary key,
ten_dich_vu_di_kem varchar(45) not null,
gia int not null,
don_vi int not null,
trang_thai_khach_hang varchar(45) not null
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

insert into loai_khach values(1,"A");
insert into loai_khach values(2,"B");
insert into loai_khach values(3,"C");

insert into khach_hang values(1, 1, "Le Van D", 19980822,201817053,0905123456,"dddd@gmail.com","so 1 duong D");
insert into khach_hang values(2, 2, "Duong Van E", 19980823,201817043,0905123457,"eeee@gmail.com","so 1 duong E");
insert into khach_hang values(3, 3, "Hoang Thi F", 19980812,201817853,0905123756,"ffff@gmail.com","so 1 duong F");

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

insert into hop_dong_chi_tiet values(1,1,1,1);
insert into hop_dong_chi_tiet values(2,2,2,2);
insert into hop_dong_chi_tiet values(3,3,3,3);

select * from dich_vu_di_kem;
select * from hop_dong;
select * from hop_dong_chi_tiet;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  insert cụm hợp đồng  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

select * from nhan_vien where (left(nhan_vien.ho_ten,1) = "K" or left(nhan_vien.ho_ten,1) = "T" or left(nhan_vien.ho_ten,1) = "H");

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 2  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

select * from khach_hang where (year(current_timestamp) - year(ngay_sinh) >= 18 or year(current_timestamp) <= 50) and (diachi = "Da Nang" or diachi = "Quang Tri");

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  yêu cầu 3  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




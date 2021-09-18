create database manage_library;
use manage_library;

create table student(
student_number varchar(15) not null primary key,
student_name varchar(50) not null,
address varchar(255) not null,
email varchar(50) not null,
image blob not null
);
drop table student;

create table borrow_order(
student_number varchar(15) not null primary key,
book_number varchar(15) not null,
date_borrow date,
date_return date,
key book_number(book_number),
constraint student_borrow_fk foreign key (student_number) references student(student_number),
constraint book_borrow_fk foreign key (book_number) references book(book_number)
);
drop table borrow_order;

create table book(
book_number varchar(15) not null primary key,
book_name varchar(50) not null,
book_author varchar(50) not null,
category varchar(50) not null,
`status` varchar(15) not null
);
drop table book;
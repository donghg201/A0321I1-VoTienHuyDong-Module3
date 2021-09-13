create database analyze_and_design;
use analyze_and_design;

create table customers(
customer_number int not null primary key,
customer_name varchar(50) not null,
contact_last_name varchar(50) not null,
contact_first_name varchar(50) not null,
phone varchar(50) not null,
address_line1 varchar(50) not null,
address_line2 varchar(50),
city varchar(50) not null,
state varchar(50) not null,
postal_code varchar(15) not null,
credit_limit float,
sale_rep_employee_number int not null,
key sale_rep_employee_number(sale_rep_employee_number),
constraint employee_customers foreign key (sale_rep_employee_number) references employees(employee_number)
);
drop table customers;

create table products(
product_code varchar(15) not null primary key,
product_name varchar(70) not null,
product_scale varchar(10) not null,
product_vendor varchar(50) not null,
product_description text not null,
quantity_in_stock int not null,
buy_price float not null,
msrp float not null,
product_line varchar(50) not null,
key product_line(product_line),
constraint product_line_fk foreign key (product_line) references product_line(product_line)
);
drop table products;

create table orders(
order_number int not null primary key,
order_date date not null,
required_date date not null,
shipped_date date,
`status` varchar(15) not null,
comments text,
quantity_ordered int not null,
price_each float not null,
customer_number int not null,
unique key customer_number(customer_number),
constraint customer_order_fk foreign key (customer_number) references customers(customer_number)
);
drop table orders;

create table order_details(
order_number int not null,
product_code varchar(15) not null,
primary key (order_number,product_code),
constraint products_orders_fk1 foreign key (order_number) references orders(order_number),
constraint products_orders_fk2 foreign key (product_code) references products(product_code)
);
drop table order_details;

create table payments(
customer_number int not null primary key,
check_number varchar(50) not null,
payment_date date not null,
amount float not null,
constraint customer_payment_fk foreign key (customer_number) references customers(customer_number)
);
drop table payments;

create table product_line(
product_line varchar(50) not null primary key,
text_descriptions text,
image varchar(255)
);
drop table product_line;

create table employees(
employee_number int not null primary key,
last_name varchar(50) not null,
first_name varchar(50) not null,
email varchar(100) not null,
job_title varchar(50) not null,
report_to int,
key report_to(report_to),
office_code varchar(10) not null,
key office_code(office_code),
constraint employee_to_employee_fk foreign key (report_to) references employees(employee_number),
constraint employee_office_fk foreign key (office_code) references offices(office_code)
);
drop table employees;

create table offices(
office_code varchar(10) not null primary key,
city varchar(50) not null,
phone varchar(50) not null,
address_line1 varchar(50) not null,
address_line2 varchar(50) not null,
state varchar(50) not null,
country varchar(50) not null,
postal_code varchar(15) not null
);
drop table offices;

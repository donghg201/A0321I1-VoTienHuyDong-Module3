use classicmodels;
-- Tìm thông tin của Julie King (mã số 175)
SELECT * FROM customers WHERE customerNumber = 175; 

-- Bằng lệnh này bạn sẽ nhận ra được với câu Query của bạn, điều gì đang xảy ra và kiểu kết hợp (Join) nào đang diễn ra bên trong.
EXPLAIN SELECT * FROM customers WHERE customerNumber = 175;

-- Các bạn thêm chỉ mục cho bảng customers như sau:
ALTER TABLE customers ADD INDEX idx_customerNumber(customerNumber);

EXPLAIN SELECT * FROM customers WHERE customerNumber = 175;

ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);

EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';

-- Để xoá chỉ mục trong bảng, bạn làm như sau:
ALTER TABLE customers DROP INDEX idx_full_name;
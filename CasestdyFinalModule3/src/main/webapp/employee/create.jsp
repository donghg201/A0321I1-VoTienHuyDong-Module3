<%--
  Created by IntelliJ IDEA.
  User: Macintos
  Date: 30/10/2021
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new employee</title>
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<div class="container">
    <form method="post" action="/employee?action=add">
        <a href="/employee?action=''" class="btn btn-warning">
            Back to menu
        </a>
        <div class="form-group">
            <label for="employee_id">Id</label>
            <input type="number" class="form-control" id="employee_id" name="employee_id"
                   placeholder="Enter employee id">
        </div>
        <div class="form-group">
            <label for="employee_name">Name</label>
            <input type="text" class="form-control" id="employee_name" name="employee_name"
                   placeholder="Enter employee name">
        </div>
        <div class="form-group">
            <label for="employee_birthday">Birthday</label>
            <input type="date" class="form-control" id="employee_birthday" name="employee_birthday"
                   placeholder="Enter employee birthday">
        </div>
        <div class="form-group">
            <label for="employee_id_card">Id card</label>
            <input type="text" class="form-control" id="employee_id_card" name="employee_id_card"
                   placeholder="Enter employee id card">
        </div>
        <div class="form-group">
            <label for="employee_salary">Salary</label>
            <input type="number" class="form-control" id="employee_salary" name="employee_salary"
                   placeholder="Enter employee salary">
        </div>
        <div class="form-group">
            <label for="employee_phone">Phone</label>
            <input type="text" class="form-control" id="employee_phone" name="employee_phone"
                   placeholder="Enter employee phone">
        </div>
        <div class="form-group">
            <label for="employee_email">Email</label>
            <input type="email" class="form-control" id="employee_email" name="employee_email"
                   placeholder="Enter employee email">
        </div>
        <div class="form-group">
            <label for="employee_address">Country</label>
            <input type="text" class="form-control" id="employee_address" name="employee_address"
                   placeholder="Enter employee address">
        </div>
        <div class="form-group">
            <label for="position_id">Position id</label>
            <select class="custom-select custom-select-sm" id="position_id" name="position_id">
                <option selected>Employee position id</option>
                <option value="1">Giam doc</option>
                <option value="2">Quan ly</option>
                <option value="3">Giam sat</option>
                <option value="4">Chuyen vien</option>
                <option value="5">Phuc vu</option>
                <option value="6">Le tan</option>
            </select>
        </div>
        <div class="form-group">
            <label for="education_degree_id">Education degree</label>
            <select class="custom-select custom-select-sm" id="education_degree_id" name="education_degree_id">
                <option selected>Employee education degree</option>
                <option value="1">Sau dai hoc</option>
                <option value="2">Dai hoc</option>
                <option value="3">Cao dang</option>
                <option value="4">Trung cap</option>
            </select>
        </div>
        <div class="form-group">
            <label for="division_id">Division id</label>
            <select class="custom-select custom-select-sm" id="division_id" name="division_id">
                <option selected>Employee division id</option>
                <option value="1">Sale-Marketing</option>
                <option value="2">Hanh chinh</option>
                <option value="3">Phuc vu</option>
                <option value="4">Quan ly</option>
            </select>
        </div>
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" class="form-control" id="username" name="username"
                   placeholder="Enter employee username">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
</body>
</html>

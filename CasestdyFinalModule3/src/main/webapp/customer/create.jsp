<%--
  Created by IntelliJ IDEA.
  User: Macintos
  Date: 29/10/2021
  Time: 02:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new customer</title>
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<div class="container">
    <form method="post" action="/customer?action=add">
        <a href="/customer?action=''" class="btn btn-warning">
            Back to menu
        </a>
        <div class="form-group">
            <label for="customer_id">Id</label>
            <input type="number" class="form-control" id="customer_id" name="customer_id"
                   placeholder="Enter customer id">
        </div>
        <div class="form-group">
            <label for="customer_type_id">Type of id</label>
            <select class="custom-select custom-select-sm" id="customer_type_id" name="customer_type_id">
                <option selected>Customer type id</option>
                <option value="1">Diamond</option>
                <option value="2">Platinum</option>
                <option value="3">Gold</option>
                <option value="4">Silver</option>
                <option value="5">Member</option>
            </select>
        </div>
        <div class="form-group">
            <label for="customer_name">Name</label>
            <input type="text" class="form-control" id="customer_name" name="customer_name"
                   placeholder="Enter customer name">
        </div>
        <div class="form-group">
            <label for="customer_birthday">Birthday</label>
            <input type="date" class="form-control" id="customer_birthday" name="customer_birthday"
                   placeholder="Enter customer birthday">
        </div>
        <div class="form-group">
            <label for="customer_gender">Gender</label>
            <%--            <input type="number" class="form-control" id="customer_gender" name="customer_gender"--%>
            <%--                   placeholder="Enter customer gender">--%>
            <select class="form-control" id="customer_gender" name="customer_gender">
                <option selected>Gender</option>
                <option value="1">Male</option>
                <option value="2">Female</option>
            </select>
        </div>
        <div class="form-group">
            <label for="customer_id_card">Id card</label>
            <input type="text" class="form-control" id="customer_id_card" name="customer_id_card"
                   placeholder="Enter customer id card">
        </div>
        <div class="form-group">
            <label for="customer_phone">Phone</label>
            <input type="text" class="form-control" id="customer_phone" name="customer_phone"
                   placeholder="Enter customer phone">
        </div>
        <div class="form-group">
            <label for="customer_email">Email</label>
            <input type="email" class="form-control" id="customer_email" name="customer_email"
                   placeholder="Enter customer email">
        </div>
        <div class="form-group">
            <label for="customer_address">Country</label>
            <input type="text" class="form-control" id="customer_address" name="customer_address"
                   placeholder="Enter customer address">
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

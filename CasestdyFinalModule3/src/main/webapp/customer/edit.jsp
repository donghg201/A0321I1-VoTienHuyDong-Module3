<%--
  Created by IntelliJ IDEA.
  User: Macintos
  Date: 29/10/2021
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update customer</title>
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<div class="container">
    <form method="post" action="/customer?action=update">
        <a href="/customer?action=''" class="btn btn-warning">
            Back to menu
        </a>
        <c:forEach items="customer" var="customer">
            <div class="form-group">
                <label for="customer_id">ID</label>
                <input type="number" class="form-control" id="customer_id" name="customer_id"
                       placeholder="Enter customer id" value="${requestScope['customer'].customer_id}" readonly>
            </div>
            <div class="form-group">
                <label for="customer_type_id">Type of id</label>
                <select class="custom-select custom-select-sm" id="customer_type_id" name="customer_type_id" value="${requestScope['customer'].customer_type_id}">
                    <option value="1" ${requestScope['customer'].customer_type_id == 1 ? "selected": ""}>Diamond</option>
                    <option value="2" ${requestScope['customer'].customer_type_id == 2 ? "selected": ""}>Platinum</option>
                    <option value="3" ${requestScope['customer'].customer_type_id == 3 ? "selected": ""}>Gold</option>
                    <option value="4" ${requestScope['customer'].customer_type_id == 4 ? "selected": ""}>Silver</option>
                    <option value="5" ${requestScope['customer'].customer_type_id == 5 ? "selected": ""}>Member</option>
                </select>
            </div>
            <div class="form-group">
                <label for="customer_name">Name</label>
                <input type="text" class="form-control" id="customer_name" name="customer_name"
                       placeholder="Enter customer name" value="${requestScope['customer'].customer_name}">
            </div>
            <div class="form-group">
                <label for="customer_birthday">Birthday</label>
                <input type="date" class="form-control" id="customer_birthday" name="customer_birthday"
                       placeholder="Enter customer birthday" value="${requestScope['customer'].customer_birthday}">
            </div>
            <div class="form-group">
                <label for="customer_gender">Gender</label>
                    <%--            <input type="number" class="form-control" id="customer_gender" name="customer_gender"--%>
                    <%--                   placeholder="Enter customer gender">--%>
                <select class="form-control" id="customer_gender" name="customer_gender" value="${requestScope['customer'].customer_gender}">
                    <option selected>Gender</option>
                    <option value="1" ${requestScope['customer'].customer_gender == 1 ? "selected" : ""}>Male</option>
                    <option value="2" ${requestScope['customer'].customer_gender == 2 ? "selected" : ""}>Female</option>
                </select>
            </div>
            <div class="form-group">
                <label for="customer_id_card">Id card</label>
                <input type="text" class="form-control" id="customer_id_card" name="customer_id_card"
                       placeholder="Enter customer id card" value="${requestScope['customer'].customer_id_card}">
            </div>
            <div class="form-group">
                <label for="customer_phone">Phone</label>
                <input type="text" class="form-control" id="customer_phone" name="customer_phone"
                       placeholder="Enter customer phone" value="${requestScope['customer'].customer_phone}">
            </div>
            <div class="form-group">
                <label for="customer_email">Email</label>
                <input type="email" class="form-control" id="customer_email" name="customer_email"
                       placeholder="Enter customer email" value="${requestScope['customer'].customer_email}">
            </div>
            <div class="form-group">
                <label for="customer_address">Country</label>
                <input type="text" class="form-control" id="customer_address" name="customer_address"
                       placeholder="Enter customer address" value="${requestScope['customer'].customer_address}">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </c:forEach>
    </form>
</div>

<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
</body>
</html>

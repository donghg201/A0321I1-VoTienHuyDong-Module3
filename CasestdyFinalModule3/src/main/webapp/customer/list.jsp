<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Macintos
  Date: 29/10/2021
  Time: 01:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>List of customer</title>
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<div class="container">
    <div>
        <a href="/customer?action=create" class="btn btn-warning">
            Add new user
        </a>
        <a href="/" class="btn btn-warning">
            Home
        </a>
        <form method="get" action="/customer?action=search">
            <input name="action" value="search" hidden>
            <input type="text" name="customerSearch">
            <button class="btn btn-success">Search</button>
        </form>
    </div>
    <table class="table" id="customer">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Type id</th>
            <th scope="col">Name</th>
            <th scope="col">Birthday</th>
            <th scope="col">Gender</th>
            <th scope="col">Id card</th>
            <th scope="col">Phone</th>
            <th scope="col">Email</th>
            <th scope="col">Address</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${customerList}" var="customer">
            <tr>
                <td>${customer.getCustomer_id()}</td>
                <td>
                    <c:if test="${customer.getCustomer_type_id() == 1}">Diamond</c:if>
                    <c:if test="${customer.getCustomer_type_id() == 2}">Platinum</c:if>
                    <c:if test="${customer.getCustomer_type_id() == 3}">Gold</c:if>
                    <c:if test="${customer.getCustomer_type_id() == 4}">Silver</c:if>
                    <c:if test="${customer.getCustomer_type_id() == 5}">Member</c:if>
                </td>
                <td>${customer.getCustomer_name()}</td>
                <td>${customer.getCustomer_birthday()}</td>
                <td>
                    <c:if test="${customer.getCustomer_gender() == 1}">Male</c:if>
                    <c:if test="${customer.getCustomer_gender() == 2}">Female</c:if>
                </td>
                <td>${customer.getCustomer_id_card()}</td>
                <td>${customer.getCustomer_phone()}</td>
                <td>${customer.getCustomer_email()}</td>
                <td>${customer.getCustomer_address()}</td>
                <td>
                    <a href="/customer?action=update&customer_id=${customer.getCustomer_id()}">Edit</a>
                </td>
                <td>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" onclick="setValueForm('${customer.getCustomer_id()}')"
                            data-toggle="modal" data-target="#modalDelete">
                        Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <!-- Modal -->
    <div class="modal fade" id="modalDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form method="post" action="/customer?action=delete">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Confirm!!!</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input name="customer_id" id="customer_id" hidden>
                        Do u wanna delete this?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Delete
                            <%--<a href="/customer?action=delete&id=${customer.getCustomer_id()}" style="color: white">Delete</a>--%>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
<script>
    $(document).ready(function () {
        $('#customer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        })
    })
</script>
<script>
    function setValueForm(customer_id) {
        document.getElementById("customer_id").value = customer_id;
    }
</script>
</body>
</html>

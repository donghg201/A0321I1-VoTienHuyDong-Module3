<%--
  Created by IntelliJ IDEA.
  User: Macintos
  Date: 30/10/2021
  Time: 12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List of employee</title>
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<div class="container">
    <div>
        <a href="/employee?action=create" class="btn btn-warning">
            Add new employee
        </a>
        <a href="/" class="btn btn-warning">
            Home
        </a>
    </div>
    <table class="table" id="employee">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Name</th>
            <th scope="col">Birthday</th>
            <th scope="col">Id card</th>
            <th scope="col">Phone</th>
            <th scope="col">Email</th>
            <th scope="col">Address</th>
            <th scope="col">Position id</th>
            <th scope="col">Education degree</th>
            <th scope="col">Division id</th>
            <th scope="col">Username</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${employeeList}" var="employee">
            <tr>
                <td>${employee.getEmployee_id()}</td>
                <td>${employee.getEmployee_name()}</td>
                <td>${employee.getEmployee_birthday()}</td>
                <td>${employee.getEmployee_id_card()}</td>
                <td>${employee.getSalary()}</td>
                <td>${employee.getEmployee_phone()}</td>
                <td>${employee.getEmployee_email()}</td>
                <td>${employee.getEmployee_address()}</td>
                <td>
                    <c:if test="${employee.getPosition_id() == 1}">Giam doc</c:if>
                    <c:if test="${employee.getPosition_id() == 2}">Quan ly</c:if>
                    <c:if test="${employee.getPosition_id() == 3}">Giam sat</c:if>
                    <c:if test="${employee.getPosition_id() == 4}">Chuyen vien</c:if>
                    <c:if test="${employee.getPosition_id() == 5}">Phuc vu</c:if>
                    <c:if test="${employee.getPosition_id() == 6}">Le tan</c:if>
                </td>
                <td>
                    <c:if test="${employee.getEducation_degree_id() == 1}">Sau dai hoc</c:if>
                    <c:if test="${employee.getEducation_degree_id() == 2}">Dai hoc</c:if>
                    <c:if test="${employee.getEducation_degree_id() == 3}">Cao dang</c:if>
                    <c:if test="${employee.getEducation_degree_id() == 4}">Trung cap</c:if>
                </td>
                <td>
                    <c:if test="${employee.getDivision_id() == 1}">Sale-Marketing</c:if>
                    <c:if test="${employee.getDivision_id() == 2}">Hanh chinh</c:if>
                    <c:if test="${employee.getDivision_id() == 3}">Phuc vu</c:if>
                    <c:if test="${employee.getDivision_id() == 4}">Quan ly</c:if>
                </td>
                <td>${employee.getUsername()}</td>
                <td>¬
                    <a href="/employee?action=update&employee_id=${employee.getEmployee_id()}">Edit</a>
                </td>
                <td>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" onclick="setValueForm('${employee.getEmployee_id()}')"
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
                <form method="post" action="/employee?action=delete">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Confirm!!!</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input name="employee_id" id="employee_id" hidden>
                        Do u wanna delete this?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Delete
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
        $('#employee').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        })
    })
</script>
<script>
    function setValueForm(employee_id) {
        document.getElementById("employee_id").value = employee_id;
    }
</script>
</body>
</html>

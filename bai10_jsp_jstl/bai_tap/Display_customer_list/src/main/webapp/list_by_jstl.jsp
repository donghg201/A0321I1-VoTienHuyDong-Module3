<%--
  Created by IntelliJ IDEA.
  User: Macintos
  Date: 07/10/2021
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List by JSTL</title>
    <style>
        table, th, td{
            border:1px solid black;
        }
        table{
            border-collapse:collapse;
        }
    </style>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<table>
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach var="customer" items="${customerListServlet}">
        <tr>
            <td><c:out value="${customer.name}"></c:out></td>
            <td><c:out value="${customer.date_of_birth}"></c:out></td>
            <td><c:out value="${customer.address}"></c:out></td>
            <td><img src="${customer.picture}" height="200px" width="200px"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

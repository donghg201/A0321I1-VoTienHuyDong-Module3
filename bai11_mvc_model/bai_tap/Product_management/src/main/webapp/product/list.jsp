<%--
  Created by IntelliJ IDEA.
  User: Macintos
  Date: 10/10/2021
  Time: 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
<h1>Customers</h1>
<p>
    <a href="/products?action=create">Create new product</a>
</p>
<table>
    <tr>
        <td>Product name</td>
        <td>Product amount</td>
        <td>Product description</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td><a href="/products?action=view&id=${product.getProduct_id()}">${product.getProduct_name()}</a></td>
            <td>${product.getProduct_amount()}</td>
            <td>${product.getProduct_description()}</td>
            <td><a href="/products?action=edit&id=${product.getProduct_id()}">edit</a></td>
            <td><a href="/products?action=delete&id=${product.getProduct_id()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: Macintos
  Date: 10/10/2021
  Time: 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View product</title>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/products">Back to product list</a>
</p>
<table>
    <tr>
        <td>Product name: </td>
        <td>${requestScope["product"].getProduct_name()}</td>
    </tr>
    <tr>
        <td>Product amount: </td>
        <td>${requestScope["product"].getProduct_amount()}</td>
    </tr>
    <tr>
        <td>Product description: </td>
        <td>${requestScope["product"].getProduct_description()}</td>
    </tr>
</table>
</body>
</html>

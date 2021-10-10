<%--
  Created by IntelliJ IDEA.
  User: Macintos
  Date: 10/10/2021
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deleting product</title>
</head>
<body>
<h1>Delete product</h1>
<p>
    <a href="/products">Back to product list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Product name:</td>
                <td>${requestScope["product"].getProduct_name()}</td>
            </tr>
            <tr>
                <td>Product amount:</td>
                <td>${requestScope["product"].getProduct_amount()}</td>
            </tr>
            <tr>
                <td>Product description:</td>
                <td>${requestScope["product"].getProduct_description()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete product"></td>
                <td><a href="/products">Back to product list</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>

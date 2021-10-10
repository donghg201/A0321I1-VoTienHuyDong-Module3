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
    <title>Edit product</title>
</head>
<body>
<h1>Edit product</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/products">Back to product list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Product name: </td>
                <td><input type="text" name="product_name" id="product_name" value="${requestScope["product"].getProduct_name()}"></td>
            </tr>
            <tr>
                <td>Product amount: </td>
                <td><input type="number" name="product_amount" id="product_amount" value="${requestScope["product"].getProduct_amount()}"></td>
            </tr>
            <tr>
                <td>Product description: </td>
                <td><input type="text" name="product_description" id="product_description" value="${requestScope["product"].getProduct_description()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
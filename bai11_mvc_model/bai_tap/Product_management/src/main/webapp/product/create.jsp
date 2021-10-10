<%--
  Created by IntelliJ IDEA.
  User: Macintos
  Date: 10/10/2021
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Create new product</title>
  <style>
    .message{
      color:green;
    }
  </style>
</head>
<body>
<h1>Create new product</h1>
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
        <td>Product Name: </td>
        <td><input type="text" name="product_name" id="product_name"></td>
      </tr>
      <tr>
        <td>Product Amount: </td>
        <td><input type="number" name="product_amount" id="product_amount"></td>
      </tr>
      <tr>
        <td>Product Description: </td>
        <td><input type="text" name="product_description" id="product_description"></td>
      </tr>
      <tr>
        <td></td>
        <td><input type="submit" value="Create product"></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>

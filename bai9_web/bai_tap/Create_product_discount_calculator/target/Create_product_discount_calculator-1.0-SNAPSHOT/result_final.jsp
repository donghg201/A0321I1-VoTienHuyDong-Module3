<%--
  Created by IntelliJ IDEA.
  User: Macintos
  Date: 07/10/2021
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result After Discount Calculation</title>
</head>
<body>
<h1>
    Product Description: <%=request.getAttribute("product_description")%>
</h1>
<h1>
    Discount Amount: <%=request.getAttribute("discount_amount")%>
</h1>
<h1>
    Discount price: <%=request.getAttribute("discount_price")%>
</h1>
</body>
</html>

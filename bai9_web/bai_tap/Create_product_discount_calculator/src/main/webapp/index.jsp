<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<form action="/DiscountServlet" method="post">
    <div>Product Description:
        <input type="text" style="position: relative; left: 5px" name="product_description"></div>
    <div>List Price:
        <input type="number" style="position: relative; left: 97px" name="price"></div>
    <div>Discount Percent:
        <input type="number" style="position: relative; left: 35px" name="percent">
    </div>
    <input type="submit" value="Calculate Discount">
</form>
</body>
</html>
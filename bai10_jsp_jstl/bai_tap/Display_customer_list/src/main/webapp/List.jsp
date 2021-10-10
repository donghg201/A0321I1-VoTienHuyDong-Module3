<%@ page import="model.Customer" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Macintos
  Date: 07/10/2021
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Customer</title>
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
<table>
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <%
        List<Customer> customerListJSP = (List<Customer>) request.getAttribute("customerListServlet");
        for (Customer customer : customerListJSP) {
    %>
    <tr>
        <td><%=customer.getName()%>
        </td>
        <td><%=customer.getDate_of_birth()%>
        </td>
        <td><%=customer.getAddress()%>
        </td>
        <td><%=customer.getPicture()%>
        </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>

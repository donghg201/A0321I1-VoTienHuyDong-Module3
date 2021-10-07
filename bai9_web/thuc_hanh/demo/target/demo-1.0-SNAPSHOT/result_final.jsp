<%--
  Created by IntelliJ IDEA.
  User: Macintos
  Date: 06/10/2021
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
</head>
<body>
<h2 style="color:yellow">${resultFromServlet}</h2>
<h2 style="color:yellow">
<%=request.getAttribute("resultFromServlet")%>
</h2>
</body>
</html>

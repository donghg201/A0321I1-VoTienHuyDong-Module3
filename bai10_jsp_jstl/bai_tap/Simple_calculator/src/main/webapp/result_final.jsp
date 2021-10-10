<%--
  Created by IntelliJ IDEA.
  User: Macintos
  Date: 08/10/2021
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="c" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
</head>
<body>
<h2>
    Result: <%=request.getAttribute("resultFromServlet")%>
</h2>
</body>
</html>

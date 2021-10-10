<%--
  Created by IntelliJ IDEA.
  User: Macintos
  Date: 08/10/2021
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Calculator</title>
    <style>
        table {
            border: 1px solid;
        }
        td{
            margin: 5px;
        }
    </style>
</head>
<body>
<form action="/CalculatorServlet" method="get">
    <h1>Simple Calculator</h1>
    <h3>Calculator</h3>
    <table>
        <tr>
            <td>First operand:</td>
            <td>
                <input type="number" name="first_operand">
            </td>
        </tr>
        <tr>
            <td>Operator:</td>
            <td>
                <select name="option">
                    <option value="addition">Addition</option>
                    <option value="subtraction">Subtraction</option>
                    <option value="multiplication">Multiplication</option>
                    <option value="division">Division</option>
                </select></td>
        </tr>
        <tr>
            <td>Second operand:</td>
            <td><input type="number" name="second_operand"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" name="submit" value="Calculate"></td>
        </tr>
    </table>
</form>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Macintos
  Date: 27/10/2021
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<div class="container-fluid">
    <div>
        <div class="row">
            <a class="col-sm-10">
                <img src="https://farm5.staticflickr.com/4230/35108607076_fc9c72a7f4_o.png" style="height: 100px;width: 100px">
            </a>
            <a class="col-sm-2 d-sm-inline float-sm-right align-middle" style="top:40px">
                Nguyen Van A
            </a>
        </div>
    </div>
    <div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="collapse navbar-collapse pl-5" id="navbarTogglerDemo02">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Employee</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/customer">Customer</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Service</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contract</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>
    </div>
    <div class="row">
        <div class="col-sm-3">
            <div>Item one</div>
            <div>Item Two</div>
            <div>Item Three</div>
        </div>
        <div class="col-sm-9 text-justify align-middle" style="height:500px">
            Body
        </div>
    </div>
    <div class="text-justify align-middle col-sm-12" style="height:50px">
        Footer
    </div>
</div>

<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
</body>
</html>

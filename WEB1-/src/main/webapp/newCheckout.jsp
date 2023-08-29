<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 4/27/2023
  Time: 6:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checkout Page</title>
    <%@include file="Pages/commonCssJs.jsp"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="script.js"></script>
</head>
<body>
<%@include file="Pages/newNav.jsp"%>
<div class="container">
    <div class="row mt-5">
        <div class="col-md-7 mb-5">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center mb-5">Your selected items</h3>

                    <div class="cart-body"></div>
                </div>
            </div>

        </div>
        <div class="col-md-5">
            <div class="card">
                <%@include file="message.jsp"%>
                <div class="card-body">
                    <h3 class="text-center mb-5">Your order details</h3>
                    <form action="user?page=order" method="post">
                        <div class="mb-3">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" class="form-control" name="userName" id="name" placeholder="Enter here..." value="${sessionScope.userName}">
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="text" class="form-control" name="email" id="email" placeholder="abc@gmail.com" value="${sessionScope.email}">
                        </div>

                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone</label>
                            <input type="text" class="form-control" name="phoneNo" id="phone" placeholder="+977 98..." value="${sessionScope.phoneNo}">
                        </div>

                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <input type="text" class="form-control" name="address" id="address" placeholder="Enter here..." value="${sessionScope.address}">
                        </div>

                        <div class="container text-center">
                            <button class="btn btn-outline-primary" on onclick="gotoProduct()">Continue Shopping</button>
                            <button class="btn btn-outline-success" type="submit">Order</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
<%@include file="Pages/commonModals.jsp"%>

</body>
</html>

<script>
    function gotoProduct(){

        window.location.href="user?page=newProduct";
    }
</script>

<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 4/8/2023
  Time: 1:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>My Cart</title>
    <%@include file="Pages/commonCssJs.jsp"%>
</head>
<body>
<%@include file="Pages/newNav.jsp"%>


<div class="container">
    <div class="row mt-4">
        <div class="col-md-12">
            <table class="table">
                <thead class="table custom-bg text-white">
                <tr>
                    <th scope="col">Image</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                    <th scope="col">Discount</th>

                    <th scope="col">Action</th>


                </tr>
                </thead>
                <tbody>
                <c:forEach items="${cartList}" var="product">

                    <tr>
                        <td><img src="assets/${product.image}" style="height: 80px; width: 80px"></td>
                        <td>${product.name}</td>
                        <td>
                            <form action="user?page=quantity" method="POST">
                                <input type="hidden" name="productId" value="${product.id}">
                                <button class="btn btn-danger btn-sm" type="submit" name="quantityChange" value="-1">-</button>
                                <span>${product.quantity}</span>
                                <button class="btn btn-danger btn-sm" type="submit" name="quantityChange" value="1">+</button>
                            </form>
                        </td>
                        <td>${product.quantity * product.price}</td>
                        <td>${product.discount} %</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>

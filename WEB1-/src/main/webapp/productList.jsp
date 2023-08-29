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
    <title>Product List</title>
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
                    <th scope="col">Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Price</th>
                    <th scope="col">Discount</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Category</th>
                    <th scope="col">Image</th>
                    <th scope="col">Action</th>


                </tr>
                </thead>
                <tbody>
                <c:forEach items="${productList}" var="product">

                    <tr>
                        <td>${product.id}</td>
                        <td>${product.name}</td>
                        <td>${product.description}</td>
                        <td>${product.price}</td>
                        <td>${product.discount}</td>
                        <td>${product.quantity}</td>
                        <td>${product.category}</td>
                        <td>${product.image}</td>
                        <td style='text-align: center;padding: 8px;'><button class="btn" style="background: #E42217; padding: 3px 7px; border-radius: .5rem; cursor: pointer; border: none"><a href="user?page=productDetails&id=${product.id}" style="text-decoration: none; color:#ffffff;">Product Details</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 4/27/2023
  Time: 9:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="text.textLimit" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product</title>
    <%@include file="Pages/commonCssJs.jsp"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



</head>
<body>
<%@include file="Pages/newNav.jsp"%>
<div class="row mt-3 mx-2">

    <div class="col-md-2">
        <div class="list-group mt-4">
            <div class="list-group">
                <a href="user?page=newProduct" class="list-group-item list-group-item-action active" aria-current="true">
                    All Products
                </a>
                <c:forEach  items="${categoryList}" var="product">
                    <a href="user?page=category&categoryId=${product.categoryId}" class="list-group-item list-group-item-action">${product.categoryTitle}</a>
                </c:forEach>
            </div>
        </div>

    </div>

    <div class="col-md-8">
        <%@include file="message.jsp"%>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <c:forEach items="${productList}" var="product">
                <div class="col">
                    <div class="card h-100 mt-4">
                        <img src="assets/${product.image}" class="card-img-top" alt="${product.image}">
                        <div class="card-body">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="card-text">${textLimit.get10Words(product.description)}</p>
                        </div>
                        <div class="card-footer text-center">
                            <c:set var="priceAfterDiscount" value="${product.price - (product.price * product.discount / 100)}" />
                            <form method="post" action="user?page=addToCartHidden">
                                <input type="hidden" name="userName" value="${sessionScope.userName}">
                                <input type="hidden" name="email" value="${sessionScope.email}">
                                <input type="hidden" name="name" value="${product.name}">
                                <input type="hidden" name="id" value="${product.id}">
                                <input type="hidden" name="quantity" value="1">
                                <input type="hidden" name="image" value="${product.image}">
                                <input type="hidden" name="description" value="${product.description}">
                                <input type="hidden" name="price" value="${product.price}">
                                <input type="hidden" name="discount" value="${product.discount}">
                                <button class="btn btn custom-bg text-white">Add to Cart</button>
                            </form>
                            <button class="btn btn-outline-success -white">Rs <c:out value="${priceAfterDiscount}" />/-<span class="text-secondary discount-label">Rs.${product.price} ${product.discount}% off</span> </button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<%@include file="Pages/commonModals.jsp"%>
</body>
</html>


<style>
    .list-group-item.active{
        background: #c62828!important;
        border-color: #c62828!important;
    }

    .discount-label{
        font-size: 10px!important;
        font-style: italic!important;
        text-decoration:line-through!important;

    }
    .card {
        cursor: pointer;
        transition: box-shadow 0.3s ease-in-out;

    }

    .card:hover {
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    }
</style>


<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 5/7/2023
  Time: 8:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>orders</title>
  <%@include file="Pages/commonCssJs.jsp"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
<%@include file="Pages/newNav.jsp"%>


<div class="container">
  <div class="row mt-4">
    <div class="col-md-12">
      <div class="container text-center">
        <form method="post" action="user?page=userSearch">
          <input type="hidden" name="page" value="searchUser">
          <label for="searchInput">Search Users:</label>
          <input type="text" id="searchInput" name="searchInput">
          <input type="submit" value="Search">
        </form>
      </div>
      <table class="table">
        <thead class="table custom-bg text-white">
        <tr>
          <th scope="col">Product Name</th>
          <th scope="col">Price</th>
          <th scope="col">Quantity</th>
          <th scope="col">Discount</th>


        </tr>
        </thead>
        <tbody>
        <c:forEach items="${cartList}" var="product">

          <tr>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.quantity}</td>
            <td>${product.discount}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
  </div>
</div>
</div>

</body>
</html>

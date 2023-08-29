<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 4/13/2023
  Time: 7:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Category Details</title>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
          <th scope="col" >CategoryId</th>
          <th scope="col" >Category Description</th>
          <th scope="col" >Category Title</th>
          <th scope="col" >Action</th>

        </tr>
        </thead>
        <tbody>

          <tr >
            <td >${product.categoryId}</td>
            <td >${product.categoryDescription}</td>
            <td>${product.categoryTitle}</td>
            <td ><button class="btn" style="background: blue; padding: 3px 7px; color:#ffffff; border-radius: .5rem; cursor: pointer; border: none"><a href="user?page=editCategory&categoryId=${product.categoryId}" style="color: #ffffff">Edit</a></button>

            <button class="btn" style="background: #E42217; padding: 3px 7px; color:#ffffff; border-radius: .5rem; cursor: pointer; border: none"><a href="user?page=deleteCategory&categoryId=${product.categoryId}" style="color: #ffffff">Delete</a></button></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>


</body>
</html>


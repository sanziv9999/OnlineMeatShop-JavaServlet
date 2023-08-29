<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 4/27/2023
  Time: 11:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@include file="Pages/commonCssJs.jsp"%>
</head>
<body>
<div class="container">
  <div class="row mt-4">
    <div class="col-md-8 mx-auto">
      <div class="card">
        <div class="card-body">
          <h3 class="text-center mb-5">Edit Category Details</h3>
          <form action="user?page=productEdit" method="post" enctype="multipart/form-data">
            <div class="form-group">
              <label for="id" class="form-label">Id</label>
              <input type="number" class="form-control" name="id" id="id"  value="${product.id}" required>
            </div>
            <div class="form-group">
              <label for="name" class="form-label">Name</label>
              <input type="text" class="form-control" name="name" id="name" value="${product.name}" required>
            </div>
            <div class="form-group">
              <label for="description" class="form-label">Description</label>
              <input type="text" class="form-control" id="description"  name="description" value="${product.description}" required>
            </div>
            <div class="form-group">
              <label for="price" class="form-label">Price</label>
              <input type="text" class="form-control" name="price" id="price"  value="${product.price}" required>
            </div>
            <div class="form-group">
              <label for="discount" class="form-label">Discount</label>
              <input type="number" class="form-control" name="discount" id="discount" value="${product.discount}" required>
            </div>
            <div class="form-group">
              <label for="quantity" class="form-label">Quantity</label>
              <input type="number" class="form-control" id="quantity"  name="quantity" value="${product.quantity}" required>
            </div>
            <div class="form-group">
              <label for="category" class="form-label">Category</label>
              <input type="number" class="form-control" id="category"  name="category" value="${product.category}" required>
            </div>
            <div class="form-group">
              <label for="image" class="form-label">Image</label>
              <input type="text" class="form-control" id="image"  name="image" value="${product.image}" required>
            </div>
            <div class="container text-center">
              <button class="btn custom-bg text-white" type="submit">Save Changes</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>

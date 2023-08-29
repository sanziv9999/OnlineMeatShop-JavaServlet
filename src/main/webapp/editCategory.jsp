<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 4/13/2023
  Time: 7:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Category</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@include file="Pages/commonCssJs.jsp"%>
</head>
<body>
<%@include file="Pages/newNav.jsp"%>
<div class="container">
    <div class="row mt-4">
        <div class="col-md-8 mx-auto">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center mb-5">Edit Category Details</h3>
                    <form action="user?page=categoryEdit" method="post">
                        <div class="form-group">
                            <label for="categoryId" class="form-label">Category Id</label>
                            <input type="text" class="form-control" name="categoryId" id="categoryId"  value="${product.categoryId}" required>
                        </div>
                        <div class="form-group">
                            <label for="categoryTitle" class="form-label">Category Title</label>
                            <input type="text" class="form-control" name="categoryTitle" id="categoryTitle" value="${product.categoryTitle}" required>
                        </div>
                        <div class="form-group">
                            <label for="categoryDescription" class="form-label">Category Description</label>
                            <input type="text" class="form-control" id="categoryDescription"  name="categoryDescription" value="${product.categoryDescription}" required>
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


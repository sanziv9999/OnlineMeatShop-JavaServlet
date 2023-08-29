<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 3/15/2023
  Time: 10:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>Edit User</title>
    <%@include file="Pages/commonCssJs.jsp"%>
</head>
<body>
<%@include file="Pages/newNav.jsp"%>
<div class="container">
    <div class="row mt-4">
        <div class="col-md-8 mx-auto">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center mb-5">Edit User Details</h3>
                    <form action="user?page=userEdit" method="post">
                        <div class="form-group">
                            <label for="name" class="form-label">Id</label>
                            <input type="text" class="form-control" name="id" id="id" value="${college.id}">
                        </div>
                        <div class="form-group">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" class="form-control" name="userName" id="name" value="${college.userName}">
                        </div>
                        <div class="form-group">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" name="password" id="password" value="${college.password}">
                        </div>
                        <div class="form-group">
                            <label for="email" class="form-label">Email</label>
                            <input type="text" class="form-control" name="email" id="email" value="${college.email}">
                        </div>
                        <div class="form-group">
                            <label for="phone" class="form-label">Phone</label>
                            <input type="text" class="form-control" name="phoneNo" id="phone" value="${college.phoneNo}">
                        </div>
                        <div class="form-group">
                            <label for="address" class="form-label">Address</label>
                            <input type="text" class="form-control" name="address" id="address" value="${college.address}">
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

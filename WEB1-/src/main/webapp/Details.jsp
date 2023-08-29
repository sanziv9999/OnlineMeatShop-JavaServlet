<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 3/10/2023
  Time: 7:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Details</title>
</head>
<body>
<%--
Created by IntelliJ IDEA.
User: lazy
Date: 3/8/2023
Time: 11:00 AM
To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
                    <th scope="col">Id</th>
                    <th scope="col">Username</th>
                    <th scope="col">Password</th>
                    <th scope="col">PhoneNo</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address</th>
                    <th scope="col">Action</th>


                </tr>
                </thead>
                <tbody>

                    <tr>
                        <td>${college.id}</td>
                        <td>${college.userName}</td>
                        <td>${college.password}</td>
                        <td>${college.phoneNo}</td>
                        <td>${college.email}</td>
                        <td>${college.address}</td>
                        <td>
                        <button class="btn" style="background: blue; padding: 3px 7px; color:#ffffff; border-radius: .5rem; cursor: pointer; border: none"><a href="user?page=editUser&id=${college.id}" style="color: #ffffff">Edit</a></button>

                        <button class="btn" style="background: #E42217; padding: 3px 7px; color:#ffffff; border-radius: .5rem; cursor: pointer; border: none"><a href="user?page=deleteUser&id=${college.id}" style="color: #ffffff">Delete</a></button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>

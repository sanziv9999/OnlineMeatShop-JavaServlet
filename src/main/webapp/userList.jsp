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
    <title>User List</title>
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
                <c:forEach items="${collegeList}" var="college">

                    <tr>
                        <td>${college.id}</td>
                        <td>${college.userName}</td>
                        <td>${college.password}</td>
                        <td>${college.phoneNo}</td>
                        <td>${college.email}</td>
                        <td>${college.address}</td>
                        <td style='text-align: center;padding: 8px;'><button class="btn" style="background: #E42217; padding: 3px 7px; border-radius: .5rem; cursor: pointer; border: none"><a href="user?page=userDetails&id=${college.id}" style="text-decoration: none; color:#ffffff;">UserDetails</a></button></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
    <div class="container text-center">
        <c:if test="${pageNumber > 1}">
            <a href="user?page=userList&pageNumber=${pageNumber - 1}&rowsPerPage=${rowsPerPage}">&#8249;</a>
        </c:if>
        ${pageNumber}
        <c:if test="${not empty collegeList}">
            <c:set var="totalRows" value="${collegeList.size()}" />
            <c:set var="lastPage" value="${((totalRows - 1) / rowsPerPage) + 1}" />

            <c:if test="${pageNumber < lastPage}">
                <a href="user?page=userList&amp;pageNumber=${pageNumber + 1}&amp;rowsPerPage=${rowsPerPage}">&#8250;</a>
            </c:if>
        </c:if>


    </div>
            <button class="btn" style="background: #E42217; padding: 3px 7px; color:#ffffff; border-radius: .5rem; cursor: pointer; border: none"><a href="user?page=addUser" style="color: #ffffff; text-decoration: none">Add User</a></button></td>
        </div>
    </div>
</div>
</body>
</html>

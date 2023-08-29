<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 4/8/2023
  Time: 9:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>Category List</title>
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
                <c:forEach items="${categoryList}" var="product">

                    <tr style='border-bottom: 1px solid #f2f2f2;'>
                        <td style='text-align: center;padding: 8px;'>${product.categoryId}</td>
                        <td style='text-align: left;padding: 8px;'>${product.categoryDescription}</td>
                        <td style='text-align: left;padding: 8px;'>${product.categoryTitle}</td>
                        <td style='text-align: center;padding: 8px;'><button class="btn" style="background: #E42217; padding: 3px 7px; color:#ffffff; border-radius: .5rem; cursor: pointer; border: none"><a href="user?page=categoryDetails&categoryId=${product.categoryId}" style="color:#ffffff">Details</a></button></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>

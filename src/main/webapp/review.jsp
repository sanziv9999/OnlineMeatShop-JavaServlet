<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 3/26/2023
  Time: 7:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>Review</title>
    <%@include file="Pages/commonCssJs.jsp"%>
</head>
<body>
<%@include file="Pages/newNav.jsp"%>
<div class="row mt-3 mx-2">
    <div class="col-md-2">

    </div>
    <div class="col-md-8">
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <c:forEach items="${reviewList}" var="college">
                <div class="col">
                    <div class="card h-100 mt-4">
                        <img src="assets/user.png" class="card-img-top" alt="user">
                        <div class="card-body">
                            <div class="mr-2">
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                            </div>

                            <h3 class="card-title">${college.userName}</h3>
                            <h5 class="card-title">${college.email}</h5>
                            <p class="card-text">${college.message}</p>
                        </div>
                     </div>
                  </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
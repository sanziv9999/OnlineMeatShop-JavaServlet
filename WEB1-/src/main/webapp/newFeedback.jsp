<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 4/29/2023
  Time: 4:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FeedBack Page</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@include file="Pages/commonCssJs.jsp"%>
</head>
<body>
<%@include file="Pages/newNav.jsp"%>
<div class="container-fluid">
    <div class="row mt-5">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <%@include file="message.jsp"%>
                <div class="card-body px-5">
                    <h3 class="text-center my-3">Feedback Form!!</h3>
                    <form action="user?page=newFeedbackForm" method="post">
                        <div class="mb-3">
                            <label for="userName" class="form-label">Name</label>
                            <input type="text" class="form-control" name="userName" id="userName" placeholder="Enter here..." value="${sessionScope.userName}">
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="text" class="form-control" name="email" id="email" placeholder="abc@gmail.com" value="${sessionScope.email}">
                        </div>

                        <label for="message" class="form-label">Message</label>
                        <textarea style="height: 150px" class="form-control" id="message" placeholder="Your feedback will be much appreciated." name="message" required></textarea>

                        <div class="container text-center mt-3">
                            <button class="btn btn-primary" type="submit">Send</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>

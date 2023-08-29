<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 4/22/2023
  Time: 10:10 PM
  To change this template use File | Settings | File Templates.
--%>

<%
    String userName1 = (String) session.getAttribute("userName");
    String role1 = (String) session.getAttribute("role");

%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Include Bootstrap CSS file -->
<%--    <%@include file="commonCssJs.jsp"%>--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <link rel="stylesheet" href="Pages/newCss.css">
    <script>
        window.onpageshow = function(event) {
            if (event.persisted) {
                window.location.reload();
            }
        };
    </script>
    <script src="script.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg" >
    <div class="container">
        <a class="navbar-brand" href="user?page=newHome">Online Meat Shop.</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">


            <%
                if(userName1!=null){
                    if(role1!=null && role1.equalsIgnoreCase("admin")){
            %>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#!">MyDash</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="user?page=newAdminOrders">Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="user?page=newReview">Review</a>
                </li>

            </ul>
            <ul class="navbar-nav ml-auto login">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#!"><%= role1 %></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="user?page=Logout">Logout</a>
                </li>
            </ul>
            <%
            }else{
            %>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="user?page=newHome">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="user?page=newAbout">About</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="user?page=newProduct">Product</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="user?page=newFeedback">Feedback</a>
            </li>
            </ul>
            <ul class="navbar-nav ml-auto login">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="user?page=cartItems" data-toggle="modal" data-target="#cart"><i class="fa fa-shopping-cart" style="font-size:20px"></i><span class="ml-0 cart-items">()</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#!"><%= userName1 %></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="user?page=Logout">Logout</a>
                </li>
            </ul>
            <%
                }
            } else {
            %>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="user?page=newHome">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="user?page=newAbout">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="user?page=newProduct">Product</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto login">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="user?page=cartItems" data-toggle="modal" data-target="#cart"><i class="fa fa-shopping-cart" style="font-size:20px"></i><span class="ml-0 cart-items">()</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="user?page=newLogin">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="user?page=newRegister">Register</a>
                </li>
            </ul>
            <%
                }
            %>



        </div>
    </div>
</nav>

<!-- Include Bootstrap JS file and your custom JS file -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Your custom JS code -->
<script>
    // Add event listener to the navbar-toggler button
    document.querySelector('.navbar-toggler').addEventListener('click', function() {
        // Toggle the collapse class on the navbar-collapse element
        document.querySelector('.navbar-collapse').classList.toggle('collapse');
    });
</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 3/15/2023
  Time: 10:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <link rel="stylesheet" href="Style.css">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="../script.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Landing Page</title>
</head>

<body>
<header>
    <input type="checkbox" name="" id="toggler">
    <label for="toggler"  class="fas fa-bars"></label>
    <a href="#" class="logo">Meat Shop<span>.</span></a>

    <nav class="navbar">
        <a href="user?page=home">home</a>
        <a href="user?page=about">about</a>
        <a href="user?page=products">products</a>
        <a href="user?page=review">review</a>
        <a href="user?page=feedback">feedback</a>
    </nav>

    <div class="icons">
<%--        <a href="#!" id="cart-link" onclick="document.getElementById('modal').style.display='block'"> <i class="fa fa-shopping-cart" style="font-size: 26px"></i><span class="cart-items" >(0)</span></a>--%>
            <c:choose>
                <c:when test="${not empty sessionScope.userName}">
                    <!-- User is logged in, enable cart button -->
                    <a href="#!" id="cart-link" onclick="document.getElementById('modal').style.display='block'">
                        <i class="fa fa-shopping-cart" style="font-size: 26px"></i>
                        <span class="cart-items">(0)</span>
                    </a>
                </c:when>
                <c:otherwise>
                    <!-- User is not logged in, disable cart button -->
                    <a href="#!" id="cart-link" onclick="alert('Please login to access cart')">
                        <i class="fa fa-shopping-cart" style="font-size: 26px"></i>
                        <span class="cart-item">(0)</span>
                    </a>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${not empty sessionScope.userName}">
                    <!-- User is logged in, show username -->
                    <a href="user?page=profile" class="fa fa-user">
                    <span style="font-size:2rem">${sessionScope.userName}</span>
                    <a href="user?page=logout" class="fas fa-sign-out-alt"></a>

                </c:when>
                <c:otherwise>
                    <!-- User is not logged in, show link to login page -->
                    <a href="user?page=index" class="fa fa-user"></a>
                </c:otherwise>
            </c:choose>
    </div>



</header>
<div id="modal" class="w3-modal">
    <div class="w3-modal-content">
        <span class="w3-display-topleft" style="font-size: 20px; color: #555; font-weight: bolder; margin:5px 5px 5px 5px ;">My Cart</span>
        <span onclick="document.getElementById('modal').style.display='none'" class="w3-button w3-display-topright">&times;</span><br><br>
        <hr>
        <div class="cart-body">

        </div>
        <div class="w3-container w3-right-align">
<%--            <button class="w3-button buy-btn" style="background:#E42217;border-radius: .5rem; margin: 5px"><a href="user?page=checkOut"><span>Buy</span></a></button>--%>
                <button class="w3-button buy-btn" style="background:#E42217;border-radius: .5rem; margin: 5px" onclick="gotoCheckout()">Buy</button>

        </div>
</div>
</div>


</body>


</html>

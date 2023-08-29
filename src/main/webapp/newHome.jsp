<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 4/22/2023
  Time: 10:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Online Meat Shop</title>
    <%@include file="Pages/commonCssJs.jsp"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
    <%@include file="Pages/newNav.jsp"%>
    <div class="container">
        <div class="row align-items-center mt-4">
            <div class="col-md-6">
                <h3 class="lead delicious">Delicious Organic Meat</h3>
                <p class="lead enjoy">Enjoy Fresh Meat With<br>The Best Quality</p>
                <p class="lead info">The meat is then delivered to the customer's doorstep within a specified time frame. Online meat shops typically offer a wide variety of meat products, including beef, pork, chicken, lamb, and seafood, as well as other related products such as sausages, deli meats, and marinades.</p>
                <a href="user?page=newProduct" class="btn btn-lg mr-3 custom-bg text-white shop" style="border: #c62828"><i class="fa fa-shopping-cart mr-1" ></i> Shop Now</a>
                <a href="user?page=newAbout" class="btn btn-lg inverse-hover" style="border: #c62828 1px solid; color:#c62828;" >About</a>
            </div>

            <div class="col-md-6">
                <div class="row mt-4">
                    <img src="assets/2.jpg" alt=""  style="height: 500px; width: 100%" >
                </div>

            </div>
        </div>
    </div>
    <%@include file="Pages/commonModals.jsp"%>
</body>
</html>

<style>
.inverse-hover:hover{
    cursor: pointer;
    background: #E42217;
    color: white!important;
}
.shop:hover{
    cursor: pointer;
    background: #E42217!important;

}

.enjoy{
    color: #E42217!important;
    font-size: 40px;
    font-weight: 400;
}
.delicious{
    font-size: 65px;
    font-weight: 450;
}
.info{
    text-align: justify;
    font-weight: 300;
}


</style>



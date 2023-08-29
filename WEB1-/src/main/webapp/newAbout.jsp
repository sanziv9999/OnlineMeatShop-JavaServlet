<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 4/28/2023
  Time: 5:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>About</title>
  <%@include file="Pages/commonCssJs.jsp"%>
</head>
<body>
<%@include file="Pages/newNav.jsp"%>
<div class="container mt-4" style="height: 450px">
  <div class="row">
    <div class="col-md-6 video-container">
      <video src="assets/video.mp4" class="w-100" loop autoplay muted></video>
      <h3 class="text-center">Best Meat Seller</h3>
    </div>
    <div class="col-md-6 content">
      <h3>Why choose us?</h3>
      <p style="text-align: justify">Online shopping has become increasingly popular over the years due to the convenience it offers. With just a few clicks, consumers can purchase products from the comfort of their homes, without the need to physically visit a store. Online shopping also offers a wider selection of products, competitive prices, and the ability to compare prices and reviews from different sellers. Additionally, many online retailers offer free and fast shipping options, as well as easy returns and refunds. Overall, the benefits of online shopping make it an attractive option for consumers looking for a hassle-free and convenient way to shop.</p>
      <a href="#" class="btn btn-danger">Learn more</a>
    </div>
  </div>
</div>


<div class="container ">
  <div class="row">
    <h1 class="text-center" style="margin-bottom: 25px">Our services</h1>
    <div class="col-md-4  service">
      <img src="assets/free.avif" alt="" class="icons">
      <div class="info">
        <h3>Free delivery</h3>
        <span>on all orders</span>
      </div>
    </div>
    <div class="col-md-4 service">
      <img src="assets/return.png" alt="" class="icons">
      <div class="info">
        <h3>10 days returns</h3>
        <span>money-back guarantee</span>
      </div>
    </div>
    <div class="col-md-4 service">
      <img src="assets/offer.jpg" alt="" class="icons">
      <div class="info">
        <h3>Offer &amp; gifts</h3>
        <span>on all orders</span>
      </div>
    </div>
  </div>
</div>
<%@include file="Pages/commonModals.jsp"%>
</body>
</html>

<style>
  .icons{
    max-height: 100px;
    max-width: 100%;
  }
  .service{
    box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
  }
</style>

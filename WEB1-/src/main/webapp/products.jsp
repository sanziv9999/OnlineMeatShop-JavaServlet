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
    <title>Products</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="script.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
</head>

<body>
<%@include file="Pages/nav.jsp"%>

<section class="category" id="category">
    <div class="list-group">
        <a href="user?page=products" class="allCategory">All categories</a><br>
        <c:forEach  items="${categoryList}" var="product">
            <a href="user?page=${product.categoryTitle}" class="categories">${product.categoryTitle}</a>
        </c:forEach>
    </div>

</section>
<section class="products" id="products">
    <h1 class="heading">latest <span>products</span></h1>

    <div class="box-container">
    <c:forEach items="${productList}" var="product">
        <div class="box">
            <span class="discount">${product.discount}% off</span>
            <div class="image">
                <img src="assets/${product.image}" alt="${product.image}">
                <div class="icons">
                    <a href="#" class="fas fa-heart"></a>
                    <c:set var="priceAfterDiscount" value="${product.price - (product.price * product.discount / 100)}" />
                    <a href="#" class="cart-btn" onclick="addToCart(${product.id},'${product.name}',<c:out value="${priceAfterDiscount}"/>)">Add to cart</a>
                    <a href="#" class="fas fa-share"></a>
                </div>
            </div>
            <div class="content">
                <h3>${product.name}</h3>
                <c:set var="priceAfterDiscount" value="${product.price - (product.price * product.discount / 100)}" />
                <div class="price" id="finalPrice"> Rs.<c:out value="${priceAfterDiscount}" /> <span> Rs.${product.price}</span></div>
            </div>
        </div>
    </c:forEach>

    </div>
</section>

</body>
</html>

<style>
    /*:root{*/
    /*    --primary:#E42217;*/
    /*    --secondary:#fff;*/
    /*}*/
    /**{*/
    /*    margin:auto;*/
    /*    font-family: Verdana, Geneva, Tahoma, sans-serif;*/
    /*    outline: none;*/
    /*    border: none;*/
    /*    text-decoration: none;*/
    /*    text-transform: capitalize;*/
    /*    transition: .2s linear;*/
    /*}*/
    /*html{*/
    /*    font-size: 62.5%;*/
    /*    scroll-behavior: smooth;*/
    /*    scroll-padding-top: 6rem;*/
    /*    overflow: scroll;*/
    /*}*/
    /*.products{*/
    /*    padding-top: 10rem;*/
    /*    max-width: 65%;*/

    /*}*/


    /*.category{*/
    /*    top: 15rem;*/
    /*    max-width: 25rem;*/
    /*    position: absolute;*/
    /*    left: 5rem;*/
    /*    font-size: 3rem;*/
    /*}*/

    /*.allCategory{*/
    /*    background: var(--primary);color: black;*/
    /*    border: 1px solid #ccc; !* Add a 1px solid gray border *!*/
    /*    padding: 1rem; !* Add some padding around the link *!*/
    /*    border-radius: .5rem;*/
    /*}*/

    /*.list-group a.categories {*/
    /*    color: black;*/
    /*    border: 1px solid #ccc; !* Add a 1px solid gray border *!*/
    /*    border-radius: .5rem;*/
    /*    padding: 1rem; !* Add some padding around the link *!*/
    /*    display: block; !* Make each link a block element *!*/

    /*}*/

    /*.list-group a.categories:hover {*/
    /*    background-color: #f5f5f5; !* Change the background color on hover *!*/
    /*    cursor: pointer; !* Change the cursor to a pointer on hover *!*/
    /*}*/


    /*.heading{*/
    /*    text-align: center;*/
    /*    font-size: 4rem;*/
    /*    color: #333;*/
    /*    padding:1rem;*/
    /*    margin: 2rem 0 2rem 0;*/
    /*    background: rgba(234, 44, 44, 0.05);*/

    /*}*/

    /*.heading span{*/
    /*    color:var(--primary);*/
    /*}*/


    /*.products .box-container{*/
    /*    display: flex;*/
    /*    flex-wrap: wrap;*/
    /*    gap: 1.5rem;*/
    /*}*/
    /*.products .box-container .box{*/
    /*    flex: 1 1 25rem;*/
    /*    box-shadow: 0 .5rem 1.5rem rgba(0, 0, 0 , .1);*/
    /*    border-radius: .5rem;*/
    /*    border:.1rem solid rgba(0,0,0,.1);*/
    /*    position: relative;*/

    /*}*/
    /*.products .box-container .box .discount{*/
    /*    position: absolute;*/
    /*    top:1rem;*/
    /*    left:1rem;*/
    /*    padding:.7rem 1rem;*/
    /*    font-size: 2rem;*/
    /*    color: var(--secondary);*/
    /*    background: rgba(255, 51 , 153, .05);*/
    /*    z-index: 1;*/
    /*    border-radius: .5rem;*/
    /*    background: var(--primary);*/
    /*}*/
    /*.products .box-container .box .image{*/
    /*    position: relative;*/
    /*    text-align: center;*/
    /*    padding-top:2rem;*/
    /*    overflow: hidden;*/
    /*}*/
    /*.products .box-container .box .image img{*/
    /*    height: 25rem;*/
    /*    width: auto;*/

    /*}*/
    /*.products .box-container .box:hover .image img{*/
    /*    transform: scale(1.1);*/
    /*}*/

    /*.products .box-container .box .image .icons{*/

    /*    position:absolute;*/
    /*    bottom: -7rem;*/
    /*    left:0;*/
    /*    right:0;*/
    /*    display: flex;*/
    /*}*/

    /*.products .box-container .box:hover .image .icons{*/
    /*    bottom: 0;*/
    /*}*/
    /*.products .box-container .box .image .icons a{*/
    /*    height: 5rem;*/
    /*    line-height: 5rem;*/
    /*    font-size: 2rem;*/
    /*    width: 50%;*/
    /*    background: var(--primary);*/
    /*    color: #fff;*/
    /*}*/

    /*.products .box-container .box .image .icons .cart-btn{*/
    /*    border-left:.1rem solid #fff7 ;*/
    /*    border-right:.1rem solid #fff7 ;*/
    /*    width: 100%;*/
    /*}*/

    /*.products .box-container .box .image .icons a:hover{*/
    /*    background: #333;*/
    /*}*/

    /*.products .box-container .box .content{*/
    /*    padding:2rem;*/
    /*    text-align: center;*/
    /*}*/
    /*.products .box-container .box .content h3{*/
    /*    font-size: 2.5rem;*/
    /*    color: #333;*/
    /*}*/
    /*.products .box-container .box .content .price{*/
    /*    font-size: 2.5rem;*/
    /*    color: var(--primary);*/
    /*    font-weight: bolder;*/
    /*    padding-top: 1rem;*/

    /*}*/
    /*.products .box-container .box .content .price span{*/
    /*    font-size: 1.5rem;*/
    /*    color: #999;*/
    /*    font-weight: lighter;*/
    /*    text-decoration:line-through ;*/

    /*}*/




    /*@media (max-width:991px){*/
    /*    html{*/
    /*        font-size: 55%;*/
    /*    }*/

    /*}*/
    /*@media (max-width:1600px){*/
    /*    .category{*/
    /*        text-align: center;*/
    /*        position: relative;*/
    /*        max-width: 60%;*/
    /*        margin-bottom: 10rem;*/


    /*    }*/
    /*    .list-group{*/
    /*        display: flex;*/
    /*        flex-wrap: wrap;*/
    /*        flex: 1 1 30rem ;*/
    /*        row-gap: 1.5rem;*/


    /*    }*/
    /*}*/
    /*@media (max-width:450px) {*/
    /*    html{*/
    /*        font-size: 50%;*/
    /*    }*/
    /*    .heading{*/
    /*        font-size: 3rem;*/
    /*    }*/


    /*}*/
    /*@media only screen and(max-width:450px) {*/
    /*    html{*/
    /*        font-size: 30%;*/
    /*    }*/
    /*    .heading{*/
    /*        font-size: 2rem;*/
    /*    }*/
    /*    .products{*/
    /*        max-width: 100%;*/
    /*    }*/

    /*    .box-container{*/
    /*        max-width: 100%;*/
    /*         margin-left:0px;*/
    /*     }*/
    /*}*/

    :root{
        --primary:#E42217;
        --secondary:#fff;
    }
    *{
        margin:auto;
        font-family: Verdana, Geneva, Tahoma, sans-serif;
        outline: none;
        border: none;
        text-decoration: none;
        text-transform: capitalize;
        transition: .2s linear;
    }
    html{
        font-size: 62.5%;
        scroll-behavior: smooth;
        scroll-padding-top: 6rem;
        overflow: scroll;
    }
    .products{
        padding-top: 10rem;
        max-width: 65%;
    }


    .category{
        top: 15rem;
        max-width: 25rem;
        position: absolute;
        left: 5rem;
        font-size: 3rem;
    }

    .allCategory{
        background: var(--primary);color: black;
        border: 1px solid #ccc; /* Add a 1px solid gray border */
        padding: 1rem; /* Add some padding around the link */
        border-radius: .5rem;



    }

    .list-group a.categories {
        color: black;
        border: 1px solid #ccc; /* Add a 1px solid gray border */
        border-radius: .5rem;
        padding: 1rem; /* Add some padding around the link */
        display: block; /* Make each link a block element */

    }

    .list-group a.categories:hover {
        background-color: #f5f5f5; /* Change the background color on hover */
        cursor: pointer; /* Change the cursor to a pointer on hover */
    }

    /*.category .list-group{*/
    /*    border: black 1px solid;*/
    /*    padding: 1rem;*/
    /*    border-radius: .5rem;*/
    /*}*/
    /*.category .list-group a{*/
    /*    color: black;*/
    /*}*/


    .heading{
        text-align: center;
        font-size: 4rem;
        color: #333;
        padding:1rem;
        margin: 2rem 0 2rem 0;
        background: rgba(234, 44, 44, 0.05);

    }

    .heading span{
        color:var(--primary);
    }


    .products .box-container{
        display: flex;
        flex-wrap: wrap;
        gap: 1.5rem;
    }
    .products .box-container .box{
        flex: 1 1 25rem;
        box-shadow: 0 .5rem 1.5rem rgba(0, 0, 0 , .1);
        border-radius: .5rem;
        border:.1rem solid rgba(0,0,0,.1);
        position: relative;

    }
    .products .box-container .box .discount{
        position: absolute;
        top:1rem;
        left:1rem;
        padding:.7rem 1rem;
        font-size: 2rem;
        color: var(--secondary);
        background: rgba(255, 51 , 153, .05);
        z-index: 1;
        border-radius: .5rem;
        background: var(--primary);
    }
    .products .box-container .box .image{
        position: relative;
        text-align: center;
        padding-top:2rem;
        overflow: hidden;
    }
    .products .box-container .box .image img{
        height: 25rem;
        width: auto;

    }
    .products .box-container .box:hover .image img{
        transform: scale(1.1);
    }

    .products .box-container .box .image .icons{

        position:absolute  ;
        bottom: -7rem;
        left:0;
        right:0;
        display: flex;
    }

    .products .box-container .box:hover .image .icons{
        bottom: 0;
    }
    .products .box-container .box .image .icons a{
        height: 5rem;
        line-height: 5rem;
        font-size: 2rem;
        width: 50%;
        background: var(--primary);
        color: #fff;
    }

    .products .box-container .box .image .icons .cart-btn{
        border-left:.1rem solid #fff7 ;
        border-right:.1rem solid #fff7 ;
        width: 100%;
    }

    .products .box-container .box .image .icons a:hover{
        background: #333;
    }

    .products .box-container .box .content{
        padding:2rem;
        text-align: center;
    }
    .products .box-container .box .content h3{
        font-size: 2.5rem;
        color: #333;
    }
    .products .box-container .box .content .price{
        font-size: 2.5rem;
        color: var(--primary);
        font-weight: bolder;
        padding-top: 1rem;

    }
    .products .box-container .box .content .price span{
        font-size: 1.5rem;
        color: #999;
        font-weight: lighter;
        text-decoration:line-through ;

    }




    @media (max-width:991px){
        html{
            font-size: 55%;
        }

    }
    @media (max-width:1600px){
        .category{
            text-align: center;
            position: relative;
            max-width: 60%;
            margin-bottom: 10rem;


        }
        .list-group{
            display: flex;
            flex-wrap: wrap;
            flex: 1 1 30rem ;
            row-gap: 1.5rem;


        }
    }
    @media (max-width:450px) {
        html{
            font-size: 50%;
        }
        .heading{
            font-size: 3rem;
        }
        .products{
            margin-left: 0px;
            max-width: 100%;

        }


    }
    @media only screen and(max-width:450px) {
        html{
            font-size: 30%;
        }
        .heading{
            font-size: 2rem;
        }
        .products{
            max-width: 100%;
        }

        .box-container{
            max-width: 100%;
            margin-left:0px;
        }
    }

</style>
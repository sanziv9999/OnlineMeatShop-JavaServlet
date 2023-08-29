<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 4/5/2023
  Time: 11:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Dash</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <link rel="stylesheet" href="adminStyle.css">

</head>
<body>
<%@include file="Pages/adminNav.jsp"%>
<section class="dash" id="dash">
    <h1 class="heading">admin <span>dashboard</span></h1>
    <div class="box-container">
        <div class="box" id="users">
            <div class="image">
                <img src="" alt="">

            </div>
            <div class="content">
                <h3>${userCount}</h3>
                <h3>Users</h3>
            </div>
        </div>
        <div class="box" id="Category">
            <div class="image">
                <img src="" alt="">

            </div>
            <div class="content">
                <h3>${categoryCount}</h3>
                <h3>Categories</h3>
            </div>
        </div>
        <div class="box">
            <div class="image">
                <img src="" alt="">

            </div>
            <div class="content" id="products">
                <h3>${productCount}</h3>
                <h3>Product</h3>
            </div>
        </div>
        <div class="box" id="addCategory">
            <div class="image">
                <img src="" alt="">

            </div>
            <div class="content">

                <h3>Add Categories</h3>
            </div>
        </div>
        <div class="box" id="addProduct">
            <div class="image">
                <img src="" alt="">

            </div>
            <div class="content" >
               <h3>Add Product</h3>
            </div>
        </div>

    </div>

</section>

</body>

</html>
<script>
    const Prod=document.getElementById("addProduct");
    Prod.addEventListener("click", function (){
        window.location.href="user?page=addMeat"
    });
    const AddCategory=document.getElementById("addCategory");
    AddCategory.addEventListener("click", function (){
        window.location.href="user?page=addCategory"
    });
    const CategoryList=document.getElementById("Category");
    CategoryList.addEventListener("click", function (){
        window.location.href="user?page=categoryList"
    });
    const userList=document.getElementById("users");
    userList.addEventListener("click", function (){
        window.location.href="user?page=userList"
    });
    const productList=document.getElementById("products");
    productList.addEventListener("click", function (){
        window.location.href="user?page=productList"
    });



</script>

<style>
    :root{
        --primary:#E42217;
        --secondary:#fff;
    }
    *{
        margin:auto;
        font-family: Verdana, Geneva, Tahoma, sans-serif;
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
    .dash{
        padding-top: 10rem;
        max-width: 65%;

    }
    .heading{
        text-align: center;
        font-size: 4rem;
        color: #333;
        padding:1rem;
        margin: 2rem;
        background: rgba(234, 44, 44, 0.05);

    }

    .heading span{
        color:var(--primary);
    }


    .dash .box-container{
        max-width: 97%;

        display: flex;
        flex-wrap: wrap;
        gap: 1.5rem;
    }

    .dash .box-container .box{
        flex: 1 1 30rem;
        box-shadow: 0 .5rem 1.5rem rgba(0, 0, 0 , .1);
        border-radius: .5rem;
        border:.1rem solid rgba(0,0,0,.1);
        position: relative;
        transition: .5s;

    }
    .dash .box-container .box:hover{

        background: #e2e2e2;
    }

    .dash .box-container .box .image{
        position: relative;
        text-align: center;
        padding-top:2rem;
        overflow: hidden;
    }
    .dash .box-container .box .image img{
        height: 25rem;
    }


    .dash .box-container .box .content{
        padding:2rem;
        text-align: center;
    }

    .dash .box-container .box .content h3{
        font-size: 2.5rem;
        color: #333;
    }




    @media (max-width:991px){
        html{
            font-size: 55%;
        }
    }
    @media (max-width:450px) {
        html{
            font-size: 50%;
        }
        .heading{
            font-size: 3rem;
        }
    }
</style>


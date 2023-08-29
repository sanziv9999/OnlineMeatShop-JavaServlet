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
    <title>Contact</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <script src="script.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@include file="Pages/nav.jsp"%>
<div class="contact" id="contact">
    <h1 class="heading">contact <span>us</span></h1>
    <div class="row">
        <form action="user?page=contact" method="post">
            <input type="text" placeholder="name" class="box">
            <input type="email" placeholder="email" class="box">
            <input type="number" placeholder="number" class="box">
            <textarea name="" class="box" placeholder="message" id="" cols="30" rows="10">
            </textarea>
            <input type="submit" value="send message" class="btn">
        </form>
        <div class="image">
            <img src="" alt="">
        </div>



    </div>

</div>
</body>
</html>
<style>
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
        overflow: hidden;
    }
    .contact{
        padding-top: 10rem;
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


    .contact .row{
        display: flex;
        flex-wrap: wrap;
        gap: 1.5rem;
        align-items: center;
    }
    .contact .row form{
        flex: 1 1 40rem;
        padding:2rem 2.5rem;
        box-shadow: 0 .5rem 1.5rem rgba(0,0,0,.1);
        border: 1rem solid rgba(0,0,0,.1);
        border-radius: .5rem;
    }

    .contact .row .image{
        flex: 1 1 40rem;

    }
    .contact .row .image img{
        width: 100%;
        flex: 1 1 40rem;

    }

    .contact .row form .box{
        padding:1rem;
        font-size: 1.7rem;
        color: #333;
        text-transform: none;
        border:.1rem solid rgba(0,0,0,.1);
        border-radius:.5rem;
        margin: .7rem 0;
        width: 100%;

    }

    .contact .row form .box:focus{
        border-color: var(--primary);
    }

    .contact .row form textarea{
        height: 15rem;
        resize: none;
    }

    .btn{
        display: block;
        padding: 10px 20px;
        border: none;
        background-color: #E42217;
        color: white;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        margin-top: 30px;
    }
    .btn:hover {
        background-color: #E42217;
        transform: translateY(-2px);
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


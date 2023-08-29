<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 3/26/2023
  Time: 7:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>About</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <script src="script.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@include file="Pages/nav.jsp"%>
<section class="about" id="about">
    <h1 class="heading"><span> About </span> us </h1>
    <div class="row">
        <div class="video-container">
            <video src="" loop autoplay muted></video>
            <h3>Best Meat Seller</h3>
        </div>

        <div class="content">
            <h3>Why choose us?</h3>
            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nemo pariatur est sunt eos odio corrupti vitae quis in deleniti. Magni consectetur adipisci accusantium ducimus sunt animi possimus veritatis, quaerat voluptas.</p>
            <a href="#" class="btn">learn more</a>
        </div>

    </div>
</section>
<section class="icons-container">
    <div class="icons">
        <img src="" alt="" >
        <div class="info">
            <h3>free delivery</h3>
            <span>on all order</span>
        </div>
    </div>
    <div class="icons">
        <img src="" alt="" >
        <div class="info">
            <h3>10 days returns</h3>
            <span>moneyback guarantee</span>
        </div>
    </div>
    <div class="icons">
        <img src="" alt="" >
        <div class="info">
            <h3>offer & gifts</h3>
            <span>on all order</span>
        </div>
    </div>
    <div class="icons">
        <img src="" alt="" >
        <div class="info">
            <h3>secure payments</h3>
            <span>protected by paypal</span>
        </div>
    </div>
</section>
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
    .about{
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

    .about .row{
        display: flex;
        align-items: center;
        gap: 2rem;
        flex-wrap: wrap;
        padding: 2rem 0 3rem;
    }

    .about .row .video-container{
        flex: 1 1 40rem;
        position: relative;

    }

    .about .row .video-container video{
        width: 100%;
        border: 1.5rem solid #fff;
        border-radius: .5rem;
        box-shadow: 0 .5rem 1rem rgba(0, 0, 0, .1);
        height: 100%;
        object-fit: cover;
    }
    .about .row .video-container h3 {
        position: absolute;
        top:50%;
        transform: translateY(-50%);
        font-size: 3rem;
        background: #fff;
        width: 100%;
        padding:1rem 2rem;
        text-align: center;
        mix-blend-mode: screen;

    }



    .about .row .content{
        flex:1 1 40rem;
        padding: 3rem;

    }
    .about .row .content h3{
        font-size: 3rem;
        color: #333;
    }

    .about .row .content p{
        font-size: 1.5rem;
        color: #999;
        padding: .5rem 0;
        line-height: 1.5;
    }


    .btn{
        display: inline-block;
        margin-top: 1rem;
        border-radius: 0 0 2rem 0 ;
        border: #E42217 solid 1px;
        background:var(--secondary);
        color: var(--primary);
        padding: .9rem 3.5rem;
        cursor: pointer;
        font-size: 1.7rem;
        margin-right: 1rem;
    }
    .btn:hover{
        color:var(--secondary);
        background: var(--primary);
    }

    .icons-container{
        background: #eee;
        display: flex;
        flex-wrap: wrap;
        gap: 1.5rem;
        padding-top: 5rem;
        padding-bottom: 5rem;
    }

    .icons-container .icons{
        background: #fff;
        border:1rem solid rgba(0, 0, 0, 0.1);
        padding:2rem;
        display: flex;
        align-items: center;
        flex: 1 1 25rem;

    }
    .icons-container .icons img{
        height: 5rem;
        margin-right: 2rem;

    }
    .icons-container .icons h3{
        color:#333;
        padding-bottom: .5rem;
        font-size: 1.5rem;
    }

    .icons-container .icons span{
        color:#999;
        font-size: 1.3rem;
    }

    @media (max-width:991px){
        section{
            padding: 2rem;
        }

        .home{
            background-position: left;
        }
    }

    @media (max-width:768px) {
        .home .content h3{
            font-size: 5rem;
        }
        .home .content span{
            font-size: 2.5rem;
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


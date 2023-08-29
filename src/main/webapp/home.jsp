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
    <title>Home</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <script src="script.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
</head>
<body>
<%@include file="Pages/nav.jsp"%>
    <section class="home" id="home">
        <div class="content">
            <h3>Delicious Organic Meat</h3>
            <span>Enjoy Fresh Meat With<br>The Best Quality</span>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit voluptatibus aut quos reprehenderit, id dolores ex autem molestias! Nesciunt vel quidem assumenda dolorem corrupti ipsum voluptate in omnis nobis quisquam?</p>
            <a href="#" class="btn">shop now</a>
            <a href="#" class="btn1">view product</a>
        </div>
    </section>
<%@include file="Pages/footer.jsp"%>

</body>

</html>
<style>
    :root{
        --primary:#E42217;
        --secondary:#fff;
    }
    *{
        margin:0;
        padding: 0;
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
        overflow: auto;
    }

    .home{
        display: flex;
        align-items: center;
        min-height: 100vh;
        /*background: url('') no-repeat;*/
        background-size: cover;
        background-position: center;
    }

    .home .content{
        padding: 15rem;
        max-width: 50%;
    }

    .home .content h3{

        font-size: 6rem;
        color: #333;
    }
    .home .content span{
        font-size: 3.5rem;
        color: var(--primary);
        padding: 1rem 0;
        line-height: 1.5;
    }

    .home .content p{
        font-size: 1.5rem;
        color: #999;
        padding: 1rem 0;
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
    .btn1{
        display: inline-block;
        margin-top: 1rem;
        border-radius: 0 0 2rem 0 ;
        border: #E42217 solid 1px;
        background:var(--primary);
        color: var(--secondary);
        padding: .9rem 3.5rem;
        cursor: pointer;
        font-size: 1.7rem;
    }
    .btn1:hover{
        color:var(--primary);
        background: var(--secondary);


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
    }

</style>

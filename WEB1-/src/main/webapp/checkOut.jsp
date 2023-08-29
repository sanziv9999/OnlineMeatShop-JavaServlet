<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 4/11/2023
  Time: 3:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>cartItems</title>
</head>
<body>
<%@include file="Pages/nav.jsp"%>
<div class="container">
    <div class="box-container">
        <div class="box">
            <div class="cart-body">
        </div>


        </div>
    </div>
    <div class="box-container">
        <div class="box">
            <div class="orderForm">
                <form action="user?page=newUsers" method="post" class="form">
                    <h3 class="title">Your Details for Order</h3>

                    <div class="inputContainer">
                        <input type="email" name="email" class="input" placeholder="a" required>
                        <label for="" class="label">Email</label>
                    </div>

                    <div class="inputContainer">
                        <input type="text" name="name" class="input" placeholder="a" required>
                        <label for="" class="label">Name</label>
                    </div>
                    <div class="inputContainer">
                        <input type="text" name="phoneNo" class="input" placeholder="a" required>
                        <label for="" class="label">phoneNo</label>
                    </div>
                    <div class="inputContainer">
                        <input type="text" name="address" class="input" placeholder="a" required>
                        <label for="" class="label">Address</label>
                    </div>
                    <div class="butn">
                        <input type="submit" class="orderNow" value="Order Now">
                        <input type="submit" class="continue" value="Continue Shopping">
                    </div>

                </form>
            </div>
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
        overflow: scroll;
    }

    .butn{
        padding: 20px;
        display: flex;
        justify-content: space-between;

    }
    .container {
        padding-top: 15rem;
        display: flex;
        flex-direction: row;
        max-width: 65%;
        gap: 2rem;
    }

    .container .box-container{
        display: flex;
        flex-wrap: wrap;
        gap: 1.5rem;

    }

    .container .box-container .box {
        flex: 1 1 25rem;
        box-shadow: 0 .5rem 1.5rem rgba(0, 0, 0 , .1);
        border-radius: .5rem;
        border:.1rem solid rgba(0,0,0,.1);
        position: relative;
    }


    .orderForm {
        height: auto;
    }
    .form {
        background-color: white;
        width: 500px;
        border-radius: 8px;
        padding: 20px 40px;
        box-shadow: 0 10px 25px rgba(92, 99, 105, .2);
    }

    .title {
        padding: 20px;
        font-size: 50px;
        margin-bottom: 50px;
    }
    .inputContainer {
        position: relative;
        height: 45px;
        width: 90%;
        margin-bottom: 17px;
    }
    .input {
        position: absolute;
        top: 0px;
        left: 0px;
        height: 100%;
        width: 100%;
        border: 1px solid #DADCE0;
        border-radius: 7px;
        font-size: 16px;
        padding: 0 20px;
        outline: none;
        background: none;
        z-index: 1;
    }

    /* Hide the placeholder texts (a) */

    ::placeholder {
        color: transparent;
    }

    .label {
        position: absolute;
        top: 15px;
        left: 15px;
        padding: 0 4px;
        background-color: white;
        color: #DADCE0;
        font-size: 16px;
        transition: 0.5s;
        z-index: 0;
    }
    .orderNow {
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

    .orderNow:hover {
        background-color: #E42217;
        transform: translateY(-2px);
    }
    .continue{
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

    .continue:hover {
        background-color: #E42217;
        transform: translateY(-2px);
    }
    .input:focus + .label {
        top: -7px;
        left: 3px;
        z-index: 10;
        font-size: 14px;
        font-weight: 600;
        color: #E42217;
    }
    .input:focus {
        border: 2px solid #E42217;
    }
    .input:not(:placeholder-shown)+ .label {
        top: -7px;
        left: 3px;
        z-index: 10;
        font-size: 14px;
        font-weight: 600;
    }
    @media only screen and (max-width: 768px) {
        html {
            font-size: 50%;
        }

        .container {
            flex-direction: column;
            max-width: 100%;
        }

        .container .box-container {
            flex-direction: column;
        }

        .container .box-container .box {
            flex: 1 1 auto;
            margin-bottom: 2rem;
        }

        .form {
            width: 100%;
        }
    }

    /* For screens between 768px and 1024px wide */
    @media only screen and (min-width: 768px) and (max-width: 1024px) {
        html {
            font-size: 55%;
        }
    }

    /* For screens wider than 1024px */
    @media only screen and (min-width: 1024px) {
        html {
            font-size: 62.5%;
        }

        .container {
            max-width: 80%;
        }

        .container .box-container {
            flex-direction: row;
        }

        .container .box-container .box {
            flex: 1 1 25rem;
            margin-bottom: 0;
        }
    }

</style>


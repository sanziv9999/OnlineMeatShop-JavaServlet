<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
</head>
<body>

<%--<form class="login" method="post" action="user?page=login">--%>
<%--    <input class="con" type="text" name="userName" placeholder="Enter username"><br>--%>
<%--    <input class="con" type="password" name="password" placeholder="Enter password" ><br>--%>
<%--    <input class="con" type="submit" value="login">--%>

<%--    <a href="user?page=register">Register</a>--%>

<%--</form>--%>
<div class="LoginFrm">
    <form action="user?page=Login" method="post" class="form">
        <h1 class="title">Login</h1>

        <div class="inputContainer">
            <input type="text" name="userName" id="userName" class="input" placeholder="a">
            <label for="" class="label">Username</label>
        </div>

        <div class="inputContainer">
            <input type="password" class="input" name="password" id="password" placeholder="a">
            <i class="fa fa-eye" aria-hidden="true" type="button" id="eye"></i>
            <label for="" class="label">Password</label>
        </div>
        <div class="butn">
            <a class="registerBtn" href="user?page=register">Register</a>
            <input type="submit" class="submitBtn" value="Login" onclick="return validateForm()">
        </div>
    </form>
</div>

<script>
    function validateForm() {
        var username = document.getElementById('userName').value;
        var password = document.getElementById('password').value;

        if (username == "") {
            alert("Username must be filled out");
            return false;
        }

        if (password == "") {
            alert("Password must be filled out");
            return false;
        }

        return true;
    }

    var eye = document.getElementById("eye");

    // get the password input element
    var password = document.getElementById("password");

    // add a click event listener to the eye icon
    eye.addEventListener("click", function() {
        // toggle the type attribute of the password input
        if (password.type === "password") {
            password.type = "text";
        } else {
            password.type = "password";
        }

        // change the eye icon accordingly
        if (eye.classList.contains("fa-eye")) {
            eye.classList.remove("fa-eye");
            eye.classList.add("fa-eye-slash");
        } else {
            eye.classList.remove("fa-eye-slash");
            eye.classList.add("fa-eye");
        }
    });
</script>


<style>
    .butn{
        display: flex;
        align-content: space-between;
    }


    body {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        background-color: white;
        font-family: "lato", sans-serif;
    }

    .LoginFrm {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .form {
        background-color: white;
        width: 400px;
        border-radius: 8px;
        padding: 20px 40px;
        box-shadow: 0 10px 25px rgba(92, 99, 105, .2);
    }

    .title {
        font-size: 50px;
        margin-bottom: 50px;
    }
    .inputContainer {
        position: relative;
        height: 45px;
        width: 90%;
        margin-bottom: 17px;
    }


    .inputContainer #eye {
        position: absolute;
        top: 15px; /* adjust the top value to align it with the input field */
        right: 1px; /* adjust the right value to position it on the right side */
        cursor: pointer;
        z-index: 1;
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
    .submitBtn {

        margin-left: auto;
        padding: 15px 30px;
        border: none;
        background-color: #E42217;
        color: white;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        margin-top: 30px;
    }


    .submitBtn:hover {
        background-color: #E42217;
        transform: translateY(-2px);
    }
    .registerBtn {
        text-decoration: none;

        margin-right: auto;
        padding: 15px 30px;
        border: none;
        background-color: #E42217;
        color: white;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        margin-top: 30px;
    }
    .registerBtn:hover {
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
</style>
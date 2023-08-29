<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 3/28/2023
  Time: 7:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Security Questions</title>
</head>
<body>
    <div class="SecurityQn" >
        <form action="user?page=security" method="post" class="form">
            <h1 class="title">Survey Question</h1>

            <span>What is your nickname?</span><br>
            <div class="inputContainer">
            <input type="text" placeholder="Enter answer" name="nickName" class="input" required>
            </div><br>
            <span>What is pet name?</span><br>
            <div class="inputContainer">
            <input type="text" placeholder="Enter answer" name="petName" class="input" required>
            </div><br>
            <span>What is your favourite book?</span><br>
            <div class="inputContainer">
            <input type="text" placeholder="Enter answer" name="bookName" class="input" required>
            </div><br>
            <span>What is your favourite movie?</span><br>
            <div class="inputContainer">
            <input type="text" placeholder="Enter answer" name="movieName" class="input" required>
            </div><br>
            <input type="submit" class="finishBtn" value="Finish">
        </form>
    </div>
</body>
</html>
<style>
    body {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        background-color: white;
        font-family: "lato", sans-serif;
    }

    .SecurityQn {
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

    .finishBtn{
        display: block;
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

    .finishBtn:hover {
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
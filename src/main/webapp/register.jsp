<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 2/24/2023
  Time: 9:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="signupFrm">
  <form action="user?page=newUsers" method="post" class="form">
    <h1 class="title">Sign up</h1>

    <div class="inputContainer">
      <input type="text" name="userName" id="userName" class="input" placeholder="a">
      <label for="" class="label">Username</label>
    </div>
    <div class="inputContainer">
      <input type="email" name="email" id="email" class="input" placeholder="a">
      <label for="" class="label">Email</label>
    </div>

    <div class="inputContainer">
      <input type="password" class="input" id="password"  name="password" placeholder="a" pattern="(?=.*\d)(?=.*[A-Z]).{8,}" title="Must contain at least one number, one uppercase and at least 8 characters">
      <label for="" class="label">Password</label>
    </div>

    <div class="inputContainer">
      <input type="text" class="input"  id="phoneNo" name="phoneNo"  placeholder="a">
      <label for="" class="label">Phone No</label>
    </div>

    <div class="inputContainer">
      <input type="text" name="address" id="address" class="input" placeholder="a">
      <label for="" class="label">Address</label>
    </div>

    <input type="submit" class="submitBtn" value="Sign up" onclick="return validateForm()">
  <br>
    <a class="alr" href="user?page=index" >Already a member? Back to log in:</a>

  </form>
</div>
</body>
</html>
<script>
  function validateForm() {
    var username = document.getElementById('userName').value;
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
    var phoneNo = document.getElementById('phoneNo').value;
    var address = document.getElementById('address').value;

    if (username == "") {
      alert("Please enter your username.");
      return false;
    }

    if (email == "") {
      alert("Please enter your email.");
      return false;
    }

    if (password == "") {
      alert("Please enter your password.");
      return false;
    }

    if (phoneNo == "") {
      alert("Please enter your phone number.");
      return false;
    }else if (!/^[9][8]\d{8}$/.test(phoneNo)) {
      alert("Please enter a valid phone number starting with 98 and containing 10 digits.");
      return false;
    }

    if (address == "") {
      alert("Please enter your address.");
      return false;
    }

    return true;
  }
</script>


<style>

  body {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    background-color: white;
    font-family: "lato", sans-serif;
  }

  .signupFrm {
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
    display: block;
    /*margin-left: auto;*/
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
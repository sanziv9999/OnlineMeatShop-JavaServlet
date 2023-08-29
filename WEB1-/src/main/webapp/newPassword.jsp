<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 4/25/2023
  Time: 8:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>New Password</title>
  <%@include file="Pages/commonCssJs.jsp"%>
</head>
<body>
<%@include file="Pages/newNav.jsp"%>
<div class="container">
  <div class="row">
    <div class="col-md-6 offset-md-3">
      <div class="card mt-5">

        <div class="card-header custom-bg text-white">
          <h3>New Password</h3>
        </div>
        <div class="card-body">
          <%@include file="message.jsp"%>
          <form action="user?page=changePassword" method="post">
            <div class="mb-3">
              <input type="hidden" class="form-control" name="email" id="email"  value="${sessionScope.email}" required>
            </div>
            <div class="mb-3">
              <label for="newPassword" class="form-label">New Password</label>
              <input type="password" class="form-control" name="password" id="newPassword" placeholder="Enter here..." pattern="(?=.*\d)(?=.*[A-Z]).{8,}" title="Must contain at least one number, one uppercase and at least 8 characters" required >
            </div>

            <div class="mb-3">
              <label for="confirmPassword" class="form-label">Confirm Password</label>
              <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Enter here..." pattern="(?=.*\d)(?=.*[A-Z]).{8,}" title="Must contain at least one number, one uppercase and at least 8 characters" required>
            </div>



            <div class="container text-center">
              <button type="submit" class="btn custom-bg text-white" onclick="return validateForm()"> Change Password </button>
              <button type="reset" class="btn custom-bg text-white"> Reset </button>

            </div>

          </form>
        </div>


      </div>
    </div>
  </div>
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
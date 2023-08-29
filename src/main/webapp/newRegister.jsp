<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 4/22/2023
  Time: 10:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <%@include file="Pages/commonCssJs.jsp"%>
</head>
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

<body>
<%@include file="Pages/newNav.jsp"%>
<div class="container-fluid">
    <div class="row mt-5">
    <div class="col-md-4 offset-md-4">
        <div class="card">
            <%@include file="message.jsp"%>
            <div class="card-body px-5">
                <h3 class="text-center my-3">Sign up here!!</h3>
                <form action="user?page=newUsers" method="post">
                    <div class="mb-3">
                        <label for="userName" class="form-label">Name</label>
                        <input type="text" class="form-control" name="userName" id="userName" placeholder="Enter here...">
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" id="password" placeholder="Enter here..." pattern="(?=.*\d)(?=.*[A-Z]).{8,}" title="Must contain at least one number, one uppercase and at least 8 characters">
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="text" class="form-control" name="email" id="email" placeholder="abc@gmail.com">
                    </div>

                    <div class="mb-3">
                        <label for="phoneNo" class="form-label">Phone</label>
                        <input type="text" class="form-control" name="phoneNo" id="phoneNo" placeholder="+977 98...">
                    </div>

                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" class="form-control" name="address" id="address" placeholder="Enter here...">
                    </div>

                    <div class="mb-3">
                        <label for="favTeacher" class="form-label">Who was you childhood favourite teacher?</label>
                        <input type="text" class="form-control" name="favTeacher" id="favTeacher" placeholder="Enter here..." required>
                    </div>


                    <div class="mb-3">
                        <label for="firstMovie" class="form-label">What was your first movie on theater?</label>

                        <input type="text" class="form-control" name="firstMovie" id="firstMovie" placeholder="Enter here..." required>
                    </div>


                    <a href="user?page=newLogin" class="text-center d-block mb-3">Already a member, Login</a>

                    <div class="container text-center">
                        <button class="btn btn-outline-success" type="submit" onclick="return validateForm()">Register</button>
                        <button class="btn btn-outline-warning" type="reset">Reset</button>

                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
</div>

</body>
</html>


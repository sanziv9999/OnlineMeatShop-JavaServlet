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
    <title>Login Page</title>
    <%@include file="Pages/commonCssJs.jsp"%>
</head>
<body>
<%@include file="Pages/newNav.jsp"%>
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card mt-5">

                    <div class="card-header custom-bg text-white">
                        <h3>Login here</h3>
                    </div>
                    <div class="card-body">
                        <%@include file="message.jsp"%>
                        <form action="user?page=Login" method="post">
                            <div class="mb-3">
                                <label for="userName" class="form-label">Name</label>
                                <input type="text" class="form-control" name="userName" id="userName" placeholder="Enter here...">
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" name="password" id="password" placeholder="Enter here...">
                            </div>
                            <a href="user?page=newRegister" class="text-center d-block mb-3">if not registered click here</a>
                            <a href="user?page=forgetPassword" class="text-center d-block mb-3">forget password?</a>

                            <div class="container text-center">
                                <button type="submit" class="btn custom-bg text-white" onclick="return validateForm()"> Login </button>
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
</script>

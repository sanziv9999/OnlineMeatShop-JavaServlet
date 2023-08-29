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
  <title>Reset Password</title>
  <%@include file="Pages/commonCssJs.jsp"%>
</head>
<body>
<%@include file="Pages/newNav.jsp"%>
<div class="container">
  <div class="row">
    <div class="col-md-6 offset-md-3">
      <div class="card mt-5">

        <div class="card-header custom-bg text-white">
          <h3>Security Question</h3>
        </div>
        <div class="card-body">
          <%@include file="message.jsp"%>
          <form action="user?page=passwordReset" method="post">
            <div class="mb-3">
              <label for="email" class="form-label">Email</label>
              <input type="text" class="form-control" name="email" id="email" placeholder="Enter here..." required>
            </div>

            <div class="mb-3">
              <label for="favTeacher" class="form-label">Who was you childhood favourite teacher?</label>
              <input type="text" class="form-control" name="favTeacher" id="favTeacher" placeholder="Enter here..." required>
            </div>

            <div class="mb-3">
              <label for="firstMovie" class="form-label">What was your first movie on theater?</label>

              <input type="text" class="form-control" name="firstMovie" id="firstMovie" placeholder="Enter here..." required>
            </div>

            <div class="container text-center">
              <button type="submit" class="btn custom-bg text-white"> Submit </button>
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

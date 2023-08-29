<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 4/6/2023
  Time: 5:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Footer</title>
</head>
<body>
<footer>
  <div class="box-container">
    <div class="box">
      <h3>quick links</h3>

      <a href="#">home</a>

      <a href="#">about</a>

      <a href="#">products</a>

      <a href="#">review</a>

      <a href="#">contact</a>
    </div>
    <div class="box">
      <h3>extra links</h3>

      <a href="#">my account</a>

      <a href="#">my order</a>

      <a href="#">my favourite</a>

    </div>

    <div class="box">
      <h3>locations</h3>

      <a href="#">Kathmandu</a>

      <a href="#">Lalitpur</a>

      <a href="#">Bhaktapur</a>

    </div>

    <div class="box">
      <h3>contact info</h3>

      <a href="#">+977 9860357512</a>

      <a href="#">sanzivmagat80@gmail.com</a>

      <a href="#">Lalitpur</a>

      <img src="" alt="">
    </div>

  </div>

  <div class="credit">created by <span>sanjeev magar</span>| all rights reserved</div>
</footer>

</body>
</html>

<style>
  footer .box-container{
    display: flex;
    flex-wrap: wrap;
    gap:1.5rem;

  }

  footer .box-container .box{
    flex: 1 1 25rem;

  }
  footer .box-container .box h3{
    color: #333;
    font-size: 2.5rem;
    padding:1rem 0;
  }
  footer .box-container .box a{
    display: block;
    color: #666;
    font-size: 1.5rem;
    padding:1rem 0;
  }

  footer .box-container .box a:hover{
    color: var(--primary);
    text-decoration: underline;
  }

  footer .box-container .box img{
    margin-top:1rem;

  }

  footer .credit{
    text-align: center;
    margin-top:1.5rem;
    padding: 2.5rem 1.5rem 1.5rem;
    font-size: 2rem;
    color: #333;
    border-top: .1rem solid rgba(0,0,0,.1);

  }

  footer .credit span{
    color: var(--primary);
  }


</style>

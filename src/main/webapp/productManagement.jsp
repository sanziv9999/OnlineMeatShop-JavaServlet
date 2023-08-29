<%--
  Created by IntelliJ IDEA.
  User: lazy
  Date: 4/5/2023
  Time: 11:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>Products Management</title>
</head>
<body>
<div class="productManagement">
    <form action="user?page=newProducts" method="post" enctype="multipart/form-data" class="form">
        <h1 class="title">Product Details</h1>

        <div class="inputContainer">
            <input type="text" name="name" class="input" placeholder="a" required>
            <label for="" class="label">Name</label>
        </div>
        <div class="inputContainer">
            <input type="text" class="input" name="description" placeholder="a" required>
            <label for="" class="label">Description</label>
        </div>

        <div class="inputContainer">
            <input type="number" class="input" name="price" placeholder="a" required>
            <label for="" class="label">Price</label>
        </div>
        <div class="inputContainer">
            <input type="numebr" class="input" name="discount" placeholder="a" required>
            <label for="" class="label">Discount</label>
        </div>
        <div class="inputContainer">
            <input type="number" class="input" name="quantity" placeholder="a" required>
            <label for="" class="label">Quantity</label>
        </div>

        <div class="inputContainer">

            <select id="categories" name="categories">
                <option value="-1" >Select Category</option>
                <c:forEach  items="${categoryList}" var="product">

                    <option value="${product.categoryId}">${product.categoryTitle}</option>
                </c:forEach>
            </select>
        </div>
        <div class="proImg">
            <label>Select picture of product </label><br>
            <input type="file" name="image" placeholder="a" required>
        </div>

        <input type="submit" class="submitBtn" value="Add Product">
        <br>
        <br>
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

    .productManagement {
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
    .proImg{
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
    select{
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


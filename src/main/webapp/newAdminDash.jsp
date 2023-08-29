<%--<%@ page import="Model.College" %>--%>

<%--<%--%>
<%-- College  userName =(College) session.getAttribute("userName");--%>
<%-- if(userName.getUserName()==null){--%>
<%--     session.setAttribute("message", "You are not logged in !! Login first");--%>
<%--     response.sendRedirect("newLogin.jsp");--%>
<%--    return;--%>
<%-- }else {--%>
<%--     if(userName.getRole().equals("normal")){--%>
<%--         session.setAttribute("message", "You are not admin !! Do not access this page");--%>
<%--         response.sendRedirect("newLogin.jsp");--%>
<%--         return;--%>
<%--     }--%>
<%-- }--%>
<%--%>--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Dash</title>

    <%@include file="Pages/commonCssJs.jsp"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


</head>
<body>
<%@include file="Pages/newNav.jsp"%>
<div class="container admin">
    <div class="row mt-3">

    <div class="col-md-4">
        <div class="card" id="user">
            <div class="card-body text-center">

                <div class="container">
                    <img style="max-width: 125px" class="img-fluid rounded-circle" src="assets/user.png" alt="">
                </div>

                <h1>${userCount}</h1>
                <h1 class="text-uppercase text-muted">Users</h1>
            </div>
        </div>

    </div>

    <div class="col-md-4">
        <div class="card" id="category">
            <div class="card-body text-center">
                <div class="container">
                    <img style="max-width: 125px" class="img-fluid rounded-circle" src="assets/category.png" alt="">
                </div>
                <h1>${categoryCount}</h1>
                <h1 class="text-uppercase text-muted">Categories</h1>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card" id="product">
            <div class="card-body text-center">
                <div class="container">
                    <img style="max-width: 125px" class="img-fluid rounded-circle" src="assets/prosuct.jpg" alt="">
                </div>
                <h1>${productCount}</h1>
                <h1 class="text-uppercase text-muted">Products</h1>
            </div>
        </div>
    </div>
    </div>

    <div class="row mt-3">
        <div class="col-md-6">
            <div class="card" data-toggle="modal" data-target="#addCategory-modal">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px" class="img-fluid rounded-circle" src="assets/addCategory.png" alt="">
                    </div>
                    <h1></h1>
                    <h1 class="text-uppercase text-muted">Add Category</h1>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card" data-toggle="modal" data-target="#addProduct-modal">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px" class="img-fluid rounded-circle" src="assets/add.jpg" alt="">
                    </div>
                    <h1></h1>
                    <h1 class="text-uppercase text-muted">Add Product</h1>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- Modal -->
<div class="modal fade" id="addCategory-modal" tabindex="-1" aria-labelledby="addCategorylLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header custom-bg text-white">
                <h5 class="modal-title" id="addCategoryLabel">Add Category</h5>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="user?page=newCategory">
                    <div class="form-group">
                        <label for="categoryTitle" class="form-label">Category Title</label>
                        <input type="text" class="form-control" name="categoryTitle" id="categoryTitle" placeholder="Enter category title" required>
                    </div>
                    <div class="form-group">
                        <label for="categoryDescription" class="form-label">Category Description</label>
                        <textarea style="height: 250px" class="form-control" id="categoryDescription" placeholder="Enter category description" name="categoryDescription" required></textarea>
                    </div>
                    <div class="container text-center">
                        <button class="btn btn-outline-success" type="submit">Add Category</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="addProduct-modal" tabindex="-1" aria-labelledby="addProductLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header custom-bg text-white">
                <h5 class="modal-title" id="addProductLabel">Add Product</h5>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="user?page=newProducts" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="productName" class="form-label">Product Name</label>
                        <input type="text" class="form-control" name="name" id="productName" placeholder="Enter product title" required>
                    </div>
                    <div class="form-group">
                        <label for="description" class="form-label">Product Description</label>
                        <textarea style="height: 150px" class="form-control" id="description" placeholder="Enter product description" name="description" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="price" class="form-label">Price</label>
                        <input type="number" class="form-control" name="price" id="price" placeholder="Enter a price" required>
                    </div>
                    <div class="form-group">
                        <label for="discount" class="form-label">Discount</label>
                        <input type="number" class="form-control" name="discount" id="discount" placeholder="Enter a discount" required>
                    </div>
                    <div class="form-group">
                        <label for="quantity" class="form-label">Quantity</label>
                        <input type="number" class="form-control" name="quantity" id="quantity" placeholder="Enter a quantity" required>
                    </div>
                    <div class="form-group">
                        <label for="categories">Category</label><br>
                        <select id="categories" class="form-control" name="categories">
                            <option value="-1" >Select Category</option>
                            <c:forEach  items="${categoryList}" var="product">

                                <option value="${product.categoryId}">${product.categoryTitle}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="picture" class="form-label">Select Picture of Product</label><br>
                        <input type="file" id="picture" name="image" class="from-control" required>
                    </div>

                    <div class="container text-center">
                        <button class="btn btn-outline-success" type="submit">Add Product</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
<style>
    .admin .card{
        border: 1px solid #676767;

    }


    .admin .card:hover{
        cursor: pointer;
        background: #e2e2e2;
    }
</style>

<script>
    const CategoryList=document.getElementById("category");
    CategoryList.addEventListener("click", function (){
        window.location.href="user?page=categoryList"
    });
    const productList=document.getElementById("product");
    productList.addEventListener("click", function (){
        window.location.href="user?page=productList"
    });
    const userList=document.getElementById("user");
    userList.addEventListener("click", function (){
        window.location.href="user?page=userList"
    });
</script>

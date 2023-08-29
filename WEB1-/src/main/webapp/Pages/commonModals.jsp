<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Modal -->

<div class="modal fade" id="cart" tabindex="-1" aria-labelledby="cartLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header  custom-bg text-white">
                <h5 class="modal-title" id="cartLabel">My Cart</h5>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
<%--                        <div class="cart-body">--%>
                <div class="container">
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <table class="table">
                                <thead class="table custom-bg text-white">
                                <tr>
                                    <th scope="col">Product Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Discount</th>


                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${cartList}" var="product">

                                    <tr>
                                        <td>${product.name}</td>
                                        <td>${product.price}</td>
                                        <td>${product.quantity}</td>
                                        <td>${product.discount}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary checkout"><a href="user?page=newCheckout" class="text-white" style="text-decoration: none">Checkout</a> </button>
            </div>
        </div>
    </div>
</div>

<%@page import="tea.items.ItemDTO"%>
<%@page import="tea.items.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/client/assets" var="url"/>
<!-- Start header section -->
<jsp:include page = "./header/mainHeader.jsp" flush = "true" />
<!-- / header section -->

<!--  content -->
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
    <img src="${pageContext.request.contextPath}/client/assets/images/banner/banner.jpg" alt="banner giỏ hàng" width="1903" height="400">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>Giỏ hàng</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/home">Trang chủ </a></li>
                    <li style="color:#fff">Thông tin giỏ hàng</li>
                </ol>
            </div>
        </div>
    </div>
    <div class="" style="z-index: 1000;width: 300px;float: right;display: flex;justify-content: center;align-items: center;
         right: 21px;
         position: fixed; top: 300px">
        <c:if test="${requestScope.CART!=null}">
            <c:if test="${requestScope.SUCCESS!=null}">
                <div class="alert alert-info" role="alert">
                    <b>${requestScope.SUCCESS}</b>
                </div>
            </c:if>
            <c:if test="${requestScope.FAIL!=null}">
                <div class="alert alert-danger" role="alert">
                    <b>${requestScope.FAIL}</b>
                </div>
            </c:if>
        </c:if>
    </div>
</section>
<!-- / catg header banner section -->

<!-- Cart view section -->
<section id="cart-view">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="cart-view-area">
                    <div class="cart-view-table">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Image</th>
                                        <th>Product</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Discount</th>
                                        <th>Total</th>
                                        <th>Delete</th>
                                        <th>Edit</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var = "total" scope = "page" value = "${0}"/>
                                    <c:set var = "price" scope = "page" value = "${0}"/>
                                    <c:set var = "discount" scope = "page" value = "${0}"/>
                                    <c:forEach items="${sessionScope.CART.cart.values()}" var="item">
                                    <c:set var = "price" scope = "page" value = "${item.price}"/>
                                    <c:set var = "discount" scope = "page" value = "${item.product.productDiscount}"/>
                                    <c:set var = "discount" scope = "page" value = "${pageScope.discount/100}"/>
                                    <c:set var = "price" scope = "page" value = "${pageScope.price*item.quantity*(1-pageScope.discount)}"/>
                                    <c:set var = "total" scope = "page" value = "${pageScope.total+pageScope.price}"/>
                                    <form action="MainController">
                                        <input type="hidden" name="pID" value="${item.product.productID}">
                                        <tr>
                                            <td><a href="#"><img src="${item.product.productImg}" alt="img"></a></td>
                                            <td><a class="aa-cart-title" href="MainController?action=Product-detail">${item.product.productName}</a></td>
                                            <td>${Double.valueOf(item.price).intValue()}</td>
                                            <td><input class="aa-cart-quantity" type="number" value="${item.quantity}" name="quantity" min="1"></td>
                                            <td>${item.product.productDiscount}%</td>
                                            <td>${Double.valueOf(pageScope.price).intValue()}</td>
                                            <td>
                                                <button type="submit" name="action" value="Delete-Item" style="border: none; color: red; background-color: transparent;">
                                                    <fa class="fa fa-close"></fa>
                                                </button>
                                            </td>
                                            <td>
                                                <button type="submit" name="action" value="Edit-Item" style="border: none; color: red; background-color: transparent;">
                                                    <i class="fa fa-pencil" aria-hidden="true"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </form>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- Cart Total view -->
                        <form action="MainController" method="get">
                            <div class="cart-view-total" style="display: flex; flex-direction: column; justify-content: center; align-items: center">
                                <h4>Cart Totals</h4>
                                <table class="aa-totals-table">
                                    <tbody>
                                        <tr>
                                            <th>Subtotal</th>
                                            <td>${Double.valueOf(pageScope.total).intValue()}</td>
                                        </tr>
                                        <tr>
                                            <th>TAX</th>
                                            <td>10%</td>
                                        </tr>
                                        <tr>
                                            <th>Total</th>
                                            <td>${Double.valueOf(Math.ceil(pageScope.total*1.1*10.0)/10.0).intValue()}</td>
                                        </tr>
                                    </tbody>
                                </table> 
                                <div class="text-center" style="margin-top: 10px">
                                    <input type="submit" class="aa-cart-view-btn" name="action" value="Checkout">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Cart view section -->

<!--  end content-->

<!--  footer-->
<jsp:include page = "./footer/footer.jsp" flush = "true" />
<!-- end footer-->


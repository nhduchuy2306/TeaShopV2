<%@page import="tea.items.ItemDTO"%>
<%@page import="tea.items.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/client/assets" var="url"/>
<div class="aa-header-bottom">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-header-bottom-area">
                    <!-- logo  -->
                    <div class="aa-logo">
                        <a href="${pageContext.request.contextPath}/MainController?action=Home">
                            <img src="${url}/images/logoAndSomeimg/logo1.jpg" style="height: 120px;" alt="logo img" width="100%">
                        </a> 
                    </div>
                    <!-- / logo  -->
                    <!-- Shipping service -->
                    <div class="aa-shipping-box">
                        <a class="aa-shipping-boxsmall">
                            <span class="aa-shipping-boxsmall-icon fas fa-shipping-fast"></span>
                            <span class="aa-shipping-box-text">
                                <div class="aa-shipping-title">Miễn phí vận chuyển</div>
                                <div class="">Khu vực TP HCM</div>
                            </span>

                        </a>
                        <a class="aa-shipping-boxsmall">
                            <span class="aa-shipping-boxsmall-icon fas fa-phone"></span>
                            <span class="aa-shipping-box-text">
                                <div class="aa-shipping-title">Hỗ trợ: 012.3456.789</div>
                                <div class="">Tư vấn 24/7 miễn phí</div>
                            </span>
                        </a>
                        <a class="aa-shipping-boxsmall">
                            <span class="aa-shipping-boxsmall-icon fas fa-shipping-fast"></span>
                            <span class="aa-shipping-box-text">
                                <div class="aa-shipping-title">Giao hàng toàn quốc</div>
                                <div class="">Đảm bảo uy tín, chất lượng</div>
                            </span>
                        </a>
                    </div>
                    <!-- cart box -->
                    <div class="aa-cartbox">
                        <a class="aa-cart-link" href="MainController?action=Cart">
                            <span class="fas fa-cart-arrow-down"></span>
                            <span class="aa-cart-title">GIỎ HÀNG</span>
                            <c:if test="${sessionScope.CART!=null}">
                            <span class="aa-cart-notify">${sessionScope.CART.cart.size()}</span>
                            </c:if>
                        </a>
                        <div class="aa-cartbox-summary">
                            <ul class="scroll-product">
                                <c:set var = "total" scope = "page" value = "${0}"/>
                                <c:set var = "price" scope = "page" value = "${0}"/>
                                <c:set var = "discount" scope = "page" value = "${0}"/>
                                <c:forEach items="${sessionScope.CART.cart.values()}" var="item">
                                    <c:set var = "price" scope = "page" value = "${item.price}"/>
                                    <c:set var = "discount" scope = "page" value = "${item.product.productDiscount}"/>
                                    <c:set var = "discount" scope = "page" value = "${pageScope.discount/100}"/>
                                    <c:set var = "price" scope = "page" value = "${pageScope.price*item.quantity*(1-pageScope.discount)}"/>
                                    <c:set var = "total" scope = "page" value = "${pageScope.total+pageScope.price}"/>
                                    <li>
                                        <a class="aa-cartbox-img" href="${pageContext.request.contextPath}/MainController?action=Cart">
                                            <img src="${item.product.productImg}" alt="img">
                                        </a>
                                        <div class="aa-cartbox-info">
                                            <h4><a href="${pageContext.request.contextPath}/MainController?action=Cart">${item.product.productName}</a></h4>
                                            <p>${item.quantity} x ${Double.parseDouble(item.price * (1 - pageScope.discount)).intValue()} VNĐ</p>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                            <div class="total-detailproduct">
                                <span class="aa-cartbox-total-title">
                                    <b>Tổng:</b>
                                </span>
                                <span class="aa-cartbox-total-price">
                                    ${Double.parseDouble(pageScope.total).intValue()}VNĐ
                                </span>
                            </div>
                            <a class="aa-cartbox-checkout aa-primary-btn" href="${pageContext.request.contextPath}/MainController?action=Cart">Chi tiết</a>
                            <a class="aa-cartbox-checkout aa-primary-btn" href="${pageContext.request.contextPath}/MainController?action=Checkout">Thanh toán</a>
                        </div>
                    </div>
                    <!-- / cart box -->
                </div>
            </div>
        </div>
    </div>
</div>


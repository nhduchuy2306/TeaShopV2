<%@page import="tea.items.ItemDTO"%>
<%@page import="tea.items.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/client/assets" var="url"/>

<!-- Start header section -->
<jsp:include page = "./header/mainHeader.jsp" flush = "true" />
<!-- / header section -->
<style>
    .modal-confirm {		
        color: #636363;
        width: 325px;
        font-size: 14px;
    }
    .modal-confirm .modal-content {
        padding: 20px;
        border-radius: 5px;
        border: none;
    }
    .modal-confirm .modal-header {
        border-bottom: none;   
        position: relative;
    }
    .modal-confirm h4 {
        text-align: center;
        font-size: 26px;
        margin: 30px 0 -15px;
    }
    .modal-confirm .form-control, .modal-confirm .btn {
        min-height: 40px;
        border-radius: 3px; 
    }
    .modal-confirm .close {
        position: absolute;
        top: -5px;
        right: -5px;
    }	
    .modal-confirm .modal-footer {
        border: none;
        text-align: center;
        border-radius: 5px;
        font-size: 13px;
    }	
    .modal-confirm .icon-box {
        color: #fff;		
        position: absolute;
        margin: 0 auto;
        left: 0;
        right: 0;
        top: -70px;
        width: 95px;
        height: 95px;
        border-radius: 50%;
        z-index: 9;
        background: #82ce34;
        padding: 15px;
        text-align: center;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
    }
    .modal-confirm .icon-box i {
        font-size: 58px;
        position: relative;
        top: 3px;
    }
    .modal-confirm.modal-dialog {
        margin-top: 80px;
    }
    .modal-confirm .btn {
        color: #fff;
        border-radius: 4px;
        background: #82ce34;
        text-decoration: none;
        transition: all 0.4s;
        line-height: normal;
        border: none;
    }
    .modal-confirm .btn:hover, .modal-confirm .btn:focus {
        background: #6fb32b;
        outline: none;
    }
</style>
<!--  content -->
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
    <img src="${pageContext.request.contextPath}/client/assets/images/banner/banner.jpg" alt="banner thanh toán" height="400" width="1903" >
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>Thanh toán</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
                    <li style="color:#fff">Thông tin thanh toán</li>
                </ol>
            </div>
        </div>
    </div>
</section>
<!-- / catg header banner section -->

<!-- Cart view section -->
<section id="checkout">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <c:if test="${requestScope.ERROR!=null}">
                    <div class="alert alert-danger text-center" role="alert">
                        <h1>${requestScope.ERROR}</h1>
                    </div>
                </c:if>
                <div class="checkout-area">
                    <form action="MainController" method="get">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="checkout-left">
                                    <div class="panel-group" >
                                        <c:if test="${sessionScope.USER_LOGIN == null}">
                                            <p> Bạn cần đăng nhập để thanh toán! Đăng nhập 
                                                <a href="${pageContext.request.contextPath}/client/login.jsp" style="color: #754110">tại đây!</a></p>
                                            </c:if>
                                            <c:if test="${sessionScope.USER_LOGIN != null}">
                                            <!-- Shipping Address -->
                                            <div class="panel panel-default aa-checkout-billaddress">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title" style="color:#754110">
                                                        Địa chỉ giao hàng
                                                    </h4>
                                                </div>
                                                <div id="collapseFour">
                                                    <div class="panel-body">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="aa-checkout-single-bill">
                                                                    <input type="text" placeholder="Họ Tên*" value="${sessionScope.USER_LOGIN.name}" required="required" name="transaction_name">
                                                                </div>                             
                                                            </div>
                                                        </div> 
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="aa-checkout-single-bill">
                                                                    <input type="email" placeholder="Email*" value="${sessionScope.USER_LOGIN.email}" required="required" name="transaction_email">
                                                                </div>                             
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="aa-checkout-single-bill">
                                                                    <input type="tel" placeholder="Số điện thoại*" value="${sessionScope.USER_LOGIN.phone}"  required="required" name="transaction_phone">
                                                                </div>
                                                            </div>
                                                        </div> 
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="aa-checkout-single-bill">
                                                                    <textarea cols="8" rows="3" required="required" placeholder="Địa chỉ*" name="transaction_address">${sessionScope.USER_LOGIN.address}</textarea>
                                                                </div>                             
                                                            </div>                            
                                                        </div> 
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="aa-checkout-single-bill">
                                                                    <input type="date" placeholder="date" value="<%=String.valueOf(java.time.LocalDate.now())%>" name="transaction_created" id="the-date" style="display: none">             
                                                                </div>                             
                                                            </div>                            
                                                        </div>             
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="checkout-right">
                                    <h4>Thông tin đơn hàng</h4>
                                    <div class="aa-order-summary-area">
                                        <table class="table table-responsive">
                                            <thead>
                                                <tr>
                                                    <th>Sản phẩm</th>
                                                    <th>Số tiền</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var = "total" scope = "page" value = "${0}"/>
                                                <c:set var = "price" scope = "page" value = "${0}"/>
                                                <c:set var = "discount" scope = "page" value = "${0}"/>
                                                <c:set var = "exchangerate" scope="page" value = "${23251}" />
                                                <c:forEach items="${sessionScope.CART.cart.values()}" var="item">
                                                    <c:set var = "price" scope = "page" value = "${item.price}"/>
                                                    <c:set var = "discount" scope = "page" value = "${item.product.productDiscount}"/>
                                                    <c:set var = "discount" scope = "page" value = "${pageScope.discount/100}"/>
                                                    <c:set var = "price" scope = "page" value = "${pageScope.price*item.quantity*(1-pageScope.discount)}"/>
                                                    <c:set var = "total" scope = "page" value = "${pageScope.total+pageScope.price}"/>
                                                    <tr>
                                                        <td>${item.product.productName} <strong> x ${item.quantity} </strong></td>
                                                        <td>${Double.valueOf(pageScope.price).intValue()} VNĐ</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th>Tạm tính</th>
                                                    <td>${Double.valueOf(pageScope.total).intValue()} VNĐ</td>
                                                </tr>
                                                <tr>
                                                    <th>Thuế</th>
                                                    <td>10%</td>
                                                </tr>
                                                <tr>
                                                    <th>Tổng cộng</th>
                                                    <td><strong> ${Double.valueOf(pageScope.total*1.1).intValue()} VNĐ</strong></td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>

                                    <h4>Hình thức thanh toán</h4>
                                    <div class="aa-payment-method">     

                                        <label for="cashdelivery">
                                            <input type="checkbox" id="cashdelivery" name="transaction_payment" value="Cash-on-Delivery"> Cash on Delivery
                                        </label>
                                        <input type="submit" name="action" value="Transact" class="btn btn-primary btn-lg">
                                        <br>
                                        <div id="paypal-payment-button"></div>

                                        <div id="myModal" class="modal fade">
                                            <div class="modal-dialog modal-confirm modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <div class="icon-box text-center">
                                                            <i class="fa fa-check" style="font-size:48px;color:greenyellown"></i>
                                                        </div>				
                                                        <h4 class="modal-title w-100">Awesome!</h4>	
                                                    </div>
                                                    <div class="modal-body">
                                                        <p class="text-center">Your booking has been confirmed. Check your email for details.</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn btn-success btn-block" data-dismiss="modal">OK</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>     
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Cart view section -->
<!--  end content-->
<script src="https://www.paypal.com/sdk/js?client-id=AX4UhpEHB2X515a9jh0AddikEHLWVWa9Kcf768IagpsshpnxgJjEmJU_nmNWHN2EMmRRhNsqkp4Xp0mm&disable-funding=credit,card" data-namespace="paypal_sdk"></script>
<script>
    paypal_sdk.Buttons({
        style: {
            color: 'blue',
//            shape: 'pill'
        },
        createOrder: function (data, actions) {
            return actions.order.create({
                intent: 'CAPTURE',
//                payer: {
//                    name: {
//                        given_name: "${sessionScope.USER_LOGIN.name}",
//                    },
//                    email_address: "${sessionScope.USER_LOGIN.email}",
//                },
                purchase_units: [{
                        amount: {
                            value: '${Math.ceil((pageScope.total/pageScope.exchangerate)*1.1*100.0)/100.0}'
                        }
                    }]
            });
        },
        onApprove: function (data, actions) {
            return actions.order.capture().then(function (details) {
                console.log(details)
                window.location.replace("http://localhost:8080/Tea/MainController?transaction_name=${sessionScope.USER_LOGIN.name}&transaction_email=${sessionScope.USER_LOGIN.email}&transaction_phone=${sessionScope.USER_LOGIN.phone}&transaction_address=${sessionScope.USER_LOGIN.address}&transaction_created=<%=String.valueOf(java.time.LocalDate.now())%>&transaction_payment=Via-Paypal&action=Transact");
            })
        },
        onCancel: function (data) {
            window.location.replace("http://localhost:8080/Tea/MainController?action=Transact&statuspayment=fail");
        }
    }).render('#paypal-payment-button');
</script>
<!--  footer-->
<jsp:include page = "./footer/footer.jsp" flush = "true" />
<!-- end footer-->

<!--
sb-q1nk417434482@personal.example.com
123456789
-->


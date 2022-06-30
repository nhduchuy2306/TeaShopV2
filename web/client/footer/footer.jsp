<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!-- footer -->  
<footer id="aa-footer">
    <!-- footer bottom -->
    <div class="aa-footer-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="aa-footer-top-area">
                        <div class="row">
                            <div class="col-md-4 col-sm-6">
                                <div class="aa-footer-widget">
                                    <a href="${pageContext.request.contextPath}/client/index.jsp">
                                        <img src="${pageContext.request.contextPath}/client/assets/images/logoAndSomeimg/logo@2x.png" alt="logo img" width="300" height="150">
                                    </a> 
                                    <ul class="aa-footer-nav">
                                        <li><p style="color:#888; text-align: justify; width: 95%">Là nơi chuyên cung cấp thức uống ngon và bổ dưỡng. 
                                                Chúng tôi luôn đặt tiêu chí về chất lượng và uy tín lên hàng đầu.</p></li>
                                        <li><img src="${pageContext.request.contextPath}/client/assets/images/dadangky.png" alt="logo img" width="40%"></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <div class="aa-footer-widget">
                                    <div class="aa-footer-widget">
                                        <h3>HỖ TRỢ KHÁCH HÀNG</h3>
                                        <ul class="aa-footer-nav">
                                            <li><a href="${pageContext.request.contextPath}/client/order.jsp">Hướng dẫn đặt hàng</a></li>
                                            <li><a href="${pageContext.request.contextPath}/client/payment.jsp">Hướng dẫn thanh toán</a></li>
                                            <li><a href="${pageContext.request.contextPath}/client/security.jsp">Chính sách bảo mật thông tin</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <div class="aa-footer-widget">
                                    <div class="aa-footer-widget">
                                        <h3>LIÊN HỆ</h3>
                                        <address>
                                            <p>BubbleTea, Đ. D1, Long Thạnh Mỹ, TP Thủ Đức,  TP HCM</p>
                                            <p><span class="fa fa-phone"></span>012.3456.789</p>
                                            <p><span class="fa fa-envelope"></span>bubbletea@gmail.com</p>
                                        </address>
                                        <div class="aa-footer-social">
                                            <a href="#"><span class="fab fa-facebook"></span></a>
                                            <a href="#"><span class="fab fa-youtube"></span></a>
                                            <a href="#"><span class="fab fa-instagram"></span></a>
                                            <a href="#"><span class="fab fa-skype"></span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- footer-bottom -->
    <div class="aa-footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="aa-footer-bottom-area">
                        <p>Copyright 2020 &copyNguyenHoangDucHuy</p>
                        <div class="aa-footer-payment">
                            <span class="fab fa-cc-mastercard"></span>
                            <span class="fab fa-cc-visa"></span>
                            <span class="fab fa-paypal"></span>
                            <span class="fab fa-cc-discover"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- / footer -->
</body>
<jsp:include page = "script.jsp" flush = "true" />
</html>

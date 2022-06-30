<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/client/assets" var="url"/>


<!-- Start header section -->
<jsp:include page = "./header/mainHeader.jsp" flush = "true" />
<!-- / header section -->

<!--  content -->
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
    <img src="${pageContext.request.contextPath}/client/assets/images/banner/contact-banner.png" alt="banner liên hệ">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>Liên hệ</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/client/index.jsp">Trang chủ</a></li>         
                    <li style="color:#fff">Thông tin liên hệ</li>
                </ol>
            </div>
        </div>
    </div>
</section>
<!-- / catg header banner section -->
<!-- start contact section -->
<section id="aa-contact">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-contact-area">
                    <div class="aa-contact-top">
                        <h2>Chúng tôi đang chờ để hỗ trợ bạn..</h2>
                        <p>Nếu bạn nó bất cứ thắc mắc hay ý kiến gì cứ tìm đến chúng tôi.</p>
                    </div>

                    <!-- Contact address -->
                    <div class="aa-contact-address">
                        <div class="row">
                            <div class="col-md-7">
                                <div class="aa-contact-map">
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.6099414916966!2d106.8076943152606!3d10.841132860959346!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2sFPT%20University%20HCMC!5e0!3m2!1sen!2s!4v1654323897029!5m2!1sen!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="aa-contact-address-right">
                                    <address>
                                        <h4>BubbleTea</h4>
                                        <p>Liên hệ cho chúng tôi bất cứ khi nào bạn cần.</p>
                                        <p><span class="fa fa-home"></span>BubbleTea, Đ. D1, Long Thạnh Mỹ, TP Thủ Đức, HCM</p>
                                        <p><span class="fa fa-phone"></span>012.3456.789</p>
                                        <p><span class="fa fa-envelope"></span>Email: contact@bubbletea.com</p>
                                    </address>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--  end content-->
<!--  footer-->
<jsp:include page = "./footer/footer.jsp" flush = "true" />
<!-- end footer-->




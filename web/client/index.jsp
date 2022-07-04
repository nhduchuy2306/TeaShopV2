<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/client/assets" var="url"/>
<!-- Start header section -->
<jsp:include page = "./header/mainHeader.jsp" flush = "true" />
<!-- / header section -->
<!-- Start slider -->
<style>
    .category{
        height: 140px;
        display:flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        margin-bottom: 50px;
    }
    .category img{
        height:120px;
        width: 120px;
        padding: 20px;
    }
    .category a{
        border: 1px solid #ffe7ba;
        background-color: #ffe7ba;
        border-radius: 50%;
    }
    .category p{
        display:flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }
</style>

<!--slider begin-->
<section id="aa-slider">
    <div class="aa-slider-area">
        <div id="sequence" class="seq">
            <div class="seq-screen">
                <ul class="seq-canvas">
                    <!-- single slide item -->
                    <c:forEach items="${BANNER_LIST}" var="b">
                        <li>
                            <div class="seq-model">
                                <img class="img-responsive" data-seq src="${b.bannerImg}" alt="slide img" />
                            </div>
                            <div class="seq-title">
                                <a style="margin-top: 182px" data-seq href="MainController?action=Product&pageNum=1" class="aa-shop-now-btn aa-secondary-btn">View Product</a>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <!-- slider navigation btn -->
            <fieldset class="seq-nav" aria-controls="sequence" aria-label="Slider buttons">
                <a type="button" class="seq-prev" aria-label="Previous"><span class="fa fa-angle-left"></span></a>
                <a type="button" class="seq-next" aria-label="Next"><span class="fa fa-angle-right"></span></a>
            </fieldset>
        </div>
    </div>
</section>

<!-- slider end-->
<!-- Start Promo section -->
<section style="margin-top: 30px" id="aa-promo">
    <div class="container">
        <div style="margin-bottom: 30px;" class="text-center">
            <h1>My Category</h1>
        </div>
        <div class="row">
            <c:forEach items="${CATEGORY_LIST}" var="c">
                <div class="col-md-4 col-sm-6 col-xs-6 text-center category">
                    <a href="MainController?action=Product-id&cID=${c.categoryID}">
                        <img src="${c.categoryImg}" alt="category">
                    </a>
                    <h3><strong>${c.categoryName}</strong></h3>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- / Promo section -->
<!-- Products section -->
<section id="aa-product">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="aa-product-area">
                        <div class="aa-product-inner">
                            <!-- start prduct navigation -->
                            <ul class="nav nav-tabs aa-products-tab">
                                <c:forEach items="${CATEGORY_LIST}" var="c">
                                    <li class="${c.categoryID==1?'active':''}">
                                        <a href="#${c.hashTag}" data-toggle="tab">${c.categoryName}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <!-- start ca phe product category -->
                                <div class="tab-pane fade in active" id="caphe">
                                    <ul class="aa-product-catg">
                                        <!-- start single product item -->
                                        <c:forEach items="${PRODUCT_CAPHE}" var="p" end="3">
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="MainController?action=Product-detail&pID=${p.productID}">
                                                        <img src="${p.productImg}" 
                                                             alt="caphe img"></a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title">
                                                            <a href="MainController?action=Product-detail&pID=${p.productID}">${p.productName}</a>
                                                        </h4>
                                                        <c:choose>
                                                            <c:when test="${p.productDiscount == 0}">
                                                                <span class="aa-product-price">
                                                                    ${Double.valueOf(p.productPrice).intValue()} VNĐ</span>
                                                                <span class="aa-product-price"></span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:forEach items="${PRODUCT_ALL_AFTER}" var="pa">
                                                                    <c:if test="${pa.productID == p.productID}">
                                                                        <span class="aa-product-price">
                                                                            ${Double.valueOf(pa.productPrice).intValue()} VNĐ</span>
                                                                        <span class="aa-product-price">
                                                                            <del>${Double.valueOf(p.productPrice).intValue()} VNĐ</del>
                                                                        </span>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </figcaption>
                                                    <c:choose>
                                                        <c:when test="${p.productStatus == 1}"> 
                                                            <a class="aa-add-card-btn"href="MainController?action=Add-Cart&product-id=${p.productID}">
                                                                <span class="fa fa-shopping-cart"></span>Add to Cart
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a class="aa-add-card-btn"href="MainController?action=Add-Cart&product-id=${p.productID}">
                                                                <del><span class="fa fa-shopping-cart"></span>Out of stock<del>
                                                            </a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </figure>
                                                <c:if test="${p.productDiscount != 0}">
                                                    <!-- product badge -->
                                                    <span class="aa-badge aa-sale">- ${p.productDiscount}%</span>
                                                </c:if>
                                            </li>
                                        </c:forEach>
                                        <!-- start single product item -->
                                    </ul>
                                </div>
                                <!-- end ca phe product category -->
                                <!--start tra sua product category -->
                                <div class="tab-pane fade" id="traicaytrasua">
                                    <ul class="aa-product-catg">
                                        <!-- start single product item -->
                                        <c:forEach items="${PRODUCT_TRASUA}" var="p" end="3">
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="MainController?action=Product-detail&pID=${p.productID}">
                                                        <img src="${p.productImg}" 
                                                             alt="caphe img"></a>

                                                    <figcaption>
                                                        <h4 class="aa-product-title">
                                                            <a href="MainController?action=Product-detail&pID=${p.productID}">${p.productName}</a>
                                                        </h4>
                                                        <c:choose>
                                                            <c:when test="${p.productDiscount == 0}">
                                                                <span class="aa-product-price">
                                                                    ${Double.valueOf(p.productPrice).intValue()} VNĐ</span>
                                                                <span class="aa-product-price"></span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:forEach items="${PRODUCT_ALL_AFTER}" var="pa">
                                                                    <c:if test="${pa.productID == p.productID}">
                                                                        <span class="aa-product-price">
                                                                            ${Double.valueOf(pa.productPrice).intValue()} VNĐ</span>
                                                                        <span class="aa-product-price">
                                                                            <del>${Double.valueOf(p.productPrice).intValue()} VNĐ</del>
                                                                        </span>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </figcaption>
                                                    <c:choose>
                                                        <c:when test="${p.productStatus == 1}"> 
                                                            <a class="aa-add-card-btn"href="MainController?action=Add-Cart&product-id=${p.productID}">
                                                                <span class="fa fa-shopping-cart"></span>Add to Cart
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a class="aa-add-card-btn"href="MainController?action=Add-Cart&product-id=${p.productID}">
                                                                <del><span class="fa fa-shopping-cart"></span>Out of stock</del>
                                                            </a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </figure>                        
                                                <c:if test="${p.productDiscount != 0}">
                                                    <!-- product badge -->
                                                    <span class="aa-badge aa-sale">- ${p.productDiscount}%</span>
                                                </c:if>
                                            </li>
                                        </c:forEach>
                                        <!-- start single product item -->
                                    </ul>
                                </div>
                                <!--end tra sua product category -->
                                <!-- start hitea product category -->
                                <div class="tab-pane fade" id="hitea">
                                    <ul class="aa-product-catg">
                                        <!-- start single product item -->
                                        <c:forEach items="${PRODUCT_HITEA}" var="p" end="3">
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="MainController?action=Product-detail&pID=${p.productID}">
                                                        <img src="${p.productImg}" 
                                                             alt="caphe img"></a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title">
                                                            <a href="MainController?action=Product-detail&pID=${p.productID}">${p.productName}</a>
                                                        </h4>
                                                        <c:choose>
                                                            <c:when test="${p.productDiscount == 0}">
                                                                <span class="aa-product-price">
                                                                    ${Double.valueOf(p.productPrice).intValue()} VNĐ</span>
                                                                <span class="aa-product-price"></span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:forEach items="${PRODUCT_ALL_AFTER}" var="pa">
                                                                    <c:if test="${pa.productID == p.productID}">
                                                                        <span class="aa-product-price">
                                                                            ${Double.valueOf(pa.productPrice).intValue()} VNĐ</span>
                                                                        <span class="aa-product-price">
                                                                            <del>${Double.valueOf(p.productPrice).intValue()} VNĐ</del>
                                                                        </span>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </figcaption>
                                                    <c:choose>
                                                        <c:when test="${p.productStatus == 1}"> 
                                                            <a class="aa-add-card-btn"href="MainController?action=Add-Cart&product-id=${p.productID}">
                                                                <span class="fa fa-shopping-cart"></span>Add to Cart
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a class="aa-add-card-btn"href="MainController?action=Add-Cart&product-id=${p.productID}">
                                                                <del><span class="fa fa-shopping-cart"></span>Out of stock</del>
                                                            </a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </figure>                        
                                                <c:if test="${p.productDiscount != 0}">
                                                    <!-- product badge -->
                                                    <span class="aa-badge aa-sale">- ${p.productDiscount}%</span>
                                                </c:if>
                                            </li>
                                        </c:forEach>
                                        <!-- start single product item -->
                                    </ul>
                                </div>
                                <!-- end hitea product category -->
                                <!-- start da xay product category -->
                                <div class="tab-pane fade" id="daxaychoco">
                                    <ul class="aa-product-catg">
                                        <!-- start single product item -->
                                        <c:forEach items="${PRODUCT_DAXAY}" var="p" end="3">
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="MainController?action=Product-detail&pID=${p.productID}">
                                                        <img src="${p.productImg}" 
                                                             alt="caphe img"></a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title">
                                                            <a href="MainController?action=Product-detail?pID=${p.productID}">${p.productName}</a>
                                                        </h4>
                                                        <c:choose>
                                                            <c:when test="${p.productDiscount == 0}">
                                                                <span class="aa-product-price">
                                                                    ${Double.valueOf(p.productPrice).intValue()} VNĐ</span>
                                                                <span class="aa-product-price"></span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:forEach items="${PRODUCT_ALL_AFTER}" var="pa">
                                                                    <c:if test="${pa.productID == p.productID}">
                                                                        <span class="aa-product-price">
                                                                            ${Double.valueOf(pa.productPrice).intValue()} VNĐ</span>
                                                                        <span class="aa-product-price">
                                                                            <del>${Double.valueOf(p.productPrice).intValue()} VNĐ</del>
                                                                        </span>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </figcaption>
                                                    <c:choose>
                                                        <c:when test="${p.productStatus == 1}"> 
                                                            <a class="aa-add-card-btn"href="MainController?action=Add-Cart&product-id=${p.productID}">
                                                                <span class="fa fa-shopping-cart"></span>Add to Cart
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a class="aa-add-card-btn"href="MainController?action=Add-Cart&product-id=${p.productID}">
                                                                <del><span class="fa fa-shopping-cart"></span>Out of stock</del>
                                                            </a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </figure>                        
                                                <c:if test="${p.productDiscount != 0}">
                                                    <!-- product badge -->
                                                    <span class="aa-badge aa-sale">- ${p.productDiscount}%</span>
                                                </c:if>
                                            </li>
                                        </c:forEach>
                                        <!-- start single product item -->
                                    </ul>
                                </div>
                                <!-- end da xay product category -->
                                <!-- start thuong thuc product category -->
                                <div class="tab-pane fade" id="thuongthuc">
                                    <ul class="aa-product-catg">
                                        <!-- start single product item -->
                                        <c:forEach items="${PRODUCT_THUONGTHUC}" var="p" end="3">
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="MainController?action=Product-detail?pID=${p.productID}">
                                                        <img src="${p.productImg}" 
                                                             alt="caphe img"></a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title">
                                                            <a href="MainController?action=Product-detail?pID=${p.productID}">${p.productName}</a>
                                                        </h4>
                                                        <c:choose>
                                                            <c:when test="${p.productDiscount == 0}">
                                                                <span class="aa-product-price">
                                                                    ${Double.valueOf(p.productPrice).intValue()} VNĐ</span>
                                                                <span class="aa-product-price"></span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:forEach items="${PRODUCT_ALL_AFTER}" var="pa">
                                                                    <c:if test="${pa.productID == p.productID}">
                                                                        <span class="aa-product-price">
                                                                            ${Double.valueOf(pa.productPrice).intValue()} VNĐ</span>
                                                                        <span class="aa-product-price">
                                                                            <del>${Double.valueOf(p.productPrice).intValue()} VNĐ</del>
                                                                        </span>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </figcaption>
                                                    <c:choose>
                                                        <c:when test="${p.productStatus == 1}"> 
                                                            <a class="aa-add-card-btn"href="MainController?action=Add-Cart&product-id=${p.productID}">
                                                                <span class="fa fa-shopping-cart"></span>Add to Cart
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a class="aa-add-card-btn"href="MainController?action=Add-Cart&product-id=${p.productID}">
                                                                <del><span class="fa fa-shopping-cart"></span>Out of stock</del>
                                                            </a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </figure>                        
                                                <c:if test="${p.productDiscount != 0}">
                                                    <!-- product badge -->
                                                    <span class="aa-badge aa-sale">- ${p.productDiscount}%</span>
                                                </c:if>
                                            </li>
                                        </c:forEach>
                                        <!-- start single product item -->
                                    </ul>
                                </div>
                                <!-- end thuong thuc product category -->
                                <!-- start snack product category -->
                                <div class="tab-pane fade" id="snack">
                                    <ul class="aa-product-catg">
                                        <!-- start single product item -->
                                        <c:forEach items="${PRODUCT_SNACK}" var="p" end="3"> 
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="MainController?action=Product-detail?pID=${p.productID}">
                                                        <img src="${p.productImg}" 
                                                             alt="caphe img"></a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title">
                                                            <a href="MainController?action=Product-detail?pID=${p.productID}">${p.productName}</a>
                                                        </h4>
                                                        <c:choose>
                                                            <c:when test="${p.productDiscount == 0}">
                                                                <span class="aa-product-price">
                                                                    ${Double.valueOf(p.productPrice).intValue()} VNĐ</span>
                                                                <span class="aa-product-price"></span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:forEach items="${PRODUCT_ALL_AFTER}" var="pa">
                                                                    <c:if test="${pa.productID == p.productID}">
                                                                        <span class="aa-product-price">
                                                                            ${Double.valueOf(pa.productPrice).intValue()} VNĐ</span>
                                                                        <span class="aa-product-price">
                                                                            <del>${Double.valueOf(p.productPrice).intValue()} VNĐ</del>
                                                                        </span>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </figcaption>
                                                    <c:choose>
                                                        <c:when test="${p.productStatus == 1}"> 
                                                            <a class="aa-add-card-btn"href="MainController?action=Add-Cart&product-id=${p.productID}">
                                                                <span class="fa fa-shopping-cart"></span>
                                                                Add to Cart
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a class="aa-add-card-btn"href="MainController?action=Add-Cart&product-id=${p.productID}">
                                                                <span class="fa fa-shopping-cart"></span>
                                                                Add to Cart
                                                            </a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </figure>                        
                                                <c:if test="${p.productDiscount != 0}">
                                                    <!-- product badge -->
                                                    <span class="aa-badge aa-sale">- ${p.productDiscount}%</span>
                                                </c:if>
                                            </li>
                                        </c:forEach>
                                        <!-- start single product item -->
                                    </ul>
                                </div>
                                <!-- end snack product category -->
                            </div>
                            <div class="more-product">
                                <a class="aa-browse-btn" href="MainController?action=Product&pageNum=1">View All Product 
                                    <span class="fa fa-long-arrow-right"></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Products section -->
<!-- banner section -->
<section id="aa-banner">
    <div class="container">
        <div class="row">
            <div class="col-md-12">        
                <div class="row">
                    <div class="aa-banner-area">
                        <a href="${pageContext.request.contextPath}/home">
                            <img src="${pageContext.request.contextPath}/client/assets/images/banner/banner.jpg" alt="banner trang chủ" height="250" width="100%">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- popular section -->
<section id="aa-popular-category">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="aa-popular-category-area">
                        <!-- start prduct navigation -->
                        <ul class="nav nav-tabs aa-products-tab">
                            <li class="active"><a href="#sanphammoi" data-toggle="tab">Sản Phẩm Mới</a></li>
                            <li><a href="#sanphambanchay" data-toggle="tab">Sản Phẩm Bán Chạy</a></li>
                            <li><a href="#sanphamgiamgia" data-toggle="tab">Sản Phẩm Giảm Giá</a></li>                    
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <!-- Start men popular category -->
                            <div class="tab-pane fade in active" id="sanphammoi">
                                <ul class="aa-product-catg aa-popular-slider">
                                    <!-- start single product item -->
                                    <c:forEach items="${PRODUCT_NEW}" var="p">
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="MainController?action=Product-detail&pID=${p.productID}">
                                                    <img src="${p.productImg}"></a>
                                                <figcaption>
                                                    <h4 class="aa-product-title">
                                                        <a href="MainController?action=Product-detail&pID=${p.productID}">${p.productName }</a>
                                                    </h4>
                                                    <c:choose>
                                                        <c:when test="${p.productDiscount == 0}">
                                                            <span class="aa-product-price">${Double.valueOf(p.productPrice).intValue()} VNĐ</span><span class="aa-product-price"></span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:forEach items="${PRODUCT_ALL_AFTER}" var="pa">
                                                                <c:if test="${pa.productID == p.productID}">
                                                                    <span class="aa-product-price">${Double.valueOf(pa.productPrice).intValue()} VNĐ</span>
                                                                    <span class="aa-product-price"><del>${Double.valueOf(p.productPrice).intValue()} VNĐ</del></span>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </figcaption>

                                                <c:choose>
                                                    <c:when test="${p.productStatus == 1}"> 
                                                        <a class="aa-add-card-btn"href="MainController?action=Add-Cart&product-id=${p.productID}">
                                                            <span class="fa fa-shopping-cart"></span>Add to Cart
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a class="aa-add-card-btn"href="MainController?action=Add-Cart&product-id=${p.productID}">
                                                            <span class="fa fa-shopping-cart"></span>Add to Cart
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </figure>                        

                                            <c:if test="${p.productDiscount != 0}">
                                                <!-- product badge -->
                                                <span class="aa-badge aa-sale">- ${p.productDiscount}%</span>
                                            </c:if>
                                        </li>
                                    </c:forEach>
                                    <!-- start single product item -->
                                    <!-- start single product item -->
                                </ul>

                            </div>
                            <!-- / popular product category -->

                            <!-- start featured product category -->
                            <div class="tab-pane fade" id="sanphambanchay">
                                <ul class="aa-product-catg aa-popular-slider">
                                    <!-- start single product item -->
                                    <c:forEach items="${PRODUCT_BEST_CHOICE}" var="p">
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="MainController?action=Product-detail?pID=${p.productID}">
                                                    <img src="${p.productImg}"></a>

                                                <figcaption>
                                                    <h4 class="aa-product-title">
                                                        <a href="MainController?action=Product-detail?pID=${p.productID}">${p.productName }</a>
                                                    </h4>
                                                    <c:choose>
                                                        <c:when test="${p.productDiscount == 0}">
                                                            <span class="aa-product-price">${Double.valueOf(p.productPrice).intValue()} VNĐ</span><span class="aa-product-price"></span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:forEach items="${PRODUCT_ALL_AFTER}" var="pa">
                                                                <c:if test="${pa.productID == p.productID}">
                                                                    <span class="aa-product-price">${Double.valueOf(pa.productPrice).intValue()} VNĐ</span>
                                                                    <span class="aa-product-price"><del>${Double.valueOf(p.productPrice).intValue()} VNĐ</del></span>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </figcaption>
                                                <c:choose>
                                                    <c:when test="${p.productStatus == 1}"> 
                                                        <a class="aa-add-card-btn"href="MainController?action=Add-Cart&product-id=${p.productID}">
                                                            <span class="fa fa-shopping-cart"></span>Add to Cart
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a class="aa-add-card-btn"href="MainController?action=Add-Cart&product-id=${p.productID}">
                                                            <del><span class="fa fa-shopping-cart"></span>Out of stock</del>
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </figure>
                                            <c:if test="${p.productDiscount != 0}">
                                                <!-- product badge -->
                                                <span class="aa-badge aa-sale">- ${p.productDiscount}%</span>
                                            </c:if>
                                        </li>
                                    </c:forEach>
                                    <!-- start single product item -->
                                    <!-- start single product item -->
                                </ul>
                            </div>
                            <!-- / featured product category -->

                            <!-- start latest product category -->
                            <div class="tab-pane fade" id="sanphamgiamgia">

                                <ul class="aa-product-catg aa-popular-slider">
                                    <!-- start single product item -->
                                    <c:forEach items="${PRODUCT_SALE}" var="p">
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="MainController?action=Product-detail&pID=${p.productID}">
                                                    <img src="${p.productImg}"></a>

                                                <figcaption>
                                                    <h4 class="aa-product-title">
                                                        <a href="MainController?action=Product-detail&pID=${p.productID}">${p.productName}</a>
                                                    </h4>
                                                    <c:choose>
                                                        <c:when test="${p.productDiscount == 0}">
                                                            <span class="aa-product-price">${Double.valueOf(p.productPrice).intValue()} VNĐ</span><span class="aa-product-price"></span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:forEach items="${PRODUCT_ALL_AFTER}" var="pa">
                                                                <c:if test="${pa.productID == p.productID}">
                                                                    <span class="aa-product-price">${Double.valueOf(pa.productPrice).intValue()} VNĐ</span>
                                                                    <span class="aa-product-price"><del>${Double.valueOf(p.productPrice).intValue()} VNĐ</del></span>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </figcaption>
                                                <c:choose>
                                                    <c:when test="${p.productStatus == 1}"> 
                                                        <a class="aa-add-card-btn"href="MainController?action=Add-Cart&product-id=${p.productID}">
                                                            <span class="fa fa-shopping-cart"></span>Add to Cart
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a class="aa-add-card-btn"href="MainController?action=Add-Cart&product-id=${p.productID}">
                                                            <del><span class="fa fa-shopping-cart"></span>Out of stock</del>
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </figure>                        

                                            <c:if test="${p.productDiscount != 0}">
                                                <!-- product badge -->
                                                <span class="aa-badge aa-sale">- ${p.productDiscount}%</span>
                                            </c:if>
                                        </li>
                                    </c:forEach>
                                    <!-- start single product item -->
                                    <!-- start single product item -->
                                </ul>
                            </div>
                            <!-- / latest product category -->              
                        </div>
                        <div class="more-product">
                            <a class="aa-browse-btn" href="MainController?action=Product&pageNum=1">View All Product
                                <span class="fa fa-long-arrow-right"></span>
                            </a>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
    </div>
</section>
<!-- / popular section -->
<!-- Support section -->
<section id="aa-support">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-support-area">
                    <!-- single support -->
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="aa-support-single">
                            <span class="fa fa-truck"></span>
                            <h4>MIỄN PHÍ VẬN CHUYỂN</h4>
                            <P>Chúng tôi đã áp dụng gói miễn phí vận chuyển cho đơn hàng trên 280.000VNĐ.</P>
                        </div>
                    </div>
                    <!-- single support -->
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="aa-support-single">
                            <span class="fa fa-clock-o"></span>
                            <h4>GIAO HÀNG NHANH</h4>
                            <P>Chúng tôi đảm bảo hàng đến tay khách hàng nhanh và đảm bảo sản phẩm an toàn.</P>
                        </div>
                    </div>
                    <!-- single support -->
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="aa-support-single">
                            <span class="fa fa-phone"></span>
                            <h4>HỖ TRỢ 24/7</h4>
                            <P>Hỗ trợ tư vấn và đặt hàng mọi lúc mọi nơi, đảm bảo thời gian cho khách hàng.</P>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Support section -->
<!-- Testimonial -->
<section id="aa-testimonial">  
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-testimonial-area">
                    <ul class="aa-testimonial-slider">
                        <!-- single slide -->
                        <li>
                            <div class="aa-testimonial-single">
                                <img class="aa-testimonial-img" src="https://vtv1.mediacdn.vn/thumb_w/650/2021/4/25/photo-1-1619306202198493971443.jpg" alt="avatar 3">
                                <span class="fa fa-quote-left aa-testimonial-quote"></span>
                                <p>This is the best place in VN, next time if I have a chance, I will come back here!!!</p>
                                <div class="aa-testimonial-info">
                                    <p>Mark Zuckerberg</p>
                                    <span>Founder of Facebook</span>
                                </div>
                            </div>
                        </li>
                        <!-- single slide -->
                        <li>
                            <div class="aa-testimonial-single">
                                <img class="aa-testimonial-img" src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Ninh_D%C6%B0%C6%A1ng_Lan_Ng%E1%BB%8Dc_trong_M%E1%BB%91i_T%C3%ACnh_%C4%90%E1%BA%A7u_C%E1%BB%A7a_T%C3%B4i.png/640px-Ninh_D%C6%B0%C6%A1ng_Lan_Ng%E1%BB%8Dc_trong_M%E1%BB%91i_T%C3%ACnh_%C4%90%E1%BA%A7u_C%E1%BB%A7a_T%C3%B4i.png" alt="avatar 1">
                                <span class="fa fa-quote-left aa-testimonial-quote"></span>
                                <p>Sau những buổi quay phim mệt mỏi mình luôn mua cho bản thân 1 ly trà sữa của quán, vô cùng ngon và lấy lại năng lượng cho bản thân.</p>
                                <div class="aa-testimonial-info">
                                    <p>Ninh Dương Lan Ngọc</p>
                                    <span>Diễn Viên/MC</span>
                                </div>
                            </div>
                        </li>
                        <!-- single slide -->
                        <li>
                            <div class="aa-testimonial-single">
                                <img class="aa-testimonial-img" src="https://yt3.ggpht.com/ytc/AKedOLQviJjIUJJTvw1lj-kBTHKXR6IAkCaUXTkVtZH-mw=s900-c-k-c0x00ffffff-no-rj" alt="avatar 2">
                                <span class="fa fa-quote-left aa-testimonial-quote"></span>
                                <p>Tôi hay cùng vợ đến đây vào cuối tuần không gian quán quả thực quá tuyệt vời, cùng thêm menu vô cùng hấp dẫn và đặc sắc!!!<p>
                                <div class="aa-testimonial-info">
                                    <p>Trấn Thành</p>
                                    <span>Diễn Viên/MC</span>
                                </div>
                            </div>
                        </li>
                        <!-- single slide -->
                        <li>
                            <div class="aa-testimonial-single">
                                <img class="aa-testimonial-img" src="https://kenh14cdn.com/thumb_w/660/2020/5/28/0-1590653959375414280410.jpg" alt="avatar 3">
                                <span class="fa fa-quote-left aa-testimonial-quote"></span>
                                <p>Em rất hay cùng bạn bè uống trà sữa ở đây nó rất ngon, không gian quán lại vô cùng tuyệt vời sẽ đến đây thường xuyên hơn!!!</p>
                                <div class="aa-testimonial-info">
                                    <p>Oanh Oanh</p>
                                    <span>Sinh viên</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Testimonial -->

<!-- Latest Blog -->
<section id="aa-latest-blog">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-latest-blog-area">
                    <h2>News</h2>
                    <div class="container-fluid">
                        <div class="row">
                            <!-- single latest blog -->
                            <c:forEach items="${BLOG_NEW}" var="bn" end="5">
                                <div style="height: 350px; margin-bottom: 150px" class="col-md-4 col-sm-12">
                                    <div  class="aa-latest-blog-single">
                                        <figure class="aa-blog-img">                    
                                            <a href="MainController?action=Blog-detail&bID=${bn.blogNewID}">
                                                <img class="img-responsive" src="${bn.blogImg}" alt="news ${bn.title}">
                                            </a>                       
                                        </figure>
                                        <div class="aa-blog-info">
                                            <h3 style="margin-bottom: 10px;" class="aa-blog-title">
                                                <a href="MainController?action=Blog-detail&bID=${bn.blogNewID}">${bn.title}</a>
                                            </h3>
                                            <a href="MainController?action=Blog-detail&bID=${bn.blogNewID}" class="aa-read-mor-btn">
                                                Read more<span class="fa fa-long-arrow-right"></span></a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>    
        </div>
    </div>
</section>
<!-- / Latest Blog -->
<!--  footer-->
<jsp:include page = "./footer/footer.jsp" flush = "true" />
<!-- end footer-->


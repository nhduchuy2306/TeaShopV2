<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/client/assets" var="url"/>

<!-- Start header section -->
<jsp:include page = "./header/mainHeader.jsp" flush = "true" />
<!-- / header section -->
<!--  content -->
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
    <img src="${pageContext.request.contextPath}/client/assets/images/banner/banner.jpg" alt="banner sản phẩm" height="400" width="1903">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>Chi tiết sản phẩm</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>         
                    <li><a href="MainController?action=Product-id?cID=${DETAIL_PRODUCT.categoryID}">Sản phẩm</a></li>
                    <li style="color:#fff">${DETAIL_PRODUCT.productName}</li>
                </ol>
            </div>
        </div>
    </div>
</section>
<!-- / catg header banner section -->

<!-- product category -->
<section id="aa-product-details">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-product-details-area">
                    <div class="aa-product-details-content">
                        <div class="row">
                            <!-- Modal view slider -->
                            <div class="col-md-5 col-sm-5 col-xs-12">                              
                                <div class="aa-product-view-slider">                                
                                    <div id="demo-1" class="simpleLens-gallery-container">
                                        <div class="simpleLens-container">
                                            <div class="simpleLens-big-image-container">
                                                <a data-lens-image="${DETAIL_PRODUCT.productImg}" class="simpleLens-lens-image">
                                                    <img src="${DETAIL_PRODUCT.productImg}" class="simpleLens-big-image">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal view content -->
                            <div class="col-md-7 col-sm-7 col-xs-12">
                                <div class="aa-product-view-content">
                                    <h3>${DETAIL_PRODUCT.productName }</h3>
                                    <div class="aa-price-block">
                                        <c:choose>
                                            <c:when test="${DETAIL_PRODUCT.productDiscount == 0}">
                                                <span class="aa-product-price">${Double.valueOf(DETAIL_PRODUCT.productPrice).intValue()} VNĐ</span><span class="aa-product-price"></span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="aa-product-price"><strong>${Double.valueOf(DETAIL_PRODUCT_DISCOUNT.productPrice*(1-Double.valueOf(DETAIL_PRODUCT_DISCOUNT.productDiscount)/100)).intValue()} VNĐ</strong></span>
                                                <span class="aa-product-price"><del>${Double.valueOf(DETAIL_PRODUCT.productPrice).intValue()} VNĐ</del></span>
                                            </c:otherwise>
                                        </c:choose>
                                        <p class="aa-product-avilability">Tình trạng: 
                                            <span>
                                                <c:choose>
                                                    <c:when test="${DETAIL_PRODUCT.productStatus == 1}"> 
                                                        <c:out value="Còn hàng"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:out value="Out of stock"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </span>
                                        </p>
                                    </div>
                                    <p>${DETAIL_PRODUCT.productDescription}</p>
                                    <div class="aa-prod-quantity">                  
                                        <p class="aa-prod-category">
                                            <strong>Danh mục:</strong> 
                                            <a href="MainController?action=ProductCategoryController&product-id?cID=${NAME_CATE_OF_PRODUCT.categoryID}">${NAME_CATE_OF_PRODUCT.categoryName}</a>
                                        </p>
                                    </div>
                                    <div class="aa-prod-view-bottom">
                                        <c:choose>
                                            <c:when test="${p.productStatus == 1}"> 
                                                <a class="aa-add-to-cart-btn" href="MainController?action=Add-Cart&product-id=${DETAIL_PRODUCT.productID}">
                                                    <span class="fa fa-shopping-cart"></span>Add to Cart
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <a class="aa-add-to-cart-btn" href="MainController?action=Add-Cart&product-id=${DETAIL_PRODUCT.productID}">
                                                    <del><span class="fa fa-shopping-cart"></span>Out of stock<del>
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="aa-product-details-bottom">
                        <ul class="nav nav-tabs aa-products-tab" id="myTab2">
                            <li class="active"><a href="#description" data-toggle="tab" class="">Mô tả</a></li>
                            <li><a href="#review" data-toggle="tab">Đánh giá</a></li>                
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="description">
                                <p>${DETAIL_PRODUCT.productDescription}</p>
                            </div>
                            <!--// REVIEW CHƯA LÀM-->
                            <div class="tab-pane fade " id="review">
                                <div class="aa-product-review-area">
                                    <ul class="aa-review-nav">
                                        <c:forEach items="${LIST_REVIEW}" var="review">
                                            <li>
                                                <div class="media">
                                                    <div class="media-body">
                                                        <h4 class="media-heading">
                                                            <strong>${review.name}</strong> - <span>${review.created}</span>
                                                        </h4>
                                                        <div class="aa-product-rating">
                                                            <span class="fa fa-star"></span>
                                                            <span class="fa fa-star"></span>
                                                            <span class="fa fa-star"></span>
                                                            <span class="fa fa-star"></span>
                                                            <span class="fa fa-star"></span>
                                                        </div>
                                                        <p>${review.content}</p>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                    <h4>Thêm đánh giá</h4>
                                    <!-- review form -->
                                    <c:choose>
                                        <c:when test="${USER_LOGIN!=null}">
                                            <form action="MainController" method="get" class="aa-review-form">
                                                <input type="hidden" name="rID" value="${DETAIL_PRODUCT.productID}"> 
                                                <div class="form-group">
                                                    <label for="message">Đánh giá của bạn</label>
                                                    <textarea class="form-control" id="content" name="content"></textarea>
                                                </div>
                                                <input type="date" style="display: none;" value="<%=String.valueOf(java.time.LocalDate.now())%>" placeholder="Password" name="created" id="the-date">
                                                <button type="submit" name="action" value="Review" class="btn btn-default aa-review-submit">Send</button>
                                            </form>
                                        </c:when>
                                        <c:otherwise>
                                            <p>Bạn cần <a style="text-decoration: underline;" href="${pageContext.request.contextPath}/client/login.jsp">đăng nhập</a> 
                                                để bình luận</p>
                                            </c:otherwise>
                                        </c:choose>
                                </div>
                            </div>            
                        </div>
                    </div>
                    <!-- Related product -->
                    <div class="aa-product-related-item">
                        <h3>SẢN PHẨM LIÊN QUAN</h3>
                        <ul class="aa-product-catg aa-related-item-slider">
                            <!-- start single product item -->
                            <c:forEach items="${REMAIN_PRODUCT_NOT_CURR}" var="pr">
                                <li>
                                    <figure>
                                        <a class="aa-product-img" href="MainController?action=Product-detail&pID=${pr.productID}">
                                            <img src="${pr.productImg}" alt="">
                                        </a>

                                        <figcaption>
                                            <h4 class="aa-product-title">
                                                <a href="MainController?action=Product-detail&pID=${pr.productID}">${pr.productName}</a>
                                            </h4>
                                            <c:choose>
                                                <c:when test="${pr.productDiscount == 0}">
                                                    <span class="aa-product-price">${Double.valueOf(Math.ceil(pr.productPrice)).intValue()} VNĐ</span>
                                                    <span class="aa-product-price"></span>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach items="${PRODUCT_AFTER}" var="pa">
                                                        <c:if test="${pa.productID == pr.productID}">
                                                            <span class="aa-product-price">${Double.valueOf(pa.productPrice*(1-Double.valueOf(pa.productDiscount)/100)).intValue()} VNĐ</span>
                                                            <span class="aa-product-price"><del>${Double.valueOf(pa.productPrice).intValue()} VNĐ</del></span>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </figcaption>
                                        <a class="aa-add-card-btn"href="MainController?action=Add-Cart&product-id=${pr.productID}">
                                            <span class="fa fa-shopping-cart"></span>Add to cart</a>
                                    </figure>                     

                                    <c:if test="${pr.productDiscount != 0}">
                                        <!-- product badge -->
                                        <span class="aa-badge aa-sale">- ${pr.productDiscount}%</span>
                                    </c:if>
                                </li>
                            </c:forEach>
                            <!-- start single product item -->                                                                                   
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / product category -->
<!--  end content-->
<!--  footer-->
<jsp:include page = "./footer/footer.jsp" flush = "true" />
<!-- end footer-->



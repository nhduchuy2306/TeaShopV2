<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/client/assets" var="url"/>
<!-- Start header section -->
<jsp:include page = "./header/mainHeader.jsp" flush = "true" />
<!-- / header section -->
<style>
    .active{
        background-color: #754110;
    }
    .white {
        color: #fff !important;
    }
    .black {
        color: #000 !important;
    }
    .category{
        border: 1px solid black;
        padding: 10px;
        margin-bottom: 5px;
    }
</style>
<!--  content -->
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
    <img src="${pageContext.request.contextPath}/client/assets/images/banner/banner.jpg" alt="banner sản phẩm" width="1903" height="400">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>Tìm kiếm sản phẩm</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>         
                    <li style="color:#fff">Kết quả tìm kiếm</li>
                </ol>
            </div>
        </div>
    </div>
</section>
<!-- / catg header banner section -->

<!-- product category -->
<section id="aa-product-category">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-md-9 col-sm-8 col-md-push-3">
                <div class="aa-product-catg-content">
                    <div class="aa-product-catg-body">
                        <c:choose>
                            <c:when test="${empty PRODUCT_SEARCH}"> 
                                <p style="display:none;">Kết quả tìm kiếm cho từ khóa: <strong>${param.search}</strong></p>
                            </c:when>
                            <c:otherwise>
                                <p style="margin-bottom:30px;">Kết quả tìm kiếm cho từ khóa: <strong>${param.search}</strong></p>
                            </c:otherwise>
                        </c:choose>
                        <ul class="aa-product-catg">
                            <!-- start single product item -->
                            <c:if test="${empty PRODUCT_SEARCH}">
                                <p style="margin-left: 30px">Không tìm thấy sản phẩm!</p>
                            </c:if>
                            <c:forEach items="${PRODUCT_SEARCH}" var="p">
                                <li>
                                    <figure>
                                        <a class="aa-product-img" href="${pageContext.request.contextPath}/product-detail?pID=${p.productID}">
                                            <img src="${p.productImg}" alt="${p.productName}">
                                        </a>
                                        <a class="aa-add-card-btn"href="${pageContext.request.contextPath}/add-cart?product-id=${p.productID}">
                                            <span class="fa fa-shopping-cart"></span>Thêm vào giỏ hàng
                                        </a>
                                        <figcaption>
                                            <h4 class="aa-product-title">
                                                <a href="${pageContext.request.contextPath}/product-detail?pID=${p.productID}">${p.productName}</a>
                                            </h4>
                                            <c:choose>
                                                <c:when test="${p.productDiscount == 0}">
                                                    <span class="aa-product-price">${p.productPrice} VNĐ</span>
                                                    <span class="aa-product-price"></span>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach items="${PRODUCT_SEARCH_AFTER}" var="pa">
                                                        <c:if test="${pa.productID == p.productID}">
                                                            <span class="aa-product-price">${pa.productPrice} VNĐ</span>
                                                            <span class="aa-product-price"><del>${p.productPrice} VNĐ</del></span>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </figcaption>
                                    </figure>
                                    <c:if test="${p.productDiscount != 0}">
                                        <!-- product badge -->
                                        <span class="aa-badge aa-sale">- ${p.productDiscount}%</span>
                                    </c:if>
                                </li>
                            </c:forEach>                                      
                        </ul>
                    </div>
                </div>
                <nav aria-label="Page navigation" style="float: right">
                    <ul class="pagination">
                        <c:if test="${PAGE_TAG>1}">
                            <li class="page-item"><a class="page-link" href="product?pageNum=${PAGE_TAG-1}">Previous</a></li>
                        </c:if>
                        <c:forEach begin="1" end="${END_PAGE}" var="page">
                            <li class="page-item ${page==PAGE_TAG?'active':''}"><a class="page-link active" href="product?pageNum=${page}">${page}</a></li>
                        </c:forEach>
                        <c:if test="${PAGE_TAG<END_PAGE}">
                            <li class="page-item"><a class="page-link" href="product?pageNum=${PAGE_TAG+1}">Next</a></li>
                        </c:if>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-4 col-md-pull-9">
                <aside class="aa-sidebar">
                    <!-- single sidebar -->
                    <div class="aa-sidebar-widget">
                        <h3>Danh mục</h3>
                        <ul class="aa-catg-nav">
                            <c:forEach items="${CATEGORY_LIST}" var="c">
                                <li class="category ${TAG==c.categoryID?'active':''}">
                                    <a class="${TAG==c.categoryID?"white":"black"}" href="${pageContext.request.contextPath}/product-id?cID=${c.categoryID}">${c.categoryName}</a>
                                </li>
                            </c:forEach>               
                        </ul>
                    </div>


                    <!-- single sidebar -->
                    <div class="aa-sidebar-widget">
                        <h3>Sản phẩm mới</h3>
                        <div class="aa-recently-views">
                            <ul>
                                <c:forEach items="${PRODUCT_NEW}" var="pr" end="2">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/product-detail?pID=${pr.productID}" class="aa-cartbox-img">
                                            <img alt="img" src="${pr.productImg}">
                                        </a>
                                        <div class="aa-cartbox-info">
                                            <h4><a href="${pageContext.request.contextPath}/product-detail?pID=${pr.productID}">${pr.productName}</a></h4>
                                                <c:choose>
                                                    <c:when test="${pr.productDiscount == 0}">
                                                    <p>${pr.productPrice} VNĐ</p>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach items="${PRODUCT_ALL_AFTER}" var="pa">
                                                        <c:if test="${pa.productID == pr.productID}">
                                                            <p>${pa.productPrice} VNĐ</p>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>                    
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>                                 
                    </div>
                    <!-- single sidebar -->

                </aside>
            </div>

        </div>
    </div>
</section>
<!-- / product category -->
<!--  end content-->

<!--  footer-->
<jsp:include page = "./footer/footer.jsp" flush = "true" />
<!-- end footer-->




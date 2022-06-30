<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/client/assets" var="url"/>
<!-- Start header section -->
<jsp:include page = "./header/mainHeader.jsp" flush = "true" />
<!-- / header section -->
<!--  content -->
<!-- catg header banner section -->
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
<section id="aa-catg-head-banner">
    <img src="${pageContext.request.contextPath}/client/assets/images/banner/banner.jpg" height="400" width="1903" alt="banner sản phẩm">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>Sản phẩm</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/MainController?action=Home">Trang chủ</a></li>
                    <li style="color:#fff">Danh sách sản phẩm</li>
                </ol>
            </div>
        </div>
    </div>
</div>
</section>
<!-- / catg header banner section -->
<!-- product category -->
<section id="aa-product-category">
    <div class="container">
        <div class="" style="position: fixed ;z-index: 9999;width: 300px;top:300px;display: flex;justify-content: center;align-items: center;">
            <c:if test="${requestScope.SUCCESS!=null}">
                <div class="alert alert-info" role="alert">
                    <b>${requestScope.SUCCESS}</b>
                </div>
            </c:if>
            <c:if test="${requestScope.ERROR!=null}">
                <div class="alert alert-danger" role="alert">
                    <b>${requestScope.ERROR}</b>
                </div>
            </c:if>
        </div>        
        <div class="row">
            <div class="col-lg-9 col-md-9 col-sm-8 col-md-push-3">
                <div class="aa-product-catg-content">
                    <div class="aa-product-catg-body">
                        <ul class="aa-product-catg">
                            <!-- start single product item -->
                            <c:if test="${empty requestScope.PRODUCT_ALL}">
                                <p style="margin-left: 30px">Chưa có sản phẩm!</p>
                            </c:if>
                            <c:forEach items="${requestScope.PRODUCT_ALL}" var="p">
                                <li>
                                    <figure>
                                        <a class="aa-product-img" href="${pageContext.request.contextPath}/MainController?action=Product-detail&pID=${p.productID}">
                                            <img src="${p.productImg}" alt="${p.productName}">
                                        </a>
                                        <figcaption>
                                            <h4 class="aa-product-title">
                                                <a href="${pageContext.request.contextPath}/MainController?action=Product-detail&pID=${p.productID}">${p.productName}</a>
                                            </h4>
                                            <c:choose>
                                                <c:when test="${p.productDiscount == 0}">
                                                    <span class="aa-product-price">${Double.valueOf(Math.ceil(p.productPrice)).intValue()} VNĐ</span>
                                                    <span class="aa-product-price"></span>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach items="${PRODUCT_ALL_AFTER}" var="pa">
                                                        <c:if test="${pa.productID == p.productID}">
                                                            <span class="aa-product-price">${Double.valueOf(p.productPrice*(1-Double.valueOf(p.productDiscount)/100)).intValue()} VNĐ</span>
                                                            <span class="aa-product-price"><del>${Double.valueOf(p.productPrice).intValue()} VNĐ</del></span>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </figcaption>
                                        <c:choose>
                                            <c:when test="${p.productStatus == 1}"> 
                                                <a class="aa-add-card-btn"href="${pageContext.request.contextPath}/MainController?action=Add-Cart&product-id=${p.productID}">
                                                    <span class="fa fa-shopping-cart"></span>Add to Cart
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <a class="aa-add-card-btn"href="${pageContext.request.contextPath}/MainController?action=Add-Cart&product-id=${p.productID}">
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
                        </ul>
                        <!-- / quick view modal -->   
                    </div>
                </div>
                <!--Page Navigation-->
                <nav aria-label="Page navigation" style="float: right">
                    <ul class="pagination">
                        <c:if test="${requestScope.PAGE_TAG>1}">
                            <li class="page-item"><a class="page-link" href="MainController?action=Product&pageNum=${requestScope.PAGE_TAG-1}">Previous</a></li>
                            </c:if>
                            <c:forEach begin="1" end="${requestScope.END_PAGE}" var="page">
                            <li class="page-item ${page==requestScope.PAGE_TAG?'active':''}">
                                <a class="page-link active" href="MainController?action=Product&pageNum=${page}">${page}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${requestScope.PAGE_TAG<requestScope.END_PAGE}">
                            <li class="page-item"><a class="page-link" href="MainController?action=Product&pageNum=${requestScope.PAGE_TAG+1}">Next</a></li>
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
                            <c:forEach items="${requestScope.CATEGORY_LIST}" var="c">
                                <li class="category ${requestScope.TAG==c.categoryID?'active':''}">
                                    <a class="${requestScope.TAG==c.categoryID?"white":"black"}" href="MainController?action=Product-id&cID=${c.categoryID}">${c.categoryName}</a>
                                </li>
                            </c:forEach>                
                        </ul>
                    </div>
                    <!-- single sidebar -->
                    <!-- single sidebar -->
                    <div class="aa-sidebar-widget">
                        <h3>Sản phẩm mới</h3>
                        <div class="aa-recently-views">
                            <ul>
                                <c:forEach items="${requestScope.PRODUCT_NEW}" var="pr" end="2">
                                    <li>
                                        <a href="MainController?action=Product-detail&pID=${pr.productID}" class="aa-cartbox-img">
                                            <img alt="img" src="${pr.productImg}">
                                        </a>
                                        <div class="aa-cartbox-info">
                                            <h4><a href="MainController?action=Product-detail&pID=${pr.productID}">${pr.productName}</a></h4>
                                                <c:choose>
                                                    <c:when test="${pr.productDiscount == 0}">
                                                    <p>${Double.parseDouble(pr.productPrice).intValue()} VNĐ</p>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach items="${requestScope.PRODUCT_ALL_AFTER}" var="pa">
                                                        <c:if test="${pa.productID == pr.productID}">
                                                            <span class="aa-product-price">${Double.valueOf(pa.productPrice*(1-Double.valueOf(pa.productDiscount)/100)).intValue()} VNĐ</span>
                                                            <span class="aa-product-price"><del>${Double.valueOf(pa.productPrice).intValue()} VNĐ</del></span>
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




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/client/assets" var="url"/>

<!-- Start header section -->
<jsp:include page = "./header/mainHeader.jsp" flush = "true" />
<!-- / header section -->

<!--  content -->
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
    <img src="${pageContext.request.contextPath}/client/assets/images/banner/banner.jpg" alt="banner blog" width="1903" height="400">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>Tin tức</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
                    <li style="color:#fff">Tin tức</li>
                </ol>
            </div>
        </div>
    </div>
</section>
<!-- / catg header banner section -->

<!-- Blog Archive -->
<section id="aa-blog-archive">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-blog-archive-area">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="aa-blog-content">
                                <div class="row">
                                    <c:forEach items="${requestScope.BLOG_LIST}" var="bn">
                                        <div style="height: 350px;"  class="col-md-4 col-sm-12">
                                            <div  class="aa-latest-blog-single">
                                                <figure class="aa-blog-img">                    
                                                    <a href="MainController?action=Blog-detail&bID=${bn.blogNewID}">
                                                        <img class="img-responsive" src="${bn.blogImg}" alt="Tin tức ${bn.title}">
                                                    </a>                       
                                                </figure>
                                                <div class="aa-blog-info">
                                                    <h3 class="aa-blog-title">
                                                        <a href="MainController?action=Blog-detail&bID=${bn.blogNewID}">${bn.title}</a>
                                                    </h3>
                                                    <!--{bn.content}-->
                                                    <a href="MainController?action=Blog-detail&bID=${bn.blogNewID}" class="aa-read-mor-btn">
                                                        Read more<span class="fa fa-long-arrow-right"></span></a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <!-- Blog Pagination -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Blog Archive -->
<!--  end content-->
<!--  footer-->
<jsp:include page = "./footer/footer.jsp" flush = "true" />
<!-- end footer-->



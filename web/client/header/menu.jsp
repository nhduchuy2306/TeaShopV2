<%@page import="tea.user.UserDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%
    UserDTO u = (UserDTO) session.getAttribute("USER_LOGIN");
%>

<section id="menu">
    <div class="container">
        <div class="menu-area">
            <!-- Navbar -->
            <div class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="navbar-collapse collapse">
                    <!-- Left nav -->
                    <ul class="nav navbar-nav">
                        <li><a href="MainController?action=Home">TRANG CHỦ</a></li>
                        <li><a href="MainController?action=Introduce">GIỚI THIỆU</a></li>
                        <li><a href="${pageContext.request.contextPath}/MainController?action=Product&pageNum=1">SẢN PHẨM</a></li>
                            <% if (u != null && u.getRoleID().equals("1")) {%>
                        <li><a href="#" data-toggle="dropdown" role="button" aria-expanded="true">MANAGER
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">                
                                <li><a href="${pageContext.request.contextPath}/MainController?action=Admin-user-management">USER</a></li>
                                <li><a href="${pageContext.request.contextPath}/MainController?action=Admin-product-management">PRODUCT</a></li>
                                <li><a href="${pageContext.request.contextPath}/MainController?action=Admin-Blog">BLOG</a></li>
                                <!--<li><a href="MainController?action=Admin-product-management">PRODUCT</a></li>-->
                            </ul>
                        </li>
                        <% } 
                        %>
                        <li><a href="${pageContext.request.contextPath}/MainController?action=Blog-archive">TIN TỨC</a></li>
                        <li><a href="${pageContext.request.contextPath}/MainController?action=Security">CHÍNH SÁCH</a></li>
                        <li><a href="${pageContext.request.contextPath}/MainController?action=Contact">LIÊN HỆ</a></li>
                        <li class="aa-search"><!-- search box -->
                            <div style="display: flex;justify-content: center;margin-bottom: 10px; align-items: center">
                                <form style="text-align: right; width: 100%;" class="navbar-form navbar-left" action="MainController">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Search&hellip;" name="search" value="">
                                    </div>
                                    <button type="submit" class="btn btn-default" name="action" value="search">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                    </button>
                                </form>
                            </div>
                            <!-- / search box -->
                        </li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </div>       
    </div>
</section>

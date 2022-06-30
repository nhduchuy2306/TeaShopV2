<%@page import="tea.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%
    UserDTO u = (UserDTO) session.getAttribute("USER_LOGIN");
%>

<!-- start header top  -->
<div class="aa-header-top">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-header-top-area">
                    <!-- start header top left -->
                    <div class="aa-header-top-left">
                        <div class="cellphone hidden-xs">
                            <p><span class="fas fa-home"></span>Bubble Milktea shop</p>
                        </div>
                        <!-- start language -->
                        <div class="aa-language">
                            <div class="dropdown">
                                <a class="btn dropdown-toggle" href="#" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    <img src="${pageContext.request.contextPath}/client/assets/images/flag/vietnam.png" alt="vietnam flag">VIETNAM
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                    <li><a href="#"><img src="${pageContext.request.contextPath}/client/assets/images/flag/french.jpg" alt="">FRENCH</a></li>
                                    <li><a href="#"><img src="${pageContext.request.contextPath}/client/assets/images/flag/english.jpg" alt="">ENGLISH</a></li>
                                </ul>
                            </div>
                        </div>
                        <!--end language-->
                    </div>
                    <!-- / header top left -->
                    <div class="aa-header-top-right">
                        <ul class="aa-head-top-nav-right">
                            <% if (u != null) {%>
                                <li>
                                    <a><strong>Welcome</strong> <%=u.getName()%> </a>
                                </li>
                                <li class="hidden-xs"><a href="${pageContext.request.contextPath}/MainController?action=Logout">Đăng xuất</a></li>
                            <%}%>
                            <% if(u==null){%>
                                <li class="hidden-xs"><a href="${pageContext.request.contextPath}/client/register.jsp">Đăng ký</a></li>
                                <li><a href="${pageContext.request.contextPath}/client/login.jsp">Đăng nhập</a></li>
                            <%}%>
                            <!--  data-toggle="modal" data-target="#login-modal" -->
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- / header top  -->

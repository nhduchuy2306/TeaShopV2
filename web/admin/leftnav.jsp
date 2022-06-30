<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<div class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar" style="width: 100%; z-index: 1000"> 
    <ul class="list-unstyled position-fixed">
        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/MainController?action=Admin-user-management">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">Admin</div>
        </a>
        <!-- Divider -->
        <hr class="sidebar-divider my-0">
        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard.jsp">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span></a>
        </li>
        <!-- Nav Item - Tables -->
        <%
            String action = request.getParameter("action");
            String tag_Product = ""; String tag_User = ""; String tag_Blog = "";
            if (action != null) {
                if(action.equals("Admin-product-management") || action.equals("Admin-Edit-Product") 
                        || action.equals("Admin-Remove-Product") || action.equals("Admin-Search-Product")
                        || action.equals("Admin-Add-Product")){
                    tag_Product = "active";
                }
                if(action.equals("Admin-user-management") || action.equals("Admin-Edit-User") 
                        || action.equals("Admin-Remove-User") || action.equals("Admin-Search-User")){
                    tag_User = "active";
                }
                if(action.equals("Admin-Blog") || action.equals("Admin-Blog-Edit") 
                        || action.equals("Admin-Blog-Remove") || action.equals("Admin-Blog-Add")
                        || action.equals("Admin-Search-Blog")){
                    tag_Blog = "active";
                }
            }
        %>
        <li class="nav-item <%=tag_Product%>">
            <a class="nav-link" href="${pageContext.request.contextPath}/MainController?action=Admin-product-management">
                <i class="fas fa-fw fa-table"></i>
                <span>Product</span>
            </a>
        </li>
        <li class="nav-item <%=tag_User%>">
            <a class="nav-link" href="${pageContext.request.contextPath}/MainController?action=Admin-user-management">
                <i class="fas fa-fw fa-table"></i>
                <span>User</span>
            </a>
        </li>
        <li class="nav-item <%=tag_Blog%>">
            <a class="nav-link" href="${pageContext.request.contextPath}/MainController?action=Admin-Blog">
                <i class="fas fa-fw fa-table"></i>
                <span>Blog</span>
            </a>
        </li>
    </ul>
</div>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="navbar navbar-expand mb-4 static-top topbar mt-2">
    <nav class="position-fixed bg-white navbar-light w-100" style="z-index: 1000;">
        <!-- Sidebar Toggle (Topbar) -->
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
        </button>
        <!-- Topbar Search -->
        <!-- Topbar Navbar -->
        <ul class="navbar-nav w-100">
            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow d-flex justify-content-around align-items-center w-100">
                <h1 class="mr-2 d-none d-lg-inline text-gray-600">Welcome <Strong>${sessionScope.USER_LOGIN.name}</strong></h1>
                <!-- Dropdown - User Information -->
                <div class="animated--grow-in" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        Logout
                    </a>
                </div>
            </li>
        </ul>
    </nav>
</div>
<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/MainController?action=Logout">Logout</a>
            </div>
        </div>
    </div>
</div>


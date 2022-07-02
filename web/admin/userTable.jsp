<%@page import="tea.user.UserDTO"%>
<%@page import=" java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!-- Sidebar -->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="${pageContext.request.contextPath}/client/assets/images/logoAndSomeimg/favicon.ico" type="image/x-icon">
        <title>Admin</title>
        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/admin/css/sb-admin-2.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    </head>
    <body id="page-top">
        <!-- Page Wrapper -->
        <div id="wrapper">
            <jsp:include page="/admin/leftnav.jsp"></jsp:include>
                <!-- End of Sidebar -->
                <div id="content-wrapper" class="d-flex flex-column " style="margin-bottom: 300px">
                    <!-- Main Content -->
                    <div id="content">
                        <!-- Topbar -->
                    <jsp:include page="/admin/menu.jsp"></jsp:include>
                        <!-- End of Topbar -->
                    </div>
                    <div class="container-fluid">
                    <c:if test="${requestScope.ERROR!=null}">
                        <div class="alert alert-danger text-center" role="alert">
                            <h1>${requestScope.ERROR}</h1>
                        </div>
                    </c:if>
                    <c:if test="${requestScope.SUCCESS!=null}">
                        <div class="alert alert-success text-center" role="alert">
                            <h1>${requestScope.SUCCESS}</h1>
                        </div>
                    </c:if>
                    <div class="card shadow mb-4" style="margin-top: 100px">
                        <div class="card-header py-3 text-center">
                            <h1 class="m-0 font-weight-bold text-primary">User Table</h1>
                        </div>
                        <div class="card-header py-3 text-right">
                            <form action="MainController" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-1 small" placeholder="Search for..."
                                           aria-label="Search" aria-describedby="basic-addon2" name="searchadmin" value="${search}">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="submit" name="action" value="Admin-Search-User">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!--dataTable-->
                        <div class="card-body mx-auto">
                            <div class="table-responsive">
                                <table class="table table-bordered table-responsive" id="" width="100%" cellspacing="0" style="font-size: 13px">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>User ID</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Address</th>
                                            <th>Phone Number</th>
                                            <th>Created</th>
                                            <th>Role Name</th>
                                            <th>Username</th>
                                            <th>Password</th>
                                            <th>Edit</th>
                                            <th>Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.LIST_USER}" varStatus="counter" var="u">
                                            <tr>
                                                <td>${counter.count}</td>
                                                <td>${u.userID}</td>
                                                <td>${u.name}</td>
                                                <td>${u.email}</td>
                                                <td>${u.address}</td>
                                                <td>${u.phone}</td>
                                                <td>${u.create}</td>
                                                <td>${u.roleID}</td>
                                                <td>${u.username}</td>
                                                <td>*******</td>
                                                <!--edit-->
                                                <td>
                                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Edit${u.userID}">
                                                        <i class="fas fa-pen"></i>
                                                    </button>
                                                    <!--Modal for edit-->
                                                    <div class="modal fade" id="Edit${u.userID}" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h1 class="modal-title text-center" id="exampleModalLabel">Edit User ${u.name}</h1>
                                                                </div>
                                                                <form action="MainController" method="get">
                                                                    <div class="modal-body">
                                                                        <div class="form-group">
                                                                            <label for="">User ID: </label>
                                                                            <input class="form-control form-control-user" type="text" placeholder="Name" name="userID" value="${u.userID}" readonly> 
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="">Name: </label>
                                                                            <input class="form-control form-control-user" type="text" placeholder="Name" name="name" value="${u.name}">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="">Email: </label>
                                                                            <input class="form-control form-control-user" type="text" placeholder="useremail@gmail.com" name="email" value="${u.email}">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="">Address: </label>
                                                                            <input class="form-control form-control-user" type="text" placeholder="Địa chỉ" name="address" value="${u.address}">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="">Phone Number: </label>
                                                                            <input class="form-control form-control-user" type="text" placeholder="Số điện thoại" name="phone" value="${u.phone}">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="">Created: </label>
                                                                            <input class="form-control form-control-user" type="date" placeholder="date" value="<%=String.valueOf(java.time.LocalDate.now())%>" name="created" id="the-date">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="">Role: </label>
                                                                            <input class="form-control form-control-user" type="text" name="role" value="${u.roleID}">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="">Username: </label>
                                                                            <input class="form-control form-control-user" type="text" placeholder="Username" value="${u.username}" name="username">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="">Password: </label>
                                                                            <input class="form-control form-control-user" type="text" placeholder="Username" value="******" name="password" readonly>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="modal-footer">
                                                                        <button type="submit" class="btn btn-primary" name="action" value="Admin-Edit-User">Edit</button>
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <!--delete-->
                                                <td>
                                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Delete${u.userID}">
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                    <div class="modal fade" id="Delete${u.userID}" tabindex="-1" role="dialog" aria-labelledby="remove" aria-hidden="true">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h1 class="modal-title text-center" id="exampleModalLabel">Remove User ${u.name}</h1>
                                                                </div>
                                                                <form action="MainController" method="post">
                                                                    <div class="modal-body">
                                                                        <input type="hidden" value="${u.userID}" name="uID">
                                                                        <h2>Do you want to remove user ${u.name}?</h2>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="submit" class="btn btn-secondary" name="action" value="Admin-Remove-User">Remove</button>
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End of Main Content -->
                <!-- Footer -->
                <jsp:include page="/admin/footer.jsp"></jsp:include>
                    <!-- End of Footer -->
                </div>
            </div>
            <!-- Content Wrapper -->
            <!-- End of Content Wrapper -->
            <!-- End of Page Wrapper -->
            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>
            <!-- Bootstrap core JavaScript-->
            <script src="${pageContext.request.contextPath}/admin/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
        <!-- Custom scripts for all pages-->
        <script src="${pageContext.request.contextPath}/admin/js/sb-admin-2.min.js"></script>
        <!-- Page level plugins -->
        <!-- Page level custom scripts -->
        <script src="${pageContext.request.contextPath}/admin/js/sb-admin-2.min.js"></script>
        <!-- Page level plugins -->
        <script src="${pageContext.request.contextPath}/admin/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
        <!-- Page level custom scripts -->
        <script src="${pageContext.request.contextPath}/admin/js/demo/datatables-demo.js"></script>
    </body>
</html>
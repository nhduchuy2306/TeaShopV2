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
                            <h1 class="m-0 font-weight-bold text-primary">Product Table</h1>
                        </div>
                        <div class="card-header py-3 text-right">
                            <form action="MainController" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-1 small" placeholder="Search for..."
                                           aria-label="Search" aria-describedby="basic-addon2" name="searchadmin" value="${search}">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="submit" name="action" value="Admin-Search-Product">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Add">
                                <i class="fa fa-plus-circle" aria-hidden="true"></i> Add Product
                            </button>
                        </div>
                        <!--Add product-->
                        <div class="modal fade" id="Add" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title text-center" id="exampleModalLabel">Add Product</h1>
                                    </div>
                                    <form action="MainController" method="get">
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="">Product ID: </label>
                                                <input class="form-control form-control-user" type="text" placeholder="ID" name="productID" value="">
                                            </div>
                                            <div class="form-group">
                                                <label for="">Product Name: </label>
                                                <input class="form-control form-control-user" type="text" placeholder="Name" name="name" value="">
                                            </div>
                                            <div class="form-group">
                                                <label for="">Product Price: </label>
                                                <input class="form-control form-control-user" type="text" placeholder="10.000" name="price" value="">
                                            </div>
                                            <div class="form-group">
                                                <label for="">Status: </label>
                                                <input class="form-control form-control-user" type="text" placeholder="Status" name="status" value="">
                                            </div>
                                            <div class="form-group">
                                                <label for="">Description: </label>
                                                <textarea class="form-control form-control-user" name="description" rows="3" cols="50"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="">Discount: </label>
                                                <input class="form-control form-control-user" type="text" placeholder="Discount" name="discount" value="">
                                            </div>
                                            <div class="form-group">
                                                <label for="">Img Link: </label>
                                                <textarea class="form-control form-control-user" name="img-link" rows="3" cols="50"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="">Created: </label>
                                                <input class="input_css" type="date" value="<%=String.valueOf(java.time.LocalDate.now())%>" name="created" id="the-date">
                                            </div>
                                            <div class="form-group">
                                                <label for="">Category ID: </label>
                                                <input class="input_css" type="text" name="categoryID" value="">
                                            </div>
                                            <div class="form-group">
                                                <label for="">Quantity: </label>
                                                <input class="input_css" type="text" placeholder="Quantity" value="" name="quantity">
                                            </div>
                                        </div>
                                        <input type="hidden" class="form-control" placeholder="Search" name="searchadmin" value="${productName}">
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-primary" name="action" value="Admin-Add-Product">Add</button>
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!--dataTable-->
                        <div class="card-body" >
                            <div class="table-responsive">
                                <table class="table table-bordered table-responsive" id="" width="100%" cellspacing="0" style="font-size: 13px">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Product ID</th>
                                            <th>Name</th>
                                            <th>Price</th>
                                            <th>Status</th>
                                            <th>Description</th>
                                            <th>Discount</th>
                                            <th>Image Link</th>
                                            <th>Created</th>
                                            <th>Category ID</th>
                                            <th>Quantity</th>
                                            <th>Edit</th>
                                            <th>Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.PRODUCT_LIST}" varStatus="counter" var="p">
                                            <tr>
                                                <td>${counter.count}</td>
                                                <td>${p.productID}</td>
                                                <td>${p.productName}</td>
                                                <td>${p.productPrice}</td>
                                                <td>${p.productStatus}</td>
                                                <td>${p.productDescription}</td>
                                                <td>${p.productDiscount}</td>
                                                <td>${p.productImg}</td>
                                                <td>${p.productCreated}</td>
                                                <td>${p.categoryID}</td>
                                                <td>${p.quantity}</td>
                                                <td>
                                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Edit${p.productID}">
                                                        <i class="fas fa-pen"></i>
                                                    </button>
                                                    <!--Modal for edit-->
                                                    <div class="modal fade" id="Edit${p.productID}" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h1 class="modal-title text-center" id="exampleModalLabel">Edit Product ${p.productName}</h1>
                                                                </div>
                                                                <form action="MainController" method="get">
                                                                    <div class="modal-body">
                                                                        <div class="form-group">
                                                                            <label for="">Product ID: </label>
                                                                            <input class="form-control form-control-user" type="text" placeholder="ID" name="productID" value="${p.productID}">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="">Product Name: </label>
                                                                            <input class="form-control form-control-user" type="text" placeholder="Name" name="name" value="${p.productName}">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="">Product Price: </label>
                                                                            <input class="form-control form-control-user" type="text" placeholder="10.000" name="price" value="${p.productPrice}">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="">Status: </label>
                                                                            <input class="form-control form-control-user" type="text" placeholder="Status" name="status" value="${p.productStatus}">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="">Description: </label>
                                                                            <textarea class="form-control form-control-user" name="description" rows="3" cols="50">${p.productDescription}</textarea>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="">Discount: </label>
                                                                            <input class="form-control form-control-user" type="text" placeholder="Discount" name="discount" value="${p.productDiscount}">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="">Img Link: </label>
                                                                            <textarea class="form-control form-control-user" name="img-link" rows="3" cols="50">${p.productImg}</textarea>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="">Created: </label>
                                                                            <input class="input_css" type="date" value="<%=String.valueOf(java.time.LocalDate.now())%>" name="created" id="the-date">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="">Category ID: </label>
                                                                            <input class="form-control form-control-user" type="text" name="categoryID" value="${p.categoryID}">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="">Quantity: </label>
                                                                            <input class="form-control form-control-user" type="text" placeholder="Quantity" value="${p.quantity}" name="quantity">
                                                                        </div>
                                                                    </div>
                                                                    <input type="hidden" class="form-control" placeholder="Search" name="searchadmin" value="${productName}">
                                                                    <div class="modal-footer">
                                                                        <button type="submit" class="btn btn-primary" name="action" value="Admin-Edit-Product">Edit</button>
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <!--delete-->
                                                <td>
                                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Delete${p.productID}">
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                    <div class="modal fade" id="Delete${p.productID}" tabindex="-1" role="dialog" aria-labelledby="remove" aria-hidden="true">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <form action="MainController" method="get">
                                                                    <div class="modal-body">
                                                                        <input type="hidden" value="${p.productID}" name="pID">
                                                                        <h2>Do you want to remove Product ${p.productName}?</h2>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="submit" class="btn btn-secondary" name="action" value="Admin-Remove-Product">Remove</button>
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



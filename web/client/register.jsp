<%@page import="tea.user.UserError"%>
<%@page import="tea.google.GoogleUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="${pageContext.request.contextPath}/client/assets/images/logoAndSomeimg/favicon.ico" type="image/x-icon">
        <title>Register</title>
        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/admin/css/sb-admin-2.min.css" rel="stylesheet">
    </head>
    <%
        GoogleUser user = (GoogleUser) session.getAttribute("GOOGLE_LOGIN");
        UserError userErrror = (UserError) request.getAttribute("USER_ERROR");
        if (userErrror == null) {
            userErrror = new UserError();
        }
        if (user == null) {
            user = new GoogleUser();
        }
        
    %>
    <body class="bg-gradient-primary">
        <div class="container">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <a href="${pageContext.request.contextPath}/MainController?action=Home" 
                       class="d-inline-flex alert alert-primary justify-content-center text-center">
                        &DoubleLeftArrow; Turn Back To Home Page
                    </a>
                    <!-- Nested Row within Card Body -->
                    <div class="row justify-content-center">
                        <div class="col-lg-7">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                                </div>
                                <form class="user" action="${pageContext.request.contextPath}/MainController" method="post">
                                    <div class="form-group">
                                        <p>Name: </p>
                                        <input type="text" class="form-control form-control-user" id="exampleInputEmail"
                                               placeholder="Name" name="name" value="<%=user.getName()%>">
                                        <p style="color: red;"><%=userErrror.getName()%></p>
                                    </div>
                                    <div class="form-group">
                                        <p>Phone Number: </p>
                                        <input type="text" class="form-control form-control-user" id="exampleInputEmail"
                                               placeholder="Phone Number" name="phone">
                                        <p style="color: red;"><%=userErrror.getPhone()%></p>
                                    </div>
                                    <div class="form-group">
                                        <p>Address: </p>
                                        <input type="text" class="form-control form-control-user" id="exampleInputEmail"
                                               placeholder="Address" name="address">
                                        <p style="color: red;"><%=userErrror.getAddress()%></p>
                                    </div>
                                    <div class="form-group">
                                        <p>Email: </p>
                                        <input type="text" class="form-control form-control-user" id="exampleInputEmail"
                                               placeholder="Email" name="email" value="<%=user.getEmail()%>">
                                        <p style="color: red;"><%=userErrror.getEmail()%></p>
                                    </div>
                                    <div class="form-group">
                                        <p>Role: </p>
                                        <input type="text" class="form-control form-control-user" id="exampleInputEmail"
                                               placeholder="Role" value="US" name="role" readonly>
                                    </div>
                                    <div class="form-group">
                                        <p>Username: </p>
                                        <input type="text" class="form-control form-control-user" id="exampleInputEmail"
                                               placeholder="Username" name="username">
                                        <p style="color: red;"><%=userErrror.getUsername()%></p>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="password" class="form-control form-control-user"
                                                   id="exampleInputPassword" placeholder="Password" name="password">
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="password" class="form-control form-control-user"
                                                   id="exampleRepeatPassword" placeholder="Repeat Password" name="confirm">
                                            <p style="color: red;"><%=userErrror.getConfirm()%></p>
                                        </div>
                                    </div>
                                    <input style="display: none;" type="date" value="<%=String.valueOf(java.time.LocalDate.now())%>" placeholder="Password" name="created" id="the-date">

                                    <!--<div class="g-recaptcha" data-sitekey="6LeEfl8gAAAAANeFU5VN0qkO7rufTwu5H0Zs_hYk"></div>-->
                                    <button type="submit" name="action" value="Register" class="btn btn-primary btn-user btn-block">
                                        Register Account
                                    </button>
                                    <hr>
                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/Tea/login-google&response_type=code&client_id=1033655643110-ddt6b8tu5sq9k8i6rkgc4ecr89nsu1fl.apps.googleusercontent.com&approval_prompt=force" class="btn btn-google btn-user btn-block">
                                        <i class="fab fa-google fa-fw"></i> Register with Google
                                    </a>
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="${pageContext.request.contextPath}/client/forgotpassword.jsp">Forgot Password?</a>
                                </div>
                                <div class="text-center">
                                    <a class="small" href="${pageContext.request.contextPath}/client/loginV2.jsp">Already have an account? Login!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="${pageContext.request.contextPath}/admin/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="${pageContext.request.contextPath}/admin/js/sb-admin-2.min.js"></script>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    </body>

</html>

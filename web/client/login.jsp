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
        <title>Login</title>
        <!-- Custom fonts for this template-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.1/css/fontawesome.min.css" integrity="sha384-zIaWifL2YFF1qaDiAo0JFgsmasocJ/rqu7LKYH8CoBEXqGbb9eO+Xi3s6fQhgFWM" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/admin/css/sb-admin-2.min.css" rel="stylesheet">
    </head>
    <body class="bg-gradient-primary">
        <div class="container">
            <!-- Outer Row -->
            <div class="row justify-content-center">
                <div class="col-xl-10 col-lg-12 col-md-9">
                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <a href="${pageContext.request.contextPath}/MainController?action=Home" 
                               class="d-inline-flex alert alert-primary justify-content-center text-center">
                                &DoubleLeftArrow; Turn Back To Home Page
                            </a>
                            <div class="row justify-content-center">
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">LOGIN</h1>
                                        </div>
                                        <form class="user" action="${pageContext.request.contextPath}/MainController" method="post">
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control" placeholder="Username..." name="username" aria-label="Recipient's username" aria-describedby="basic-addon2">
                                            </div>
                                            <div class="input-group mb-3">
                                                <input type="password" class="password form-control" placeholder="Password..." name="password" aria-label="Recipient's username" aria-describedby="basic-addon2">
                                                <div class="input-group-append">
                                                    <button onclick="showPassword();" class="btn btn-secondary" type="button">
                                                        <i class="fa fa-eye showpassword" aria-hidden="true"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox small">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck">
                                                    <label class="custom-control-label" for="customCheck">Remember Me</label>
                                                </div>
                                            </div>
                                            <p style="color:red; display:block">
                                                ${requestScope.ERROR_MSG!=null? requestScope.ERROR_MSG:""}
                                            </p>

                                            <div class="g-recaptcha" data-sitekey="6LeEfl8gAAAAANeFU5VN0qkO7rufTwu5H0Zs_hYk"></div>

                                            <button type="submit" value="Login" name="action" class="btn btn-primary btn-user btn-block">
                                                Login
                                            </button>
                                            <hr>
                                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/Tea/login-google&response_type=code&client_id=1033655643110-ddt6b8tu5sq9k8i6rkgc4ecr89nsu1fl.apps.googleusercontent.com&approval_prompt=force" class="btn btn-google btn-user btn-block">
                                                <i class="fab fa-google fa-fw"></i> Login with Google
                                            </a>
                                        </form>
                                        <hr>
                                        <div class="text-center">
                                            <a class="small" href="${pageContext.request.contextPath}/client/register.jsp">Create an Account!</a>
                                        </div>
                                    </div>
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
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <script>
            var password_input = document.querySelector(".password");

            function showPassword() {
                if (password_input.type === 'password') {
                    password_input.type = 'text';
                } else {
                    password_input.type = 'password';
                }
            }
        </script>
    </body>
</html>

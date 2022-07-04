<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <meta name="google-signin-client_id" content="1033655643110-ddt6b8tu5sq9k8i6rkgc4ecr89nsu1fl.apps.googleusercontent.com">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BubbleTea</title>
        <!-- Font awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css"
              integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/client/assets/css/font-awesome.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/client/assets/css/bootstrap.css" rel="stylesheet">   
        <link rel="icon" href="${pageContext.request.contextPath}/client/assets/images/logoAndSomeimg/favicon.ico" type="image/x-icon">
        <!-- SmartMenus jQuery Bootstrap Addon CSS -->
        <link href="${pageContext.request.contextPath}/client/assets/css/jquery.smartmenus.bootstrap.css" rel="stylesheet">
        <!-- Product view slider -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/assets/css/jquery.simpleLens.css">    
        <!-- slick slider -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/assets/css/slick.css">
        <!-- price picker slider -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/assets/css/nouislider.css">
        <!-- Theme color -->
        <link id="switcher" href="${pageContext.request.contextPath}/client/assets/css/theme-color/default-theme.css" rel="stylesheet">
        <!-- Top Slider CSS -->
        <link href="${pageContext.request.contextPath}/client/assets/css/sequence-theme.modern-slide-in.css" rel="stylesheet" media="all">
        <!-- Main style sheet -->
        <link href="${pageContext.request.contextPath}/client/assets/css/style.css" rel="stylesheet">    
        <!-- Google Font -->
        <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body>
<!--         Messenger Plugin chat Code 
        <div id="fb-root"></div>

         Your Plugin chat code 
        <div id="fb-customer-chat" class="fb-customerchat">
        </div>

        <script>
            var chatbox = document.getElementById('fb-customer-chat');
            chatbox.setAttribute("page_id", "104392509003626");
            chatbox.setAttribute("attribution", "biz_inbox");
        </script>

         Your SDK code 
        <script>
            window.fbAsyncInit = function () {
                FB.init({
                    xfbml: true,
                    version: 'v14.0'
                });
            };

            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = 'https://connect.facebook.net/vi_VN/sdk/xfbml.customerchat.js';
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
        </script>-->

        <header id="aa-header">
            <jsp:include page = "topHeader.jsp" flush = "true" />
            <!-- start header bottom  -->
            <jsp:include page = "bottomHeader.jsp" flush = "true" />
            <!-- / header bottom  -->
        </header>
        <!-- menu -->
        <jsp:include page = "menu.jsp" flush = "true" />   
        <!-- SCROLL TOP BUTTON -->
        <a class="scrollToTop" style="margin-bottom: 33px;margin-right: 10px;display: flex;justify-content: center;align-items: center;" href="#">
            <i class="fa fa-chevron-up"></i>
        </a>
        <!-- END SCROLL TOP BUTTON -->

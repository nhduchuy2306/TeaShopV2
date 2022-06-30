<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!-- jQuery library -->
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<!--Start of Tawk.to Script-->
<script type="text/javascript">
    var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
    (function () {
        var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
        s1.async = true;
        s1.src = 'https://embed.tawk.to/6299ddf17b967b117992b48e/1g4kglunv';
        s1.charset = 'UTF-8';
        s1.setAttribute('crossorigin', '*');
        s0.parentNode.insertBefore(s1, s0);
    })();
</script>
<!--End of Tawk.to Script-->
<!--End of Tawk.to Script-->
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>-->
<!--<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>-->
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${pageContext.request.contextPath}/client/assets/js/bootstrap.js"></script>  
<!-- SmartMenus jQuery plugin -->
<!-- SmartMenus jQuery Bootstrap Addon -->
<!-- To Slider JS -->
<script src="${pageContext.request.contextPath}/client/assets/js/sequence.js"></script>
<script src="${pageContext.request.contextPath}/client/assets/js/sequence-theme.modern-slide-in.js"></script>  
<!-- Product view slider -->
<script type="text/javascript" src="${pageContext.request.contextPath}/client/assets/js/jquery.simpleGallery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/client/assets/js/jquery.simpleLens.js"></script>
<!-- slick slider -->
<script type="text/javascript" src="${pageContext.request.contextPath}/client/assets/js/slick.js"></script>
<!-- Price picker slider -->
<script type="text/javascript" src="${pageContext.request.contextPath}/client/assets/js/nouislider.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/client/assets/js/validate.js"></script>
<!-- Custom js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/client/assets/js/custom.js"></script> 

<script>
    var password_input = document.querySelector(".password");

    function showPassword() {
        if (password_input.type === 'password') {
            password_input.type = 'text';
        } else {
            password_input.type = 'password';
        }
    }
    <c:if test="${requestScope.SUCCESS!=null}">
    $(document).ready(function () {
        $("#myModal").modal('show');
    });
    </c:if>
    $('.btn').on('click', function () {
        var $this = $(this);
        $this.button('loading');
        setTimeout(function () {
            $this.button('reset');
        }, 8000);
    });
</script>




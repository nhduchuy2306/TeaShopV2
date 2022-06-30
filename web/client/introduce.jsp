<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/client/assets" var="url"/>
<!-- Start header section -->
<jsp:include page = "./header/mainHeader.jsp" flush = "true" />


<section id="aa-catg-head-banner">
    <img src="${pageContext.request.contextPath}/client/assets/images/banner/banner.jpg" height="400" width="1903" alt="banner sản phẩm">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>Giới thiệu</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/client/index.jsp">Trang chủ</a></li>      
                    <li style="color:#fff">Giới thiệu</li>   
                </ol>
            </div>
        </div>
    </div>
</section>
<section id="aa-product-category">
    <div class="container">
        <div class="row">
            <div>
                <h1 style ="text-align: center; color: red; font-weight: bold">Bubble Milktea</h1><br><br>
                <p>Trải qua hơn 50 năm chắt chiu tinh hoa từ những búp trà xanh và hạt cà phê thượng hạng cùng mong muốn mang lại cho khách hàng những trải nghiệm giá trị nhất khi thưởng thức, 
                    Bubble liên tục là thương hiệu tiên phong với nhiều ý tưởng sáng tạo đi đầu trong ngành trà và cà phê và trà sữa, <strong> BubbleTea</strong>. Với sứ mệnh trở thành một trong những 
                    nhà cung cấp thức uống hàng đầu
                    Việt Nam đưa đến người tiêu dùng những loại thức uống tuyệt vời với mục đích là 
                    <strong>“Mang hương vị hiện đại về với gia đình bạn”</strong>. Với quy trình làm việc và kiểm soát nghiêm ngặt BubbleTea đến nay, BubbleTea xây dựng hơn 80 
                    cửa hàng trên khu vực TP.HCM, Bình Dương, Biên Hòa, Cần Thơ, Đà Nẵng, Nha Trang, Hà Nội phục vụ những thức uống tươi ngon từ trà và cà phê. Không dừng lại tại đó, 
                    chúng tôi tiếp tục định hướng phát triển mở rộng hệ thống cửa hàng trải dài từ Nam ra Bắc. 
                    Tăng độ phủ của sản phẩm đến tất cả các hệ thống: siêu thị, cửa hàng tiện lợi…</p><br>
                <img class="img-responsive" style="width: 100%" src="${pageContext.request.contextPath}/client/assets/images/banner/Bubble-tea-2.jpg" alt="bubble tea"/> <br/> <br>
                <p>Hoạt động với phương châm “Chất lượng khởi nguồn từ đam mê”, cùng nhau, chúng tôi đã và đang viết tiếp câu chuyện của một thương hiệu Việt giàu truyền thống, 
                    kết nối tinh túy của nhiều thập niên kinh nghiệm và không ngừng chắt lọc, làm mới mình trong bước chuyển thời gian để trở thành thương hiệu luôn gắn bó với 
                    nhiều thế hệ khách hàng.</p>
                <h2>NHỮNG CỘT MỐC ĐÁNG NHỚ</h2>
                <img class="img-responsive" src="${pageContext.request.contextPath}/client/assets/images/banner/CMDN.jpg"><br><br>
                <h2>TẦM NHÌN</h2>
                <p>1. Với khát vọng không ngừng mở rộng thị trường - phát triển bền vững, BubbleTea phấn đấu trở thành công ty chuyên sản xuất và xuất khẩu trà, 
                    cà phê có giá trị cao tại Việt Nam.</p>
                <p>2. BubbleTea mong muốn tạo nên một thương hiệu Việt với đẳng cấp và chất lượng được thể hiện trong từng sản phẩm, qua đó từng bước khẳng định vị thế trên thị trường quốc tế.</p>
                <br><br>
                <h2>SỨ MỆNH</h2>

                <p>1. <strong>Trở thành người tiên phong của thời đại</strong> với những ý tưởng sáng tạo đi đầu trong ngành trà và cà phê.</p>
                <p>2. <strong>Cùng đưa thương hiệu tỏa sáng,</strong> tạo động lực cho nhau, cùng biến ý tưởng thành hiện thực bằng tinh thần gắn kết, tương tác, biết lắng nghe và tôn trọng.</p>
                <p>3. <strong>Để tạo niềm vui và tình cảm cho khách hàng,</strong> mỗi chúng ta phải thường xuyên liên tục tỏa sáng. Không được để cho năng lực của bản thân bị ngủ quên, 
                    không ngừng thách thức khó khăn, phải luôn luôn tự đổi mới bản thân. </p>
                <p>4. <strong>Tạo ra giá trị cao bằng sự thấu hiểu,</strong> đồng cảm và những đề xuất có giá trị thật sự, thỏa mãn sự hài lòng cho khách hàng.</p>
                <br><br>
                <h2>LĨNH VỰC HOẠT ĐỘNG</h2>

                <p>1. <strong>Sản xuất, xuất khẩu, kinh doanh</strong> các sản phẩm trà và cà phê thành phẩm (đóng gói)</p>

                <p>2. <strong>Kinh doanh dịch vụ</strong> ăn uống tại hệ thống cửa hàng: </p>

                <p>----          Các loại thức ăn, thức uống </p>
                <p>----          Các loại bánh ngọt, bánh mặn </p>
                <p>----          Dịch vụ giao hàng tận nơi </p>
                <br><br><br>
            </div>
        </div>
    </div>
</section>

<!--  footer-->
<jsp:include page = "./footer/footer.jsp" flush = "true" />
<!-- end footer-->

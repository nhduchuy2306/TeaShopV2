USE [master]
GO
/****** Object:  Database [milkteaManagement]    Script Date: 30-Jun-22 8:02:20 ******/
CREATE DATABASE [milkteaManagement]
GO
ALTER DATABASE [milkteaManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [milkteaManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [milkteaManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [milkteaManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [milkteaManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [milkteaManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [milkteaManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [milkteaManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [milkteaManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [milkteaManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [milkteaManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [milkteaManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [milkteaManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [milkteaManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [milkteaManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [milkteaManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [milkteaManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [milkteaManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [milkteaManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [milkteaManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [milkteaManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [milkteaManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [milkteaManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [milkteaManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [milkteaManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [milkteaManagement] SET  MULTI_USER 
GO
ALTER DATABASE [milkteaManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [milkteaManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [milkteaManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [milkteaManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [milkteaManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [milkteaManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [milkteaManagement] SET QUERY_STORE = OFF
GO
USE [milkteaManagement]
GO
/****** Object:  Table [dbo].[tblBannerNew]    Script Date: 30-Jun-22 8:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBannerNew](
	[bannerNewID] [int] IDENTITY(1,1) NOT NULL,
	[images] [nvarchar](4000) NULL,
 CONSTRAINT [PK__tblBanne__FD1C7B9DE6D8AD09] PRIMARY KEY CLUSTERED 
(
	[bannerNewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBlogNew]    Script Date: 30-Jun-22 8:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBlogNew](
	[blogNewID] [nvarchar](50) NOT NULL,
	[title] [nvarchar](200) NULL,
	[content] [nvarchar](4000) NULL,
	[images] [nvarchar](400) NULL,
PRIMARY KEY CLUSTERED 
(
	[blogNewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 30-Jun-22 8:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](100) NULL,
	[images] [nvarchar](400) NULL,
	[hashtag] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 30-Jun-22 8:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[total] [float] NULL,
	[userID] [int] NULL,
 CONSTRAINT [PK__tblOrder__0809337D841F3D2E] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 30-Jun-22 8:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[productID] [nvarchar](50) NULL,
	[orderID] [int] NULL,
 CONSTRAINT [PK__tblOrder__83077839B90332E0] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 30-Jun-22 8:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[price] [float] NULL,
	[status] [int] NULL,
	[description] [nvarchar](4000) NULL,
	[discount] [int] NULL,
	[image_link] [nvarchar](4000) NULL,
	[created] [date] NULL,
	[categoryID] [nvarchar](50) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK__tblProdu__2D10D14ADEC5E31B] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductProductType]    Script Date: 30-Jun-22 8:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductProductType](
	[productID] [nvarchar](50) NOT NULL,
	[productTypeID] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC,
	[productTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductType]    Script Date: 30-Jun-22 8:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductType](
	[productTypeID] [nvarchar](50) NOT NULL,
	[productTypeName] [nvarchar](400) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReview]    Script Date: 30-Jun-22 8:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReview](
	[reviewID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [nvarchar](50) NULL,
	[content] [nvarchar](4000) NULL,
	[created] [date] NULL,
	[userID] [int] NULL,
 CONSTRAINT [PK__tblRevie__2ECD6E241DFF4036] PRIMARY KEY CLUSTERED 
(
	[reviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 30-Jun-22 8:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](50) NOT NULL,
	[roleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 30-Jun-22 8:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NULL,
	[address] [nvarchar](300) NULL,
	[phone] [nvarchar](50) NULL,
	[created] [date] NULL,
	[roleID] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK__tblUsers__CB9A1CDF3475C900] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblBannerNew] ON 

INSERT [dbo].[tblBannerNew] ([bannerNewID], [images]) VALUES (1, N'https://minio.thecoffeehouse.com/image/admin/1653325967_web-cu.jpg')
INSERT [dbo].[tblBannerNew] ([bannerNewID], [images]) VALUES (2, N'https://phuclong.com.vn/uploads/banner/850e268b4c2219-postmomo_1920576oldweb.png')
INSERT [dbo].[tblBannerNew] ([bannerNewID], [images]) VALUES (3, N'https://phuclong.com.vn/uploads/banner/693431e1a25871-banner_1920576.png')
INSERT [dbo].[tblBannerNew] ([bannerNewID], [images]) VALUES (4, N'https://phuclong.com.vn/uploads/banner/4b9491980fcdae-traolong1.jpg')
SET IDENTITY_INSERT [dbo].[tblBannerNew] OFF
GO
INSERT [dbo].[tblBlogNew] ([blogNewID], [title], [content], [images]) VALUES (N'1', N'NĂNG LƯỢNG BỪNG TỈNH', N'<h1>NĂNG LƯỢNG BỪNG TỈNH</h1>
    <p>Tín hiệu vũ trụ vừa gửi về cho The Coffee House, bảo rằng ai đó đang thèm tách cà phê mỗi sáng cho thật tỉnh 
        táo mới vào việc được. Nên Nhà lên ngay ưu đãi “thấy là tỉnh” MUA 1 TẶNG 1, uống là “see mê” dành riêng cho bạn.</p>
    <ul>
        <li>Áp dụng khi mua trực tiếp tại cửa hàng cà phê rang xay Peak Flavor/Rich Finish và Cà Phê Hoà Tan Đậm Vị Việt (18 gói x 16 gam)</li>
        <li>Thời gian: 14.03 - 31.03</li>
        <li>Không áp dụng đồng thời các khuyến mãi</li>
        <li>Áp dụng cửa hàng trên toàn quốc (trừ Destination, TCH Now, Xe Đẩy)</li>
    </ul>
    <p>Cà phê chưa! Cà phê đi ngay nào bạn ơi!</p>
    <strong>Danh sách hoạt động của các cửa hàng trong hệ thống The Coffee House sẽ được update liên tục, bạn có thể theo dõi tại đây: <a href="https://bit.ly/3Epaotz"></a></strong>
    <ul>
        <li>The Coffee House luôn tuân thủ về an toàn phòng dịch</li>
        <li>Nhân viên của The Coffee House nghiêm túc thực hiện 5K trong suốt quá trình hoạt động</li>
        <li>Thời gian giao hàng có thể kéo dài hơn thông thường do hạn chế về tài xế và quy định phòng dịch của chính
            phủ, mong các bạn thông cảm và cảm ơn các bạn đã đồng hành cùng The Coffee House.
        </li>
    </ul>', N'https://feed.thecoffeehouse.com//content/images/2022/03/FB--10-.jpg')
INSERT [dbo].[tblBlogNew] ([blogNewID], [title], [content], [images]) VALUES (N'2', N'NGÀY HỐI HẢ, GHÉ THE COFFEE HOUSE CHỌN MANG ĐI NHÉ!', N'<h1>NGÀY HỐI HẢ, GHÉ THE COFFEE HOUSE CHỌN MANG ĐI NHÉ!</h1>
    <p>Ngày thì bận nhưng hương vị The Coffee House quyết hổng thể thiếu. Thôi thì mình cùng mở app chọn Mang đi, 
        vừa nhanh, vừa gọn mà còn được ưu đãi nữa nè!</p>
    <p>Từ 01/03 đến hết ngày 31/03, Nhà tặng bạn ưu đãi 15% khi nhập mã: MANGDINHE</p>
    <p>Chọn Mang đi ngay cùng Nhà!</p>
    <p>----------------------</p>
    <p>Chọn Mang đi ngay cùng Nhà!</p>
    <p>👉Web: https://bubbleTea.net/</p>
    <p>👉App The Coffee House: https://tchapp.page.link/installv5</p>
    <p>👉Số điện thoại: 18006936</p>
    <p>Danh sách hoạt động của các cửa hàng trong hệ thống The Coffee House sẽ được update liên tục, bạn có thể theo dõi tại đây: 
        <a href="https://bit.ly/3Epaotz"></a></p>
    <ul>
        <li>The Coffee House luôn tuân thủ về an toàn phòng dịch</li>
        <li>Nhân viên của The Coffee House nghiêm túc thực hiện 5K trong suốt quá trình hoạt động</li>
        <li>Thời gian giao hàng có thể kéo dài hơn thông thường do hạn chế về tài xế và quy định phòng dịch của chính
            phủ, mong các bạn thông cảm và cảm ơn các bạn đã đồng hành cùng The Coffee House.</li>
    </ul>', N'https://feed.thecoffeehouse.com//content/images/2022/03/FB--4-.jpg')
INSERT [dbo].[tblBlogNew] ([blogNewID], [title], [content], [images]) VALUES (N'3', N'QUÀ TO TẶNG ', N'<h1>QUÀ TO TẶNG "EM BÉ"</h1>
    <p>Vì bạn mãi là "em bé" của Nhà, nên xứng đáng được cưng chiều và thương thương vô điều kiện 😍😍.</p>
    <p>Nhà dành quà siêu yêu MUA 1 TẶNG 1 cho tất cả "em bé" của Nhà</p>
    <ul>
        <li>Nhập mã: EMBE</li>
        <li>Thời gian: 01-05/06</li>
        <li>Áp dụng tất cả món nước cho đơn Giao hàng</li>
    </ul>
    <p>Đừng “hông bé ơi”, Nhà buồn ó!</p>
    <p>Chốt đơn liền hoy!</p>', N'https://feed.thecoffeehouse.com//content/images/2022/06/z3458377347282_1c273ae081d75f874a286bdb26a77120.jpg')
INSERT [dbo].[tblBlogNew] ([blogNewID], [title], [content], [images]) VALUES (N'4', N'HI-TEA HEALTHY RA MẮT PHIÊN BẢN ALOE VERA NỮ HOÀNG SẮC ĐẸP', N'<h1>HI-TEA HEALTHY RA MẮT PHIÊN BẢN ALOE VERA NỮ HOÀNG SẮC ĐẸP</h1>
    <p>Ra mắt vào đầu tháng 5, Hi-Tea Healthy liên tục nhận được sự ủng hộ nồng nhiệt từ khách hàng. Đáp lại tình yêu
        ấy, vào 24/05 The Cofee House ra mắt thêm 4 hương vị mới cực hấp dẫn vào bộ sưu tập Hi-Tea Healthy, kèm
        topping Aloe Vera ngon ngất ngây, đẹp đắm say. Hứa hẹn sẽ mang đến những trải nghiệm thật đặc biệt cho fans
        Nhà vào mùa hè này.</p> <br><br> 
    <p>NHAN SẮC THĂNG HẠNG CÙNG ALOE VERA: NỮ HOÀNG SẮC ĐẸP Aloe Vera hay còn gọi là Nha đam, có mối  quan hệ siêu “thân thiết” với hội ghiền làm đẹp. Vì được biết đến là thảo dược chứa nhiều vitamin A, khoáng chất  và chất chống oxi hoá vượt trội, giúp làn da luôn giữ được độ mịn màng và trẻ trung theo thời gian. <br><br> 
        Nhất là trong tiết trời oi bức như này, da thường xuyên mất nước, mất cân bằng độ ẩm rất dễ dẫn đến tình trạng  đổ dầu không kiểm soát. Vậy thì một ly Hi-Tea Healthy với Aloe Vera thì còn gì hợp lý bằng. <br><br> 
        4 hương vị mới toanh, lạ miệng được kết hợp ấn tượng với các sắc thái chua - mặn - ngọt cho bạn tận hưởng  thoả thích. <br><br> 
        Hi-Tea Dâu Tây Mận Muối Aloe Vera: Sự kết hợp độc đáo giữa 3 sắc thái hương vị khác nhau với trà hoa Hibiscus  chua thanh, Mận muối mặn mặn và Dâu tây tươi Đà Lạt cô đặc ngọt dịu. Ngoài ra, topping Aloe Vera tươi mát,  ngon ngất ngây, đẹp đắm say, hứa hẹn sẽ khuấy đảo hè này. </p><br><br> 
        <p>Hi-Tea Xoài Aloe Vera: Vị ngọt thanh, thơm phức từ xoài chín mọng kết hợp cùng vị chua đặc trưng của trà hoa Hibiscus tự nhiên, sẽ khiến bạn khó lòng quên được thức uống “chân ái” mùa hè này. Đặc biệt, topping Aloe Vera  tự nhiên không chỉ nhâm nhi vui miệng mà còn giúp bạn “nâng tầm nhan sắc”. </p><br><br> 
        <p>Chăm da đẹp, uống cũng phải đẹp đúng không chị em chúng mình ơi! <br><br> 
            Hi-Tea Healthy phiên bản Aloe Vera đã có mặt tại hệ thống The Coffee House trên toàn quốc. Bạn có thể ghé  Nhà hoặc đặt Giao hàng qua app/website The Coffee House Thử đi chờ chi!</p><br><br> ', N'https://feed.thecoffeehouse.com//content/images/2022/05/Noti--2-.jpg')
INSERT [dbo].[tblBlogNew] ([blogNewID], [title], [content], [images]) VALUES (N'5', N'CUỐI THÁNG ', N'<h1>CUỐI THÁNG "HEO THÌ" - MỜI DEAL "BEAUTY"</h1>
    <p>Tự thưởng cho bản thân món "heo thì" sau những ngày chăm chỉ chạy deadline. Nhà tặng bạn deal MUA 1 TẶNG 1 thiệt “đẹp”, giá bé xíu xiu 😜</p>
    <p>🔸 Nhập mã: BEAUTY</p>
    <p>🔸 Thời gian: 25/05 - 29/05</p>
    <p>🔸 Áp dụng cho đơn giao hàng, đối với tất cả các món nước bao gồm Hi-Tea Healthy phiên bản Aloe Vera: Nữ hoàng Beauty.</p>
    <p>-------------------</p>
    <ul>
        <li>Áp dụng khi mua trực tiếp tại cửa hàng cà phê rang xay Peak Flavor/Rich Finish và Cà Phê Hoà Tan Đậm Vị Việt(18 gói x 16 gam)</li>
        <li>Thời gian: 14.03 - 31.03</li>
        <li>Không áp dụng đồng thời các khuyến mãi</li>
        <li>Áp dụng cửa hàng trên toàn quốc (trừ Destination, TCH Now, Xe Đẩy)</li>
    </ul>
    <p>Cà phê chưa! Cà phê đi ngay nào bạn ơi!</p>
    <strong>Danh sách hoạt động của các cửa hàng trong hệ thống The Coffee House sẽ được update liên tục, bạn có thể theo dõi tại đây: <a href="https://bit.ly/3Epaotz"></a></strong>
    <ul>
        <li>The Coffee House luôn tuân thủ về an toàn phòng dịch</li>
        <li>Nhân viên của The Coffee House nghiêm túc thực hiện 5K trong suốt quá trình hoạt động</li>
        <li>Thời gian giao hàng có thể kéo dài hơn thông thường do hạn chế về tài xế và quy định phòng dịch của chính
            phủ, mong các bạn thông cảm và cảm ơn các bạn đã đồng hành cùng The Coffee House.
        </li>
    </ul>', N'https://feed.thecoffeehouse.com//content/images/2022/05/NOTI--3-.jpg')
INSERT [dbo].[tblBlogNew] ([blogNewID], [title], [content], [images]) VALUES (N'523452354', N'fsdfsdfsdf', N'sdfsdfsdfsd', N'sdfsdf')
INSERT [dbo].[tblBlogNew] ([blogNewID], [title], [content], [images]) VALUES (N'6', N'THẾ HỆ CÀ PHÊ MỚI - NHÀ MỜI DEAL TO', N'<p>Hot!Hot! Thế hệ cà phê mới CloudFee êm mượt như mây đã chính thức ra mắt ️🎉️The Coffee House tặng ưu đãi MUA 1 TẶNG 1, để bạn trải nghiệm CloudFee cho đơn Giao hàng nè:</p>

<p>TẶNG 1 CLOUFEE CREAMY (size S) khi mua kèm 1 Cà phê sữa đá (size L)
Nhập mã: CREAMY
2. TẶNG 1 CLOUFEE CREME BRULEE (size M) khi mua kèm 1 Trà sữa (size L)</p>

Nhập mã: BRULEE
🔸
<h4>Lưu ý</h4>
<ul>
<li> Áp dụng dịch vụ Giao hàng (Delivery) khi đặt hàng qua App/Web The Coffee House</li>

<li> Không áp dụng cho Topping</li>

<li> Không áp dụng cho các chương trình khuyến mãi song song<li>

<li> Có áp dụng luỹ tiến</li>

<li>Thời hạn ưu đãi: 25/06/2022 đến hết ngày 27/06/2022</li>
<ul>
Thử là ghiền ngay

--

<h3>MÌNH CÀ PHÊ NHÉ</h3>
<ul>
<li>👉 Hệ thống cửa hàng: https://bit.ly/ds-cuahang</li>

<li>👉 Điện thoại: 18006936</li>

<li>👉 Web: <a>https://order.thecoffeehouse.com/</a></li>

<li>👉 App The Coffee House: <a>https://tchapp.page.link/installv5</a></li>
<ul>', N'https://feed.thecoffeehouse.com/content/images/2022/06/noti.jpg')
GO
INSERT [dbo].[tblCategory] ([categoryID], [name], [images], [hashtag]) VALUES (N'1', N'Cà phê', N'https://minio.thecoffeehouse.com/image/tch-web-order/category-thumbnails/ca-phe.png', N'caphe')
INSERT [dbo].[tblCategory] ([categoryID], [name], [images], [hashtag]) VALUES (N'2', N'Trà trái cây trà sữa', N'https://minio.thecoffeehouse.com/image/tch-web-order/category-thumbnails/tra-trai-cay-tra-sua.png', N'traicaytrasua')
INSERT [dbo].[tblCategory] ([categoryID], [name], [images], [hashtag]) VALUES (N'3', N'Hi-Tea Healthy', N'https://minio.thecoffeehouse.com/image/tch-web-order/category-thumbnails/hi-tea.png', N'hitea')
INSERT [dbo].[tblCategory] ([categoryID], [name], [images], [hashtag]) VALUES (N'4', N'Đá Xay - Choco - Matcha', N'https://minio.thecoffeehouse.com/image/tch-web-order/category-thumbnails/da-xa.png', N'daxaychoco')
INSERT [dbo].[tblCategory] ([categoryID], [name], [images], [hashtag]) VALUES (N'5', N'Thưởng thức tại nhà', N'https://minio.thecoffeehouse.com/image/tch-web-order/category-thumbnails/ca-phe-goi-ca-phe-uong-lien.png', N'thuongthuc')
INSERT [dbo].[tblCategory] ([categoryID], [name], [images], [hashtag]) VALUES (N'6', N'Bánh Snack', N'https://minio.thecoffeehouse.com/image/tch-web-order/category-thumbnails/banh-snack.png', N'snack')
GO
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([orderID], [date], [total], [userID]) VALUES (21, CAST(N'2022-06-26' AS Date), 118, NULL)
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [userID]) VALUES (22, CAST(N'2022-06-26' AS Date), 447, NULL)
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [userID]) VALUES (23, CAST(N'2022-06-26' AS Date), 194.4, NULL)
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [userID]) VALUES (24, CAST(N'2022-06-26' AS Date), 98, NULL)
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [userID]) VALUES (25, CAST(N'2022-06-27' AS Date), 79, NULL)
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [userID]) VALUES (26, CAST(N'2022-06-27' AS Date), 79, NULL)
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [userID]) VALUES (27, CAST(N'2022-06-27' AS Date), 390000, NULL)
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [userID]) VALUES (28, CAST(N'2022-06-27' AS Date), 191200, NULL)
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [userID]) VALUES (29, CAST(N'2022-06-27' AS Date), 156000, NULL)
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [userID]) VALUES (30, CAST(N'2022-06-28' AS Date), 137000, 55)
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [userID]) VALUES (31, CAST(N'2022-06-29' AS Date), 76620, 55)
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [userID]) VALUES (32, CAST(N'2022-06-29' AS Date), 88000, 57)
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [userID]) VALUES (33, CAST(N'2022-06-29' AS Date), 222000, 57)
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [userID]) VALUES (34, CAST(N'2022-06-29' AS Date), 176000, 57)
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [userID]) VALUES (35, CAST(N'2022-06-29' AS Date), 137000, 57)
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [userID]) VALUES (36, CAST(N'2022-06-29' AS Date), 88000, 57)
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [userID]) VALUES (37, CAST(N'2022-06-29' AS Date), 79000, 57)
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (41, 1, 58000, N'11', 21)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (42, 1, 30000, N'1', 21)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (43, 1, 30000, N'13', 21)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (44, 3, 135000, N'2', 22)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (45, 2, 116000, N'19', 22)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (46, 4, 196000, N'10', 22)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (47, 3, 90000, N'1', 23)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (48, 2, 104000.4, N'16', 23)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (49, 1, 49000, N'12', 24)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (50, 1, 49000, N'10', 24)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (51, 1, 30000, N'1', 25)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (52, 1, 49000, N'10', 25)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (53, 1, 30000, N'1', 26)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (54, 1, 49000, N'10', 26)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (55, 4, 232000, N'11', 27)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (56, 2, 60000, N'1', 27)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (57, 2, 98000, N'10', 27)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (58, 1, 49000, N'12', 28)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (59, 3, 90000, N'13', 28)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (60, 1, 52200, N'16', 28)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (61, 1, 58000, N'11', 29)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (62, 2, 98000, N'12', 29)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (63, 1, 58000, N'11', 30)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (64, 1, 30000, N'1', 30)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (65, 1, 49000, N'15', 30)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (66, 1, 58000, N'11', 31)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (67, 1, 18620, N'39', 31)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (68, 1, 58000, N'11', 32)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (69, 1, 30000, N'1', 32)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (70, 1, 30000, N'1', 33)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (71, 3, 147000, N'15', 33)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (72, 1, 45000, N'17', 33)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (73, 2, 116000, N'11', 34)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (74, 2, 60000, N'1', 34)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (75, 1, 58000, N'11', 35)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (76, 1, 30000, N'1', 35)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (77, 1, 49000, N'15', 35)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (78, 1, 58000, N'11', 36)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (79, 1, 30000, N'1', 36)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (80, 1, 30000, N'1', 37)
INSERT [dbo].[tblOrderDetail] ([detailID], [quantity], [price], [productID], [orderID]) VALUES (81, 1, 49000, N'15', 37)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
GO
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'1', N'Cà Phê Sữa Đá', 30000, 1, N'Cà phê Đắk Lắk nguyên chất được pha phin truyền thống kết hợp với sữa đặc tạo nên hương vị đậm đà, hài hòa giữa vị ngọt đầu lưỡi và vị đắng thanh thoát nơi hậu vị.', 0, N'https://minio.thecoffeehouse.com/image/admin/1639377738_ca-phe-sua-da.jpg', CAST(N'2022-06-28' AS Date), N'1', 91)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'10', N'Trà Hạt Sen - Nóng', 49000, 0, N'Nền trà oolong hảo hạng kết hợp cùng hạt sen tươi, bùi bùi thơm ngon. Trà hạt sen là thức uống thanh mát, nhẹ nhàng phù hợp cho cả buổi sáng và chiều tối.', 0, N'https://minio.thecoffeehouse.com/image/admin/tra-sen-nong_025153.jpg', CAST(N'2022-06-27' AS Date), N'2', 0)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'11', N'Hồng Trà Sữa Nóng', 58000, 1, N'Từng ngụm trà chuẩn gu ấm áp, đậm đà beo béo bởi lớp sữa tươi chân ái hoà quyện. Trà đen nguyên lá âm ấm dịu nhẹ, quyện cùng lớp sữa thơm béo khó lẫn - hương vị ấm áp chuẩn gu trà, cho từng ngụm nhẹ nhàng, ngọt dịu lưu luyến mãi nơi cuống họng.', 0, N'https://minio.thecoffeehouse.com/image/admin/hong-tra-sua-nong_941687.jpg', CAST(N'2022-06-26' AS Date), N'2', 87)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'12', N'Trà Sữa Mắc Ca Trân Châu', 49000, 1, N'Mỗi ngày với The Coffee House sẽ là điều tươi mới hơn với sữa hạt mắc ca thơm ngon, bổ dưỡng quyện cùng nền trà oolong cho vị cân bằng, ngọt dịu đi kèm cùng Trân châu trắng giòn dai mang lại cảm giác “đã” trong từng ngụm trà sữa.', 0, N'https://minio.thecoffeehouse.com/image/admin/tra-sua-mac-ca_377522.jpg', CAST(N'2022-06-25' AS Date), N'2', 97)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'13', N'Hồng Trà Latte', 30000, 0, N'Sự kết hợp hoàn hảo bởi hồng trà dịu nhẹ và sữa tươi, nhấn nhá thêm lớp macchiato trứ danh của The Coffee House mang đến cho bạn hương vị trà sữa đúng gu tinh tế và healthy.', 6, N'https://minio.thecoffeehouse.com/image/admin/hong-tra-latte_618293.jpg', CAST(N'2022-06-29' AS Date), N'2', 0)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'15', N'Hi-Tea Dâu Tây Mận Muối Aloe Vera', 49000, 1, N'Sự kết hợp độc đáo giữa 3 sắc thái hương vị khác nhau: trà hoa Hibiscus chua thanh, Mận muối mặn mặn và Dâu tây tươi Đà Lạt cô đặc ngọt dịu. Ngoài ra, topping Aloe Vera tươi mát, ngon ngất ngây, đẹp đắm say, hứa hẹn sẽ khuấy đảo hè này.', 0, N'https://minio.thecoffeehouse.com/image/admin/1653274559_dau-tay-man-muoi-aloe-vera.jpg', CAST(N'2022-06-26' AS Date), N'3', 94)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'16', N'Hi-Tea Đá Tuyết Xoài Đào', 58000, 1, N'Những miếng đào vàng ươm kết hợp với đá tuyết vị xoài mát lành, cùng nền trà hoa Hibiscus chua dịu đem đến cảm giác lạ miệng, hấp dẫn đến tận ngụm cuối cùng.', 10, N'https://minio.thecoffeehouse.com/image/admin/1653291164_da-tuyet-dao.jpg', CAST(N'2022-06-26' AS Date), N'3', 99)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'17', N'Hi-Tea Yuzu Trân Châu Trắng', 45000, 1, N'Không chỉ nổi bật với sắc đỏ đặc trưng từ trà hoa Hibiscus, Hi-Tea Yuzu còn gây ấn tượng với topping Yuzu (quýt Nhật) lạ miệng, kết hợp cùng trân châu trắng dai giòn sần sật, nhai vui vui.', 0, N'https://minio.thecoffeehouse.com/image/admin/1653291194_hi-tea-yuzu.jpg', CAST(N'2022-06-25' AS Date), N'3', 99)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'18', N'Hi-Tea Đào', 45000, 1, N'Sự kết hợp ăn ý giữa Đào cùng trà hoa Hibiscus, tạo nên tổng thể hài hoà dễ gây “thương nhớ” cho team thích món thanh mát, có vị chua nhẹ.', 0, N'https://minio.thecoffeehouse.com/image/admin/1653291185_hi-tea-dao.jpg', CAST(N'2022-06-15' AS Date), N'3', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'19', N'Hi-Tea Đá Tuyết Yuzu Aloe Vera', 58000, 1, N'Vị chua tươi mát của trà hoa Hibiscus, cùng đá tuyết Yuzu (quýt Nhật) chua dịu sẽ trở nên hài hòa hơn nhờ topping Aloe Vera giòn ngọt, sẽ khiến bạn thích thú ngay lần chạm môi đầu tiên.', 0, N'https://minio.thecoffeehouse.com/image/admin/1653275373_sb-yuzu-aloe-vera.jpg', CAST(N'2022-06-15' AS Date), N'3', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'2', N'Cà Phê Sữa Nóng', 45000, 1, N'Cà phê được pha phin truyền thống kết hợp với sữa đặc tạo nên hương vị đậm đà, hài hòa giữa vị ngọt đầu lưỡi và vị đắng thanh thoát nơi hậu vị.', 0, N'https://minio.thecoffeehouse.com/image/admin/1639377770_cfsua-nong.jpg', CAST(N'2022-06-25' AS Date), N'1', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'20', N'Hi-Tea Đá Tuyết Mận Muối Aloe Vera', 58000, 1, N'“Have a mặn mà” và chua chua từ Mận muối xay cùng đá tuyết, hoà quyện với vị trà hoa Hibiscus chua dịu và chút ngọt thanh tao bởi topping Aloe Vera, Hi-Tea Đá Tuyết Mận Muối Aloe Vera là thức uống “must try” để đánh tan cơn khát mùa hè.', 0, N'https://minio.thecoffeehouse.com/image/admin/1653275302_sb-man-muoi-aloevra.jpg', CAST(N'2022-06-15' AS Date), N'3', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'21', N'Hi-Tea Xoài Aloe Vera', 45000, 1, N'Vị ngọt thanh, thơm phức từ xoài chín mọng kết hợp cùng vị chua đặc trưng của trà hoa Hibiscus tự nhiên, sẽ khiến bạn khó lòng quên được thức uống “chân ái” mùa hè này. Đặc biệt, topping Aloe Vera tự nhiên không chỉ nhâm nhi vui miệng mà còn giúp bạn “nâng tầm nhan sắc”.', 0, N'https://minio.thecoffeehouse.com/image/admin/1653275101_xoai-aloe-vera.jpg', CAST(N'2022-06-15' AS Date), N'3', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'22', N'Sinh Tố Việt Quất', 58000, 1, N'Mứt Việt Quất chua thanh, ngòn ngọt, phối hợp nhịp nhàng với dòng sữa chua bổ dưỡng. Là món sinh tố thơm ngon mà cả đầu lưỡi và làn da đều thích.', 0, N'https://minio.thecoffeehouse.com/image/admin/sinh-to-viet-quoc_145138.jpg', CAST(N'2022-06-16' AS Date), N'4', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'23', N'Chocolate Đá', 58000, 1, N'Bột chocolate nguyên chất hoà cùng sữa tươi béo ngậy. Vị ngọt tự nhiên, không gắt cổ, để lại một chút đắng nhẹ, cay cay trên đầu lưỡi.', 10, N'https://minio.thecoffeehouse.com/image/admin/chocolate-da_877186_400x400.jpg', CAST(N'2022-06-15' AS Date), N'4', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'24', N'Chocolate Nóng', 58000, 1, N'Bột chocolate nguyên chất hoà cùng sữa tươi béo ngậy. Vị ngọt tự nhiên, không gắt cổ, để lại một chút đắng nhẹ, cay cay trên đầu lưỡi.', 0, N'https://minio.thecoffeehouse.com/image/admin/chocolatenong_949029_400x400.jpg', CAST(N'2022-06-15' AS Date), N'4', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'29', N'Cà Phê Hòa Tan Đậm Vị Việt Túi', 98000, 1, N'Bắt đầu ngày mới với tách cà phê sữa “Đậm vị Việt” mạnh mẽ sẽ giúp bạn luôn tỉnh táo và hứng khởi cho ngày làm việc thật hiệu quả.', 0, N'https://minio.thecoffeehouse.com/image/admin/1639648313_ca-phe-sua-da-hoa-tan-dam-vi-viet.jpg', CAST(N'2022-06-15' AS Date), N'5', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'3', N'Bạc Sỉu', 29000, 1, N'Bạc sỉu chính là "Ly sữa trắng kèm một chút cà phê". Thức uống này rất phù hợp những ai vừa muốn trải nghiệm chút vị đắng của cà phê vừa muốn thưởng thức vị ngọt béo ngậy từ sữa.', 0, N'https://minio.thecoffeehouse.com/image/admin/1639377904_bac-siu.jpg', CAST(N'2022-06-15' AS Date), N'1', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'30', N'Cà Phê Hoà Tan Đậm Vị Việt', 48000, 1, N'Bắt đầu ngày mới với tách cà phê sữa “Đậm vị Việt” mạnh mẽ sẽ giúp bạn luôn tỉnh táo và hứng khởi cho ngày làm việc thật hiệu quả.', 0, N'https://minio.thecoffeehouse.com/image/admin/1639648313_ca-phe-sua-da-hoa-tan-dam-vi-viet.jpg', CAST(N'2022-06-15' AS Date), N'5', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'31', N'Cà Phê Rang Xay Original 1', 59000, 1, N'Cà phê Original 1 của The Coffee House với thành phần chính cà phê Robusta Đắk Lắk, vùng trồng cà phê nổi tiếng nhất Việt Nam. Bằng cách áp dụng kỹ thuật rang xay hiện đại, Cà phê Original 1 mang đến trải nghiệm tuyệt vời khi uống cà phê tại nhà với hương vị đậm đà truyền thống hợp khẩu vị của giới trẻ sành cà phê.', 10, N'https://minio.thecoffeehouse.com/image/admin/1639648297_ca-phe-rang-xay-original-1-250gr.jpg', CAST(N'2022-06-15' AS Date), N'5', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'32', N'Cà Phê Sữa Đá Hòa Tan', 44000, 1, N'Thật dễ dàng để bắt đầu ngày mới với tách cà phê sữa đá sóng sánh, thơm ngon như cà phê pha phin. Vị đắng thanh của cà phê hoà quyện với vị ngọt béo của sữa, giúp bạn luôn tỉnh táo và hứng khởi cho ngày làm việc thật hiệu quả.', 0, N'https://minio.thecoffeehouse.com/image/admin/cpsd-3in1_971575.jpg', CAST(N'2022-06-15' AS Date), N'5', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'33', N'Cà Phê Sữa Đá Hòa Tan', 44000, 1, N'Thật dễ dàng để bắt đầu ngày mới với tách cà phê sữa đá sóng sánh, thơm ngon như cà phê pha phin. Vị đắng thanh của cà phê hoà quyện với vị ngọt béo của sữa, giúp bạn luôn tỉnh táo và hứng khởi cho ngày làm việc thật hiệu quả.', 0, N'https://minio.thecoffeehouse.com/image/admin/cpsd-3in1_971575.jpg', CAST(N'2022-06-15' AS Date), N'5', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'34', N'Trà Oolong Lá Tearoma 100G', 98000, 1, N'Trà Oolong Tearoma được chọn lọc bởi các búp trà non phủ sương, tươi mát trên cao nguyên Lâm Đồng. Có mùi hương dịu nhẹ hoàn toàn từ tự nhiên, vị hậu ngọt.', 0, N'https://minio.thecoffeehouse.com/image/admin/1639648109_tra-oolong-la-tearoma-100gr.jpg', CAST(N'2022-06-15' AS Date), N'5', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'35', N'Trà Lài Lá Tearoma 100G', 79000, 1, N'Tearoma Trà Hương Lài tinh tế trong từng ngụm
Được chế biến 100% từ búp trà tươi phủ sương từ cao nguyên Lâm Đồng, nơi có khí hậu hoàn hảo cho việc trồng trà.
Bằng việc áp dụng quy trình sản xuất trà nghiêm ngặt và hiện đại đảm bảo chất lượng về hương tinh tế và vị đậm đà, mang đến trải nghiệm uống trà trọn vẹn nhất.
Với hương trà tinh tế và vị trà đậm đà đánh thức mọi giác quan, cùng kinh nghiệm và kỹ thuật tuyển chọn nghiêm ngặt từ các chuyên gia, Tearoma Trà Hương Lài sẽ mang đến trải nghiệm uống trà trọn vẹn, giúp thổi bừng hứng khởi, giúp bạn thoả sức chinh phục mọi mục tiêu. ', 0, N'https://minio.thecoffeehouse.com/image/admin/1639648191_tra-lai-la-tearoma-100gr.jpg', CAST(N'2022-06-15' AS Date), N'5', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'36', N'Bánh Mì Que Pate', 12000, 1, N'Vỏ bánh mì giòn tan, kết hợp với lớp nhân pate béo béo đậm đà sẽ là lựa chọn lý tưởng nhẹ nhàng để lấp đầy chiếc bụng đói , cho 1 bữa sáng - trưa - chiều - tối của bạn thêm phần thú vị.', 0, N'https://minio.thecoffeehouse.com/image/admin/banhmique_056830.jpg', CAST(N'2022-06-15' AS Date), N'6', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'37', N'Bánh Mì VN Thịt Nguội', 29000, 1, N'Gói gọn trong ổ bánh mì Việt Nam là từng lớp chả, từng lớp jambon hòa quyện cùng bơ và pate thơm lừng, thêm dưa rau cho bữa sáng đầy năng lượng. *Phần bánh sẽ ngon và đậm đà nhất khi kèm pate. Để đảm bảo hương vị được trọn vẹn, Nhà mong bạn thông cảm vì không thể thay đổi định lượng pate.', 0, N'https://minio.thecoffeehouse.com/image/admin/1638440015_banh-mi-vietnam.jpg', CAST(N'2022-06-15' AS Date), N'6', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'38', N'Mochi Kem Chocolate', 19000, 1, N'Bao bọc bởi lớp vỏ Mochi dẻo thơm, bên trong là lớp kem lạnh cùng nhân chocolate độc đáo. Gọi 1 chiếc Mochi cho ngày thật tươi mát. Sản phẩm phải bảo quán mát và dùng ngon nhất trong 2h sau khi nhận hàng.', 0, N'https://minio.thecoffeehouse.com/image/admin/mochi-choco_560386.jpg', CAST(N'2022-06-15' AS Date), N'6', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'39', N'Mochi Kem Dừa Dứa', 19000, 1, N'Bao bọc bởi lớp vỏ Mochi dẻo thơm, bên trong là lớp kem lạnh cùng nhân dừa dứa thơm lừng lạ miệng. Gọi 1 chiếc Mochi cho ngày thật tươi mát. Sản phẩm phải bảo quán mát và dùng ngon nhất trong 2h sau khi nhận hàng.', 2, N'https://minio.thecoffeehouse.com/image/admin/1643101996_mochi-dua.jpg', CAST(N'2022-06-29' AS Date), N'6', 99)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'4', N'Cà Phê Đen Đá', 29000, 1, N'Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng.', 10, N'https://minio.thecoffeehouse.com/image/admin/1639377797_ca-phe-den-da.jpg', CAST(N'2022-06-15' AS Date), N'1', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'40', N'Mochi Kem Xoài', 19000, 1, N'Bao bọc bởi lớp vỏ Mochi dẻo thơm, bên trong là lớp kem lạnh cùng nhân xoài chua chua ngọt ngọt. Gọi 1 chiếc Mochi cho ngày thật tươi mát. Sản phẩm phải bảo quán mát và dùng ngon nhất trong 2h sau khi nhận hàng.', 0, N'https://minio.thecoffeehouse.com/image/admin/1643101968_mochi-xoai.jpg', CAST(N'2022-06-15' AS Date), N'6', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'41', N'Croissant trứng muối', 35000, 1, N'Croissant trứng muối thơm lừng, bên ngoài vỏ bánh giòn hấp dẫn bên trong trứng muối vị ngon khó cưỡng.', 0, N'https://minio.thecoffeehouse.com/image/admin/croissant-trung-muoi_880850.jpg', CAST(N'2022-06-15' AS Date), N'6', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'42', N'Mochi Kem Phúc Bồn Tử', 19000, 1, N'Bao bọc bởi lớp vỏ Mochi dẻo thơm, bên trong là lớp kem lạnh cùng nhân phúc bồn tử ngọt ngào. Gọi 1 chiếc Mochi cho ngày thật tươi mát. Sản phẩm phải bảo quán mát và dùng ngon nhất trong 2h sau khi nhận hàng.', 0, N'https://minio.thecoffeehouse.com/image/admin/1643102019_mochi-phucbontu.jpg', CAST(N'2022-06-15' AS Date), N'6', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'5', N'Cà Phê Sữa Đá Chai Fresh', 78000, 1, N'Vẫn là hương vị cà phê sữa đậm đà quen thuộc của The Coffee House nhưng khoác lên mình một chiếc áo mới tiện lợi hơn, tiết kiệm hơn phù hợp với bình thường mới, giúp bạn tận hưởng một ngày dài trọn vẹn. *Sản phẩm dùng ngon nhất trong ngày. *Sản phẩm mặc định mức đường và không đá.', 0, N'https://minio.thecoffeehouse.com/image/admin/BottleCFSD_496652.jpg', CAST(N'2022-06-15' AS Date), N'1', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'6', N'Caramel Macchiato Đá', 49000, 1, N'Caramel Macchiato sẽ mang đến một sự ngạc nhiên thú vị khi vị thơm béo của bọt sữa, sữa tươi, vị đắng thanh thoát của cà phê Espresso hảo hạng và vị ngọt đậm của sốt caramel được gói gọn trong một tách cà phê.', 0, N'https://minio.thecoffeehouse.com/image/admin/caramel-macchiato_143623.jpg', CAST(N'2022-06-15' AS Date), N'1', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'699', N'Trà Đào Cam Sả Chai Fresh 500ML', 108000, 1, N'Với phiên bản chai fresh 500ml, thức uống "best seller" đỉnh cao mang một diện mạo tươi mới, tiện lợi, phù hợp với bình thường mới và vẫn giữ nguyên vị thanh ngọt của đào, vị chua dịu của cam vàng nguyên vỏ và vị trà đen thơm lừng ly Trà đào cam sả nguyên bản. *Sản phẩm dùng ngon nhất trong ngày. *Sản phẩm mặc định mức đường và không đá', 0, N'https://minio.thecoffeehouse.com/image/admin/Bottle_TraDao_836487.jpg', CAST(N'2022-06-16' AS Date), N'3', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'7', N'Caramel Macchiato Nóng', 49000, 1, N'Caramel Macchiato sẽ mang đến một sự ngạc nhiên thú vị khi vị thơm béo của bọt sữa, sữa tươi, vị đắng thanh thoát của cà phê Espresso hảo hạng và vị ngọt đậm của sốt caramel được gói gọn trong một tách cà phê.', 0, N'https://minio.thecoffeehouse.com/image/admin/caramelmacchiatonong_168039.jpg', CAST(N'2022-06-15' AS Date), N'1', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'8', N'Trà Long Nhãn Hạt Sen', 51000, 1, N'Thức uống mang hương vị của nhãn, của sen, của trà Oolong đầy thanh mát cho tất cả các thành viên trong dịp Tết này. An lành, thư thái và đậm đà chính là những gì The Coffee House mong muốn gửi trao đến bạn và gia đình.', 0, N'https://minio.thecoffeehouse.com/image/admin/1649378747_tra-sen-nhan.jpg', CAST(N'2022-06-15' AS Date), N'2', 100)
INSERT [dbo].[tblProduct] ([productID], [name], [price], [status], [description], [discount], [image_link], [created], [categoryID], [quantity]) VALUES (N'9', N'Trà Đào Cam Sả - Đá', 45000, 1, N'Vị thanh ngọt của đào, vị chua dịu của Cam Vàng nguyên vỏ, vị chát của trà đen tươi được ủ mới mỗi 4 tiếng, cùng hương thơm nồng đặc trưng của sả chính là điểm sáng làm nên sức hấp dẫn của thức uống này.', 10, N'https://minio.thecoffeehouse.com/image/admin/tra-dao-cam-xa_668678.jpg', CAST(N'2022-06-15' AS Date), N'2', 100)
GO
INSERT [dbo].[tblProductProductType] ([productID], [productTypeID]) VALUES (N'10', N'3')
INSERT [dbo].[tblProductProductType] ([productID], [productTypeID]) VALUES (N'13', N'1')
INSERT [dbo].[tblProductProductType] ([productID], [productTypeID]) VALUES (N'16', N'2')
INSERT [dbo].[tblProductProductType] ([productID], [productTypeID]) VALUES (N'18', N'1')
INSERT [dbo].[tblProductProductType] ([productID], [productTypeID]) VALUES (N'22', N'1')
INSERT [dbo].[tblProductProductType] ([productID], [productTypeID]) VALUES (N'23', N'2')
INSERT [dbo].[tblProductProductType] ([productID], [productTypeID]) VALUES (N'29', N'3')
INSERT [dbo].[tblProductProductType] ([productID], [productTypeID]) VALUES (N'3', N'1')
INSERT [dbo].[tblProductProductType] ([productID], [productTypeID]) VALUES (N'31', N'2')
INSERT [dbo].[tblProductProductType] ([productID], [productTypeID]) VALUES (N'4', N'2')
INSERT [dbo].[tblProductProductType] ([productID], [productTypeID]) VALUES (N'9', N'2')
GO
INSERT [dbo].[tblProductType] ([productTypeID], [productTypeName]) VALUES (N'1', N'SẢN PHẨM MỚI')
INSERT [dbo].[tblProductType] ([productTypeID], [productTypeName]) VALUES (N'2', N'SẢN PHẨM GIẢM GIÁ')
INSERT [dbo].[tblProductType] ([productTypeID], [productTypeName]) VALUES (N'3', N'SẢN PHẨM BÁN CHẠY')
GO
SET IDENTITY_INSERT [dbo].[tblReview] ON 

INSERT [dbo].[tblReview] ([reviewID], [productID], [content], [created], [userID]) VALUES (1, N'1', N'Sản phẩm tuyệt vời', CAST(N'2022-06-11' AS Date), NULL)
INSERT [dbo].[tblReview] ([reviewID], [productID], [content], [created], [userID]) VALUES (2, N'1', N'Sản phẩm khá là tốt', CAST(N'2022-06-11' AS Date), NULL)
INSERT [dbo].[tblReview] ([reviewID], [productID], [content], [created], [userID]) VALUES (3, N'30', N'Bố tôi rất thích sản phẩm này, rất tuyệt với nhà shop
', CAST(N'2022-06-11' AS Date), NULL)
INSERT [dbo].[tblReview] ([reviewID], [productID], [content], [created], [userID]) VALUES (4, N'10', N'Mẹ tôi rất thích sản phẩm này', CAST(N'2022-06-11' AS Date), NULL)
INSERT [dbo].[tblReview] ([reviewID], [productID], [content], [created], [userID]) VALUES (5, N'1', N'Quá tuyệt vời luôn <3 !!!!!!!!!!!!!!!!!!!!!', CAST(N'2022-06-11' AS Date), NULL)
INSERT [dbo].[tblReview] ([reviewID], [productID], [content], [created], [userID]) VALUES (6, N'8', N'Trà vô cùng tuyệt vời', CAST(N'2022-06-14' AS Date), NULL)
INSERT [dbo].[tblReview] ([reviewID], [productID], [content], [created], [userID]) VALUES (7, N'11', N'Rất là phù hợp trong những ngày lạnh <3', CAST(N'2022-06-14' AS Date), NULL)
INSERT [dbo].[tblReview] ([reviewID], [productID], [content], [created], [userID]) VALUES (8, N'11', N'Rất là phù hợp trong những ngày lạnh <3', CAST(N'2022-06-14' AS Date), NULL)
INSERT [dbo].[tblReview] ([reviewID], [productID], [content], [created], [userID]) VALUES (9, N'11', N'Rất phù hợp trong những ngày lạnh lẽo', CAST(N'2022-06-14' AS Date), NULL)
INSERT [dbo].[tblReview] ([reviewID], [productID], [content], [created], [userID]) VALUES (10, N'18', N'Rất là ngon!!!!!!', CAST(N'2022-06-14' AS Date), NULL)
INSERT [dbo].[tblReview] ([reviewID], [productID], [content], [created], [userID]) VALUES (11, N'37', N'Bánh mì tuyệt vời', CAST(N'2022-06-14' AS Date), NULL)
INSERT [dbo].[tblReview] ([reviewID], [productID], [content], [created], [userID]) VALUES (12, N'37', N'BÃ¡nh mÃ¬ tuyá»t vá»i
', CAST(N'2022-06-14' AS Date), NULL)
INSERT [dbo].[tblReview] ([reviewID], [productID], [content], [created], [userID]) VALUES (13, N'36', N'Tuyá»t vá»i
', CAST(N'2022-06-21' AS Date), NULL)
INSERT [dbo].[tblReview] ([reviewID], [productID], [content], [created], [userID]) VALUES (14, N'1', N'Sản phẩm khá là ok 
', CAST(N'2022-06-27' AS Date), NULL)
INSERT [dbo].[tblReview] ([reviewID], [productID], [content], [created], [userID]) VALUES (15, N'1', N'Cafe tuyệt vời
', CAST(N'2022-06-29' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[tblReview] OFF
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'1', N'AD')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'2', N'US')
GO
SET IDENTITY_INSERT [dbo].[tblUsers] ON 

INSERT [dbo].[tblUsers] ([userID], [name], [email], [address], [phone], [created], [roleID], [username], [password]) VALUES (1, N'Admin', N'nguyenhuy1323614@gmail.com', N'HCM', N'0123456789', CAST(N'2022-06-25' AS Date), N'1', N'admin', N'admin')
INSERT [dbo].[tblUsers] ([userID], [name], [email], [address], [phone], [created], [roleID], [username], [password]) VALUES (9, N'Trần Tuấn Tài', N'tuan113@gmail.com', N'HCM', N'0123456789', CAST(N'2022-06-25' AS Date), N'2', N'tuan113', N'tuan123')
INSERT [dbo].[tblUsers] ([userID], [name], [email], [address], [phone], [created], [roleID], [username], [password]) VALUES (12, N'Lê Trần Nam', N'namle113@gmail.com', N'HCM', N'0123456789', CAST(N'2022-06-16' AS Date), N'2', N'namle113', N'123')
INSERT [dbo].[tblUsers] ([userID], [name], [email], [address], [phone], [created], [roleID], [username], [password]) VALUES (14, N'Tuan Tran', N'tuantran123@gmail.com', N'HCM', N'0123445665', CAST(N'2022-06-15' AS Date), N'2', N'tuantran', N'123')
INSERT [dbo].[tblUsers] ([userID], [name], [email], [address], [phone], [created], [roleID], [username], [password]) VALUES (16, N'Duc Huy', N'duchuy230602@gmail.com', N'HCM', N'0123456789', CAST(N'2022-06-17' AS Date), N'2', N'huynguyen', N'123')
INSERT [dbo].[tblUsers] ([userID], [name], [email], [address], [phone], [created], [roleID], [username], [password]) VALUES (17, N'Tuan Tai', N'tuantai@gmail.com', N'HCM', N'0123456789', CAST(N'2022-06-11' AS Date), N'2', N'tuantai', N'123')
INSERT [dbo].[tblUsers] ([userID], [name], [email], [address], [phone], [created], [roleID], [username], [password]) VALUES (18, N'Tuan Lam', N'tuanlam@gmail.com', N'HCM', N'0123456789', CAST(N'2022-06-11' AS Date), N'2', N'tuanlam', N'123')
INSERT [dbo].[tblUsers] ([userID], [name], [email], [address], [phone], [created], [roleID], [username], [password]) VALUES (19, N'Thai Tuan', N'thaituan@gmail.com', N'HCM', N'0123456789', CAST(N'2022-06-11' AS Date), N'2', N'thaituan', N'123')
INSERT [dbo].[tblUsers] ([userID], [name], [email], [address], [phone], [created], [roleID], [username], [password]) VALUES (55, N'Đức Huy', N'nh.duchuy2306@gmail.com', N'HCM', N'0123456789', CAST(N'2022-06-28' AS Date), N'2', N'huynguyen', N'1')
INSERT [dbo].[tblUsers] ([userID], [name], [email], [address], [phone], [created], [roleID], [username], [password]) VALUES (56, N'John Nguyễn', N'nhduchuy236@gmail.com', N'Đà Nẵng', N'0123456789', CAST(N'2022-06-28' AS Date), N'2', N'johnnguyen', N'1')
INSERT [dbo].[tblUsers] ([userID], [name], [email], [address], [phone], [created], [roleID], [username], [password]) VALUES (57, N'Nguyen Hoang Duc Huy', N'huynhdse161989@fpt.edu.vn', N'HCM', N'', CAST(N'2022-06-29' AS Date), N'2', N'duchuy', N'1')
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__tblOrderD__order__09746778] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK__tblOrderD__order__09746778]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__tblOrderD__produ__756D6ECB] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK__tblOrderD__produ__756D6ECB]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK__tblProduc__categ__440B1D61] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK__tblProduc__categ__440B1D61]
GO
ALTER TABLE [dbo].[tblReview]  WITH CHECK ADD  CONSTRAINT [FK__tblReview__tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tblReview] CHECK CONSTRAINT [FK__tblReview__tblUsers]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK__tblUsers__roleID__3C69FB99] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK__tblUsers__roleID__3C69FB99]
GO
USE [master]
GO
ALTER DATABASE [milkteaManagement] SET  READ_WRITE 
GO


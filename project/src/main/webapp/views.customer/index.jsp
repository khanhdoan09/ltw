<%@ page import="dao.product.DaoProduct" %>
<%@ page import="beans.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html lang="en">

<head>
    <title>Home | Dragon Sport</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="e-commerce site well design with responsive view." />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet"
          type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link href="css/stylesheet.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="font-awesome/fonts/fontawesome-free-6.0.0-beta3-web/css/all.css">
    <link href="owl-carousel/owl.carousel.css" type="text/css" rel="stylesheet" media="screen" />
    <link href="owl-carousel/owl.transitions.css" type="text/css" rel="stylesheet" media="screen" />
    <script src="javascript/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="javascript/jstree.min.js" type="text/javascript"></script>
    <script src="javascript/template.js" type="text/javascript"></script>
    <script src="javascript/common.js" type="text/javascript"></script>
    <script src="javascript/global.js" type="text/javascript"></script>
    <script src="owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="image/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="css/dat-css.css">
    <link rel="stylesheet" href="css/khanh-css.css">
    <link rel="stylesheet" href="css/hung-css.css">
    <script src="javascript/khanh-js.js" type="text/javascript"></script>
    <link rel="shortcut icon" href="image/logo.png" />


    <style>
        .product-imageblock {
            height: 35% !important;
        }
    </style>
</head>

<body>
<div class="preloader loader" style="display: block; background:#f2f2f2;"> <img src="image/loader.gif" alt="#" />
</div>

<%@include file="header.jsp" %>

<div class="container general-contain" style="margin-bottom: 20px; padding: 0;">
    <div class="mainbanner">
        <div id="main-banner" class="owl-carousel home-slider" style="margin: 0; padding: 0;">
            <div class="item">
                <a href="#"><img src="image/banners/Main-Banner1.jpg" alt="main-banner1"
                                 class="img-responsive img-border-radius" /></a>
                <div class="main-banner-section-center">
                    <a href="" class="shop-now-btn">MUA NGAY</a>
                </div>
            </div>
            <div class="item">
                <a href="#"><img src="image/banners/Main-Banner2.jpg" alt="main-banner2"
                                 class="img-responsive img-border-radius" /></a>
                <div class="main-banner-section-center">
                    <a href="" class="shop-now-btn">MUA NGAY</a>
                </div>
            </div>
            <div class="item">
                <a href="#"><img src="image/banners/Main-Banner3.jpg" alt="main-banner3"
                                 class="img-responsive img-border-radius" /></a>
                <div class="main-banner-section-center">
                    <a href="" class="shop-now-btn">MUA NGAY</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container general-contain" style="margin-bottom: 20px;">
    <div class="row">
        <div id="brand_carouse" class="owl-carousel brand-logo">
            <div class="item text-center">
                <a><img src="image/brand/logo-brand-01.svg" alt="Disney" class="img-responsive" /></a>
            </div>
            <div class="item text-center">
                <a><img src="image/brand/logo-brand-02.svg" alt="Dell" class="img-responsive" /></a>
            </div>
            <div class="item text-center">
                <a><img src="image/brand/logo-brand-03.svg" alt="Harley" class="img-responsive" /></a>
            </div>
            <div class="item text-center">
                <a><img src="image/brand/logo-brand-04.svg" alt="Canon" class="img-responsive" /></a>
            </div>
            <div class="item text-center">
                <a><img src="image/brand/logo-brand-05.svg" alt="Canon" class="img-responsive" /></a>
            </div>
            <div class="item text-center">
                <a><img src="image/brand/logo-brand-06.svg" alt="Canon" class="img-responsive" /></a>
            </div>
            <div class="item text-center">
                <a><img src="image/brand/logo-brand-07.svg" alt="Canon" class="img-responsive" /></a>
            </div>
            <div class="item text-center">
                <a><img src="image/brand/logo-brand-08.svg" alt="Canon" class="img-responsive" /></a>
            </div>
            <div class="item text-center">
                <a><img src="image/brand/logo-brand-09.svg" alt="Canon" class="img-responsive" /></a>
            </div>
            <div class="item text-center">
                <a><img src="image/brand/logo-brand-10.svg" alt="Canon" class="img-responsive" /></a>
            </div>
        </div>
        <div class="cms_banner ">
            <div class="col-md-4 cms-banner-left">
                <a>
                    <img alt="#" style="width: 100%;" src="image/banners/subbanner1.jpg">
                </a>
            </div>
            <div class="col-md-4 cms-banner-middle">
                <a> <img alt="#" style="width: 100%;" src="image/banners/subbanner2.jpg"></a>
            </div>
            <div class="col-md-4 cms-banner-right">
                <a><img alt="#" style="width: 100%;" src="image/banners/subbanner3.jpg"></a>
            </div>
        </div>
    </div>
</div>

<div class="container general-contain" style="margin-bottom: 20px;">

    <div class="row">
        <div id="content" class="col-sm-12">
            <div class="customtab">
                <div id="tabs" class="customtab-wrapper">
                    <ul class='customtab-inner'>
                        <li class='tab'><a href="#tab-latest">Sản Phẩm Mới Nhất</a></li>
                        <li class='tab'><a href="#tab-special">Sản Phẩm Giảm Giá</a></li>
                        <li class='tab'><a href="#tab-bestseller">Sản Phẩm Bán Chạy</a></li>
                    </ul>
                </div>
                <div id="tab-latest" class="tab-content">
                    <div class="box">
                        <div id="latest-slidertab" class="row owl-carousel product-slider">
                            <%for (Product product : DaoProduct
                                    .getInstance().getNewestProduct()) {%>
                            <div class="item">
                                <div class="product-thumb transition">
                                    <div class="image product-imageblock">
                                        <a href="ProductDetail?idProduct=<%=product.getId()%>">
                                            <img src="upload/product/<%=product.getAvatar()%>"
                                                                     alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy"
                                                                     class="img-responsive" /> </a>
                                        <div class="button-group">
                                            <button type="button" class="wishlist" data-toggle="tooltip"
                                                    title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                            <button type="button" class="addtocart-btn">Mua Ngay</button>
                                            <button type="button" class="compare" data-toggle="tooltip"
                                                    title="Compare this Product"><i
                                                    class="fas fa-shopping-cart"></i></button>
                                        </div>
                                    </div>
                                    <div class="caption product-detail">
                                        <h4 class="product-name"><a href="product.html"
                                                                    title="lorem ippsum dolor dummy"><%=product.getName()%></a></h4>
                                        <p class="price product-price"> <span class="price-new"><%=product.getSalePrice()%>$</span> <span
                                                class="price-old"><%=product.getPrice()%>$</span> <span class="price-tax">Ex Tax:
                                                    210.00$</span> </p>
                                    </div>

                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
                <!-- tab-latest-->
                <div id="tab-special" class="tab-content">
                    <div class="box">
                        <div id="special-slidertab" class="row owl-carousel product-slider">
                            <%for (Product product : DaoProduct
            .getInstance().getBestSale()) {%>
                            <div class="item">
                                <div class="product-thumb transition">
                                    <div class="image product-imageblock">
                                        <a href="ProductDetail?idProduct=<%=product.getId()%>"> <img src="upload/product/<%=product.getAvatar()%>"
                                                                     alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy"
                                                                     class="img-responsive" /> </a>
                                        <div class="button-group">
                                            <button type="button" class="wishlist" data-toggle="tooltip"
                                                    title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                            <button type="button" class="addtocart-btn">Mua Ngay</button>
                                            <button type="button" class="compare" data-toggle="tooltip"
                                                    title="Compare this Product"><i
                                                    class="fas fa-shopping-cart"></i></button>
                                        </div>
                                    </div>
                                    <div class="caption product-detail">
                                        <h4 class="product-name"><a href="product.html"
                                                                    title="lorem ippsum dolor dummy"><%=product.getName()%></a></h4>
                                        <p class="price product-price"> <span class="price-new"><%=product.getSalePrice()%>$</span> <span
                                                class="price-old"><%=product.getPrice()%>$</span> <span class="price-tax">Ex Tax:
                                                    210.00$</span> </p>
                                    </div>
                                    <div class="button-group">
                                        <button type="button" class="wishlist" data-toggle="tooltip"
                                                title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                        <button type="button" class="addtocart-btn">Mua Ngay</button>
                                        <button type="button" class="compare" data-toggle="tooltip"
                                                title="Compare this Product"><i
                                                class="fas fa-shopping-cart"></i></button>
                                    </div>
                                </div>
                            </div>
                            <%}%>


                        </div>
                    </div>
                </div>
                <!-- tab-special-->
                <div id="tab-bestseller" class="tab-content">
                    <div class="box">
                        <div id="bestseller-slidertab" class="row owl-carousel product-slider">
                            <%for (Product product : DaoProduct
                                    .getInstance().getBestSeller()) {%>
                            <div class="item">
                                <div class="product-thumb transition">
                                    <div class="image product-imageblock">
                                        <a href="ProductDetail?idProduct=<%=product.getId()%>"> <img src="upload/product/<%=product.getAvatar()%>"
                                                                     alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy"
                                                                     class="img-responsive" /> </a>
                                        <div class="button-group">
                                            <button type="button" class="wishlist" data-toggle="tooltip"
                                                    title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                            <button type="button" class="addtocart-btn">Mua Ngay</button>
                                            <button type="button" class="compare" data-toggle="tooltip"
                                                    title="Compare this Product"><i
                                                    class="fas fa-shopping-cart"></i></button>
                                        </div>
                                    </div>
                                    <div class="caption product-detail">
                                        <h4 class="product-name"><a href="product.html"
                                                                    title="lorem ippsum dolor dummy"><%=product.getName()%></a></h4>
                                        <p class="price product-price"> <span class="price-new"><%=product.getSalePrice()%>$</span> <span
                                                class="price-old"><%=product.getPrice()%>$</span> <span class="price-tax">Ex Tax:
                                                    210.00$</span> </p>
                                    </div>

                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="container general-contain" style="margin-bottom: 20px;">

    <div class="row">
        <div id="content" class="col-sm-12">

            <div class="blog">
                <div class="blog-heading">
                    <h3>Blog mới nhất</h3>
                </div>
                <div class="blog-inner box">
                    <ul class="list-unstyled blog-wrapper" id="latest-blog">
                        <li class="item blog-slider-item">
                            <div class="panel-default">
                                <div class="blog-image">
                                    <a class="blog-imagelink"><img src="image/blog/blog_1.jpg" alt="#"></a>
                                    <span class="blog-hover"></span> <span class="blog-date">25/05/2021</span> <span
                                        class="blog-readmore-outer"><a href="#" class="blog-readmore">Read
                                                More</a></span>
                                </div>
                                <div class="blog-content">
                                    <a class="blog-name">
                                        <h2>Những Sản Phẩm Hot Và Ưa Chuộng Của NIKE</h2>
                                    </a>
                                    <div class="blog-desc">Hiện nay, có rất là nhiều bạn yêu thích và đam mê môn
                                        chạy bộ. Và dĩ nhiên muốn có trải nghiệm tốt về chạy bộ phải có một đôi giày
                                        thể thao chạy bộ chất lượng để có thể chạy thật thoải mái và êm ái. Và giày
                                        chạy bộ tốt phải đi kèm với sự thời trang. Hôm nay Vsneaker xin giới thiệu
                                        các bạn những mẫu giày chạy bộ đẹp và tốt đang hot của Nike hiện nay. Chúng
                                        ta cùng....</div>
                                    <a href="#" class="blog-readmore">Read More</a> <span
                                        class="blog-date">11/02/2021</span>
                                </div>
                            </div>
                        </li>
                        <li class="item blog-slider-item">
                            <div class="panel-default">
                                <div class="blog-image">
                                    <a href="#" class="blog-imagelink"><img src="image/blog/blog_2.jpg" alt="#"></a>
                                    <span class="blog-hover"></span> <span class="blog-date">06/07/2020</span> <span
                                        class="blog-readmore-outer"><a href="#" class="blog-readmore">Read
                                                More</a></span>
                                </div>
                                <div class="blog-content">
                                    <a href="#" class="blog-name">
                                        <h2>CẨM NANG LỰA CHỌN GIÀY CHẠY ROAD HOKA</h2>
                                    </a>
                                    <div class="blog-desc">Hoka, hãng giày chạy bộ nổi tiếng thế giới, hàng năm đều
                                        cho ra mắt những đôi giày chạy bộ chất lượng cao tích hợp những công nghệ
                                        độc quyền tiên tiến nhất. Hoka chuyên sản xuất những đôi giày có xu hướng
                                        nhẹ, có nhiều đệm để tạo sự thoải mái và đệm tối đa. Đặc biệt, mỗi dòng giày
                                        của Hoka đều có nhiều phối màu khác nhau và đẹp mắt cho người chạy lựa
                                        chọn....</div>
                                    <a href="singale-blog.html" class="blog-readmore">Read More</a> <span
                                        class="blog-date">14/05/2020</span>
                                </div>
                            </div>
                        </li>
                        <li class="item blog-slider-item">
                            <div class="panel-default">
                                <div class="blog-image">
                                    <a href="#" class="blog-imagelink"><img src="image/blog/blog_3.jpg" alt="#"></a>
                                    <span class="blog-hover"></span> <span class="blog-date">06/07/2020</span> <span
                                        class="blog-readmore-outer"><a href="singale-blog.html"
                                                                       class="blog-readmore">Read More</a></span>
                                </div>
                                <div class="blog-content">
                                    <a href="#" class="blog-name">
                                        <h2>Brooks – Ông vua thị trường giày chạy bộ chuyên nghiệp</h2>
                                    </a>
                                    <div class="blog-desc">Brooks – ông hoàng giày chạy bộ đến từ Mỹ. Với nhiều
                                        người Việt Nam, cái tên Brooks có vẻ lạ lẫm (thậm chí chưa nghe nói đến bao
                                        giờ) nếu so với các thương hiệu sừng sỏ khác trong thế giới thể thao như
                                        Nike, Adidas, Asics,…nhưng ở Mỹ và Châu Âu, Brooks đang làm mưa làm gió
                                        trong những năm gần đây. Trong một năm trở lại đây, những người yêu chạy bộ
                                        tại...</div>
                                    <a href="singale-blog.html" class="blog-readmore">Read More</a> <span
                                        class="blog-date">16/02/2020</span>
                                </div>
                            </div>
                        </li>
                        <li class="item blog-slider-item">
                            <div class="panel-default">
                                <div class="blog-image">
                                    <a class="blog-imagelink"><img src="image/blog/blog_4.png" alt="#"></a>
                                    <span class="blog-hover"></span> <span class="blog-date">06/07/2020</span> <span
                                        class="blog-readmore-outer"><a href="#" class="blog-readmore">Read
                                                More</a></span>
                                </div>
                                <div class="blog-content">
                                    <a href="#" class="blog-name">
                                        <h2>Top các mẫu giày Sneaker Classic trắng tinh siêu đẹp và siêu Hot</h2>
                                    </a>
                                    <div class="blog-desc">Hôm nay, Vsneaker xin liệt kê 10 mẫu giày sneaker classic
                                        trắng mà bạn nên có trong tủ đồ của mình. Những mẫu giày dưới đây, Vsneaker
                                        đều có nhận order về nha mọi người. Mọi người thích mẫu nào, cứ báo cho
                                        Vsneaker biết nha !...</div>
                                    <a href="#" class="blog-readmore">Read More</a> <span
                                        class="blog-date">06/07/2020</span>
                                </div>
                            </div>
                        </li>
                        <li class="item blog-slider-item">
                            <div class="panel-default">
                                <div class="blog-image">
                                    <a class="blog-imagelink"><img src="image/blog/blog_5.jpg" alt="#"></a>
                                    <span class="blog-hover"></span> <span class="blog-date">06/07/2020</span> <span
                                        class="blog-readmore-outer"><a href="#" class="blog-readmore">Read
                                                More</a></span>
                                </div>
                                <div class="blog-content">
                                    <a href="#" class="blog-name">
                                        <h2>Air Jordan 1 Retro High OG Shadow 2.0- “Bóng 2.0” sẽ ra mắt vào tháng 5
                                            rực rỡ</h2>
                                    </a>
                                    <div class="blog-desc">Sau khi Jordan 1 Retro high Shadow 1.0 được tung ra và
                                        mang lại thành công vô cùng lớn về mặt doanh thu cho Jordan Brand. Và Shadow
                                        2.0 ra đời với những nâng cấp về phối màu, chất liệu da của 2.0 sẽ được thay
                                        đổi. Vẫn là phối màu chủ đạo của Shadow là xám và đen, nhưng phối màu của
                                        Shadow 2.0 được chia đều hơn so với 1.0 khi mà Shadow 1.0 màu đen chiếm...
                                    </div>
                                    <a href="#" class="blog-readmore">Read More</a> <span
                                        class="blog-date">06/07/2020</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>

</div>

<div class="container general-contain" style="margin-bottom: 20px;">
    <div id="subbanner4" class="banner" style="margin: 0;">
        <div class="item">
            <a><img src="image/banners/subbanner4.jpg" alt="Sub Banner4" class="img-responsive" /></a>
        </div>
    </div>
</div>


<%@include file="./footer.jsp"%>
<%@include file="footer_login_message.jsp"%>


<script src="javascript/parally.js"></script>
<script>
    $('.parallax').parally({
        offset: -40
    });
</script>

<script src="javascript/hung-js.js"></script>

</body>

</html>
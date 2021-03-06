<%@ page import="dao.product.DaoProduct" %>
<%@ page import="beans.Product" %>
<%@ page import="java.util.List" %>
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
            background-color: #ededed;
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
                        <li class='tab'><a href="#tab-latest">S???n Ph???m M???i Nh???t</a></li>
                        <li class='tab'><a href="#tab-special">S???n Ph???m Gi???m Gi??</a></li>
                        <li class='tab'><a href="#tab-bestseller">S???n Ph???m B??n Ch???y</a></li>
                    </ul>
                </div>
                <div id="tab-latest" class="tab-content">
                    <div class="box">
                        <div id="latest-slidertab" class="row owl-carousel product-slider">
                            <%   List<Product> listNewestProduct = (List<Product>) request.getAttribute("listNewestProduct");
                                for (Product product : listNewestProduct) {%>
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
                            <%List<Product> listBestSaleProduct = (List<Product>) request.getAttribute("listBestSaleProduct");
                                for (Product product : listBestSaleProduct)  {%>
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
                            <%List<Product> listBestSellerProduct = (List<Product>) request.getAttribute("listBestSellerProduct");
                                for (Product product : listBestSellerProduct)  {%>
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
                    <h3>Blog m???i nh???t</h3>
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
                                        <h2>Nh???ng S???n Ph???m Hot V?? ??a Chu???ng C???a NIKE</h2>
                                    </a>
                                    <div class="blog-desc">Hi???n nay, c?? r???t l?? nhi???u b???n y??u th??ch v?? ??am m?? m??n
                                        ch???y b???. V?? d?? nhi??n mu???n c?? tr???i nghi???m t???t v??? ch???y b??? ph???i c?? m???t ????i gi??y
                                        th??? thao ch???y b??? ch???t l?????ng ????? c?? th??? ch???y th???t tho???i m??i v?? ??m ??i. V?? gi??y
                                        ch???y b??? t???t ph???i ??i k??m v???i s??? th???i trang. H??m nay Vsneaker xin gi???i thi???u
                                        c??c b???n nh???ng m???u gi??y ch???y b??? ?????p v?? t???t ??ang hot c???a Nike hi???n nay. Ch??ng
                                        ta c??ng....</div>
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
                                        <h2>C???M NANG L???A CH???N GI??Y CH???Y ROAD HOKA</h2>
                                    </a>
                                    <div class="blog-desc">Hoka, h??ng gi??y ch???y b??? n???i ti???ng th??? gi???i, h??ng n??m ?????u
                                        cho ra m???t nh???ng ????i gi??y ch???y b??? ch???t l?????ng cao t??ch h???p nh???ng c??ng ngh???
                                        ?????c quy???n ti??n ti???n nh???t. Hoka chuy??n s???n xu???t nh???ng ????i gi??y c?? xu h?????ng
                                        nh???, c?? nhi???u ?????m ????? t???o s??? tho???i m??i v?? ?????m t???i ??a. ?????c bi???t, m???i d??ng gi??y
                                        c???a Hoka ?????u c?? nhi???u ph???i m??u kh??c nhau v?? ?????p m???t cho ng?????i ch???y l???a
                                        ch???n....</div>
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
                                        <h2>Brooks ??? ??ng vua th??? tr?????ng gi??y ch???y b??? chuy??n nghi???p</h2>
                                    </a>
                                    <div class="blog-desc">Brooks ??? ??ng ho??ng gi??y ch???y b??? ?????n t??? M???. V???i nhi???u
                                        ng?????i Vi???t Nam, c??i t??n Brooks c?? v??? l??? l???m (th???m ch?? ch??a nghe n??i ?????n bao
                                        gi???) n???u so v???i c??c th????ng hi???u s???ng s??? kh??c trong th??? gi???i th??? thao nh??
                                        Nike, Adidas, Asics,???nh??ng ??? M??? v?? Ch??u ??u, Brooks ??ang l??m m??a l??m gi??
                                        trong nh???ng n??m g???n ????y. Trong m???t n??m tr??? l???i ????y, nh???ng ng?????i y??u ch???y b???
                                        t???i...</div>
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
                                        <h2>Top c??c m???u gi??y Sneaker Classic tr???ng tinh si??u ?????p v?? si??u Hot</h2>
                                    </a>
                                    <div class="blog-desc">H??m nay, Vsneaker xin li???t k?? 10 m???u gi??y sneaker classic
                                        tr???ng m?? b???n n??n c?? trong t??? ????? c???a m??nh. Nh???ng m???u gi??y d?????i ????y, Vsneaker
                                        ?????u c?? nh???n order v??? nha m???i ng?????i. M???i ng?????i th??ch m???u n??o, c??? b??o cho
                                        Vsneaker bi???t nha !...</div>
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
                                        <h2>Air Jordan 1 Retro High OG Shadow 2.0- ???B??ng 2.0??? s??? ra m???t v??o th??ng 5
                                            r???c r???</h2>
                                    </a>
                                    <div class="blog-desc">Sau khi Jordan 1 Retro high Shadow 1.0 ???????c tung ra v??
                                        mang l???i th??nh c??ng v?? c??ng l???n v??? m???t doanh thu cho Jordan Brand. V?? Shadow
                                        2.0 ra ?????i v???i nh???ng n??ng c???p v??? ph???i m??u, ch???t li???u da c???a 2.0 s??? ???????c thay
                                        ?????i. V???n l?? ph???i m??u ch??? ?????o c???a Shadow l?? x??m v?? ??en, nh??ng ph???i m??u c???a
                                        Shadow 2.0 ???????c chia ?????u h??n so v???i 1.0 khi m?? Shadow 1.0 m??u ??en chi???m...
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
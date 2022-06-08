<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: khanh
  Date: 12/6/2021
  Time: 12:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="model.*" %>
<%@ page import="model.Admin.DaoProductAdmin" %>
<%@ page import="beans.Banner" %>


<html lang="en">

<head>
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
    <link rel="stylesheet" href="css/dat-css.css">
    <link href="owl-carousel/owl.carousel.css" type="text/css" rel="stylesheet" media="screen" />
    <link href="owl-carousel/owl.transitions.css" type="text/css" rel="stylesheet" media="screen" />
    <!-- <script src="javascript/Dat-js.js" type="text/javascript"></script> -->
    <script src="javascript/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="javascript/jstree.min.js" type="text/javascript"></script>
    <script src="javascript/template.js" type="text/javascript"></script>
    <script src="javascript/common.js" type="text/javascript"></script>
    <script src="javascript/global.js" type="text/javascript"></script>
    <script src="owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
    <link rel="shortcut icon" href="image/logo.png" />

    <link rel="stylesheet" href="css/dat-css.css">
    <link rel="stylesheet" href="css/khanh-css.css">
    <link rel="stylesheet" href="css/hung-css.css">
    <script src="javascript/khanh-js.js"></script>
</head>

<body class="category col-2 left-col">
<%--
  Created by IntelliJ IDEA.
  User: khanh
  Date: 12/6/2021
  Time: 5:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<header>
    <div class="contain-header-inner">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 contain-header">
                    <div class="contain-nav-info">
                        <div id="top-links" class="nav pull-left">
                            <ul class="list-inline">
                                <li class="account"><a href="/admin/pixelwibes.com/template/ebazar/html/dist/index.html" class="notify"><i
                                        class="fas fa-bell color-header" style="margin-right: 10px"></i><span
                                        style="margin: 0 5px;" class="color-header">Thông
                                    báo</span><span style="margin-right: 10px;"
                                                    class="color-header">(0)</span></a>
                                </li>
                                <li class="account"><a href="customer.html" id="wishlist-total"
                                                       title="Wish List (0)"><i class="fa fa-heart color-header"></i><span
                                        class="color-header">Danh sách
                                                yêu thích</span><span style="margin-right: 10px;"
                                                                      class="color-header">(0)</span></a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" title="My Account" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-user color-header"></i><span class="color-header">Tài
                                                khoản</span> <span style=" font-size: 15px;"
                                                                   class="caret color-header"></span></a>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li><a href="#" class="js-login" id="Login">Đăng Nhập</a></li>
                                        <li><a href="#" class="js_register">Đăng Ký</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="container">
            <div class="header-inner">

                <div class="header-top">
                    <div>
                        <div class="header-middle-top">
                            <div id="logo" class="color-header" style="margin: 0; padding: 0;">
                                <a href="index.html"><img src="/project_war/image/logo.png" title="E-Commerce" alt="E-Commerce"
                                                          class="logo-header" /></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="text-center contain-search">
                    <div class="contain-search-product-popular">
                        <form id="form-header-search" class="search-product" action="" method="post">
                            <input name="input-search-header" id="input-search-header"
                                   class="input-text-search-top"
                                   placeholder="Tìm kiếm" type="text" autocomplete="off"/>
                            <button type="submit" class="search-product-top" id="button-search-header"><i class="fa fa-search"></i></button>
                        </form>
                        <div class="contain-search-popular">
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 col-xs-12 header-right header-nav-right">

                    <div id="cart" class="btn-group btn-block" style="margin: 0; padding: 0;">
                        <button type="button"
                                class="btn btn-inverse btn-block btn-lg dropdown-toggle cart-dropdown-button cart-nav p-3">
                            <span class="color-header">
                                <span class="cart-title color-header m-2" style="margin-left: 10px">Giỏ hàng - </span>254.000 Đ</span>
                            <span class="value-header-product" style="margin: 0 10px">3</span>
                            <i class="fas fa-shopping-cart cart-icon-nav"></i>
                        </button>


                        <ul class="dropdown-menu pull-right cart-dropdown-menu">
                            <li  class="cart-filter" style="display: grid;max-height: 328px;overflow-y: scroll;overflow-x: hidden">
                                <table class="table table-striped">
                                    <tbody>
                                    <c:set var="list" value="${cart.data}"/>
                                    <c:forEach items="${list}" var="item">
                                        <td class="text-center">
                                            <a href="ProductDetail?idProduct=${item.id}"><img src="data/imgAll/${item.avatar}.jpg" width="100px"
                                                                                              height="100px"></a>
                                        </td>
                                        <td class="text-left"><a href="ProductDetail?idProduct=${item.id}">${item.name}</a>
                                            <div class="SL-Gia">
                                                <p class="gia">${item.gettotal()}$</p>
                                                <p class="SL">SL: ${item.quantitySold}</p>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <a class="cart-remove" pid="${item.id}">
                                                <button class="btn btn-danger btn-xs" title="Remove" type="button"><i
                                                        class="fa fa-delete-left"></i> </button>
                                            </a>
                                        </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </li>
                            <li>
                                <div>
                                    <table class="table table-bordered">
                                        <tbody>
                                        <br>
                                        <tr>
                                            <td class="text-right"><strong>Tạm tính</strong></td>
                                            <td class="text-right">254.000Đ</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <p class="text-right"> <span class="btn-viewcart"><a href="/project/Cart"><strong><i
                                            class="fa fa-shopping-cart"></i> View
                                                        Cart</strong></a></span> <span class="btn-checkout"><a
                                            href="checkout.html"><strong><i class="fa fa-share"></i>
                                                        Checkout</strong></a></span> </p>
                                </div>
                            </li>
                        </ul>
                    </div>




                </div>


                <button type="button" class="bt-nav-collapse hidden-lg hidden-md"><i
                        class="fa fa-bars"></i></button>

            </div>

        </div>
    </div>
    <nav id="menu-navigation" class="navbar" style="width: 100%;">
        <div class="nav-inner">

            <div class="navbar-collapse" style="background-color: #0f6cb2;">
                <ul class="main-navigation">
                    <li><a href="/project_war/views.customer/blog.jsp" style="color: white" class="parent" id="home-nav">TRANG CHỦ</a> </li>
                    <li style="position: relative">
                        <a href="caterogyGender?categoryGender=Man" style="color: white" class="parent category-item" id="category-man">
                            NAM
                            <i class="fas fa-caret-down"></i>
                        </a>

                        <ul class="man-category" style="background-color: #0f6cb2; border:none; position:absolute; top: 35px;left:-15px;">
                            <li id="running-man"  class="category-product category-product-man">
                                <a href="SearchListProduct?categoryOnNav=Running Man&pagination=1" class="link-navigation" style="color:white;background-color: #0f6cb2">Runnings</a>
                            </li>
                            <li id="slides-man"  class="category-product category-product-man">
                                <a href="SearchListProduct?categoryOnNav=Slides Man&pagination=1" class="link-navigation" style="color:white;background-color: #0f6cb2">Slides</a>
                            </li>
                            <li id="sneakers-man"  class="category-product category-product-man">
                                <a href="SearchListProduct?categoryOnNav=Sneakers Man&pagination=1" class="link-navigation" style="color:white;background-color: #0f6cb2">Sneakers</a>
                            </li>
                            <li id="skateboard-man"  class="category-product category-product-man">
                                <a href="SearchListProduct?categoryOnNav=Skateboard Man&pagination=1" class="link-navigation" style="color:white;background-color: #0f6cb2">SkateBoard</a>
                            </li>
                            <li id="trainers-man"  class="category-product category-product-man">
                                <a href="SearchListProduct?categoryOnNav=Trainers Man&pagination=1" class="link-navigation" style="color:white;background-color: #0f6cb2">Trainers</a>
                            </li>
                        </ul>

                    </li>
                    <li style="position: relative"
                    ><a href="caterogyGender?categoryGender=Woman" style="color: white" class="parent category-item" id="category-woman">NỮ <i class="fas fa-caret-down"></i></a>

                        <ul class="woman-category" style="background-color: #0f6cb2; border:none; position:absolute; top: 35px;left: -15px">
                            <li id="running-woman"  class="category-product category-product-woman">
                                <a href="SearchListProduct?category=Running Woman&categoryGender=description&pagination=1" class="link-navigation" style="color:white;background-color: #0f6cb2">Running</a>
                            </li>
                            </li>
                            <li id="slides-woman"  class="category-product category-product-woman">
                                <a href="SearchListProduct?category=Slides Woman&categoryGender=description&pagination=1" class="link-navigation" style="color:white;background-color: #0f6cb2">Slides</a>
                            </li>
                            </li>
                            <li id="sneakers-woman"  class="category-product category-product-woman">
                                <a href="SearchListProduct?category=Sneakers Woman&categoryGender=description&pagination=1" class="link-navigation" style="color:white;background-color: #0f6cb2">Sneakers</a>
                            </li>
                            </li>
                            <li id="skateboard-woman"  class="category-product category-product-woman">
                                <a href="SearchListProduct?category=Skateboard Woman&categoryGender=description&pagination=1" class="link-navigation" style="color:white;background-color: #0f6cb2">Skateboard</a>
                            </li>
                            <li id="trainers-woman"  class="category-product category-product-woman">
                                <a href="SearchListProduct?categoryOnNav=Trainers Woman&pagination=1" class="link-navigation" style="color:white;background-color: #0f6cb2">Trainers</a>
                            </li>
                            </li>
                        </ul>

                    </li>
                    <li><a href="category.html" style="color: white" class="parent category-item" id="category-brand">NHÃN HÀNG <i class="fas fa-caret-down"></i></a></li>
                    <li><a href="/project_war/views.customer/blog.jsp" style="color: white" class="parent" id="blog-nav">BLOG</a></li>
                    <li><a href="about-us.html" style="color: white"  id="about-nav" >VỀ CHÚNG TÔI</a></li>
                </ul>
                <div class="nav-detail-info">

                    <div class="item-nav-detail-info" id="item-category-brand">
                        <div class="contain-brand" >
                            <img onclick="location.href='SearchListProduct?brand=ASICS&pagination=1'" src="image/brand/logo-brand-01.svg">
                            <img onclick="location.href='SearchListProduct?brand=ADIDAS'" src="image/brand/logo-brand-02.svg">
                            <img onclick="location.href='CategoryProduct?category=VANS&categoryGender=brand&pagination=1'" src="image/brand/logo-brand-03.jpg">
                            <img onclick="location.href='CategoryProduct?category=NIKE&categoryGender=brand&pagination=1'" src="image/brand/logo-brand-04.svg">
                            <img onclick="location.href='CategoryProduct?category=REEBOK&categoryGender=brand&pagination=1'" src="image/brand/logo-brand-05.svg">
                            <img onclick="location.href='CategoryProduct?category=NEW BALANCE&categoryGender=brand&pagination=1'" src="image/brand/logo-brand-06.svg">
                            <img onclick="location.href='CategoryProduct?category=ON RUNNING&categoryGender=brand&pagination=1'" src="image/brand/logo-brand-07.jpg">
                            <img onclick="location.href='CategoryProduct?category=UNDER ARMOUR&categoryGender=brand&pagination=1'" src="image/brand/logo-brand-08.svg">
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </nav>
</header>
<script>
    $(document).ready(function () {
        $(".cart-remove").click(function () {
            var id = $(this).attr("pid");
            tr = $(this).closest("tr");
            console.log(id);
            $.ajax({
                url: "/project/Cart-remove",
                method: "POST",
                data: {
                    id: id
                },
                success: function (data) {
                    tr.remove();
                },
                error: function (data) {
                    if (data.status === 404)
                        alert("Xoa That Bai");
                }
            })
        })
    })
</script>
<div class="container-category" style="width: 100%">

    <div class="row contain-category" style="width: 100%">
        <div id="content" class="content-about" style="display:flex; flex-wrap:wrap; padding-top: 30px; width: 100%">
            <div class="mainbanner" style="padding: 10px; width: 100%; background-color: #f3f3f3; width: 100%">
                <div id="main-banner" class="owl-carousel home-slider" style="height: fit-content; width: 100%">
                    <%
                        List<Banner> listCarousel = (List<Banner>) request.getAttribute("listCarousel");
                        List<Banner> listIntro = (List<Banner>) request.getAttribute("listIntro");

                        for(Banner banner : listCarousel) {%>
                    <div class="item" style="width: 100%;">
                            <img src="image/banners/<%=banner.getUrlImg()%>" id="category-carousel-intro-1" alt="main-banner1"
                                 class="img-responsive img-border-radius" style="width: 100%;"/>
                        <div class="main-banner-section-center">
                        </div>
                    </div>
                    <%}%>

                </div>
            </div>
            <div class="grid-list-wrapper bg-item" style="width: 100%">

                <div class="contain-carousel-category" style="width: 100%">

                    <div class="featured-category">
                        Featured category
                    </div>
                    <div class="list-contain">
                        <ul value="!23">
                            <%for (Banner banner : listIntro) {%>
                            <li id="intro-hitops" class="intro-category category-product" onclick="location.href='<%=banner.getLinkTo()%>'">
                                <a href='<%=banner.getLinkTo()%>'>
                                    <img src="image/category/<%=banner.getUrlImg()%>" alt="">
                                    <p class="title-category"><%=banner.getTitle()%></p>
                                    <p class="introduce-category"><%=banner.getText()%></p>
                                </a>
                            </li>

                            <%}%>

                        </ul>
                    </div>
                </div>

                <!-- khanh-js.js display this product -->
            </div>
        </div>


    </div>
</div>
<%@include file="footer_login_message.jsp"%>
<script src="javascript/hung-js.js"></script>

</body>

</html>
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
<%@ page import="databaseConnection.DatabaseConnection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="model.Product" %>
<%@ page import="model.DaoLinkImage" %>
<%@ page import="model.DaoProduct" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html lang="en">

<head>
    <title>Time Watch</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="e-commerce site well design with responsive view." />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link href="css/stylesheet.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <link href="owl-carousel/owl.carousel.css" type="text/css" rel="stylesheet" media="screen" />
    <link href="owl-carousel/owl.transitions.css" type="text/css" rel="stylesheet" media="screen" />
    <link rel="stylesheet" href="font-awesome/fonts/fontawesome-free-6.0.0-beta3-web/css/all.css">
    <script src="javascript/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="javascript/jstree.min.js" type="text/javascript"></script>
    <script src="javascript/template.js" type="text/javascript"></script>
    <script src="javascript/common.js" type="text/javascript"></script>
    <script src="javascript/global.js" type="text/javascript"></script>
    <script src="owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/dat-css.css">
    <link rel="stylesheet" href="css/khanh-css.css" type="text/css">
    <link rel="stylesheet" href="./css/hung-css.css">
    <script src="javascript/khanh-js.js" type="text/javascript"></script>


</head>

<body class="category col-2 left-col" >
<header style="background-color: #108bea;">
    <div style="display: flex; flex-wrap: wrap;  width: 100%;">
        <div class="header-top" style="background-color: #108bea;">
            <div>
                <div class="header-middle-top" >
                    <div id="logo" class="color-header" style="margin: 0; padding: 0;">
                        <a href="index.html"><img src="image/logo.png" title="E-Commerce" alt="E-Commerce"
                                                  class="logo-header" /></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="header-inner">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 contain-header">
                            <div class="contain-nav-info">
                                <div id="top-links" class="nav pull-left">
                                    <ul class="list-inline">
                                        <li class="account"><a href="customer.html" class="notify"><i
                                                style="color: rgba(255,255,255,0.8); font-size: 15px;"
                                                class="fas fa-bell" style="margin-right: 10px"></i><span
                                                style="color: rgba(255,255,255,0.8); font-size: 15px;margin: 0 5px;">Thông
                                                        báo</span><span
                                                style="margin-right: 10px; color: rgba(255,255,255,0.8);">(0)</span></a>
                                        </li>
                                        <li class="account"><a href="customer.html" id="wishlist-total"
                                                               title="Wish List (0)"><i
                                                style="color: rgba(255,255,255,0.8); font-size: 15px;"
                                                class="fa fa-heart"></i><span
                                                style="color: rgba(255,255,255,0.8); font-size: 15px;">Danh sách
                                                        yêu thích</span><span
                                                style="margin-right: 10px; color: rgba(255,255,255,0.8);">(0)</span></a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" title="My Account" class="dropdown-toggle"
                                               data-toggle="dropdown"> <i
                                                    style="color: rgba(255,255,255,0.8); font-size: 15px;"
                                                    class="fa fa-user"></i><span
                                                    style="color: rgba(255,255,255,0.8); font-size: 15px;">Tài
                                                        khoản</span> <span
                                                    style="color: rgba(255,255,255,0.8);; font-size: 15px;"
                                                    class="caret"></span></a>
                                            <ul class="dropdown-menu dropdown-menu-right">
                                                <li><a href="#" class="js-login">Đăng ký</a></li>
                                                <li><a href="#" class="js_register">Đăng nhập</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>


                <div class="text-center contain-search" style="margin-top: 20px;">
                    <div class="contain-search-product-popular">
                        <form class="search-product" action="FilterProduct" method="post">
                            <input class="input-text-search-top" placeholder="Tìm kiếm" type="text" name="filterByIconSearch">
                            <button type="submit" class="search-product-top"><i class="fa fa-search"></i></button>
                        </form>
                        <div class="contain-search-popular">
                            <span>X-Ray 2</span>
                            <span>Barcelona Home Kit 2021 2022</span>
                            <span>Chelsea Home Kit 2021 2022</span>
                            <span>X9000L4 Shoes Mens</span>
                            <span>PSG Home 21/22 Shirt - Messi 30 printing</span>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 col-xs-12 header-right header-nav-right" style="padding-right: 10px;">
                    <div class="">
                        <div class="shipping">
                            <div class="shipping-text color-header">(+91) 000-1233<br>
                                <span class="shipping-detail color-header">24/7 Online Support</span>
                            </div>
                        </div>
                    </div>

                    <div id="cart" class="btn-group btn-block">
                        <button type="button"
                                class="btn btn-inverse btn-block btn-lg dropdown-toggle cart-dropdown-button"> <span
                                id="cart-total" class="color-header"><span class="cart-title color-header">Shopping
                                        Cart</span><br>
                                    0 item(s) - $0.00</span>
                            <i class="fas fa-shopping-cart"
                               style="font-size: 30px; color: white; padding-top: 5px;"></i>
                        </button>

                        <ul class="dropdown-menu pull-right cart-dropdown-menu">
                            <li>
                                <table class="table table-striped">
                                    <tbody>
                                    <tr>
                                        <td class="text-center">
                                            <a href="#"><img src="image/product/product-01.jpg"
                                                             style="width: 100px; height: 100px;"></a>
                                        </td>
                                        <td class="text-left"><a href="#">lorem ippsum dolor dummy</a></td>
                                        <td class="text-right">x 1</td>
                                        <td class="text-right">$254.00</td>
                                        <td class="text-center"><button class="btn btn-danger btn-xs"
                                                                        title="Remove" type="button"><i
                                                class="fa fa-times"></i></button></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </li>
                            <li>
                                <div>
                                    <table class="table table-bordered">
                                        <tbody>
                                        <tr>
                                            <td class="text-right"><strong>Sub-Total</strong></td>
                                            <td class="text-right">$210.00</td>
                                        </tr>
                                        <tr>
                                            <td class="text-right"><strong>Eco Tax (-2.00)</strong></td>
                                            <td class="text-right">$2.00</td>
                                        </tr>
                                        <tr>
                                            <td class="text-right"><strong>VAT (20%)</strong></td>
                                            <td class="text-right">$42.00</td>
                                        </tr>
                                        <tr>
                                            <td class="text-right"><strong>Total</strong></td>
                                            <td class="text-right">$254.00</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <p class="text-right"> <span class="btn-viewcart"><a href="cart.html"><strong><i
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
        <!--function displayMenuNavigation() in khanh-js.js-->
    </nav>
</header>
<div class="container-category" >

    <div class="row contain-category" >
        <button class="toggle-filter-search">
            <i class="fas fa-sliders-h"></i>
        </button>
        <div id="" class="col-sm-3 contain-filter-search" style="margin-right: 90px;">
            <form id="form-filter-search" class="panel panel-default filter" action="FilterProduct" method="post">
                <div class="filter-block">
                    <div class="list-group">
                        <a class="list-group-item">Brands</a>
                        <div class="list-group-item">
                            <div class="contain-dropdown-item filter-search">
                                <label class="checkbox-filter-search">
                                    <input name="filterBrand" type="checkbox" value="ASICS"/>
                                    ASICS</label>
                                <label class="checkbox-filter-search">
                                    <input name="filterBrand" type="checkbox" value="ADIDAS"/>
                                    ADIDAS</label>
                                <label class="checkbox-filter-search">
                                    <input name="filterBrand" type="checkbox" value="VANS"/>
                                    VANS</label>
                                <label class="checkbox-filter-search">
                                    <input name="filterBrand" type="checkbox" value="NIKE"/>
                                    NIKE</label>
                                <label class="checkbox-filter-search">
                                    <input name="filterBrand" type="checkbox" value="Reebok"/>
                                    Reebok</label>
                                <label class="checkbox-filter-search">
                                    <input name="filterBrand" type="checkbox" value="NEW BALANCE"/>
                                    NEW BALANCE</label>
                                <label class="checkbox-filter-search">
                                    <input name="filterBrand" type="checkbox" value="ON RUNNING"/>
                                    On RUNNING</label>
                                <label class="checkbox-filter-search">
                                    <input name="filterBrand" type="checkbox" value="UNDER ARMOUR"/>
                                    UNDER ARMOUR</label>
                            </div>
                        </div>
                        <a class="list-group-item">Sizes</a>
                        <div class="list-group-item">
                            <div class="contain-dropdown-size filter-search">

                            </div>
                        </div>
                        <a class="list-group-item">Rates</a>
                        <div class="list-group-item">
                            <div id="filter-group2" class="contain-rate-search">
                                <input type="checkbox" id="five-star-rate" class="hidden-rate" name="filter-star-rate" value="5">
                                <label class="rate-search" for="five-star-rate">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <span style="margin-left: 5px">From 5 stars</span>
                                </label>
                                <input type="checkbox" id="four-star-rate" class="hidden-rate" name="filter-star-rate" value="4">
                                <label class="rate-search" for="four-star-rate">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <span style="margin-left: 5px">From 4 stars</span>
                                </label>
                                <input type="checkbox" id="three-star-rate" class="hidden-rate" name="filter-star-rate" value="3">
                                <label class="rate-search" for="three-star-rate">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <span style="margin-left: 5px">From 3 stars</span>
                                </label>
                            </div>
                        </div>
                        <a class="list-group-item">Prices</a>
                        <div class="list-group-item">
                            <div id="filter-group3" class="contain-price-search">
                                <form class="price-search-highest-lowest">
                                    <input type="radio" id="price-search-highest" name="price-search-radio" value="highest-price"/>
                                    <label for="price-search-highest">From high to low</label>
                                    <input type="radio" id="price-search-lowest" name="price-search-radio" value="lowest-price"/>
                                    <label for="price-search-lowest">From low to high</label>
                                </form>

                                <div class="contain-filter-search-range">
                                    <label class="price-search" id="price-search-01" for="hidden-checkbox-price-1">
                                        Under 50$
                                    </label>
                                    <input type="checkbox" name="price-range" value="Under 50$" class="hidden-checkbox" id="hidden-checkbox-price-1" style="display: none">
                                    <label class="price-search" id="price-search-02" for="hidden-checkbox-price-2">
                                        From 50$ to 150$
                                    </label>
                                    <input type="checkbox" name="price-range" value="From 50$ to 150$" class="hidden-checkbox" id="hidden-checkbox-price-2" style="display: none">
                                    <label class="price-search" id="price-search-03" for="hidden-checkbox-price-3">
                                        Up 150$
                                    </label>
                                    <input type="checkbox" name="price-range" value="Up 150$" class="hidden-checkbox" id="hidden-checkbox-price-3" style="display: none">
                                </div>


                                <div class="min-max-price-search">
                                    <input type="text" name="input-range-filter-price" value="" class="min-search" placeholder="Từ">
                                    <p style="font-size: 50px; margin: 0 10px">-</p>
                                    <input type="text" name="input-range-filter-price" value="" class="max-search" placeholder="Đến">
                                </div>
                                <%
                                    Object err = request.getAttribute("errorInputPrice");
                                    if (err != null) {
                                        out.println("<h1 style='display: block; color: red; margin: 10px 0'>" + err.toString() + "</h1>");
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer text-right">
                        <input value="Tìm kiếm" type="submit" id="button-filter" class="btn btn-primary btn-refine-search">

                    </div>
                </div>
            </form>


        </div>


        <div id="content" class="content-about" style="display:flex; flex-wrap:wrap; padding-top: 30px">



            <%
                int pagination = 1;
                Object objPagination = request.getAttribute("Pagination");
                if (objPagination != null) {
                    pagination = Integer.parseInt(objPagination.toString());
                }

                Object objCategory = request.getAttribute("categoryProduct");
                List<Product> list=  (List <Product>) objCategory;
                if (list != null) {
                    Map<String, ArrayList<String>> map = DaoLinkImage.getInstance().getAll();
                    ArrayList<Product> listFilter = (ArrayList<Product>) request.getAttribute("categoryProduct");
                    for (int i = 0 + 9 * (pagination-1); i < pagination*9; i++) {
                        Product p = listFilter.get(i);
            %>

            <div class="product-layout product-grid col-lg-4 col-md-5 col-sm-6 col-xs-10" style="height: fit-content">
                <div class="product-thumb">
                    <div class="image product-imageblock">
                        <a href="ProductDetail?idProduct=<%=p.getId()%>">
                            <div class="related-product-sale">
                                <h5 style='margin-top: 10px'>-<%=p.getSaleRate()%>%</h5>
                            </div>
                            <img src="data/imgAll/<%=map.get(p.getId()).get(0)%>.jpg" alt="lorem ippsum dolor dummy"
                                 title="lorem ippsum dolor dummy" class="img-responsive"/> </a>
    <% %>
                        <div class="button-group">
                            <button type="button" class="wishlist" data-toggle="tooltip" title="Thêm vào yêu thích">
                                <i class="fas fa-heart"></i></button>
                            <button type="button" class="addtocart-btn">Mua ngay</button>
                            <button type="button" class="compare" data-toggle="tooltip" title="Thêm vào giỏ hàng"><i
                                    class="fas fa-shopping-cart"></i></button>
                        </div>
                    </div>
                    <div class="caption product-detail">
                        <h2 id="\brandCategory123" style='margin-top: 5px; text-transform: uppercase'>

                            <%=p.getBrand()%>
                        </h2>
                        <h4 class="product-name">
                            <a id="nameCategory" href="product.html" title="lorem ippsum dolor dummy"
                               style='text-transform: capitalize'>

                                <%=p.getName()%>


                            </a></h4>
                        <p class="product-desc"> More room to move. With 80GB or 160GB of storage and up to 40 hours
                            of battery life, the new lorem ippsum dolor dummy lets you enjoy up to 40,000 songs or
                            up to 200 hours of video or any combination wherever you go. Cover
                            Flow. Browse through your music collection by flipping..</p>
                        <p id="priceCategory123" class="price product-price"><span class="price-old"
                                                                                   style='margin-right: 10px'>

                                <%=p.getPrice()%>

                                  </span>
                            <%=p.getSalePrice()%>

                            <span class="price-tax">Ex Tax: $100.00</span></p>
                        <div class="rating"><span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i
                                class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                    class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i
                                    class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i
                                    class="fa fa-star-o fa-stack-2x"></i></span></div>
                    </div>
                    <div class="button-group">
                        <button type="button" class="wishlist" data-toggle="tooltip" title="Thêm vào yêu thích"><i
                                class="fas fa-heart"></i></button>
                        <button type="button" class="addtocart-btn">Mua ngay</button>
                        <button type="button" class="compare" data-toggle="tooltip" title="Thêm vào giỏ hàng"><i
                                class="fas fa-shopping-cart"></i></button>
                    </div>
                </div>
            </div>
            <%}%>
            <div class="category-page-wrapper">
                <div class="pagination-inner" id="tessss">
                    <ul class="pagination">
                        <% int lengthPagination = (int)Math.ceil(list.size()/9);%>
                        <li><a id="left-page" href="CategoryProduct?category=<%=request.getAttribute("category")%>&categoryGender=<%=request.getAttribute("categoryGender")%>&pagination=<%=pagination<=1 ? 1: pagination-1%>">&lt;</a></li>
                        <li><a id="right-page" href="CategoryProduct?category=<%=request.getAttribute("category")%>&categoryGender=<%=request.getAttribute("categoryGender")%>&pagination=<%=pagination >= lengthPagination ? lengthPagination: pagination+1%>">&gt;</a></li>
                        <span>Page</span>
                        <select id="selectPagination" onchange="location = this.value;">
                            <%for(int j = 1; j <= lengthPagination; j++){%>
                            <option value="CategoryProduct?category=<%=request.getAttribute("category")%>&categoryGender=<%=request.getAttribute("categoryGender")%>&pagination=<%=j%>"
                                    <% // current pagination
                                        if(j==pagination) {%><%="selected"%> <%}%>><%=j%>
                            </option>
                            <%}%>
                        </select> <span> of <%if(list!=null)%><%=lengthPagination%></span>
                    </ul>
                </div>
            </div>
            <%}
            else {

                Object objGender = request.getAttribute("categoryGender");
                String categoryGender = objGender.toString();
                ArrayList<String> listCarousel;
                ArrayList<String> listIntro;
                if (categoryGender.equals("Man")) {
                    listCarousel = new ArrayList<String>(Arrays.asList("image/banners/men-intro-carousel1.webp", "image/banners/men-intro-carousel2.webp", "image/banners/men-intro-carousel-3.jpg"));
                    listIntro = new ArrayList<String>(Arrays.asList("image/category/man-Hitops.webp", "image/category/man-running.webp", "image/category/man-slides.jpg", "image/category/man-football.webp", "image/category/man-sneakers.jpg", "image/category/man-skateboard.jpg"));
                }
                else { listCarousel = new ArrayList<String>(Arrays.asList("image/banners/women-intro-carousel1.webp", "image/banners/women-intro-carousel2.webp", "image/banners/women-intro-carousel3.webp"));
                    listIntro = new ArrayList<String>(Arrays.asList("image/category/woman-hitops.jpg", "image/category/running-woman.webp", "image/category/woman-slide.jpg", "image/category/woman-football.jfif", "image/category/woman-sneakers.webp", "image/category/woman-skateboard.jfif"));
                }

            %>

            <div class="mainbanner" style="padding: 10px; width: 100%; background-color: #f3f3f3;">
                <div id="main-banner" class="owl-carousel home-slider">
                    <div class="item" >
                        <a href="#">
                            <img src="<%=listCarousel.get(0)%>" id="category-carousel-intro-1" alt="main-banner1" class="img-responsive img-border-radius" style="width: 100%;"/></a>
                        <div class="main-banner-section-center">
                        </div>
                    </div>
                    <div class="item">
                        <a href="#"><img src="<%=listCarousel.get(1)%>" id="category-carousel-intro-2" alt="main-banner2" class="img-responsive img-border-radius" style="width: 100%;"/></a>
                        <div class="main-banner-section-center">
                        </div>
                    </div>
                    <div class="item">
                        <a href="#"><img src="<%=listCarousel.get(2)%>" id="category-carousel-intro-3" alt="main-banner3" class="img-responsive img-border-radius" style="width: 100%;"/></a>
                        <div class="main-banner-section-center">
                        </div>
                    </div>
                </div>
`            </div>


            <div class="grid-list-wrapper bg-item">

                <div class="contain-carousel-category">

                    <div class="featured-category" >
                        Featured category
                    </div>
                    <div class="list-contain">
                        <ul value="!23">
                            <li id="intro-hitops" class="intro-category category-product">
                                <img id="category-intro-img-hitops" src="<%=listIntro.get(0)%>" alt="">
                                <p class="title-category">HiTops</p>
                                <p class="introduce-category">Made for the journey, this collection of walking footwear is ready to go places and find adventure.</p>
                            </li>
                            <li id="intro-running" class="intro-category category-product">
                                <img id="category-intro-img-running" src="<%=listIntro.get(1)%>" alt="">
                                <p class="title-category" >Running</p>
                                <p class="introduce-category">Feel inspired to fire up your passion in a running shoe made for more. No compromises, just pure motivation in stylish comfort.</p>
                            </li>
                            <li id="intro-slides" class="intro-category category-product">
                                <img id="category-intro-img-slides" src="<%=listIntro.get(2)%>" alt="">
                                <p class="title-category">Slides</p>
                                <p class="introduce-category">Made to go distance - and even furthur - this trainer range knows nothing but style and comfort.</p>
                            </li>
                            <li id="intro-sneakers" class="intro-category category-product">
                                <img id="category-intro-img-sneakers" src="<%=listIntro.get(3)%>" alt="">
                                <p class="title-category">Sneakers</p>
                                <p class="introduce-category">Do the season of boots in style. Step into comfort ready for wherever the journey is set to take you</p>
                            </li>
                            <li id="intro-skateboard" class="intro-category category-product">
                                <img id="category-intro-img-skateboard" src="<%=listIntro.get(4)%>" alt="">
                                <p class="title-category">Skateboard</p>
                                <p class="introduce-category">Whatever the season - in skateboard and in weather - enjoy the shoe made to withstand</p>
                            </li>
                            <li id="intro-football" class="intro-category category-product">
                                <img id="category-intro-img-football" src="<%=listIntro.get(5)%>" alt="">
                                <p class="title-category">Football</p>
                                <p class="introduce-category">Get in possession of your perfect match in a pair of football boots from one of the biggest names in the game.</p>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- khanh-js.js display this product -->
            </div>
        </div>

        <%}%>
    </div>
</div>
<footer>
    <div class="container">
        <hr>
        <div class="row">
            <div class="col-sm-3 footer-block">
                <h5 class="footer-title">Information</h5>
                <ul class="list-unstyled ul-wrapper">
                    <li><a href="about-us.html">About Us</a></li>
                    <li><a href="checkout.html">Delivery Information</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms &amp; Conditions</a></li>
                    <li><a href="#">Returns</a></li>
                    <li><a href="#">Site Map</a></li>
                    <li><a href="#">Wish List</a></li>
                </ul>
            </div>
            <div class="col-sm-3 footer-block">
                <h5 class="footer-title">Why Choose</h5>
                <ul class="list-unstyled ul-wrapper">
                    <li><a href="contact.html">Contact Us</a></li>
                    <li><a href="#">Product Recall</a></li>
                    <li><a href="#">Gift Vouchers</a></li>
                    <li><a href="#">Returns and Exchanges</a></li>
                    <li><a href="#">Shipping Options</a></li>
                    <li><a href="#">Help & FAQs</a></li>
                    <li><a href="#">Sale Only Today</a></li>
                </ul>
            </div>
            <div class="col-sm-3 footer-block">
                <h5 class="footer-title">My Account</h5>
                <ul class="list-unstyled ul-wrapper">
                    <li><a href="#">Sign in</a></li>
                    <li><a href="gift.html">Gift Vouchers</a></li>
                    <li><a href="affiliate.html">Affiliates</a></li>
                    <li><a href="#">View Cart</a></li>
                    <li><a href="#">Checkout</a></li>
                    <li><a href="#">Track My Order</a></li>
                    <li><a href="#">Help</a></li>
                </ul>
            </div>
            <div class="col-sm-3 footer-block">
                <div class="content_footercms_right">
                    <div class="footer-contact">
                        <h5 class="contact-title footer-title">Contact Us</h5>
                        <ul class="ul-wrapper">
                            <li><i class="fa fa-map-marker"></i><span class="location2"> Warehouse & Offices,<br>
                12345 Street name, California<br>
                USA</span></li>
                            <li><i class="fa fa-envelope"></i><span class="mail2"><a href="#">info@localhost.com</a></span></li>
                            <li><i class="fa fa-mobile"></i><span class="phone2">+91 0987-654-321<br>+91 0987-654-321</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="footer-top-cms">
                <div class="col-sm-7">
                    <div class="newslatter">
                        <form>
                            <h5>Sign up for our Newsletter</h5>
                            <div class="input-group">
                                <input type="text" class=" form-control" placeholder="Your-email@website.com">
                                <button type="submit" value="Sign up" class="btn btn-large btn-primary">Subscribe</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="footer-social">
                        <h5>Social</h5>
                        <ul>
                            <li class="facebook"><a href="#"><i class="fab fa-facebook-square"></i></a></li>
                            <li class="linkedin"><a href="#"><i class="fab fa-linkedin"></i></a></li>
                            <li class="twitter"><a href="#"><i class="fab fa-twitter-square"></i></a></li>
                            <li class="gplus"><a href="#"><i class="fab fa-google-plus-square"></i></a></li>
                            <li class="youtube"><a href="#"><i class="fab fa-youtube-square"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a id="scrollup">Scroll</a> </footer>
<div class="footer-bottom">
    <div class="container">
        <div class="copyright">Powered By &nbsp;<a class="yourstore" href="http://www.lionode.com/">lionode &copy; 2017 </a> </div>
        <div class="footer-bottom-cms">
            <div class="footer-payment">
                <ul>
                    <li class="mastero">
                        <a href="#"><img alt="" src="image/payment/mastero.jpg"></a>
                    </li>
                    <li class="visa">
                        <a href="#"><img alt="" src="image/payment/visa.jpg"></a>
                    </li>
                    <li class="currus">
                        <a href="#"><img alt="" src="image/payment/currus.jpg"></a>
                    </li>
                    <li class="discover">
                        <a href="#"><img alt="" src="image/payment/discover.jpg"></a>
                    </li>
                    <li class="bank">
                        <a href="#"><img alt="" src="image/payment/bank.jpg"></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!--Begin: login-registe-->
<div class="login-modal js-modal">
    <!-- Begin: modal login -->
    <div class="modal-container js-modal-container">


        <header class="modal-header">
            Tài Khoản Của Bạn!
        </header>

        <div class="modal-close js-modal-close">
            <i class="ti-close icon-close"></i>
        </div>

        <div class="modal-body">
            <div class="modal-body-login">
                <div class="modal-login sub col-half">Đăng Nhập</div>
                <div class="modal-rgister js-register-modal sub col-half">Đăng Ký</div>
            </div>

            <div class="sub-login">
                <p class="login-another">_____________ Đăng Nhập Bằng Cách Khác ____________</p>
            </div>

            <div class="modal-login-another">
                <img src="./image/icon_fb.png" alt="FaceBook" class="icon-login-another">
                <img src="./image/icon_gg.png" alt="Google" class="icon-login-another">
                <img src="./image/icon_apple.png" alt="Apple" class="icon-login-another">
            </div>

            <div class="modal-input-section">
                <input type="email" placeholder="Địa chỉ email..." class="email">
                <input type="password" placeholder="Nhập mật khẩu..." class="email password">
                <a href="" class="forgot-password">Quên mật khẩu của bạn?</a>
            </div>

            <div class="modal-bnt-login">
                <a href="" class="bnt-login">Đăng Nhập</a>
            </div>

            <div class="modal-title">
                <p class="title-content">Bây giờ bạn cần một tài khoản để gửi / xem các yêu cầu dịch vụ khách hàng, xem các đăng ký các sản phẩm của bạn, thanh toán hoặc sửa đổi thông tin cá nhân của bạn. Thật nhanh chóng và dễ dàng để 'Đăng ký'. Vui lòng đảm bảo địa chỉ
                    email của bạn là địa chỉ bạn đã cung cấp tại thời điểm đặt hàng, điều này sẽ cho phép bạn truy cập tất cả các dịch vụ bạn cần. </p>
            </div>


        </div>
    </div>
    <!-- End: modal login -->
</div>
<!--Begin: modal register--->
<div class="modal-register js-modal-register">
    <div class="modal-container-register js-modal-container-register">

        <header class="modal-header">
            Tài Khoản Của Bạn!
        </header>

        <div class="modal-close-register js-modal-close-register">
            <i class="ti-close icon-close-register"></i>
        </div>

        <div class="modal-body2">
            <div class="modal-body-register">
                <div class="modal-login sub js-login-modal col-half">Đăng Nhập</div>
                <div class="modal-sub-register sub col-half">Đăng Ký</div>
            </div>

            <div class="sub-login">
                <p class="login-another">______________ Đăng Ký Bằng Cách Khác _____________</p>
            </div>

            <div class="modal-register-another">
                <img src="./image/icon_fb.png" alt="FaceBook" class="icon-login-another">
                <img src="./image/icon_gg.png" alt="Google" class="icon-login-another">
                <img src="./image/icon_apple.png" alt="Apple" class="icon-login-another">
            </div>

            <div class="modal-input-section">
                <input type="email" placeholder="Địa chỉ email..." class="email">
                <input type="password" placeholder="Nhập mật khẩu..." class="email password">
                <input type="password" placeholder="Xác nhận mật khẩu..." class="email password">
                <input type="checkbox" name="" class="modal-checkbox">
                <p class="checkbox">
                    Vui lòng gửi email cho tôi với các ưu đãi mới nhất</p>
            </div>

            <div class="modal-bnt-register">
                <a href="" class="bnt-login">Đăng Ký</a>
            </div>

            <div class="modal-title">
                <p class="title-content">Vui lòng đảm bảo địa chỉ email của bạn là địa chỉ bạn đã cung cấp tại thời điểm đăng ký, điều này sẽ cho phép bạn truy cập tất cả các dịch vụ bạn cần.</p>
            </div>
        </div>
    </div>
    <!-- End: modal register -->
</div>
<!-- End: login register -->
<script src="./javascript/hung-js.js"></script>
</body>

</html>
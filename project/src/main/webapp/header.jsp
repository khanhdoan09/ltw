<%--
  Created by IntelliJ IDEA.
  User: khanh
  Date: 12/6/2021
  Time: 5:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Home | Dragon Sport</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
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
    <link rel="stylesheet" href="./image/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="css/dat-css.css">
    <link rel="stylesheet" href="css/khanh-css.css">
    <link rel="stylesheet" href="./css/hung-css.css">
    <script src="javascript/khanh-js.js" type="text/javascript"></script>
    <link rel="shortcut icon" href="image/logo.png" />



</head>
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
                                <a href="index.html"><img src="image/logo.png" title="E-Commerce" alt="E-Commerce"
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
<%--                            <span>X-Ray 2</span>--%>
<%--                            <span>Nike Air Force 2</span>--%>
<%--                            <span>Under Armour darkside</span>--%>
<%--                            <span>X9000L4 Shoes Mens</span>--%>
<%--                            <span>Adidas dragon sport</span>--%>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 col-xs-12 header-right header-nav-right">

                    <div id="cart" class="btn-group btn-block" style="margin: 0; padding: 0;">
                        <button type="button"
                                class="btn btn-inverse btn-block btn-lg dropdown-toggle cart-dropdown-button cart-nav">
                            <span
                                    class="color-header"><span class="cart-title color-header" style="margin-left: 10px">Giỏ hàng - </span>254.000 Đ</span>
                            <span class="value-header-product" style="margin: 0 10px">1</span>
                            <i class="fas fa-shopping-cart cart-icon-nav"></i>
                        </button>


                        <ul class="dropdown-menu pull-right cart-dropdown-menu">
                            <li>
                                <table class="table table-striped">
                                    <tbody>
                                    <tr>
                                        <td class="text-center">
                                            <a href="#"><img src="image/product/product-01.jpg" width="100px"
                                                             height="100px"></a>
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
                                            <td class="text-right"><strong>Tổng</strong></td>
                                            <td class="text-right">210.000Đ</td>
                                        </tr>
                                        <tr>
                                            <td class="text-right"><strong>Thuế (-2.00)</strong></td>
                                            <td class="text-right">2%</td>
                                        </tr>
                                        <tr>
                                            <td class="text-right"><strong>VAT (20%)</strong></td>
                                            <td class="text-right">4%</td>
                                        </tr>
                                        <tr>
                                            <td class="text-right"><strong>Tạm tính</strong></td>
                                            <td class="text-right">254.000Đ</td>
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

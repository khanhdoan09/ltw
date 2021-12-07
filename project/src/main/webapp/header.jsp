<%--
  Created by IntelliJ IDEA.
  User: khanh
  Date: 12/6/2021
  Time: 5:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <div class="header-top">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 contain-header">
                    <div class="contain-nav-info">
                        <div id="top-links" class="nav pull-right">
                            <ul class="list-inline">
                                <li class="account"><a href="#" class="notify"><i class="fas fa-bell" style="margin-right: 10px"></i><span>Thông báo</span><span style="margin-right: 10px">(0)</span></a></li>
                                <li class="account"><a href="#" id="wishlist-total" title="Wish List (0)"><i class="fa fa-heart"></i><span>Danh sách yêu thích</span><span style="margin-right: 10px">(0)</span></a></li>
                                <li class="dropdown">
                                    <a href="#" title="My Account" class="dropdown-toggle" data-toggle="dropdown"> <i class="fa fa-user"></i><span>Tài khoản</span> <span class="caret"></span></a>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li><a href="#" class="js-login">Đăng ký</a></li>
                                        <li><a href="#" class="js_register">Đăng nhập</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="text-center contain-search">
                        <div class="contain-search-product-popular">
                            <div class="search-product">
                                <input class="input-text-search-top" placeholder="Tìm kiếm" type="text">
                                <button class="search-product-top"><i class="fa fa-search"></i></button>
                            </div>
                            <div class="contain-search-popular">
                                <span>X-Ray 2</span>
                                <span>Barcelona Home Kit 2021 2022</span>
                                <span>Chelsea Home Kit 2021 2022</span>
                                <span>X9000L4 Shoes Mens</span>
                                <span>PSG Home 21/22 Shirt - Messi 30 printing</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="header-inner">
            <div class="col-sm-4 col-xs-6 header-left">
                <div class="shipping">
                    <div class="shipping-img"></div>
                    <div class="shipping-text">(+91) 000-1233<br>
                        <span class="shipping-detail">24/7 Online Support</span></div>
                </div>
            </div>
            <div class="col-sm-4 col-xs-12 header-middle">
                <div class="header-middle-top">
                    <div id="logo">
                        <a href="index.html"><img src="image/logo.png" title="E-Commerce" alt="E-Commerce" class="img-responsive" /></a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-xs-12 header-right">
                <div id="cart" class="btn-group btn-block">
                    <button type="button" class="btn btn-inverse btn-block btn-lg dropdown-toggle cart-dropdown-button"> <span id="cart-total"><span class="cart-title">Shopping Cart</span><br>
              0 item(s) - $0.00</span> </button>
                    <ul class="dropdown-menu pull-right cart-dropdown-menu">
                        <li>
                            <table class="table table-striped">
                                <tbody>
                                <tr>
                                    <td class="text-center">
                                        <a href="#"><img class="img-thumbnail" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" src="image/product/7product50x59.jpg"></a>
                                    </td>
                                    <td class="text-left"><a href="#">lorem ippsum dolor dummy</a></td>
                                    <td class="text-right">x 1</td>
                                    <td class="text-right">$254.00</td>
                                    <td class="text-center"><button class="btn btn-danger btn-xs" title="Remove" type="button"><i class="fa fa-times"></i></button></td>
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
                                <p class="text-right"> <span class="btn-viewcart"><a href="cart.html"><strong><i class="fa fa-shopping-cart"></i> View Cart</strong></a></span> <span class="btn-checkout"><a href="checkout.html"><strong><i class="fa fa-share"></i> Checkout</strong></a></span>                                        </p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <nav id="menu-navigation" class="navbar">
            <!--function menuNavigation() in khanh-js.js-->
            <button type="button" class="btn btn-navbar navbar-toggle"><i class="fa fa-bars"></i></button>
        </nav>
    </div>
</header>


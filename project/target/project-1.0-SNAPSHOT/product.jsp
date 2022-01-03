<%@ page import="model.DaoProduct" %>
<%@ page import="model.Product" %>
<%@ page import="model.DaoLinkImage" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: khanh
  Date: 12/10/2021
  Time: 8:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html dir="ltr" lang="en">

<head>
    <title>Product | Dragon Sport</title>
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
    <link rel="stylesheet" href="./css/hung-css.css">
    <script src="javascript/khanh-js.js"></script>



</head>

<body class="product col-2 left-col">
<%
    Map<String, ArrayList<String>> map = DaoLinkImage.getInstance().getAll();
    Object obj = request.getAttribute("idProduct");
    Product p = null;
    if (obj != null) {
        String id = obj.toString();
        p = DaoProduct.getInstance().getProductById(id);
    }
%>

<header>
    <div class="contain-header-inner">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 contain-header">
                    <div class="contain-nav-info">
                        <div id="top-links" class="nav pull-left">
                            <ul class="list-inline">
                                <li class="account"><a href="/admin/pixelwibes.com/template/ebazar/html/dist/index.html" class="notify"><i
                                        class="fas fa-bell color-header" style="margin-right: 10px"></i><sp
                                        style="margin: 0 5px;" class="color-header">Thông
                                    báo</sp><span style="margin-right: 10px;"
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
                                        <li><a href="#" class="js-login">Đăng Nhập</a></li>
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
                        <div class="search-product">
                            <input class="input-text-search-top" placeholder="Tìm kiếm" type="text">
                            <button class="search-product-top"><i class="fa fa-search"></i></button>
                        </div>
                        <div class="contain-search-popular">
                            <span>X-Ray 2</span>
                            <span>Nike Air Force 2</span>
                            <span>Under Armour darkside</span>
                            <span>X9000L4 Shoes Mens</span>
                            <span>Adidas dragon sport</span>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 col-xs-12 header-right header-nav-right">

                    <div id="cart" class="btn-group btn-block" style="margin: 0; padding: 0;">
                        <button type="button"
                                class="btn btn-inverse btn-block btn-lg dropdown-toggle cart-dropdown-button cart-nav">
                            <span
                                    id="cart-total" class="color-header"><span class="cart-title color-header">Giỏ hàng - </span>254.000 Đ</span>
                            <span class="value-header-product" style="margin-bottom: 10px">1</span>
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
<div class="container">

    <div class="row" style="display: flex; flex-wrap: wrap;">

        <div id="content" class="col-sm-9 " style="flex: 3; padding: 40px;">
            <div class="row bg-white bd-rd" style="padding-top: 20px;width:100%; max-width: 840px;">
                <div class="col-sm-6">
                    <div class="thumbnails">
                        <div>
                            <!-- anh chinh -->
                            <a class="thumbnail" href="" title="lorem ippsum dolor dummy">
                                <img src="data/imgAll/<%=map.get(p.getId()).get(0)%>.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" id="main-img"/>
                            </a>
                        </div>
                        <div id="product-thumbnail" class="owl-carousel" style="width: 100%;">
                            <div class="item mg-l">
                                <div class="image-additional">
                                    <div class="thumbnail main imag1">
                                        <img src="data/imgAll/<%=map.get(p.getId()).get(0)%>.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" id="zero" />
                                    </div>
                                </div>
                            </div>
                            <div class="item mg-l">
                                <div class="image-additional">
                                    <div class="thumbnail imag2 ">
                                        <img src="data/imgAll/<%=map.get(p.getId()).get(1)%>.jpg"  title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy"  id="one"/>
                                    </div>
                                </div>
                            </div>
                            <div class="item mg-l">
                                <div class="image-additional">
                                    <div class="thumbnail imag3 "> <img src="data/imgAll/<%=map.get(p.getId()).get(2)%>.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" id="two"/>
                                    </div>
                                </div>
                            </div>
                            <div class="item mg-l">
                                <div class="image-additional">
                                    <div class="thumbnail imag4 "> <img src="data/imgAll/<%=map.get(p.getId()).get(3)%>.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" id="three"/></div>
                                </div>
                            </div>
                            <div class="item mg-l">
                                <div class="image-additional">
                                    <div class="thumbnail imag5 "> <img src="data/imgAll/<%=map.get(p.getId()).get(4)%>.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" id="four"/></div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-sm-6" style="display: flex; flex-direction: column">
                    <h1 class="productpage-title"><%=p.getName()%></h1>
                    <div class="rating product">

                        <%if (p.getStarRate()== 3) {%>
                        <span class="star star-size" style="color: rgb(253, 234, 0); font-size: 22px">&#128970;</span>
                        <span class="star star-size" style="color: rgb(253, 234, 0); font-size: 22px">&#128970;</span>
                        <span class="star star-size" style="color: rgb(253, 234, 0); font-size: 22px">&#128970;</span>
                        <span class="star star-size" style="color: rgb(211,211,211); font-size: 22px">&#128970;</span>
                        <span class="star star-size" style="color: rgb(211,211,211); font-size: 22px">&#128970;</span>
                        <%}else if (p.getStarRate()== 4){ %>
                        <span class="star star-size" style="color: rgb(253, 234, 0); font-size: 22px">&#128970;</span>
                        <span class="star star-size" style="color: rgb(253, 234, 0); font-size: 22px">&#128970;</span>
                        <span class="star star-size" style="color: rgb(253, 234, 0); font-size: 22px">&#128970;</span>
                        <span class="star star-size" style="color: rgb(253, 234, 0); font-size: 22px">&#128970;</span>
                        <span class="star star-size" style="color: rgb(211,211,211); font-size: 22px">&#128970;</span>
                        <%}else if (p.getStarRate()== 5){ %>
                        <span class="star star-size" style="color: rgb(253, 234, 0); font-size: 22px">&#128970;</span>
                        <span class="star star-size" style="color: rgb(253, 234, 0); font-size: 22px">&#128970;</span>
                        <span class="star star-size" style="color: rgb(253, 234, 0); font-size: 22px">&#128970;</span>
                        <span class="star star-size" style="color: rgb(253, 234, 0); font-size: 22px">&#128970;</span>
                        <span class="star star-size" style="color: rgb(253, 234, 0); font-size: 22px">&#128970;</span>
                        <%} %>
                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i
                                class="fa fa-star-o fa-stack-1x"></i></span> <span class="fa fa-stack"><i
                            class="fa fa-star-o fa-stack-1x"></i></span> <span class="fa fa-stack"><i
                            class="fa fa-star-o fa-stack-1x"></i></span> <span class="review-count"> <a href="#"
                                                                                                        onClick="$('a[href=\'#tab-review\']').trigger('click'); return false;">1 reviews</a>
                                / <a href="#"
                                     onClick="$('a[href=\'#tab-review\']').trigger('click'); return false;">Write a
                                    review</a></span>
                        <hr>
                        <!-- AddThis Button BEGIN -->
                        <div class="addthis_toolbox addthis_default_style">
                            <a class="addthis_button_facebook_like"></a>
                            <a class="addthis_button_tweet"></a>
                            <a class="addthis_button_pinterest_pinit"></a>
                            <a class="addthis_counter addthis_pill_style"></a>
                        </div>
                        <!-- AddThis Button END -->
                    </div>
                    <div class="price-modal">
                        <ul class="price-product">
                            <li>
                                <h6 class="price-box price-sale" style="float: left;  text-decoration: line-through;
    padding: 0 20px;
    color: rgb(146, 145, 145);
    margin: 18px 0;"><%=p.getPrice()%>VNĐ</h6>                            </li>
                            <li><h1 class="price-box price" style="float: left;color: #1a94ff;
font-size: 25px;
margin: 10px 0;"><%=p.getPrice()-(p.getPrice()*p.getSaleRate()/100)%>VNĐ</h1></li>
                            <li><h6 class="price-box sale" style=" float: left;background-color: #1a94ff;
    color: white;
    padding: 4px;
    margin: 12px 10px;">20% GIẢM</h6></li>
                        </ul>
                    </div>
                    <!-- <ul class="">
                    <li>
                        <h2 class="productpage-price">210.000VNĐ</h2>
                    </li>
                    <li><span class="productinfo-tax">Ex Tax: $100.00</span></li>
                </ul> -->
                    <hr>
                    <ul class="list-unstyled product_info">
                        <li>
                            <div class="box_code-sub">
                                <label class="title-code">Mã giảm giá</label>
                            </div>

                            <div class="box_code">
                                <div class="tritagnle">
                                </div>
                                <div class="boxed-conten">
                                    <p class="conten_center">10%</p>
                                </div>
                            </div>

                            <div class="box_code">
                                <div class="tritagnle">
                                </div>
                                <div class="boxed-conten">
                                    <p class="conten_center">5%</p>
                                </div>
                            </div>
                            <div class="box_code">
                                <div class="tritagnle">
                                </div>
                                <div class="boxed-conten">
                                    <p class="conten_center">7%</p>
                                </div>
                            </div>
                        </li>


                        <li class="size-shoes" style="margin-top: 50px;">
                            <label>Màu sắc</label>
                            <div class="num-size">
                                <button class="js-color-black color-black">Đen</button>
                                <button class="js-colorl-pink color-pink">Hồng</button>
                                <button class="js-color-blue color-blue">Xanh</button>
                            </div>
                        </li>
                        <li class="size-shoes">
                            <label>Size</label>
                            <div class="num-size">
                                <button>36</button>
                                <button>37</button>
                                <button>38</button>
                                <button>39</button>
                            </div>
                        </li>
                        <li id="values">
                            <div class="value-box"><label>Số lượng:</label></div>
                            <div class="value-box set-value">
                                <input class="value" type="button" onclick="reduceValue()" value="--" />
                                <input type="text" id="number" value="1" />
                                <input class="value" type="button" onclick="incrementValue(<%=p.getTotalValue()-p.getSoleValue()%>)" value="+" />
                            </div>
                            <h6 class="products-available value-box"><%=p.getTotalValue()-p.getSoleValue()%> Sản phẩm có sẵn</h6>
                        </li>
                        <li class="add-and-buy">
                            <div class="add-product">
                                <!-- <i class="fas fas-shopping-cart"></i> -->
                                <a href="" class="add">Thêm Vào Giỏ Hàng</a>
                            </div>
                            <div class="buy-product">
                                <a href="./checkout.html" class="buy">Mua Ngay</a>
                            </div>
                        </li>
                    </ul>
                    <div class="through">
                        <hr>
                    </div>

                </div>
            </div>
            <div class="productinfo-tab bg-white bd-rd pd-5" style="width: 100%; max-width: 830px;">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab-description" data-toggle="tab">Mô tả</a></li>
                    <li><a href="#tab-review" data-toggle="tab">Bình luận (1)</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab-description">
                        <div class="cpt_product_description">
                            <div>
                                <p><strong>Giày tiêu chuẩn
                                </strong></p>
                                <p><%=p.getDescription()%></p>

                            </div>
                        </div>
                        <!-- cpt_container_end -->
                    </div>
                    <div class="tab-pane" id="tab-review">
                        <form class="form-horizontal">
                            <div id="review"></div>

                            <div class="form-group required">
                                <div class="col-sm-12">
                                    <label class="control-label" for="input-review">Bình luận của bạn</label>
                                    <textarea name="text" rows="5" id="input-review"
                                              class="form-control"></textarea>

                                </div>
                            </div>
                            <div class="form-group required">
                                <div class="col-sm-12" style="margin-left: 5px;">
                                    Bad
                                    <input type="radio" name="rating" value="1" />
                                    <input type="radio" name="rating" value="2" />
                                    <input type="radio" name="rating" value="3" />
                                    <input type="radio" name="rating" value="4" />
                                    <input type="radio" name="rating" value="5" />
                                    Good
                                </div>
                            </div>
                            <div class="buttons clearfix">
                                <div class="pull-right">
                                    <button type="button" id="button-review" data-loading-text="Loading..."
                                            class="btn btn-primary">Continue
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>


            <div class="container" style="margin-bottom: 20px;display: flex; flex-wrap: wrap;justify-content: space-around; padding-right: 20px; width: 100%;">
                <div class="row general-contain" style="width:100%;margin-top: 10px;margin-bottom: 10px;">
                    <div id="contents" class="" style="width: 100%;">
                        <div class="customtab">
                            <div id="tabs" class="customtab-wrapper">
                                <ul class='customtab-inner'>
                                    <li class='tab'><a href="#tab-latest">Những sản phẩm vừa xem</a></li>
                                </ul>
                            </div>
                            <%
                                Object objWatched = session.getAttribute("listProductWatched");
                                if (objWatched != null) {
                                    ArrayList<String> listProductWatched = (ArrayList<String>) objWatched;
                            %>
                            <div id="tab-latest" class="tab-content">
                                <div class="box">
                                    <div id="latest-slidertab" class="row owl-carousel product-slider">
                                        <%for (String str : listProductWatched) {
                                            Product productWatched = DaoProduct.getInstance().getProductById(str);
                                        %>
                                        <div class="item">
                                            <div class="product-thumb transition">
                                                <div class="image product-imageblock">
                                                    <a href="product.html"> <img src="data/imgAll/<%=map.get(productWatched.getId()).get(0)%>.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                                                    <div class="button-group">
                                                        <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                                        <button type="button" class="addtocart-btn">Mua Ngay</button>
                                                        <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                                    </div>
                                                </div>
                                                <div class="caption product-detail">
                                                    <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy"><%=productWatched.getName()%></a></h4>
                                                    <p class="price product-price"> <span class="price-new"><%=productWatched.getPrice()-(productWatched.getPrice()*productWatched.getSaleRate()/100)%></span> <span class="price-old"><%=productWatched.getPrice()%></span> <span class="price-tax">Ex Tax: 210.00$</span> </p>
                                                </div>
                                                <div class="button-group">
                                                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                                    <button type="button" class="addtocart-btn">Mua Ngay</button>
                                                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                            <%}%>

                        </div>

                    </div>
                </div>

            </div>
        </div>

        <div id="column-left" class="col-sm-3 column-left" style="flex: 1; padding: 0px; margin-top: 10px;">
            <div class="column-block ">
                <div class="column-block">
                    <div class="sales-policy-modal  br-rd" style=" border-radius: 20px; margin: 30px 0;">
                        <div class="sales-policy">
                            <img class="icon-free-ship" src="./image/icon/icon_4.png" alt="">
                            <p class="title-free-ship">Sản phẩm được miễn phí giao hàng</p>
                        </div>
                        <div class="sales-policy-section">
                            <h1 class="title-policy">
                                Chính sách bán hàng
                            </h1>
                        </div>
                        <div class="sales-policy-content">
                            <img src="./image/icon/icon_1.png" alt="" class="icon-policy">
                            <p class="title-policy-content">Miễn phí giao hàng cho đơn hàng từ 400K</p>
                        </div>
                        <div class="sales-policy-content">
                            <img src="./image/icon/icon_2.png" alt="" class="icon-policy">
                            <p class="title-policy-content">Cam kết hàng chính hãng 100%</p>
                        </div>
                        <div class="sales-policy-content">
                            <img src="./image/icon/icon_3.png" alt="" class="icon-policy">
                            <p class="title-policy-content">Đổi trả trong vòng 10 ngày</p>
                        </div>
                        <div class="sales-policy-content">
                            <img src="./image/icon/icon_5.png" alt="" class="icon-policy">
                            <p class="title-policy-content">Bảo hành theo chính sách 4 tháng</p>
                        </div>
                        <div class="see-more-policy">
                            <a href="#" class="see-more">Xem chi tiết</a>
                        </div>
                    </div>

                </div>


            </div>

            <div style="display: flex; justify-content: center; width: 100%; margin-top: 30px;">
                <div>
                    <div class="mainbanner bg-white bd-rd" style="width: 280px;height: fit-content;  margin-top: 10px;">
                        <h1 class="pd-5" style="text-align: center;">Sản Phẩm Nổi Bật</h1>
                        <hr style="width: 180px;">

                        <div class="mainbanner">
                            <div id="main-banner" class="owl-carousel home-slider"
                                 style="display: flex; justify-content: space-between;">
                                <%
                                    List<Product> listHotProduct = (List<Product>) request.getAttribute("listHotProduct");
                                for (Product product : listHotProduct) {%>
                                <div class="itm bd-rd bg-white">
                                    <div class="item" style="display: grid; place-items: center;">
                                        <div class="product-thumb transition" style="width: 100%;">
                                            <div class="image product-imageblock">
                                                <a href="product.html"> <img src="data/imgAll/<%=map.get(product.getId()).get(0)%>.jpg"
                                                                             alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy"
                                                                             class="img-responsive" />

                                                </a>

                                            </div>
                                            <div class="caption product-detail-hot" style="padding: 10px;">
                                                <h4 class="product-name"><a href="product.html"
                                                                            title="lorem ippsum dolor dummy"><%=product.getName()%></a></h4>
                                                <p class="price product-price"> <span class="price-new"><%=product.getPrice()-product.getPrice()*product.getSaleRate()/100%></span> <span
                                                        class="price-old"><%=product.getPrice()%></span> <span class="price-tax">Ex Tax:
                                                210.00$</span> </p>
                                            </div>
                                            <div class="button-group pd-bt-5 button-hot-product">
                                                <button type="button" class="wishlist" data-toggle="tooltip"
                                                        title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                                <button type="button" class="addtocart-btn">Mua Ngay</button>
                                                <button type="button" class="compare" data-toggle="tooltip"
                                                        title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                            </div>
                        </div>


                    </div>
                </div>

            </div>


            <div style="width: 100%; text-align: center;">
                <img src="image/banners/download-app.jpg" alt=""
                     style="width: 270px; border-radius: 20px; cursor: pointer;margin-top: 10px;">
            </div>


        </div>
    </div>
</div>





<footer style="margin: 10px 0;">
    <div class="container">
        <hr>
        <div class="row">
            <div class="col-sm-3 footer-block">
                <h5 class="footer-title">Thông tin</h5>
                <ul class="list-unstyled ul-wrapper">
                    <li><a href="about-us.html">Về chúng tôi</a></li>
                    <li><a href="checkout.html">Thông tin giao hàng</a></li>
                    <li><a href="#">Chính sách</a></li>
                    <li><a href="#">Luật &amp; Điều kiện</a></li>
                    <li><a href="#">Bản đồ</a></li>
                    <li><a href="#">Danh sách yêu thích</a></li>
                </ul>
            </div>
            <div class="col-sm-3 footer-block">
                <h5 class="footer-title">Why Choose</h5>
                <ul class="list-unstyled ul-wrapper">
                    <li><a href="contact.html">Liên lạc</a></li>
                    <li><a href="#">Voucher quà tặng</a></li>
                    <li><a href="#">Trả hàng</a></li>
                    <li><a href="#">Vận chuyển</a></li>
                    <li><a href="#">Giúp đỡ & FAQs</a></li>
                    <li><a href="#">Sale trong hôm nay</a></li>
                </ul>
            </div>
            <div class="col-sm-3 footer-block">
                <h5 class="footer-title">Tài khoản của tôi</h5>
                <ul class="list-unstyled ul-wrapper">
                    <li><a href="#">Đăng nhập</a></li>
                    <li><a href="#">Voucher quà tặng</a></li>
                    <li><a href="#">Chi nhánh</a></li>
                    <li><a href="#">Giỏ hàng</a></li>
                    <li><a href="#">Thanh toán</a></li>
                    <li><a href="#">Theo dõi hóa đơn</a></li>
                    <li><a href="#">Giúp đỡ</a></li>
                </ul>
            </div>
            <div class="col-sm-3 footer-block">
                <div class="content_footercms_right">
                    <div class="footer-contact">
                        <h5 class="contact-title footer-title">Liên lạc</h5>
                        <ul class="ul-wrapper">
                            <li> 29/1, đường số 4, KP.3, P. Bình Khánh, Q.2, TPHCM, Việt Nam</li>
                            <li><span class="mail2"><a
                                    href="#">info@localhost.com</a></span></li>
                            <li><i class="fa fa-mobile"></i><span class="phone2">+91 0987-654-321<br>+91
                                        0987-654-321</span></li>
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
                            <h5>Đăng kí để nhận thư</h5>
                            <div class="input-group">
                                <input type="text" class=" form-control" placeholder="email@website.com">
                                <button type="submit" value="Sign up"
                                        class="btn btn-large btn-primary">Đăng kí</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="footer-social">
                        <h5>Mạng xã hội</h5>
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
    <a id="scrollup">Scroll</a>
</footer>

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
                <p class="title-content">Bây giờ bạn cần một tài khoản để gửi / xem các yêu cầu dịch vụ khách hàng,
                    xem các đăng ký các sản phẩm của bạn, thanh toán hoặc sửa đổi thông tin cá nhân của bạn. Thật
                    nhanh chóng và dễ dàng để 'Đăng ký'. Vui lòng đảm bảo địa chỉ
                    email của bạn là địa chỉ bạn đã cung cấp tại thời điểm đặt hàng, điều này sẽ cho phép bạn truy
                    cập tất cả các dịch vụ bạn cần. </p>
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
                <p class="title-content">Vui lòng đảm bảo địa chỉ email của bạn là địa chỉ bạn đã cung cấp tại thời
                    điểm đăng ký, điều này sẽ cho phép bạn truy cập tất cả các dịch vụ bạn cần.</p>
            </div>
        </div>
    </div>
    <!-- End: modal register -->
</div>
</div>
<!-- End: login register -->

<!-- Begin: modal message -->
<div class="icon-message">
    <img class="icon-mess js-open-mess" src="./image/icon/icon-mess.ico" alt="">
</div>
<div class="modal-message message">
    <div class="mess-section">
        <div class="mess-header">
            <img class="icon-logo " src="./image/logo.png" alt="">
            <img class="icon-close js-close-mess" src="./image/icon/icon-close.png" alt="">
        </div>
        <div class="mess-content">
            <div class="mess-content-section">
                <p class="mess-title">Hiện tại, chúng tôi không trực tuyến.
                    Quý khách vui lòng để lại tin nhắn,
                    chúng tôi sẽ sớm liên hệ trong buổi
                    làm việc tiếp theo. Trân trọng cảm ơn.</p>
                <p class="name">Họ & Tên *</p>
                <input type="text">
                <p class="name">Địa chỉ Email *</p>
                <input type="email">
                <p class="name">Điện thoại *</p>
                <input type="phone">
                <p class="mess">Tin nhắn *</p>
                <textarea class="text-send" type="text" rows="4" spellcheck="false"> </textarea>
                <button class="send">Để lại tin nhắn</button>
            </div>
        </div>
    </div>
</div>
<!-- End: modal message -->
<script src="./javascript/hung-js.js"></script>


<script>
    function setIma(main, child) {
        var path = document.getElementById(child).getAttribute("src");
        document.getElementById(main).setAttribute("src", path);
        console.log(path);
    }

    const ima = document.querySelector(".imag2")
    console.log(ima);
    ima.addEventListener("click", function () {
        var path = document.getElementById("one").getAttribute("src");
        document.getElementById("main-img").setAttribute("src", path);

    })

    const ima2 = document.querySelector(".imag1")
    console.log(ima2);
    ima2.addEventListener("click", function () {
        var path = document.getElementById("zero").getAttribute("src");
        document.getElementById("main-img").setAttribute("src", path);

    })
    const ima3 = document.querySelector(".imag3")
    console.log(ima3);
    ima3.addEventListener("click", function () {
        var path = document.getElementById("two").getAttribute("src");
        document.getElementById("main-img").setAttribute("src", path);

    })

    const ima4 = document.querySelector(".imag4")
    console.log(ima4);
    ima4.addEventListener("click", function () {
        var path = document.getElementById("three").getAttribute("src");
        document.getElementById("main-img").setAttribute("src", path);

    })

    const ima5 = document.querySelector(".imag5")
    console.log(ima5);
    ima5.addEventListener("click", function () {
        var path = document.getElementById("four").getAttribute("src");
        document.getElementById("main-img").setAttribute("src", path);

    })

    const ima6 = document.querySelector(".imag6")
    console.log(ima6);
    ima6.addEventListener("click", function () {
        var path = document.getElementById("five").getAttribute("src");
        document.getElementById("main-img").setAttribute("src", path);

    })

    const ima7 = document.querySelector(".imag7")
    console.log(ima7);
    ima7.addEventListener("click", function () {
        var path = document.getElementById("six").getAttribute("src");
        document.getElementById("main-img").setAttribute("src", path);

    })

</script>

</body>


</html>
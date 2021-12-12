<%@ page import="khanhJava.DaoProduct" %>
<%@ page import="khanhJava.Product" %><%--
  Created by IntelliJ IDEA.
  User: khanh
  Date: 12/10/2021
  Time: 8:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Time Watch</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="e-commerce site well design with responsive view."/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link href="css/stylesheet.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <link href="owl-carousel/owl.carousel.css" type="text/css" rel="stylesheet" media="screen"/>
    <link href="owl-carousel/owl.transitions.css" type="text/css" rel="stylesheet" media="screen"/>
    <link rel="stylesheet" href="font-awesome/fonts/fontawesome-free-6.0.0-beta3-web/css/all.css">
    <script src="javascript/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="javascript/jstree.min.js" type="text/javascript"></script>
    <script src="javascript/template.js" type="text/javascript"></script>
    <script src="javascript/common.js" type="text/javascript"></script>
    <script src="javascript/global.js" type="text/javascript"></script>
    <script src="owl-carousel/owl.carousel.min.js" type="text/javascript"></script>

    <link rel="stylesheet" href="css/khanh-css.css" type="text/css">
    <link rel="stylesheet" href="./css/hung-css.css">
    <script rel="script" src="javascript/khanh-js.js"></script></head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
    <ul class="breadcrumb">
        <li><a href="index.html"><i class="fa fa-home"></i></a></li>
        <li>
            <i class="fas fa-angle-double-right"></i>
            <a href="category.html">Thể loại</a></li>
        <li>
            <i class="fas fa-angle-double-right"></i>
            <a href="#">Giày</a></li>
    </ul>
    <div class="row">
        <div id="column-left" class="col-sm-3 hidden-xs column-left">
            <div class="column-block">
                <div class="column-block">
                    <div class="sales-policy-modal">
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
                <h3 class="productblock-title">Giày NIKE hot nhất</h3>
                <div class="row bestseller-grid product-grid">
                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
                        <div class="product-thumb transition">
                            <div class="image product-imageblock">
                                <a href="#"> <img src="image/hot-product/hot-product-03.jpg" class="img-responsive hot-product" /> </a>
                            </div>
                            <div class="caption product-detail">
                                <h4 class="product-name">
                                    <a style="display: block"><strong>Nike</strong></a>
                                    <a href="product.html">Air Max SC Men's Shoe</a></h4>
                                <p class="price product-price"><span class="price-new">$97.00</span></p>
                                <div class="star-hot-product">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
                        <div class="product-thumb transition">
                            <div class="image product-imageblock">
                                <a href="#"> <img src="image/hot-product/hot-product-01.webp" class="img-responsive hot-product" /> </a>
                            </div>
                            <div class="caption product-detail">
                                <h4 class="product-name">
                                    <a style="display: block"><strong>Nike</strong></a>
                                    <a href="product.html">Pegasus Trail 3 Running Shoe Men</a></h4>
                                <p class="price product-price"><span class="price-new">$95.00</span><span class="price-tax">Ex Tax: $210.00</span></p>
                                <div class="star-hot-product">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
                        <div class="product-thumb transition">
                            <div class="image product-imageblock">
                                <a href="#"> <img src="image/hot-product/hot-product-01.webp" class="img-responsive hot-product" /> </a>
                            </div>
                            <div class="caption product-detail">
                                <h4 class="product-name">
                                    <a style="display: block"><strong>Nike</strong></a>
                                    <a href="product.html">Pegasus Trail 3 Running Shoe Men</a></h4>
                                <p class="price product-price"><span class="price-new">$95.00</span><span class="price-tax">Ex Tax: $210.00</span></p>
                                <div class="star-hot-product">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
                        <div class="product-thumb transition">
                            <div class="image product-imageblock">
                                <a href="#"> <img src="image/hot-product/hot-product-01.webp" class="img-responsive hot-product" /> </a>
                            </div>
                            <div class="caption product-detail">
                                <h4 class="product-name">
                                    <a style="display: block"><strong>Nike</strong></a>
                                    <a href="product.html">Pegasus Trail 3 Running Shoe Men</a></h4>
                                <p class="price product-price"><span class="price-new">$95.00</span><span class="price-tax">Ex Tax: $210.00</span></p>
                                <div class="star-hot-product">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
                        <div class="product-thumb transition">
                            <div class="image product-imageblock">
                                <a href="#"> <img src="image/hot-product/hot-product-02.webp" class="img-responsive hot-product" /> </a>
                            </div>
                            <div class="caption product-detail">
                                <h4 class="product-name">
                                    <a style="display: block"><strong>Nike</strong></a>
                                    <a href="product.html">Juniper Trail Men's Trail Running Shoe</a></h4>
                                <p class="price product-price"><span class="price-new">$57.00</span><span class="price-tax">Ex Tax: $210.00</span></p>
                                <div class="star-hot-product">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="far fa-star"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div id="content" class="col-sm-9">
            <div class="row">
                <div class="col-sm-6">
                    <div class="thumbnails">
                        <div>
                            <!-- anh chinh -->
                            <a class="thumbnail" href="" title="lorem ippsum dolor dummy">
                                <img src="image/product/product-06.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" id="main-img"/>
                            </a>
                        </div>
                        <div id="product-thumbnail" class="owl-carousel">
                            <div class="item">
                                <div class="image-additional">
                                    <div class="thumbnail main imag1" > <img src="image/product/product-06.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" id="zero" /></div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="image-additional">
                                    <div class="thumbnail imag2 " >
                                        <img src="image/product/product-08.jpg"  title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy"  id="one"/>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="image-additional">
                                    <div class="thumbnail imag3 "> <img src="image/product/product-09.webp" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" id="two"/></div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="image-additional">
                                    <div class="thumbnail imag4 "> <img src="image/product/product-05.webp" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" id="three"/></div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="image-additional">
                                    <div class="thumbnail imag5 "> <img src="image/product/pro-5-220x294.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" id="four"/></div>
                                </div>
                            </div>
                            <!-- <div class="item">
                                <div class="image-additional">
                                    <div class="thumbnail imag6 "> <img src="image/product/pro-6-220x294.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" id="five"/></div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="image-additional">
                                    <div class="thumbnail imag7 "> <img src="image/product/pro-7-220x294.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" id="six"/></div>
                                </div>
                            </div> -->
                        </div>
                    </div>
                </div>
                <!--*************************************-->

                <%
                        String id = request.getAttribute("idProduct").toString();
                        Product p = DaoProduct.getInstance().getProductById(id);
                %>
                <div class="col-sm-6" style="display: flex; flex-direction: column">
                    <h1 class="productpage-title"><%=p.getName()%></h1>
                    <div class="rating product"><span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i
                            class="fa fa-star-o fa-stack-1x"></i></span> <span class="fa fa-stack"><i
                            class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                        <span class="star star-size">&#128970;</span>
                        <span class="star star-size">&#128970;</span>
                        <span class="star star-size">&#128970;</span>
                        <span class="star star-size">&#128970;</span>
                        <span class="star-size">&#128970;</span>
                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i
                                class="fa fa-star-o fa-stack-1x"></i></span> <span class="fa fa-stack"><i
                                class="fa fa-star-o fa-stack-1x"></i></span> <span class="fa fa-stack"><i
                                class="fa fa-star-o fa-stack-1x"></i></span> <span class="review-count"> <a href="#"
                                                                                                            onClick="$('a[href=\'#tab-review\']').trigger('click'); return false;">1 reviews</a> / <a
                                href="#" onClick="$('a[href=\'#tab-review\']').trigger('click'); return false;">Write a review</a></span>
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
                    <ul class="list-unstyled productinfo-details-top">
                        <li>
                            <h2 class="productpage-price"><%=p.getSalePrice()%></h2>
                        </li>
                        <!-- <li><span class="productinfo-tax">Ex Tax: $100.00</span></li> -->
                    </ul>
                    <hr>
                    <ul class="list-unstyled product_info">
                        <li>
                            <label>Brand:</label>
                            <span> <a href="#"><%=p.getBrand()%></a></span></li>
                        <li>
                            <label>Product Code:</label>
                            <span> product <%=p.getId()%></span></li>
                        <li>
                            <label>Availability:</label>
                            <span> In Stock</span></li>
                        <li class="size-shoes">
                            <label>Size</label>
                            <div class="num-size">
                                <button>38</button>
                                <button>39</button>
                                <button>40</button>
                            </div>
                        </li>
                        <li>
                            <div>
                                <label class="title-code">Mã giảm giá</label>
                            </div>

                            <div class="box_code">
                                <div class="tritagnle">
                                </div>
                                <div class="boxed-conten">
                                    <p class="conten_center"><%=p.getSale()%>%</p>
                                </div>
                            </div>

                            <div class="box_code">
                                <div class="tritagnle">
                                </div>
                                <div class="boxed-conten">
                                    <p class="conten_center"><%=p.getSale()%>%</p>
                                </div>
                            </div>
                            <div class="box_code">
                                <div class="tritagnle">
                                </div>
                                <div class="boxed-conten">
                                    <p class="conten_center"><%=p.getSale()%>%</p>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div class="through">
                        <hr>
                    </div>
                    <!-- <p class="product-desc"> More room to move. With 80GB or 160GB of storage and up to 40 hours of
                    battery life, the new lorem ippsum dolor dummy lets you enjoy up to 40,000 songs or up to 200
                    hours of video or any combination wherever you go. Cover Flow.
                    Browse through your music collection by flipping..</p> -->
                    <div id="product">
                        <div class="form-group">
                            <label class="control-label qty-label" for="input-quantity">Qty</label>
                            <input type="text" name="quantity" value="1" size="2" id="input-quantity" class="form-control productpage-qty" />
                            <input type="hidden" name="product_id" value="48" />
                            <div class="btn-group">
                                <button type="button" data-toggle="tooltip" class="btn btn-default wishlist" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                                <button type="button" id="button-cart" data-loading-text="Loading..." class="btn btn-primary btn-lg btn-block addtocart">Add to Cart
                                </button>
                                <button type="button" data-toggle="tooltip" class="btn btn-default compare" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                            </div>
                        </div>
                    </div>
                </div>


                <!--*************************************-->
            </div>
            <div class="productinfo-tab">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab-description" data-toggle="tab">Description</a></li>
                    <li><a href="#tab-review" data-toggle="tab">Reviews (1)</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab-description">
                        <div class="cpt_product_description ">
                            <div>
                                <p><strong>More room to move.</strong></p>
                                <p> With 80GB or 160GB of storage and up to 40 hours of battery life, the new lorem ippsum dolor dummy lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.</p>
                                <p><strong>Cover Flow.</strong></p>
                                <p> Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.</p>
                                <p><strong>Enhanced interface.</strong></p>
                                <p> Experience a whole new way to browse and view your music and video.</p>
                                <p><strong>Sleeker design.</strong></p>
                                <p> Beautiful, durable, and sleeker than ever, lorem ippsum dolor dummy now features an anodized aluminum and polished stainless steel enclosure with rounded edges.</p>
                            </div>
                        </div>
                        <!-- cpt_container_end -->
                    </div>
                    <div class="tab-pane" id="tab-review">
                        <form class="form-horizontal">
                            <div id="review"></div>
                            <h2>Write a review</h2>
                            <div class="form-group required">
                                <div class="col-sm-12">
                                    <label class="control-label" for="input-name">Your Name</label>
                                    <input type="text" name="name" value="" id="input-name" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group required">
                                <div class="col-sm-12">
                                    <label class="control-label" for="input-review">Your Review</label>
                                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                                    <div class="help-block"><span class="text-danger">Note:</span> HTML is not translated!
                                    </div>
                                </div>
                            </div>
                            <div class="form-group required">
                                <div class="col-sm-12">
                                    <label class="control-label">Rating</label> &nbsp;&nbsp;&nbsp; Bad&nbsp;
                                    <input type="radio" name="rating" value="1" /> &nbsp;
                                    <input type="radio" name="rating" value="2" /> &nbsp;
                                    <input type="radio" name="rating" value="3" /> &nbsp;
                                    <input type="radio" name="rating" value="4" /> &nbsp;
                                    <input type="radio" name="rating" value="5" /> &nbsp;Good
                                </div>
                            </div>
                            <div class="buttons clearfix">
                                <div class="pull-right">
                                    <button type="button" id="button-review" data-loading-text="Loading..." class="btn btn-primary">Continue
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <h3 class="productblock-title">Những sản phẩm liên quan</h3>
            <div class="box">

                <div id="related-slidertab" class="row owl-carousel product-slider">
                    <div class="item">
                        <div class="product-thumb transition">
                            <div class="image product-imageblock">
                                <a href="#">
                                    <div class="related-product-sale">
                                        <h5>-35%</h5>
                                    </div>
                                    <img src="image/related-product/related-product-01.jpg" alt="shoe" title="AIR JORDAN" class="img-responsive" /> </a>
                                <div class="button-group">
                                    <button type="button" class="wishlist" data-toggle="tooltip" title="Thêm vào yêu thích"><i class="fas fa-heart"></i></button>
                                    <button type="button" class="addtocart-btn">Mua ngay</button>
                                    <button type="button" class="compare" data-toggle="tooltip" title="Thêm vào giỏ hàng"><i class="fas fa-shopping-cart"></i></button>
                                </div>
                            </div>
                            <div class="caption product-detail">
                                <a class="related-product-brand">AIR JORDAN</a>
                                <h4 class="product-name"><a href="product.html" title="Zion 1 Mens Basketball Shoe">Zion
                                    1 Mens Basketball Shoe</a></h4>
                                <p class="price product-price"><span class="price-new">$5.00</span> <span class="price-old">$7.00</span> <span class="price-tax"></span></p>
                                <div class="star-related-product">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                    <i class="far fa-star"></i>
                                </div>
                                <h5 class="number-vote-related-product">(250)</h5>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="product-thumb transition">
                            <div class="image product-imageblock">
                                <a href="#">
                                    <div class="related-product-sale">
                                        <h5>-14%</h5>
                                    </div>
                                    <img src="image/related-product/related-product-02.jpg" alt="shoe" title="AIR JORDAN" class="img-responsive" /> </a>
                                <div class="button-group">
                                    <button type="button" class="wishlist" data-toggle="tooltip" title="Thêm vào yêu thích"><i class="fas fa-heart"></i></button>
                                    <button type="button" class="addtocart-btn">Mua ngay</button>
                                    <button type="button" class="compare" data-toggle="tooltip" title="Thêm vào giỏ hàng"><i class="fas fa-shopping-cart"></i></button>
                                </div>
                            </div>
                            <div class="caption product-detail">
                                <a class="related-product-brand">AIR JORDAN</a>
                                <h4 class="product-name"><a href="product.html" title="Zer0.4 Family Basketball Shoes">Zer0.4
                                    Family Basketball Shoes</a></h4>
                                <p class="price product-price"><span class="price-new">$124.99</span> <span class="price-old">$150.00</span> <span class="price-tax"></span></p>
                                <div class="star-related-product">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                </div>
                                <h5 class="number-vote-related-product">(525)</h5>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="product-thumb transition">
                            <div class="image product-imageblock">
                                <a href="#">
                                    <div class="related-product-sale">
                                        <h5>-11%</h5>
                                    </div>
                                    <img src="image/related-product/related-product-03.jpg" alt="shoe" title="AIR JORDAN" class="img-responsive" /> </a>
                                <div class="button-group">
                                    <button type="button" class="wishlist" data-toggle="tooltip" title="Thêm vào yêu thích"><i class="fas fa-heart"></i></button>
                                    <button type="button" class="addtocart-btn">Mua ngay</button>
                                    <button type="button" class="compare" data-toggle="tooltip" title="Thêm vào giỏ hàng"><i class="fas fa-shopping-cart"></i></button>
                                </div>
                            </div>
                            <div class="caption product-detail">
                                <a class="related-product-brand">Nike</a>
                                <h4 class="product-name"><a href="product.html" title="LeBron Witness 5 Mens Basketball Shoes">LeBron
                                    Witness 5 Mens Basketball Shoes</a></h4>
                                <p class="price product-price"><span class="price-new">$89.99</span> <span class="price-old">$100.00</span> <span class="price-tax"></span></p>
                                <div class="star-related-product">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>

                                </div>
                                <h5 class="number-vote-related-product">(115)</h5>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="product-thumb transition">
                            <div class="image product-imageblock">
                                <a href="#">
                                    <div class="related-product-sale">
                                        <h5>-11%</h5>
                                    </div>
                                    <img src="image/related-product/related-product-04.jpg" alt="shoe" title="UNDER ARMOUR" class="img-responsive" /> </a>
                                <div class="button-group">
                                    <button type="button" class="wishlist" data-toggle="tooltip" title="Thêm vào yêu thích"><i class="fas fa-heart"></i></button>
                                    <button type="button" class="addtocart-btn">Mua ngay</button>
                                    <button type="button" class="compare" data-toggle="tooltip" title="Thêm vào giỏ hàng"><i class="fas fa-shopping-cart"></i></button>

                                </div>
                            </div>

                            <div class="caption product-detail">
                                <a class="related-product-brand">UNDER ARMOUR</a>
                                <h4 class="product-name"><a href="product.html" title="LeBron Witness 5 Mens Basketball Shoes">Armour
                                    Lockdown 5 Trainers Mens</a></h4>
                                <p class="price product-price"><span class="price-new">$89.99</span> <span class="price-old">$100.00</span> <span class="price-tax"></span></p>
                                <div class="star-related-product">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <h5 class="number-vote-related-product">(435)</h5>
                            </div>
                        </div>

                    </div>
                    <div class="item">
                        <div class="product-thumb transition">
                            <div class="image product-imageblock">
                                <a href="#">
                                    <div class="related-product-sale">
                                        <h5>-12%</h5>
                                    </div>
                                    <img src="image/related-product/related-product-05.jpg" alt="shoe" title="Nike" class="img-responsive" /> </a>
                                <div class="button-group">
                                    <button type="button" class="wishlist" data-toggle="tooltip" title="Thêm vào yêu thích"><i class="fas fa-heart"></i></button>
                                    <button type="button" class="addtocart-btn">Mua ngay</button>
                                    <button type="button" class="compare" data-toggle="tooltip" title="Thêm vào giỏ hàng"><i class="fas fa-shopping-cart"></i></button>
                                </div>
                            </div>
                            <div class="caption product-detail">
                                <a class="related-product-brand">Nike</a>
                                <h4 class="product-name"><a href="product.html" title="KD Trey 5 IX Mens Basketball Shoes">KD Trey 5 IX Mens
                                    Basketball Shoes</a></h4>
                                <p class="price product-price"><span class="price-new">$79.99</span> <span class="price-old">$89.00</span> <span class="price-tax">Ex Tax: $70.00</span>
                                </p>
                                <div class="star-related-product">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                    <i class="far fa-star"></i>
                                </div>
                                <h5 class="number-vote-related-product">(198)</h5>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="product-thumb transition">
                            <div class="image product-imageblock">
                                <a href="#">
                                    <div class="related-product-sale">
                                        <h5>-16%</h5>
                                    </div>
                                    <img src="image/related-product/related-product-06.jpg" alt="shoe" title="NIKE" class="img-responsive" /> </a>
                                <div class="button-group">
                                    <button type="button" class="wishlist" data-toggle="tooltip" title="Thêm vào yêu thích"><i class="fas fa-heart"></i></button>
                                    <button type="button" class="addtocart-btn">Mua ngay</button>
                                    <button type="button" class="compare" data-toggle="tooltip" title="Thêm vào giỏ hàng"><i class="fas fa-shopping-cart"></i></button>
                                </div>
                            </div>
                            <div class="caption product-detail">
                                <a class="related-product-brand">Nike</a>
                                <h4 class="product-name"><a href="product.html" title="One Take II Mens Basketball Shoes">One Take II Mens
                                    Basketball Shoes</a></h4>
                                <p class="price product-price"><span class="price-new">$89.99</span> <span class="price-old">$100.00</span> <span class="price-tax"></span></p>
                                <div class="star-related-product">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                </div>
                                <h5 class="number-vote-related-product">(14)</h5>
                            </div>
                        </div>
                    </div>
                </div>

                <!--
                                    san pham vua xem -->
                <h1 class="tit">NHỮNG SẢN PHẨM VỪA XEM</h1>
                <!-- <div class="max-w">
                    <div class="sp_vuaxem" >

                          <div class="item2">
                            <div class="product-thumb2 transition2">
                                <div class="image2 product-imageblock2">
                                    <a href="#">
                                        <div class="related-product-sale">
                                            <h5>-12%</h5>
                                        </div>
                                        <img src="image/related-product/related-product-05.jpg" alt="shoe" title="Nike" class="img-responsive2" /> </a>
                                    <div class="button-group2">
                                        <button type="button" class="wishlist2" data-toggle="tooltip" title="Thêm vào yêu thích"><i class="fas fa-heart"></i></i></button>
                                        <button type="button" class="addtocart-btn2">Mua ngay</button>
                                        <button type="button" class="compare2" data-toggle="tooltip" title="Thêm vào giỏ hàng"><i class="fas fa-shopping-cart"></i></button>
                                    </div>
                                </div>
                                <div class="caption2 product-detail2">
                                    <a class="related-product-brand2">Nike</a>
                                    <h4 class="product-name"><a href="product.html" title="KD Trey 5 IX Mens Basketball Shoes">KD Trey 5 IX Mens
                                    Basketball Shoes</a></h4>
                                    <p class="price product-price2"><span class="price-new2">$79.99</span> <span class="price-old2">$89.00</span>
                                    </p>
                                    <div class="star-related-product2">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                        <i class="far fa-star"></i>
                                    </div>
                                    <h5 class="number-vote-related-product2">(198)</h5>
                                </div>
                            </div>
                        </div>

                        <div class="item2">
                            <div class="product-thumb2 transition2">
                                <div class="image2 product-imageblock2">
                                    <a href="#">
                                        <div class="related-product-sale">
                                            <h5>-16%</h5>
                                        </div>
                                        <img src="image/related-product/related-product-06.jpg" alt="shoe" title="NIKE" class="img-responsive2" /> </a>
                                    <div class="button-group2">
                                        <button type="button" class="wishlist2" data-toggle="tooltip" title="Thêm vào yêu thích"><i class="fas fa-heart"></i></i></button>
                                        <button type="button" class="addtocart-btn2">Mua ngay</button>
                                        <button type="button" class="compare2" data-toggle="tooltip" title="Thêm vào giỏ hàng"><i class="fas fa-shopping-cart"></i></button>
                                    </div>
                                </div>
                                <div class="caption product-detail2">
                                    <a class="related-product-brand2">Nike</a>
                                    <h4 class="product-name2"><a href="product.html" title="One Take II Mens Basketball Shoes">One Take II Mens
                                    Basketball Shoes</a></h4>
                                    <p class="price product-price2"><span class="price-new2">$89.99</span> <span class="price-old2">$100.00</span> <span class="price-tax2"></span></p>
                                    <div class="star-related-product2">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                    </div>
                                    <h5 class="number-vote-related-product2">(14)</h5>
                                </div>
                            </div>
                        </div>

                        <div class="item2">
                            <div class="product-thumb2 transition2">
                                <div class="image2 product-imageblock2">
                                    <a href="#">
                                        <div class="related-product-sale">
                                            <h5>-12%</h5>
                                        </div>
                                        <img src="image/related-product/related-product-05.jpg" alt="shoe" title="Nike" class="img-responsive2" /> </a>
                                    <div class="button-group2">
                                        <button type="button" class="wishlist2" data-toggle="tooltip" title="Thêm vào yêu thích"><i class="fas fa-heart"></i></i></button>
                                        <button type="button" class="addtocart-btn2">Mua ngay</button>
                                        <button type="button" class="compare2" data-toggle="tooltip" title="Thêm vào giỏ hàng"><i class="fas fa-shopping-cart"></i></button>
                                    </div>
                                </div>
                                <div class="caption2 product-detail2">
                                    <a class="related-product-brand2">Nike</a>
                                    <h4 class="product-name"><a href="product.html" title="KD Trey 5 IX Mens Basketball Shoes">KD Trey 5 IX Mens
                                    Basketball Shoes</a></h4>
                                    <p class="price product-price2"><span class="price-new2">$79.99</span> <span class="price-old2">$89.00</span>
                                    </p>
                                    <div class="star-related-product2">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                        <i class="far fa-star"></i>
                                    </div>
                                    <h5 class="number-vote-related-product2">(198)</h5>
                                </div>
                            </div>
                        </div>

                        <div class="item2">
                            <div class="product-thumb2 transition2">
                                <div class="image2 product-imageblock2">
                                    <a href="#">
                                        <div class="related-product-sale">
                                            <h5>-12%</h5>
                                        </div>
                                        <img src="image/related-product/related-product-05.jpg" alt="shoe" title="Nike" class="img-responsive2" /> </a>
                                    <div class="button-group2">
                                        <button type="button" class="wishlist2" data-toggle="tooltip" title="Thêm vào yêu thích"><i class="fas fa-heart"></i></i></button>
                                        <button type="button" class="addtocart-btn2">Mua ngay</button>
                                        <button type="button" class="compare2" data-toggle="tooltip" title="Thêm vào giỏ hàng"><i class="fas fa-shopping-cart"></i></button>
                                    </div>
                                </div>
                                <div class="caption2 product-detail2">
                                    <a class="related-product-brand2">Nike</a>
                                    <h4 class="product-name"><a href="product.html" title="KD Trey 5 IX Mens Basketball Shoes">KD Trey 5 IX Mens
                                    Basketball Shoes</a></h4>
                                    <p class="price product-price2"><span class="price-new2">$79.99</span> <span class="price-old2">$89.00</span>
                                    </p>
                                    <div class="star-related-product2">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                        <i class="far fa-star"></i>
                                    </div>
                                    <h5 class="number-vote-related-product2">(198)</h5>
                                </div>
                            </div>
                        </div> -->

                <!-- <div class="item2">
                    <div class="product-thumb2 transition2">
                        <div class="image2 product-imageblock2">
                            <a href="#">
                                <div class="related-product-sale">
                                    <h5>-12%</h5>
                                </div>
                                <img src="image/related-product/related-product-05.jpg" alt="shoe" title="Nike" class="img-responsive2" /> </a>
                            <div class="button-group">
                                <button type="button" class="wishlist2" data-toggle="tooltip" title="Thêm vào yêu thích"><i class="fas fa-heart"></i></i></button>
                                <button type="button" class="addtocart-btn2">Mua ngay</button>
                                <button type="button" class="compare2" data-toggle="tooltip" title="Thêm vào giỏ hàng"><i class="fas fa-shopping-cart"></i></button>
                            </div>
                        </div>
                        <div class="caption2 product-detail2">
                            <a class="related-product-brand2">Nike</a>
                            <h4 class="product-name"><a href="product.html" title="KD Trey 5 IX Mens Basketball Shoes">KD Trey 5 IX Mens
                            Basketball Shoes</a></h4>
                            <p class="price product-price2"><span class="price-new2">$79.99</span> <span class="price-old2">$89.00</span> <span class="price-tax2">Ex Tax: $70.00</span>
                            </p>
                            <div class="star-related-product2">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <i class="far fa-star"></i>
                            </div>
                            <h5 class="number-vote-related-product2">(198)</h5>
                        </div>
                    </div>
                </div>
                </div>
            </div> -->

                <!-- <div class="item2">
                    <div class="product-thumb2 transition2">
                        <div class="image2 product-imageblock2">
                            <a href="#">
                                <div class="related-product-sale">
                                    <h5>-12%</h5>
                                </div>
                                <img src="image/related-product/related-product-05.jpg" alt="shoe" title="Nike" class="img-responsive2" /> </a>
                            <div class="button-group2">
                                <button type="button" class="wishlist2" data-toggle="tooltip" title="Thêm vào yêu thích"><i class="fas fa-heart"></i></i></button>
                                <button type="button" class="addtocart-btn2">Mua ngay</button>
                                <button type="button" class="compare2" data-toggle="tooltip" title="Thêm vào giỏ hàng"><i class="fas fa-shopping-cart"></i></button>
                            </div>
                        </div>
                        <div class="caption2 product-detail2">
                            <a class="related-product-brand2">Nike</a>
                            <h4 class="product-name"><a href="product.html" title="KD Trey 5 IX Mens Basketball Shoes">KD Trey 5 IX Mens
                            Basketball Shoes</a></h4>
                            <p class="price product-price2"><span class="price-new2">$79.99</span> <span class="price-old2">$89.00</span>
                            </p>
                            <div class="star-related-product2">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <i class="far fa-star"></i>
                            </div>
                            <h5 class="number-vote-related-product2">(198)</h5>
                        </div>
                    </div>
                </div>



             </div>
            </div> -->

                <div class="box">
                    <div id="special-slidertab" class="row owl-carousel product-slider">
                        <div class="item">
                            <div class="product-thumb transition">
                                <div class="image product-imageblock">
                                    <a href="product.html"> <img src="image/product/product-sale-1.jfif" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                                    <div class="button-group">
                                        <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                        <button type="button" class="addtocart-btn">Mua Ngay</button>
                                        <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                    </div>
                                </div>
                                <div class="caption product-detail">
                                    <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">Vans Classic Slip-On Checkered Platfrom Shose</a></h4>
                                    <p class="price product-price"> <span class="price-new">99.99$</span> <span class="price-old">119.99$</span> <span class="price-tax">Ex Tax: 210.00$</span> </p>
                                </div>
                                <div class="button-group">
                                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                    <button type="button" class="addtocart-btn">Mua Ngay</button>
                                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="product-thumb transition">
                                <div class="image product-imageblock">
                                    <a href="product.html"> <img src="image/product/product-sale-2.jfif" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                                    <div class="button-group">
                                        <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                        <button type="button" class="addtocart-btn">Mua Ngay</button>
                                        <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                    </div>
                                </div>
                                <div class="caption product-detail">
                                    <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">Brooks Women's Ghost 14 Running Shoes</a></h4>
                                    <p class="price product-price"> <span class="price-new">109.99$</span> <span class="price-old">129.00$</span> <span class="price-tax">Ex Tax: 210.00$</span> </p>
                                </div>
                                <div class="button-group">
                                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                    <button type="button" class="addtocart-btn">Mua Ngay</button>
                                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="product-thumb transition">
                                <div class="image product-imageblock">
                                    <a href="product.html"> <img src="image/product/product-sale-3.jfif" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                                    <div class="button-group">
                                        <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                        <button type="button" class="addtocart-btn">Mua Ngay</button>
                                        <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                    </div>
                                </div>
                                <div class="caption product-detail">
                                    <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">adidas Kids' X Speedflow.4 Messi Indoor Soccer Shoes</a></h4>
                                    <p class="price product-price"> <span class="price-new">39.99$</span> <span class="price-old">49.99$</span> <span class="price-tax">Ex Tax: 210.00$</span> </p>
                                </div>
                                <div class="button-group">
                                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                    <button type="button" class="addtocart-btn">Mua Ngay</button>
                                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="product-thumb transition">
                                <div class="image product-imageblock">
                                    <a href="product.html"> <img src="image/product/product-sale-4.jfif" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                                    <div class="button-group">
                                        <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                        <button type="button" class="addtocart-btn">Mua Ngay</button>
                                        <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                    </div>
                                </div>
                                <div class="caption product-detail">
                                    <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">Jordan Air Jordan XXXVI Basketball Shoes</a></h4>
                                    <p class="price product-price"> <span class="price-new">184.99</span> <span class="price-old">199.00$</span> <span class="price-tax">Ex Tax: 210.00$</span> </p>
                                </div>
                                <div class="button-group">
                                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                    <button type="button" class="addtocart-btn">Mua Ngay</button>
                                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="product-thumb transition">
                                <div class="image product-imageblock">
                                    <a href="product.html"> <img src="image/product/product-sale-5.jfif" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                                    <div class="button-group">
                                        <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                        <button type="button" class="addtocart-btn">Mua Ngay</button>
                                        <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                    </div>
                                </div>
                                <div class="caption product-detail">
                                    <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">Louis Garneau Women's Multi Air Flex II Cycling Shoes</a></h4>
                                    <p class="price product-price"> <span class="price-new">85.99$</span> <span class="price-old">99.99$</span> <span class="price-tax">Ex Tax: 210.00$</span> </p>
                                </div>
                                <div class="button-group">
                                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                    <button type="button" class="addtocart-btn">Mua Ngay</button>
                                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="product-thumb transition">
                                <div class="image product-imageblock">
                                    <a href="#"> <img src="image/product/product-sale-6.jfif" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                                    <div class="button-group">
                                        <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                        <button type="button" class="addtocart-btn">Mua Ngay</button>
                                        <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                    </div>
                                </div>
                                <div class="caption product-detail">
                                    <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">Nike Mercurial Superfly 8 Club KM FG Soccer Cleats</a></h4>
                                    <p class="price product-price"> <span class="price-new">69.99$</span> <span class="price-old">79.99$</span> <span class="price-tax">Ex Tax: 210.00$</span> </p>
                                </div>
                                <div class="button-group">
                                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                    <button type="button" class="addtocart-btn">Mua Ngay</button>
                                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="box">
                    <div id="special-slidertab" class="row owl-carousel product-slider">
                        <div class="item">
                            <div class="product-thumb transition">
                                <div class="image product-imageblock">
                                    <a href="product.html"> <img src="image/product/product-sale-1.jfif" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                                    <div class="button-group">
                                        <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                        <button type="button" class="addtocart-btn">Mua Ngay</button>
                                        <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                    </div>
                                </div>
                                <div class="caption product-detail">
                                    <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">Vans Classic Slip-On Checkered Platfrom Shose</a></h4>
                                    <p class="price product-price"> <span class="price-new">99.99$</span> <span class="price-old">119.99$</span> <span class="price-tax">Ex Tax: 210.00$</span> </p>
                                </div>
                                <div class="button-group">
                                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                    <button type="button" class="addtocart-btn">Mua Ngay</button>
                                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="product-thumb transition">
                                <div class="image product-imageblock">
                                    <a href="product.html"> <img src="image/product/product-sale-2.jfif" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                                    <div class="button-group">
                                        <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                        <button type="button" class="addtocart-btn">Mua Ngay</button>
                                        <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                    </div>
                                </div>
                                <div class="caption product-detail">
                                    <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">Brooks Women's Ghost 14 Running Shoes</a></h4>
                                    <p class="price product-price"> <span class="price-new">109.99$</span> <span class="price-old">129.00$</span> <span class="price-tax">Ex Tax: 210.00$</span> </p>
                                </div>
                                <div class="button-group">
                                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                    <button type="button" class="addtocart-btn">Mua Ngay</button>
                                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="product-thumb transition">
                                <div class="image product-imageblock">
                                    <a href="product.html"> <img src="image/product/product-sale-3.jfif" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                                    <div class="button-group">
                                        <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                        <button type="button" class="addtocart-btn">Mua Ngay</button>
                                        <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                    </div>
                                </div>
                                <div class="caption product-detail">
                                    <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">adidas Kids' X Speedflow.4 Messi Indoor Soccer Shoes</a></h4>
                                    <p class="price product-price"> <span class="price-new">39.99$</span> <span class="price-old">49.99$</span> <span class="price-tax">Ex Tax: 210.00$</span> </p>
                                </div>
                                <div class="button-group">
                                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                    <button type="button" class="addtocart-btn">Mua Ngay</button>
                                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="product-thumb transition">
                                <div class="image product-imageblock">
                                    <a href="product.html"> <img src="image/product/product-sale-4.jfif" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                                    <div class="button-group">
                                        <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                        <button type="button" class="addtocart-btn">Mua Ngay</button>
                                        <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                    </div>
                                </div>
                                <div class="caption product-detail">
                                    <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">Jordan Air Jordan XXXVI Basketball Shoes</a></h4>
                                    <p class="price product-price"> <span class="price-new">184.99</span> <span class="price-old">199.00$</span> <span class="price-tax">Ex Tax: 210.00$</span> </p>
                                </div>
                                <div class="button-group">
                                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                    <button type="button" class="addtocart-btn">Mua Ngay</button>
                                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="product-thumb transition">
                                <div class="image product-imageblock">
                                    <a href="product.html"> <img src="image/product/product-sale-5.jfif" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                                    <div class="button-group">
                                        <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                        <button type="button" class="addtocart-btn">Mua Ngay</button>
                                        <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                    </div>
                                </div>
                                <div class="caption product-detail">
                                    <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">Louis Garneau Women's Multi Air Flex II Cycling Shoes</a></h4>
                                    <p class="price product-price"> <span class="price-new">85.99$</span> <span class="price-old">99.99$</span> <span class="price-tax">Ex Tax: 210.00$</span> </p>
                                </div>
                                <div class="button-group">
                                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                    <button type="button" class="addtocart-btn">Mua Ngay</button>
                                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="product-thumb transition">
                                <div class="image product-imageblock">
                                    <a href="#"> <img src="image/product/product-sale-6.jfif" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                                    <div class="button-group">
                                        <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                        <button type="button" class="addtocart-btn">Mua Ngay</button>
                                        <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                    </div>
                                </div>
                                <div class="caption product-detail">
                                    <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">Nike Mercurial Superfly 8 Club KM FG Soccer Cleats</a></h4>
                                    <p class="price product-price"> <span class="price-new">69.99$</span> <span class="price-old">79.99$</span> <span class="price-tax">Ex Tax: 210.00$</span> </p>
                                </div>
                                <div class="button-group">
                                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
                                    <button type="button" class="addtocart-btn">Mua Ngay</button>
                                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
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
                                <li><i class="fa fa-envelope"></i><span class="mail2"><a
                                        href="#">info@localhost.com</a></span></li>
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
                                    <button type="submit" value="Sign up" class="btn btn-large btn-primary">Subscribe
                                    </button>
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
        <a id="scrollup">Scroll</a></footer>
    <div class="footer-bottom">
        <div class="container">
            <div class="copyright">Powered By &nbsp;<a class="yourstore" href="http://www.lionode.com/">lionode &copy;
                2017 </a></div>
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
</div>
    <!-- End: login register -->
    <script src="./javascript/hung-js.js"></script>


    <script>
        function setIma(main,child){
            var path = document.getElementById(child).getAttribute("src");
            document.getElementById(main).setAttribute("src",path);
            console.log(path);
        }

        const ima = document.querySelector(".imag2")
        console.log(ima);
        ima.addEventListener("click",function(){
            var path = document.getElementById("one").getAttribute("src");
            document.getElementById("main-img").setAttribute("src",path);

        })

        const ima2 = document.querySelector(".imag1")
        console.log(ima2);
        ima2.addEventListener("click",function(){
            var path = document.getElementById("zero").getAttribute("src");
            document.getElementById("main-img").setAttribute("src",path);

        })
        const ima3 = document.querySelector(".imag3")
        console.log(ima3);
        ima3.addEventListener("click",function(){
            var path = document.getElementById("two").getAttribute("src");
            document.getElementById("main-img").setAttribute("src",path);

        })

        const ima4 = document.querySelector(".imag4")
        console.log(ima4);
        ima4.addEventListener("click",function(){
            var path = document.getElementById("three").getAttribute("src");
            document.getElementById("main-img").setAttribute("src",path);

        })

        const ima5 = document.querySelector(".imag5")
        console.log(ima5);
        ima5.addEventListener("click",function(){
            var path = document.getElementById("four").getAttribute("src");
            document.getElementById("main-img").setAttribute("src",path);

        })

        const ima6 = document.querySelector(".imag6")
        console.log(ima6);
        ima6.addEventListener("click",function(){
            var path = document.getElementById("five").getAttribute("src");
            document.getElementById("main-img").setAttribute("src",path);

        })

        const ima7 = document.querySelector(".imag7")
        console.log(ima7);
        ima7.addEventListener("click",function(){
            var path = document.getElementById("six").getAttribute("src");
            document.getElementById("main-img").setAttribute("src",path);

        })

    </script>


</body>
</html>

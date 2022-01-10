<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
    <link rel="stylesheet" href="css/dat-css.css">
    <link rel="stylesheet" href="css/khanh-css.css">
    <link rel="stylesheet" href="./css/hung-css.css">
    <script src="javascript/khanh-js.js" type="text/javascript"></script>
</head>

<body class="single-blog col-2">
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
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html"><i class="fa fa-home"></i></a></li>
            <li><a href="blog.html">Blog</a></li>
            <li><a href="singale-blog.html">Singale Post</a></li>
        </ul>
        <div class="row">

            <div id="content" class="col-sm-9">
                <div class="blog1 blog">
                    <div class="blog_img"><img src="image/blog/blog_4.jpg" alt="" /></div>
                    <h4 class="p-name"><a href="singale-blog.html">Image Post Format</a></h4>
                    <ul class="blog-meta">
                        <li><i class="fa fa-clock-o"></i><span class="dt-published">December 23, 2015</span></li>
                        <li><i class="fa fa-comment-o"></i><span>2</span> Comment</li>
                        <li><i class="fa fa-user"></i><span><a rel="author" title="Posts by Admin" href="#">Admin admin</a></span></li>
                    </ul>
                    <p class="p-summary"></p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae provident minus similique porro assumenda illo dolore ducimus vero ipsum illum ipsa velit, deleniti accusantium repellat facilis tempora ab consectetur! Sequi, aperiam,
                        dignissimos! Molestias quidem temporibus, earum deleniti, quae voluptatibus cum, doloremque libero dolorum sapiente neque saepe magnam ullam nisi mollitia itaque voluptas illo pariatur inventore,doloremque libero dolorum sapiente
                        neque saepe magnam ullam nisi mollitia itaque voluptas illo pariatur inventor.</p>

                    <div class="blog-comment">
                        <div class="comment-form col-sm-12">
                            <div class="row">
                                <div class="col-sm-12 row">
                                    <h4 class="section-title">Leave a Reply</h4>
                                    <div class="taberna-line"> <span class="line-inner bg-color"></span> </div>
                                </div>
                                <div class="comment-respond" id="respond">

                                    <form novalidate class="comment-form" id="commentform" method="post" action="#">
                                        <div class="row">
                                            <div class="name col-xs-12 col-sm-12">
                                                <label>Name *</label>
                                                <input type="text" aria-required="true" value="" name="author" id="author">
                                            </div>
                                            <div class="email col-xs-12 col-sm-12">
                                                <label>Email *</label>
                                                <input type="email" aria-required="true" value="" name="email" id="email">
                                            </div>
                                            <div class="comment-form-url col-xs-12">
                                                <label>Url</label>
                                                <input type="text" value="" name="url" id="url">
                                            </div>
                                            <div class="comment-form-comment col-xs-12 col-sm-12">
                                                <label for="comment">Comment</label>
                                                <textarea required rows="8" cols="45" name="comment" id="comment"></textarea>
                                            </div>
                                        </div>
                                        <p class="form-submit">
                                            <button type="submit" value="send" class="submit taberna-btn bg-color" id="submit" name="submit">send </button>
                                            <input type="hidden" id="comment_post_ID" value="872" name="comment_post_ID" class="taberna-btn bg-color">
                                            <input type="hidden" value="0" id="comment_parent" name="comment_parent" class="taberna-btn bg-color">
                                        </p>
                                        <p style="display: none;">
                                            <input type="hidden" value="daabc47a44" name="akismet_comment_nonce" id="akismet_comment_nonce">
                                        </p>
                                        <p style="display: none;"></p>
                                        <input type="hidden" value="1452356543102" name="ak_js" id="ak_js">
                                    </form>
                                </div>
                                <!-- #respond -->

                            </div>
                        </div>
                    </div>
                    <!-- end comment-form -->

                </div>
            </div>
            <div id="column-right" class="col-sm-3 hidden-xs column-left">
                <div class="columnblock-title">Categories</div>
                <div class="blog-categories-block category_block">
                    <div class="list-group"> <a class="list-group-item" href="#">Audio</a> <a class="list-group-item" href="#">Gallery</a> <a class="list-group-item" href="#">Link</a> <a class="list-group-item" href="#">Quote</a> <a class="list-group-item" href="#">Uncategorized</a>                        <a class="list-group-item last" href="#">Video</a> </div>
                </div>
                <div class="productblock-title">Recent Posts</div>
                <div class="blog-categories-block category_block">
                    <div class="list-group"> <a class="list-group-item" href="#">Gallery Post Format</a> <a class="list-group-item" href="#">Recent Posts</a> <a class="list-group-item" href="
    #">Gallery Post Format</a> <a class="list-group-item" href="#">Standard Post Format</a> <a class="list-group-item last" href="#">Image Post Format</a> </div>
                </div>

                <!-- end blog-sidebar -->

            </div>
            <!-- end blog-sidebar -->

        </div>
    </div>
    <!-- end container -->

   <%@include file="footer_login_message.jsp"%>
    <script src="./javascript/hung-js.js"></script>

</body>

</html>
<%@ page import="dao.product.DaoProduct" %>
<%@ page import="beans.Product" %>
<%@ page import="dao.product.image.DaoLinkImage" %>
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
    <link rel="stylesheet" href="css/hung-css.css">
    <script src="../javascript/khanh-js.js"></script>

    <style>
        .size_clicked {
            background-color: #2f52a4;
            color: white;
        }
        .li_bor {
            margin: 5px;
            padding: 0;
            list-style-type: none;
            list-style-position: outside;
            float: left;
            background-color: transparent;
        }



        .ul-checkbox {
            padding: 0;
            margin: 0;
            clear: both;
        }


        input[type="radio"]:not(:checked),
        input[type="radio"]:checked {
            position: absolute;
            left: -9999%;
        }

        .label_bor {
            padding: 8px;
            margin: 0;
            cursor: pointer;
            text-align: center;
            border: 1px solid black;
            color: black;
            background-color: white;
            width: 100% !important;
            height: 100%;
        }

    </style>



</head>

<body class="product col-2 left-col">
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
<%@include file="header.jsp" %>



<%
    Product p  = (Product) request.getAttribute("product");
%>

<div class="container">

    <div class="row" style="display: flex; flex-wrap: wrap;">

        <div id="content" class="col-sm-9 " style="flex: 3; padding: 40px;">
            <div class="row bg-white bd-rd" style="padding-top: 20px;width:100%; max-width: 840px;">
                <div class="col-sm-6">
                    <div class="thumbnails">
                        <div>
                            <%List<String> listMainImg = p.getImg().getMain();
                                List<String> listSubImg = p.getImg().getSub();
                            %>

                            <!-- anh chinh -->
                            <%String mainColor = p.getMainColor();%>
                            <a class="thumbnail" href="" title="lorem ippsum dolor dummy">
                                <img id="avatar" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" src="upload/product/<%=p.getMainImg(mainColor)%>"/>
                            </a>
                        </div>

                        <div id="product-thumbnail" class="owl-carousel" style="width: 100%;">
                            <div class="item mg-l">
                                <div class="image-additional">
                                    <div class="thumbnail main imag1">
                                        <img class="sub-img" src="upload/product/<%=p.getMainImg(mainColor)%>" title="lorem ippsum dolor dummy" />
                                    </div>
                                </div>
                            </div>
                            <%for(String img: p.getListSubImg(mainColor)){%>
                            <div class="item mg-l">
                                <div class="image-additional">
                                    <div class="thumbnail main imag1">
                                        <img class="sub-img" src="upload/product/<%=img%>" title="lorem ippsum dolor dummy" alt="<%=img%>" />
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6" style="display: flex; flex-direction: column">
                    <%int active = p.getActive();
                        if (active == 0) {%>
                    <h1 style="color:#cb1c22;margin: 5px 0">Ngừng kinh doanh</h1>
                    <%}%>
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

                        <li class="size-shoes d-flex" style="margin-top: 50px;">
                            <label>Nhãn hàng: </label>
                            <div class="num-size">
                                <%=p.getBrand()%>
                            </div>
                        </li>
                        <form id="form-to-cart" action="updateCart?id=132" method="get">
                            <!-- bug không gửi được parameter trên url nên dùng 5 cái input dưới-->
                            <input name="idCustomer" value="123" style="width: 1px; height: 1px; visibility: hidden">
                            <input name="idProduct" value="<%=p.getId()%>" style="width: 1px; height: 1px; visibility: hidden">
                            <input name="productName" value="<%=p.getName()%>" style="width: 1px; height: 1px; visibility: hidden">
                            <input name="productBrand" value="<%=p.getBrand()%>" style="width: 1px; height: 1px; visibility: hidden">
                            <input name="productPrice" value="<%=p.getPrice()%>" style="width: 1px; height: 1px; visibility: hidden">

                            <li class="size-shoes" style="margin-top: 50px;">
                                <label>Màu sắc</label>
                                <div class="num-size ul-checkbox">
                                    <ul class="d-flex flex-wrap ul-checkbox">
                                        <%for(String color : p.getListColor()){%>
                                        <li class="li_bor">
                                            <input type="radio" value="<%=color%>" name="color" class="js-color-black color-black input-bor" id="color-shoe-<%=color%>"
                                            <%if (mainColor.equals(color)) {%>
                                                checked
                                                <%}%>>
                                            <label for="color-shoe-<%=color%>"  <%if(color.equals(mainColor)){%>
                                                   style="background-color: #2f52a4; color: white"
                                                    <%}%> class="label_bor color-shoe" data-color="<%=color%>"><%=color%></label>
                                        </li>
                                        <%}%>
                                    </ul>
                                </div>
                            </li>
                            <li class="size-shoes">
                                <label>Size</label>
                                <div class="num-size list-size" style="display: flex; flex-wrap: wrap;width: 250px;">
                                    <%
                                        List<Integer> listSize = p.getListSize(mainColor);%>
                                    <ul class="d-flex flex-wrap ul-checkbox">
                                        <%for (int size : listSize) {%>
                                        <li class="li_bor">
                                            <input  type="radio" class="input-bor" id="shoe_<%=size%>" name="size" value="<%=size%>">
                                            <label for="shoe_<%=size%>" class="label_bor size-item"><%=size%>
                                            </label>
                                        </li>
                                        <%
                                            }%>
                                    </ul>
                                </div>
                            </li>
                            <li id="values">
                                <div class="value-box"><label>Số lượng:</label></div>
                                <div class="value-box set-value">
                                    <input class="value" type="button" onclick="reduceValue()" value="--" />
                                    <input type="text" id="number" class="changeQuantity"   value="<%=p.getQuantitySold()%>" name="quantity" />
                                    <input class="value" type="button" onclick="incrementValue(<%=p.getTotalValue()-p.getSoleValue()%>)" value="+" />
                                </div>
                                <h6 id="products-available" class="products-available value-box"><%=DaoProduct.getInstance().getRemainProductDetail(p.getId(), mainColor)%> Sản phẩm có sẵn</h6>
                            </li>
                            <li class="add-and-buy">
                                <button class="add-product" id="add-cart" type="submit">
                                    <p>Thêm Vào Giỏ Hàng</p>
                                </button>
                                <div class="buy-product">
                                    <a href="./checkout.html" class="buy">Mua Ngay</a>
                                </div>
                            </li>
                        </form>
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
                        <div class="form-horizontal">
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
                        </div>
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
                                            Product productWatched = DaoProduct.getInstance().getWatchedProduct(str);
                                        %>
                                        <div class="item">
                                            <div class="product-thumb transition">
                                                <div class="image product-imageblock">
                                                    <a href="product.html"> <img src="upload/product/<%=productWatched.getAvatar()%>" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
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
                                                <a href="product.html"> <img src="upload/product/<%=product.getAvatar()%>"
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

<%@include file="footer_login_message.jsp"%>
<script src="../javascript/hung-js.js"></script>


<script>

    function removeAllActiveColor() {
        $(".color-shoe").each(function() {
            $(this).css("background-color", "white");
            $(this).css("color", "black");
        })
    }

    $(function() {
        $(".color-shoe").each(function() {
            $(this).click(function (e){
                e.preventDefault()
                removeAllActiveColor()
                $(this).css("background-color", "#2f52a4");
                $(this).css("color", "white");
                $.ajax({
                    url: `ListSizeAndImg?id=<%=p.getId()%>&color=`+$(this).data('color'),
                    type: 'POST',
                    success: function (data) {
                        let dataDetail=JSON.parse(data)
                        $("#avatar").attr("src","upload/product/"+dataDetail.mainImg)
                        $("#products-available").text(dataDetail.remain + " Sản phẩm có sẵn")
                        // change img
                        let arrImg = dataDetail.listImg
                        let re=`
                          <div class="owl-item" style="width: 100px;">
                         <div class="item mg-l">
                            <div class="image-additional">
                                <div class="thumbnail main imag1">
                                    <img class="sub-img" src="upload/product/`+dataDetail.mainImg+`" title="lorem ippsum dolor dummy" id="zero" />
                                </div>
                            </div>
                        </div>
                     </div>`
                        for(let i = 0; i < arrImg.length; i++) {
                            re+=`
                       <div class="owl-item" style="width: 100px;">
                         <div class="item mg-l">
                            <div class="image-additional">
                                <div class="thumbnail main imag1">
                                    <img class="sub-img" src="upload/product/`+arrImg[i]+`" title="lorem ippsum dolor dummy" id="zero" />
                                </div>
                            </div>
                        </div>
                     </div>
                        `
                        }
                        $(".owl-wrapper").empty()
                        $(".owl-wrapper").append(re)
                        swapSubImgAndAvatar()

                        // change size
                        let arrSize = dataDetail.listSize
                        re=``
                        for(let i = 0; i < arrSize.length; i++) {
                            re+=`
                          <ul class="d-flex flex-wrap">
                                    <li class="li_bor">
                                        <input type="radio" class="input-bor" id="shoe_`+arrSize[i]+`" name="size" value="`+arrSize[i]+`">
                                        <label class="label_bor size-item" for="shoe_`+arrSize[i]+`">`+arrSize[i]+`</label>
                                    </li>

                                </ul>
                        `
                        }
                        $(".list-size").empty()
                        $(".list-size").append(re)
                        chooseSize()
                    },
                    error: function() {
                        alert("Error")
                    }
                })
            })

        })
    })


    $(function() {
        chooseSize();
    })


    function chooseSize() {
        $(".size-item").each(
            function() {
                $(this).click((e) => {
                    $(".size-item").css("background-color", "white")
                    $(".size-item").css("color", "black")
                    if (!$(this).hasClass("size_clicked")) {
                        $(this).addClass("size_clicked")
                        $(this).css("background-color", "#2f52a4")
                        $(this).css("color", "white")
                    }
                    else {
                        $(this).removeClass("size_clicked")
                        $(this).css("background-color", "white")
                        $(this).css("color", "black")
                    }
                })
            })
    }


    $(function() {
        $("#add-cart").click((e)=>{
            e.preventDefault()
            $("#form-to-cart").submit()
        })
    })
</script>

<script>
    function swapSubImgAndAvatar() {
        $(".sub-img").each(function(){
            $(this).click(function(){
                let srcSubImg = $(this).attr('src');
                $("#avatar").attr("src", srcSubImg);
            })
        })
    }

    $(function() {
        swapSubImgAndAvatar()
    })
</script>
</body>


</html>
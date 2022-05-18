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
    <link rel="stylesheet" href="css/hung-css.css">
    <script src="javascript/khanh-js.js"></script>

    <style>
        .size_clicked {
            background-color: #2f52a4;
            color: white;
        }
    </style>



</head>

<body class="product col-2 left-col">
<%@include file="header.jsp" %>

<%
    Object obj = request.getAttribute("idProduct");
    Product p = null;
    if (obj != null) {
        String id = obj.toString();
        p = DaoProduct.getInstance().getDetailProduct(id);
    }
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
                            <script>

                                $(function(){
                                    <%
                                    for (int i = 0; i < listMainImg.size(); i++) {
                                    %>
                                    $("#color-shoe-<%=i%>").on("click", ()=>{
                                        $("#main-img").attr("src","data/imgAll/upload/product/<%=listMainImg.get(i)%>.jpg")
                                        <%int tmp = i*3;%>
                                        $("#zero").attr("src","data/imgAll/upload/product/<%=listMainImg.get(i)%>.jpg")
                                        $("#one").attr("src","data/imgAll/upload/product/<%=listSubImg.get(tmp+1)%>.jpg")
                                        $("#two").attr("src","data/imgAll/upload/product/<%=listSubImg.get(tmp+2)%>.jpg")
                                        $("#three").attr("src","data/imgAll/upload/product/<%=listSubImg.get(tmp+3)%>.jpg")
                                    })
                                    <%}%>


                                    <%--$("#color-shoe-0").click(()=>{--%>

                                    <%--    console.log("<%=listImg.get(0)%>")--%>
                                    <%--    $("#main-img").attr("src","data/imgAll/<%=listImg.get(0)%>.jpg")--%>
                                    <%--})--%>

                                    <%--$("#color-shoe-1").click(()=>{--%>
                                    <%--    $("#main-img").attr("src","data/imgAll/<%=listImg.get(1)%>.jpg")--%>
                                    <%--    console.log("<%=listImg.get(1)%>")--%>

                                    <%--})--%>
                                })



                            </script>
                            <!-- anh chinh -->
                            <%String mainColor = p.getMainColor();%>
                            <a class="thumbnail" href="" title="lorem ippsum dolor dummy">
                                <img id="main-img" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" src="../data/imgAll/upload/product/<%=p.getMainImg(mainColor)%>.jpg"/>
                            </a>
                        </div>

                        <div id="product-thumbnail" class="owl-carousel" style="width: 100%;">
                            <%for(String img: p.getListSubImg(mainColor)){%>
                            <div class="item mg-l">
                                <div class="image-additional">
                                    <div class="thumbnail main imag1">
                                        <img src="data/imgAll/upload/product/<%=img%>.jpg" title="lorem ippsum dolor dummy" alt="<%=img%>" />
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

                        <li class="size-shoes" style="margin-top: 50px;">
                            <label>Màu sắc</label>
                            <div class="num-size">
                                <%for(String color : p.getListColor()){%>
                                <button value="<%=color%>" name="color"
                                        <%if(color.equals(mainColor)){%>
                                        style="background-color: #2f52a4; color: white"
                                        <%}%>
                                        value="<%=color%>"
                                        class="js-color-black color-black color-shoe" data-color="<%=color%>" id="color-shoe-<%=color%>"><%=color%></button>
                                <%}%>
                            </div>
                        </li>
                        <li class="size-shoes">
                            <label>Size</label>
                            <div class="num-size list-size" style="display: flex; flex-wrap: wrap;width: 250px;">
                                <%List<Integer> listSize = p.getListSize("white");%>
                                <%for (int size : listSize) {%>
                                <button class="my-2 size-item" name="size" value="<%=size%>"><%=size%></button>
                                <%}%>
                            </div>
                        </li>
                        <li id="values">
                            <div class="value-box"><label>Số lượng:</label></div>
                            <div class="value-box set-value">
                                <input class="value" type="button" onclick="reduceValue()" value="--" />
                                <input type="text" id="number" class="changeQuantity"   value="<%=p.getQuantitySold()%>" />
                                <input class="value" type="button" onclick="incrementValue(<%=p.getTotalValue()-p.getSoleValue()%>)" value="+" />
                            </div>
                            <h6 id="products-available" class="products-available value-box"><%=DaoProduct.getInstance().getRemainProductDetail(p.getId(), mainColor)%> Sản phẩm có sẵn</h6>
                        </li>
                        <li class="add-and-buy">
                            <div class="add-product">
                                <!-- <i class="fas fas-shopping-cart"></i> -->
                                <a href="/project/AddCart?id=<%=p.getId()%>" class="add">Thêm Vào Giỏ Hàng</a>
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
                                            Product productWatched = DaoProduct.getInstance().getWatchedProduct(str);
                                        %>
                                        <div class="item">
                                            <div class="product-thumb transition">
                                                <div class="image product-imageblock">
                                                    <a href="product.html"> <img src="data/imgAll/upload/product/<%=productWatched.getAvatar()%>.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
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
                                                <a href="product.html"> <img src="data/imgAll/upload/product/<%=product.getAvatar()%>.jpg"
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

    $(function() {

        $(".color-shoe").click(function (e){
            e.preventDefault()
            $(".color-shoe").css("background-color", "white");
            $(".color-shoe").css("color", "black");
            $(this).css("background-color", "#2f52a4");
            $(this).css("color", "white");
            $.ajax({
                url: `ListImg?id=<%=p.getId()%>&color=`+$(this).data('color'),
                type: 'POST',
                success: function (data) {
                    let dataDetail=JSON.parse(data)
                    $("#main-img").attr("src","data/imgAll/upload/product/"+dataDetail.mainImg+".jpg")
                    $("#products-available").text(dataDetail.remain + " Sản phẩm có sẵn")
                    let arrImg = dataDetail.listImg
                    let re=``
                    for(let i = 0; i < arrImg.length; i++) {
                        re+=`
                       <div class="owl-item" style="width: 100px;">
                         <div class="item mg-l">
                            <div class="image-additional">
                                <div class="thumbnail main imag1">
                                    <img src="data/imgAll/upload/product/`+arrImg[i]+`.jpg" title="lorem ippsum dolor dummy" id="zero" />
                                </div>
                            </div>
                        </div>
                     </div>
                        `
                    }
                    $(".owl-wrapper").empty()
                    $(".owl-wrapper").append(re)

                    let arrSize = dataDetail.listSize
                    re=``
                    for(let i = 0; i < arrSize.length; i++) {
                        re+=`
                        <button class="my-2 size-item" name="size" value=`+arrSize[i]+`>`+arrSize[i]+`</button>
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


    $(function() {
        chooseSize();
    })

    function chooseSize() {
        $(".size-item").each(
            function() {
                $(this).click((e) => {
                    e.preventDefault();
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


</script>


</body>


</html>
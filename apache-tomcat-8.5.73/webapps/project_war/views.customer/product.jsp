<%@ page import="model.DaoProduct" %>
<%@ page import="beans.Product" %>
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
                                        style="margin: 0 5px;" class="color-header">Th??ng
                                    b??o</span><span style="margin-right: 10px;"
                                                    class="color-header">(0)</span></a>
                                </li>
                                <li class="account"><a href="customer.html" id="wishlist-total"
                                                       title="Wish List (0)"><i class="fa fa-heart color-header"></i><span
                                        class="color-header">Danh s??ch
                                                y??u th??ch</span><span style="margin-right: 10px;"
                                                                      class="color-header">(0)</span></a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" title="My Account" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-user color-header"></i><span class="color-header">T??i
                                                kho???n</span> <span style=" font-size: 15px;"
                                                                   class="caret color-header"></span></a>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li><a href="#" class="js-login" id="Login">????ng Nh???p</a></li>
                                        <li><a href="#" class="js_register">????ng K??</a></li>
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
                                   placeholder="T??m ki???m" type="text" autocomplete="off"/>
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
                                class="btn btn-inverse btn-block btn-lg dropdown-toggle cart-dropdown-button cart-nav p-3">
                            <span class="color-header">
                                <span class="cart-title color-header m-2" style="margin-left: 10px">Gi??? h??ng - </span>254.000 ??</span>
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
                                            <td class="text-right"><strong>T???m t??nh</strong></td>
                                            <td class="text-right">254.000??</td>
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
                    <li><a href="index.jsp" style="color: white" class="parent" id="home-nav">TRANG CH???</a> </li>
                    <li style="position: relative">
                        <a href="SearchListProduct?categoryGender=Man" style="color: white" class="parent category-item" id="category-man">
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
                    ><a href="SearchListProduct?categoryGender=Woman" style="color: white" class="parent category-item" id="category-woman">N??? <i class="fas fa-caret-down"></i></a>

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
                    <li><a href="category.html" style="color: white" class="parent category-item" id="category-brand">NH??N H??NG <i class="fas fa-caret-down"></i></a></li>
                    <li><a href="/project_war/views.customer/blog.jsp" style="color: white" class="parent" id="blog-nav">BLOG</a></li>
                    <li><a href="about-us.html" style="color: white"  id="about-nav" >V??? CH??NG T??I</a></li>
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
                    <h1 style="color:#cb1c22;margin: 5px 0">Ng???ng kinh doanh</h1>
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
    margin: 18px 0;"><%=p.getPrice()%>VN??</h6>                            </li>
                            <li><h1 class="price-box price" style="float: left;color: #1a94ff;
font-size: 25px;
margin: 10px 0;"><%=p.getPrice()-(p.getPrice()*p.getSaleRate()/100)%>VN??</h1></li>
                            <li><h6 class="price-box sale" style=" float: left;background-color: #1a94ff;
    color: white;
    padding: 4px;
    margin: 12px 10px;">20% GI???M</h6></li>
                        </ul>
                    </div>
                    <hr>
                    <ul class="list-unstyled product_info">
                        <li>
                            <div class="box_code-sub">
                                <label class="title-code">M?? gi???m gi??</label>
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
                            <label>Nh??n h??ng: </label>
                            <div class="num-size">
                                <%=p.getBrand()%>
                            </div>
                        </li>

                        <li class="size-shoes" style="margin-top: 50px;">
                            <label>M??u s???c</label>
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
                            <div class="value-box"><label>S??? l?????ng:</label></div>
                            <div class="value-box set-value">
                                <input class="value" type="button" onclick="reduceValue()" value="--" />
                                <input type="text" id="number" class="changeQuantity"   value="<%=p.getQuantitySold()%>" />
                                <input class="value" type="button" onclick="incrementValue(<%=p.getTotalValue()-p.getSoleValue()%>)" value="+" />
                            </div>
                            <h6 id="products-available" class="products-available value-box"><%=DaoProduct.getInstance().getRemainProductDetail(p.getId(), mainColor)%> S???n ph???m c?? s???n</h6>
                        </li>
                        <li class="add-and-buy">
                            <div class="add-product">
                                <!-- <i class="fas fas-shopping-cart"></i> -->
                                <a href="/project/AddCart?id=<%=p.getId()%>" class="add">Th??m V??o Gi??? H??ng</a>
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
                    <li class="active"><a href="#tab-description" data-toggle="tab">M?? t???</a></li>
                    <li><a href="#tab-review" data-toggle="tab">B??nh lu???n (1)</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab-description">
                        <div class="cpt_product_description">
                            <div>
                                <p><strong>Gi??y ti??u chu???n
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
                                    <label class="control-label" for="input-review">B??nh lu???n c???a b???n</label>
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
                                    <li class='tab'><a href="#tab-latest">Nh???ng s???n ph???m v???a xem</a></li>
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
                            <p class="title-free-ship">S???n ph???m ???????c mi???n ph?? giao h??ng</p>
                        </div>
                        <div class="sales-policy-section">
                            <h1 class="title-policy">
                                Ch??nh s??ch b??n h??ng
                            </h1>
                        </div>
                        <div class="sales-policy-content">
                            <img src="./image/icon/icon_1.png" alt="" class="icon-policy">
                            <p class="title-policy-content">Mi???n ph?? giao h??ng cho ????n h??ng t??? 400K</p>
                        </div>
                        <div class="sales-policy-content">
                            <img src="./image/icon/icon_2.png" alt="" class="icon-policy">
                            <p class="title-policy-content">Cam k???t h??ng ch??nh h??ng 100%</p>
                        </div>
                        <div class="sales-policy-content">
                            <img src="./image/icon/icon_3.png" alt="" class="icon-policy">
                            <p class="title-policy-content">?????i tr??? trong v??ng 10 ng??y</p>
                        </div>
                        <div class="sales-policy-content">
                            <img src="./image/icon/icon_5.png" alt="" class="icon-policy">
                            <p class="title-policy-content">B???o h??nh theo ch??nh s??ch 4 th??ng</p>
                        </div>
                        <div class="see-more-policy">
                            <a href="#" class="see-more">Xem chi ti???t</a>
                        </div>
                    </div>

                </div>


            </div>

            <div style="display: flex; justify-content: center; width: 100%; margin-top: 30px;">
                <div>
                    <div class="mainbanner bg-white bd-rd" style="width: 280px;height: fit-content;  margin-top: 10px;">
                        <h1 class="pd-5" style="text-align: center;">S???n Ph???m N???i B???t</h1>
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
                    $("#products-available").text(dataDetail.remain + " S???n ph???m c?? s???n")
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
<%@ page import="javax.swing.*" %>

<%@ page import="model.*" %>
<%@ page import="beans.User" %>
<%@ page import="dao.user.UserDao" %>
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
<%--<c:set var="list" value="${cart.data}"/>--%>

<%--<%--%>
<%--    User user = (User) session.getAttribute("auth");--%>
<%--%>--%>
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
                                    <%Object obj = session.getAttribute("userId");if (obj != null) {
                                        String userId = (String) obj;
                                        String userName = UserDao.getInstance().getUser(userId);%>
                                    <a href="customer" title="My Account" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-user color-header"></i><span class="color-header"><%=userName%></span> <span style=" font-size: 15px;"
                                                                   class="caret color-header"></span></a>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li><a href="SignOutController" class="js-login">Đăng xuất</a></li>
                                    </ul>
                                    <%}else {%>
                                    <a href="#" title="My Account" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-user color-header"></i><span class="color-header">Tài
                                                khoản</span> <span style=" font-size: 15px;"
                                                                   class="caret color-header"></span></a>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li><a href="#" class="js-login" id="Login">Đăng Nhập</a></li>
                                        <li><a href="#" class="js_register">Đăng Ký</a></li>
                                    </ul>
                                    <%}%>
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
                        <button id="button_cart" type="button"
                                class="btn btn-inverse btn-block btn-lg dropdown-toggle cart-dropdown-button cart-nav">
                            <span
                                    class="color-header">
                                <span class="cart-title color-header" id="sum_price" style="margin-left: 10px"
                                >Giỏ hàng  </span>
                            </span>
                            <span class="value-header-product" id="header_quantity" style="margin: -6px 0 5px 10px">0</span>
                            <i class="fas fa-shopping-cart cart-icon-nav"></i>
                        </button>


<%--                        <ul class="dropdown-menu pull-right cart-dropdown-menu">--%>
<%--                            <li  class="cart-filter" style="display: grid;max-height: 328px;overflow-y: scroll;overflow-x: hidden">--%>
<%--                                <table class="table table-striped">--%>
<%--                                    <tbody id="list-cart">--%>

<%--                                    <c:forEach items="${list}" var="item">--%>
<%--                                        &lt;%&ndash;                                        <c:set var="sum" value=(${item.gettotal()} * ${item.quantitySold})/>&ndash;%&gt;--%>
<%--                                        <td class="text-center">--%>
<%--                                            <a href="ProductDetail?idProduct=${item.id}"><img src="data/imgAll/${item.avatar}.jpg" width="100px"--%>
<%--                                                                                              height="100px"></a>--%>
<%--                                        </td>--%>
<%--                                        <td class="text-left"><a href="ProductDetail?idProduct=${item.id}">${item.name}</a>--%>
<%--                                            <div class="SL-Gia">--%>
<%--                                                <p class="gia">${item.gettotal()}</p>--%>
<%--                                                <p class="SL">${item.quantitySold}</p>--%>
<%--                                            </div>--%>
<%--                                        </td>--%>
<%--                                        <td class="text-center">--%>
<%--                                            <a class="cart-remove" pid="${item.id}">--%>
<%--                                                <button class="btn btn-danger btn-xs" title="Remove" type="button"><i--%>
<%--                                                        class="fa fa-delete-left"></i> </button>--%>
<%--                                            </a>--%>
<%--                                        </td>--%>
<%--                                        </tr>--%>
<%--                                    </c:forEach>--%>
<%--                                    </tbody>--%>
<%--                                </table>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <div>--%>
<%--                                    <table class="table table-bordered">--%>
<%--                                        <tbody>--%>
<%--                                        <br>--%>
<%--                                        <tr>--%>
<%--                                            <td class="text-right"><strong>Tạm tính</strong></td>--%>
<%--                                            <td class="text-right" id="total-value"></td>--%>
<%--                                        </tr>--%>
<%--                                        </tbody>--%>
<%--                                    </table>--%>
<%--                                    <p class="text-right"> <span class="btn-viewcart"><a href="/project/Cart"><strong><i--%>
<%--                                            class="fa fa-shopping-cart"></i> View--%>
<%--                                                        Cart</strong></a></span> <span class="btn-checkout"><a--%>
<%--                                            href="checkout.html"><strong><i class="fa fa-share"></i>--%>
<%--                                                        Checkout</strong></a></span> </p>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
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
                    <li><a href="index.jsp" style="color: white" class="parent" id="home-nav">TRANG CHỦ</a> </li>
                    <li style="position: relative">
                        <a href="caterogyGender?categoryGender=Man" style="color: white" class="parent category-item" id="category-man">
                            NAM
                            <i class="fas fa-caret-down"></i>
                        </a>

                        <ul class="man-category" style="background-color: #0f6cb2; border:none; position:absolute; top: 35px;left:-15px;">
                            <li id="running-man"  class="category-product category-product-man">
                                <a href="../SearchListProduct?categoryOnNav=Running Man&pagination=1" class="link-navigation" style="color:white;background-color: #0f6cb2">Runnings</a>
                            </li>
                            <li id="slides-man"  class="category-product category-product-man">
                                <a href="../SearchListProduct?categoryOnNav=Slides Man&pagination=1" class="link-navigation" style="color:white;background-color: #0f6cb2">Slides</a>
                            </li>
                            <li id="sneakers-man"  class="category-product category-product-man">
                                <a href="../SearchListProduct?categoryOnNav=Sneakers Man&pagination=1" class="link-navigation" style="color:white;background-color: #0f6cb2">Sneakers</a>
                            </li>
                            <li id="skateboard-man"  class="category-product category-product-man">
                                <a href="../SearchListProduct?categoryOnNav=Skateboard Man&pagination=1" class="link-navigation" style="color:white;background-color: #0f6cb2">SkateBoard</a>
                            </li>
                            <li id="trainers-man"  class="category-product category-product-man">
                                <a href="../SearchListProduct?categoryOnNav=Trainers Man&pagination=1" class="link-navigation" style="color:white;background-color: #0f6cb2">Trainers</a>
                            </li>
                        </ul>

                    </li>
                    <li style="position: relative"
                    ><a href="caterogyGender?categoryGender=Woman" style="color: white" class="parent category-item" id="category-woman">NỮ <i class="fas fa-caret-down"></i></a>

                        <ul class="woman-category" style="background-color: #0f6cb2; border:none; position:absolute; top: 35px;left: -15px">
                            <li id="running-woman"  class="category-product category-product-woman">
                                <a href="../SearchListProduct?category=Running Woman&categoryGender=description&pagination=1" class="link-navigation" style="color:white;background-color: #0f6cb2">Running</a>
                            </li>
                            </li>
                            <li id="slides-woman"  class="category-product category-product-woman">
                                <a href="../SearchListProduct?category=Slides Woman&categoryGender=description&pagination=1" class="link-navigation" style="color:white;background-color: #0f6cb2">Slides</a>
                            </li>
                            </li>
                            <li id="sneakers-woman"  class="category-product category-product-woman">
                                <a href="../SearchListProduct?category=Sneakers Woman&categoryGender=description&pagination=1" class="link-navigation" style="color:white;background-color: #0f6cb2">Sneakers</a>
                            </li>
                            </li>
                            <li id="skateboard-woman"  class="category-product category-product-woman">
                                <a href="../SearchListProduct?category=Skateboard Woman&categoryGender=description&pagination=1" class="link-navigation" style="color:white;background-color: #0f6cb2">Skateboard</a>
                            </li>
                            <li id="trainers-woman"  class="category-product category-product-woman">
                                <a href="../SearchListProduct?categoryOnNav=Trainers Woman&pagination=1" class="link-navigation" style="color:white;background-color: #0f6cb2">Trainers</a>
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
                            <img onclick="location.href='../SearchListProduct?brand=ASICS&pagination=1'" src="../image/brand/logo-brand-01.svg">
                            <img onclick="location.href='../SearchListProduct?brand=ADIDAS'" src="../image/brand/logo-brand-02.svg">
                            <img onclick="location.href='../SearchListProduct?category=VANS&categoryGender=brand&pagination=1'" src="../image/brand/logo-brand-03.jpg">
                            <img onclick="location.href='../SearchListProduct?category=NIKE&categoryGender=brand&pagination=1'" src="../image/brand/logo-brand-04.svg">
                            <img onclick="location.href='../SearchListProduct?category=REEBOK&categoryGender=brand&pagination=1'" src="../image/brand/logo-brand-05.svg">
                            <img onclick="location.href='../SearchListProduct?category=NEW BALANCE&categoryGender=brand&pagination=1'" src="../image/brand/logo-brand-06.svg">
                            <img onclick="location.href='../SearchListProduct?category=ON RUNNING&categoryGender=brand&pagination=1'" src="../image/brand/logo-brand-07.jpg">
                            <img onclick="location.href='../SearchListProduct?category=UNDER ARMOUR&categoryGender=brand&pagination=1'" src="../image/brand/logo-brand-08.svg">
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </nav>
</header>

<script>
    $(function() {
        $("#button_cart").click(()=>{
            // to controller
            window.location.href="GetProductInCart"
        })
    })

    // lấy số sản phẩm trên header
    $(function() {
                        $.ajax({
                            url: "GetAmountProductInHeader",
                            method: "GET",
                            success: function (data) {
                                $("#header_quantity").text(data)
                            },
                            error: function (data) {
                                if (data.status === 404)
                                    alert("Xoa That Bai");
                            }
                        })
    })
</script>
<%--<script>--%>
<%--    $(function() {--%>
<%--                $.ajax({--%>
<%--                    url: "/project/Cart-remove",--%>
<%--                    method: "POST",--%>
<%--                    data: {--%>
<%--                        id: id--%>
<%--                    },--%>
<%--                    success: function (data) {--%>
<%--                        tr.remove();--%>
<%--                    },--%>
<%--                    error: function (data) {--%>
<%--                        if (data.status === 404)--%>
<%--                            alert("Xoa That Bai");--%>
<%--                    }--%>
<%--                })--%>
<%--    })--%>
<%--</script>--%>
<script>
    // $(document).ready(function () {
    //     $(".cart-remove").click(function () {
    //         var id = $(this).attr("pid");
    //         tr = $(this).closest("tr");
    //         console.log(id);
    //         $.ajax({
    //             url: "/project/Cart-remove",
    //             method: "POST",
    //             data: {
    //                 id: id
    //             },
    //             success: function (data) {
    //                 tr.remove();
    //             },
    //             error: function (data) {
    //                 if (data.status === 404)
    //                     alert("Xoa That Bai");
    //             }
    //         })
    //     });
    //     $(function (){
    //         let value = 0;
    //         let num = 0;
    //         let i = 0;
    //         while(true){
    //             let child = $("#list-cart .SL-Gia:nth-child("+ i++ +")");
    //             if(child.length!==0){
    //                 for(let j = 0;j<child.length;j++){
    //                     let price =Number(child[j].children[0].innerHTML);
    //                     let quantity = Number(child[j].children[1].innerHTML);
    //                     // console.log(typeof price + price);
    //                     value += price;
    //                     num += quantity;
    //                 }
    //                 // console.log(value);
    //                 value = Math.round(value)
    //                 break;
    //             }else if(i===10) break;
    //         }
    //         $("#total-value").text(value);
    //         $("#total_price").text(value +"$");
    //         $("#header_quantity").text(num);
    //         $("#sum_price").text("Giỏ Hàng - "+value+"$");
    //     });
    // })

    // function excuteData() {
<%--        <%--%>
<%--            String id = "";--%>
<%--            if(user == null) {--%>
<%--        %>--%>
<%--        let value= "";--%>
<%--        value +="<li>"--%>
<%--        value += "                                                    <div href=\".jsp\" class=\"minicart-item\">";--%>
<%--        value += "                                                        <div class=\"left-info\">";--%>
<%--        value += "                                                            <div class=\"product-title\"><a  class=\"product-name\">vui lòng đăng nhập để mở chức năng giỏ hàng<\/a><\/div>";--%>
<%--        value += "                                                        <\/div>";--%>
<%--        value += "                                                    <\/div>";--%>
<%--        value += "                                                <\/li>";--%>
<%--        document.getElementById("products-cart").innerHTML=strVar;--%>
<%--        return;--%>
<%--        <%}else{--%>
<%--           id = user.getId();--%>
<%--        }%>--%>


    // }
</script>

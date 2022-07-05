<%@ page import="javax.swing.*" %>

<%@ page import="model.*" %>
<%@ page import="beans.User" %>
<%@ page import="dao.user.UserDao" %>
<%@ page import="beans.Brand" %>
<%@ page import="dao.product.brand.DaoProductBrand" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.Category" %>
<%@ page import="dao.product.category.DaoCategory" %>

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
                                <li class="account"><a href="home" class="notify"><i
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
                                <a href="home"><img src="image/logo.png" title="E-Commerce" alt="E-Commerce"
                                                          class="logo-header" /></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="text-center contain-search">
                    <div class="contain-search-product-popular">
                        <form id="form-header" class="search-product" action="SearchListProduct?pagination=1" method="post">
                            <input name="nameProduct" id="input-search"
                                   class="input-text-search-top"
                                   placeholder="Tìm kiếm" type="text" autocomplete="off"/>
                            <button type="submit" class="search-product-top" id="button-search-header"><i class="fa fa-search"></i></button>
                        </form>
                        <div class="contain-search-popular">

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
                    <li><a href="home" style="color: white" class="parent" id="home-nav">TRANG CHỦ</a> </li>
                    <li style="position: relative">
                        <a href="caterogyGender?categoryGender=Man" style="color: white" class="parent category-item" id="category-man">
                            NAM
                            <i class="fas fa-caret-down"></i>
                        </a>

                        <ul class="man-category" style="background-color: #0f6cb2; border:none; position:absolute; top: 35px;left:-15px;">
                            <%List<Category> listCategoryMan = DaoCategory.getInstance().getListCategoryOnNav("man");%>
                            <%for (Category category: listCategoryMan) {%>
                            <li class="category-product category-product-man">
                                <a href=`SearchListProduct?category=<%=category.getId()%>&gender=Man&pagination=1` class="link-navigation" style="color:white;background-color: #0f6cb2"><%=category.getName()%></a>
                            </li>
                            <%}%>
                        </ul>

                    </li>
                    <li style="position: relative"><a href="caterogyGender?categoryGender=Woman" style="color: white" class="parent category-item" id="category-woman">NỮ <i class="fas fa-caret-down"></i></a>

                        <ul class="woman-category" style="background-color: #0f6cb2; border:none; position:absolute; top: 35px;left: -15px">
                            <%List<Category> listCategoryWoman = DaoCategory.getInstance().getListCategoryOnNav("woman");%>
                            <%for (Category category: listCategoryWoman) {%>
                            <li id="running-woman"  class="category-product category-product-woman">
                                <a href=`SearchListProduct?category=<%=category.getId()%>&gender=Man&pagination=1` class="link-navigation" style="color:white;background-color: #0f6cb2"><%=category.getName()%></a>
                            </li>
                            <%}%>
                        </ul>
                    </li>
                    <li><a style="color: white" class="parent category-item" id="category-brand">NHÃN HÀNG <i class="fas fa-caret-down"></i></a></li>
                    <li><a href="blog" style="color: white" class="parent" id="blog-nav">BLOG</a></li>
                    <li><a href="about" style="color: white"  id="about-nav" >VỀ CHÚNG TÔI</a></li>
                </ul>
                <div class="nav-detail-info">

                    <div class="item-nav-detail-info" id="item-category-brand">
                        <div class="contain-brand" >

                            <%
                                ArrayList<Brand> listBrand = DaoProductBrand.getInstance().getBrands();
                                for (Brand brand: listBrand) {%>
                                <img onclick="location.href='SearchListProduct?brand=<%=brand.getId()%>&pagination=1'" src="upload/brand/<%=brand.getImg()%>">
                            <%}%>
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

<script>
    $(function () {
        $("#input-search").on("input", function(e) {
            let word = $(this).val();
            $.ajax({
                url: "SearchHintProductInHeader?wordSearchHeader="+word,
                method: "GET",
                success: function (data) {
                    $(".contain-search-popular").empty()
                    if (data==""){
                        return
                    }
                    let arrHint = JSON.parse(data)
                    arrHint.forEach((value) => {
                            $(".contain-search-popular")
                                .append(`<span onclick="location.href='ProductDetail?idProduct=`+value.id+`'">`+value.name+`<span><br/>`)

                    })
                },
                error: function (data) {

                }
            })
        });
    })

</script>
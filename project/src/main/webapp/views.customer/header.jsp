<%@ page import="javax.swing.*" %>

<%@ page import="beans.User" %>
<%@ page import="dao.user.UserDao" %>
<%@ page import="beans.Brand" %>
<%@ page import="dao.product.brand.DaoProductBrand" %>
<%@ page import="dao.user.DaoUserAdmin" %>
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
<style>
    .value-header-product {
        background-color: yellow;
        color: #1f507a;
        border-radius: 100%;
        font-size: 19px;
        margin: 10px;
        padding: 0 8px;
    }
</style>

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
                                        <i class="fa fa-user color-header"></i><span class="color-header">
                                            <% Object isLogin = request.getSession().getAttribute("userId");
                                            if (isLogin != null) {
                                            String idCustomer = (String) isLogin;%>
                                                <%= DaoUserAdmin.getInstance().getUserName(idCustomer) %>
                                            <%}else {%>
                                                Tài khoản
                                            <%}%>
                                    </span> <span style=" font-size: 15px;"
                                                                   class="caret color-header"></span></a>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <%
                                        if (isLogin == null){%>
                                        <li><a href="#" class="js-login" id="Login">Đăng Nhập</a></li>
                                        <li><a href="#" class="js_register">Đăng Ký</a></li>
                                        <%}else {%>
                                        <li><a href="<%=request.getContextPath()%>/customer" class="js-login">Cá nhân</a></li>
                                        <li><a id="sign_out" class="js-login">Đăng xuất</a></li>
                                        <%}%>
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
                            <span class="value-header-product" id="header_quantity">0</span>
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
                            <%ArrayList<Category> listCategoryMan = DaoCategory.getInstance().getListCategoryOnNav("man");%>
                            <%for (Category category: listCategoryMan) {%>
                            <li class="category-product category-product-man">
                                <a href="SearchListProduct?category=<%=category.getId()%>&gender=Man&pagination=1" class="link-navigation" data-id="<%=category.getId()%>" style="color:white;background-color: #0f6cb2"><%=category.getName()%></a>
                            </li>
                            <%}%>
                        </ul>

                    </li>
                    <li style="position: relative"><a href="caterogyGender?categoryGender=Woman" style="color: white" class="parent category-item" id="category-woman">NỮ <i class="fas fa-caret-down"></i></a>

                        <ul class="woman-category" style="background-color: #0f6cb2; border:none; position:absolute; top: 35px;left: -15px">
                            <%ArrayList<Category> listCategoryWoman = DaoCategory.getInstance().getListCategoryOnNav("woman");%>
                            <%for (Category category: listCategoryWoman) {%>
                            <li id="running-woman"  class="category-product category-product-woman">
                                <a href="SearchListProduct?category=<%=category.getId()%>&gender=Woman&pagination=1" class="link-navigation" data-id="<%=category.getId()%>" style="color:white;background-color: #0f6cb2"><%=category.getName()%></a>
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
        currentLocation = window.location.toString()
        if (currentLocation.includes("home")) {
            $("#home-nav").addClass("active-nav")
        }
        else if (currentLocation.includes("gender=Man")) {
            $("#category-man").addClass("active-nav")
        }
        else if (currentLocation.includes("gender=Woman")) {
            $("#category-woman").addClass("active-nav")
        }
        else if (currentLocation.includes("blog")) {
            $("#blog-nav").addClass("active-nav")
        }
        else if (currentLocation.includes("about")) {
            $("#about-nav").addClass("active-nav")
        }
    })


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

<script>
    $(function(){
        $(".link-navigation").each(function(){
            let url = window.location.href
            let idCategory = $(this).data("id")
            if (url.includes("category="+idCategory)) {
                $(this).css("background-color", "white")
                $(this).css("color", "black")
            }
        })
    })
</script>
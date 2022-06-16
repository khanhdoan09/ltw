<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: khanh
  Date: 12/6/2021
  Time: 12:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@ page import="databaseConnection.DatabaseConnection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="model.*" %>
<%@ page import="model.Admin.DaoProductAdmin" %>
<%@ page import="beans.Product" %>



<html lang="en">

<head>
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
    <script src="javascript/common.js" type="text/javascript"></script>
    <script src="javascript/global.js" type="text/javascript"></script>
    <script src="owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
    <link rel="shortcut icon" href="image/logo.png" />

    <link rel="stylesheet" href="css/dat-css.css">
    <link rel="stylesheet" href="css/khanh-css.css">
    <link rel="stylesheet" href="css/hung-css.css">
    <script src="javascript/khanh-js.js"></script>
</head>

<body class="category col-2 left-col">
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
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 col-xs-12 header-right header-nav-right">

                    <div id="cart" class="btn-group btn-block" style="margin: 0; padding: 0;">
                        <button type="button"
                                class="btn btn-inverse btn-block btn-lg dropdown-toggle cart-dropdown-button cart-nav p-3">
                            <span class="color-header">
                                <span class="cart-title color-header m-2" style="margin-left: 10px">Giỏ hàng - </span>254.000 Đ</span>
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
                                            <td class="text-right"><strong>Tạm tính</strong></td>
                                            <td class="text-right">254.000Đ</td>
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
                    <li><a href="/project_war/views.customer/blog.jsp" style="color: white" class="parent" id="home-nav">TRANG CHỦ</a> </li>
                    <li style="position: relative">
                        <a href="caterogyGender?categoryGender=Man" style="color: white" class="parent category-item" id="category-man">
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
                    ><a href="SearchListProduct?categoryGender=Woman" style="color: white" class="parent category-item" id="category-woman">NỮ <i class="fas fa-caret-down"></i></a>

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
                    <li><a href="category.html" style="color: white" class="parent category-item" id="category-brand">NHÃN HÀNG <i class="fas fa-caret-down"></i></a></li>
                    <li><a href="/project_war/views.customer/blog.jsp" style="color: white" class="parent" id="blog-nav">BLOG</a></li>
                    <li><a href="about-us.html" style="color: white"  id="about-nav" >VỀ CHÚNG TÔI</a></li>
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
<div class="container-category">

    <div class="row contain-category">
        <button class="toggle-filter-search">
            <i class="fas fa-sliders-h"></i>
        </button>
        <div id="" class="col-sm-3 contain-filter-search" style="margin-right: 90px;">
            <%
                request.setAttribute("TypeCategory", request.getAttribute("TypeCategory"));
                request.setAttribute("ValueCategory", request.getAttribute("ValueCategory"));
            %>
            <form name="filter-panel" id="form-filter-search" class="panel panel-default filter"
                  action="SearchListProduct?<%=request.getAttribute("TypeCategory")%>=<%=request.getAttribute("ValueCategory")%>&"
                  method="post">

                <div class="filter-block">
                    <div class="list-group">
                        <a class="list-group-item">Brands</a>
                        <div class="list-group-item">
                            <div class="contain-dropdown-item filter-search" id="checkboxBrandFilter">
                                <%!
                                    ArrayList<String> brandChecked;
                                    String[] objFilterBrand;
                                %>
                                <!-- phai tach gan gia tri brandChecked ra thi request khong bao loi-->
                                <%
                                    objFilterBrand = request.getParameterValues("brand");
                                    if (objFilterBrand != null)
                                        brandChecked = new ArrayList<String>(Arrays.asList(objFilterBrand));
                                %>

                                <%!
                                    public String isBrandChecked(String brand) {
                                        if (objFilterBrand != null) {
                                            if (brandChecked.contains(brand))
                                                return "checked";
                                        }
                                        return "";
                                    }%>
                                <%List<String> brands = DaoProductAdmin.getInstance().getListBrand();
                                for(String brand: brands){%>
                                <label class="checkbox-filter-search">
                                    <input name="filterBrand" type="checkbox"
                                           value="<%=brand%>"<%=isBrandChecked(brand)%> />
                                    <%=brand%></label>
                                <%}%>
                            </div>
                        </div>
                        <a class="list-group-item">Sizes</a>
                        <%!
                            ArrayList<String> sizeChecked=new ArrayList<String>();
                            String[] objFilterSize;
                        %>
                        <%
                            objFilterSize = request.getParameterValues("size");
                            if (objFilterSize != null)
                                sizeChecked = new ArrayList<String>(Arrays.asList(objFilterSize));
                        %>
                        <%!
                            public String isSizeChecked(String size) {
                                if (objFilterSize != null) {
                                    if (sizeChecked.contains(size))
                                        return "checked";
                                }
                                return "";
                            }
                        %>
                        <div class="list-group-item">
                            <div class="contain-dropdown-size filter-search" id="checkbox-filter-size">
                                <label class="checkbox-filter-search">
                                    <input name="size" type="checkbox" value="33" <%=isSizeChecked("33")%>/>
                                    33 </label>
                                <label class="checkbox-filter-search">
                                    <input name="size" type="checkbox" value="34" <%=isSizeChecked("34")%>/>
                                    34 </label>
                                <label class="checkbox-filter-search">
                                    <input name="size" type="checkbox" value="35" <%=isSizeChecked("35")%>/>
                                    35 </label>
                                <label class="checkbox-filter-search">
                                    <input name="size" type="checkbox" value="36" <%=isSizeChecked("36")%>/>
                                    36 </label>
                                <label class="checkbox-filter-search">
                                    <input name="size" type="checkbox" value="37" <%=isSizeChecked("37")%>/>
                                    37 </label>
                                <label class="checkbox-filter-search">
                                    <input name="size" type="checkbox" value="38" <%=isSizeChecked("38")%>/>
                                    38 </label>
                                <label class="checkbox-filter-search">
                                    <input name="size" type="checkbox" value="39" <%=isSizeChecked("39")%>/>
                                    39 </label>
                                <label class="checkbox-filter-search">
                                    <input name="size" type="checkbox" value="40" <%=isSizeChecked("40")%>/>
                                    40 </label>
                            </div>
                        </div>
                        <a class="list-group-item">Rates</a>
                        <div class="list-group-item">
                            <div id="filter-group2" class="contain-rate-search" id="checkboxStarFilter">
                                <!-- phai tach gan gia tri brandChecked ra thi request khong bao loi-->
                                <%!
                                    ArrayList<String> starChecked;
                                    String[] objFilterStar;
                                %>
                                <%
                                    objFilterStar = request.getParameterValues("star");
                                    if (objFilterStar != null)
                                        starChecked = new ArrayList<String>(Arrays.asList(objFilterStar));
                                %>

                                <%!
                                    public String isStarChecked(String star) {
                                        if (objFilterStar != null) {
                                            if (starChecked.contains(star))
                                                return "checked";
                                        }
                                        return "";
                                    }
                                    public String colorLabelStar(String star) {
                                        if (!star.equals(""))
                                            return "style=\"color: yellow\"";
                                        return "";
                                    }
                                %>


                                <label class="rate-search" id="label-5-star">
                                    <input type="checkbox" name="filter-star-rate"
                                           value="5" class="input-star" id="filter-star-5" <%=isStarChecked("5")%>
                                           style="display: none"/>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("5"))%>></i>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("5"))%>></i>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("5"))%>></i>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("5"))%>></i>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("5"))%>></i>
                                    <span style="margin-left: 5px">From 5 stars</span>
                                </label>
                                <label class="rate-search" id="label-4-star">
                                    <input type="checkbox" name="filter-star-rate"
                                           value="4" class="input-star" id="filter-star-4" <%=isStarChecked("4")%>
                                           style="display: none"/>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("4"))%>></i>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("4"))%>></i>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("4"))%>></i>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("4"))%>></i>
                                    <span style="margin-left: 5px">From 4 stars</span>
                                </label>
                                <label class="rate-search" id="label-3-star">
                                    <input type="checkbox" name="filter-star-rate"
                                           value="3" class="input-star" id="filter-star-3" <%=isStarChecked("3")%>
                                           style="display: none"/>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("3"))%>></i>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("3"))%>></i>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("3"))%>></i>
                                    <span style="margin-left: 5px">From 3 stars</span>
                                </label>
                            </div>
                        </div>
                        <a class="list-group-item">Prices</a>
                        <div class="list-group-item">
                            <div id="filter-group3" class="contain-price-search">
                                <div class="price-search-highest-lowest" id="checkboxPriceOrderFilter">
                                    <%!
                                        ArrayList<String> highestLowestChecked;
                                        String[] objFilterHighestLowest;
                                    %>
                                    <!-- phai tach gan gia tri brandChecked ra thi request khong bao loi-->
                                    <%
                                        objFilterHighestLowest = request.getParameterValues("highestLowest");
                                        if (objFilterHighestLowest != null)
                                            highestLowestChecked = new ArrayList<String>(Arrays.asList(objFilterHighestLowest));
                                    %>

                                    <%!
                                        public String isHighestLowestChecked(String highestLowest) {
                                            if (objFilterHighestLowest != null) {
                                                if (highestLowestChecked.contains(highestLowest))
                                                    return "checked";
                                            }
                                            return "";
                                        }%>
                                    <input type="radio" id="price-search-highest" name="price-search-radio"
                                           value="DESC" <%=isHighestLowestChecked("DESC")%>/>
                                    <label for="price-search-highest">From high to low</label>
                                    <input type="radio" id="price-search-lowest" name="price-search-radio"
                                           value="ASC" <%=isHighestLowestChecked("ASC")%>/>
                                    <label for="price-search-lowest">From low to high</label>
                                </div>

                                <div class="contain-filter-search-range" id="checkboxPriceRangeFilter">
                                    <!-- phai tach gan gia tri brandChecked ra thi request khong bao loi-->
                                    <%! String objFilterUnderPrice;
                                        String objFilterFromPrice;
                                        String objFilterUpPrice;
                                    %>
                                    <%
                                        objFilterUnderPrice = request.getParameter("underPrice");
                                        objFilterFromPrice = request.getParameter("fromPrice");
                                        objFilterUpPrice = request.getParameter("upPrice");
                                    %>

                                    <%!
                                        public String isUnderPriceChecked() {
                                            if (objFilterUnderPrice != null)
                                                return "checked";
                                            return "";
                                        }
                                        public String isFromPriceChecked() {
                                            if (objFilterFromPrice != null)
                                                return "checked";
                                            return "";
                                        }
                                        public String isToUpPriceChecked() {
                                            if (objFilterUpPrice != null)
                                                return "checked";
                                            return "";
                                        }
                                    %>
                                    <%!
                                        public String colorLabelInputPrice(String isCheck) {
                                            if (isCheck != null)
                                                return "style=\"background-color: #5f2525\"";
                                            return "";
                                        }
                                    %>
                                    <label class="price-search" id="price-search-01"
                                           for="hidden-checkbox-price-1" <%=colorLabelInputPrice(objFilterUnderPrice)%>>
                                        Under 50$
                                    </label>
                                    <input type="checkbox" value="50" class="hidden-checkbox-price"
                                           id="hidden-checkbox-price-1"  <%=isUnderPriceChecked()%>
                                           style="display: none"/>
                                    <label class="price-search" id="price-search-02"
                                           for="hidden-checkbox-price-2" <%=colorLabelInputPrice(objFilterFromPrice)%>>
                                        From 50$ to 150$
                                    </label>
                                    <input type="checkbox" value="50&&150"
                                           class="hidden-checkbox-price"
                                           id="hidden-checkbox-price-2" <%=isFromPriceChecked()%>
                                           style="display: none"/>
                                    <label class="price-search" id="price-search-03"
                                           for="hidden-checkbox-price-3" <%=colorLabelInputPrice(objFilterUpPrice)%>>
                                        Up 150$
                                    </label>
                                    <input type="checkbox" value="150" class="hidden-checkbox-price"
                                           id="hidden-checkbox-price-3"  <%=isToUpPriceChecked()%>
                                           style="display: none"/>

                                </div>


                                <div class="min-max-price-search" id="checkboxPriceInputFilter">
                                    <%!
                                        ArrayList<String> fromInputPriceChecked;
                                        ArrayList<String> toInputPriceChecked;
                                    %>
                                    <!-- phai tach gan gia tri brandChecked ra thi request khong bao loi-->
                                    <%! String objFilterFromInputPrice;
                                        String objFilterToInputPrice;
                                    %>
                                    <%
                                        objFilterFromInputPrice = request.getParameter("fromInputPrice");
                                        objFilterToInputPrice = request.getParameter("toInputPrice");
                                    %>

                                    <%!
                                        public String isFromInputPriceChecked() {
                                            if (objFilterFromInputPrice != null)
                                                return objFilterFromInputPrice;
                                            return "";
                                        }
                                        public String isToInputPriceChecked() {
                                            if (objFilterToInputPrice != null)
                                                return objFilterToInputPrice;
                                            return "";
                                        }%>
                                    <input type="text" name="input-range-filter-price"
                                           value="<%=isFromInputPriceChecked()%>" class="min-search"
                                           placeholder="Từ" id="inputFilterPriceFrom">
                                    <p style="font-size: 50px; margin: 0 10px">-</p>
                                    <input type="text" name="input-range-filter-price"
                                           value="<%=isToInputPriceChecked()%>" class="max-search"
                                           placeholder="Đến" id="inputFilterPriceTo">
                                </div>
                                <%
                                    Object err = request.getAttribute("errorInputPrice");
                                    if (err != null) {
                                %>
                                <%="<h1 style='display: block; color: red; margin: 10px 0'>" + err.toString() + "</h1>"%>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer text-right">
                        <input value="Tìm kiếm" type="submit" name="submit-filter-panel" id="button-filter"
                               class="btn btn-primary btn-refine-search">

                    </div>
                </div>
            </form>


        </div>


        <div id="content" class="content-about" style="display:flex; flex-wrap:wrap; padding-top: 30px">


            <%
                int pagination = 1;
                Object objPagination = request.getAttribute("pagination");
                if (objPagination != null) {
                    pagination = Integer.parseInt(objPagination.toString());
                }
                Object objCategory = request.getAttribute("categoryProduct");
                List<Product> list = (List<Product>) objCategory;
                if (list != null) {
                    Map<String, ArrayList<String>> map = DaoLinkImage.getInstance().getAll();
                    for (int i = 0; i < list.size(); i++) {
                        Product p = list.get(i);
            %>

            <div class=" product-layout product-grid col-lg-4 col-md-5 col-sm-6 col-xs-10" style="height: fit-content">
                <div class="product-thumb">
                    <div class="image product-imageblock">
                        <a href="ProductDetail?idProduct=<%=p.getId()%>">
                            <div class="related-product-sale">
                                <h5 style='margin-top: 10px'>-<%=p.getSaleRate()%>%</h5>
                            </div>
                            <img src="data/imgAll/upload/product/<%=p.getAvatar()%>.jpg" alt="lorem ippsum dolor dummy"
                                 title="lorem ippsum dolor dummy" class="img-responsive"/> </a>
                        <div class="button-group">
                            <button type="button" class="wishlist" data-toggle="tooltip" title="Thêm vào yêu thích">
                                <i class="fas fa-heart"></i></button>
                            <button type="button" class="addtocart-btn">Mua ngay</button>
                            <button type="button" class="compare" data-toggle="tooltip" title="Thêm vào giỏ hàng">
                                <a href="/project/AddCart?id=<%=p.getId()%>"><i class="fas fa-shopping-cart"></i></a>
                            </button>
                        </div>
                    </div>
                    <div class="caption product-detail">
                        <%
                            int active = p.getActive();
                            if (active == 0) {
                        %>
                        <h1 style="color:#cb1c22;margin: 5px 0">Ngừng kinh doanh</h1>
                        <%}%>
                        <h2 id="\brandCategory123" style='margin-top: 5px; text-transform: uppercase'>
                            <%=p.getBrand()%>
                        </h2>
                        <h4 class="product-name">
                            <a id="nameCategory" href="product.html" title="lorem ippsum dolor dummy"
                               style='text-transform: capitalize'>

                                <%=p.getName()%>


                            </a></h4>
                        <p class="product-desc"> More room to move. With 80GB or 160GB of storage and up to 40 hours
                            of battery life, the new lorem ippsum dolor dummy lets you enjoy up to 40,000 songs or
                            up to 200 hours of video or any combination wherever you go. Cover
                            Flow. Browse through your music collection by flipping..</p>
                        <p id="priceCategory123" class="price product-price">
                            <span class="price-old"
                                  style='margin-right: 10px'>

                                <%=p.getPrice()%>

                                  </span>
                            <%=p.getPrice() - (p.getPrice() * p.getSaleRate() / 100)%>
                            <span class="price-tax">Ex Tax: $100.00</span>
                        </p>
                        <div class="rating"><span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i
                                class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                    class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i
                                    class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i
                                    class="fa fa-star-o fa-stack-2x"></i></span></div>
                    </div>
                    <div class="button-group">
                        <button type="button" class="wishlist" data-toggle="tooltip" title="Thêm vào yêu thích"><i
                                class="fas fa-heart"></i></button>
                        <button type="button" class="addtocart-btn"><%=p.getId()%></button>
                        <button type="button" class="compare" data-toggle="tooltip" title="Thêm vào giỏ hàng">
                            <a href="/project/AddCart?id=<%=p.getId()%>"><i class="fas fa-shopping-cart"></i></a>
                        </button>
                    </div>
                </div>
            </div>
            <%}%>
            <div class="category-page-wrapper">
                <div class="pagination-inner" id="tessss">
                    <ul class="pagination">
                        <%
                            int totalNumber = (int) request.getAttribute("TotalNumberProduct");
                            double d = totalNumber;
                            int lengthPagination = (int) Math.ceil(d / 9);%>
                        <li>
                            <a id="left-page"
                               href="
                                   <%int pagInt = pagination<=1 ? 1: pagination-1;
                                   String pagStr = request.getQueryString().substring(0, request.getQueryString().lastIndexOf("pagination"));
                                   pagStr += "pagination=" + pagInt;
                                   %>
                                   <%=URLDecoder.decode("SearchListProduct?"+pagStr, "UTF-8")%>">&lt;
                            </a>

                        </li>
                        <li>
                            <a id="right-page"
                               href="
                                   <%int pagIntRight = pagination >= lengthPagination ? lengthPagination: pagination+1;
                                   String pagStrRight = request.getQueryString().substring(0, request.getQueryString().lastIndexOf("pagination"));
                                   pagStrRight += "pagination=" + pagIntRight;
                                   %>
                                   <%=URLDecoder.decode("SearchListProduct?"+pagStrRight, "UTF-8")%>">&gt;
                            </a>
                        </li>
                        <span>Page</span>
                        <select id="selectPagination" onchange="location = this.value;">

                            <%=URLDecoder.decode("SearchListProduct?" + pagStrRight, "UTF-8")%>">&gt;
                            <%
                                for (int j = 1; j <= lengthPagination; j++) {
                                    pagStr = request.getQueryString().substring(0, request.getQueryString().lastIndexOf("pagination"));
                                    pagStr += "pagination=" + j;
                            %>
                            <option value="<%=URLDecoder.decode("SearchListProduct?"+pagStr, "UTF-8")%>"
                                    <% // current pagination
                                        if (j == pagination) {%><%="selected"%> <%}%>><%=j%>
                            </option>
                            <%}%>
                        </select> <span> of <%if (list != null)%><%=lengthPagination%></span>
                        <%}%>
                    </ul>
                </div>
            </div>
    </div>
</div>
<%@include file="footer_login_message.jsp"%>
<script src="javascript/hung-js.js"></script>

</body>

</html>
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
<%@ page import="model.Product" %>
<%@ page import="model.DaoLinkImage" %>
<%@ page import="model.DaoProduct" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLDecoder" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html lang="en">

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
    <link rel="stylesheet" href="css/dat-css.css">
    <link rel="stylesheet" href="css/khanh-css.css" type="text/css">
    <script src="javascript/khanh-js.js" type="text/javascript"></script>


</head>

<body class="category col-2 left-col">
<%@include file="/header.jsp" %>
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
            <%=request.getAttribute("sql")%>

            <form name="filter-panel" id="form-filter-search" class="panel panel-default filter" action="ServletTest123?<%=request.getAttribute("TypeCategory")%>=<%=request.getAttribute("ValueCategory")%>&"
                  method="post">
                <%
                    request.setAttribute("sql", request.getAttribute("sql"));
                %>

                <div class="filter-block">
                    <div class="list-group">
                        <a class="list-group-item">Brands</a>
                        <div class="list-group-item">
                            <div class="contain-dropdown-item filter-search" id="checkboxBrandFilter">
                                <%!ArrayList<String> brandChecked;
                                String[] objFilterBrand; %>
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
                                <label class="checkbox-filter-search">
                                    <input name="filterBrand" type="checkbox"
                                           value="ASICS"<%=isBrandChecked("ASICS")%> />
                                    ASICS</label>
                                <label class="checkbox-filter-search">
                                    <input name="filterBrand" type="checkbox"
                                           value="ADIDAS" <%=isBrandChecked("ADIDAS")%> />
                                    ADIDAS</label>
                                <label class="checkbox-filter-search">
                                    <input name="filterBrand" type="checkbox" value="VANS" <%=isBrandChecked("VANS")%>/>
                                    VANS</label>
                                <label class="checkbox-filter-search">
                                    <input name="filterBrand" type="checkbox" value="NIKE" <%=isBrandChecked("NIKE")%>/>
                                    NIKE</label>
                                <label class="checkbox-filter-search">
                                    <input name="filterBrand" type="checkbox"
                                           value="Reebok" <%=isBrandChecked("Reebok")%>/>
                                    Reebok</label>
                                <label class="checkbox-filter-search">
                                    <input name="filterBrand" type="checkbox"
                                           value="NEW BALANCE" <%=isBrandChecked("NEW BALANCE")%>/>
                                    NEW BALANCE</label>
                                <label class="checkbox-filter-search">
                                    <input name="filterBrand" type="checkbox"
                                           value="ON RUNNING" <%=isBrandChecked("ON RUNNING")%>/>
                                    On RUNNING</label>
                                <label class="checkbox-filter-search">
                                    <input name="filterBrand" type="checkbox"
                                           value="UNDER ARMOUR" <%=isBrandChecked("UNDER ARMOUR")%>/>
                                    UNDER ARMOUR</label>
                            </div>
                        </div>
                        <a class="list-group-item">Sizes</a>
                        <div class="list-group-item">
                            <div class="contain-dropdown-size filter-search">

                            </div>
                        </div>
                        <a class="list-group-item">Rates</a>
                        <div class="list-group-item">
                            <div id="filter-group2" class="contain-rate-search" id="checkboxStarFilter">
                                <!-- phai tach gan gia tri brandChecked ra thi request khong bao loi-->
                                <%!ArrayList<String> starChecked;
                                    String[] objFilterStar;%>
                                <%
                                    objFilterStar = request.getParameterValues("star");
                                    if (objFilterStar != null)
                                        starChecked = new ArrayList<String>(Arrays.asList(objFilterStar));
                                %>

                                <%!
                                    public String isStarChecked(String star) {
                                        if (objFilterStar!= null) {
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
                                           value="5" class="input-star" id="filter-star-5" <%=isStarChecked("5")%> style="display: none"/>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("5"))%>></i>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("5"))%>></i>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("5"))%>></i>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("5"))%>></i>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("5"))%>></i>
                                    <span style="margin-left: 5px">From 5 stars</span>
                                </label>
                                <label class="rate-search" id="label-4-star">
                                    <input type="checkbox" name="filter-star-rate"
                                           value="4" class="input-star" id="filter-star-4" <%=isStarChecked("4")%> style="display: none"/>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("4"))%>></i>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("4"))%>></i>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("4"))%>></i>
                                    <i class="fas fa-star" <%=colorLabelStar(isStarChecked("4"))%>></i>
                                    <span style="margin-left: 5px">From 4 stars</span>
                                </label>
                                <label class="rate-search" id="label-3-star">
                                    <input type="checkbox" name="filter-star-rate"
                                           value="3" class="input-star" id="filter-star-3" <%=isStarChecked("3")%> style="display: none"/>
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
                                    <%!ArrayList<String> highestLowestChecked;
                                        String[] objFilterHighestLowest;%>
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
                                    <label class="price-search" id="price-search-01" for="hidden-checkbox-price-1" <%=colorLabelInputPrice(objFilterUnderPrice)%>>
                                        Under 50$
                                    </label>
                                    <input type="checkbox" value="50" class="hidden-checkbox-price"
                                           id="hidden-checkbox-price-1"  <%=isUnderPriceChecked()%> style="display: none"/>
                                    <label class="price-search" id="price-search-02" for="hidden-checkbox-price-2" <%=colorLabelInputPrice(objFilterFromPrice)%>>
                                        From 50$ to 150$
                                    </label>
                                    <input type="checkbox" value="50&&150"
                                           class="hidden-checkbox-price" id="hidden-checkbox-price-2" <%=isFromPriceChecked()%> style="display: none"/>
                                    <label class="price-search" id="price-search-03" for="hidden-checkbox-price-3" <%=colorLabelInputPrice(objFilterUpPrice)%>>
                                        Up 150$
                                    </label>
                                    <input type="checkbox" value="150" class="hidden-checkbox-price"
                                           id="hidden-checkbox-price-3"  <%=isToUpPriceChecked()%> style="display: none"/>

                                </div>


                                <div class="min-max-price-search" id="checkboxPriceInputFilter">
                                    <%!ArrayList<String> fromInputPriceChecked;
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
                                    <input type="text" name="input-range-filter-price" value="<%=isFromInputPriceChecked()%>" class="min-search"
                                           placeholder="Từ" id="inputFilterPriceFrom">
                                    <p style="font-size: 50px; margin: 0 10px">-</p>
                                    <input type="text" name="input-range-filter-price" value="<%=isToInputPriceChecked()%>" class="max-search"
                                           placeholder="Đến" id="inputFilterPriceTo">
                                </div>
                                <%Object err = request.getAttribute("errorInputPrice");
                                    if (err != null) {%>
                                        <%="<h1 style='display: block; color: red; margin: 10px 0'>" + err.toString() + "</h1>"%>
                                    <%}
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
                            <img src="data/imgAll/<%=map.get(p.getId()).get(0)%>.jpg" alt="lorem ippsum dolor dummy"
                                 title="lorem ippsum dolor dummy" class="img-responsive"/> </a>
                        <% %>
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
                        <p id="priceCategory123" class="price product-price"><span class="price-old"
                                                                                   style='margin-right: 10px'>

                                <%=p.getPrice()%>

                                  </span>
                            <%=p.getPrice() - (p.getPrice() * p.getSaleRate() / 100)%>

                            <span class="price-tax">Ex Tax: $100.00</span></p>
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
                        <button type="button" class="addtocart-btn">Mua ngay</button>
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
                        <%="~~~~"+lengthPagination + "!@#!@#!@#"%>
                        <li>
<%--                            <a id="left-page"--%>
<%--                               href="--%>
<%--                               CategoryProduct?category=<%=request.getAttribute("category")%>--%>
<%--                               &categoryGender=<%=request.getAttribute("categoryGender")%>--%>
<%--                               &pagination=<%=pagination<=1 ? 1: pagination-1%>">&lt;--%>
<%--                            </a>--%>

    <a id="left-page"
       href="
                                   <%int pagInt = pagination<=1 ? 1: pagination-1;
                                   String pagStr = request.getQueryString().substring(0, request.getQueryString().lastIndexOf("pagination"));
                                   pagStr += "pagination=" + pagInt;
                                   %>

                                   <%=URLDecoder.decode("ServletTest123?"+pagStr, "UTF-8")%>">&lt;
    </a>

                        </li>
                        <li>
                            <%--                            <a id="right-page"--%>
                            <%--                               href="CategoryProduct?category=--%>
                            <%--                                <%=request.getAttribute("category")%>&categoryGender=--%>
                            <%--                                <%=request.getAttribute("categoryGender")%>&pagination=--%>
                            <%--                                <%=pagination >= lengthPagination ? lengthPagination: pagination+1%>">&gt;--%>
                            <%--                            </a>--%>
                            <a id="right-page"
                               href="
                                   <%int pagIntRight = pagination >= lengthPagination ? lengthPagination: pagination+1;
                                   String pagStrRight = request.getQueryString().substring(0, request.getQueryString().lastIndexOf("pagination"));
                                   pagStrRight += "pagination=" + pagIntRight;
                                   %>

                                   <%=URLDecoder.decode("ServletTest123?"+pagStrRight, "UTF-8")%>">&gt;
                            </a>
                        </li>
                        <span>Page</span>
                        <select id="selectPagination" onchange="location = this.value;">

                            <%=URLDecoder.decode("ServletTest123?"+pagStrRight, "UTF-8")%>">&gt;
                            <%
                                for (int j = 1; j <= lengthPagination; j++) {
                                    pagStr = request.getQueryString().substring(0, request.getQueryString().lastIndexOf("pagination"));
                                    pagStr += "pagination=" + j;
                            %>
                            <option value="<%=URLDecoder.decode("ServletTest123?"+pagStr, "UTF-8")%>"
                                    <% // current pagination
                                        if (j == pagination) {%><%="selected"%> <%}%>><%=j%>
                            </option>
                            <%}%>
                        </select> <span> of <%if (list != null)%><%=lengthPagination%></span>
                    </ul>
                </div>
                <%= URLDecoder.decode(request.getQueryString(), "UTF-8")%>
            </div>
            <%
            } else {

                Object objGender = request.getAttribute("categoryGender");
                String categoryGender = objGender.toString();
                ArrayList<String> listCarousel;
                ArrayList<String> listIntro;
                if (categoryGender.equals("Man")) {
                    listCarousel = new ArrayList<String>(Arrays.asList("image/banners/men-intro-carousel1.webp", "image/banners/men-intro-carousel2.webp", "image/banners/men-intro-carousel-3.jpg"));
                    listIntro = new ArrayList<String>(Arrays.asList("image/category/man-Hitops.webp", "image/category/man-running.webp", "image/category/man-slides.jpg", "image/category/man-football.webp", "image/category/man-sneakers.jpg", "image/category/man-skateboard.jpg"));
                } else {
                    listCarousel = new ArrayList<String>(Arrays.asList("image/banners/women-intro-carousel1.webp", "image/banners/women-intro-carousel2.webp", "image/banners/women-intro-carousel3.webp"));
                    listIntro = new ArrayList<String>(Arrays.asList("image/category/woman-hitops.jpg", "image/category/running-woman.webp", "image/category/woman-slide.jpg", "image/category/woman-football.jfif", "image/category/woman-sneakers.webp", "image/category/woman-skateboard.jfif"));
                }

            %>

            <div class="mainbanner" style="padding: 10px; width: 100%; background-color: #f3f3f3;">
                <div id="main-banner" class="owl-carousel home-slider">
                    <div class="item">
                        <a href="#">
                            <img src="<%=listCarousel.get(0)%>" id="category-carousel-intro-1" alt="main-banner1"
                                 class="img-responsive img-border-radius" style="width: 100%;"/></a>
                        <div class="main-banner-section-center">
                        </div>
                    </div>
                    <div class="item">
                        <a href="#"><img src="<%=listCarousel.get(1)%>" id="category-carousel-intro-2"
                                         alt="main-banner2" class="img-responsive img-border-radius"
                                         style="width: 100%;"/></a>
                        <div class="main-banner-section-center">
                        </div>
                    </div>
                    <div class="item">
                        <a href="#"><img src="<%=listCarousel.get(2)%>" id="category-carousel-intro-3"
                                         alt="main-banner3" class="img-responsive img-border-radius"
                                         style="width: 100%;"/></a>
                        <div class="main-banner-section-center">
                        </div>
                    </div>
                </div>
                `
            </div>


            <div class="grid-list-wrapper bg-item">

                <div class="contain-carousel-category">

                    <div class="featured-category">
                        Featured category
                    </div>
                    <div class="list-contain">
                        <ul value="!23">
                            <li id="intro-hitops" class="intro-category category-product">
                                <img id="category-intro-img-hitops" src="<%=listIntro.get(0)%>" alt="">
                                <p class="title-category">HiTops</p>
                                <p class="introduce-category">Made for the journey, this collection of walking footwear
                                    is ready to go places and find adventure.</p>
                            </li>
                            <li id="intro-running" class="intro-category category-product">
                                <img id="category-intro-img-running" src="<%=listIntro.get(1)%>" alt="">
                                <p class="title-category">Running</p>
                                <p class="introduce-category">Feel inspired to fire up your passion in a running shoe
                                    made for more. No compromises, just pure motivation in stylish comfort.</p>
                            </li>
                            <li id="intro-slides" class="intro-category category-product">
                                <img id="category-intro-img-slides" src="<%=listIntro.get(2)%>" alt="">
                                <p class="title-category">Slides</p>
                                <p class="introduce-category">Made to go distance - and even furthur - this trainer
                                    range knows nothing but style and comfort.</p>
                            </li>
                            <li id="intro-sneakers" class="intro-category category-product">
                                <img id="category-intro-img-sneakers" src="<%=listIntro.get(3)%>" alt="">
                                <p class="title-category">Sneakers</p>
                                <p class="introduce-category">Do the season of boots in style. Step into comfort ready
                                    for wherever the journey is set to take you</p>
                            </li>
                            <li id="intro-skateboard" class="intro-category category-product">
                                <img id="category-intro-img-skateboard" src="<%=listIntro.get(4)%>" alt="">
                                <p class="title-category">Skateboard</p>
                                <p class="introduce-category">Whatever the season - in skateboard and in weather - enjoy
                                    the shoe made to withstand</p>
                            </li>
                            <li id="intro-football" class="intro-category category-product">
                                <img id="category-intro-img-football" src="<%=listIntro.get(5)%>" alt="">
                                <p class="title-category">Football</p>
                                <p class="introduce-category">Get in possession of your perfect match in a pair of
                                    football boots from one of the biggest names in the game.</p>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- khanh-js.js display this product -->
            </div>
        </div>

        <%}%>
    </div>
</div>
<%@include file="footer_login_message.jsp"%>
<script src="./javascript/hung-js.js"></script>
</body>

</html>
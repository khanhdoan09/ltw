<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: khanh
  Date: 12/6/2021
  Time: 12:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="connection.DatabaseConnection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="beans.Product" %>
<%@ page import="dao.product.brand.DaoProductBrand" %>
<%@ page import="dao.product.image.DaoLinkImage" %>


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

<%@include file="header.jsp" %>


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
                                <%List<String> brands = DaoProductBrand.getInstance().getListBrand();
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
                            <img src="upload/product/<%=p.getAvatar()%>" alt="lorem ippsum dolor dummy"
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
                            double totalNumber = new Double(request.getAttribute("totalNumberProduct").toString());

                        int lengthPagination = (int) Math.ceil(totalNumber / 9);%>
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
                            <!--URLDecoder.decode để chuyển % &3 thành / &-->
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
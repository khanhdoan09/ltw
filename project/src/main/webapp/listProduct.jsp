<%--
  Created by IntelliJ IDEA.
  User: khanh
  Date: 12/9/2021
  Time: 1:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@ page import="databaseConnection.DatabaseConnection" %>
<%@ page import="khanhJava.DaoProduct" %>
<%@ page import="khanhJava.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="khanhJava.DaoLinkImage" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!---------------------------------------------->

<%
    ArrayList<Product> listFilter = (ArrayList<Product>) request.getAttribute("filter");
    if (listFilter != null) {
        Map<String, ArrayList<String>> map = DaoLinkImage.getInstance().getAll();
        for (int i = 0; i < listFilter.size(); i++) {
            Product p = listFilter.get(i);
%>
<div>
    <div class="product-layout product-grid col-lg-4 col-md-5 col-sm-6 col-xs-10">
        <div class="product-thumb">
            <div class="image product-imageblock">
                    <a href="ProductDetail?idProduct=<%=p.getId()%>">
                    <div class="related-product-sale">
                        <h5 style='margin-top: 10px'> <%=p.getSaleRate()%></h5>
                    </div>
                    <img id="<%=map.get(p.getId()).get(0)%>" src="data/<%=request.getAttribute("folderImage")%>/<%=map.get(p.getId()).get(0)%>.jpg" alt="lorem ippsum dolor dummy"
                         title="lorem ippsum dolor dummy" class="img-responsive"/> </a>

                <div class="button-group">
                    <button type="button" class="wishlist" data-toggle="tooltip" title="Thêm vào yêu thích">
                        <i class="fas fa-heart"></i></button>
                    <button type="button" class="addtocart-btn">Mua ngay</button>
                    <button type="button" class="compare" data-toggle="tooltip" title="Thêm vào giỏ hàng"><i
                            class="fas fa-shopping-cart"></i></button>
                </div>
            </div>
            <div class="caption product-detail">
                <h2 id="brandCategory123" style='margin-top: 5px; text-transform: uppercase'>

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
                    <%=p.getSalePrice()%>

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
                <button type="button" class="compare" data-toggle="tooltip" title="Thêm vào giỏ hàng"><i
                        class="fas fa-shopping-cart"></i></button>
            </div>
        </div>
    </div>

</div>
<%
        }
    }
%>

<%if (listFilter == null) {
%>
<div class="grid-list-wrapper">
    <div class="contain-carousel-category">
        <div class="mainbanner">
            <div id="main-banner" class="owl-carousel home-slider">
                <div class="item">
                    <a href="#"><img id="category-carousel-intro-1" alt="main-banner1"
                                     class="img-responsive"/></a>
                    <div class="main-banner-section-center">
                    </div>
                </div>
                <div class="item">
                    <a href="#"><img id="category-carousel-intro-2" alt="main-banner2"
                                     class="img-responsive"/></a>
                    <div class="main-banner-section-center">
                    </div>
                </div>
                <div class="item">
                    <a href="#"><img id="category-carousel-intro-3" alt="main-banner3"
                                     class="img-responsive"/></a>
                    <div class="main-banner-section-center">
                    </div>
                </div>
            </div>
        </div>

        <div class="featured-category">
            Featured category
        </div>
        <div class="list-contain">
            <ul value="!23">
                <li id="intro-hitops" class="intro-category"><img id="category-intro-img-hitops"
                                                                  src="image/category/man-slides.jpg"
                                                                  alt="">
                    <p class="title-category">HiTops</p>
                    <p class="introduce-category">Made for the journey, this collection of walking footwear
                        is ready to go places and find adventure.</p>
                </li>
                <li id="intro-running" class="intro-category"><img id="category-intro-img-running"
                                                                   src="image/category/running.webp" alt="">
                    <p class="title-category">Running</p>
                    <p class="introduce-category">Feel inspired to fire up your passion in a running shoe
                        made for more. No compromises, just pure motivation in stylish comfort.</p>
                </li>
                <li id="intro-slides" class="intro-category"><img id="category-intro-img-slides"
                                                                  src="image/category/Slides.jpg" alt="">
                    <p class="title-category">Slides</p>
                    <p class="introduce-category">Made to go distance - and even furthur - this trainer
                        range knows nothing but style and comfort.</p>
                </li>
                <li id="intro-sneakers" class="intro-category"><img id="category-intro-img-sneakers"
                                                                    src="image/category/Sneakers.jpg"
                                                                    alt="">
                    <p class="title-category">Sneakers</p>
                    <p class="introduce-category">Do the season of boots in style. Step into comfort ready
                        for wherever the journey is set to take you</p>
                </li>
                <li id="intro-skateboard" class="intro-category"><img id="category-intro-img-skateboard"
                                                                      src="image/category/skateboard.jpg"
                                                                      alt="">
                    <p class="title-category">Skateboard</p>
                    <p class="introduce-category">Whatever the season - in skateboard and in weather - enjoy
                        the shoe made to withstand</p>
                </li>
                <li id="intro-football" class="intro-category"><img id="category-intro-img-football"
                                                                    src="image/category/football.webp"
                                                                    alt="">
                    <p class="title-category">Football</p>
                    <p class="introduce-category">Get in possession of your perfect match in a pair of
                        football boots from one of the biggest names in the game.</p>
                </li>
            </ul>
        </div>
    </div>
    <!-- khanh-js.js display this product -->
</div>
<%
    }
%>
<!---------------------------------------------->

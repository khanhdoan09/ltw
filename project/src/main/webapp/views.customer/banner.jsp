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
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="beans.Banner" %>


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
    <script src="javascript/template.js" type="text/javascript"></script>
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
<div class="container-category" style="width: 100%">

    <div class="row contain-category" style="width: 100%">
        <div id="content" class="content-about" style="display:flex; flex-wrap:wrap; padding-top: 30px; width: 100%">
            <div class="mainbanner" style="padding: 10px; width: 100%; background-color: #f3f3f3; width: 100%">
                <div id="main-banner" class="owl-carousel home-slider" style="height: fit-content; width: 100%">
                    <%
                        List<Banner> listCarousel = (List<Banner>) request.getAttribute("listCarousel");
                        List<Banner> listIntro = (List<Banner>) request.getAttribute("listIntro");

                        for(Banner banner : listCarousel) {%>
                    <div class="item" style="width: 100%;">
                            <img src="image/banners/<%=banner.getUrlImg()%>" id="category-carousel-intro-1" alt="main-banner1"
                                 class="img-responsive img-border-radius" style="width: 100%;"/>
                        <div class="main-banner-section-center">
                        </div>
                    </div>
                    <%}%>

                </div>
            </div>
            <div class="grid-list-wrapper bg-item" style="width: 100%">

                <div class="contain-carousel-category" style="width: 100%">

                    <div class="featured-category">
                        Featured category
                    </div>
                    <div class="list-contain">
                        <ul value="!23">
                            <%for (Banner banner : listIntro) {%>
                            <li id="intro-hitops" class="intro-category category-product" onclick="location.href='<%=banner.getLinkTo()%>'">
                                <a href='<%=banner.getLinkTo()%>'>
                                    <img src="image/category/<%=banner.getUrlImg()%>" alt="">
                                    <p class="title-category"><%=banner.getTitle()%></p>
                                    <p class="introduce-category"><%=banner.getText()%></p>
                                </a>
                            </li>

                            <%}%>

                        </ul>
                    </div>
                </div>

                <!-- khanh-js.js display this product -->
            </div>
        </div>


    </div>
</div>
<%@include file="footer_login_message.jsp"%>
<script src="javascript/hung-js.js"></script>

</body>

</html>
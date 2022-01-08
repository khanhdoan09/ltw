<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="model.Cart" %>
<%@ page import="model.DaoProduct" %>
<%@ page import="model.Product" %>
<%@ page import="model.DaoLinkImage" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>

<jsp:useBean id="cart" scope="request" type="model.Cart"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Cart | Dragon Sport</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="e-commerce site well design with responsive view." />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="css/dat-css.css">
    <link href="css/stylesheet.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="font-awesome/fonts/fontawesome-free-6.0.0-beta3-web/css/all.css">
    <link href="owl-carousel/owl.carousel.css" type="text/css" rel="stylesheet" media="screen" />
    <link href="owl-carousel/owl.transitions.css" type="text/css" rel="stylesheet" media="screen" />
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
    <link rel="stylesheet" href="./css/hung-css.css">
    <script src="javascript/khanh-js.js" type="text/javascript"></script>
</head>

<body class="cart col-2">
<%@include file="header.jsp"%>
<div class="container bg-item pd-5 bd-rd">

    <div class="row">

        <div class="" id="content" style="width: 100%;">
            <h1>Giỏ Hàng </h1>
            <div id="checkAllProduct">
                <%--@declare id="allproduct"--%><input type="checkbox" id="checkAll" class="chec">
                <label class="checkAll" for="allProduct">Chọn tất cả sản phẩm</label>
            </div>
            <div id="Trash">
                <%--@declare id="bin"--%><i class="fa fa-trash del"></i>
                <label for="bin" class="deltex checkAll">Xóa</label>
            </div>
            <form enctype="multipart/form-data" method="post" action="#">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <td class="text-center">Ảnh</td>
                            <td class="text-left">Tên sản phẩm</td>
                            <td class="text-left">Kiểu mẫu</td>
                            <td class="text-left">Số lượng</td>
                            <td class="text-right">Đơn giá</td>
                            <td class="text-right">Tổng</td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="list" value="${cart.data}"/>
                        <c:forEach items="${list}" var="item">
                            <tr>
                                <td class="text-center">
                                    <input type="checkbox" id="html " name="fav_language" value="HTML">
                                    <a href="product.html"><img class="img-thumbnail"
                                                                title="women's New Wine is an alcoholic"
                                                                alt="women's New Wine is an alcoholic"
                                                                src="data/imgAll/009318_a.jpg"></a>
                                </td>
                                <td class="text-left"><a href="product.html">${item.name}</a>
                                </td>
                                <td class="text-left">${item.brand}</td>
                                <td class="text-left">
                                    <div style="max-width: 200px;" class="input-group btn-block">
                                        <input type="text" class="form-control quantity" size="1" value="1"
                                               name="quantity">
                                        <span class="input-group-btn">
                                                <button class="btn btn-primary" title="" data-toggle="tooltip"
                                                        type="submit" data-original-title="Update"><i
                                                        class="fa fa-refresh"></i></button>
                                                <button class="btn btn-danger" title="" data-toggle="tooltip"
                                                        type="button" data-original-title="Remove"><i
                                                        class="fa fa-times-circle"></i></button>
                                            </span>
                                    </div>
                                </td>
                                <td class="text-right">${item.price}</td>
                                <td class="text-right">${item.price}</td>
                            </tr>
                        </c:forEach>

                        <!-- sản phẩm đã đưa vào giỏi hàng -->
                        </tbody>
                    </table>
                </div>
            </form>
            <h2>Bạn muốn chọn gì tiếp theo ?</h2>
            <p>Nếu bạn có code giảm giá hoặc điểm thưởng muốn sử dụng hoặc ước tính chi phí giao hàng của mình.</p>
            <div id="accordion" class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title"><a data-parent="#accordion" data-toggle="collapse"
                                                   class="accordion-toggle" href="#collapse-coupon">Sử Dụng Phiếu Mua Hàng <i
                                class="fa fa-caret-down"></i></a></h4>
                    </div>
                    <div class="panel-collapse collapse" id="collapse-coupon">
                        <div class="panel-body">
                            <label for="input-coupon" class="col-sm-3 control-label">Nhập phiếu mua hàng của bạn tại
                                đây</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="input-coupon"
                                       placeholder="Enter your coupon here" value="" name="coupon">
                                <span class="input-group-btn">
                                        <input type="button" class="btn btn-primary" data-loading-text="Loading..."
                                               id="button-coupon" value="Apply Coupon">
                                    </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title"><a class="accordion-toggle" data-parent="#accordion"
                                                   data-toggle="collapse" href="#collapse-voucher" id="UseTicker">Sử dụng phiếu quà
                            tặng <i class="fa fa-caret-down"></i></a></h4>
                    </div>
                    <div class="panel-collapse collapse" id="collapse-voucher">
                        <div class="panel-body">
                            <label for="input-voucher" class="col-sm-3 control-label">Nhập mã phiếu quà tặng của bạn
                                tại đây</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="input-voucher"
                                       placeholder="Enter your gift voucher code here" value="" name="voucher">
                                <span class="input-group-btn">
                                        <input type="submit" class="btn btn-primary" data-loading-text="Loading..."
                                               id="button-voucher" value="Apply Voucher">
                                    </span>
                            </div>
                        </div>
                    </div>
                </div>

                <br>
                <div class="row">
                    <div class="col-sm-4 col-sm-offset-8">
                        <table class="table table-bordered">
                            <tbody>
                            <tr>
                                <td class="text-right"><strong>Tổng phụ:</strong></td>
                                <td class="text-right">210.000 VNĐ</td>
                            </tr>
                            <tr>
                                <td class="text-right"><strong>VAT :</strong></td>
                                <td class="text-right">42.000 VNĐ</td>
                            </tr>
                            <tr>
                                <td class="text-right"><strong>Tổng:</strong></td>
                                <td class="text-right">
                                    <p id="totalPrice">252.000 VNĐ</p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="buttons">
                    <div class="pull-left"><a class="btn btn-default" href="index.html">Tiếp Tục Mua Sắm</a></div>
                    <div class="pull-right"><a class="btn btn-primary" href="checkout.html" id="Thanhtoan">Thanh
                        Toán</a></div>
                </div>
            </div>
        </div>
    </div>

</div>

<%@include file="footer_login_message.jsp"%>
<script src="./javascript/hung-js.js"></script>
</body>

</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="beans.ProductInCart" %>
<%@ page import="dao.product.DaoProduct" %>
<%@ page import="beans.Product" %>
<%@ page import="dao.product.image.DaoLinkImage" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>


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
    <link rel="stylesheet" href="css/hung-css.css">
    <script src="javascript/khanh-js.js" type="text/javascript"></script>
    <style>
        .icon-update:hover {
            background-color: #0e0e0e !important;
        }
    </style>
</head>

<body class="cart col-2">
<%@include file="header.jsp" %>
<div class="container bg-item pd-5 bd-rd">

    <div class="row">
        <%String idCustomer = (String) request.getAttribute("idCustomer");%>
        <form action="OrderController" id="content" style="width: 100%;">
            <!-- bug không được parameter trên url nên dùng input dưới-->
            <input style="visibility: hidden; width: 1px; height: 1px;" name="idCustomer" value="<%=idCustomer%>">
            <h1>Giỏ Hàng </h1>
            <div>
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
                     <%
                         List<ProductInCart> listProductInCart = (List<ProductInCart>) request.getAttribute("listProductInCart");
                         double totalPrice = 0;
                         for (int i = 0; i < listProductInCart.size(); i++) {
                            ProductInCart product = listProductInCart.get(i);
                            totalPrice += product.getPrice();%>
                            <tr id="tr_<%=i%>">
                                <td class="text-center check_pr">
                                    <input type="checkbox" id="html " class="checked_pr" name="checkbox_product_in_cart" value="<%=product.getName()%>_<%=product.getIdProduct()%>_<%=product.getColorShoe()%>_<%=product.getSizeShoe()%>_<%=product.getQuantityShoe()%>_<%=product.getPrice()%>" checked>
                                    <a href="ProductDetail?idProduct=<%=product.getIdProduct()%>"><img class="img-thumbnail"
                                                                title="women's New Wine is an alcoholic"
                                                                alt="women's New Wine is an alcoholic"
                                                                src="data/imgAll/${item.avatar}.jpg"></a>
                                </td>
                                <td class="text-left"><a href="ProductDetail?idProduct=<%=product.getIdProduct()%>"><%=product.getName()%></a>
                                </td>
                                <td class="text-left"><%=product.getBrand()%></td>
                                <td class="text-left">
                                    <div style="max-width: 200px;" class="input-group btn-block">
                                        <input type="text" class="form-control quantity changeQuantity text-center" pid="<%=product.getIdProduct()%>"  value="<%=product.getQuantityShoe()%>" name="quantity">
                                        <span class="input-group-btn">
                                                <a class="" href="/project/Cart">
                                                   <i class="fa fa-refresh icon-update" style="padding: 9px 20px;background-color: #1a94ff;color: white;"></i>
                                                </a>
                                                <a data-tr="tr_<%=i%>" data-price="<%=product.getPrice()%>" data-quantity="<%=product.getQuantityShoe()%>" href="DeleteProductInCart?idProduct=<%=product.getIdProduct()%>&idCustomer=<%=product.getIdCustomer()%>&colorShoe=<%=product.getColorShoe()%>&size=<%=product.getSizeShoe()%>" class="cart-remove"  >
                                                    <button class="btn btn-danger" title="" data-toggle="tooltip"
                                                        type="button" data-original-title="Remove">
                                                    <i class="fa fa-trash"></i></button>
                                                </a>
                                            </span>
                                    </div>
                                </td>
                                <td class="text-right"><%=product.getPrice()%></td>
                                <td class="text-right total-price"><%=product.getPrice() * product.getQuantityShoe()%></td>
                            </tr>
                        <%}%>
                        <!-- sản phẩm đã đưa vào giỏi hàng -->
                        </tbody>
                    </table>
                </div>
            </div>
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
                                <td class="text-right" id="total-sub-price"><%=totalPrice%></td>
                            </tr>
                            <tr>
                                <td class="text-right"><strong>Phí vận chuyển :</strong></td>
                                <td class="text-right">VNĐ</td>
                            </tr>
                            <tr>
                                <td class="text-right"><strong>Tổng: </strong></td>
                                <td class="text-right">
                                    <p id="total-price"><%=totalPrice%></p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="buttons">
                    <div class="pull-left"><a class="btn btn-default" href="/project/ServletTest123">Tiếp Tục Mua Sắm</a></div>
                    <button class="pull-right" type="submit">Thanh Toán</button>
                </div>
            </div>
        </form>
    </div>

</div>

<%@include file="footer_login_message.jsp"%>
<script src="../javascript/hung-js.js"></script>
<script>
    $(document).ready(function () {
        $(".cart-remove").click(function () {
            var id = $(this).attr("pid");
            tr = $(this).closest("tr");
            let productPrice = Math.floor($(this).data("price"))
            // console.log(id);
            $.ajax({
                url: "/project/Cart-remove",
                method: "POST",
                data: {
                    id: id
                },
                success: function (data) {
                    tr.remove();
                    let value = Math.floor(parseFloat($("#total_price").text()))
                    console.log(value +"~"+productPrice)
                    value -= productPrice
                    $("#total_price").text(value+" $");
                    $("#sum_price").text("Giỏ Hàng - "+value+"$");
                },
                error: function (data) {
                    if (data.status === 404)
                        alert("Xoa That Bai");
                }
            })
        })
    })
        $(".changeQuantity").blur(function () {
            var id = $(this).attr("pid");
            var oldQuantity = $(this).attr("oldQuantity");
            var update = $(this);
            var quantity = $(this).val();
            if(oldQuantity != quantity)
                $.ajax({
                    url: "/project/Cart-update",
                    method: "POST",
                    data: {
                        id: id,
                        quantity: quantity
                    },
                    success: function (data) {
                        update.attr("oldQuantity", quantity)
                    },
                    error: function (data) {
                        if(data.status === 404)
                            alert("Sản phẩm không tồn tại, hoặc bị xóa khỏi giỏ hàng!");
                        else  if(data.status === 485)
                            alert("Số lượng vượt quá giới hạn mua hoặc bé hơn 1!");
                    }
                })
        })
        // $(function () {
        //     //     let value = 0.0;
        //     //     let arrChecked = $(".checked_pr")
        //     //         arrChecked.each(function(){
        //     //             let child = $(this).prop('checked');
        //     //             console.log(child);
        //     //             if (child == true) {
        //     //                 let product = parseFloat($(".total-price").text());
        //     //                 console.log(product)
        //     //                 value += product;
        //     //             }
        //     //
        //     //         })
        //     //     console.log(value);
        //     //     $("#total_price").text(value+" $");
        //     // });
        // })


    // remove product
    $(function() {
        $(".cart-remove").each(function(){
            $(this).click((e)=>{
                e.preventDefault()
                let idTr = $(this).data("tr")
                let quantity = $(this).data("quantity")
                let price = $(this).data("price")
                let totalPrice = $("#total-price").text()
                price = price * quantity
                $.ajax(
                    {url: $(this).attr('href'),
                        success: function(){
                            // update price when delete product
                            let updatePrice = totalPrice - price
                            $("#total-sub-price").text(updatePrice)
                            $("#total-price").text(updatePrice)
                            $("#"+idTr).remove()
                    }
                    });
            })
        })
    })



</script>

</body>

</html>
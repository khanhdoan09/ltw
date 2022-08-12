<%@ page import="beans.Checkout" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.AddressCustomer" %>
<%@ page import="dao.user.DaoCustomerAddress" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="css/hung-css.css">

    <style>
        .icon-update:hover {
            background-color: #0e0e0e !important;
        }
    </style>
</head>

<body class="checkout col-2 left-col">
<%@include file="header.jsp" %>
<div class="container">

    <div class="row">

        <div class="col-sm-8">
            <div id="accordion" class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading a">
                        <h2 class="panel-title"><a class="accordion-toggle collapsed" data-parent="#accordion"
                                                   data-toggle="collapse" href="#collapse-checkout-option"
                                                   aria-expanded="false">
                            Thông tin nhận hàng <i class="fa fa-caret-down"></i></a></h2>
                    </div>
                    <div id="collapse-checkout-option" role="heading" class="panel-collapse collapse in"
                         aria-expanded="true" style="height: 0px;">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="d-flex form-group" style="display:table">
                                        <input class="form-control" name="type-address" type="radio" id="temporary-address" style="display: table-cell">
                                        <label for="temporary-address" style="display: table-cell" class="mx-2">
                                            <h1>Dùng địa chỉ tạm thời</h1>
                                        </label>
                                    </div>
                                    <form action="AddTemporaryAddress" method="post">
                                        <div class="section-input-form">
                                            <input type="text" id="name" name="name" class="form-input" placeholder="Họ tên">
                                            <input type="text" id="phone" name="phone" class="form-input" placeholder="Số điện thoại" type="tel" pattern="[0-9]{9}">
                                        </div>
                                        <div class="section-input-form">
                                            <input type="email" id="email" name="email" class="form-input" placeholder="Địa chỉ email">
                                        </div>
                                        <div class="contain-adjust-address">
                                            <span class="label-address">Tỉnh/ Thành phố:</span>
                                            <select id="contain-option-city" name="city">
                                                <!-- loadLocation() display this -->
                                            </select>
                                            <span class="label-address">Quận/ Huyện:</span>
                                            <select id="contain-option-district" name="district">
                                                <!-- loadLocation() display this -->
                                            </select>
                                            <span class="label-address">Phường/ Xã:</span>
                                            <select id="contain-option-ward" name="ward">
                                                <!-- loadLocation() display this -->
                                            </select>
                                        </div>
                                        <div class="section-input-form">
                                            <input name="address" id="address" type="text" class="form-input"
                                                   placeholder="Địa chỉ (Ví dụ: 1056, Bình Chiểu, Thủ Đức)">
                                        </div>
                                        <div class="section-input-form">
                                            <input name="note" id="note" type="text" class="form-input"
                                                   placeholder="Ghi chú thêm (Ví dụ: Giao hàng giờ hành chính)">
                                        </div>
                                    </form>
                                    <div class="d-flex form-group" style="display:table">
                                        <input class="form-control" type="radio" name="type-address" id="exist-address" style="display:table-cell">
                                        <label for="exist-address" style="display:table-cell" class="mx-2">
                                            <h1>Dùng địa chỉ có sẵn</h1>
                                        </label>
                                    </div>
                                    <select id="select-address" class="form-select">
                                        <%for (AddressCustomer addressCustomer: DaoCustomerAddress.getInstance().getAddress("15")){%>
                                            <option value="<%=addressCustomer.getId()%>" class="detail_exist_address" id="<%=addressCustomer.getId()%>" data-city="<%=addressCustomer.getCity()%>" data-district="<%=addressCustomer.getDistrict()%>" data-ward="<%=addressCustomer.getWard()%>">
                                                <%=addressCustomer.getDescription()%>
                                            </option>
                                        <%}%>
                                        <option></option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading a">
                        <h2 class="panel-title">
                            <a class="accordion-toggle" data-parent="#accordion" data-toggle="collapse"
                               href="#collapse-checkout-confirm" aria-expanded="true">Xác nhận đơn hàng <i
                                    class="fa fa-caret-down"></i></a></h2>
                    </div>
                    <div id="collapse-checkout-confirm" role="heading" class="panel-collapse collapse"
                         aria-expanded="true">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover table-checkout">
                                    <thead>
                                    <tr>
                                        <td class="text-left">Tên sản phẩm</td>
                                        <td class="text-left">Màu</td>
                                        <td class="text-left">Size</td>
                                        <td class="text-left">Ảnh</td>
                                        <td class="text-right">Số lượng</td>
                                        <td class="text-right">Đơn giá</td>
                                        <td class="text-right">Tổng</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        double totalPrice = 0;
                                        ArrayList<Checkout> listCheckout = (ArrayList<Checkout>) request.getAttribute("listProductInCheckout");
                                        for(int i = 0; i < listCheckout.size(); i++){
                                            Checkout checkout = listCheckout.get(i);
                                            totalPrice += checkout.getQuantity() * checkout.getPrice();
                                    %>
                                    <tr>
                                        <td class="text-left"><a
                                                href="http://localhost/opc001/index.php?route=product/product&amp;product_id=46"><%=checkout.getName()%></a></td>
                                        <td class="text-left"><%=checkout.getColor()%></td>
                                        <td class="text-left"><%=checkout.getSize()%></td>
                                        <td class="text-left">
                                            <img src="../image/checkout/<%=checkout.getUrlImg()%>"
                                                 class="checkout-product-img" width="100" height="100">
                                        </td>
                                        <td class="text-right"><%=checkout.getQuantity()%></td>
                                        <td class="text-right">$<%=checkout.getPrice()%></td>
                                        <td class="text-right">$<%=checkout.getQuantity() * checkout.getPrice()%></td>
                                    </tr>
                                          <%  }%>


                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td class="text-right" colspan="5"><strong>Tổng:</strong></td>
                                        <td class="text-right">$<%=totalPrice%></td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div>
                                <h2 class="checkout-note">Nếu bạn không hài lòng với sản phẩm của chúng tôi? Bạn hoàn
                                    toàn có thể trả lại sản phẩm. Tìm hiểu thêm
                                    <a href="#" class="link-checkout-note"><strong>tại đây.</strong></a>
                                </h2>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>


        <div class="col-sm-4 contain-pay-all bg-item pd-5 bd-rd">
            <!-- thanh toán -->
            <h2>Chọn hình thức thanh toán cho đơn hàng này.</h2>
            <form class="contain-form-payment" >
                <div class="payment-input payment-input-active"  id="contain-payment-cod">
                    <input type="radio" name="payment" id="payment-cod" checked>
                    <label for="payment-cod">
                        <img src="../image/payment/cod.png" width="35" height="35">
                    </label>
                    <label for="payment-cod">
                        <h4>Thanh toán khi nhận hàng (COD)</h4>
                    </label>
                </div>
                <div class="payment-input" id="contain-payment-shoppe">
                    <input type="radio" name="payment" id="payment-shoppe">
                    <label for="payment-shoppe">
                        <img src="../image/payment/shoppe.png" width="35" height="35">
                    </label>
                    <label for="payment-shoppe">
                        <h4>
                            Ví ShoppePay
                        </h4>
                    </label>
                </div>
                <div class="payment-input"  id="contain-payment-zalo">
                    <input type="radio" name="payment" id="payment-zalo">
                    <label for="payment-zalo">
                        <img src="../image/payment/zalo.svg" width="35" height="35">
                    </label>
                    <label for="payment-zalo">
                        <h4>Ví điện tử ZaloPay</h4>
                    </label>
                </div>
                <div class="payment-input"  id="contain-payment-momo">
                    <input type="radio" name="payment" id="payment-momo">
                    <label for="payment-momo">
                        <img src="../image/payment/momo.png" width="35" height="35">
                    </label>
                    <label for="payment-momo">
                        <h4>Ví MOMO</h4>
                    </label>
                </div>
            </form>

            <h2>Thành tiền</h2>
            <div class="pay-all">
                <form class="input-pay-all">
                    <input type="text" placeholder="Mã giảm giá">
                    <button>Áp dụng</button>
                </form>
                <ul>
                    <li>Tạm tính</li>
                    <li><%=totalPrice%>đ</li>
                </ul>
                <ul>
                    <li>Mã giảm giá</li>
                    <li class="pay-all-item-money">0</li>
                </ul>
                <ul>
                    <li>Phí giao hàng</li>
                    <li class="pay-all-item-money">0%</li>
                </ul>
                <ul>
                    <li>Tổng cộng</li>
                    <li style="color: rgb(187, 60, 60); font-weight: bold"><%=totalPrice%>đ</li>
                </ul>
                <div class="buttons">
                    <div class="pull-right">
                        <input type="button" data-loading-text="Loading..." class="button-pay-all btn"
                               id="button-confirm-checkout" value="Thanh toán">
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>

<%@include file="footer_login_message.jsp"%>
<script src="../javascript/hung-js.js"></script>
<script>
    $(function(){
        $("#button-confirm-checkout").click((e)=>{
            e.preventDefault();
            // kiểm tra đã có địa chỉ giao hàng chưa
            if($("#temporary-address")[0].checked==false && $('#exist-address')[0].checked==false) {
                alert('chưa chọn loại địa chỉ giao hàng')
                return
            }
            else if($('#temporary-address')[0].checked) {
                if($("#name").val() == '') {
                    alert("chưa điền tên");
                    return
                }
                if($("#phone").val() == '') {
                    alert("chưa điền số điện thoại");
                    return
                }
                if($("#email").val() == '') {
                    alert("chưa điền email");
                    return
                }
                if($("#address").val() == '') {
                    alert("chưa điền địa chỉ");
                    return
                }
            }

            // choose exist address
            if($("#exist-address")[0].checked) {
                submitCheckout($("#select-address").val())
            }
            // choose temporary address
            else if($("#temporary-address")[0].checked) {
                $.ajax(
                    {url: "AddTemporaryAddress",
                        method: "POST",
                        data: {
                            name: $('#name').val(),
                            phone: $('#phone').val(),
                            email: $('#email').val(),
                            city: $('#contain-option-city').val(),
                            district: $('#contain-option-district').val(),
                            ward: $('#contain-option-ward').val(),
                            address: $('#address').val(),
                            note: $('#note').val(),

                        },

                        success: function(data){
                            idAdress = data
                            submitCheckout(data)
                        }
                    });
            }
        })
    })

    function submitCheckout(idAddress) {
        $.ajax(
            {url: "CheckoutController",
                method: "POST",
                data: { idAddress: idAddress},
                success: function(data){
                    // data là số lượng sp trong cart đã dc mua
                    let header_quantity = $("#header_quantity").text()
                    header_quantity = header_quantity - data
                    $("#header_quantity").text(header_quantity)
                    alert("thanh toán thành công")
                    window.location.href="customer"
                }
            });
    }

</script>
<script src="javascript/city.js" type="text/javascript"></script>
<script src="javascript/district.js" type="text/javascript"></script>
<script src="javascript/ward.js" type="text/javascript"></script>
<script src="javascript/customer/history.js" type="text/javascript"></script>
<script src="javascript/customer/address.js" type="text/javascript"></script>
<script src="javascript/khanh-js.js" type="text/javascript"></script>
</body>

</html>

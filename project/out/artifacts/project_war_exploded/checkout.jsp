<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Checkout | Dragon Sport</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="e-commerce site well design with responsive view." />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link href="css/stylesheet.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <link href="owl-carousel/owl.carousel.css" type="text/css" rel="stylesheet" media="screen" />
    <link href="owl-carousel/owl.transitions.css" type="text/css" rel="stylesheet" media="screen" />
    <link rel="stylesheet" href="font-awesome/fonts/fontawesome-free-6.0.0-beta3-web/css/all.css">
    <script src="javascript/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="javascript/jstree.min.js" type="text/javascript"></script>
    <script src="javascript/template.js" type="text/javascript"></script>
    <script src="javascript/common.js" type="text/javascript"></script>
    <script src="javascript/global.js" type="text/javascript"></script>
    <script src="owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
    <link rel="shortcut icon" href="image/logo.png" />

    <link rel="stylesheet" href="css/khanh-css.css">
    <link rel="stylesheet" href="./css/hung-css.css">
    <script src="javascript/khanh-js.js" type="text/javascript"></script>
    <script src="data/location/city.js" type="text/javascript"></script>
    <script src="data/location/district.js" type="text/javascript"></script>
    <script src="data/location/ward.js" type="text/javascript"></script>
    <script src="javascript/khanh-js.js" type="text/javascript"></script>

    <script type="text/javascript" src="data/product/Shoe/Football/FirmGroundFootballMan.js"></script>

</head>
<body class="checkout col-2 left-col">
<%@include file="header.jsp"%>
<div class="container">

    <div class="row">

        <div class="col-sm-8">
            <div id="accordion" class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading a">
                        <h2 class="panel-title">
                            <a class="accordion-toggle" data-parent="#accordion" data-toggle="collapse"
                               href="#collapse-checkout-confirm" aria-expanded="true">Xác nhận đơn hàng <i
                                    class="fa fa-caret-down"></i></a></h2>
                    </div>
                    <div id="collapse-checkout-confirm" role="heading" class="panel-collapse collapse "
                         aria-expanded="true" >
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover table-checkout">
                                    <thead>
                                    <tr>
                                        <td class="text-left">Tên sản phẩm</td>
                                        <td class="text-left">Size</td>
                                        <td class="text-left">Ảnh</td>
                                        <td class="text-right">Số lượng</td>
                                        <td class="text-right">Đơn giá</td>
                                        <td class="text-right">Tổng</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="text-left"><a
                                                href="http://localhost/opc001/index.php?route=product/product&amp;product_id=46">NIKE
                                            Air Max AP</a></td>
                                        <td class="text-left">38</td>
                                        <td class="text-left">
                                            <img src="image/checkout/product-checkout-01.jpg"
                                                 class="checkout-product-img" width="100" height="100">
                                        </td>
                                        <td class="text-right">1</td>
                                        <td class="text-right">$105.00</td>
                                        <td class="text-right">$105.00</td>
                                    </tr>
                                    <tr>
                                        <td class="text-left"><a
                                                href="http://localhost/opc001/index.php?route=product/product&amp;product_id=46">ADIDAS
                                            Ultraboost 21 Running Shoes</a></td>
                                        <td class="text-left">42</td>
                                        <td class="text-left">
                                            <img src="image/checkout/checkout-product-02.jpg"
                                                 class="checkout-product-img" width="100" height="100">
                                        </td>
                                        <td class="text-right">2</td>
                                        <td class="text-right">$159.00</td>
                                        <td class="text-right">$318.00</td>
                                    </tr>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td class="text-right" colspan="5"><strong>Tổng:</strong></td>
                                        <td class="text-right">$428.00</td>
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
                                    <h3>Bạn đã có tài khoản <a style="color: darkorange; cursor:pointer;">Đăng nhập
                                        ngay</a></h3>
                                    <form>
                                        <div class="section-input-form">
                                            <input type="text" class="form-input" placeholder="Họ tên">
                                            <input type="text" class="form-input" placeholder="Số điện thoại">
                                        </div>
                                        <div class="section-input-form">
                                            <input type="email" class="form-input" placeholder="Địa chỉ email">
                                        </div>
                                        <div class="section-input-form">
                                            <input type="text" class="form-input"
                                                   placeholder="Địa chỉ (Ví dụ: 1056, Bình Chiểu, Thủ Đức)">
                                        </div>
                                        <div class="contain-adjust-address">
                                            <span class="label-address">Tỉnh/ Thành phố:</span>
                                            <select id="contain-option-city">
                                                <!-- khanh-js loadLocation() display this -->
                                            </select>
                                            <span class="label-address">Quận/ Huyện:</span>
                                            <select id="contain-option-district">
                                                <!-- khanh-js loadLocation() display this -->
                                            </select>
                                            <span class="label-address">Phường/ Xã:</span>
                                            <select id="contain-option-ward">
                                                <!-- khanh-js loadLocation() display this -->
                                            </select>
                                            <span class="label-address">Địa chỉ</span>
                                            <textarea rows="4" cols="50"></textarea>
                                        </div>
                                        <div class="contain-default-address-customer" style="margin: 15px 15px">
                                            <input type="checkbox" id="default-address-customer">
                                            <label for="default-address-customer" style="font-size: 17px">Đặt làm địa chỉ mặc định</label><br>
                                        </div>
                                        <div class="section-input-form">
                                            <input type="text" class="form-input"
                                                   placeholder="Ghi chú thêm (Ví dụ: Giao hàng giờ hành chính)">
                                        </div>
                                    </form>
                                </div>
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
                        <img src="image/payment/cod.png" width="35" height="35">
                    </label>
                    <label for="payment-cod">
                        <h4>Thanh toán khi nhận hàng (COD)</h4>
                    </label>
                </div>
                <div class="payment-input" id="contain-payment-shoppe">
                    <input type="radio" name="payment" id="payment-shoppe">
                    <label for="payment-shoppe">
                        <img src="image/payment/shoppe.png" width="35" height="35">
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
                        <img src="image/payment/zalo.svg" width="35" height="35">
                    </label>
                    <label for="payment-zalo">
                        <h4>Ví điện tử ZaloPay</h4>
                    </label>
                </div>
                <div class="payment-input"  id="contain-payment-momo">
                    <input type="radio" name="payment" id="payment-momo">
                    <label for="payment-momo">
                        <img src="image/payment/momo.png" width="35" height="35">
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
                    <li>$428</li>
                </ul>
                <ul>
                    <li>Mã giảm giá</li>
                    <li class="pay-all-item-money">0đ</li>
                </ul>
                <ul>
                    <li>Phí giao hàng</li>
                    <li class="pay-all-item-money">5%</li>
                </ul>
                <ul>
                    <li>Tổng cộng</li>
                    <li style="color: rgb(187, 60, 60); font-weight: bold">498.000đ</li>
                </ul>
                <div class="buttons">
                    <div class="pull-right">
                        <input type="button" data-loading-text="Loading..." class="button-pay-all btn"
                               id="button-confirm" value="Thanh toán">
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>

<%@include file="footer_login_message.jsp"%>
<script src="./javascript/hung-js.js"></script>
</body>

</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Checkout | Dragon Sport</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="e-commerce site well design with responsive view." />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link href="../css/stylesheet.css" rel="stylesheet">
    <link href="../css/responsive.css" rel="stylesheet">
    <link href="../owl-carousel/owl.carousel.css" type="text/css" rel="stylesheet" media="screen" />
    <link href="../owl-carousel/owl.transitions.css" type="text/css" rel="stylesheet" media="screen" />
    <link rel="stylesheet" href="font-awesome/fonts/fontawesome-free-6.0.0-beta3-web/css/all.css">
    <script src="../javascript/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../javascript/jstree.min.js" type="text/javascript"></script>
    <script src="../javascript/template.js" type="text/javascript"></script>
    <script src="../javascript/common.js" type="text/javascript"></script>
    <script src="../javascript/global.js" type="text/javascript"></script>
    <script src="../owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
    <link rel="shortcut icon" href="../image/logo.png" />

    <link rel="stylesheet" href="../css/khanh-css.css">
    <link rel="stylesheet" href="../css/hung-css.css">
    <script src="../javascript/khanh-js.js" type="text/javascript"></script>
    <script src="../data/location/city.js" type="text/javascript"></script>
    <script src="../data/location/district.js" type="text/javascript"></script>
    <script src="../data/location/ward.js" type="text/javascript"></script>
    <script src="../javascript/khanh-js.js" type="text/javascript"></script>

    <script type="text/javascript" src="../data/product/Shoe/Football/FirmGroundFootballMan.js"></script>

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
                               href="#collapse-checkout-confirm" aria-expanded="true">X??c nh???n ????n h??ng <i
                                    class="fa fa-caret-down"></i></a></h2>
                    </div>
                    <div id="collapse-checkout-confirm" role="heading" class="panel-collapse collapse "
                         aria-expanded="true" >
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover table-checkout">
                                    <thead>
                                    <tr>
                                        <td class="text-left">T??n s???n ph???m</td>
                                        <td class="text-left">Size</td>
                                        <td class="text-left">???nh</td>
                                        <td class="text-right">S??? l?????ng</td>
                                        <td class="text-right">????n gi??</td>
                                        <td class="text-right">T???ng</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="text-left"><a
                                                href="http://localhost/opc001/index.php?route=product/product&amp;product_id=46">NIKE
                                            Air Max AP</a></td>
                                        <td class="text-left">38</td>
                                        <td class="text-left">
                                            <img src="../image/checkout/product-checkout-01.jpg"
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
                                            <img src="../image/checkout/checkout-product-02.jpg"
                                                 class="checkout-product-img" width="100" height="100">
                                        </td>
                                        <td class="text-right">2</td>
                                        <td class="text-right">$159.00</td>
                                        <td class="text-right">$318.00</td>
                                    </tr>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td class="text-right" colspan="5"><strong>T???ng:</strong></td>
                                        <td class="text-right">$428.00</td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div>
                                <h2 class="checkout-note">N???u b???n kh??ng h??i l??ng v???i s???n ph???m c???a ch??ng t??i? B???n ho??n
                                    to??n c?? th??? tr??? l???i s???n ph???m. T??m hi???u th??m
                                    <a href="#" class="link-checkout-note"><strong>t???i ????y.</strong></a>
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
                            Th??ng tin nh???n h??ng <i class="fa fa-caret-down"></i></a></h2>
                    </div>
                    <div id="collapse-checkout-option" role="heading" class="panel-collapse collapse in"
                         aria-expanded="true" style="height: 0px;">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h3>B???n ???? c?? t??i kho???n <a style="color: darkorange; cursor:pointer;">????ng nh???p
                                        ngay</a></h3>
                                    <form>
                                        <div class="section-input-form">
                                            <input type="text" class="form-input" placeholder="H??? t??n">
                                            <input type="text" class="form-input" placeholder="S??? ??i???n tho???i">
                                        </div>
                                        <div class="section-input-form">
                                            <input type="email" class="form-input" placeholder="?????a ch??? email">
                                        </div>
                                        <div class="section-input-form">
                                            <input type="text" class="form-input"
                                                   placeholder="?????a ch??? (V?? d???: 1056, B??nh Chi???u, Th??? ?????c)">
                                        </div>
                                        <div class="contain-adjust-address">
                                            <span class="label-address">T???nh/ Th??nh ph???:</span>
                                            <select id="contain-option-city">
                                                <!-- khanh-js loadLocation() display this -->
                                            </select>
                                            <span class="label-address">Qu???n/ Huy???n:</span>
                                            <select id="contain-option-district">
                                                <!-- khanh-js loadLocation() display this -->
                                            </select>
                                            <span class="label-address">Ph?????ng/ X??:</span>
                                            <select id="contain-option-ward">
                                                <!-- khanh-js loadLocation() display this -->
                                            </select>
                                            <span class="label-address">?????a ch???</span>
                                            <textarea rows="4" cols="50"></textarea>
                                        </div>
                                        <div class="contain-default-address-customer" style="margin: 15px 15px">
                                            <input type="checkbox" id="default-address-customer">
                                            <label for="default-address-customer" style="font-size: 17px">?????t l??m ?????a ch??? m???c ?????nh</label><br>
                                        </div>
                                        <div class="section-input-form">
                                            <input type="text" class="form-input"
                                                   placeholder="Ghi ch?? th??m (V?? d???: Giao h??ng gi??? h??nh ch??nh)">
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
            <!-- thanh to??n -->
            <h2>Ch???n h??nh th???c thanh to??n cho ????n h??ng n??y.</h2>
            <form class="contain-form-payment" >
                <div class="payment-input payment-input-active"  id="contain-payment-cod">
                    <input type="radio" name="payment" id="payment-cod" checked>
                    <label for="payment-cod">
                        <img src="../image/payment/cod.png" width="35" height="35">
                    </label>
                    <label for="payment-cod">
                        <h4>Thanh to??n khi nh???n h??ng (COD)</h4>
                    </label>
                </div>
                <div class="payment-input" id="contain-payment-shoppe">
                    <input type="radio" name="payment" id="payment-shoppe">
                    <label for="payment-shoppe">
                        <img src="../image/payment/shoppe.png" width="35" height="35">
                    </label>
                    <label for="payment-shoppe">
                        <h4>
                            V?? ShoppePay
                        </h4>
                    </label>
                </div>
                <div class="payment-input"  id="contain-payment-zalo">
                    <input type="radio" name="payment" id="payment-zalo">
                    <label for="payment-zalo">
                        <img src="../image/payment/zalo.svg" width="35" height="35">
                    </label>
                    <label for="payment-zalo">
                        <h4>V?? ??i???n t??? ZaloPay</h4>
                    </label>
                </div>
                <div class="payment-input"  id="contain-payment-momo">
                    <input type="radio" name="payment" id="payment-momo">
                    <label for="payment-momo">
                        <img src="../image/payment/momo.png" width="35" height="35">
                    </label>
                    <label for="payment-momo">
                        <h4>V?? MOMO</h4>
                    </label>
                </div>
            </form>

            <h2>Th??nh ti???n</h2>
            <div class="pay-all">
                <form class="input-pay-all">
                    <input type="text" placeholder="M?? gi???m gi??">
                    <button>??p d???ng</button>
                </form>
                <ul>
                    <li>T???m t??nh</li>
                    <li>$428</li>
                </ul>
                <ul>
                    <li>M?? gi???m gi??</li>
                    <li class="pay-all-item-money">0??</li>
                </ul>
                <ul>
                    <li>Ph?? giao h??ng</li>
                    <li class="pay-all-item-money">5%</li>
                </ul>
                <ul>
                    <li>T???ng c???ng</li>
                    <li style="color: rgb(187, 60, 60); font-weight: bold">498.000??</li>
                </ul>
                <div class="buttons">
                    <div class="pull-right">
                        <input type="button" data-loading-text="Loading..." class="button-pay-all btn"
                               id="button-confirm" value="Thanh to??n">
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>

<%@include file="footer_login_message.jsp"%>
<script src="../javascript/hung-js.js"></script>
</body>

</html>

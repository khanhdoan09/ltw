<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Customer | Dragon Sport</title>
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
    <script src="data/location/city.js" type="text/javascript"></script>
    <script src="data/location/district.js" type="text/javascript"></script>
    <script src="data/location/ward.js" type="text/javascript"></script>
    <script src="javascript/khanh-js.js" type="text/javascript"></script>


</head>

<body class="checkout col-2 left-col">

<%@include file="header.jsp"%>
<div class="container">

    <div class="row">

        <div class="col-sm-3 mg-t">
            <div class="contain-nav-customer bg-item bd-rd">
                <div class="contain-name-img-customer">
                    <img class="img-customer" src="image/1.jpg">
                    <p class="name-customer">hungphan0501</p>

                    <a class="" style="margin: 35px 0 0 -135px;cursor: pointer;"><i class="fas fa-pen"></i> Sửa Hồ
                        Sơ</a>
                </div>
                <div class="pane-group">
                    <ul>
                        <li id="nav-info-customer" class="customer-category-after-click">
                            <i class="fas fa-user"></i> Hồ sơ
                        </li>

                        <li id="nav-map-customer">
                            <i class="fas fa-map-marked-alt"></i> Địa chỉ
                        </li>
                        <li id="nav-password-customer">
                            <i class="fas fa-key"></i> Đổi mật khẩu
                        </li>
                        <li id="nav-favorite-customer">
                            <i class="fas fa-shopping-basket"></i> Danh sách yêu thích
                        </li>
                        <li id="nav-history-customer">
                            <i class="fa fa-history" aria-hidden="true"></i> Lịch sử mua hàng
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-sm-9 bg-item bd-rd mg-t" id="contain-info-customer">
            <div id="accordion" class="panel-group bg-item bd-rd">
                <!-- lam o day -->
                <div id="info-customer">
                    <h1 class="hoso">Hồ Sơ Của Tôi</h1>
                    <p>Quản lý thông tin hồ sơ để bảo mật tài khoản</p>
                    <hr>
                    <div class="info col-half-sub">
                        <p class="name-login col-half-info">Tên Đăng Nhập</p>
                        <p id="id-customer " class=" id-customer name col-half-picture">hungphan0501</p>
                        <p class="Ten col-half-info">Tên</p>
                        <input type="text" class="col-half-picture">
                        <p class="email col-half-info">Email</p>
                        <input type="text" class="col-half-picture">
                        <p class="phone col-half-info">Số Điện Thoại</p>
                        <input type="text" class="col-half-picture">
                        <p class="name-shop col-half-info">Tên Shop</p>
                        <input type="text" class="col-half-picture">
                        <p class="sex col-half-info">Giới Tính</p>
                        <ul id="sex" class="col-half-picture">
                            <li class="men"><input type="radio" name="gioitinh" value="Nam" checked /> Nam</li>
                            <li class="woman"><input type="radio" name="gioitinh" value="Nữ" checked /> Nữ</li>
                            <li class="more"><input type="radio" name="gioitinh" value="Khác" checked /> Khác</li>
                        </ul>
                        <p class="birthday col-half-info">Ngày Sinh</p>
                        <ul id="birthday" class="col-half-picture">
                            <li>
                                <select name="" id="day">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>
                                </select>
                            </li>
                            <li>
                                <select name="" id="month">
                                    <option value="1">Tháng 1</option>
                                    <option value="2">Tháng 2</option>
                                    <option value="3">Tháng 3</option>
                                    <option value="4">Tháng 4</option>
                                    <option value="5">Tháng 5</option>
                                    <option value="6">Tháng 6</option>
                                    <option value="7">Tháng 7</option>
                                    <option value="8">Tháng 8</option>
                                    <option value="9">Tháng 9</option>
                                    <option value="10">Tháng 10</option>
                                    <option value="11">Tháng 11</option>
                                    <option value="12">Tháng 12</option>
                                </select>
                            </li>
                            <li>
                                <select name="" id="yeah">
                                    <option value="">2021</option>
                                    <option value="">2020</option>
                                    <option value="">2019</option>
                                    <option value="">2018</option>
                                    <option value="">2017</option>
                                    <option value="">2016</option>
                                    <option value="">2015</option>
                                    <option value="">2014</option>
                                    <option value="">2013</option>
                                    <option value="">2012</option>
                                    <option value="">2011</option>
                                    <option value="">2010</option>
                                    <option value="">2009</option>
                                    <option value="">2008</option>
                                    <option value="">2007</option>
                                    <option value="">2006</option>
                                    <option value="">2005</option>
                                    <option value="">2004</option>
                                    <option value="">2003</option>
                                    <option value="">2002</option>
                                    <option value="">2001</option>
                                    <option value="">2000</option>
                                    <option value="">1999</option>
                                    <option value="">1998</option>
                                    <option value="">1997</option>
                                    <option value="">1996</option>
                                    <option value="">1995</option>
                                    <option value="">1994</option>
                                    <option value="">1993</option>
                                    <option value="">1992</option>
                                    <option value="">1991</option>
                                    <option value="">1990</option>
                                    <option value="">1989</option>
                                    <option value="">1989</option>
                                    <option value="">1987</option>
                                    <option value="">1986</option>
                                    <option value="">1985</option>
                                    <option value="">1984</option>
                                    <option value="">1983</option>
                                    <option value="">1982</option>
                                    <option value="">1981</option>
                                    <option value="">1980</option>
                                    <option value="">1979</option>
                                    <option value="">1978</option>
                                    <option value="">1977</option>
                                    <option value="">1976</option>
                                    <option value="">1975</option>
                                    <option value="">1974</option>
                                    <option value="">1973</option>
                                    <option value="">1972</option>
                                    <option value="">1971</option>
                                    <option value="">1970</option>

                                </select>
                            </li>
                        </ul>
                        <button class="save">Lưu</button>
                    </div>
                    <div class="picture col-half">
                        <div id="picture">
                            <img src="./image/1.jpg" alt="">
                        </div>
                        <button class="select-picture">Chọn Ảnh</button>
                        <p class="subbbb" style="color: rgb(158, 158, 158); font-size: 12px;">Dụng lượng file tối đa
                            1 MB</p>
                        <p class="subbbb" style="color: rgb(158, 158, 158); font-size: 12px;"> Định dạng:.JPEG, .PNG
                        </p>
                    </div>
                </div>

                <div id="map-customer">
                    <button class="contain-add-map">
                        <i class="fas fa-plus"></i>
                        <span class="add-address">Thêm địa chỉ mới</span>
                    </button>
                    <div class="contain-available-address">
                        <div class="option-address">
                            <p style="cursor: pointer; color: rgb(57, 57, 207);" class="adjust-address-customer">
                                Chỉnh sửa</p>
                        </div>
                        <div class="available-address">
                            <p style="color: black;margin: 10px 0;"><span style="color: rgb(70, 67, 67);">Địa chỉ :
                                    </span> a199t, tổ 1a, khu phố bình nhâm, bình nhâm 20, Phường Bình Nhâm, Thị xã
                                Thuận An, Bình Dương</p>
                            <p style="color: black;margin: 10px 0;"><span style="color: rgb(73, 72, 72);">Điện thoại
                                        :</span> 0123456789</p>


                        </div>

                        <form class="contain-form-adjust-address">
                            <div class="contain-adjust-address">
                                <span class="label-address">Tỉnh/ Thành phố:</span>
                                <select id="contain-option-city" class="input-address">
                                    <!-- khanh-js loadLocation() display this -->
                                </select>
                                <span class="label-address">Quận/ Huyện:</span>
                                <select id="contain-option-district" class="input-address">
                                    <!-- khanh-js loadLocation() display this -->
                                </select>
                                <span class="label-address">Phường/ Xã:</span>
                                <select id="contain-option-ward" class="input-address">
                                    <!-- khanh-js loadLocation() display this -->
                                </select>
                                <span class="label-address">Địa chỉ</span>
                                <textarea rows="4" cols="50" style="border-radius: 10px;"></textarea>
                            </div>
                            <div class="contain-default-address-customer" style="margin: 10px 0">
                                <input type="checkbox" id="default-address-customer">
                                <label for="default-address-customer" style="font-size: 17px">Đặt làm địa chỉ mặc
                                    định</label><br>
                            </div>
                            <input type="button" id="submit-adjust-address-customer" value="Chỉnh sửa">
                            <input type="button" id="delete-adjust-address-customer" value="Xóa">

                        </form>


                    </div>
                </div>
                <div id="password-customer">
                    <div>
                        <label for="username">Mật Khẩu Hiện Tại:</label>
                        <input type="password" id="username" name="username" z style="width: 25%;">
                    </div>

                    <div>
                        <label for="pass">Mật Khẩu Mới:</label>
                        <input type="password" id="pass" name="password" minlength="8" required style="width: 25%;">
                    </div>

                    <div>
                        <label for="pass">Nhập Lại Mật Khẩu Mới:</label>
                        <input type="password" id="pass" name="password" minlength="8" required style="width: 25%;">
                    </div>

                    <input type="submit" value="Lưu Thay Đổi" style="background-color: #108bea; color: white;">

                </div>
                <div id="favorite-customer">
                    <div class="product-layout product-grid border-fav"
                         style="background-color: white; padding: 10px 0">
                        <div class="product-thumb">
                            <div class="image product-imageblock">
                                <a href="product.html">
                                    <div class="related-product-sale">
                                        <h5 style='margin-top: 10px'> -20%</h5>
                                    </div>
                                    <img id="imgCategory" height="250px" width="250px"
                                         src="image/product/product-01.jpg" alt="lorem ippsum dolor dummy"
                                         title="lorem ippsum dolor dummy" class="img-responsive item-img-list" />
                                </a>

                            </div>
                            <div class="caption product-detail intro-product-detail-list">
                                <h2 id="brandCategory" style='margin-top: 5px; text-transform: uppercase'>Nike</h2>
                                <h4 class="product-name">
                                    <a id="nameCategory" href="product.html" title="lorem ippsum dolor dummy"
                                       style='text-transform: capitalize'>
                                        Nike air force 1</a>
                                </h4>
                                <p class="product-desc"> More room to move. With 80GB or 160GB of storage and up to
                                    40 hours of battery life, the new lorem ippsum dolor dummy lets you enjoy up to
                                    40,000 songs or up to 200 hours of video or any combination wherever you go.
                                    Cover
                                    Flow. Browse through your music collection by flipping..</p>
                                <p id="priceCategory" class="price product-price produce-price-list">
                                    <span class="price-old" style='margin-right: 10px'>1.200.000 VND</span>
                                    1.500.00 VND
                                </p>
                                <div class="rating"> <span class="fa fa-stack"><i
                                        class="fa fa-star fa-stack-2x"></i><i
                                        class="fa fa-star-o fa-stack-2x"></i></span> <span
                                        class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                        class="fa fa-star-o fa-stack-2x"></i></span> <span
                                        class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                        class="fa fa-star-o fa-stack-2x"></i></span> <span
                                        class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span
                                        class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
                            </div>

                            <div class="button-group button-group-list-category" style="margin: 0; padding: 0;">
                                <button type="button" class="addtocart-btn bt-fav">Xem</button>
                                <button type="button" class="addtocart-btn bt-fav">Mua Ngay</button>
                                <button type="button" class="addtocart-btn bt-fav">Xóa</button>

                            </div>

                        </div>

                    </div>
                    <div class="product-layout product-grid border-fav"
                         style="background-color: white; padding: 10px 0">
                        <div class="product-thumb">
                            <div class="image product-imageblock">
                                <a href="product.html">
                                    <div class="related-product-sale">
                                        <h5 style='margin-top: 10px'> -20%</h5>
                                    </div>
                                    <img id="imgCategory" height="250px" width="250px"
                                         src="image/product/product-01.jpg" alt="lorem ippsum dolor dummy"
                                         title="lorem ippsum dolor dummy" class="img-responsive item-img-list" />
                                </a>

                            </div>
                            <div class="caption product-detail intro-product-detail-list">
                                <h2 id="brandCategory" style='margin-top: 5px; text-transform: uppercase'>Nike</h2>
                                <h4 class="product-name">
                                    <a id="nameCategory" href="product.html" title="lorem ippsum dolor dummy"
                                       style='text-transform: capitalize'>
                                        Nike air force 1</a>
                                </h4>
                                <p class="product-desc"> More room to move. With 80GB or 160GB of storage and up to
                                    40 hours of battery life, the new lorem ippsum dolor dummy lets you enjoy up to
                                    40,000 songs or up to 200 hours of video or any combination wherever you go.
                                    Cover
                                    Flow. Browse through your music collection by flipping..</p>
                                <p id="priceCategory" class="price product-price produce-price-list">
                                    <span class="price-old" style='margin-right: 10px'>1.200.000 VND</span>
                                    1.500.00 VND
                                </p>
                                <div class="rating"> <span class="fa fa-stack"><i
                                        class="fa fa-star fa-stack-2x"></i><i
                                        class="fa fa-star-o fa-stack-2x"></i></span> <span
                                        class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                        class="fa fa-star-o fa-stack-2x"></i></span> <span
                                        class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                        class="fa fa-star-o fa-stack-2x"></i></span> <span
                                        class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span
                                        class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
                            </div>

                            <div class="button-group button-group-list-category" style="margin: 0; padding: 0;">
                                <button type="button" class="addtocart-btn bt-fav">Xem</button>
                                <button type="button" class="addtocart-btn bt-fav">Mua Ngay</button>
                                <button type="button" class="addtocart-btn bt-fav">Xóa</button>

                            </div>

                        </div>

                    </div>

                    <div class="product-layout product-grid border-fav"
                         style="background-color: white; padding: 10px 0">
                        <div class="product-thumb">
                            <div class="image product-imageblock">
                                <a href="product.html">
                                    <div class="related-product-sale">
                                        <h5 style='margin-top: 10px'> -20%</h5>
                                    </div>
                                    <img id="imgCategory" height="250px" width="250px"
                                         src="image/product/product-01.jpg" alt="lorem ippsum dolor dummy"
                                         title="lorem ippsum dolor dummy" class="img-responsive item-img-list" />
                                </a>

                            </div>
                            <div class="caption product-detail intro-product-detail-list">
                                <h2 id="brandCategory" style='margin-top: 5px; text-transform: uppercase'>Nike</h2>
                                <h4 class="product-name">
                                    <a id="nameCategory" href="product.html" title="lorem ippsum dolor dummy"
                                       style='text-transform: capitalize'>
                                        Nike air force 1</a>
                                </h4>
                                <p class="product-desc"> More room to move. With 80GB or 160GB of storage and up to
                                    40 hours of battery life, the new lorem ippsum dolor dummy lets you enjoy up to
                                    40,000 songs or up to 200 hours of video or any combination wherever you go.
                                    Cover
                                    Flow. Browse through your music collection by flipping..</p>
                                <p id="priceCategory" class="price product-price produce-price-list">
                                    <span class="price-old" style='margin-right: 10px'>1.200.000 VND</span>
                                    1.500.00 VND
                                </p>
                                <div class="rating"> <span class="fa fa-stack"><i
                                        class="fa fa-star fa-stack-2x"></i><i
                                        class="fa fa-star-o fa-stack-2x"></i></span> <span
                                        class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                        class="fa fa-star-o fa-stack-2x"></i></span> <span
                                        class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                        class="fa fa-star-o fa-stack-2x"></i></span> <span
                                        class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span
                                        class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
                            </div>

                            <div class="button-group button-group-list-category" style="margin: 0; padding: 0;">
                                <button type="button" class="addtocart-btn bt-fav">Xem</button>
                                <button type="button" class="addtocart-btn bt-fav">Mua Ngay</button>
                                <button type="button" class="addtocart-btn bt-fav">Xóa</button>

                            </div>

                        </div>

                    </div>

                    <div class="product-layout product-grid border-fav"
                         style="background-color: white; padding: 10px 0">
                        <div class="product-thumb">
                            <div class="image product-imageblock">
                                <a href="product.html">
                                    <div class="related-product-sale">
                                        <h5 style='margin-top: 10px'> -20%</h5>
                                    </div>
                                    <img id="imgCategory" height="250px" width="250px"
                                         src="image/product/product-01.jpg" alt="lorem ippsum dolor dummy"
                                         title="lorem ippsum dolor dummy" class="img-responsive item-img-list" />
                                </a>

                            </div>
                            <div class="caption product-detail intro-product-detail-list">
                                <h2 id="brandCategory" style='margin-top: 5px; text-transform: uppercase'>Nike</h2>
                                <h4 class="product-name">
                                    <a id="nameCategory" href="product.html" title="lorem ippsum dolor dummy"
                                       style='text-transform: capitalize'>
                                        Nike air force 1</a>
                                </h4>
                                <p class="product-desc"> More room to move. With 80GB or 160GB of storage and up to
                                    40 hours of battery life, the new lorem ippsum dolor dummy lets you enjoy up to
                                    40,000 songs or up to 200 hours of video or any combination wherever you go.
                                    Cover
                                    Flow. Browse through your music collection by flipping..</p>
                                <p id="priceCategory" class="price product-price produce-price-list">
                                    <span class="price-old" style='margin-right: 10px'>1.200.000 VND</span>
                                    1.500.00 VND
                                </p>
                                <div class="rating"> <span class="fa fa-stack"><i
                                        class="fa fa-star fa-stack-2x"></i><i
                                        class="fa fa-star-o fa-stack-2x"></i></span> <span
                                        class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                        class="fa fa-star-o fa-stack-2x"></i></span> <span
                                        class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                        class="fa fa-star-o fa-stack-2x"></i></span> <span
                                        class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span
                                        class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
                            </div>

                            <div class="button-group button-group-list-category" style="margin: 0; padding: 0;">
                                <button type="button" class="addtocart-btn bt-fav">Xem</button>
                                <button type="button" class="addtocart-btn bt-fav">Mua Ngay</button>
                                <button type="button" class="addtocart-btn bt-fav">Xóa</button>

                            </div>

                        </div>

                    </div>

                    <div class="product-layout product-grid border-fav"
                         style="background-color: white; padding: 10px 0">
                        <div class="product-thumb">
                            <div class="image product-imageblock">
                                <a href="product.html">
                                    <div class="related-product-sale">
                                        <h5 style='margin-top: 10px'> -20%</h5>
                                    </div>
                                    <img id="imgCategory" height="250px" width="250px"
                                         src="image/product/product-01.jpg" alt="lorem ippsum dolor dummy"
                                         title="lorem ippsum dolor dummy" class="img-responsive item-img-list" />
                                </a>

                            </div>
                            <div class="caption product-detail intro-product-detail-list">
                                <h2 id="brandCategory" style='margin-top: 5px; text-transform: uppercase'>Nike</h2>
                                <h4 class="product-name">
                                    <a id="nameCategory" href="product.html" title="lorem ippsum dolor dummy"
                                       style='text-transform: capitalize'>
                                        Nike air force 1</a>
                                </h4>
                                <p class="product-desc"> More room to move. With 80GB or 160GB of storage and up to
                                    40 hours of battery life, the new lorem ippsum dolor dummy lets you enjoy up to
                                    40,000 songs or up to 200 hours of video or any combination wherever you go.
                                    Cover
                                    Flow. Browse through your music collection by flipping..</p>
                                <p id="priceCategory" class="price product-price produce-price-list">
                                    <span class="price-old" style='margin-right: 10px'>1.200.000 VND</span>
                                    1.500.00 VND
                                </p>
                                <div class="rating"> <span class="fa fa-stack"><i
                                        class="fa fa-star fa-stack-2x"></i><i
                                        class="fa fa-star-o fa-stack-2x"></i></span> <span
                                        class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                        class="fa fa-star-o fa-stack-2x"></i></span> <span
                                        class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                        class="fa fa-star-o fa-stack-2x"></i></span> <span
                                        class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span
                                        class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
                            </div>

                            <div class="button-group button-group-list-category" style="margin: 0; padding: 0;">
                                <button type="button" class="addtocart-btn bt-fav">Xem</button>
                                <button type="button" class="addtocart-btn bt-fav">Mua Ngay</button>
                                <button type="button" class="addtocart-btn bt-fav">Xóa</button>

                            </div>

                        </div>

                    </div>



                </div>
                <div id="history-customer">
                    <div class=contain-history>
                        <table>
                            <thead>
                            <th>Id order</th>
                            <th>Name product</th>
                            <th>Image</th>
                            <th>Count</th>
                            <th>Trạng thái</th>
                            <th>Total cost</th>

                            </thead>
                            <tr>
                                <td>
                                    <p><a href="#">357Y</a></p>
                                </td>
                                <td>
                                    <p>Nike Air Force 1</p>
                                </td>
                                <td>
                                    <img src="image/product/product-01.jpg" alt="">
                                </td>
                                <td>
                                    <p>1</p>
                                </td>
                                <td>
                                    <p>Đã giao</p>
                                </td>
                                <td>
                                    <p>100.00</p>
                                </td>

                            </tr>

                            <tr>
                                <td>
                                    <p><a href="#">1235X</a></p>
                                </td>
                                <td>
                                    <p>Nike Air Max Dawn</p>
                                </td>
                                <td>
                                    <img src="image/product/product-02.jpg" alt="">
                                </td>
                                <td>
                                    <p>1</p>
                                </td>
                                <td>
                                    <p>Đã giao</p>
                                </td>
                                <td>
                                    <p>100.00</p>
                                </td>

                            </tr>

                            <tr>
                                <td>
                                    <p><a href="#">4568Z</a></p>
                                </td>
                                <td>
                                    <p>Under Armour white</p>
                                </td>
                                <td>
                                    <img src="image/product/product-06.jpg" alt="">
                                </td>
                                <td>
                                    <p>1</p>
                                </td>
                                <td>
                                    <p>Đã giao</p>
                                </td>
                                <td>
                                    <p>100.00</p>
                                </td>

                            </tr>
                        </table>
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
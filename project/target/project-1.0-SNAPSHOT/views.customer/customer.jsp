<%@ page import="beans.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Customer | Dragon Sport</title>
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
    <link rel="stylesheet" href="font-awesome/fonts/fontawesome-free-6.0.0-beta3-web/css/all.css">
    <link rel="stylesheet" href="css/dat-css.css">
    <link href="owl-carousel/owl.carousel.css" type="text/css" rel="stylesheet" media="screen"/>
    <link href="owl-carousel/owl.transitions.css" type="text/css" rel="stylesheet" media="screen"/>
    <!-- <script src="javascript/Dat-js.js" type="text/javascript"></script> -->
    <script src="javascript/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="javascript/jstree.min.js" type="text/javascript"></script>
    <link rel="shortcut icon" href="image/logo.png"/>

    <link rel="stylesheet" href="css/dat-css.css">
    <link rel="stylesheet" href="css/khanh-css.css">
    <link rel="stylesheet" href="css/hung-css.css">


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body class="checkout col-2 left-col">

<%@include file="header.jsp" %>
<%User customer = (User) request.getAttribute("customer"); %>
<div class="container">

    <div class="row">

        <div class="col-sm-3 mg-t">
            <div class="contain-nav-customer bg-item bd-rd">
                <div class="contain-name-img-customer">
                    <img class="img-customer" src="image/1.jpg">
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
                <form action="changeCustomerInfoController?id=<%=customer.getId()%>"  class="screen-custoner" id="info-customer">
                    <h1 class="hoso">Hồ Sơ Của Tôi</h1>
                    <p>Quản lý thông tin hồ sơ để bảo mật tài khoản</p>
                    <hr>
                    <div class="info col-half-sub d-grid">
                        <p class="Ten col-half-info">Tên</p>
                        <input name="name" type="text" class="col-half-picture" required
                               value="<%=customer.getName()%>">
                        <p class="email col-half-info">Email</p>
                        <input name="email" type="text" class="col-half-picture" value="<%=customer.getEmail()%>">
                        <p class="phone col-half-info">Số Điện Thoại</p>
                        <input name="phone" type="text" class="col-half-picture" value="<%=customer.getPhone()%>">

                        <ul id="sex" class="col-half-picture">
                            <%!String gender;%>
                            <%gender = customer.getGender();%>
                            <%!
                                public String genderChecked(String curGender) {
                                    if (gender.equalsIgnoreCase(curGender)) {
                                        return "checked";
                                    }
                                    return "";
                                }
                            %>
                            <li class="men"><input type="radio" name="gender" value="man" <%=genderChecked("man")%> />
                                Nam
                            </li>
                            <li class="woman"><input type="radio" name="gender"
                                                     value="woman"<%=genderChecked("woman")%> /> Nữ
                            </li>
                            <li class="more"><input type="radio" name="gender" value="null" <%=genderChecked("null")%>/>
                                Khác
                            </li>
                        </ul>
                        <div class="d-grid">
                            <p class="birthday col-half-info">Ngày Sinh</p>
                            <ul id="birthday" class="col-half-picture">
                                <%
                                    String day="0";
                                    String month="0";
                                    String year="0";
                                    if(customer.getDob() != null) {
                                        String[] dob = customer.getDob().split("/");
                                        day=dob[0];
                                        month=dob[1];
                                        year=dob[2];
                                    }
                                    %>
                                <li>
                                    <select name="day" id="day">
                                        <%for (int i =1; i < 32; i++) {%>
                                        <option vallue="<%=i%>" <%if (day.equals(Integer.toString(i))){%>selected<%}%>><%=i%></option>
                                        <%}%>
                                    </select>
                                </li>
                                <li>
                                    <select name="month" id="month">
                                        <%for (int i =1; i < 13; i++) {%>
                                        <option vallue="<%=i%>" <%if (month.equals(Integer.toString(i))){%>selected<%}%>><%=i%></option>
                                        <%}%>
                                    </select>
                                </li>
                                <li>
                                    <select name="year" id="year">
                                        <%for (int i =1980; i < 2060; i++) {%>
                                        <option vallue="<%=i%>" <%if (year.equals(Integer.toString(i))){%>selected<%}%>><%=i%></option>
                                        <%}%>
                                    </select>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="picture col-half">
                        <div id="picture">
                            <img id="loadAvatar" src="image/1.jpg" alt="" width="170px" height="170px">
                        </div>
                        <input type="file" id="chooseAvatar">
                        <p class="subbbb" style="color: rgb(158, 158, 158); font-size: 12px;">Dụng lượng file tối đa
                            1 MB</p>
                        <p class="subbbb" style="color: rgb(158, 158, 158); font-size: 12px;"> Định dạng:.JPEG, .PNG
                        </p>
                    </div>
                    <button type="submit" class="save">Lưu</button>
                </form>

                <div id="map-customer" class="screen-custoner">
                    <button class="contain-add-map">
                        <i class="fas fa-plus"></i>
                        <span class="add-address">Thêm địa chỉ mới</span>
                    </button>
                    <div class="contain-available-address">

                        <form class="contain-form-adjust-address">
                            <div class="contain-adjust-address">
                                <span class="label-address">Tỉnh/ Thành phố:</span>
                                <select id="contain-option-city" class="input-address">
                                    <!-- loadLocation() display this -->
                                </select>
                                <span class="label-address">Quận/ Huyện:</span>
                                <select id="contain-option-district" class="input-address">
                                    <!--  loadLocation() display this -->
                                </select>
                                <span class="label-address">Phường/ Xã:</span>
                                <select id="contain-option-ward" class="input-address">
                                    <!-- loadLocation() display this -->
                                </select>
                                <span class="label-address">Địa chỉ</span>
                                <textarea id="contain-option-description" rows="4" cols="50" style="border-radius: 10px;"></textarea>
                            </div>
                            <div class="contain-default-address-customer" style="margin: 10px 0">
                                <input type="checkbox" id="default-address-customer">
                                <label for="default-address-customer" style="font-size: 17px">Đặt làm địa chỉ mặc
                                    định</label><br>
                            </div>
                            <input type="button" id="submit-add-address-customer" class="btn-address-customer" value="Thêm">
                            <input type="button" id="submit-adjust-address-customer" class="btn-address-customer" value="Chỉnh sửa">
                            <input type="button" id="delete-adjust-address-customer" value="Xóa">

                        </form>


                    </div>
                </div>
                <form id="password-customer" action="newCustomerPassword" class="screen-custoner">
                    <div>
                        <label for="username">Mật Khẩu Hiện Tại:</label>
                        <input id="oldPassword" required type="password" name="oldPassword" style="width: 25%;">
                        <p class="validation" id="validation-oldPassword"></p>
                    </div>
                    <div>
                        <label for="pass">Mật Khẩu Mới:</label>
                        <input id="newPassword" type="password" name="newPassword" required style="width: 25%;">
                        <p class="validation" id="validation-newPassword"></p>
                    </div>
                    <div>
                        <label for="pass">Nhập Lại Mật Khẩu Mới:</label>
                        <input id="confirmNewPassword" type="password" name="confirmNewPassword" required
                               style="width: 25%;">
                        <p class="validation" id="validation-confirmPassword"></p>
                    </div>
                    <button id="submitChangeNewPassword" type="submit" style="background-color: #108bea; color: white;">
                        Lưu Thay Đổi
                    </button>
                    <%--                    <input type="submit" value="Lưu Thay Đổi" style="background-color: #108bea; color: white;">--%>
                </form>
                <div id="favorite-customer"  class="screen-custoner">
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
                                         title="lorem ippsum dolor dummy" class="img-responsive item-img-list"/>
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
                                        class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span></div>
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
                                         title="lorem ippsum dolor dummy" class="img-responsive item-img-list"/>
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
                                        class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span></div>
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
                                         title="lorem ippsum dolor dummy" class="img-responsive item-img-list"/>
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
                                        class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span></div>
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
                                         title="lorem ippsum dolor dummy" class="img-responsive item-img-list"/>
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
                                        class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span></div>
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
                                         title="lorem ippsum dolor dummy" class="img-responsive item-img-list"/>
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
                                        class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span></div>
                            </div>

                            <div class="button-group button-group-list-category" style="margin: 0; padding: 0;">
                                <button type="button" class="addtocart-btn bt-fav">Xem</button>
                                <button type="button" class="addtocart-btn bt-fav">Mua Ngay</button>
                                <button type="button" class="addtocart-btn bt-fav">Xóa</button>

                            </div>

                        </div>

                    </div>


                </div>
                <div id="history-customer"  class="screen-custoner">
                    <div class=contain-history>
                        <table id="table-history">
                            <thead>
                            <th>Tên</th>
                            <th>Ảnh</th>
                            <th>Màu</th>
                            <th>Số lượng</th>
                            <th>Size</th>
                            <th>Ngày</th>
                            <th>Giá</th>
                            </thead>
                            <tbody id="contain_history">

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


    </div>

</div>

<%@include file="footer_login_message.jsp" %>
<script src="javascript/hung-js.js"></script>

<script src="javascript/city.js" type="text/javascript"></script>
<script src="javascript/district.js" type="text/javascript"></script>
<script src="javascript/ward.js" type="text/javascript"></script>
<script src="javascript/customer/history.js" type="text/javascript"></script>
<script src="javascript/customer/address.js" type="text/javascript"></script>
<script src="javascript/customer/changePassword.js" type="text/javascript"></script>


<script src="javascript/khanh-js.js" type="text/javascript"></script>
</body>

<script>
    $(function() {
            $("#chooseAvatar").change(function () {
                if (this.files) {
                    let reader = new FileReader()
                    reader.onload = function (e) {
                        $("#loadAvatar").attr('src', e.target.result)
                    }
                    reader.readAsDataURL(this.files[0])
                }
            });
    })
</script>

<script>

    // access information of page costumer
    function accessInfoCustomer() {
        $("#nav-info-customer").click(() => {
            resetAllSectionCustomer();
            $("#info-customer").css("display", "block");
            $("#nav-info-customer").addClass("customer-category-after-click");
            $("#info-customer").addClass("display-default-customer")
        });

        $("#nav-favorite-customer").click(() => {
            resetAllSectionCustomer();
            $("#favorite-customer").css("display", "flex");
            $("#nav-favorite-customer").addClass("customer-category-after-click");
            removeDefaultNavContentCategory()
        });

        $("#nav-bank-customer").click(() => {
            resetAllSectionCustomer();
            $("#bank-customer").css("display", "block");
            $("#nav-bank-customer").addClass("customer-category-after-click");
            removeDefaultNavContentCategory()
        });
        $("#nav-map-customer").click(() => {
            resetAllSectionCustomer();
            $("#map-customer").css("display", "block");
            $("#nav-map-customer").addClass("customer-category-after-click");
            removeDefaultNavContentCategory()
        });
        $("#nav-password-customer").click(() => {
            resetAllSectionCustomer();
            $("#password-customer").css("display", "block");
            $("#nav-password-customer").addClass("customer-category-after-click");
            removeDefaultNavContentCategory()
        });
        $("#submit-adjust-address-customer").click(() => {
            $(".contain-form-adjust-address").css("display", "none");
            $(".available-address").css("display", "block");
            $(".default-address").css("display", "block");
        });
        $("#delete-adjust-address-customer").click(() => {
            $(".contain-form-adjust-address").css("display", "none");
            $(".available-address").css("display", "block");
            $(".default-address").css("display", "block");
        });
        $("#nav-history-customer").click((e) => {
            e.preventDefault()
            resetAllSectionCustomer();
            $("#history-customer").css("display", "block");
            $("#nav-history-customer").addClass("customer-category-after-click");
            removeDefaultNavContentCategory()
            $.ajax({
                url: `PurchaseHistoryController`,
                type: 'POST',
                success: function (data) {
                    let arrHistory = JSON.parse(data)
                    let re = ``
                    for (let i in arrHistory) {
                        console.log(arrHistory[i])
                        re += `<tr> <td>`+arrHistory[i].productName+`</td>
                                <td><img width="40px" height="40px" src="upload\\product\\`+arrHistory[i].avatar+`"></td>
                                <td>`+arrHistory[i].productColor+`</td>
                                <td>`+arrHistory[i].productQuantity+`</td>
                                <td>`+arrHistory[i].productSize+`</td>
                                <td>`+arrHistory[i].createAt+`</td>
                                <td>`+arrHistory[i].productPrice+`</td>
                               </tr>`
                    }

                    $("#contain_history").append(re)
                },
                error: function () {
                    alert("Error")
                }
            })
        });
    }

    function resetAllSectionCustomer() {
        $("#nav-bank-customer").removeClass("customer-category-after-click");
        $("#nav-map-customer").removeClass("customer-category-after-click");
        $("#nav-password-customer").removeClass("customer-category-after-click");
        $("#nav-favorite-customer").removeClass("customer-category-after-click");
        $("#nav-history-customer").removeClass("customer-category-after-click");
        $("#bank-customer").css("display", "none");
        $("#map-customer").css("display", "none");
        $("#password-customer").css("display", "none");
        $("#history-customer").css("display", "none");
        $("#favorite-customer").css("display", "none")

    }
    $(window).ready(resetAllSectionCustomer);

    function removeDefaultNavContentCategory() {
        $("#nav-info-customer").removeClass("customer-category-after-click");
        $("#info-customer").css("display", "none");
    }
    $(window).ready(accessInfoCustomer);
</script>
</html>
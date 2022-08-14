<%--
  Created by IntelliJ IDEA.
  User: Hung Phan
  Date: 1/8/2022
  Time: 10:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .validation {
        color: red;
        text-transform: capitalize;
    }
    .login-modal, .js-modal {
        display: none;
    }
    .modal-container{
        border-radius: 20px;
    }
    .modal-header{
        border-top-left-radius: 20px;
        border-top-right-radius: 20px;
    }
</style>
<footer style="margin: 10px 0;">
    <div class="container">
        <hr>
        <div class="row">
            <div class="col-sm-3 footer-block">
                <h5 class="footer-title">Thông tin</h5>
                <ul class="list-unstyled ul-wrapper">
                    <li><a href="about-us.html">Về chúng tôi</a></li>
                    <li><a href="checkout.html">Thông tin giao hàng</a></li>
                    <li><a href="#">Chính sách</a></li>
                    <li><a href="#">Luật &amp; Điều kiện</a></li>
                    <li><a href="#">Bản đồ</a></li>
                    <li><a href="#">Danh sách yêu thích</a></li>
                </ul>
            </div>
            <div class="col-sm-3 footer-block">
                <h5 class="footer-title">Why Choose</h5>
                <ul class="list-unstyled ul-wrapper">
                    <li><a href="contact.html">Liên lạc</a></li>
                    <li><a href="#">Voucher quà tặng</a></li>
                    <li><a href="#">Trả hàng</a></li>
                    <li><a href="#">Vận chuyển</a></li>
                    <li><a href="#">Giúp đỡ & FAQs</a></li>
                    <li><a href="#">Sale trong hôm nay</a></li>
                </ul>
            </div>
            <div class="col-sm-3 footer-block">
                <h5 class="footer-title">Tài khoản của tôi</h5>
                <ul class="list-unstyled ul-wrapper">
                    <li><a href="#">Đăng nhập</a></li>
                    <li><a href="#">Voucher quà tặng</a></li>
                    <li><a href="#">Chi nhánh</a></li>
                    <li><a href="#">Giỏ hàng</a></li>
                    <li><a href="#">Thanh toán</a></li>
                    <li><a href="#">Theo dõi hóa đơn</a></li>
                    <li><a href="#">Giúp đỡ</a></li>
                </ul>
            </div>
            <div class="col-sm-3 footer-block">
                <div class="content_footercms_right">
                    <div class="footer-contact">
                        <h5 class="contact-title footer-title">Liên lạc</h5>
                        <ul class="ul-wrapper">
                            <li> 29/1, đường số 4, KP.3, P. Bình Khánh, Q.2, TPHCM, Việt Nam</li>
                            <li><span class="mail2"><a
                                    href="#">info@localhost.com</a></span></li>
                            <li><i class="fa fa-mobile"></i><span class="phone2">+91 0987-654-321<br>+91
                                        0987-654-321</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="footer-top-cms">
                <div class="col-sm-7">
                    <div class="newslatter">
                        <form>
                            <h5>Đăng kí để nhận thư</h5>
                            <div class="input-group">
                                <input type="text" class=" form-control" placeholder="email@website.com">
                                <a type="submit" value="Sign up"
                                        class="btn btn-large btn-primary">Đăng kí</a>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="footer-social">
                        <h5>Mạng xã hội</h5>
                        <ul>
                            <li class="facebook"><a href="#"><i class="fab fa-facebook-square"></i></a></li>
                            <li class="linkedin"><a href="#"><i class="fab fa-linkedin"></i></a></li>
                            <li class="twitter"><a href="#"><i class="fab fa-twitter-square"></i></a></li>
                            <li class="gplus"><a href="#"><i class="fab fa-google-plus-square"></i></a></li>
                            <li class="youtube"><a href="#"><i class="fab fa-youtube-square"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a id="scrollup">Scroll</a>
</footer>

<!--Begin: login-registe-->
<div class="login-modal js-modal" id="form-modal">
    <!-- Begin: modal login -->
    <div class="modal-container js-modal-container">
        <header class="modal-header">
            Tài Khoản Của Bạn!
        </header>

        <div class="modal-close js-modal-close">
            <i class="ti-close icon-close"></i>
        </div>

        <div class="modal-body">
            <div class="modal-body-login">
                <div class="modal-login sub col-half">Đăng Nhập</div>
                <div class="modal-rgister js-register-modal sub col-half">Đăng Ký</div>
            </div>

            <div class="sub-login">
                <p class="login-another">_____________ Đăng Nhập Bằng Cách Khác ____________</p>
            </div>

            <div class="modal-login-another">
                <img src="image/icon_fb.png" alt="FaceBook" class="icon-login-another">
                <img src="image/icon_gg.png" alt="Google" class="icon-login-another">
                <img src="image/icon_apple.png" alt="Apple" class="icon-login-another">
            </div>
<form id="form-login" action="/Login" method="post">
            <div class="modal-input-section">
                <div>
                    <input type="email" name="email" placeholder="Địa chỉ email..." class="email" id="email-login">
                    <p class="validation" id="validation-email-signIn"></p>
                </div>
                <div>
                    <input type="password" name="password" placeholder="Nhập mật khẩu..." class="email password" id="password-login">
                    <p class="validation" id="validation-password-signIn"></p>
                </div>
                <a href="" class="forgot-password">Quên mật khẩu của bạn?</a>
            </div>

            <div class="modal-bnt-login" id="submit-login" type="submit">
                Đăng Nhập
            </div>
</form>
            <div class="modal-title">
                <p class="title-content">Bây giờ bạn cần một tài khoản để gửi / xem các yêu cầu dịch vụ khách hàng,
                    xem các đăng ký các sản phẩm của bạn, thanh toán hoặc sửa đổi thông tin cá nhân của bạn. Thật
                    nhanh chóng và dễ dàng để 'Đăng ký'. Vui lòng đảm bảo địa chỉ
                    email của bạn là địa chỉ bạn đã cung cấp tại thời điểm đặt hàng, điều này sẽ cho phép bạn truy
                    cập tất cả các dịch vụ bạn cần. </p>
            </div>


        </div>
    </div>
    <!-- End: modal login -->
</div>
<!--Begin: modal register--->
<div class="modal-register js-modal-register">
    <div class="modal-container-register js-modal-container-register">

        <header class="modal-header">
            Tài Khoản Của Bạn!
        </header>

        <div class="modal-close-register js-modal-close-register">
            <i class="ti-close icon-close-register"></i>
        </div>

        <div class="modal-body2">
            <div class="modal-body-register">
                <div class="modal-login sub js-login-modal col-half">Đăng Nhập</div>
                <div class="modal-sub-register sub col-half">Đăng Ký</div>
            </div>

            <div class="sub-login">
                <p class="login-another">______________ Đăng Ký Bằng Cách Khác _____________</p>
            </div>

            <div class="modal-register-another">
                <img src="image/icon_fb.png" alt="FaceBook" class="icon-login-another">
                <img src="image/icon_gg.png" alt="Google" class="icon-login-another">
                <img src="image/icon_apple.png" alt="Apple" class="icon-login-another">
            </div>

            <div class="modal-input-section">
                <input type="email" placeholder="Địa chỉ email..." class="email" id="email-signUp">
                <p class="validation" id="validation-email-signUp"></p>
                <input type="password" placeholder="Nhập mật khẩu..." class="email password" id="password-signUp">
                <p class="validation" id="validation-password-signUp"></p>
                <input type="password" placeholder="Xác nhận mật khẩu..." class="email password" id="repassword-signUp">
                <p class="validation" id="validation-repassword-signUp"></p>
                <input type="checkbox" name="" class="modal-checkbox">
                <p class="checkbox">
                    Vui lòng gửi email cho tôi với các ưu đãi mới nhất</p>
            </div>

            <button type="submit" id="submit-signUp" class="modal-bnt-register">
                Đăng Ký
            </button>

            <div class="modal-title">
                <p class="title-content">Vui lòng đảm bảo địa chỉ email của bạn là địa chỉ bạn đã cung cấp tại thời
                    điểm đăng ký, điều này sẽ cho phép bạn truy cập tất cả các dịch vụ bạn cần.</p>
            </div>
        </div>
    </div>
    <!-- End: modal register -->
</div>
</div>
<!-- End: login register -->

<!-- Begin: modal message -->
<div class="icon-message">
    <img class="icon-mess js-open-mess" src="image/icon/icon-mess.ico" alt="">
</div>
<div class="modal-message message">
    <div class="mess-section">
        <div class="mess-header">
            <img class="icon-logo " src="image/logo.png" alt="">
            <img class="icon-close js-close-mess" src="image/icon/icon-close.png" alt="">
        </div>
        <div class="mess-content">
            <div class="mess-content-section">
                <p class="mess-title">Hiện tại, chúng tôi không trực tuyến.
                    Quý khách vui lòng để lại tin nhắn,
                    chúng tôi sẽ sớm liên hệ trong buổi
                    làm việc tiếp theo. Trân trọng cảm ơn.</p>
                <p class="name">Họ & Tên *</p>
                <input type="text">
                <p class="name">Địa chỉ Email *</p>
                <input type="email">
                <p class="name">Điện thoại *</p>
                <input type="phone">
                <p class="mess">Tin nhắn *</p>
                <textarea class="text-send" type="text" rows="4" spellcheck="false"> </textarea>
                <button class="send">Để lại tin nhắn</button>
            </div>
        </div>
    </div>
</div>

<script>
    // đăng nhập
    $("#submit-login").click(function(e){
        e.preventDefault()
        let emailValue = $("#email-login").val()
        let passwordValue = $("#password-login").val()
        $("#validation-email").text("")
        $("#validation-password").text("")
        $.ajax(
            {url: `SignInController`,
                type: 'POST',
                data:{
                    "email":emailValue,
                    "password": passwordValue
                },
                success: function(result){
                    if (result == "wrong email") {
                        $("#validation-email-signIn").text("email không hợp lệ")
                    }
                    else if (result == "wrong password") {
                        $("#validation-email-signIn").text("")
                        $("#validation-password-signIn").text("mật khẩu không hợp lệ")
                    }
                    else {
                        let url = window.location.href
                        if (!url.includes("logIn")) {
                            // đăng nhập thành công thì load lại trang
                            location.reload()
                        }
                        else {
                            window.location.href = "customer"
                        }

                    }
                }
            }
        );
    });
</script>

<script>
    // đăng kí
    $("#submit-signUp").click(function(e){
        e.preventDefault()
        let emailValue = $("#email-signUp").val()
        let passwordValue = $("#password-signUp").val()
        let repasswordValue = $("#repassword-signUp").val()

        // kiểm tra password và nhập lại password có đùng không
        if (passwordValue != repasswordValue) {
            $("#validation-repassword-signUp").text("xác nhận mật khẩu không đúng")
            return
        }
        // kiểm tra email có chưa @ không
        if (!emailValue.includes("@")) {
            $("#validation-email-signUp").text("không phải là email")
            return
        }
        $("#validation-email-signUp").text("")
        $("#validation-password-signUp").text("")
        $("#validation-repassword-signUp").text("")
        $.ajax(
            {url: `SignUpController`,
                type: 'POST',
                data:{
                    "email":emailValue,
                    "password": passwordValue,
                },
                success: function(result){
                    if (result == "email exist") {
                        $("#validation-email-signUp").text("email đã tồn tại")
                    }
                    else {
                        window.location.href = "customer"
                    }
                }
            }
        );
    });
</script>

<script>
    $(function(){
        $("#form-modal").removeClass('open')
    })
</script>
<!-- End: modal message -->
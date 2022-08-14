<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/4/2022
  Time: 8:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="en" dir="ltr"><head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>::eBazar:: Signin </title>
    <link rel="icon" href="../favicon.ico" type="image/x-icon"> <!-- Favicon-->

    <!-- project css file  -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">
    <style>
        .validation {
            color: red;
            font-size: 16px;
        }
    </style>
</head>
<body>
<div id="ebazar-layout" class="theme-blue">

    <!-- main body area -->
    <div class="main p-2 py-3 p-xl-5 ">

        <!-- Body: Body -->
        <div class="body d-flex p-0 p-xl-5">
            <div class="container-xxl">

                <div class="row g-0">
                    <div class="col-lg-12 d-flex justify-content-center align-items-center border-0 rounded-lg auth-h100">
                        <div class="w-100 p-3 p-md-5 card border-0 shadow-sm" style="max-width: 32rem;">
                            <!-- Form -->
                            <form class="row g-1 p-3 p-md-4"  action="<%=request.getContextPath()%>/SignIn" method="post">
                                <div class="col-12 text-center mb-5">
                                    <h1>Đăng nhập vào Admin</h1>
                                </div>
                                <div class="col-12">
                                    <div class="mb-2">
                                        <label class="form-label">Địa chỉ email</label>
                                        <input id="email" type="email" name="email" class="form-control form-control-lg" placeholder="name@example.com">
                                        <p class="validation" id="emailValidation"></p>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="mb-2">
                                        <div class="form-label">
                                                <span class="d-flex justify-content-between align-items-center">
                                                    Mật khẩu
                                                </span>
                                        </div>
                                        <input id="password" name="password" type="password" class="form-control form-control-lg" placeholder="***************">
                                        <p class="validation" id="passwordValidation"></p>
                                    </div>
                                </div>
                                <div class="col-12 text-center mt-4">
                                    <button type="submit" id="button_submit" class="btn btn-lg btn-block btn-light lift text-uppercase" atl="signin">SIGN IN</button>
                                </div>
                            </form>
                            <!-- End Form -->

                        </div>
                    </div>
                </div> <!-- End Row -->

            </div>
        </div>

    </div>

</div>

<!-- Jquery Core Js -->
<script src="../assets/bundles/libscripts.bundle.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script>
    $("#button_submit").click(function(e){
        e.preventDefault()
        let email = $("#email").val()
        let password = $("#password").val()
        let check = true
        if (email == '') {
            $("#emailValidation").text("email không được để trống")
            check = false
        }
        if (/\S+@\S+\.\S+/.test(email) == false) {
            $("#emailValidation").text("email không hợp lệ")
            check = false
        }
        if (password == '') {
            $("#passwordValidation").text("passowrd không được để trống")
            check = false
        }
        // if (password.length < 10) {
        //     $("#passwordValidation").text("độ dài mật khẩu phải lớn hơn 10")
        //     check = false
        // }


        if (check) {
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/SignIn",
                data:{email: email, password: password},
                success: function(result){
                    if (result == 'ok') {
                        window.location.href =  '<%=request.getContextPath()%>/HomeControllerAdmin'
                    }
                    else if (result == 'email not exist') {
                        $("#emailValidation").text("email không tồn tại")
                    }
                    else if (result == 'password wrong') {
                        $("#passwordValidation").text("mật khẩu không hợp lệ")
                    }
                    else {
                        $("#passwordValidation").text("mật khẩu sai")
                    }
                }
            });
        }
    })
</script>

</body></html>

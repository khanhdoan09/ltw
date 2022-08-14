<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    boolean isLogin = request.getSession().getAttribute("userAdmin") != null ? true : false;
    if (isLogin==true) {
        int role = (int) request.getSession().getAttribute("roleAdmin");
        if (role == 1) {
        }
        else {
        %>
        <script>
            alert('Yêu cầu đăng nhập bằng tài khoản admin')
            window.location.href='<%=request.getContextPath()%>/views/admin/authentication/signIn/signInAdmin.jsp'
        </script>
<%
        }
    }
    else {
        %>
        <script>
            alert('Yêu cầu đăng nhập bằng tài khoản admin')
            window.location.href='<%=request.getContextPath()%>/views/admin/authentication/signIn/signInAdmin.jsp'
        </script>
<%}%>

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
    <div class="main p-2 py-3 p-xl-5">

        <!-- Body: Body -->
        <div class="body d-flex p-0 p-xl-5">
            <div class="container-xxl">

                <div class="row g-0">


                    <div class="col-lg-12 d-flex justify-content-center align-items-center border-0 rounded-lg auth-h100">
                        <div class="w-100 p-3 p-md-5 card border-0 shadow-sm" style="max-width: 32rem;">
                            <!-- Form -->
                            <form class="row g-1 p-3 p-md-4" action="<%=request.getContextPath()%>/SignUpInAuthentication" method="post" autocomplete="off">
                                <div class="col-12 text-center mb-5">
                                    <h1>Tạo tài khoản cho nhân viên</h1>
                                </div>
                                <div class="col-6">
                                    <div class="mb-2">
                                        <label class="form-label">Tên</label>
                                        <input id="name" autocomplete="off" type="text" name="firstName" class="form-control form-control-lg" placeholder="tên">
                                        <p id="nameValidation" class="validation"></p>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="mb-2">
                                        <label class="form-label">&nbsp;</label>
                                        <input id="last" type="text" autocomplete="off" name="lastName" class="form-control form-control-lg" placeholder="họ">
                                        <p id="lastValidation" class="validation"></p>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="mb-2">
                                        <label class="form-label">Email</label>
                                        <input id="email" autocomplete="off" type="email" name="email" class="form-control form-control-lg" placeholder="name@example.com">
                                        <p id="emailValidation" class="validation"></p>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="mb-2">
                                        <label class="form-label">Mật khẩu</label>
                                        <input id="password" autocomplete="off" type="password" name="password" class="form-control form-control-lg" placeholder="mật khẩu">
                                        <p id="passwordValidation" class="validation"></p>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="mb-2">
                                        <label class="form-label">Xác nhận mật khẩu</label>
                                        <input id="confirm" autocomplete="off" type="password" name="confirmPassword" class="form-control form-control-lg" placeholder="xác nhận mật khẩu">
                                        <p id="confirmValidation" class="validation"></p>
                                    </div>
                                </div>
                                <div class="col-12 text-center mt-4">
                                    <button type="submit" id="submit_btn" class="btn btn-lg btn-block btn-light lift text-uppercase" alt="SIGNUP">Đăng kí</button>
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
    $("#submit_btn").click(function(e){
        e.preventDefault()
        let name = $("#name").val()
        let last = $("#last").val()
        let email = $("#email").val()
        let password = $("#password").val()
        let confirm = $("#confirm").val()

        let check = true
        if (email == '') {
            $("#emailValidation").text("email không được để trống")
            check = false
        }
        if (/\S+@\S+\.\S+/.test(email) == false) {
            $("#emailValidation").text("email không hợp lệ")
            check = false
        }
        if (name == '') {
            $("#nameValidation").text("tên không được để trống")
            check = false
        }
        if (last == '') {
            $("#lastValidation").text("họ không được để trống")
            check = false
        }
        if (password == '') {
            $("#passwordValidation").text("passowrd không được để trống")
            check = false
        }
        if (confirm == '') {
            $("#confirmValidation").text("confirm passowrd không được để trống")
            check = false
        }
        if (password.length < 10) {
            $("#passwordValidation").text("độ dài mật khẩu phải lớn hơn 10")
            check = false
        }
        if (confirm.length < 10) {
            $("#passwordValidation").text("độ dài xác nhận mật khẩu phải lớn hơn 10")
            check = false
        }
        if (password != confirm) {
            $("#confirmValidation").text("mật khẩu xác nhận không đúng")
            check = false
        }

        alert(check)
        if (check) {
            $.ajax({
                url: "<%=request.getContextPath()%>/SignUpInAuthentication",
                    data:{email: email, password: password, cofirmPassword: confirm, firstName: name, lastName: last},
                success: function(result){
                    alert(result)
                    if (result == 'ok') {
                        window.location.href =  '<%=request.getContextPath()%>/HomeControllerAdmin'
                    }
                    else if (result == 'email exist') {
                        $("#emailValidation").text("email đã được sử dụng")
                    }
                }
            });
        }
    })
</script>
</body></html>
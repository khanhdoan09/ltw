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
                            <form class="row g-1 p-3 p-md-4" action="<%=request.getContextPath()%>/SignUpInAuthentication" method="post">
                                <div class="col-12 text-center mb-5">
                                    <h1>Tạo tài khoản cho nhân viên</h1>
                                </div>
                                <div class="col-6">
                                    <div class="mb-2">
                                        <label class="form-label">Tên</label>
                                        <input type="text" name="firstName" class="form-control form-control-lg" placeholder="John">
                                        <%
                                            Object firstNameValidation = request.getAttribute("firstNameValidation");
                                            if(firstNameValidation != null){%>
                                        <p class="validation"><%=firstNameValidation.toString()%></p>
                                         <%}%>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="mb-2">
                                        <label class="form-label">&nbsp;</label>
                                        <input type="text" name="lastName" class="form-control form-control-lg" placeholder="Parker">
                                        <%
                                            Object lastNameValidation = request.getAttribute("lastNameValidation");
                                            if(lastNameValidation != null){%>
                                        <p class="validation"><%=lastNameValidation.toString()%></p>
                                        <%}%>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="mb-2">
                                        <label class="form-label">Email</label>
                                        <input type="email" name="email" class="form-control form-control-lg" placeholder="name@example.com">
                                        <%
                                            Object emailValidation = request.getAttribute("emailValidation");
                                            if(emailValidation != null){%>
                                        <p class="validation"><%=emailValidation.toString()%></p>
                                        <%}%>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="mb-2">
                                        <label class="form-label">Mật khẩu</label>
                                        <input type="password" name="password" class="form-control form-control-lg" placeholder="10+ characters required">
                                        <%
                                            Object passwordValidation = request.getAttribute("passwordValidation");
                                            if(passwordValidation != null){%>
                                        <p class="validation"><%=passwordValidation.toString()%></p>
                                        <%}%>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="mb-2">
                                        <label class="form-label">Xác nhận mật khẩu</label>
                                        <input type="password" name="confirmPassword" class="form-control form-control-lg" placeholder="8+ characters required">
                                        <%
                                            Object confirmValidation = request.getAttribute("confirmValidation");
                                            if(confirmValidation != null){%>
                                        <p class="validation"><%=confirmValidation.toString()%></p>
                                        <%}%>
                                    </div>
                                </div>
                                <div class="col-12 text-center mt-4">
                                    <button type="submit" class="btn btn-lg btn-block btn-light lift text-uppercase" alt="SIGNUP">Đăng kí</button>
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


</body></html>
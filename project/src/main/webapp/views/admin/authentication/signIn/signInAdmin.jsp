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
                            <form class="row g-1 p-3 p-md-4"  action="/project_war_exploded/SignIn" method="post">
                                <div class="col-12 text-center mb-5">
                                    <h1>Sign in</h1>
                                    <span>Free access to our dashboard.</span>
                                </div>
                                <div class="col-12">
                                    <div class="mb-2">
                                        <label class="form-label">Email address</label>
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
                                        <div class="form-label">
                                                <span class="d-flex justify-content-between align-items-center">
                                                    Password
                                                </span>
                                        </div>
                                        <input name="password" type="password" class="form-control form-control-lg" placeholder="***************">
                                        <%
                                            Object passwordValidation = request.getAttribute("passwordValidation");
                                            if(passwordValidation != null){%>
                                        <p class="validation"><%=passwordValidation.toString()%></p>
                                        <%}%>
                                    </div>
                                </div>
                                <div class="col-12 text-center mt-4">
                                    <button type="submit" class="btn btn-lg btn-block btn-light lift text-uppercase" atl="signin">SIGN IN</button>
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

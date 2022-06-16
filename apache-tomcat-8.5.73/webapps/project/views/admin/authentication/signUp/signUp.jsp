<html class="no-js" lang="en" dir="ltr"><head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>::eBazar:: Signup </title>
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
                    <div class="col-lg-6 d-none d-lg-flex justify-content-center align-items-center rounded-lg auth-h100">
                        <div style="max-width: 25rem;">
                            <div class="text-center mb-5">
                                <i class="bi bi-bag-check-fill  text-primary" style="font-size: 90px;"></i>
                            </div>
                            <div class="mb-5">
                                <h2 class="color-900 text-center">A few clicks is all it takes.</h2>
                            </div>
                            <!-- Image block -->
                            <div class="">
                                <img src="img.png" alt="login-img">
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 d-flex justify-content-center align-items-center border-0 rounded-lg auth-h100">
                        <div class="w-100 p-3 p-md-5 card border-0 shadow-sm" style="max-width: 32rem;">
                            <!-- Form -->
                            <form class="row g-1 p-3 p-md-4" action="/project_war_exploded/SignUp" method="post">
                                <div class="col-12 text-center mb-5">
                                    <h1>Create your account</h1>
                                    <span>Free access to our dashboard.</span>
                                </div>
                                <div class="col-6">
                                    <div class="mb-2">
                                        <label class="form-label">Full name</label>
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
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="mb-2">
                                        <label class="form-label">Email address</label>
                                        <input type="email" name="email" class="form-control form-control-lg" placeholder="name@example.com">
                                        <%
                                            Object emailValidation = request.getAttribute("emailValidation");
                                            if(emailValidation != null){%>
                                        <p class="validation"><%=emailValidation.toString()%></p>
                                        <%}%>                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="mb-2">
                                        <label class="form-label">Password</label>
                                        <input type="password" name="password" class="form-control form-control-lg" placeholder="8+ characters required">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="mb-2">
                                        <label class="form-label">Confirm password</label>
                                        <input type="password" name="confirmPassword" class="form-control form-control-lg" placeholder="8+ characters required">
                                    </div>
                                </div>
                                <div class="col-12 text-center mb-4">
                                    <a class="btn btn-lg btn-light btn-block" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/project_war_exploded/SignUp&response_type=code
    &client_id=856852490504-lo7e2emuf0fi5b8d881adt9cqrusebu0.apps.googleusercontent.com&approval_prompt=force">
                                            <span class="d-flex justify-content-center align-items-center">
                                                <img class="avatar xs me-2" src="img_1.png" alt="Image Description">
                                                Sign up with Google
                                            </span>
                                    </a>
                                </div>
                                <div class="col-12 text-center mt-4">
                                    <button type="submit" class="btn btn-lg btn-block btn-light lift text-uppercase" alt="SIGNUP">SIGN UP</button>
                                </div>
                                <div class="col-12 text-center mt-4">
                                    <span>Already have an account? <a href="auth-signin.html" title="Sign in" class="text-secondary">Sign in here</a></span>
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
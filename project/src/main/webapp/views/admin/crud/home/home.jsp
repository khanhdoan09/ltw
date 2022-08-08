<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/8/2022
  Time: 10:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="beans.HomeAdmin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% HomeAdmin homeAdmin = (HomeAdmin) request.getAttribute("homeAdmin");%>
<!doctype html>
<html class="no-js" lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin | Dragon Sport </title>
    <!-- Favicon-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet"
          type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css    ">

    <!-- project css file  ..-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.0/css/dataTables.bootstrap4.min.css">

</head>

<body>
<div id="ebazar-layout" class="theme-blue">

    <!-- sidebar -->
    <%@include file="../header.jsp" %>



    <!-- main body area -->
    <div class="main px-lg-4 px-md-4">

        <!-- Body: Header -->


        <!-- Body: Body -->
        <div class="body d-flex py-3">
            <div class="container-xxl">
                <!-- Row end  -->

                <div class="row g-3">
                    <div class="col-lg-12 col-md-12">
                        <div class="tab-content mt-1">
                            <div class="tab-pane fade show active" id="summery-today">
                                <div class="row g-1 g-sm-3 mb-3 row-deck">
                                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                                        <div class="card">
                                            <div class="card-body py-xl-4 py-3 d-flex flex-wrap align-items-center justify-content-between">
                                                <div class="left-info">
                                                    <span class="text-muted">Khách hàng</span>
                                                    <div><span class="fs-6 fw-bold me-2"><%= homeAdmin.getCountUser()%></span></div>
                                                </div>
                                                <div class="right-icon">
                                                    <i class="fas fa-users"></i>                                                    </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                                        <div class="card">
                                            <div class="card-body py-xl-4 py-3 d-flex flex-wrap align-items-center justify-content-between">
                                                <div class="left-info">
                                                    <span class="text-muted">Đơn hàng</span>
                                                    <div><span class="fs-6 fw-bold me-2"><%= homeAdmin.getCountOrder()%></span></div>
                                                </div>
                                                <div class="right-icon">
                                                    <i class="fas fa-shopping-cart"></i>                                                    </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                                        <div class="card">
                                            <div class="card-body py-xl-4 py-3 d-flex flex-wrap align-items-center justify-content-between">
                                                <div class="left-info">
                                                    <span class="text-muted">Doanh thu</span>
                                                    <div><span class="fs-6 fw-bold me-2"><%= homeAdmin.getTurnover()%></span></div>
                                                </div>
                                                <div class="right-icon">
                                                    <i class="fas fa-percent"></i>                                                    </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                                        <div class="card">
                                            <div class="card-body py-xl-4 py-3 d-flex flex-wrap align-items-center justify-content-between">
                                                <div class="left-info">
                                                    <span class="text-muted">Số lượng sản phẩm</span>
                                                    <div><span class="fs-6 fw-bold me-2"><%= homeAdmin.getQuantityProduct()%></span></div>
                                                </div>
                                                <div class="right-icon">
                                                    <i class="fas fa-calculator"></i>                                                    </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                                        <div class="card">
                                            <div class="card-body py-xl-4 py-3 d-flex flex-wrap align-items-center justify-content-between">
                                                <div class="left-info">
                                                    <span class="text-muted">Tổng số lượng chi tiết sản phẩm</span>
                                                    <div><span class="fs-6 fw-bold me-2"><%= homeAdmin.getqPDetail()%></span></div>
                                                </div>
                                                <div class="right-icon">
                                                    <i class="fas fa-shopping-bag"></i>                                                    </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                                        <div class="card">
                                            <div class="card-body py-xl-4 py-3 d-flex flex-wrap align-items-center justify-content-between">
                                                <div class="left-info">
                                                    <span class="text-muted">Tổng sản phẩm đã bán</span>
                                                    <div><span class="fs-6 fw-bold me-2"><%= homeAdmin.getCountOrderOk()%></span></div>
                                                </div>
                                                <div class="right-icon">
                                                    <i class="fa-solid fa-check"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                                        <div class="card">
                                            <div class="card-body py-xl-4 py-3 d-flex flex-wrap align-items-center justify-content-between">
                                                <div class="left-info">
                                                    <span class="text-muted">Tổng giá sản phẩm</span>
                                                    <div><span class="fs-6 fw-bold me-2"><%= homeAdmin.getSumPrice()%></span></div>
                                                </div>
                                                <div class="right-icon">
                                                    <i class="fas fa-square-root-alt"></i>                                                    </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                                        <div class="card">
                                            <div class="card-body py-xl-4 py-3 d-flex flex-wrap align-items-center justify-content-between">
                                                <div class="left-info">
                                                    <span class="text-muted">Tổng sản phẩm đã giảm giá</span>
                                                    <div><span class="fs-6 fw-bold me-2"><%= homeAdmin.getCountProductSale()%></span></div>
                                                </div>
                                                <div class="right-icon">
                                                    <i class="fas fa-star"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                                        <div class="card">
                                            <div class="card-body py-xl-4 py-3 d-flex flex-wrap align-items-center justify-content-between">
                                                <div class="left-info">
                                                    <span class="text-muted">Tổng số lượng nhãn hàng</span>
                                                    <div><span class="fs-6 fw-bold me-2"><%= homeAdmin.getCountBrand()%></span></div>
                                                </div>
                                                <div class="right-icon">
                                                    <i class="fab fa-delicious"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                                        <div class="card">
                                            <div class="card-body py-xl-4 py-3 d-flex flex-wrap align-items-center justify-content-between">
                                                <div class="left-info">
                                                    <span class="text-muted">Tổng số lượng bình luận</span>
                                                    <div><span class="fs-6 fw-bold me-2"><%= homeAdmin.getCountComment()%></span>
                                                    </div>
                                                </div>
                                                <div class="right-icon">
                                                    <i class="fa-solid fa-comment"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                                        <div class="card">
                                            <div class="card-body py-xl-4 py-3 d-flex flex-wrap align-items-center justify-content-between">
                                                <div class="left-info">
                                                    <span class="text-muted">Tổng số lượng thể loại</span>
                                                    <div><span class="fs-6 fw-bold me-2"><%= homeAdmin.getCountCategory()%></span></div>
                                                </div>
                                                <div class="right-icon">
                                                    <i class="fa-solid fa-store"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- row end -->
                            </div>s
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Custom Settings-->

    </div>

</div>

<!-- Jquery Core Js -->

<script src="assets/bundles/libscripts.bundle.js"></script>

<!-- Jquery Plugin -->
<script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
<script src="assets/plugin/multi-select/js/jquery.multi-select.js"></script>
<!-- Multi Select Plugin Js -->
<script src="assets/plugin/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
<!-- Bootstrap Tags Input Plugin Js -->
<script src="assets/plugin/cropper/cropper.min.js"></script>
<script src="assets/plugin/cropper/cropper-init.js"></script>
<script src="assets/bundles/dropify.bundle.js"></script>
<script src="assets/bundles/dataTables.bundle.js"></script>

<!-- Jquery Page Js -->

<script src="../js/template.js"></script>


</body>

</html>

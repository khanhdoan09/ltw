<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Image" %>
<%@ page import="java.io.File" %>
<%@ page import="controller.admin.UploadFile" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/2/2022
  Time: 7:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>::eBazar:: Product Edit </title>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <!-- Favicon-->

    <!--plugin css file -->
    <link rel="stylesheet" href="assets/plugin/multi-select/css/multi-select.css">
    <!-- Multi Select Css -->
    <link rel="stylesheet" href="assets/plugin/bootstrap-tagsinput/bootstrap-tagsinput.css">
    <!-- Bootstrap Tagsinput Css -->
    <link rel="stylesheet" href="assets/plugin/cropper/cropper.min.css">
    <!--Cropperer Css -->
    <link rel="stylesheet" href="assets/plugin/dropify/dist/css/dropify.min.css" />
    <!-- Dropify Css -->
    <link rel="stylesheet" href="assets/plugin/datatables/responsive.dataTables.min.css">
    <!-- Datatable Css -->
    <link rel="stylesheet" href="assets/plugin/datatables/dataTables.bootstrap5.min.css">
    <!-- Datatable Css -->

    <!-- project css file  -->
    <link rel="stylesheet" href="admin/assets/css/ebazar.style.min.css">

    <script src="javascript/khanh-js.js"></script>
</head>


<body>
<div id="ebazar-layout" class="theme-blue">

    <!-- sidebar -->
    <div class="sidebar px-4 py-4 py-md-4 me-0">
        <div class="d-flex flex-column h-100">
            <a href="index.html" class="mb-0 brand-icon">

                <span class="logo-text">Dragon Sport</span>
            </a>
            <!-- Menu: main ul -->
            <ul class="menu-list flex-grow-1 mt-3">
                <li><a class="m-link" href="index.html"><i class="fas fa-home" style="margin: 0 10px;"></i> <span>Trang chủ</span></a></li>
                <li class="collapsed">
                    <a class="m-link active" data-bs-toggle="collapse" data-bs-target="#menu-product" href="#">
                        <i class="fas fa-shopping-cart" style="margin: 0 10px;"></i> <span>Sản phẩm</span> </a>
                    <!-- Menu: Sub menu ul -->
                    <ul class="sub-menu collapse" id="menu-product">

                        <li><a class="ms-link active" href="product-edit.html">Chỉnh sửa sản phẩm</a></li>
                        <li><a class="ms-link" href="product-add.html">Thêm sản phẩm</a></li>

                    </ul>
                </li>

                <li class="collapsed">
                    <a class="m-link"  href="order-invoices.html">
                        <i class="fab fa-intercom" style="margin: 0 10px;"></i> <span>Danh sách sản phẩm</span> </a>


                </li>
                <li class="collapsed">
                    <a class="m-link"  href="customers.html">
                        <i class="fas fa-user-alt" style="margin: 0 10px;"></i> <span>Khách hàng</span> </a>

                </li>




            </ul>
            <!-- Menu: menu collepce btn -->
            <button type="button" class="btn btn-link sidebar-mini-btn text-light">
                <span class="ms-2"><i class="fas fa-dot-circle"></i></span>
            </button>
        </div>
    </div>


    <!-- main body area -->
    <div class="main px-lg-4 px-md-4">

        <!-- Body: Header -->


        <%Object obj = request.getAttribute("productDetail");
        Product product = (Product) obj;%>
        <!-- Body: Body -->
<%--        <form class="body d-flex py-3" method="post" enctype="multipart/form-data" action="SaveEditProduct?id=<%=product.getId()%>">--%>
        <form class="body d-flex py-3" method="post" enctype="multipart/form-data" action="UploadDownLoadFileServlet">--%>

        <div class="container-xxl">

                <div class="row align-items-center">
                    <div class="border-0 mb-4">
                        <div class="card-header py-3 no-bg bg-transparent d-flex align-items-center px-0 justify-content-between border-bottom flex-wrap">
                            <h3 class="fw-bold mb-0">Chỉnh sửa sản phẩm</h3>
                            <button type="submit" class="btn btn-primary btn-set-task w-sm-100 py-2 px-5 text-uppercase">Save</button>
                        </div>
                    </div>
                </div>
                <!-- Row end  -->

                <div class="row g-3 mb-3">
                    <div class="col-xl-4 col-lg-4">
                        <div class="sticky-lg-top">
                            <div class="card mb-3">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">
                                    <h6 class="m-0 fw-bold">Thông tin sản phẩm</h6>
                                </div>
                                <div class="card-body">
                                    <div class="row g-3 align-items-center">
                                        <div class="col-md-12">
                                            <label class="form-label">Id sản phẩm</label>
                                            <input name="id" value="<%=product.getId()%>" placeholder="<%=product.getId()%>"/>
                                        </div>
                                        <div class="col-md-12">
                                            <label class="form-label">Giá sản phẩm</label>
                                            <input type="text" class="form-control" name="price" value="<%=product.getPrice()%>">
                                        </div>
                                        <div class="col-md-12">
                                            <label class="form-label">Giảm giá</label>
                                            <input type="text" class="form-control" name="sale-rate" value="<%=product.getSaleRate()%>">
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="card mb-3">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">
                                    <h6 class="m-0 fw-bold">Màu</h6>
                                </div>
                                <div class="card-body">
                                    <%
                                        Set<String> listColor = product.getListSizeColor().listColor();
                                        for (Iterator<String> it = listColor.iterator(); it.hasNext(); ) {
                                            String color = it.next();
                                            %>
                                    <div class="form-check">
                                        <input class="form-check-input" id="color-<%=color%>" type="checkbox" checked>
                                        <label class="form-check-label" for="color-<%=color%>">
                                            <%=color%>
                                        </label>
                                    </div>
                                        <%
                                        }
                                        %>
                                </div>
                            </div>
                            <div class="card mb-3">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">
                                    <h6 class="m-0 fw-bold">Size</h6>
                                </div>
                                <div class="card-body">
                                    <%
                                        List<Integer> listSize = product.getListSizeColor().getListSize();
                                        for(int i = 0,j=37; i < listSize.size(); i++,j++){%>
                                    <div class="form-check">
                                        <input class="form-check-input" checked type="checkbox" id="sizecheck<%=j%>">
                                        <label class="form-check-label" for="sizecheck<%=j%>">
                                            <%if(j==listSize.get(i)){%>
                                            <%=listSize.get(i)%>
                                            <%}else{%>
                                            <%=j%>
                                            <%}%>
                                        </label>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                            <div class="card mb-3">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">
                                    <h6 class="m-0 fw-bold">Ngày công bố</h6>
                                </div>
                                <div class="card-body">
                                    <div class="row g-3 align-items-center">
                                        <div class="col-md-12">
                                            <label class="form-label">Ngày</label>
                                            <input type="date" class="form-control w-100" value="<%=product.getCreate_at()%>">
                                        </div>
                                        <div class="col-md-12">
                                            <label class="form-label">Giờ</label>
                                            <input type="time" class="form-control w-100" value="10:30">
                                        </div>
                                    </div>
                                </div>
                            </div>



                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-8">
                        <div class="card mb-3">
                            <div class="card-header py-3 d-flex justify-content-between bg-transparent border-bottom-0">
                                <h6 class="mb-0 fw-bold ">Thông tin cơ bản</h6>
                            </div>
                            <div class="card-body">
                                <div>
                                    <div class="row g-3 align-items-center">
                                        <div class="col-md-6">
                                            <label class="form-label">Tên</label>
                                            <input type="file" name="fileImg">
                                            <%
                                                File productDir = new File(request.getServletContext().getAttribute("FILES_DIR") + File.separator);
                                            %><img src="">
                                            <img src="../apache-tomcat-8.5.73/bin/null/webapps/project/manage/upload/product/Screenshot.png ">
                                            <input type="text" class="form-control" name="name" value="<%=product.getName()%>">
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Nhãn hàng</label>
                                            <input type="text" class="form-control" value="<%=product.getBrand()%>">
                                        </div>
                                        <div class="col-md-12">
                                            <label class="form-label">Link hình</label>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text">https://eBazar.com</span>
                                                <input type="text" class="form-control" value="/product/Fossilsmart">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <label class="form-label" for="description">Mô tả</label>
                                            <input name="description" type="text" style="display: block; width: 100%; height: 80px;" id="description" placeholder="
                                              <%=product.getDescription()%>" value="<%=product.getDescription()%>" >
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card mb-3">
                            <div class="card-header py-3 d-flex justify-content-between bg-transparent border-bottom-0">
                                <h6 class="mb-0 fw-bold ">Images</h6>
                            </div>
                            <div class="card-body">
                                <form>
                                    <div class="row g-3 align-items-center">
                                        <div class="col-md-12" style="display: flex; flex-wrap: wrap">
                                            <label class="form-label">Product Images Upload</label>
                                            <div >
                                                <%for(int i= 0;i < product.getListImg().size(); i++){
                                                Image img = product.getListImg().get(i);
                                                if (img.getLelvel()==0) {%>
                                                <div style="width: 100%; height: 20px"></div>
                                                <h5>Màu: <%=img.getColor()%></h5>
                                                <%}%>
                                                <img src="data/imgAll/upload/product/<%=product.getListImg().get(i).getImg()%>.jpg" width="200" height="200">
                                                <%}%>
                                            </div>
                                        </div>

                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">
                                <h6 class="m-0 fw-bold">Inventory Info</h6>
                            </div>
                            <div class="card-body">
                                <div class="row g-3 align-items-center">
                                    <div class="col-md-12">
                                        <label class="form-label">Đã bán</label>
                                        <input type="text" name="sold" class="form-control" value="<%=product.getQuantitySold()%>">
                                    </div>
                                    <div class="col-md-12">
                                        <label class="form-label">Tổng số lượng</label>
                                        <input type="text"name="total-quantity" class="form-control" value="<%=product.getQuantity()%>">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%String[] category = product.getCategory().split(" ");
                        String gender = category[1];
                        String typeCategory = category[0];
                        %>
                        <div class="card mb-3">
                            <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">
                                <h6 class="m-0 fw-bold">Giới tính</h6>
                            </div>

                            <div class="card-body">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="couponsstatus"
                                        <%
                                         if(gender.equals("Man")){%>
                                            <%="checked"%>
                                        <%}%>>
                                    <label class="form-check-label">
                                        Nam
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="couponsstatus"
                                        <%
                                         if(gender.equals("Woman")){%>
                                        <%="checked"%>
                                        <%}%>>
                                    <label class="form-check-label">
                                        Nữ
                                    </label>
                                </div>

                            </div>
                            <div class="card-body">
                                <label class="form-label">Thể loại</label>
                                <select class="form-select" size="3" aria-label="size 3 select example">
                                    <option value="1"  <%
                                        if(typeCategory.equals("Skateboard")){%>
                                            <%="selected"%>
                                            <%}%>>Skateboard</option>
                                    <option value="2" <%
                                        if(typeCategory.equals("Slides")){%>
                                            <%="selected"%>
                                            <%}%>>Slides</option>
                                    <option value="3" <%
                                        if(typeCategory.equals("Sneakers")){%>
                                            <%="selected"%>
                                            <%}%>>Sneakers</option>
                                    <option value="4" <%
                                        if(typeCategory.equals("Running")){%>
                                            <%="selected"%>
                                            <%}%>>Trainers</option>

                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row end  -->

            </div>
        </form>

        <!-- Modal Custom Settings-->
        <div class="modal fade right" id="Settingmodal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog  modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Custom Settings</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body custom_setting">
                        <!-- Settings: Color -->
                        <div class="setting-theme pb-3">
                            <h6 class="card-title mb-2 fs-6 d-flex align-items-center"><i class="icofont-color-bucket fs-4 me-2 text-primary"></i>Template Color Settings</h6>
                            <ul class="list-unstyled row row-cols-3 g-2 choose-skin mb-2 mt-2">
                                <li data-theme="indigo">
                                    <div class="indigo"></div>
                                </li>
                                <li data-theme="tradewind">
                                    <div class="tradewind"></div>
                                </li>
                                <li data-theme="monalisa">
                                    <div class="monalisa"></div>
                                </li>
                                <li data-theme="blue" class="active">
                                    <div class="blue"></div>
                                </li>
                                <li data-theme="cyan">
                                    <div class="cyan"></div>
                                </li>
                                <li data-theme="green">
                                    <div class="green"></div>
                                </li>
                                <li data-theme="orange">
                                    <div class="orange"></div>
                                </li>
                                <li data-theme="blush">
                                    <div class="blush"></div>
                                </li>
                                <li data-theme="red">
                                    <div class="red"></div>
                                </li>
                            </ul>
                        </div>
                        <div class="sidebar-gradient py-3">
                            <h6 class="card-title mb-2 fs-6 d-flex align-items-center"><i class="icofont-paint fs-4 me-2 text-primary"></i>Sidebar Gradient</h6>
                            <div class="form-check form-switch gradient-switch pt-2 mb-2">
                                <input class="form-check-input" type="checkbox" id="CheckGradient">
                                <label class="form-check-label" for="CheckGradient">Enable Gradient! ( Sidebar )</label>
                            </div>
                        </div>
                        <!-- Settings: Template dynamics -->
                        <div class="dynamic-block py-3">
                            <ul class="list-unstyled choose-skin mb-2 mt-1">
                                <li data-theme="dynamic">
                                    <div class="dynamic"><i class="icofont-paint me-2"></i> Click to Dyanmic Setting</div>
                                </li>
                            </ul>
                            <div class="dt-setting">
                                <ul class="list-group list-unstyled mt-1">
                                    <li class="list-group-item d-flex justify-content-between align-items-center py-1 px-2">
                                        <label>Primary Color</label>
                                        <button id="primaryColorPicker" class="btn bg-primary avatar xs border-0 rounded-0"></button>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center py-1 px-2">
                                        <label>Secondary Color</label>
                                        <button id="secondaryColorPicker" class="btn bg-secondary avatar xs border-0 rounded-0"></button>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center py-1 px-2">
                                        <label class="text-muted">Chart Color 1</label>
                                        <button id="chartColorPicker1" class="btn chart-color1 avatar xs border-0 rounded-0"></button>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center py-1 px-2">
                                        <label class="text-muted">Chart Color 2</label>
                                        <button id="chartColorPicker2" class="btn chart-color2 avatar xs border-0 rounded-0"></button>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center py-1 px-2">
                                        <label class="text-muted">Chart Color 3</label>
                                        <button id="chartColorPicker3" class="btn chart-color3 avatar xs border-0 rounded-0"></button>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center py-1 px-2">
                                        <label class="text-muted">Chart Color 4</label>
                                        <button id="chartColorPicker4" class="btn chart-color4 avatar xs border-0 rounded-0"></button>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center py-1 px-2">
                                        <label class="text-muted">Chart Color 5</label>
                                        <button id="chartColorPicker5" class="btn chart-color5 avatar xs border-0 rounded-0"></button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- Settings: Font -->
                        <div class="setting-font py-3">
                            <h6 class="card-title mb-2 fs-6 d-flex align-items-center"><i class="icofont-font fs-4 me-2 text-primary"></i> Font Settings</h6>
                            <ul class="list-group font_setting mt-1">
                                <li class="list-group-item py-1 px-2">
                                    <div class="form-check mb-0">
                                        <input class="form-check-input" type="radio" name="font" id="font-poppins" value="font-poppins">
                                        <label class="form-check-label" for="font-poppins">
                                            Poppins Google Font
                                        </label>
                                    </div>
                                </li>
                                <li class="list-group-item py-1 px-2">
                                    <div class="form-check mb-0">
                                        <input class="form-check-input" type="radio" name="font" id="font-opensans" value="font-opensans" checked="">
                                        <label class="form-check-label" for="font-opensans">
                                            Open Sans Google Font
                                        </label>
                                    </div>
                                </li>
                                <li class="list-group-item py-1 px-2">
                                    <div class="form-check mb-0">
                                        <input class="form-check-input" type="radio" name="font" id="font-montserrat" value="font-montserrat">
                                        <label class="form-check-label" for="font-montserrat">
                                            Montserrat Google Font
                                        </label>
                                    </div>
                                </li>
                                <li class="list-group-item py-1 px-2">
                                    <div class="form-check mb-0">
                                        <input class="form-check-input" type="radio" name="font" id="font-mukta" value="font-mukta">
                                        <label class="form-check-label" for="font-mukta">
                                            Mukta Google Font
                                        </label>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!-- Settings: Light/dark -->
                        <div class="setting-mode py-3">
                            <h6 class="card-title mb-2 fs-6 d-flex align-items-center"><i class="icofont-layout fs-4 me-2 text-primary"></i>Contrast Layout</h6>
                            <ul class="list-group list-unstyled mb-0 mt-1">
                                <li class="list-group-item d-flex align-items-center py-1 px-2">
                                    <div class="form-check form-switch theme-switch mb-0">
                                        <input class="form-check-input" type="checkbox" id="theme-switch">
                                        <label class="form-check-label" for="theme-switch">Enable Dark Mode!</label>
                                    </div>
                                </li>
                                <li class="list-group-item d-flex align-items-center py-1 px-2">
                                    <div class="form-check form-switch theme-high-contrast mb-0">
                                        <input class="form-check-input" type="checkbox" id="theme-high-contrast">
                                        <label class="form-check-label" for="theme-high-contrast">Enable High Contrast</label>
                                    </div>
                                </li>
                                <li class="list-group-item d-flex align-items-center py-1 px-2">
                                    <div class="form-check form-switch theme-rtl mb-0">
                                        <input class="form-check-input" type="checkbox" id="theme-rtl">
                                        <label class="form-check-label" for="theme-rtl">Enable RTL Mode!</label>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="modal-footer justify-content-start">
                        <button type="button" class="btn btn-white border lift" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary lift">Save Changes</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Cropper-->
        <div class="modal docs-cropped" id="getCroppedCanvasModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Cropped</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body"></div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white border lift" data-bs-dismiss="modal">Close</button>
                        <a class="btn btn-primary" id="download" href="javascript:void(0);" download="cropped.jpg">Download</a>
                    </div>
                </div>
            </div>
        </div>

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
<script>
    $(document).ready(function() {
        //Ch-editer
        ClassicEditor
            .create(document.querySelector('#editor'))
            .catch(error => {
                console.error(error);
            });
        //Datatable
        $('#myCartTable')
            .addClass('nowrap')
            .dataTable({
                responsive: true,
                columnDefs: [{
                    targets: [-1, -3],
                    className: 'dt-body-right'
                }]
            });
        $('.deleterow').on('click', function() {
            var tablename = $(this).closest('table').DataTable();
            tablename
                .row($(this)
                    .parents('tr'))
                .remove()
                .draw();

        });
        //Multiselect
        $('#optgroup').multiSelect({
            selectableOptgroup: true
        });
    });

    $(function() {
        $('.dropify').dropify();

        var drEvent = $('#dropify-event').dropify();
        drEvent.on('dropify.beforeClear', function(event, element) {
            return confirm("Do you really want to delete \"" + element.file.name + "\" ?");
        });

        drEvent.on('dropify.afterClear', function(event, element) {
            alert('File deleted');
        });

        $('.dropify-fr').dropify({
            messages: {
                default: 'Glissez-dÃ©posez un fichier ici ou cliquez',
                replace: 'Glissez-dÃ©posez un fichier ou cliquez pour remplacer',
                remove: 'Supprimer',
                error: 'DÃ©solÃ©, le fichier trop volumineux'
            }
        });
    });
</script>
<script src="../js/template.js"></script>

</body>

</html>
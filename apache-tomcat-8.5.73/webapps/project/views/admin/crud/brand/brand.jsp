<%@ page import="beans.Product" %>
<%@ page import="beans.Image" %>
<%@ page import="java.io.File" %>
<%@ page import="beans.ProductDetail" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.product.DaoProductAdmin" %>
<%@ page import="dao.product.color.DaoProductColor" %>
<%@ page import="dao.product.brand.DaoProductBrand" %>
<%@ page import="beans.Brand" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/2/2022
  Time: 7:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    boolean isLogin = request.getSession().getAttribute("userAdmin") != null ? true : false;
    if (isLogin == false) {
        request.getRequestDispatcher("/views/admin/authentication/signIn/signIn.jsp").forward(request, response);
    }
%>
<html class="no-js" lang="en" dir="ltr">

<head>
    <%Object obj = request.getAttribute("productDetail");
        Product product = (Product) obj;%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin | Dragon Sport </title>
    <link rel="shortcut icon" href="/user/image/logo.png">

    <!-- Favicon-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet"
          type="text/css" />
    <script src="javascript/jquery-2.1.1.min.js" type="text/javascript"></script>

    <!-- plugin css file  -->
    <link rel="stylesheet" href="assets/plugin/datatables/responsive.dataTables.min.css">
    <link rel="stylesheet" href="assets/plugin/datatables/dataTables.bootstrap5.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css    ">

    <!-- project css file  -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">

    <script src="javascript/khanh-js.js"></script>


    <style>
        .contain-list-brand {
            margin: 5px;
            padding: 5px;
        }
        .contain-brand {
            border: 1px solid black;
            margin: 5px;
            padding: 5px;
        }
        .size-brand {
            width: 70px;
            height: 70px;
        }
        .btn-danger {
            color: black;
        }
        .clicked {
            color: #eeee13;
        }
        #brands {
            display: none;
        }
        .remove-img-detail {
            width: 27%;
            margin: 5px 0;
            background-color: #dedee4;
        }
        .fileNewImg {
            background-color: #62637a;
            color:white;
            padding: 5px;
            border-radius: 10px;
            font-size: 15px;
            margin: 5px 0;
        }
        .remove-color {
            background-color: #62637a;
            color:white;
            padding: 5px;
            border-radius: 10px;
            font-size: 15px;
            margin: 5px 0;
        }
    </style>

</head>


<body>
<div id="ebazar-layout" class="theme-blue">

    <!-- sidebar -->
    <%@include file="../header.jsp" %>


    <!-- main body area -->
    <div class="main">

        <!-- Body: Header -->

        <!-- Body: Body -->

        <div id="form-edit-product" class="body d-flex py-3" >

            <div class="container-xxl">
                <div class="row align-items-center">
                    <div class="border-0 mb-4">
                        <div class="card-header py-3 no-bg bg-transparent d-flex align-items-center px-0 justify-content-between border-bottom flex-wrap">
                            <h3 class="fw-bold mb-0">Ch???nh s???a s???n ph???m</h3>
                            <button type="submit" id="bt-save-edit-product" class="btn btn-primary btn-set-task w-sm-100 py-2 px-5 text-uppercase">Save</button>
                        </div>
                    </div>
                </div>
                <!-- Row end  -->
                <div class="row g-3 mb-3">
                    <div class="col-xl-12 col-lg-12">

                        <div class="card mb-3">
                            <div class="card-header py-3 d-flex justify-content-between bg-transparent border-bottom-0">
                                <h6 class="mb-0 fw-bold ">Images</h6>
                            </div>
                            <div class="card-body text-center">
                                <div>
                                    <div class="row g-3 align-items-center">
                                        <div>
                                            <div class="col-md-12" style="display: flex; flex-wrap: wrap">
                                                <label class="form-label">Nh??n h??ng</label>
                                            </div>
                                            <div>
                                                <button id="add-new-brand">Th??m nh??n h??ng</button>
                                            </div>
                                            <div class="d-flex flex-wrap contain-list-brand">
                                                <%List<Brand> listBrand = (List<Brand>) request.getAttribute("listBrand");
                                                    for (int i =0 ; i < listBrand.size(); i++) {
                                                        Brand brand = listBrand.get(i);%>
                                                <form action="UpdateBrandAdminController?idBrand=<%=brand.getId()%>" id="form-<%=i%>"  method="post" enctype="multipart/form-data" class="d-grid contain-brand contain-form-brand">
                                                    <span>id: </span>
                                                    <input type="text" value="<%=brand.getId()%>" readonly>
                                                    <span>name: </span>
                                                    <input  id="nameBrand-<%=i%>" type="text" value="<%=brand.getName()%>" name="nameBrand">
                                                    <img id="imgShow-<%=i%>" alt="brand" src="upload/brand/<%=brand.getImg()%>" width="150px" height="150px">
                                                    <input type="file" name="imgBrand" class="imgLoad" data-imgshow="imgShow-<%=i%>">
                                                    <button class="remove-brand size-brand my-2 btn btn-primary" data-id="<%=brand.getId()%>" data-contain="form-<%=i%>">X??a</button>
                                                    <button class="saveBrand size-brand btn btn-danger" data-idbrand="<%=brand.getId()%>">Save</button>
                                                </form>
                                                <%}
                                                %>
                                            </div>
                                            <div class="d-flex flex-wrap contain-add-brand">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
                <!-- Row end  -->

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

<script src="../js/template.js"></script>



<script>
    // delete brand
    $(".remove-brand").each(function() {
        $(this).click(function(e) {
            e.preventDefault()
            let idBrand = $(this).data("id")
            let idContain = $(this).data("contain")
            $("#"+idContain).remove()
            if (confirm("Do you wanna delete this brand") == false) {
                return
            }
            $.ajax({
                url: "DeleteBrandAdminController?idBrand="+idBrand,
                success: function(result){
                    alert(result)
                    $("#"+idContain).remove()
                }});
        })
    })
</script>
<script>
    // add new brand
    $("#add-new-brand").click(function(e){
        e.preventDefault()
        let newBrand=`
                      <form action="AddBrandAdminController" method="post" enctype="multipart/form-data" class="d-grid contain-brand contain-form-brand d-grid" >
                             <span>name: </span>
                             <input required type="text" value="" name="nameBrand">
                             <img id="imgShow" alt="brand" src="" width="150px" height="150px">
                             <input required type="file" name="imgBrand" class="imgLoad" data-imgshow="imgShow">
                             <button class="remove-new-brand size-brand btn btn-info">X??a</button>
                             <button class="saveBrand size-brand btn btn-danger">Save</button>
                       </form>
`
        $(".contain-list-brand").prepend(newBrand)
        loadImg()
        // xoa brand moi add
        $(".remove-new-brand").each(function() {
            $(this).click(function() {
                $(this).parent().remove()
            })
        })
    })
</script>
<script>
    // load image
    function loadImg() {
        $(".imgLoad").each(function(){
            $(this).change(function () {
                let idImgShow = $(this).data("imgshow")
                if (this.files) {
                    let reader = new FileReader()
                    reader.onload = function (e) {
                        $("#"+idImgShow).attr('src', e.target.result)
                    }
                    reader.readAsDataURL(this.files[0])
                }
            });
        })
    }

    $(function() {
        loadImg()
    })


</script>
</body>

</html>
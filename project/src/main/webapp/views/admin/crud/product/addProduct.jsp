<%@ page import="beans.Product" %>
<%@ page import="beans.Image" %>
<%@ page import="java.io.File" %>
<%@ page import="beans.ProductDetail" %>
<%@ page import="java.util.*" %>
<%@ page import="model.DaoProduct" %>
<%@ page import="dao.product.brand.DaoProductBrand" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/2/2022
  Time: 7:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        .clicked {
            color: #eeee13;
        }
        #brands {
            display: none;
        }
        .remove-img-detail {
            width: fit-content;
            height: fit-content;
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
    <div class="main px-lg-4 px-md-4">

        <!-- Body: Header -->
        <%!
            public String getExceptionForm(Object exp) {
                return exp!=null ?exp.toString():"";
            }%>


        <!-- Body: Body -->
<%--        <form id="form-edit-product" class="body d-flex py-3" method="post" enctype="multipart/form-data" action="SaveEditProduct?id=<%=product.getId()%>">--%>
        <form id="form-edit-product" class="body d-flex py-3" method="post" action="<%=request.getContextPath()%>/AddNewProduct">
            <div class="container-xxl">
                <div class="row align-items-center">
                    <div class="border-0 mb-4">
                        <div class="card-header py-3 no-bg bg-transparent d-flex align-items-center px-0 justify-content-between border-bottom flex-wrap">
                            <h3 class="fw-bold mb-0">Thêm sản phẩm</h3>
                            <button type="submit" id="bt-save-edit-product" class="btn btn-primary btn-set-task w-sm-100 py-2 px-5 text-uppercase">Thêm chi tiết sản phẩm</button>
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
                                            <label class="form-label">Giá sản phẩm</label>
                                            <input type="number" min="0" max="10000" class="form-control" name="price" >

                                        </div>
                                        <div class="col-md-12">
                                            <label class="form-label">Giảm giá</label>
                                            <input type="number" min="0" max="100" class="form-control" name="sale">
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="card mb-3">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">
                                    <h5 class="m-0 fw-bold">Màu</h5>
                                </div>
                                <div class="card-body">
                                    <table style="width: 100%;" class="add-new-detail">
                                        <thead>
                                        <th>color</th>
                                        <th>size</th>
                                        <th>total</th>
                                        <th>sole</th>
                                        </thead>


                                    </table>

                                </div>
                            </div>

                            <div class="card mb-3">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">
                                    <h5 class="m-0 fw-bold">Ngày công bố</h5>
                                </div>
                                <div class="card-body">
                                    <div class="row g-3 align-items-center">
                                        <div class="col-md-12">
                                            <label class="form-label">Ngày</label>
                                            <input type="date" class="form-control w-100" name="date">
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
                                            <input type="text" class="form-control" name="name">
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Nhãn hàng</label>
                                            <input type="text" list="brands" class="form-control" name="brand" autocomplete="off" />
                                            <datalist id="brands">
                                                <%List<String> brands = DaoProductBrand.getInstance().getListBrand();
                                                    for (String brand: brands){%>
                                                <option><%=brand%></option>
                                                <%}%>
                                            </datalist>
                                        </div>
                                        <div class="col-md-12">
                                            <label class="form-label" for="description">Mô tả</label>
                                            <input name="description" type="text" style="display: block; width: 100%; height: 80px;" id="description">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="card">
                            <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">
                                <h6 class="m-0 fw-bold">Inventory Info</h6>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- Row end  -->

            </div>
        </form>


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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- Jquery Page Js -->

<script src="../js/template.js"></script>


<script>

    $(function() {
        let count = -1
        $(".add-new-color").click(()=>{
            let color = ` <h5 style="display: block; width: 100%">Màu: <input name="addNewColor" id="new-color-`+count+`" />
                         <br>
                         <input data-containimg="contain-img-`+count+`" data-color="`+$("#new-color-"+count).val()+`" id="add-img-`+count+`"  data-j="`+new Date().getTime()+`" data-maincolor="`+count+`" value="Thêm mới"  type="button" />
                        </h5>
                           <div class="d-flex align-items-center">
                               <input type="radio" style="width: 20px;height:20px" name="chooseMainColor" id="mainColor_`+count+`" value="">
                                      <label for="mainColor_`+count+`" style="cursor: pointer">Choose main color</label>
                                   </div>
                         <div id="contain-img-`+count+`" class="d-flex flex-wrap"></div>`
            $(".images").prepend(color)
            changeDataColor("add-img-"+count, "new-color-"+count)
            addNewColor("add-img-"+count)
            addDetailProduct("add-img-"+count)
            count--
        })
    })

    function changeDataColor(id, idColor) {
        $("#"+idColor).keyup(()=>{
            $("#"+id).data("color", $("#"+idColor).val())
            $("#mainColor_"+$("#"+id).data("maincolor")).val($("#"+idColor).val())
        })
    }
    function addNewColor(id) {
        $("#"+id).click(()=>test(id))
    }

    function test(idInput) {
        // $("#"+idInput).click(()=>{
        let id = new Date().getTime()
        let color=$("#"+idInput).data('color')
        let j = $("#"+idInput).data('j')
        let i = new Date().getTime()
        // alert(idInput+" "+$("#"+idInput).data('color'))
        let newImg = `<div class="d-flex justify-content-around" style="border: 1px solid black; margin-right: 5px">
                        <img id="img-`+id+`" width="280" height="280">
                        <input type="file" id="input-img-`+id+`" class="imgLoad" data-img="img-`+id+`" name="fileNewImg_`+color+`" />
                        <button class="remove-img-detail">Xóa</button>
<div class="d-flex align-items-center my-2">
                                                            <input style="width: 30px; height:30px" type="radio" id="mainImage_`+i+`" name="chooseMainImage_`+j+`">
                                                            <label style="cursor: pointer" for="mainImage_`+i+`"><h6>Main Image</h6></label>
                                                        </div>
                        </div>

                        `


        let divContain=$("#"+idInput).data("containimg")
        $("#"+divContain).append(newImg)

        $("#mainImage_"+i).click(()=>{
            $("#input-img-"+id).attr('name', "fileNewImg_"+color+"_checked");
            // alert($("#input-img-"+id).attr("id") + " " + $("#input-img-"+id).attr("name"))
        })

        $(this).bind('change', ()=>{
            let reader = new FileReader()
            reader.onload = function (e) {
                $("#img-"+id).attr('src', e.target.result)
            }
            // reader.readAsDataURL(this.files[0])
        })

        loadImg()
        removeDetailImg()
    }
    function removeDetailImg() {
        $(".remove-img-detail").each(function(){
            $(this).click((e)=>{
                let img = $(this).data("nameimg")
                $(this).parent().remove()
            })
        })
    }
    function removeDetailInAdmin() {
        $(".remove-detail").each(function () {
            $(this).click(()=>{
                removeDetail(this)
            })
        })
    }
    function loadImg() {
        $(".imgLoad").each(function(){
            $(this).change(function () {
                let idImgShow = $(this).data("img")
                if (this.files && this.files[0]) {
                    let reader = new FileReader()
                    reader.onload = function (e) {
                        $("#"+idImgShow).attr('src', e.target.result)
                    }
                    // reader.readAsDataURL(this.files[0])
                }
            });
        })
    }

    function addDetailProduct(id) {
        let wasClicked=false
        $("#"+id).click(()=>{
            if(wasClicked==false) {
                let color = $("#" + id).data('color')
                let newDetail = `
                                                    <tr class="tr-add-detail" data-color="` + color + `">
                                            <td>` + color + `</td>
                                            <td>
                                                <input id="add-` + color + `-size" style="width: 50px;" type="number" min="32" max="50" required>
                                                <span class="exp-edit" id="exp-` + color + `-size"></span>
                                            </td>
                                            <td>
                                                <input id="add-` + color + `-total" style="width: 50px;" type="number" min="0" required>
                                                <span class="exp-edit" id="exp-` + color + `-total"></span>
                                            </td>
                                            <td>
                                                <input id="add-` + color + `-sole" style="width: 50px;" type="number" min="0" required>
                                                <span class="exp-edit" id="exp-` + color + `-sole"></span>
                                            </td>
                                            <td><a class="add-detail-admin" data-color="` + color + `" style="font-size: 22px; cursor:pointer;"><i class="fas fa-save"></i></a></td>
                                        </tr>
                            `
                $(".table-add-detail").append(newDetail)
                addDetailAdmin()
            }
            wasClicked=true
        })
    }


    $(document).ready(()=>{
        removeDetailInAdmin()
    })

    function addDetailAdmin(){
        $(".add-detail-admin").each(function () {
            $(this).click(()=>{
                let color = $(this).data("color")
                let size = $("#add-"+color+"-size").val()
                let total = $("#add-"+color+"-total").val()
                let sole = $("#add-"+color+"-sole").val()
                alert(color + " " + size + " " + total + " " + sole)
                let check = true
                $(".exp-edit").text("")

                if (total < sole) {
                    check=false;
                    $("#exp-"+color+"-total").text("Total must be \n bigger than sole");
                }
                if (check) {
                    <%--$.ajax({--%>
                    <%--    url: `AddDetail?id=<%=product.getId()%>&color=`+color+`&size=`+size+`&total=`+total+`&sole=`+sole,--%>
                    <%--    type: 'POST',--%>
                    //     success: function (data) {
                            $("#totalValue").val($("#totalValue").val()+total)
                            $("#totalSole").val($("#totalSole").val()+sole)

                            let newId = new Date().getTime()
                            let newTr = `
                             <tr id="tr-detail-`+newId+`">
                                                <td>
                                                    <span style="width: 50px;">`+color+`</span>
                                                </td>
                                                <td style="display: flex;">
                                                    <label class="form-check-label" for="size-`+size+`">
                                                        `+size+`
                                                    </label>
                                                </td>
                                                <td>
                                                    <input name="totalValue" style="width: 50px;" id="totalValue-`+total+`"value="`+total+`" type="number">
                                                </td>
                                                <td>
                                                    <input  name="soleValue" style="width: 50px;" id="soleValue-`+sole+`"value="`+sole+`"  type="number">
                                                </td>
                                            <td>
                                                <a id="`+newId+`" class="remove-detail" style="cursor: pointer; font-size: 18px" data-detail="`+newId+`" data-color="`+color+`" data-size="`+size+`" data-total="`+total+`" data-sole="`+sole+`" >
                                                    <i class="fas fa-trash-alt"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        `
                            $(".add-new-detail").append(newTr)
                            $("#"+newId).click(()=>{
                                removeDetail($("#"+newId))
                            })
                        // },
                        // error: function() {
                        //     alert("Error")
                        // }
                    // })
                }
            })
        })
    }

    function removeDetail(tr) {
        let data = $(tr).data("detail")
        let color = $(tr).data("color")
        let size = $(tr).data("size")
        let total = $(tr).data("total")
        let sole = $(tr).data("sole")
        alert(`Are you sure wanna delete this tr-detail-`+data + " " + color + " "+size)
        $(`#tr-detail-`+data).remove()

        $("#totalValue").val($("#totalValue").val()-total)
        $("#totalSole").val($("#totalSole").val()-sole)





        $(function addNewImage() {
            $(".fileNewImg").each(function(){
                $(this).click(()=>{
                    test($(this).attr('id'))
                })
            })
        })

    }

    $(function removeColor() {
        $(".remove-color").each(function (){
            $(this).click(()=>{
                let color = $(this).data('color')

                $(".tr-detail").each(function (){
                    if ($(this).data("color")==color) {
                        $(this).remove()
                    }
                })
                $(".tr-add-detail").each(function (){
                    if ($(this).data("color")==color) {
                        $(this).remove()
                    }
                })
                $(".contain-color-image").each(function (){
                    if ($(this).data("color")==color) {
                        $(this).remove()
                    }
                })
            })
        })
    })

</script>

</body>

</html>
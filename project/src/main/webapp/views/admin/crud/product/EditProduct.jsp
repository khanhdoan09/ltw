<%@ page import="beans.Product" %>
<%@ page import="beans.Image" %>
<%@ page import="beans.Brand" %>
<%@ page import="beans.Category" %>
<%@ page import="java.io.File" %>
<%@ page import="beans.ProductDetail" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.product.DaoProductAdmin" %>
<%@ page import="dao.product.category.DaoCategory" %>
<%@ page import="dao.product.color.DaoProductColor" %>
<%@ page import="dao.product.brand.DaoProductBrand" %><%--
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
        .remove-img-detail {
            width: 27%;
            margin: 5px 0;
            color: white;
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
        .main_img {
            width: 20px;
            height: 20px;
        }
        input[type='file'] {
            color: transparent;
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

        <!-- Body: Body -->

        <form id="form-edit-product" class="body d-flex py-3" method="post" enctype="multipart/form-data" action="EditCurrentProductAdmin?id=<%=product.getId()%>">

            <div class="container-xxl">
                <div class="row align-items-center">
                    <div class="border-0 mb-4">
                        <div class="card-header py-3 no-bg bg-transparent d-flex align-items-center px-0 justify-content-between border-bottom flex-wrap">
                            <h3 class="fw-bold mb-0">Chỉnh sửa sản phẩm</h3>
                            <button type="submit" id="bt-save-edit-product" class="btn btn-primary btn-set-task w-sm-100 py-2 px-5 text-uppercase">Lưu</button>
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
                                            <input name="id" value="<%=product.getId()%>" placeholder="<%=product.getId()%>" readonly/>
                                        </div>
                                        <div class="col-md-12">
                                            <label class="form-label">Giá sản phẩm</label>
                                            <input required type="number" min="0" max="10000" class="form-control" name="price" value="<%=product.getPrice()%>">
                                        </div>
                                        <div class="col-md-12">
                                            <label class="form-label">Giảm giá</label>
                                            <input required type="number" class="form-control" name="sale-rate" value="<%=product.getSaleRate()%>" min="0" max="100">
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="card mb-3">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">
                                    <h5 class="m-0 fw-bold">Thống kê</h5>
                                </div>
                                <div class="card-body">
                                    <table style="width: 100%;" class="add-new-detail">
                                        <thead>
                                        <th>màu</th>
                                        <th>size</th>
                                        <th>tổng</th>
                                        <th>đã bán</th>
                                        </thead>

                                        <%
                                            int totalQuantity=0;
                                            int totalSole=0;
                                            List<ProductDetail>list = product.getDetail();
                                            int countDetail=0;
                                            if (list != null) {
                                                for (ProductDetail detail : list ) {
                                                    String color = detail.getColor();
                                                    int size = detail.getSize();
                                                    int totalValue = detail.getTotalValue();
                                                    int soleValue = detail.getSoleValue();
                                        %>
                                        <tr id="tr-detail-<%=countDetail%>" class="tr-detail" data-color="<%=color%>">
                                            <td>
                                                <span style="width: 50px;"><%=color%></span>
                                            </td>
                                            <td style="display: flex;">
                                                <label class="form-check-label" for="size-<%=size%>">
                                                    <%=size%>
                                                </label>
                                            </td>
                                            <td>
                                                <input name="totalValue" style="width: 50px;" id="totalValue-<%=totalValue%>"value="<%=totalValue%>" type="number">
                                            </td>
                                            <td>
                                                <input  name="soleValue" style="width: 50px;" id="soleValue-<%=soleValue%>"value="<%=soleValue%>"  type="number">
                                            </td>
                                            <td>
                                                <a class="remove-detail" style="cursor: pointer; font-size: 18px" data-detail="<%=countDetail%>" data-color="<%=color%>" data-size="<%=size%>" data-total="<%=totalValue%>" data-sole="<%=soleValue%>" >
                                                    <i class="fas fa-trash-alt"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <%
                                                    totalQuantity+=totalValue;
                                                    totalSole+=soleValue;
                                                    countDetail++;
                                                }
                                            }
                                        %>

                                    </table>

                                    <h5 class="m-0 fw-bold" style="margin: 10px ">Thêm size</h5>
                                    <table style="width: 100%;" class="table-add-detail">
                                        <thead>
                                        <th>màu</th>
                                        <th>size</th>
                                        <th>tổng</th>
                                        <th>đã bán</th>
                                        </thead>
                                        <%List<String>colors = DaoProductColor.getInstance().getListColor(product.getId());
                                            for(String color : colors){%>
                                        <tr class="tr-add-detail" data-color="<%=color%>">
                                            <td><%=color%></td>
                                            <td>
                                                <input id="add-<%=color%>-size" style="width: 50px;" type="number" min="32" max="50">
                                                <span class="exp-edit" id="exp-<%=color%>-size"></span>
                                            </td>
                                            <td>
                                                <input id="add-<%=color%>-total" style="width: 50px;" type="number" min="0">
                                                <span class="exp-edit" id="exp-<%=color%>-total"></span>
                                            </td>
                                            <td>
                                                <input id="add-<%=color%>-sole" style="width: 50px;" type="number" min="0">
                                                <span class="exp-edit" id="exp-<%=color%>-sole"></span>
                                            </td>
                                            <td><a class="add-detail-admin" data-color="<%=color%>" style="font-size: 22px; cursor:pointer;"><i class="fas fa-save"></i></a></td>
                                        </tr>

                                        <%}%>
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
                                            <input type="date" name="date" class="form-control w-100" value="<%=product.getCreate_at()%>">
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
                                            <input required type="text" class="form-control" name="name" value="<%=product.getName()%>">
                                        </div>
                                        <div class="col-md-6"> <label class="form-label">Nhãn hàng</label> <select id="form-label" name="brand"> <% String brandCurrent = product.getBrand(); ArrayList<Brand> brands = DaoProductBrand.getInstance().getListBrand(); for (Brand brand: brands){%> <option value="<%=brand.getId()%>" <%if(brand.getId().equals(brandCurrent)){%>selected<%}%>><%=brand.getName()%></option> <%}%> </select> </div>
                                        <div class="col-md-12">
                                            <label class="form-label" for="description">Mô tả</label>
                                            <input required name="description" type="text" style="display: block; width: 100%; height: 80px;" id="description" placeholder="
                                              <%=product.getDescription()%>" value="<%=product.getDescription()%>" >
                                        </div>

                                        <div class="col-md-12">
                                            <div class="col-md-12">
                                                <h5>Thêm màu mới <input type="button" value="thêm màu mới" class="add-new-color"></h5>
                                            </div>
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
                                <div>
                                    <div class="row g-3 align-items-center">
                                        <div>
                                            <div class="col-md-12" style="display: flex; flex-wrap: wrap">
                                                <label class="form-label">Úp ảnh</label>
                                                <div style="display: flex; flex-wrap: wrap" class="images">
                                                    <%
                                                        String mainColor = DaoProductAdmin.getInstance().getMainColor(product.getId());
                                                        List<String>listColor = DaoProductColor.getInstance().getListColor(product.getId());
                                                    %>
                                                    <%
                                                        for(int j = 0; j < listColor.size(); j++){%>

                                                    <h5 id="color-<%=j%>" class="contain-color-image" data-color="<%=listColor.get(j)%>" style="display: block; width: 100%">Màu<input name="color" value="<%=listColor.get(j)%>" />
                                                        <br>
                                                        <input data-containimg="contain-img-<%=j%>" data-color="<%=listColor.get(j)%>" value="Thêm ảnh mới" id="add-img-<%=j%>" data-j="<%=j%>"  type="button"  class="fileNewImg" />
                                                        <input type="button" class="remove-color" data-color="<%=listColor.get(j)%>" value="Xóa màu <%=listColor.get(j)%>">
                                                        <div class="d-flex align-items-center">
                                                            <input type="radio" style="width: 20px;height:20px" name="chooseMainColor" id="mainColor_<%=listColor.get(j)%>" value="<%=listColor.get(j)%>"
                                                                <%if(mainColor.equals(listColor.get(j))){ %>
                                                                   checked
                                                                <%}%>>

                                                            <label for="mainColor_<%=listColor.get(j)%>" style="cursor: pointer">Chọn Màu Chính</label>
                                                        </div>
                                                    </h5>
                                                    <div id="contain-img-<%=j%>" data-color="<%=listColor.get(j)%>" class="contain-color-image d-flex flex-wrap"></div>

                                                    <%for(int i= 0;i < product.getListImg().size(); i++){%>
                                                    <%String color = product.getListImg().get(i).getColor();
                                                        if (color.equals(listColor.get(j))){%>
                                                    <div style="border:1px solid grey; margin: 5px 0; display: grid;margin: 5px" class="contain-color-image" data-color="<%=color%>">
                                                        <%String nameImg = product.getListImg().get(i).getImg();%>

                                                        <img id="img-<%=i%>" src="upload/product/<%=nameImg%>" width="280" height="280">
                                                        <input id="input-img-<%=i%>" class="imgLoad imgExist" data-nameimg="<%=nameImg%>" data-containhiddenimgexist="containHiddenImgExist-<%=i%>" data-color="<%=color%>" data-img="img-<%=i%>" type="file" name="fileImg" />
                                                        <!-- to change img -->
                                                        <input class="btn btn-primary" type="hidden" name="containHiddenImgExist" id="containHiddenImgExist-<%=i%>" value="empty" >
                                                        <button class="remove-img-detail btn btn-danger" data-nameimg="<%=nameImg%>">Xóa</button>
                                                        <div class="d-flex align-items-center my-2">
                                                            <input class="main_img" type="radio" id="mainImage_<%=i%>" name="chooseMainImage" value="<%=nameImg%>~<%=color%>"
                                                                    <% if(product.getListImg().get(i).getLelvel()==0){%>
                                                                   checked
                                                                    <%}%>
                                                            />
                                                            <label style="cursor: pointer" for="mainImage_<%=i%>"><h6>Main Image</h6></label>
                                                        </div>
                                                    </div>
                                                    <%}%>

                                                    <%}%>

                                                    <%}%>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">
                                <h6 class="m-0 fw-bold">Inventory Info</h6>
                            </div>
                            <div class="card-body">
                                <div class="row g-3 align-items-center">
                                    <div class="col-md-12">
                                        <label class="form-label">Tổng số lượng </label>
                                        <input id="totalValue" type="text" name="sold" class="form-control" value="<%=totalQuantity%>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="form-label">Đã bán</label>
                                        <input id="totalSole" type="text"name="total-quantity" class="form-control" value="<%=totalSole%>" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card-body"> <label class="form-label">Thể loại</label> <select class="form-select" size="3" aria-label="size 3 select example" name="category"> <%for (Category category : DaoCategory.getInstance().getListCategory()) {%> <option value = "<%=category.getId()%>" <%if(category.getId().toString().equals(product.getCategory().toString())) {%> selected <%}%> ><%=category.getName() +" " +category.getGender() %></option> <%}%> </select> </div>

                        <div class="col-md-12">
                            <div class="col-md-12">
                                <div>
                                    <label class="form-label">Active product</label>
                                    <div class="">
                                        <div class="d-flex align-items-center">
                                            <label for="active-yes">Active</label>
                                            <input class="mx-2" id="active-yes" type="radio" name="active" value="1"
                                                    <%if(product.getActive()==1){%>
                                                   checked
                                                    <%}%>
                                            />
                                        </div>

                                        <div class="d-flex align-items-center">
                                            <label for="active-no">Not active</label>
                                            <input class="mx-2" type="radio" id="active-no" name="active" value="0"
                                                    <%if(product.getActive()==0){%>
                                                   checked
                                                    <%}%>
                                            />
                                        </div>
                                    </div>
                                </div>
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

<!-- Jquery Page Js -->

<script src="../js/template.js"></script>



<script>

    function removeDetailInAdmin() {
        $(".remove-detail").each(function () {
            $(this).click(()=>{
                removeDetail(this)
            })
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
                let check = true
                $(".exp-edit").text("")

                if (!size) {
                    check=false
                    $("#exp-"+color+"-size").text("Size is null");
                }
                if (size < 0) {
                    check=false
                    $("#exp-"+color+"-size").text("Size is negative");
                }
                if (!total) {
                    check=false
                    $("#exp-"+color+"-total").text("Total is null");
                }
                if (total < 0) {
                    check=false
                    $("#exp-"+color+"-total").text("Total is negative");
                }
                if(!sole) {
                    check=false
                    $("#exp-"+color+"-sole").text("Sole is null");
                }
                if (sole < 0) {
                    check=false
                    $("#exp-"+color+"-sole").text("Sole is negative");
                }
                if (total < sole) {
                    check=false;
                    $("#exp-"+color+"-total").text("Total must be \n bigger than sole");
                }
                alert(check + "" +color + "" +size)

                if (check) {
                    $.ajax({
                        url: `AddDetail?id=<%=product.getId()%>&color=`+color+`&size=`+size+`&total=`+total+`&sole=`+sole,
                        type: 'POST',
                        success: function (data) {
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
                        },
                        error: function() {
                            alert("Error")
                        }
                    })
                }
            })
        })
    }
    $(function() {
        addDetailAdmin()
    })

    function removeDetail(tr) {
        let data = $(tr).data("detail")
        let color = $(tr).data("color")
        let size = $(tr).data("size")
        let total = $(tr).data("total")
        let sole = $(tr).data("sole")
        alert(`Are you sure wanna delete this tr-detail-`+data + " " + color + " "+size)
        $(`#tr-detail-`+data).remove()
        $.ajax({
            url: `RemoveDetail?id=<%=product.getId()%>&color=`+color+`&size=`+size,
            type: 'POST',
            success: function (data) {
                $("#totalValue").val($("#totalValue").val()-total)
                $("#totalSole").val($("#totalSole").val()-sole)
            },
            error: function() {
                alert("Error")
            }
        })

    }


    function removeDetailImg() {
        $(".remove-img-detail").each(function(){
            $(this).click((e)=>{
                e.preventDefault()
                let img = $(this).data("nameimg")
                let imgCurrent = $(this)
                $.ajax({
                    url: `RemoveImg?id=<%=product.getId()%>&nameImg=`+img,
                    type: 'POST',
                    success: function (data) {
                        alert("remove " + data)
                        imgCurrent.parent().remove()
                    },
                    error: function() {
                        alert("Error")
                    }
                })
            })
        })
    }
    $(document).ready(()=>{
        removeDetailImg()
    })



    function loadImg() {
        $(".imgLoad").each(function(){
            $(this).change(function (ef) {
                let idHidden = $(this).data("containhidden")
                let idChooseMainImg = $(this).data("containmainimg")
                let color = $(this).data("color")
                let nameImg = ef.target.files[0].name
                // save color and name img
                $("#"+idHidden).val($("#"+idHidden).val()+"#"+nameImg)
                $("#"+idChooseMainImg).val(nameImg+"~"+color)


                let idImgShow = $(this).data("img")
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
    $(document).ready(()=>{
        loadImg()
    })

    $(function addNewColor() {
        let count=-1
        $(".add-new-color").click(()=>{
            let color = ` <h5 style="display: block; width: 100%">Màu: <input type="text" name="newColor" id="new-color-`+count+`" />
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
            addColor("add-img-"+count)
            addDetailProduct("add-img-"+count)
            count--
        })
    })

    function addDetailProduct(id) {
        let wasClicked=false
        $("#"+id).click(()=>{
            if(wasClicked==false) {
                let color = $("#" + id).data('color')
                let newDetail = `
                                                    <tr class="tr-add-detail" data-color="` + color + `">
                                            <td>` + color + `</td>
                                            <td>
                                                <input id="add-` + color + `-size" style="width: 50px;" type="number" min="32" max="50">
                                                <span class="exp-edit" id="exp-` + color + `-size"></span>
                                            </td>
                                            <td>
                                                <input id="add-` + color + `-total" style="width: 50px;" type="number" min="0">
                                                <span class="exp-edit" id="exp-` + color + `-total"></span>
                                            </td>
                                            <td>
                                                <input id="add-` + color + `-sole" style="width: 50px;" type="number" min="0">
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

    function changeDataColor(id, idColor) {
        $("#"+idColor).keyup(()=>{
            $("#"+id).data("color", $("#"+idColor).val())
            $("#mainColor_"+$("#"+id).data("maincolor")).val($("#"+idColor).val())
        })
    }

    $(function addNewImage() {
        $(".fileNewImg").each(function(){
            $(this).click(()=>{
                test($(this).attr('id'))
            })
        })
    })

    function addColor(id) {
        $("#"+id).click(()=>test(id))
    }

    function test(idInput) {
        // $("#"+idInput).click(()=>{
        let id = new Date().getTime()
        let color=$("#"+idInput).data('color')
        let j = $("#"+idInput).data('j')
        let i = new Date().getTime()
        let newImg = `<div class="d-flex justify-content-around" style="border: 1px solid black; margin-right: 5px">
                        <img id="img-`+id+`" width="280" height="280">
                        <input type="file" name="fileImg" id="input-img-`+id+`" data-containmainimg="mainImage_`+i+`" data-containhidden="hidden-`+j+`" data-color="`+color+`" class="imgLoad btn btn-primary" data-img="img-`+id+`"/>
                        <!--send color and file name-->
                        <input value="`+color+`" name="newimg" type="hidden" id="hidden-`+j+`" />

                        <button class="remove-img-detail btn btn-danger">Xóa</button>
<div class="d-flex align-items-center my-2">
                                                            <input class="main_img" type="radio" id="mainImage_`+i+`" name="chooseMainImage" value="">
                                                            <label style="cursor: pointer" for="mainImage_`+i+`"><h6>Main Image</h6></label>
                                                        </div>
                        </div>

                        `


        let divContain=$("#"+idInput).data("containimg")
        $("#"+divContain).append(newImg)

        $("#mainImage_"+i).click(()=>{
            $("#input-img-"+id).attr('name', "fileNewImg_"+color+"_checked");
        })

        $(this).bind('change', ()=>{
            let reader = new FileReader()
            reader.onload = function (e) {
                $("#img-"+id).attr('src', e.target.result)
            }
            if (this.files) {
                reader.readAsDataURL(this.files[0])
            }
        })

        loadImg()
        removeDetailImg()
        // })
    }

    $(function removeColor() {
        $(".remove-color").each(function (){
            $(this).click(()=>{
                let color = $(this).data('color')
                $.ajax({
                    url: `RemoveColor?id=<%=product.getId()%>&color=`+color,
                    type: 'POST',
                    success: function (data) {
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
                    },
                    error: function() {
                        alert("Error")
                    }
                })
            })

        })
    })

</script>

<!-- to change img -->
<script>
    $(".imgExist").each(function() {
        $(this).change(function (ef) {
            let id = $(this).data("containhiddenimgexist")
            alert(id)
            let color = $(this).data("color")
            let oldNameImg = $(this).data("nameimg")
            // use when click change
            let newNameImg = ef.target.files[0].name
            $("#"+id).val(oldNameImg+"#"+newNameImg+"#"+color)
        })
    })
</script>
</body>

</html>
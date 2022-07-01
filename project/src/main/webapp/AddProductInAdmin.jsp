<%@ page import="bean.Product" %>
<%@ page import="model.Image" %>
<%@ page import="java.io.File" %>
<%@ page import="controller.admin.UploadFile" %>
<%@ page import="model.ProductDetail" %>
<%@ page import="java.util.*" %>
<%@ page import="model.Admin.DaoProductAdmin" %><%--
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
  <!-- fontawesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet"
        type="text/css" />
  <!-- project css file  -->
  <link rel="stylesheet" href="admin/assets/css/ebazar.style.min.css">

  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <script src="exponential.js"></script>
  <script src="javascript/khanh-js.js"></script>

  <style>
    .exception-form {
      font-size: 15px;
      color: red;
    }
    .exp-edit{
      color: red;
      font-size: 12px;
      display: block;
      word-break: break-word;
    }

    .remove-img-detail {
      width: 76px;
    }
  </style>


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
    <%!
      public String getExceptionForm(Object exp) {
        return exp!=null ?exp.toString():"";
      }%>


    <!-- Body: Body -->
    <form id="form-edit-product" class="body d-flex py-3" method="post" enctype="multipart/form-data" action="SaveAddProduct" >

      <div class="container-xxl">
        <div class="row align-items-center">
          <div class="border-0 mb-4">
            <div class="card-header py-3 no-bg bg-transparent d-flex align-items-center px-0 justify-content-between border-bottom flex-wrap">
              <h3 class="fw-bold mb-0">Chỉnh sửa sản phẩm</h3>
              <button type="submit" id="bt-save-edit-product" class="btn btn-primary btn-set-task w-sm-100 py-2 px-5 text-uppercase">Save</button>
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
                      <input type="text" class="form-control" name="price">
                      <p class="exception-form"><%=getExceptionForm(request.getAttribute("expPrice"))%></p>

                    </div>
                    <div class="col-md-12">
                      <label class="form-label">Giảm giá</label>
                      <input type="text" class="form-control" name="sale-rate" >
                      <p class="exception-form"><%=getExceptionForm(request.getAttribute("expSaleRate"))%></p>
                    </div>

                  </div>
                </div>
                <div class="card-body">
                  <label class="form-label">Thể loại</label>
                  <select class="form-select" size="3" aria-label="size 3 select example" name="category">
                    <option value="Skateboard">Skateboard</option>
                    <option value="Slides">Slides</option>
                    <option value="Sneakers">Sneakers</option>
                    <option value="Trainers">Trainers</option>
                  </select>
                </div>

              </div>
              <%--                            <div class="card mb-3">--%>
              <%--                                <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">--%>
              <%--                                    <h6 class="m-0 fw-bold">Màu</h6>--%>
              <%--                                </div>--%>
              <%--                                <div class="card-body">--%>
              <%--                                    <%--%>
              <%--                                        Set<String> listColor = product.getListSizeColor().listColor();--%>
              <%--                                        for (Iterator<String> it = listColor.iterator(); it.hasNext(); ) {--%>
              <%--                                            String color = it.next();--%>
              <%--                                            %>--%>
              <%--                                    <div class="form-check">--%>
              <%--                                        <input class="form-check-input" id="color-<%=color%>" type="checkbox" checked>--%>
              <%--                                        <label class="form-check-label" for="color-<%=color%>">--%>
              <%--                                            <%=color%>--%>
              <%--                                        </label>--%>
              <%--                                    </div>--%>
              <%--                                        <%--%>
              <%--                                        }--%>
              <%--                                        %>--%>
              <%--                                </div>--%>
              <%--                            </div>--%>
              <%--                            <div class="card mb-3">--%>
              <%--                                <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">--%>
              <%--                                    <h6 class="m-0 fw-bold">Size</h6>--%>
              <%--                                </div>--%>
              <%--                                <div class="card-body">--%>
              <%--                                    <%--%>
              <%--                                        List<Integer> listSize = product.getListSizeColor().getListSize();--%>
              <%--                                        for(int i = 0,j=37; i < listSize.size(); i++,j++){%>--%>
              <%--                                    <div class="form-check">--%>
              <%--                                        <input name="size" value="<%=j%>"class="form-check-input" checked type="checkbox" id="sizecheck<%=j%>">--%>
              <%--                                        <label class="form-check-label" for="sizecheck<%=j%>">--%>
              <%--                                            <%if(j==listSize.get(i)){%>--%>
              <%--                                            <%=listSize.get(i)%>--%>
              <%--                                            <%}else{%>--%>
              <%--                                            <%=j%>--%>
              <%--                                            <%}%>--%>
              <%--                                        </label>--%>
              <%--                                    </div>--%>
              <%--                                    <%}%>--%>
              <%--                                </div>--%>
              <%--                            </div>--%>

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
                      <input type="text" class="form-control" name="name" >
                    </div>
                    <div class="col-md-6">
                      <label class="form-label">Nhãn hàng</label>
                      <input type="text" list="brands" class="form-control" name="brand" autocomplete="off"/>
                      <datalist id="brands">
                        <%List<String> brands = DaoProductAdmin.getInstance().getListBrand();
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

            <div class="card mb-3">
              <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">
                <h6 class="m-0 fw-bold">Giới tính</h6>
              </div>

              <div class="card-body">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="gender" value="Man">

                  <label class="form-check-label">
                    Nam
                  </label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="gender" value="Woman">

                  <label class="form-check-label">
                    Nữ
                  </label>
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

  $(function addDetailAdmin(){
    $(".add-detail-admin").each(function () {
      $(this).click(()=>{
        let color = $(this).data("color")
        let size = $("#add-"+color+"-size").val()
        let total = $("#add-"+color+"-total").val()
        let sole = $("#add-"+color+"-sole").val()
        alert(color + " " + size + " " + total + " " + sole)
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
        if (check) {
          $.ajax({
            url: `AddDetail?id=&color=`+color+`&size=`+size+`&total=`+total+`&sole=`+sole,
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
      url: `RemoveDetail?id=&color=`+color+`&size=`+size,
      type: 'POST',
      success: function (data) {
        alert(data)
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
        $.ajax({
          url: `RemoveImg?id=&nameImg=`+img,
          type: 'POST',
          success: function (data) {
            alert(data)
          },
          error: function() {
            alert("Error")
          }
        })
        $(this).parent().remove()
      })
    })
  }
  $(document).ready(()=>{
    removeDetailImg()
  })



  function loadImg() {
    $(".imgLoad").each(function(){
      $(this).change(function () {
        let idImgShow = $(this).data("img")
        if (this.files && this.files[0]) {
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
      let color = ` <h5 style="display: block; width: 100%">Màu: <input name="addNewColor" id="new-color-`+count+`" />
                         <br>
                         <input data-containimg="contain-img-`+count+`" data-color="`+$("#new-color-"+count).val()+`" id="add-img-`+count+`"  value="Thêm mới"  type="button" />
                        </h5>
                         <div id="contain-img-`+count+`" class="d-flex flex-wrap"></div>`
      $(".images").prepend(color)

      testChangeDataColor("add-img-"+count, "new-color-"+count)
      testColor("add-img-"+count)
      count--
    })
  })

  function testChangeDataColor(id, idColor) {
    $("#"+idColor).keyup(()=>{
      $("#"+id).data("color", $("#"+idColor).val())
      color =  $("#"+idColor).val()
    })
  }

  $(function addNewImage() {
    $(".fileNewImg").each(function(){
      $(this).click(()=>{
        test($(this).attr('id'))
      })
    })
  })

  function testColor(id) {
    $("#"+id).click(()=>test(id))
  }

  function test(idInput) {
    // $("#"+idInput).click(()=>{
    let id = new Date().getTime()
    let color=$("#"+idInput).data('color')
    alert(idInput+" "+$("#"+idInput).data('color'))
    let newImg = `<div class="d-grid" style="border: 1px solid black; margin-right: 5px">
                        <img id="img-`+id+`" width="280" height="280">
                        <input type="file" id="input-img-`+id+`" class="imgLoad" data-img="img-`+id+`" name="fileNewImg_`+color+`" />
                        <button class="remove-img-detail">Xóa</button>
                        </div>
                        `
    let divContain=$("#"+idInput).data("containimg")
    $("#"+divContain).append(newImg)
    $(this).bind('change', ()=>{
      alert(this + idInput)
      let reader = new FileReader()
      reader.onload = function (e) {
        $("#img-"+id).attr('src', e.target.result)
      }
      reader.readAsDataURL(this.files[0])
    })

    loadImg()
    removeDetailImg()
    // })
  }

  $(function removeColor() {
    $(".remove-color").each(function (){
      $(this).click(()=>{
        let color = $(this).data('color')
        alert(color)
        $.ajax({
          url: `RemoveColor?id=&color=`+color,
          type: 'POST',
          success: function (data) {
            alert(data)
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


</body>

</html>
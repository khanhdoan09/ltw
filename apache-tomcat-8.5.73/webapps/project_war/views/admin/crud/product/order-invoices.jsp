<%@ page import="beans.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="model.Admin.DaoProductAdmin" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 13/1/2022
  Time: 4:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="en" dir="ltr"><head>
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
<%--  <link rel="stylesheet" href="assets/plugin/datatables/dataTables.bootstrap5.min.css">--%>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.12.0/css/dataTables.bootstrap4.min.css">

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
    .contain-load-more {
      width: 100%;
      display: flex;
      justify-content: center;
    }
    #load-more-product {
      background-color: #6060b9;
      color: white;
      width: fit-content;
      padding: 20px;
      border: none;
      border-radius: 15px;
    }
    .edit-remove-admin {
      margin: 5px 0;
      cursor: pointer;
    }
  </style>

</head>

<body>
<div id="ebazar-layout"   class="theme-blue">

<%--  <div class="sidebar px-4 py-4 py-md-4 me-0">--%>
<%--    <div class="d-flex flex-column h-100">--%>
<%--      <a href="admin/index.html" class="mb-0 brand-icon">--%>

<%--        <span class="logo-text">Dragon Sport</span>--%>
<%--      </a>--%>
<%--      <!-- Menu: main ul -->--%>
<%--      <ul class="menu-list flex-grow-1 mt-3">--%>
<%--        <li><a class="m-link" href="admin/index.html"><i class="fas fa-home" style="margin: 0 10px;"></i> <span>Trang chủ</span></a></li>--%>
<%--        <li class="collapsed">--%>
<%--          <a class="m-link" data-bs-toggle="collapse" data-bs-target="#menu-product" href="<%=request.getContextPath()%>/Route?page=order">--%>
<%--            <i class="fas fa-shopping-cart" style="margin: 0 10px;"></i> <span>Sản phẩm</span> </a>--%>
<%--          <!-- Menu: Sub menu ul -->--%>
<%--          <ul class="sub-menu collapse" id="menu-product">--%>

<%--            <li><a class="ms-link" href="product-edit.html">Chỉnh sửa sản phẩm</a></li>--%>
<%--            <li><a class="ms-link" href="product-add.html">Thêm sản phẩm</a></li>--%>

<%--          </ul>--%>
<%--        </li>--%>

<%--        <li class="collapsed">--%>
<%--          <a class="m-link active" href="<%=request.getContextPath()%>/Route?page=listProduct">--%>
<%--            <i class="fab fa-intercom" style="margin: 0 10px;"></i> <span>Danh sách sản phẩm</span> </a>--%>


<%--        </li>--%>
<%--        <li class="collapsed">--%>
<%--          <a class="m-link" href="<%=request.getContextPath()%>/Route?page=customer">--%>
<%--            <i class="fas fa-user-alt" style="margin: 0 10px;"></i> <span>Khách hàng</span> </a>--%>

<%--        </li>--%>
<%--        <li class="collapsed">--%>
<%--          <a class="m-link" href="<%=request.getContextPath()%>/SignOut">--%>
<%--            <i class="fas fa-user-alt" style="margin: 0 10px;"></i> <span>Sign out</span> </a>--%>

<%--        </li>--%>




<%--      </ul>--%>
<%--      <!-- Menu: menu collepce btn -->--%>
<%--      <button type="button" class="btn btn-link sidebar-mini-btn text-light">--%>
<%--        <span class="ms-2"><i class="fas fa-dot-circle"></i></span>--%>
<%--      </button>--%>
<%--    </div>--%>
<%--  </div>--%>

  <%@include file="../header.jsp" %>

  <!-- main body area -->
  <div class="main px-lg-4 px-md-4" id="contain-data-product-admin">

    <!-- Body: Body -->
    <div class="body d-flex py-3" >
      <div class="container-xxl">
        <div class="row align-items-center">
          <div class="border-0 mb-4">
            <div class="card-header py-3 no-bg bg-transparent d-flex align-items-center px-0 justify-content-between border-bottom flex-wrap">
              <h3 class="fw-bold mb-0">Danh sách sản phẩm</h3>
            </div>
          </div>
        </div>
        <!-- Row end  -->
        <div class="row mb-3">
          <div class="col-sm-12">

            <form action="<%=request.getContextPath()%>/Route?page=listProductForm" method="post" style="margin: 20px 0;" id="form-product-admin">
              <%!String typeSelected="";%>
              <% typeSelected= (String) request.getParameter("type");%>

              <select name="type" id="type-product-admin">
                <%!public String selected(String type) {
                  if (type.equals(typeSelected))
                    return "selected";
                  return "";
                }%>
                <option value="id" <%=selected("id")%>>ID</option>
                <option value="brand"<%=selected("brand")%>>BRAND</option>
                <option value="name"<%=selected("name")%>>NAME</option>
              </select>
              <input list="brands" type="text" style="margin: 0 10px" id="input-name-product-admin" name="name" autocomplete="off"  value="<%if(request.getAttribute("type")!=null){%><%=request.getAttribute("type")%><%}%>"/>
              <datalist id="brands">
                <%List<String> brands = DaoProductAdmin.getInstance().getListBrand();
                  for (String brand: brands){%>
                <option><%=brand%></option>
                <%}%>
              </datalist>

              <button type="submit" id="submit-admin" style="border: none; font-size: 25px; color: rgb(83, 83, 204);background-color: inherit;"><i class="fas fa-arrow-alt-circle-right"></i></button>

            </form>

            <div class="card">
              <div class="card-body">

                <table id="listProduct" class="table table-striped table-bordered" style="width:100%">
                  <thead>
                  <tr>
                    <th>Id</th>
                    <th>Hình</th>
                    <th>Hiệu</th>
                    <th>Tên</th>
                    <th>Ngày ra đơn</th>
                    <th>Giá</th>
                    <th>Giảm giá
                    </th>
                    <th>Chọn</th>
                  </tr>
                  </thead>

                  <tbody id="listProduct">

                  <%Object objFilter = request.getAttribute("listProduct");
                    if (objFilter != null) {
                      List<Product> list = (List<Product>) objFilter;
                      for (Product product : list) {%>
                  <tr id="tr-product-<%=product.getId()%>">
                    <td><strong><%=product.getId()%></strong></td>
                    <td><img src="assets/images/product/product-02.jpg" class="avatar lg rounded me-2" alt="profile-image"></td>
                    <td><%=product.getBrand()%></td>
                    <td><%=product.getName()%></td>
                    <td>May 16, 2021</td>
                    <td>$<%=product.getPrice()%></td>
                    <td>-<%=product.getSaleRate()%>%</td>
                    <td>
                      <div class="d-grid">
                        <a class="edit-remove-admin remove-admin"  data-id="<%=product.getId()%>">
                          <i class="fas fa-trash-alt" data-id="<%=product.getId()%>"></i></a>
                        <a class="edit-remove-admin edit-admin" href="<%=request.getContextPath()%>/Route?page=editProduct&id=<%=product.getId()%>">
                          <i class="fas fa-edit"></i>
                        </a>
                      </div>
                    </td>
                  </tr>
                  <%    } %>
                  <%}%>
                  </tbody>
                </table>
               <% if (objFilter != null) {%>
                <div class="contain-load-more">
                  <button id="load-more-product" >Load more</button>
                </div>
                <%}%>
              </div>
            </div>
          </div>
        </div>
        <!-- Row end  -->
      </div>
    </div>

    <!-- Modal Custom Settings-->


  </div>

</div>

<!-- Jquery Core Js -->
<script src="assets/bundles/libscripts.bundle.js"></script>

<!-- Plugin Js-->
<script src="https://cdn.datatables.net/1.12.0/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.0/js/dataTables.bootstrap4.min.js"></script>

<!-- Jquery Page Js -->
<script src="../js/template.js"></script>


<script>
  $("#type-product-admin").change(()=>{
    $("#input-name-product-admin").val("")
  })

  $(document).ready(function () {

    $('#listProduct').DataTable({
      "paging": false,
      "bInfo" : false,
      columnDefs: [
        { orderable: false, targets: [0, 1, 2, 7] },
        { orderable: true, targets: [3, 4, 5, 6] }
      ]
    });
  });
</script>

</body></html>
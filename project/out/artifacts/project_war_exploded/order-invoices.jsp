<%@ page import="model.Product" %>
<%@ page import="java.util.List" %><%--
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
  <script src="javascript/khanh-js.js"></script>

  <!-- plugin css file  -->
  <link rel="stylesheet" href="assets/plugin/datatables/responsive.dataTables.min.css">
  <link rel="stylesheet" href="assets/plugin/datatables/dataTables.bootstrap5.min.css">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css    ">

  <!-- project css file  -->
  <link rel="stylesheet" href="admin/assets/css/ebazar.style.min.css">

  <style>
    .clicked {
      color: #eeee13;
    }
  </style>
</head>

<body>
<div id="ebazar-layout" class="theme-blue">

  <div class="sidebar px-4 py-4 py-md-4 me-0">
    <div class="d-flex flex-column h-100">
      <a href="admin/index.html" class="mb-0 brand-icon">

        <span class="logo-text">Dragon Sport</span>
      </a>
      <!-- Menu: main ul -->
      <ul class="menu-list flex-grow-1 mt-3">
        <li><a class="m-link" href="admin/index.html"><i class="fas fa-home" style="margin: 0 10px;"></i> <span>Trang chủ</span></a></li>
        <li class="collapsed">
          <a class="m-link" data-bs-toggle="collapse" data-bs-target="#menu-product" href="#">
            <i class="fas fa-shopping-cart" style="margin: 0 10px;"></i> <span>Sản phẩm</span> </a>
          <!-- Menu: Sub menu ul -->
          <ul class="sub-menu collapse" id="menu-product">

            <li><a class="ms-link" href="product-edit.html">Chỉnh sửa sản phẩm</a></li>
            <li><a class="ms-link" href="product-add.html">Thêm sản phẩm</a></li>

          </ul>
        </li>

        <li class="collapsed">
          <a class="m-link active" href="admin/order-invoices.html">
            <i class="fab fa-intercom" style="margin: 0 10px;"></i> <span>Danh sách sản phẩm</span> </a>


        </li>
        <li class="collapsed">
          <a class="m-link" href="admin/customers.html">
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

    <!-- Body: Body -->
    <div class="body d-flex py-3">
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

            <form action="ListProduct" method="post" style="margin: 20px 0;">
              <%!String typeSelected="";%>
              <% typeSelected= (String) request.getAttribute("type");%>

              <select name="type" id="" value="<%=typeSelected%>">
                <%!public String selected(String type) {
                  if (type.equals(typeSelected))
                    return "selected";
                  return "";
                }%>
                <option value="id" <%=selected("id")%>>ID</option>
                <option value="brand"<%=selected("brand")%>>BRAND</option>
                <option value="name"<%=selected("name")%>>NAME</option>
                <option value="price"<%=selected("price")%>>Price</option>
              </select>
              <input type="radio" name="radio-select" id="up-radio" style="margin: 0 10px;cursor: pointer;" name="order" value=highestPrice">
              <label for="up-radio" style="cursor: pointer;">Tăng</label>
              <input type="radio" name="radio-select" id="down-radio" style="margin: 0 10px;cursor: pointer;" name="order" value="lowestPrice">
              <label for="down-radio" style="cursor: pointer;">Giảm</label>
              <input type="text" style="margin: 0 10px" name="name" value="<%=request.getAttribute("name")%>">
              <button type="submit" style="border: none; font-size: 25px; color: rgb(83, 83, 204);background-color: inherit;"><i class="fas fa-arrow-alt-circle-right"></i></button>

            </form>

            <div class="card">
              <div class="card-body">
                <table id="patient-table" class="table table-hover align-middle mb-0" style="width: 100%;">
                  <thead>
                  <tr>
                    <th>Id</th>
                    <th>Hình</th>
                    <th>Hiệu</th>
                    <th>Tên</th>
                    <th>Ngày ra đơn</th>
                    <th>Giá</th>
                    <th>Giảm giá
                      <a href="ListProduct?item=saleRate&&orderType=DESC"  class="admin-product-order">
                        <i class="fas fa-arrow-up" id="order-increase-saleRate"></i>
                      </a>
                      <a href="ListProduct?item=saleRate&&orderType=ASC" class="admin-product-order">
                        <i class="fas fa-arrow-down admin-product-order" id="order-decrease-saleRate" ></i>
                      </a>
                    </th>
                    <th>Hành động</th>
                  </tr>
                  </thead>

                  <tbody id="listProduct">


                  <%Object objFilter = request.getAttribute("listFilter");
                    if (objFilter != null) {
                      List<Product> list = (List<Product>) objFilter;
                      for (Product product : list) {%>
                  <tr>
                    <td><strong><%=product.getId()%></strong></td>
                    <td><img src="assets/images/product/product-02.jpg" class="avatar lg rounded me-2" alt="profile-image"></td>
                    <td><%=product.getBrand()%></td>
                    <td><%=product.getName()%></td>
                    <td>May 16, 2021</td>
                    <td>$<%=product.getPrice()%></td>
                    <td>-<%=product.getSaleRate()%>%</td>
                    <td>
                      <a href="#" class="edit-remove-admin"><i class="fas fa-trash-alt"></i></a>
                      <a href="#" class="edit-remove-admin"><i class="fas fa-edit"></i></a>
                    </td>
                  </tr>

                  <%    }
                  }%>

                  </tbody>
                </table>
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
<script src="assets/bundles/dataTables.bundle.js"></script>

<!-- Jquery Page Js -->
<script src="../js/template.js"></script>



</body></html>
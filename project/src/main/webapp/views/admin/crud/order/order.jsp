<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="model.Admin.DaoProductAdmin" %>
<%@ page import="model.Admin.Order" %>
<%@ page import="model.Admin.DaoOrderAdmin" %><%--
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
    <!-- Favicon-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet"
          type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css    ">

    <!-- project css file  ..-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.0/css/dataTables.bootstrap4.min.css">

    <style>
        .clicked {
            color: #eeee13;
        }
        #brands {
            display: none;
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
                    <a class="m-link active" data-bs-toggle="collapse" data-bs-target="#menu-product" href="<%=request.getContextPath()%>/Route?page=order">
                        <i class="fas fa-shopping-cart" style="margin: 0 10px;"></i> <span>Hóa đơn</span> </a>
                    <!-- Menu: Sub menu ul -->
                    <ul class="sub-menu collapse" id="menu-product">

                        <li><a class="ms-link" href="product-edit.html">Chỉnh sửa sản phẩm</a></li>
                        <li><a class="ms-link" href="product-add.html">Thêm sản phẩm</a></li>

                    </ul>
                </li>

                <li class="collapsed">
                    <a class="m-link" href="<%=request.getContextPath()%>/Route?page=listProduct">
                        <i class="fab fa-intercom" style="margin: 0 10px;"></i> <span>Danh sách sản phẩm</span> </a>


                </li>
                <li class="collapsed">
                    <a class="m-link" href="<%=request.getContextPath()%>/Route?page=customer">
                        <i class="fas fa-user-alt" style="margin: 0 10px;"></i> <span>Khách hàng</span> </a>

                </li>

                <li class="collapsed">
                    <a class="m-link" href="<%=request.getContextPath()%>/SignOut">
                        <i class="fas fa-user-alt" style="margin: 0 10px;"></i> <span>Sign out</span> </a>

                </li>




            </ul>
            <!-- Menu: menu collepce btn -->
            <button type="button" class="btn btn-link sidebar-mini-btn text-light">
                <span class="ms-2"><i class="fas fa-dot-circle"></i></span>
            </button>
        </div>
    </div>


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

                        <form action="<%=request.getContextPath()%>/ListOrder" method="post" style="margin: 20px 0;" id="form-product-admin">
<%--                            <%!String typeSelected="";%>--%>
<%--                            <% typeSelected= (String) request.getParameter("type");%>--%>

<%--                            <select name="type" id="type-product-admin">--%>
<%--                                <%!public String selected(String type) {--%>
<%--                                    if (type.equals(typeSelected))--%>
<%--                                        return "selected";--%>
<%--                                    return "";--%>
<%--                                }%>--%>
<%--                                <option value="id" <%=selected("id")%>>ID</option>--%>
<%--                                <option value="brand"<%=selected("brand")%>>BRAND</option>--%>
<%--                                <option value="name"<%=selected("name")%>>NAME</option>--%>
<%--                            </select>--%>
<%--                            <input list="brands" type="text" style="margin: 0 10px" id="input-name-product-admin" name="name" autocomplete="off"  value="<%=request.getAttribute("type")%>"/>--%>
<%--                            <datalist id="brands">--%>
<%--                                <%List<String> brands = DaoProductAdmin.getInstance().getListBrand();--%>
<%--                                    for (String brand: brands){%>--%>
<%--                                <option><%=brand%></option>--%>
<%--                                <%}%>--%>
<%--                            </datalist>--%>

                            <button type="submit" id="submit-admin" style="border: none; font-size: 25px; color: rgb(83, 83, 204);background-color: inherit;"><i class="fas fa-arrow-alt-circle-right"></i></button>

                        </form>

                        <div class="card">
                            <div class="card-body">
                                <table id="listOrder" class="table table-striped table-bordered" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Id Customer</th>
                                        <th>Price</th>
                                        <th>Date</th>
                                        <th>Status</th>
                                        <th>Hành động</th>
                                    </tr>
                                    </thead>

                                    <tbody id="listProduct">

                                    <%Object objFilter = request.getAttribute("orders");
//                                        if (objFilter != null) {
                                            List<Order> list = DaoOrderAdmin.getInstance().getListOrder();
                                            for (Order order : list) {%>
                                    <tr id="tr-product-<%=order.getId()%>">
                                        <td><strong><%=order.getId()%></strong></td>
                                        <td><%=order.getIdCustomer()%></td>
                                        <td><%=order.getTotal()%></td>
                                        <td><%=order.getCreateDate()%></td>
                                        <td><%=order.getStatus()%></td>
                                        <td>
                                            <div class="d-grid">
                                                <a class="view-order-detail" href="<%=request.getContextPath()%>/Route?page=orderDetail&idOrder=<%=order.getId()%>">
                                                        <i class="fas fa-edit"></i>
                                                </a>
                                                <a >
                                                    <i class="fas fa-trash-alt"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <%    } %>
<%--                                    <%}%>--%>
                                    </tbody>
                                </table>
                                <% if (objFilter != null) {%>
                                <button id="load-more-product" style="width: 100%">Load more</button>
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
<script src="javascript/jquery-2.1.1.min.js" type="text/javascript"></script>

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
</script>

<script>
    $(document).ready(function () {

        $('#listOrder').DataTable({
            "paging": false,
            "bInfo" : false,
            columnDefs: [
                { orderable: false, targets: [0, 1, 4, 5] },
                { orderable: true, targets: [2, 3] }
            ]
        });
    });
</script>

</body></html>
<%@ page import="beans.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="beans.OrderInAdmin" %>
<%@ page import="beans.OrderDetailInAdmin" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 13/1/2022
  Time: 4:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    boolean isLogin = request.getSession().getAttribute("userAdmin") != null ? true : false;
    if (isLogin == false) {
        request.getRequestDispatcher("/views/admin/authentication/signIn/signIn.jsp").forward(request, response);
    }
%>
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
    <link rel="stylesheet" href="assets/plugin/datatables/dataTables.bootstrap5.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css    ">

    <!-- project css file  -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">
    <script src="javascript/jquery-2.1.1.min.js" type="text/javascript"></script>

    <script src="javascript/khanh-js.js"></script>


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

                        <form action="/project_war_exploded/ListOrder" method="post" style="margin: 20px 0;" id="form-product-admin">

                            <button type="submit" id="submit-admin" style="border: none; font-size: 25px; color: rgb(83, 83, 204);background-color: inherit;"><i class="fas fa-arrow-alt-circle-right"></i></button>

                        </form>

                        <div class="card">
                            <div class="card-body">
                                <table id="patient-table" class="table table-hover align-middle mb-0" style="width: 100%;">
                                    <thead>
                                    <tr>
                                        <th>Id order</th>
                                        <th>Image</th>
                                        <th>Id shoe</th>
                                        <th>Color</th>
                                        <th>Size</th>
                                        <th>Quantity</th>
                                    </tr>
                                    </thead>

                                    <tbody id="listProduct">

                                    <%Object objFilter = request.getAttribute("orderDetails");
                                        if (objFilter != null) {
                                            List<OrderDetailInAdmin> list = (List<OrderDetailInAdmin>) objFilter;
                                            for (OrderDetailInAdmin order : list) {%>
                                    <tr id="tr-product-<%=order.getIdOrder()%>">
                                        <td><strong><%=order.getIdOrder()%></strong></td>
                                        <td><strong><%=order.getIdShoe()%></strong></td>
                                        <td><img src="assets/images/product/product-02.jpg" class="avatar lg rounded me-2" alt="profile-image"></td>
                                        <td><%=order.getColor()%></td>
                                        <td><%=order.getSize()%></td>
                                        <td><%=order.getQuantity()%></td>

                                    </tr>
                                    <%    } %>
                                    <%}%>
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


<script>
    $("#type-product-admin").change(()=>{
        $("#input-name-product-admin").val("")
    })
</script>

</body></html>
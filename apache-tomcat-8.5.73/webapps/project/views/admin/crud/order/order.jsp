<%@ page import="beans.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="beans.OrderInAdmin" %>
<%@ page import="dao.order.DaoOrderAdmin" %><%--
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
    </style>
    <script src="javascript/jquery-2.1.1.min.js" type="text/javascript"></script>


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
                                        <th>Chọn</th>
                                    </tr>
                                    </thead>

                                    <tbody id="listProduct">

                                    <%Object obj = request.getAttribute("orders");
                                            List<OrderInAdmin> list = (List<OrderInAdmin>) obj;
                                            for (OrderInAdmin order : list) {%>
                                    <tr id="tr-product-<%=order.getId()%>">
                                        <td><strong><%=order.getId()%></strong></td>
                                        <td><%=order.getIdCustomer()%></td>
                                        <td><%=order.getTotal()%></td>
                                        <td><%=order.getCreateDate()%></td>
                                        <td><%=order.getStatus()%></td>
                                        <td>
                                            <div class="d-grid">
                                                <a class="view-order-detail" href="<%=request.getContextPath()%>/ListOrderDetailAdmin?idOrder=<%=order.getId()%>">
                                                    <i class="fa-solid fa-eye"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <%    } %>
<%--                                    <%}%>--%>
                                    </tbody>
                                </table>
                                <% if (obj != null) {%>
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

<script>
    let paginationOrderInAdmin = 0
    $(function() {
        $("#load-more-product").click(()=>{
            let type = $("#type-product-admin").val()
            let name = $("#input-name-product-admin").val()
            paginationOrderInAdmin += 1
            $.ajax({
                url: `ListOrderAdmin?pagination=`+paginationOrderInAdmin,
                type: 'POST',
                success: function (data) {
                    if (data==='no more data') {
                        $("#load-more-product").remove()
                    }
                    else {
                        let arr = JSON.parse(data);
                        let re = ""
                        arr.forEach((e) => {
                            re += `<tr id='tr-product-`+e.id+`'>
                                        <td><strong>`+e.id+`</strong></td>
                                        <td>`+e.idCustomer+`</td>
                                        <td>`+e.total+`</td>
                                        <td>`+e.createDate+`</td>
                                        <td>`+e.status+`</td>
                                        <td>
                                            <div class="d-grid">
                                                <a class="view-order-detail" href="<%=request.getContextPath()%>/ListOrderDetailAdmin?idOrder=`+e.id+`">
                                                    <i class="fa-solid fa-eye"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>`
                        })
                        $("#listProduct").append(re)
                    }
                    removeProductInAdmin()
                },
                error: function () {
                    $('#notification-bar').text('An error occurred');
                }
            });

        })})

</script>
</body></html>
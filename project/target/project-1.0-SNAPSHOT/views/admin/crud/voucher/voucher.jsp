<%@ page import="java.util.List" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="beans.Voucher" %>
<%@ page import="dao.product.category.DaoVoucher" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        textarea:focus, input:focus{
            outline: none;
        }
        *:focus {
            outline: none;
        }
        .btn {
            width: 40px;
            height: 40px;
            margin-right: 5px;
        }
        #add-voucher {
            width: 150px;
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
                            <h3 class="fw-bold mb-0">Danh sách Voucher</h3>
                        </div>
                    </div>
                </div>
                <!-- Row end  -->
                <div class="row mb-3">
                    <div class="col-sm-12">
                        <button id="add-voucher" class="btn btn-info">Thêm Voucher</button>
                        <div class="card">
                            <div class="card-body">
                                <table id="listOrder" class="table table-striped table-bordered" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>Id Voucher</th>
                                        <th>Từ ngày</th>
                                        <th>Tới ngày</th>
                                        <th>Giảm giá</th>
                                        <th>Code</th>
                                        <th>Đã dùng</th>
                                        <th>Hành động</th>
                                    </tr>
                                    </thead>

                                    <tbody id="listProduct">
                                    <%for(Voucher voucher : DaoVoucher.getInstance().getListVoucher()) {%>
                                        <tr id="contain-<%= voucher.getId()%>">
                                            <form action="UpdateVoucherAdmin?id=<%= voucher.getId()%>" method="post">
                                                <td>
                                                    <div>
                                                        <input class="form-control" name="id_voucher" type="text" value="<%= voucher.getId()%>" readonly>
                                                    </div>
                                                </td>
                                                <td >
                                                    <div class="d-flex align-items-center">
                                                       <input type="date" name="from_date" required value="<%= voucher.getFrom_date()%>">
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <input type="date" name="to_date" required value="<%= voucher.getTo_date()%>">
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <input type="number" name="discount" required value="<%= voucher.getDiscount()%>">
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <input type="text" readonly value="<%= voucher.getCode()%>">
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <input type="number" readonly value="<%= voucher.isUsed()%>">
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="d-flex">
                                                        <button typeof="submit" class="btn btn-primary">
                                                            <i class="fas fa-save"></i>
                                                        </button>
                                                        <button class="btn btn-danger remove-voucher" data-contain="contain-<%= voucher.getId()%>" data-idvoucher="<%= voucher.getId()%>">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    </div>
                                                </td>

                                            </form>
                                        </tr>
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
<script src="javascript/jquery-2.1.1.min.js" type="text/javascript"></script>

<script src="assets/bundles/libscripts.bundle.js"></script>

<!-- Plugin Js-->
<script src="https://cdn.datatables.net/1.12.0/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.0/js/dataTables.bootstrap4.min.js"></script>
<!-- Jquery Page Js -->
<script src="../js/template.js"></script>

<script>
    // add category
    $("#add-voucher").click(function(e) {
        e.preventDefault()
        let newVoucher=`

        <form action="AddVoucherAdmin" class="d-flex">

                                               <td>
                                                   <div class="d-flex align-items-center">
                                                       <input  name="fromDate" type="date" value="" class="mx-2">
                                                   </div>
                                               </td>
                                                <td>
                                                   <div class="d-flex align-items-center">
                                                       <input name="toDate" type="date" value="" class="mx-2">
                                                   </div>
                                               </td>
                                               <td class="d-flex align-items-center mx-2">
                                                   <div class="d-flex align-items-center">
                                                        <input type="number" name="discount" required min="0" max="100">
                                                   </div>
                                               </td>
                                               <td>
                                                   <div class="d-flex mx-2">
                                                       <button class="save-category btn btn-primary">
                                                           <i class="fas fa-save"></i>
                                                       </button>
                                                       <button class="btn btn-danger remove-new-category">
                                                           <i class="fas fa-trash"></i>
                                                       </button>
                                                   </div>
                                               </td>

        </form>

`
        $(".card-body").prepend(newVoucher)
        // xoa category moi add
        $(".remove-new-category").each(function() {
            $(this).click(function() {
                $(this).parent().parent().remove()
            })
        })
        $(".save-category").each(function() {
            $(this).click(function() {
            })
        })
    })
</script>
<script>
    // delete category
    $(".remove-voucher").each(function() {
        $(this).click(function(e) {
            e.preventDefault()
            let idVoucher = $(this).data("idvoucher")
            let idContain = $(this).data("contain")
            if (confirm("Do you want delete this voucher?") == false) {
                return
            }
            $.ajax({
                url: "RemoveVoucherAdmin?id="+idVoucher,
                success: function(result){
                    alert(result)
                    $("#"+idContain).remove()
                }});
        })
    })
</script>
</body>
</html>
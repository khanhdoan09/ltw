<%@ page import="java.util.List" %>
<%@ page import="java.net.URLDecoder" %>
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
        .btn {
            width: 40px;
            height: 40px;
            margin-right: 5px;
        }
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
                            <h3 class="fw-bold mb-0">Danh sách thể loại</h3>
                        </div>
                    </div>
                </div>
                <!-- Row end  -->
                <div class="row mb-3">
                    <div class="col-sm-12">
                        <button id="add-category" class="btn btn-info">Thêm thể loại</button>
                        <div class="card">
                            <div class="card-body">
                                <table id="listOrder" class="table table-striped table-bordered" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên</th>
                                        <th>Giới tính</th>
                                        <th>Hành động</th>
                                    </tr>
                                    </thead>

                                    <tbody id="listProduct">
                                    <c:forEach var="i" items="${category}">
                                       <tr id="contain-${i.id}">
                                           <form action="EditCategoryAdmin?id=${i.id}" method="get">
                                               <td>
                                                   <div class="d-flex align-items-center">
                                                       <p>${i.id}</p>
                                                   </div>
                                               </td>
                                               <td>
                                                   <div class="d-flex align-items-center">
                                                       <input name="nameCategory" type="text" value="${i.name}">
                                                   </div>
                                               </td>
                                               <td class="d-flex align-items-center">
                                                   <div class="d-flex align-items-center">
                                                       <select name="gender">
                                                           <c:if test="${i.gender == 'man'}">
                                                               <option value="man" selected>Nam</option>
                                                               <option value="woman">Nữ</option>
                                                           </c:if>
                                                           <c:if test="${i.gender == 'woman'}">
                                                               <option value="man">Nam</option>
                                                               <option value="woman" selected>Nữ</option>
                                                           </c:if>
                                                       </select>
                                                   </div>
                                               </td>
                                               <td>
                                                   <div class="d-flex">
                                                       <button typeof="submit" class="btn btn-primary">
                                                           <i class="fas fa-save"></i>
                                                       </button>
                                                       <button class="btn btn-danger remove-category" data-contain="contain-${i.id}" data-idcategory="${i.id}">
                                                           <i class="fas fa-trash"></i>
                                                       </button>
                                                   </div>
                                               </td>
                                           </form>
                                       </tr>
                                    </c:forEach>
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
    $("#add-category").click(function(e) {
        e.preventDefault()
        let newCategory=`

        <form action="SaveCategoryAdmin" class="d-flex">

   <td>
                                                   <div class="d-flex align-items-center">
                                                    ID
                                                   </div>
                                               </td>
                                               <td>
                                                   <div class="d-flex align-items-center">
                                                       <input name="nameCategory" type="text" value="">
                                                   </div>
                                               </td>
                                               <td class="d-flex align-items-center">
                                                   <div class="d-flex align-items-center">
                                                       <select name="gender">
                                                               <option value="man" selected>Nam</option>
                                                               <option value="woman">Nữ</option>
                                                       </select>
                                                   </div>
                                               </td>
                                               <td>
                                                   <div class="d-flex">
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
        $(".card-body").prepend(newCategory)
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
    $(".remove-category").each(function() {
        $(this).click(function(e) {
            e.preventDefault()
            let idCategory = $(this).data("idcategory")
            let idContain = $(this).data("contain")
            if (confirm("Do you wanna delete this category") == false) {
                return
            }
            $.ajax({
                url: "RemoveCategoryAdmin?id="+idCategory,
                success: function(result){
                    alert(result)
                    $("#"+idContain).remove()
                }});
        })
    })
</script>
</body>
</html>
<%@ page import="beans.User" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.user.DaoUserAdmin" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/4/2022
  Time: 1:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    boolean isLogin = request.getSession().getAttribute("userAdmin") != null ? true : false;
    if (isLogin == false) {
        request.getRequestDispatcher("/views/admin/authentication/signIn/signIn.jsp").forward(request, response);
    }
%>
<html  class="no-js" lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>::eBazar:: Customers </title>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <!-- Favicon-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet"
          type="text/css" />
    <script src="javascript/jquery-2.1.1.min.js" type="text/javascript"></script>

    <!-- plugin css file  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.0/css/dataTables.bootstrap4.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css    ">

    <!-- project css file  -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">


</head>

<body>
<div id="ebazar-layout" class="theme-blue">

    <!-- sidebar -->
    <%@include file="../header.jsp" %>


    <!-- main body area -->
    <div class="main px-lg-4 px-md-4">

        <!-- Body: Header -->


        <!-- Body: Body -->
        <div class="body d-flex py-lg-3 py-md-2">
            <div class="container-xxl">
                <div class="row align-items-center">
                    <div class="border-0 mb-4">
                        <div class="card-header py-3 no-bg bg-transparent d-flex align-items-center px-0 justify-content-between border-bottom flex-wrap">
                            <h3 class="fw-bold mb-0">Customers Information</h3>
                        </div>
                    </div>
                </div>
                <!-- Row end  -->
                <div class="row clearfix g-3">
                    <div class="col-sm-12">

                        <form style="margin: 20px 0;" action="<%=request.getContextPath()%>/ListUser">

                            <button type="submit" style="border: none; font-size: 25px; color: rgb(83, 83, 204);background-color: inherit;"><i class="fas fa-arrow-alt-circle-right"></i></button>

                        </form>


                        <div class="card mb-3">
                            <div class="card-body">
                                <table id="listCustomer" class="table table-striped table-bordered" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Image</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Register Date</th>
                                        <th>Gender</th>
                                        <th>Phone</th>
                                        <th>Country</th>
                                        <th>Total Order</th>
                                        <th>isAdmin</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach var="i" items="${users}">

                                    <tr>
                                        <td><strong>${i.id}</strong></td>
                                        <td>
                                            <a href="customer-detail.html">
                                                <img class="avatar rounded" src="assets/images/xs/avatar1.svg" alt="">
                                            </a>
                                        </td>
                                        <td>
                                                ${i.email}
                                        </td>
                                        <td>
                                                ${i.name}
                                        </td>
                                        <td>
                                                ${i.createAt}
                                        </td>
                                        <td>${i.gender}</td>
                                        <td>${i.phone}</td>
                                        <td>${i.idAddress}</td>
                                        <td>${i.idCart}</td>
                                        <td>${i.isAdmin}</td>
                                        <td>
                                            <div class="btn-group" role="group" aria-label="Basic outlined example">
                                                <button type="button" class="btn btn-outline-secondary deleterow"><i class="fas fa-trash-alt"></i></button>
                                            </div>
                                        </td>
                                    </tr>

                                    </c:forEach>


                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row End -->
            </div>
        </div>

        <!-- Modal Custom Settings-->


        <!-- Add Customers-->
        <div class="modal fade" id="expadd" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-md modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="deadline-form">
                            <form>
                                <div class="row g-3 mb-3">
                                    <div class="col-sm-12">
                                        <label for="item" class="form-label">Customers Name</label>
                                        <input type="text" class="form-control" id="item">
                                    </div>
                                    <div class="col-sm-12">
                                        <label for="taxtno" class="form-label">Customers Profile</label>
                                        <input type="File" class="form-control" id="taxtno">
                                    </div>
                                </div>
                                <div class="row g-3 mb-3">
                                    <div class="col-sm-6">
                                        <label for="depone" class="form-label">Country</label>
                                        <input type="text" class="form-control" id="depone">
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="abc" class="form-label">Customers Register date</label>
                                        <input type="date" class="form-control w-100" id="abc">
                                    </div>
                                </div>
                                <div class="row g-3 mb-3">
                                    <div class="col-sm-6">
                                        <label for="abc11" class="form-label">Mail</label>
                                        <input type="text" class="form-control" id="abc11">
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="abc111" class="form-label">Phone</label>
                                        <input type="text" class="form-control" id="abc111">
                                    </div>
                                </div>
                                <div class="row g-3 mb-3">
                                    <div class="col-sm-12">
                                        <label class="form-label">Id Cart</label>
                                        <input type="text" class="form-control">
                                    </div>
                                </div>

                            </form>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Done</button>
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </div>
            </div>
        </div>

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
    $(document).ready(function () {

        $('#listCustomer').DataTable({
            "paging": false,
            "bInfo" : false,
            columnDefs: [
                { orderable: false, targets: [0, 1, 3, 4, 5, 6, 7, 9, 10] },
                { orderable: true, targets: [3, 2, 5, 8] }
            ]
        });
    });
</script>
</body>

</html>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/6/2022
  Time: 9:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .m-link {
        display: flex;
    }
</style>
<div class="sidebar px-4 py-4 py-md-4 me-0">
    <div class="d-flex flex-column h-100">
        <a href="admin/index.html" class="mb-0 brand-icon">

            <span class="logo-text">Dragon Sport</span>
        </a>
        <!-- Menu: main ul -->
        <ul class="menu-list flex-grow-1 mt-3">
            <li><a id="home" class="m-link" href="admin/index.html"><i class="fas fa-home" style="margin: 0 10px;"></i> <span>Trang chủ</span></a></li>
            <li class="collapsed">
                <a id="order" class="m-link" data-bs-toggle="collapse" data-bs-target="#menu-product" href="<%=request.getContextPath()%>/ListOrderAdmin">
                    <i class="fas fa-shopping-cart" style="margin: 0 10px;"></i> <span>Hóa đơn</span> </a>
            </li>

            <li class="collapsed">
                <a id="product" class="m-link" href="<%=request.getContextPath()%>/views/admin/crud/product/list-product.jsp">
                    <i class="fab fa-intercom" style="margin: 0 10px;"></i> <span>Danh sách sản phẩm</span> </a>


            </li>
            <li class="collapsed">
                <a id="addProduct" class="m-link" href="<%=request.getContextPath()%>/views/admin/crud/product/addProduct.jsp">
                    <i class="fa-solid fa-plus mx-2"></i> <span>Thêm sản phẩm</span> </a>
            </li>
            <li class="collapsed">
                <a id="containBrand" class="m-link" href="<%=request.getContextPath()%>/GetBrandAdminController">
                    <i class="fa-brands fa-dribbble mx-2"></i> <span>Nhãn hàng</span> </a>
            </li>
            <li class="collapsed">
                <a id="containCategory" class="m-link" href="<%=request.getContextPath()%>/GetCategoryAdmin">
                    <i class="fa fa-list-alt mx-2" style="margin-left: 8px" aria-hidden="true"></i> <span>Thể loại</span> </a>
            </li>
            <li class="collapsed">
                <a id="customer" class="m-link" href="<%=request.getContextPath()%>/ListCustomerAdmin">
                    <i class="fas fa-user-alt" style="margin: 0 10px;"></i> <span>Người dùng</span> </a>

            </li>
            <li class="collapsed">
                <a class="m-link" href="<%=request.getContextPath()%>/SignOut">
                    <i class="fa fa-sign-out" aria-hidden="true" style="margin-left: 10px"></i><span>Đăng xuất</span> </a>

            </li>




        </ul>
        <!-- Menu: menu collepce btn -->
        <button type="button" class="btn btn-link sidebar-mini-btn text-light">
            <span class="ms-2"><i class="fas fa-dot-circle"></i></span>
        </button>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
    let url = $(location).attr('href');
    if (url.includes("listProduct")){
        $("#product").addClass("active")
    }
    else if (url.includes("customer")){
        $("#customer").addClass("active")
    }
    else if (url.includes("order")){
        $("#order").addClass("active")
    }
    else if (url.includes("addProduct")){
        $("#addProduct").addClass("active")
    }
    else if (url.includes("Brand")){
        $("#containBrand").addClass("active")
    }
    else if (url.includes("Category")){
        $("#containCategory").addClass("active")
    }
    else {
        $("#home").addClass("active")
    }
</script>


<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 28/6/2022
  Time: 2:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="ebazar-layout" class="theme-blue">

    <!-- sidebar -->
    <%@include file="../header.jsp" %>


    <!-- main body area -->
    <div class="main px-lg-4 px-md-4">

        <!-- Body: Header -->

        <!-- Body: Body -->
        <form id="form-edit-product" class="body d-flex py-3" method="post" enctype="multipart/form-data" action="ProductDetailAdmin?%>">

            <div class="container-xxl">
                <div class="row align-items-center">
                    <div class="border-0 mb-4">
                        <div class="card-header py-3 no-bg bg-transparent d-flex align-items-center px-0 justify-content-between border-bottom flex-wrap">
                            <h3 class="fw-bold mb-0">Chỉnh sửa brand</h3>
                            <button type="submit" id="bt-save-edit-product" class="btn btn-primary btn-set-task w-sm-100 py-2 px-5 text-uppercase">Save</button>
                        </div>
                    </div>
                </div>
                <!-- Row end  -->
                <div class="row g-3 mb-3">
                    <div class="card mb-3">
                        <div class="card-header py-3 d-flex justify-content-between bg-transparent border-bottom-0">
                            <h6 class="mb-0 fw-bold ">Images</h6>
                        </div>
                        <div class="card-body">
                            <div>
                                <div class="row g-3 align-items-center">
                                    <div>
                                        <div class="col-md-12" style="display: flex; flex-wrap: wrap">
                                            <label class="form-label">Product Images Upload</label>
                                            <div style="display: flex; flex-wrap: wrap" class="images">
                                                <div id="contain-img->"  class="contain-color-image d-flex flex-wrap"></div>

                                                <%for(int i= 0;i < 8; i++){%>
                                                <div style="border:1px solid grey; margin: 5px 0; display: grid;margin: 5px" class="contain-color-image" >
                                                    <img id="img-<%=i%>" src="upload/product/.jpg" width="280" height="280">
                                                    <input id="input-img-<%=i%>" class="imgLoad" data-img="img-<%=i%>" type="file" name="fileImg" />
                                                    <div>
                                                        <button class="remove-img-detail" >Xóa</button>
                                                    </div>
                                                    <div class="d-flex align-items-center my-2">
                                                        <input  style="width: 30px; height:30px" type="radio" name="chooseMainImage" value=""

                                                        />
                                                    </div>
                                                </div>

                                                <%}%>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Row end  -->

        </form>

    </div>

</div>

</body>
</html>

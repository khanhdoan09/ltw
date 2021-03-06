<%@ page import="beans.Product" %>
<%@ page import="model.Image" %>
<%@ page import="java.io.File" %>
<%@ page import="controller.admin.UploadFile" %>
<%@ page import="model.ProductDetail" %>
<%@ page import="java.util.*" %>
<%@ page import="model.Admin.DaoProductAdmin" %>
<%@ page import="model.DaoProduct" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/2/2022
  Time: 7:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="en" dir="ltr">

<head>
    <%Object obj = request.getAttribute("productDetail");
        Product product = (Product) obj;%>
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

    <script src="javascript/khanh-js.js"></script>


    <style>
        .clicked {
            color: #eeee13;
        }
        #brands {
            display: none;
        }
        .remove-img-detail {
            width: 27%;
            margin: 5px 0;
            background-color: #dedee4;
        }
        .fileNewImg {
            background-color: #62637a;
            color:white;
            padding: 5px;
            border-radius: 10px;
            font-size: 15px;
            margin: 5px 0;
        }
        .remove-color {
            background-color: #62637a;
            color:white;
            padding: 5px;
            border-radius: 10px;
            font-size: 15px;
            margin: 5px 0;
        }
    </style>

</head>


<body>
<div id="ebazar-layout" class="theme-blue">

    <!-- sidebar -->
    <%@include file="../header.jsp" %>


    <!-- main body area -->
    <div class="main px-lg-4 px-md-4">

        <!-- Body: Header -->
        <%!
            public String getExceptionForm(Object exp) {
               return exp!=null ?exp.toString():"";
        }%>


        <!-- Body: Body -->
        <form id="form-edit-product" class="body d-flex py-3" method="post" enctype="multipart/form-data" action="SaveEditProduct?id=<%=product.getId()%>">

        <div class="container-xxl">
                <div class="row align-items-center">
                    <div class="border-0 mb-4">
                        <div class="card-header py-3 no-bg bg-transparent d-flex align-items-center px-0 justify-content-between border-bottom flex-wrap">
                            <h3 class="fw-bold mb-0">Ch???nh s???a s???n ph???m</h3>
                            <button type="submit" id="bt-save-edit-product" class="btn btn-primary btn-set-task w-sm-100 py-2 px-5 text-uppercase">Save</button>
                        </div>
                    </div>
                </div>
                <!-- Row end  -->
                <div class="row g-3 mb-3">
                    <div class="col-xl-4 col-lg-4">
                        <div class="sticky-lg-top">
                            <div class="card mb-3">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">
                                    <h6 class="m-0 fw-bold">Th??ng tin s???n ph???m</h6>
                                </div>
                                <div class="card-body">
                                    <div class="row g-3 align-items-center">
                                        <div class="col-md-12">
                                            <label class="form-label">Id s???n ph???m</label>
                                            <input name="id" value="<%=product.getId()%>" placeholder="<%=product.getId()%>" readonly/>
                                        </div>
                                        <div class="col-md-12">
                                            <label class="form-label">Gi?? s???n ph???m</label>
                                            <input type="text" class="form-control" name="price" value="<%=product.getPrice()%>">
                                            <p class="exception-form"><%=getExceptionForm(request.getAttribute("expPrice"))%></p>

                                        </div>
                                        <div class="col-md-12">
                                            <label class="form-label">Gi???m gi??</label>
                                            <input type="text" class="form-control" name="sale-rate" value="<%=product.getSaleRate()%>">
                                            <p class="exception-form"><%=getExceptionForm(request.getAttribute("expSaleRate"))%></p>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="card mb-3">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">
                                    <h5 class="m-0 fw-bold">M??u</h5>
                                </div>
                                <div class="card-body">
                                    <table style="width: 100%;" class="add-new-detail">
                                        <thead>
                                        <th>color</th>
                                        <th>size</th>
                                        <th>total</th>
                                        <th>sole</th>
                                        </thead>

                                    <%
                                        int totalQuantity=0;
                                        int totalSole=0;
                                     List<ProductDetail>list = product.getDetail();
                                     int countDetail=0;
                                     if (list != null) {
                                        for (ProductDetail detail : list ) {
                                            String color = detail.getColor();
                                            int size = detail.getSize();
                                            int totalValue = detail.getTotalValue();
                                            int soleValue = detail.getSoleValue();
                                    %>
                                        <tr id="tr-detail-<%=countDetail%>" class="tr-detail" data-color="<%=color%>">
                                                <td>
                                                    <span style="width: 50px;"><%=color%></span>
                                                </td>
                                                <td style="display: flex;">
                                                    <label class="form-check-label" for="size-<%=size%>">
                                                        <%=size%>
                                                    </label>
                                                </td>
                                                <td>
                                                    <input name="totalValue" style="width: 50px;" id="totalValue-<%=totalValue%>"value="<%=totalValue%>" type="number">
                                                </td>
                                                <td>
                                                    <input  name="soleValue" style="width: 50px;" id="soleValue-<%=soleValue%>"value="<%=soleValue%>"  type="number">
                                                </td>
                                            <td>
                                                <a class="remove-detail" style="cursor: pointer; font-size: 18px" data-detail="<%=countDetail%>" data-color="<%=color%>" data-size="<%=size%>" data-total="<%=totalValue%>" data-sole="<%=soleValue%>" >
                                                    <i class="fas fa-trash-alt"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    <%
                                            totalQuantity+=totalValue;
                                            totalSole+=soleValue;
                                            countDetail++;
                                            }
                                        }
                                    %>

                                    </table>

                                    <h5 class="m-0 fw-bold" style="margin: 10px ">Th??m size</h5>
                                    <table style="width: 100%;" class="table-add-detail">
                                        <thead>
                                        <th>color</th>
                                        <th>size</th>
                                        <th>total</th>
                                        <th>sole</th>
                                        </thead>
                                        <%List<String>colors = DaoProductAdmin.getInstance().getListColor(product.getId());
                                            for(String color : colors){%>
                                        <tr class="tr-add-detail" data-color="<%=color%>">
                                            <td><%=color%></td>
                                            <td>
                                                <input id="add-<%=color%>-size" style="width: 50px;" type="number" min="32" max="50">
                                                <span class="exp-edit" id="exp-<%=color%>-size"></span>
                                            </td>
                                            <td>
                                                <input id="add-<%=color%>-total" style="width: 50px;" type="number" min="0">
                                                <span class="exp-edit" id="exp-<%=color%>-total"></span>
                                            </td>
                                            <td>
                                                <input id="add-<%=color%>-sole" style="width: 50px;" type="number" min="0">
                                                <span class="exp-edit" id="exp-<%=color%>-sole"></span>
                                            </td>
                                            <td><a class="add-detail-admin" data-color="<%=color%>" style="font-size: 22px; cursor:pointer;"><i class="fas fa-save"></i></a></td>
                                        </tr>

                                        <%}%>
                                    </table>

                                </div>
                            </div>
<%--                            <div class="card mb-3">--%>
<%--                                <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">--%>
<%--                                    <h6 class="m-0 fw-bold">M??u</h6>--%>
<%--                                </div>--%>
<%--                                <div class="card-body">--%>
<%--                                    <%--%>
<%--                                        Set<String> listColor = product.getListSizeColor().listColor();--%>
<%--                                        for (Iterator<String> it = listColor.iterator(); it.hasNext(); ) {--%>
<%--                                            String color = it.next();--%>
<%--                                            %>--%>
<%--                                    <div class="form-check">--%>
<%--                                        <input class="form-check-input" id="color-<%=color%>" type="checkbox" checked>--%>
<%--                                        <label class="form-check-label" for="color-<%=color%>">--%>
<%--                                            <%=color%>--%>
<%--                                        </label>--%>
<%--                                    </div>--%>
<%--                                        <%--%>
<%--                                        }--%>
<%--                                        %>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="card mb-3">--%>
<%--                                <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">--%>
<%--                                    <h6 class="m-0 fw-bold">Size</h6>--%>
<%--                                </div>--%>
<%--                                <div class="card-body">--%>
<%--                                    <%--%>
<%--                                        List<Integer> listSize = product.getListSizeColor().getListSize();--%>
<%--                                        for(int i = 0,j=37; i < listSize.size(); i++,j++){%>--%>
<%--                                    <div class="form-check">--%>
<%--                                        <input name="size" value="<%=j%>"class="form-check-input" checked type="checkbox" id="sizecheck<%=j%>">--%>
<%--                                        <label class="form-check-label" for="sizecheck<%=j%>">--%>
<%--                                            <%if(j==listSize.get(i)){%>--%>
<%--                                            <%=listSize.get(i)%>--%>
<%--                                            <%}else{%>--%>
<%--                                            <%=j%>--%>
<%--                                            <%}%>--%>
<%--                                        </label>--%>
<%--                                    </div>--%>
<%--                                    <%}%>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <div class="card mb-3">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">
                                    <h5 class="m-0 fw-bold">Ng??y c??ng b???</h5>
                                </div>
                                <div class="card-body">
                                    <div class="row g-3 align-items-center">
                                        <div class="col-md-12">
                                            <label class="form-label">Ng??y</label>
                                            <input type="date" class="form-control w-100" value="<%=product.getCreate_at()%>">
                                        </div>
                                        <div class="col-md-12">
                                            <label class="form-label">Gi???</label>
                                            <input type="time" class="form-control w-100" value="10:30">
                                        </div>
                                    </div>
                                </div>
                            </div>



                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-8">
                        <div class="card mb-3">
                            <div class="card-header py-3 d-flex justify-content-between bg-transparent border-bottom-0">
                                <h6 class="mb-0 fw-bold ">Th??ng tin c?? b???n</h6>
                            </div>
                            <div class="card-body">
                                <div>
                                    <div class="row g-3 align-items-center">
                                        <div class="col-md-6">
                                            <label class="form-label">T??n</label>
                                            <input type="text" class="form-control" name="name" value="<%=product.getName()%>">
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Nh??n h??ng</label>
                                            <input type="text" list="brands" class="form-control" name="brand" autocomplete="off" value="<%=product.getBrand()%>"/>
                                            <datalist id="brands">
                                                <%List<String> brands = DaoProductAdmin.getInstance().getListBrand();
                                                for (String brand: brands){%>
                                                <option><%=brand%></option>
                                                <%}%>
                                            </datalist>
                                        </div>
                                        <div class="col-md-12">
                                            <label class="form-label" for="description">M?? t???</label>
                                            <input name="description" type="text" style="display: block; width: 100%; height: 80px;" id="description" placeholder="
                                              <%=product.getDescription()%>" value="<%=product.getDescription()%>" >
                                        </div>

                                        <div class="col-md-12">
                                            <div class="col-md-12">
                                                <h5>Th??m m??u m???i <input type="button" value="th??m m??u m???i" class="add-new-color"></h5>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

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
                                                    <%
                                                        String mainColor = DaoProduct.getInstance().getMainColor(product.getId());
                                                        List<String>listColor = DaoProductAdmin.getInstance().getListColor(product.getId());%>
                                                    <%
                                                        for(int j = 0; j < listColor.size(); j++){%>
                                                        <h5 id="color-<%=j%>" class="contain-color-image" data-color="<%=listColor.get(j)%>" style="display: block; width: 100%">M??u: <input name="color" value="<%=listColor.get(j)%>" />
                                                            <br>
                                                            <input data-containimg="contain-img-<%=j%>" data-color="<%=listColor.get(j)%>" value="Th??m m???i" id="add-img-<%=j%>" data-j="<%=j%>"  type="button"  class="fileNewImg" />
                                                            <input type="button" class="remove-color" data-color="<%=listColor.get(j)%>" value="X??a m??u <%=listColor.get(j)%>">
                                                            <div class="d-flex align-items-center">
                                                                <input type="radio" style="width: 20px;height:20px" name="chooseMainColor" id="mainColor_<%=listColor.get(j)%>" value="<%=listColor.get(j)%>"
                                                                <%if(mainColor.equals(listColor.get(j))){ %>
                                                                        checked
                                                                <%}%>>
                                                                <label for="mainColor_<%=listColor.get(j)%>" style="cursor: pointer">Choose main color</label>
                                                            </div>
                                                        </h5>
                                                        <div id="contain-img-<%=j%>" data-color="<%=listColor.get(j)%>" class="contain-color-image d-flex flex-wrap"></div>

                                                    <%for(int i= 0;i < product.getListImg().size(); i++){%>
                                                    <%String color = product.getListImg().get(i).getColor();
                                                    if (color.equals(listColor.get(j))){%>
                                                    <div style="border:1px solid grey; margin: 5px 0; display: grid;margin: 5px" class="contain-color-image" data-color="<%=color%>">
                                                        <%String nameImg = product.getListImg().get(i).getImg();%>
                                                        <img id="img-<%=i%>" src="data/imgAll/upload/product/<%=nameImg%>.jpg" width="280" height="280">
                                                        <input id="input-img-<%=i%>" class="imgLoad" data-img="img-<%=i%>" type="file" name="fileImg" />
                                                        <button class="remove-img-detail" data-nameimg="<%=nameImg%>">X??a</button>
                                                        <div class="d-flex align-items-center my-2">
                                                            <input  style="width: 30px; height:30px" type="radio" id="mainImage_<%=i%>" name="chooseMainImage_<%=j%>" value="<%=nameImg+"@"+color%>"
                                                                <% if(product.getListImg().get(i).getLelvel()==0){%>
                                                                   checked
                                                                <%}%>
                                                            />
                                                            <label style="cursor: pointer" for="mainImage_<%=i%>"><h6>Main Image</h6></label>
                                                        </div>
                                                    </div>
                                                    <%}%>

                                                    <%}%>

                                                    <%}%>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">
                                <h6 class="m-0 fw-bold">Inventory Info</h6>
                            </div>
                            <div class="card-body">
                                <div class="row g-3 align-items-center">
                                    <div class="col-md-12">
                                        <label class="form-label">T???ng s??? l?????ng </label>
                                        <input id="totalValue" type="text" name="sold" class="form-control" value="<%=totalQuantity%>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="form-label">???? b??n</label>
                                        <input id="totalSole" type="text"name="total-quantity" class="form-control" value="<%=totalSole%>" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%if(product.getCategory() != null) {
                            String[] category = product.getCategory().split("\\s+");
                        String gender = category[1];
                        String typeCategory = category[0];
                        %>
                        <div class="card mb-3">
                            <div class="card-header py-3 d-flex justify-content-between align-items-center bg-transparent border-bottom-0">
                                <h6 class="m-0 fw-bold">Gi???i t??nh</h6>
                            </div>

                            <div class="card-body">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="gender" value="Man"
                                        <%
                                         if(gender.equals("Man")){%>
                                            <%="checked"%>
                                        <%}%>>
                                    <label class="form-check-label">
                                        Nam
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="gender" value="Woman"
                                        <%
                                         if(gender.equals("Woman")){%>
                                        <%="checked"%>
                                        <%}%>>
                                    <label class="form-check-label">
                                        N???
                                    </label>
                                </div>

                            </div>
                            <div class="card-body">
                                <label class="form-label">Th??? lo???i</label>
                                <select class="form-select" size="3" aria-label="size 3 select example" name="category">
                                    <option value="Skateboard"  <%
                                        if(typeCategory.equals("Skateboard")){%>
                                            <%="selected"%>
                                            <%}%>>Skateboard</option>
                                    <option value="Slides" <%
                                        if(typeCategory.equals("Slides")){%>
                                            <%="selected"%>
                                            <%}%>>Slides</option>
                                    <option value="Sneakers" <%
                                        if(typeCategory.equals("Sneakers")){%>
                                            <%="selected"%>
                                            <%}%>>Sneakers</option>
                                    <option value="Trainers" <%
                                        if(typeCategory.equals("Trainers")){%>
                                            <%="selected"%>
                                            <%}%>>Trainers</option>
                                    <option value="Running" <%
                                        if(typeCategory.equals("Running")){%>
                                            <%="selected"%>
                                            <%}%>>Running</option>
                                </select>
                            </div>


                            <div class="col-md-12">
                                <div class="col-md-12">
                                        <div>
                                            <label class="form-label">Active product</label>
                                            <div class="">
                                                <div class="d-flex align-items-center">
                                                    <label for="active-yes">Active</label>
                                                    <input class="mx-2" id="active-yes" type="radio" name="active" value="1"
                                                    <%if(product.getActive()==1){%>
                                                            checked
                                                           <%}%>
                                                    />
                                                </div>

                                             <div class="d-flex align-items-center">
                                                 <label for="active-no">Not active</label>
                                                 <input class="mx-2" type="radio" id="active-no" name="active" value="0"
                                                         <%if(product.getActive()==0){%>
                                                        checked
                                                         <%}%>
                                                 />
                                             </div>
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
                <!-- Row end  -->

        </div>
        </form>

<%--        <form id="form-edit-img"  action="UploadDownLoadFileServlet" method="POST" enctype="multipart/form-data">--%>
<%--            <input type="file" name="fileImg" />--%>
<%--        </form>--%>

<%--        <!-- Modal Custom Settings-->--%>
<%--        <div class="modal fade right" id="Settingmodal" tabindex="-1" aria-hidden="true">--%>
<%--            <div class="modal-dialog  modal-sm">--%>
<%--                <div class="modal-content">--%>
<%--                    <div class="modal-header">--%>
<%--                        <h5 class="modal-title">Custom Settings</h5>--%>
<%--                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--                    </div>--%>
<%--                    <div class="modal-body custom_setting">--%>
<%--                        <!-- Settings: Color -->--%>
<%--                        <div class="setting-theme pb-3">--%>
<%--                            <h6 class="card-title mb-2 fs-6 d-flex align-items-center"><i class="icofont-color-bucket fs-4 me-2 text-primary"></i>Template Color Settings</h6>--%>
<%--                            <ul class="list-unstyled row row-cols-3 g-2 choose-skin mb-2 mt-2">--%>
<%--                                <li data-theme="indigo">--%>
<%--                                    <div class="indigo"></div>--%>
<%--                                </li>--%>
<%--                                <li data-theme="tradewind">--%>
<%--                                    <div class="tradewind"></div>--%>
<%--                                </li>--%>
<%--                                <li data-theme="monalisa">--%>
<%--                                    <div class="monalisa"></div>--%>
<%--                                </li>--%>
<%--                                <li data-theme="blue" class="active">--%>
<%--                                    <div class="blue"></div>--%>
<%--                                </li>--%>
<%--                                <li data-theme="cyan">--%>
<%--                                    <div class="cyan"></div>--%>
<%--                                </li>--%>
<%--                                <li data-theme="green">--%>
<%--                                    <div class="green"></div>--%>
<%--                                </li>--%>
<%--                                <li data-theme="orange">--%>
<%--                                    <div class="orange"></div>--%>
<%--                                </li>--%>
<%--                                <li data-theme="blush">--%>
<%--                                    <div class="blush"></div>--%>
<%--                                </li>--%>
<%--                                <li data-theme="red">--%>
<%--                                    <div class="red"></div>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                        <div class="sidebar-gradient py-3">--%>
<%--                            <h6 class="card-title mb-2 fs-6 d-flex align-items-center"><i class="icofont-paint fs-4 me-2 text-primary"></i>Sidebar Gradient</h6>--%>
<%--                            <div class="form-check form-switch gradient-switch pt-2 mb-2">--%>
<%--                                <input class="form-check-input" type="checkbox" id="CheckGradient">--%>
<%--                                <label class="form-check-label" for="CheckGradient">Enable Gradient! ( Sidebar )</label>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <!-- Settings: Template dynamics -->--%>
<%--                        <div class="dynamic-block py-3">--%>
<%--                            <ul class="list-unstyled choose-skin mb-2 mt-1">--%>
<%--                                <li data-theme="dynamic">--%>
<%--                                    <div class="dynamic"><i class="icofont-paint me-2"></i> Click to Dyanmic Setting</div>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                            <div class="dt-setting">--%>
<%--                                <ul class="list-group list-unstyled mt-1">--%>
<%--                                    <li class="list-group-item d-flex justify-content-between align-items-center py-1 px-2">--%>
<%--                                        <label>Primary Color</label>--%>
<%--                                        <button id="primaryColorPicker" class="btn bg-primary avatar xs border-0 rounded-0"></button>--%>
<%--                                    </li>--%>
<%--                                    <li class="list-group-item d-flex justify-content-between align-items-center py-1 px-2">--%>
<%--                                        <label>Secondary Color</label>--%>
<%--                                        <button id="secondaryColorPicker" class="btn bg-secondary avatar xs border-0 rounded-0"></button>--%>
<%--                                    </li>--%>
<%--                                    <li class="list-group-item d-flex justify-content-between align-items-center py-1 px-2">--%>
<%--                                        <label class="text-muted">Chart Color 1</label>--%>
<%--                                        <button id="chartColorPicker1" class="btn chart-color1 avatar xs border-0 rounded-0"></button>--%>
<%--                                    </li>--%>
<%--                                    <li class="list-group-item d-flex justify-content-between align-items-center py-1 px-2">--%>
<%--                                        <label class="text-muted">Chart Color 2</label>--%>
<%--                                        <button id="chartColorPicker2" class="btn chart-color2 avatar xs border-0 rounded-0"></button>--%>
<%--                                    </li>--%>
<%--                                    <li class="list-group-item d-flex justify-content-between align-items-center py-1 px-2">--%>
<%--                                        <label class="text-muted">Chart Color 3</label>--%>
<%--                                        <button id="chartColorPicker3" class="btn chart-color3 avatar xs border-0 rounded-0"></button>--%>
<%--                                    </li>--%>
<%--                                    <li class="list-group-item d-flex justify-content-between align-items-center py-1 px-2">--%>
<%--                                        <label class="text-muted">Chart Color 4</label>--%>
<%--                                        <button id="chartColorPicker4" class="btn chart-color4 avatar xs border-0 rounded-0"></button>--%>
<%--                                    </li>--%>
<%--                                    <li class="list-group-item d-flex justify-content-between align-items-center py-1 px-2">--%>
<%--                                        <label class="text-muted">Chart Color 5</label>--%>
<%--                                        <button id="chartColorPicker5" class="btn chart-color5 avatar xs border-0 rounded-0"></button>--%>
<%--                                    </li>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <!-- Settings: Font -->--%>
<%--                        <div class="setting-font py-3">--%>
<%--                            <h6 class="card-title mb-2 fs-6 d-flex align-items-center"><i class="icofont-font fs-4 me-2 text-primary"></i> Font Settings</h6>--%>
<%--                            <ul class="list-group font_setting mt-1">--%>
<%--                                <li class="list-group-item py-1 px-2">--%>
<%--                                    <div class="form-check mb-0">--%>
<%--                                        <input class="form-check-input" type="radio" name="font" id="font-poppins" value="font-poppins">--%>
<%--                                        <label class="form-check-label" for="font-poppins">--%>
<%--                                            Poppins Google Font--%>
<%--                                        </label>--%>
<%--                                    </div>--%>
<%--                                </li>--%>
<%--                                <li class="list-group-item py-1 px-2">--%>
<%--                                    <div class="form-check mb-0">--%>
<%--                                        <input class="form-check-input" type="radio" name="font" id="font-opensans" value="font-opensans" checked="">--%>
<%--                                        <label class="form-check-label" for="font-opensans">--%>
<%--                                            Open Sans Google Font--%>
<%--                                        </label>--%>
<%--                                    </div>--%>
<%--                                </li>--%>
<%--                                <li class="list-group-item py-1 px-2">--%>
<%--                                    <div class="form-check mb-0">--%>
<%--                                        <input class="form-check-input" type="radio" name="font" id="font-montserrat" value="font-montserrat">--%>
<%--                                        <label class="form-check-label" for="font-montserrat">--%>
<%--                                            Montserrat Google Font--%>
<%--                                        </label>--%>
<%--                                    </div>--%>
<%--                                </li>--%>
<%--                                <li class="list-group-item py-1 px-2">--%>
<%--                                    <div class="form-check mb-0">--%>
<%--                                        <input class="form-check-input" type="radio" name="font" id="font-mukta" value="font-mukta">--%>
<%--                                        <label class="form-check-label" for="font-mukta">--%>
<%--                                            Mukta Google Font--%>
<%--                                        </label>--%>
<%--                                    </div>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                        <!-- Settings: Light/dark -->--%>
<%--                        <div class="setting-mode py-3">--%>
<%--                            <h6 class="card-title mb-2 fs-6 d-flex align-items-center"><i class="icofont-layout fs-4 me-2 text-primary"></i>Contrast Layout</h6>--%>
<%--                            <ul class="list-group list-unstyled mb-0 mt-1">--%>
<%--                                <li class="list-group-item d-flex align-items-center py-1 px-2">--%>
<%--                                    <div class="form-check form-switch theme-switch mb-0">--%>
<%--                                        <input class="form-check-input" type="checkbox" id="theme-switch">--%>
<%--                                        <label class="form-check-label" for="theme-switch">Enable Dark Mode!</label>--%>
<%--                                    </div>--%>
<%--                                </li>--%>
<%--                                <li class="list-group-item d-flex align-items-center py-1 px-2">--%>
<%--                                    <div class="form-check form-switch theme-high-contrast mb-0">--%>
<%--                                        <input class="form-check-input" type="checkbox" id="theme-high-contrast">--%>
<%--                                        <label class="form-check-label" for="theme-high-contrast">Enable High Contrast</label>--%>
<%--                                    </div>--%>
<%--                                </li>--%>
<%--                                <li class="list-group-item d-flex align-items-center py-1 px-2">--%>
<%--                                    <div class="form-check form-switch theme-rtl mb-0">--%>
<%--                                        <input class="form-check-input" type="checkbox" id="theme-rtl">--%>
<%--                                        <label class="form-check-label" for="theme-rtl">Enable RTL Mode!</label>--%>
<%--                                    </div>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="modal-footer justify-content-start">--%>
<%--                        <button type="button" class="btn btn-white border lift" data-dismiss="modal">Close</button>--%>
<%--                        <button type="button" class="btn btn-primary lift">Save Changes</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <!-- Modal Cropper-->--%>
<%--        <div class="modal docs-cropped" id="getCroppedCanvasModal" tabindex="-1" aria-hidden="true">--%>
<%--            <div class="modal-dialog">--%>
<%--                <div class="modal-content">--%>
<%--                    <div class="modal-header">--%>
<%--                        <h5 class="modal-title">Cropped</h5>--%>
<%--                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--                    </div>--%>
<%--                    <div class="modal-body"></div>--%>
<%--                    <div class="modal-footer">--%>
<%--                        <button type="button" class="btn btn-white border lift" data-bs-dismiss="modal">Close</button>--%>
<%--                        <a class="btn btn-primary" id="download" href="javascript:void(0);" download="cropped.jpg">Download</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

    </div>

</div>

<!-- Jquery Core Js -->

<script src="assets/bundles/libscripts.bundle.js"></script>

<!-- Jquery Plugin -->
<script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
<script src="assets/plugin/multi-select/js/jquery.multi-select.js"></script>
<!-- Multi Select Plugin Js -->
<script src="assets/plugin/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
<!-- Bootstrap Tags Input Plugin Js -->
<script src="assets/plugin/cropper/cropper.min.js"></script>
<script src="assets/plugin/cropper/cropper-init.js"></script>
<script src="assets/bundles/dropify.bundle.js"></script>
<script src="assets/bundles/dataTables.bundle.js"></script>

<!-- Jquery Page Js -->

<script src="../js/template.js"></script>



<script>

    function removeDetailInAdmin() {
        $(".remove-detail").each(function () {
            $(this).click(()=>{
                removeDetail(this)
            })
        })
    }

    $(document).ready(()=>{
        removeDetailInAdmin()
    })

    $(function addDetailAdmin(){
        $(".add-detail-admin").each(function () {
            $(this).click(()=>{
                let color = $(this).data("color")
                let size = $("#add-"+color+"-size").val()
                let total = $("#add-"+color+"-total").val()
                let sole = $("#add-"+color+"-sole").val()
                alert(color + " " + size + " " + total + " " + sole)
                let check = true
                $(".exp-edit").text("")

                if (!size) {
                    check=false
                    $("#exp-"+color+"-size").text("Size is null");
                }
                if (size < 0) {
                    check=false
                    $("#exp-"+color+"-size").text("Size is negative");
                }
                if (!total) {
                    check=false
                    $("#exp-"+color+"-total").text("Total is null");
                }
                if (total < 0) {
                    check=false
                    $("#exp-"+color+"-total").text("Total is negative");
                }
                if(!sole) {
                    check=false
                    $("#exp-"+color+"-sole").text("Sole is null");
                }
                if (sole < 0) {
                    check=false
                    $("#exp-"+color+"-sole").text("Sole is negative");
                }
                if (total < sole) {
                    check=false;
                    $("#exp-"+color+"-total").text("Total must be \n bigger than sole");
                }
                if (check) {
                    $.ajax({
                        url: `AddDetail?id=<%=product.getId()%>&color=`+color+`&size=`+size+`&total=`+total+`&sole=`+sole,
                        type: 'POST',
                        success: function (data) {
                            $("#totalValue").val($("#totalValue").val()+total)
                            $("#totalSole").val($("#totalSole").val()+sole)

                            let newId = new Date().getTime()
                            let newTr = `
                             <tr id="tr-detail-`+newId+`">
                                                <td>
                                                    <span style="width: 50px;">`+color+`</span>
                                                </td>
                                                <td style="display: flex;">
                                                    <label class="form-check-label" for="size-`+size+`">
                                                        `+size+`
                                                    </label>
                                                </td>
                                                <td>
                                                    <input name="totalValue" style="width: 50px;" id="totalValue-`+total+`"value="`+total+`" type="number">
                                                </td>
                                                <td>
                                                    <input  name="soleValue" style="width: 50px;" id="soleValue-`+sole+`"value="`+sole+`"  type="number">
                                                </td>
                                            <td>
                                                <a id="`+newId+`" class="remove-detail" style="cursor: pointer; font-size: 18px" data-detail="`+newId+`" data-color="`+color+`" data-size="`+size+`" data-total="`+total+`" data-sole="`+sole+`" >
                                                    <i class="fas fa-trash-alt"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        `
                            $(".add-new-detail").append(newTr)
                            $("#"+newId).click(()=>{
                                removeDetail($("#"+newId))
                            })
                        },
                        error: function() {
                            alert("Error")
                        }
                    })
                }
            })
        })
    })

    function removeDetail(tr) {
            let data = $(tr).data("detail")
            let color = $(tr).data("color")
            let size = $(tr).data("size")
            let total = $(tr).data("total")
            let sole = $(tr).data("sole")
            alert(`Are you sure wanna delete this tr-detail-`+data + " " + color + " "+size)
            $(`#tr-detail-`+data).remove()
            $.ajax({
                url: `RemoveDetail?id=<%=product.getId()%>&color=`+color+`&size=`+size,
                type: 'POST',
                success: function (data) {
                    alert(data)
                    $("#totalValue").val($("#totalValue").val()-total)
                    $("#totalSole").val($("#totalSole").val()-sole)
                },
                error: function() {
                    alert("Error")
                }
            })

    }


    function removeDetailImg() {
        $(".remove-img-detail").each(function(){
            $(this).click((e)=>{
                e.preventDefault()
                let img = $(this).data("nameimg")
                $.ajax({
                    url: `RemoveImg?id=<%=product.getId()%>&nameImg=`+img,
                    type: 'POST',
                    success: function (data) {
                        alert(data)
                    },
                    error: function() {
                        alert("Error")
                    }
                })
                $(this).parent().remove()
            })
        })
    }
    $(document).ready(()=>{
        removeDetailImg()
    })



    function loadImg() {
        $(".imgLoad").each(function(){
            $(this).change(function () {
                let idImgShow = $(this).data("img")
                if (this.files && this.files[0]) {
                    let reader = new FileReader()
                    reader.onload = function (e) {
                        $("#"+idImgShow).attr('src', e.target.result)
                    }
                    reader.readAsDataURL(this.files[0])
                }
            });
        })
    }
    $(document).ready(()=>{
        loadImg()
    })

    $(function addNewColor() {
        let count=-1
        $(".add-new-color").click(()=>{
            let color = ` <h5 style="display: block; width: 100%">M??u: <input name="addNewColor" id="new-color-`+count+`" />
                         <br>
                         <input data-containimg="contain-img-`+count+`" data-color="`+$("#new-color-"+count).val()+`" id="add-img-`+count+`"  data-j="`+new Date().getTime()+`" data-maincolor="`+count+`" value="Th??m m???i"  type="button" />
                        </h5>
                           <div class="d-flex align-items-center">
                               <input type="radio" style="width: 20px;height:20px" name="chooseMainColor" id="mainColor_`+count+`" value="">
                                      <label for="mainColor_`+count+`" style="cursor: pointer">Choose main color</label>
                                   </div>
                         <div id="contain-img-`+count+`" class="d-flex flex-wrap"></div>`
            $(".images").prepend(color)

            testChangeDataColor("add-img-"+count, "new-color-"+count)
            testColor("add-img-"+count)
            addDetailProduct("add-img-"+count)
            count--
        })
    })

    function addDetailProduct(id) {
        let wasClicked=false
        $("#"+id).click(()=>{
            if(wasClicked==false) {
                let color = $("#" + id).data('color')
                let newDetail = `
                                                    <tr class="tr-add-detail" data-color="` + color + `">
                                            <td>` + color + `</td>
                                            <td>
                                                <input id="add-` + color + `-size" style="width: 50px;" type="number" min="32" max="50">
                                                <span class="exp-edit" id="exp-` + color + `-size"></span>
                                            </td>
                                            <td>
                                                <input id="add-` + color + `-total" style="width: 50px;" type="number" min="0">
                                                <span class="exp-edit" id="exp-` + color + `-total"></span>
                                            </td>
                                            <td>
                                                <input id="add-` + color + `-sole" style="width: 50px;" type="number" min="0">
                                                <span class="exp-edit" id="exp-` + color + `-sole"></span>
                                            </td>
                                            <td><a class="add-detail-admin" data-color="` + color + `" style="font-size: 22px; cursor:pointer;"><i class="fas fa-save"></i></a></td>
                                        </tr>
`
                $(".table-add-detail").append(newDetail)
            }
            wasClicked=true
        })
    }

    function testChangeDataColor(id, idColor) {
        $("#"+idColor).keyup(()=>{
            $("#"+id).data("color", $("#"+idColor).val())
            alert($("#"+id).data("maincolor"))
            $("#mainColor_"+$("#"+id).data("maincolor")).val($("#"+idColor).val())
            alert($("#mainColor_"+$("#"+id).data("maincolor")).val())
        })
    }

    $(function addNewImage() {
        $(".fileNewImg").each(function(){
            $(this).click(()=>{
                test($(this).attr('id'))
            })
        })
    })

    function testColor(id) {
        $("#"+id).click(()=>test(id))
    }

    function test(idInput) {
        // $("#"+idInput).click(()=>{
        let id = new Date().getTime()
        let color=$("#"+idInput).data('color')
        let j = $("#"+idInput).data('j')
        let i = new Date().getTime()
        alert(idInput+" "+$("#"+idInput).data('color'))
        let newImg = `<div class="d-flex justify-content-around" style="border: 1px solid black; margin-right: 5px">
                        <img id="img-`+id+`" width="280" height="280">
                        <input type="file" id="input-img-`+id+`" class="imgLoad" data-img="img-`+id+`" name="fileNewImg_`+color+`" />
                        <button class="remove-img-detail">X??a</button>
<div class="d-flex align-items-center my-2">
                                                            <input style="width: 30px; height:30px" type="radio" id="mainImage_`+i+`" name="chooseMainImage_`+j+`">
                                                            <label style="cursor: pointer" for="mainImage_`+i+`"><h6>Main Image</h6></label>
                                                        </div>
                        </div>

                        `


        let divContain=$("#"+idInput).data("containimg")
        $("#"+divContain).append(newImg)

        $("#mainImage_"+i).click(()=>{
            console.log(213)
            alert(123)
            $("#input-img-"+id).attr('name', "fileNewImg_"+color+"_checked");
            alert($("#input-img-"+id).attr("id") + " " + $("#input-img-"+id).attr("name"))
        })

        $(this).bind('change', ()=>{
            let reader = new FileReader()
            reader.onload = function (e) {
                $("#img-"+id).attr('src', e.target.result)
            }
            reader.readAsDataURL(this.files[0])
        })

        loadImg()
        removeDetailImg()
        // })
    }

    $(function removeColor() {
        $(".remove-color").each(function (){
            $(this).click(()=>{
                let color = $(this).data('color')
                alert(color)
                $.ajax({
                    url: `RemoveColor?id=<%=product.getId()%>&color=`+color,
                    type: 'POST',
                    success: function (data) {
                        alert(data)
                        $(".tr-detail").each(function (){
                            if ($(this).data("color")==color) {
                                $(this).remove()
                            }
                        })
                        $(".tr-add-detail").each(function (){
                            if ($(this).data("color")==color) {
                                $(this).remove()
                            }
                        })
                        $(".contain-color-image").each(function (){
                            if ($(this).data("color")==color) {
                                $(this).remove()
                            }
                        })
                    },
                    error: function() {
                        alert("Error")
                    }
                })
            })

        })
    })

</script>


</body>

</html>
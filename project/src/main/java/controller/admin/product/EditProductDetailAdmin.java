package controller.admin.product;

import dao.product.DaoProductAdmin;
import dao.product.color.DaoProductColor;
import dao.product.detail.DaoProductDetail;
import dao.product.image.DaoProductImage;
import beans.Product;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "EditProductDetailAdmin", value = "/EditProductDetailAdmin")
public class EditProductDetailAdmin  extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String SAVE_DIR = "upload\\product";
    private static final int THRESHOLD_SIZE = 1024 * 1024 * 3; // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40;// 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        saveImageToFolder(id, request);
        updateProduct(request, response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Product productDetail = DaoProductDetail.getInstance().getDetailProduct(id);
        String price = request.getParameter("price");
        if (price != null) {
            productDetail.setPrice(Double.parseDouble(request.getParameter("price")));
        }
        String saleRate = request.getParameter("sale-rate");
        if (saleRate != null ) {
            productDetail.setSaleRate(Double.parseDouble(saleRate));
        }
        String sole = request.getParameter("sold");
        if (sole != null) {
            productDetail.setSoleValue(Integer.parseInt(sole));
        }
        String quantity = request.getParameter("total-quantity");
        if (quantity != null) {
            productDetail.setQuantity(Integer.parseInt(quantity));
        }
        productDetail.setName(request.getParameter("name"));
//        String brand = request.getParameter("brand");
//        List<Brand>brands = DaoProductBrand.getInstance().getListBrand();
//        if (!brands.contains(brand)) {
//            DaoProductBrand.getInstance().saveNewBrand(brand);
//        }
//        productDetail.setBrand(brand);

        productDetail.setDescription(request.getParameter("description"));

        String gender = request.getParameter("gender");
        productDetail.setGender(gender);
//        // category
//        String[] category = productDetail.getCategory().split("\\s+");
//        productDetail.setCategory(request.getParameter("category") + " " + category[1]);
        // change color
        String arrColor[] = request.getParameterValues("color");
        if (arrColor != null) {
            for (int countColor = 0; countColor < arrColor.length; countColor++) {
                if(productDetail.getListImg().get(countColor).getLelvel()==0) {
                    String colorOld = productDetail.getListImg().get(countColor).getColor();
                    String colorNew = arrColor[countColor];
                    DaoProductColor.getInstance().editColor(productDetail.getId(), colorNew, colorOld);
                    countColor++;
                }
            }
        }
        // new color and new img
        String arrNewColor[] = request.getParameterValues("newColor");
        int countNewNameImg=0;
        if (arrNewColor != null) {
            for (int countColor = 0; countColor < arrNewColor.length; countColor++) {
                String nameImg = id+"_"+countNewNameImg+"_"+arrNewColor[countColor];
                DaoProductImage.getInstance().saveImg(productDetail.getId(),nameImg,1, arrNewColor[countColor]);
                countNewNameImg++;
            }
        }
        productDetail.setCreate_at(request.getParameter("date"));
        String active = request.getParameter("active");
        if (active != null){
            productDetail.setActive(Integer.parseInt(active));
        }
        String mainColor = request.getParameter("chooseMainColor");
        if (mainColor != null) {
            DaoProductColor.getInstance().saveMainColor(id, mainColor);
        }
        else {
            DaoProductColor.getInstance().saveMainColor(id, "null");
        }

        // save new and update old
        String[] newImg = request.getParameterValues("newimg");
        if (newImg != null) {
            for (int i =0 ; i < newImg.length; i ++) {
                String[] colorAndNameImg = newImg[i].split("#");
                String color = colorAndNameImg[0];
                String nameImg = colorAndNameImg[1];
                nameImg = id+"_"+nameImg;
                DaoProductAdmin.getInstance().saveImg(productDetail.getId(),nameImg,1, color);
            }
        }
        String mainImage = request.getParameter("chooseMainImage");
        if (mainImage != null) {
            String[] data = mainImage.split("~");
            String nameImg = data[0];
            String color = data[1];
            DaoProductImage.getInstance().setImgToMain(nameImg, productDetail.getId(), color);
        }

        String[] changeImageArr = request.getParameterValues("containHiddenImgExist");
        if (changeImageArr != null) {
            for (int i = 0; i < changeImageArr.length; i++) {
                String changeImg = changeImageArr[i];
                if (changeImg.toLowerCase().trim() != "empty") {
                    String[] arr  = changeImg.split("#");
                    if (arr.length > 1) {
                        String oldNameImg = arr[0];
                        String newNameImg = arr[1];
                        String color = arr[2];
                        DaoProductAdmin.getInstance().changeImg(id, color, oldNameImg, newNameImg);
                    }
                    System.out.println(changeImageArr[i] +" change img");
                }
            }
        }

        DaoProductAdmin.getInstance().editProduct(id, productDetail);

        request.setAttribute("productDetail", DaoProductDetail.getInstance().getDetailProduct(id));
        request.getRequestDispatcher("/views/admin/crud/product/EditProduct.jsp").forward(request, response);
    }


    private void saveImageToFolder(String idProduct, HttpServletRequest request) throws ServletException, IOException {
        String appPath = getServletContext().getRealPath("");
        String savePath = appPath  + SAVE_DIR;

        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            if(fileName!="") {
                part.write(savePath + "\\"+idProduct+"_"+fileName);
            }
        }
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                String nameImg = s.substring(s.indexOf("=") + 2, s.length()-1);

                return nameImg;
            }
        }
        return "";
    }

}

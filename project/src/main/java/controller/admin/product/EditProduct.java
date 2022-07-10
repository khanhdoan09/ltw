package controller.admin.product;

import service.admin.ProductAdminService;
import beans.Product;
import dao.product.DaoProductAdmin;
import dao.product.brand.DaoProductBrand;
import dao.product.color.DaoProductColor;
import dao.product.detail.DaoProductDetail;
import dao.product.image.DaoProductImage;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

@MultipartConfig(fileSizeThreshold=1024*1024*2,// 2MB
        maxFileSize=1024*1024*10,// 10MB
        maxRequestSize=1024*1024*50)// 50MB
// Annotation MultipartConfig: A servlet can be annotated with this annotation in order to handle multipart/form-data requests which contain file upload data. The MultipartConfig annotation has the following options:
//fileSizeThreshold: file’s size that is greater than this threshold will be directly written to disk, instead of saving inmemory.
//location: directory where file will be stored via Part.write() method.
//maxFileSize: maximum size for a single upload file.
//maxRequestSize: maximum size for a request.
//All sizes are measured in bytes.

@WebServlet(name = "EditCurrentProduct", value = "/EditCurrentProductAdmin")
public class EditProduct extends HttpServlet {
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
        productDetail.setBrand(request.getParameter("brand"));
        productDetail.setDescription(request.getParameter("description"));
        productDetail.setCategory(request.getParameter("category"));


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
        productDetail.setActive(Integer.parseInt(request.getParameter("active")));
        DaoProductColor.getInstance().saveMainColor(id, request.getParameter("chooseMainColor"));

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

        ProductAdminService productAdminService = new ProductAdminService();
        productAdminService.editProduct(id, productDetail);
        Product productEdited = productAdminService.getDetailProduct(id);

        request.setAttribute("productDetail", productEdited);
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

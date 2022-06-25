package controller.admin.product;

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

@MultipartConfig(fileSizeThreshold=1024*1024*2,// 2MB
        maxFileSize=1024*1024*10,// 10MB
        maxRequestSize=1024*1024*50)// 50MB
// Annotation MultipartConfig: A servlet can be annotated with this annotation in order to handle multipart/form-data requests which contain file upload data. The MultipartConfig annotation has the following options:
//fileSizeThreshold: file’s size that is greater than this threshold will be directly written to disk, instead of saving inmemory.
//location: directory where file will be stored via Part.write() method.
//maxFileSize: maximum size for a single upload file.
//maxRequestSize: maximum size for a request.
//All sizes are measured in bytes.

@WebServlet(name = "EditCurrentProduct", value = "/EditCurrentProduct")
public class EditCurrentProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String SAVE_DIR = "upload";
    private static final int THRESHOLD_SIZE = 1024 * 1024 * 3; // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40;// 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        updateProduct(request, response);
        saveImageToFolder(request);
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
        // khong co brand thi auto tao brand moi
        String brand = request.getParameter("brand");
        List<String>brands = DaoProductBrand.getInstance().getListBrand();
        if (!brands.contains(brand)) {
            DaoProductBrand.getInstance().saveNewBrand(brand);
        }
        productDetail.setBrand(brand);

        productDetail.setDescription(request.getParameter("description"));

//        // gender
//        String[] gender = productDetail.getCategory().split("\\s+");
//        productDetail.setCategory(gender[0] + " " +request.getParameter("gender"));
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
        String mainImage = request.getParameter("chooseMainImage");
        if (mainImage != null) {
            String[] data = mainImage.split("~");
            String nameImg = data[0];
            String idProduct = data[1];
            String color = data[2];
            DaoProductImage.getInstance().setImgToMain(nameImg, idProduct, color);
        }

        DaoProductAdmin.getInstance().editProduct(id, productDetail);

        request.setAttribute("productDetail", DaoProductDetail.getInstance().getDetailProduct(id));
        request.getRequestDispatcher("EditProduct.jsp").forward(request, response);
    }


    private void saveImageToFolder(HttpServletRequest request) throws ServletException, IOException {

        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath  + SAVE_DIR;

        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            if(fileName!="") {
                part.write(savePath + "\\" + fileName);
            }
        }
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }

}

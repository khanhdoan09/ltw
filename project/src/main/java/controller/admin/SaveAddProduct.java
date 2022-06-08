package controller.admin;

import model.Admin.DaoProductAdmin;
import model.Image;
import beans.Product;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@WebServlet(name = "SaveAddProduct", value = "/SaveAddProduct")

//Fix lỗi form có chứa enctype="multipart/form-data"
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)

public class SaveAddProduct extends HttpServlet {

    private static final long serialVersionID = 1L;
    private ServletFileUpload uploader = null;
    public static String productPath = "product";

    @Override
    public void init() throws ServletException {
        DiskFileItemFactory fileFactory = new DiskFileItemFactory();
        File fileDir = (File) getServletContext().getAttribute("FILES_DIR_FILE");
        fileFactory.setRepository(fileDir);
        this.uploader = new ServletFileUpload(fileFactory);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Product productDetail = new Product();
        String id=DaoProductAdmin.getInstance().getAutoIncrement();
        int countNewImg = 0;
        int countImg=0;
        int countColor=0;
        try {
            List<FileItem> fileItemList = uploader.parseRequest(request);
            Iterator<FileItem> fileItemIterator = fileItemList.iterator();
            while (fileItemIterator.hasNext()) {
                FileItem item = fileItemIterator.next();
                if (item.getFieldName().equals("price")) {
                    try {
                        double num = (Double.parseDouble(item.getString()));
                        if (num < 0)
                            request.setAttribute("expPrice", "Price must be a positive numbers");
                        else
                            productDetail.setPrice(num);
                    } catch (NumberFormatException e) {
                        request.setAttribute("expPrice", "Price must be a number");
                    }
                }
                if (item.getFieldName().equals("sale-rate")) {
                    try {
                        double num = (Double.parseDouble(item.getString()));
                        if (num < 0)
                            request.setAttribute("expSaleRate", "Sale rate must be a positive numbers");
                        productDetail.setSaleRate(num);
                    } catch (NumberFormatException e) {
                        request.setAttribute("expSaleRate", "Sale rate must be a number");
                    }
                }
                if (item.getFieldName().equals("name"))
                    productDetail.setName(item.getString());
                if (item.getFieldName().equals("brand")) {
                    String brand = item.getString();
                    List<String>brands = DaoProductAdmin.getInstance().getListBrand();
                    if (!brands.contains(brand)) {
                        DaoProductAdmin.getInstance().saveNewBrand(brand);
                    }
                    productDetail.setBrand(brand);
                }
                if (item.getFieldName().equals("description"))
                    productDetail.setDescription(item.getString());
                productDetail.setCreate_at(new Date().getYear()+"/" +new Date().getMonth()+"/"+new Date().getDay());
                productDetail.setUpdate_at(new Date().getYear()+"/" +new Date().getMonth()+"/"+new Date().getDay());
                productDetail.setListImg(new ArrayList<Image>());
            }

            DaoProductAdmin.getInstance().addProduct(productDetail);
            productDetail.setId(id);
            request.setAttribute("productDetail", productDetail);
            request.getRequestDispatcher("EditProduct.jsp?id="+id).forward(request, response);
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private File saveImage(HttpServletRequest request, String name) {
        File productDir = new File(request.getServletContext().getAttribute("FILES_DIR") + File.separator + productPath);
        if (!productDir.exists()) {
            productDir.mkdirs();
        }

        File file = new File(productDir.getAbsolutePath() + File.separator + name);
        if (file.exists()) {
            file.delete();
        }
        return file;
    }


}

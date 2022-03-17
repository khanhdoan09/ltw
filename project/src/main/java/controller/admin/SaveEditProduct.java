package controller.admin;

import model.Admin.DaoProductAdmin;
import model.DaoProduct;
import model.Image;
import model.Product;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

@WebServlet(name = "SaveEditProduct", value = "/SaveEditProduct")

//Fix lỗi form có chứa enctype="multipart/form-data"
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class SaveEditProduct extends HttpServlet {

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

        Product productDetail = null;
        String id="";
        int countDetail = 0;
        int countNewImg = 0;
        int countImg=0;
        int countColor=0;
        String currentNewColor="";
        try {
            List<FileItem> fileItemList = uploader.parseRequest(request);
            Iterator<FileItem> fileItemIterator = fileItemList.iterator();
            while (fileItemIterator.hasNext()) {
                FileItem item = fileItemIterator.next();
                if (item.getFieldName().equals("id")) {
                    id = item.getString();
                    System.out.println(id);
                    productDetail = DaoProductAdmin.getInstance().getDetailProduct(item.getString());
                    if( productDetail.getListImg()!=null)
                        countNewImg = productDetail.getListImg().size();

                }

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
                if (item.getFieldName().equals("description"))
                    productDetail.setDescription(item.getString());
                if (item.getFieldName().equals("sold")) {
                    try {
                        productDetail.setSoleValue(Integer.parseInt(item.getString()));
                    } catch (NumberFormatException e) {
                        request.setAttribute("expSaleRate", "Sale rate must be a number");
                    }
                }
                if (item.getFieldName().equals("total-quantity")) {
                    try {
                        productDetail.setQuantity(Integer.parseInt(item.getString()));
                    } catch (NumberFormatException e) {
                        request.setAttribute("totalQuantity", "Total quantity must be a number");
                    }
                }
                if(item.getFieldName().equals("gender")) {
                    String[] arr = productDetail.getCategory().split("\\s+");
                    productDetail.setCategory(arr[0] + " " +item.getString());
                }
                if(item.getFieldName().equals("category")) {
                    String[] arr = productDetail.getCategory().split("\\s+");
                    productDetail.setCategory(item.getString() + " " + arr[1]);
                }
                if (item.getFieldName().equals("color")){
                    if(productDetail.getListImg().get(countColor).getLelvel()==0) {
                        String colorOld = productDetail.getListImg().get(countColor).getColor();
                        String colorNew = item.getString();
                        DaoProductAdmin.getInstance().editColor(productDetail.getId(), colorNew, colorOld);
                        countColor++;
                    }
                }

                if (item.getFieldName().equals("fileImg")) {
                   if (item.getSize()==0) {
                       countImg++;
                       continue;
                   }
                    String nameImg = productDetail.getListImg().get(countImg).getImg() + ".jpg";
                    System.out.println(nameImg);
                    File file = saveImage(request, nameImg);
                   item.write(file);
                    countImg++;
                }
                if (item.getFieldName().contains("fileNewImg")) {
                    if (item.getSize()==0) {
                        continue;
                    }
                    String color = item.getFieldName().substring(item.getFieldName().indexOf("_")+1);
                    countNewImg++;
                    String nameImg = id+"_"+countNewImg;
                    System.out.println(nameImg);
                    File file = saveImage(request, nameImg + ".jpg");
                    item.write(file);
                    DaoProductAdmin.getInstance().saveImg(productDetail.getId(),nameImg,1, color);
                    productDetail.getListImg().add(new Image(nameImg,1,color));
                }
            }

            DaoProductAdmin.getInstance().editProduct(id, productDetail);
            request.setAttribute("productDetail", productDetail);
            request.getRequestDispatcher("EditProduct.jsp").forward(request, response);
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

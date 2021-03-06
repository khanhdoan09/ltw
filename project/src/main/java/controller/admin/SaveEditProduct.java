package controller.admin;

import beans.Image;
import dao.product.DaoProductAdmin;
import dao.product.brand.DaoProductBrand;
import dao.product.color.DaoProductColor;
import dao.product.detail.DaoProductDetail;
import dao.product.image.DaoProductImage;
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
                    productDetail = DaoProductDetail.getInstance().getDetailProduct(item.getString());
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
//                if (item.getFieldName().equals("brand")) {
//                    String brand = item.getString();
//                    List<String>brands = DaoProductBrand.getInstance().getListBrand();
//                    if (!brands.contains(brand)) {
//                        DaoProductBrand.getInstance().saveNewBrand(brand);
//                    }
//                    productDetail.setBrand(brand);
//                }
                if (item.getFieldName().equals("chooseMainImage"))
                    System.out.println(item.getString());
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
                        DaoProductColor.getInstance().editColor(productDetail.getId(), colorNew, colorOld);
                        countColor++;
                    }
                }
                if (item.getFieldName().contains("chooseMainImage_")) {
                    System.out.println(item.getString());
                    String[] data = item.getString().split("@");
                    System.out.println(data.length + " "  +data[0]);
                    if (data.length>1)
                    DaoProductImage.getInstance().changeLevelImg(data[0], data[1], id);
                }
                if (item.getFieldName().equals("chooseMainColor")) {
                    DaoProductColor.getInstance().saveMainColor(id, item.getString());
                }
                if (item.getFieldName().equals("active")) {
                    System.out.print(item.getString());
                    DaoProductAdmin.getInstance().saveActive(id, item.getString());
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
                    String[] data = item.getFieldName().split("_");
                    System.out.println("test: "+item.getFieldName());
                    String color = data[1];
                    countNewImg++;
                    String nameImg = id+"_"+countNewImg;
                    System.out.println(nameImg);
                    File file = saveImage(request, nameImg + ".jpg");
                    item.write(file);
                    DaoProductImage.getInstance().saveImg(productDetail.getId(),nameImg,1, color);
//                    productDetail.getListImg().add(new beans.Image(nameImg,1,color));

                    if (data.length>2) {
                        if(data[2].equals("checked")){
                            DaoProductImage.getInstance().changeLevelImg(nameImg, color, id);
                        }
                    }

                }
            }

            DaoProductAdmin.getInstance().editProduct(id, productDetail);

            request.setAttribute("productDetail", DaoProductDetail.getInstance().getDetailProduct(id));
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

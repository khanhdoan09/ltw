package controller.admin;

import model.Admin.DaoProductAdmin;
import model.Product;
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

@WebServlet(name = "AddImgProduct", value = "/AddImgProduct")
//Fix lỗi form có chứa enctype="multipart/form-data"
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class AddImgProduct extends HttpServlet {
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
        try {
            System.out.println(3465);
            List<FileItem> fileItemList = uploader.parseRequest(request);
            Iterator<FileItem> fileItemIterator = fileItemList.iterator();
            while (fileItemIterator.hasNext()) {
                FileItem item = fileItemIterator.next();
                System.out.println(item.getFieldName());
                if (item.getFieldName().equals("id")) {
                    id = item.getString();
                    productDetail = DaoProductAdmin.getInstance().getDetailProduct(item.getString());
                }
                if (item.getFieldName().equals("newfileimg")) {
                    if (item.getSize()==0) {
                        System.out.println(132);
                        continue;
                    }
                    String nameImg =id+ productDetail.getListImg().size() + 1 +  ".jpg";
                    System.out.println(nameImg);
                    File file = saveImage(request, nameImg);
                    item.write(file);
                }
            }
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
                response.getWriter().write("ok");

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
        System.out.println(file.getAbsolutePath());
        if (file.exists()) {
            file.delete();
        }
        return file;
    }


}

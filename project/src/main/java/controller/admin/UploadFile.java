package controller.admin;

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
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

@WebServlet(name = "UploadFileServlet", value = "/UploadDownLoadFileServlet")
//Fix lỗi form có chứa enctype="multipart/form-data"
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class UploadFile extends HttpServlet {

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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        if (!ServletFileUpload.isMultipartContent(request)) {
//            throw new ServletException("Content type is not multipart/form-data");
//        }
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.write("<html><head></head><body>");
        try {
            List<FileItem> fileItemList = uploader.parseRequest(request);
            Iterator<FileItem> fileItemIterator = fileItemList.iterator();
            while(fileItemIterator.hasNext()) {
                FileItem fileItem = fileItemIterator.next();
                System.out.println("FileName: " + fileItem.getFieldName());
                System.out.println(fileItem.getName());
                System.out.println(fileItem.getString());
                System.out.println(fileItem.getSize());


                if(fileItem.getFieldName().equals("fileImg")) {
                    System.out.println("FileName: " + fileItem.getName());
                    System.out.println("ContentType: " + fileItem.getContentType());
                    System.out.println("Size in bytes: " + fileItem.getSize());

                    File productDir = new File(request.getServletContext().getAttribute("FILES_DIR") + File.separator + productPath);
                    if (!productDir.exists()) {
                        productDir.mkdirs();
                    }

                    File file = new File(productDir.getAbsolutePath() + File.separator + fileItem.getName());
                    if (file.exists()) {
                        file = new File(productDir.getAbsolutePath() + File.separator + System.currentTimeMillis()+"-"+fileItem.getName());
                    }


                    System.out.println("Absolute Path at server: " + file.getAbsolutePath());
                    fileItem.write(file);
                    out.write("path: " + file.getAbsolutePath() +"<br>");
                    out.write("file: " + fileItem.getName() + " uploaded successfully");
                    out.write("<br>");
                    out.println(File.separator);
                    out.write("<a href=\"UploadDownLoadFileServlet?fileName:>" + fileItem.getName() + "\">Download " + fileItem.getName() + "</a>");
                    out.write("<br>");
                    out.println(File.separator);
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
            out.write("Exception in uploading file");
        } catch (Exception e) {
            e.printStackTrace();
        }
        out.write("<img src=\""+System.getProperty("catalina.home")+"/webapps/upload/product/1021A337.001_C_0001_d.jpg\" >");

        String d = request.getParameter("price");
        out.write(d + " 23");
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String parameterName = parameterNames.nextElement();
            String value = request.getParameter(parameterName);
            System.out.println("parameter name is " + parameterName);
            out.println("Parameter name is  <b>" + parameterName + "</b>  value is <b> " + value + "</b><br/>");
        }

           // request.getRequestDispatcher("EditProduct.jsp").forward(request, response);
    }
}

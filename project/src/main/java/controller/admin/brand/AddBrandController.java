package controller.admin.brand;

import dao.product.brand.DaoProductBrand;
import service.admin.BrandAdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
@MultipartConfig(fileSizeThreshold=1024*1024*2,// 2MB
        maxFileSize=1024*1024*10,// 10MB
        maxRequestSize=1024*1024*50)// 50MB
// Annotation MultipartConfig: A servlet can be annotated with this annotation in order to handle multipart/form-data requests which contain file upload data. The MultipartConfig annotation has the following options:
//fileSizeThreshold: file’s size that is greater than this threshold will be directly written to disk, instead of saving inmemory.
//location: directory where file will be stored via Part.write() method.
//maxFileSize: maximum size for a single upload file.
//maxRequestSize: maximum size for a request.
//All sizes are measured in bytes.
@WebServlet(name = "AddBrandController", value = "/AddBrandAdminController")
public class AddBrandController extends HttpServlet {
    private static final String SAVE_DIR = "upload\\brand";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameBrand = request.getParameter("nameBrand");
        saveImageToFolder(nameBrand, request);
        request.getRequestDispatcher("/GetBrandAdminController").forward(request, response);
    }
    private void saveImageToFolder(String nameBrand, HttpServletRequest request) throws ServletException, IOException {
        String appPath = getServletContext().getRealPath("");
        String savePath = appPath  + SAVE_DIR;
        BrandAdminService brandAdminService = new BrandAdminService();
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            if(fileName!="") {
                brandAdminService.saveANewBrand(nameBrand, fileName);
                part.write(savePath + "\\"+fileName);
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

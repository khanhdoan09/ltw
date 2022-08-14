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
@WebServlet(name = "UpdateBrandController", value = "/UpdateBrandAdminController")
public class UpdateBrandController extends HttpServlet {
    private static final String SAVE_DIR = "upload\\brand";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idBrand = request.getParameter("idBrand");
        String nameBrand = request.getParameter("nameBrand");
        BrandAdminService brandAdminService = new BrandAdminService();
        brandAdminService.updateNewNameBrand(idBrand, nameBrand);
        saveImageToFolder(idBrand, request);
        response.sendRedirect("GetBrandAdminController");
    }

    private void saveImageToFolder(String idBrand, HttpServletRequest request) throws ServletException, IOException {
        String appPath = getServletContext().getRealPath("");
        String savePath = appPath  + SAVE_DIR;

        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            if(fileName!="") {
                System.out.println(savePath + "\\"+idBrand+"_"+fileName);
                DaoProductBrand.getInstance().updateUrlBrand(idBrand, fileName);
                part.write(savePath + "\\"+idBrand+"_"+fileName);
            }
        }
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                System.out.println(s);
                String nameImg = s.substring(s.indexOf("=") + 2, s.length()-1);
                return nameImg;
            }
        }
        return "";
    }

}

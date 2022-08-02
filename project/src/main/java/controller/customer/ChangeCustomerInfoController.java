package controller.customer;

import beans.User;
import dao.product.brand.DaoProductBrand;
import dao.user.DaoCustomer;
import service.customer.personal.PersonalCustomerService;

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
@WebServlet(name = "ChangeCustomerInfoController", value = "/changeCustomerInfoController")
public class ChangeCustomerInfoController extends HttpServlet {
    private static final String SAVE_DIR = "upload\\customer";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("userId");
        if(obj == null) {
            request.getRequestDispatcher("./views.customer/index.jsp").forward(request, response);
            return;
        }
        String idCustomer = (String) obj;
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String day = request.getParameter("day");
        String month = request.getParameter("month");
        String year = request.getParameter("year");
        String dob = day+"/"+month+"/"+year+"";
        PersonalCustomerService personalCustomerService = new PersonalCustomerService();
        boolean isChanged = personalCustomerService.updateInfo(idCustomer, name, email, phone, gender, dob);
        saveImageToFolder(idCustomer, request);
        if (isChanged) {
            User customer = personalCustomerService.getUser(idCustomer);
            request.setAttribute("customer", customer);
            request.getRequestDispatcher("customer").forward(request, response);
        }
    }

    private void saveImageToFolder(String idCustomer, HttpServletRequest request) throws ServletException, IOException {
        String appPath = getServletContext().getRealPath("");
        String savePath = appPath  + SAVE_DIR;

        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            if(fileName!="") {
                String avatar = idCustomer+"_"+fileName;
                DaoCustomer.getInstance().updateUrlAvatar(idCustomer, fileName);
                part.write(savePath + "\\"+avatar);
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

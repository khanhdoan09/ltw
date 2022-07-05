package controller.admin.category;

import service.admin.CategoryAdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SaveCategory", value = "/SaveCategoryAdmin")
public class SaveCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("nameCategory");
        String gender = request.getParameter("gender");
        CategoryAdminService categoryAdminService = new CategoryAdminService();
        boolean re = categoryAdminService.addCategory(name, gender);
        response.sendRedirect ("GetCategoryAdmin");
    }
}

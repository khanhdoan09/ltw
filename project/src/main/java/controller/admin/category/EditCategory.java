package controller.admin.category;

import service.admin.CategoryAdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditCategory", value = "/EditCategoryAdmin")
public class EditCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        System.out.println(id);
        String name = request.getParameter("nameCategory");
        System.out.println(name);
        String gender = request.getParameter("gender");
        System.out.println(gender);
        CategoryAdminService categoryAdminService = new CategoryAdminService();
        categoryAdminService.editCategory(id, name, gender);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

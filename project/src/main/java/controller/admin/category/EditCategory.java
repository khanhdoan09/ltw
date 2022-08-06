package controller.admin.category;

import service.admin.CategoryAdminService;
import beans.Category;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EditCategory", value = "/EditCategoryAdmin")
public class EditCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("nameCategory");
        String gender = request.getParameter("gender");
        CategoryAdminService categoryAdminService = new CategoryAdminService();
        categoryAdminService.editCategory(id, name, gender);
        List<Category> category = categoryAdminService.getListCategory();
        request.setAttribute ("category", category);
        request.getRequestDispatcher("/views/admin/crud/category/category.jsp").forward (request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

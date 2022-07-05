package controller.admin.category;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import service.admin.CategoryAdminService;
import beans.Category;
import java.util.List;

@WebServlet(name = "GetCategory", value = "/GetCategoryAdmin")
public class GetCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryAdminService categoryAdminService = new CategoryAdminService();
        List<Category> category = categoryAdminService.getListCategory();
        request.setAttribute ("category", category);
        request.getRequestDispatcher("/views/admin/crud/category/category.jsp").forward (request,response);
    }
}

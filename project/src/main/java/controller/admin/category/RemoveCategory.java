package controller.admin.category;

import service.admin.CategoryAdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RemoveCategory", value = "/RemoveCategoryAdmin")
public class RemoveCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idCategory = request.getParameter("id");
        CategoryAdminService categoryAdminService = new CategoryAdminService();
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        boolean re = categoryAdminService.removeCategory(idCategory);
        if (re) {
            response.getWriter().write("ok");
        }
        else {
            response.getWriter().write("error");
        }
    }
}

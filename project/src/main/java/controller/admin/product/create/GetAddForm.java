package controller.admin.product.create;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

import service.admin.CategoryAdminService;
import service.admin.BrandAdminService;
import beans.Category;
import beans.Brand;

@WebServlet(name = "GetAddForm", value = "/GetAddFormAdmin")
public class GetAddForm extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryAdminService categoryAdminService  = new CategoryAdminService();
        BrandAdminService brandAdminService = new BrandAdminService();
        List<Category> category = categoryAdminService.getListCategory();
        List<Brand> brand = brandAdminService.getBrands();

        request.setAttribute("categories", category);
        request.setAttribute("brands", brand);
        request.getRequestDispatcher("/views/admin/crud/product/addProduct.jsp").forward(request, response);
    }
}

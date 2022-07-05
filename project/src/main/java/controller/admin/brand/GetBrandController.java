package controller.admin.brand;

import beans.Brand;
import dao.product.brand.DaoProductBrand;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import service.admin.BrandAdminService;

@WebServlet(name = "GetBrandController", value = "/GetBrandAdminController")
public class GetBrandController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BrandAdminService brandAdminService = new BrandAdminService();
        ArrayList<Brand> listBrand = brandAdminService.getBrands();
        request.setAttribute("listBrand", listBrand);
        request.getRequestDispatcher("/views/admin/crud/brand/brand.jsp").forward(request, response);
    }
}

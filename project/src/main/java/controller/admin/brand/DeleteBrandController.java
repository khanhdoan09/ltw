package controller.admin.brand;

import dao.product.brand.DaoProductBrand;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteBrandController", value = "/DeleteBrandAdminController")
public class DeleteBrandController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idBrand = request.getParameter("idBrand");
        System.out.println(idBrand);
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        if (DaoProductBrand.getInstance().deleteBrand(idBrand)) {
            response.getWriter().write("ok");
        }
        else {
            response.getWriter().write("error");
        }
    }
}

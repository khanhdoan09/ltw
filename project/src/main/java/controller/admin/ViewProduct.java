package controller.admin;

import model.Admin.DaoProductAdmin;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ViewProduct", value = "/ViewProduct")
public class ViewProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Product productDetail = DaoProductAdmin.getInstance().getDetailProduct(id);
        request.setAttribute("productDetail", productDetail);
        request.getRequestDispatcher("view-product.jsp").forward(request, response);
    }
}

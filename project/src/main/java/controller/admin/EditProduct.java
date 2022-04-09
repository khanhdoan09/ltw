package controller.admin;

import model.Admin.DaoProductAdmin;
import model.DaoProduct;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditProduct", value = "/EditProduct")
public class EditProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Product productDetail = DaoProductAdmin.getInstance().getDetailProduct(id);
        request.setAttribute("productDetail", productDetail);
//        request.getRequestDispatcher("EditProduct.jsp").forward(request, response);
        request.getRequestDispatcher("/views/admin/crud/product/EditProduct.jsp").forward(request, response);

    }
}

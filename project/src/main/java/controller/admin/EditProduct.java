package controller.admin;

import model.Admin.DaoProductAdmin;
import bean.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

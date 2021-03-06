package controller.admin.product;

import beans.Product;
import dao.product.DaoProductAdmin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddNewProduct", value = "/AddNewProduct")
public class AddNewProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String brand = request.getParameter("brand");
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int sale = Integer.parseInt(request.getParameter("sale"));
        String date = request.getParameter("date");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        Product product = new Product(price, sale, brand, name, date, description, category);
        int id = DaoProductAdmin.getInstance().addNewProduct(product);
        request.getRequestDispatcher("/ProductDetailAdmin?id="+id).forward(request, response);
    }
}

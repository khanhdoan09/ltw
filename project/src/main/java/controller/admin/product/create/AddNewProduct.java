package controller.admin.product.create;

import beans.Product;
import dao.product.DaoProductAdmin;
import service.admin.ProductAdminService;

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
        Product newProduct = new Product(price, sale, brand, name, date, description, category);
        ProductAdminService productAdminService = new ProductAdminService();
        int id = productAdminService.addProduct(newProduct);

        Product product = productAdminService.getDetailProduct(String.valueOf(id));
        request.setAttribute("productDetail", product);
        request.getRequestDispatcher("/views/admin/crud/product/editProduct.jsp").forward(request, response);
    }
}

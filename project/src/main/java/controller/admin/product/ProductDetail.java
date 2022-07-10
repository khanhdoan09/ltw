package controller.admin.product;

import dao.product.detail.DaoProductDetail;
import beans.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EditProduct", value = "/ProductDetailAdmin")
public class ProductDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Product product = DaoProductDetail.getInstance().getDetailProduct(id);
        request.setAttribute("productDetail", product);
        request.getRequestDispatcher("/views/admin/crud/product/EditProduct.jsp").forward(request, response);
//        request.getRequestDispatcher("/views/admin/crud/product/productDetail.jsp").forward(request, response);

    }
}

package controller.admin.product;

import dao.product.detail.DaoProductDetail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ViewDetailProduct", value = "/ViewDetailProductAdmin")
public class ViewDetailProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        request.setAttribute("productDetail", DaoProductDetail.getInstance().getDetailProduct(id));
        request.getRequestDispatcher("/views/admin/crud/product/viewProduct.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

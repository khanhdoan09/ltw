package controller;

import model.DaoProduct;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryRoute", value = "/CategoryRoute")
public class CategoryRoute extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryGender = request.getParameter("categoryGender");
        request.setAttribute("categoryGender", categoryGender);

        String category = request.getParameter("category");
        if (category != null) {
//            List<Product> list = DaoProduct.getInstance().getProductByCategory("description", null, 1);
//
//            request.setAttribute("category", category);
//            request.setAttribute("categoryProduct", list);
//            DaoProduct.getInstance().currentCategory = category + " " + categoryGender;
        }
        request.getRequestDispatcher("category.jsp").forward(request, response);
    }
}

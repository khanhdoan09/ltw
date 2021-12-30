package controller;

import model.DaoProduct;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServletTest123", value = "/ServletTest123")
public class ServletTest123 extends HttpServlet {
    private int pagination = 1;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String a = request.getParameter("category");
        Object b = request.getParameter("categoryGender");
        String pag = request.getParameter("pagination");
        if (pag != null) {
            pagination = Integer.parseInt(pag);
        }

        String category = a;
        System.out.println(category);
        List<Product> listFilter = new ArrayList<Product>();
        String folderImage = "";
        int totalNumberProduct = 0;

        String[] brand = request.getParameterValues("brand");
        if (brand != null) {
            listFilter = DaoProduct.getInstance().getProductByCategory("description", brand[0], pagination);
            totalNumberProduct = DaoProduct.getInstance().getTotalNumberProduct("brand", a);
            category = brand[0];
            System.out.println(listFilter.size());
        }

        request.setAttribute("TotalNumberProduct", totalNumberProduct);
        request.setAttribute("Category", category);
        request.setAttribute("Pagination", pagination);
        request.setAttribute("folderImage", folderImage);
        request.setAttribute("categoryProduct", listFilter);
        request.setAttribute("category", a);
        request.setAttribute("categoryGender", b);

        request .getRequestDispatcher("category.jsp").forward(request, response);

    }

}
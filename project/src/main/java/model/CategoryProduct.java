package model;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoryProduct", value = "/CategoryProduct")
public class CategoryProduct extends HttpServlet {
    private int pagination = 1;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String a = request.getParameter("category");
        String b = request.getParameter("categoryGender");


        String pag = request.getParameter("pagination");
        if (pag != null) {
            pagination = Integer.parseInt(pag);
        }

            String category = a +" "+ b;
            System.out.println(category);
            List<Product> listFilter = new ArrayList<Product>();
            String folderImage = "";
            if (b == null) { // bang null la khong co gioi tinh co nghia la tim theo brand navigation
                listFilter = DaoProduct.getInstance().getProductByBrandOnNavigation(a);
            }
            else {
                listFilter = DaoProduct.getInstance().getProductByCategory(category, pagination);
                DaoProduct.getInstance().currentCategory = category;
        }

        int totalNumberProduct = DaoProduct.getInstance().getTotalNumberProduct("description", category);
        request.setAttribute("TotalNumberProduct", totalNumberProduct);
        request.setAttribute("Category", category);
        request.setAttribute("Pagination", pagination);
        request.setAttribute("folderImage",folderImage);
        request.setAttribute("categoryProduct", listFilter);

        request.setAttribute("category", a);
        request.setAttribute("categoryGender", b);

        request.getRequestDispatcher("category.jsp").forward(request, response);
    }

}
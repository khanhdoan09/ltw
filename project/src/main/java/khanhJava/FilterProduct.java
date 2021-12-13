package khanhJava;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "FilterProduct", value = "/FilterProduct")
public class FilterProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   /*     String[] brands = request.getParameterValues("filterBrand");
        ArrayList<Product> listFilterBrand = new ArrayList<Product>();
        DaoProduct.getInstance().getFilterList(listFilterBrand, brands);
        request.setAttribute("filterBrand", listFilterBrand);
        */
//        String[] stars = request.getParameterValues("filter-star-rate");
        ArrayList<Product> listFilter = new ArrayList<Product>();
        listFilter = DaoProduct.getInstance().getFilterList(request);
        request.setAttribute("filter", listFilter);
        request.getRequestDispatcher("category.jsp").forward(request, response);
    }
}
package controller;

import model.DaoProduct;
import beans.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductDetail", value = "/ProductDetail")
public class ProductDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProduct = request.getParameter("idProduct");
        List<Product> listHotProduct = DaoProduct.getInstance().getListHotProduct(idProduct);
        request.setAttribute("listHotProduct", listHotProduct);
        System.out.println(listHotProduct.size()+"~");

        request.setAttribute("idProduct", idProduct);
        request.getRequestDispatcher("views.customer/product.jsp").forward(request, response);

        // product was watched
        HttpSession session = request.getSession(true);
        ArrayList<String> listProductWatched = (ArrayList<String>) session.getAttribute("listProductWatched");
        if (listProductWatched == null) {
            listProductWatched = new ArrayList<String>();
            session.setAttribute("listProductWatched", listProductWatched);
        }
        if (!listProductWatched.contains(idProduct))
            listProductWatched.add(idProduct);
    }
}